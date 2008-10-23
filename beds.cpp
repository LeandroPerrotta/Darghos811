//////////////////////////////////////////////////////////////////////
// OpenTibia - an opensource roleplaying game
//////////////////////////////////////////////////////////////////////
// Beds
//////////////////////////////////////////////////////////////////////
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software Foundation,
// Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
//////////////////////////////////////////////////////////////////////
#include "otpch.h"

#include "beds.h"

#include "house.h"
#include "iologindata.h"
#include "game.h"
#include "player.h"

extern Game g_game;

BedItem::BedItem(uint16_t _id) : Item(_id)
{
	house = NULL;
	partner = NULL;
	internalRemoveSleeper();
}

bool BedItem::readAttr(AttrTypes_t attr, PropStream& propStream)
{
	switch(attr)
	{
		case ATTR_SLEEPERGUID:
		{
			uint32_t _guid;
			if(!propStream.GET_ULONG(_guid))
				return false;

			if(_guid != 0)
			{
				std::string name;
				if(!IOLoginData::getInstance()->getNameByGuid(_guid, name))
					return false;

				setSpecialDescription(name + " is sleeping there.");

				// update the BedSleepersMap
				Beds::getInstance().setBedSleeper(this, _guid);
			}

			sleeperGUID = _guid;
			return true;
			break;
		}

		case ATTR_SLEEPSTART:
		{
			uint32_t sleep_start;
			if(!propStream.GET_ULONG(sleep_start))
				return false;

			sleepStart = (uint64_t)sleep_start;
			return true;
			break;
		}

		default:
			break;
	}
	return Item::readAttr(attr, propStream);
}

bool BedItem::serializeAttr(PropWriteStream& propWriteStream)
{
	if(sleeperGUID != 0)
	{
		propWriteStream.ADD_UCHAR(ATTR_SLEEPERGUID);
		propWriteStream.ADD_ULONG(sleeperGUID);
	}

	if(sleepStart != 0)
	{
		propWriteStream.ADD_UCHAR(ATTR_SLEEPSTART);
		propWriteStream.ADD_ULONG((int32_t)sleepStart);
	}
	return true;
}

bool BedItem::findPartner()
{
	Direction dir = Item::items[getID()].bedPartnerDir;
	Position targetPos = getNextPosition(dir, getPosition());

	Tile* tile = g_game.getMap()->getTile(targetPos);
	if((tile != NULL))
	{
		partner = tile->getBedItem();

		if((partner != NULL) && (partner->partner == NULL))
			partner->findPartner();
		
		return (partner != NULL);
	}
	return false;
}

bool BedItem::canUse(Player* player)
{
	if((player == NULL) || (house == NULL))
		return false;

	if(player->hasCondition(CONDITION_INFIGHT))
		return false;

	if(partner == NULL)
		return findPartner();

	return player->isPremium();
}

void BedItem::sleep(Player* player)
{
	// avoid crashes
	if((house == NULL) || (partner == NULL))
		return;

	if((player == NULL) || player->isRemoved())
		return;

	if(Item::items[getID()].transformToFree != 100)
	{
		if(house->getHouseOwner() == player->getGUID())
			wakeUp(NULL);

		g_game.addMagicEffect(player->getPosition(), NM_ME_POFF);
	}
	else
	{
		internalSetSleeper(player);
		partner->internalSetSleeper(player);

		// update the BedSleepersMap
		Beds::getInstance().setBedSleeper(this, player->getGUID());

		// make the player walk onto the bed
		player->getTile()->moveCreature(player, getTile());

		// display 'Zzzz'/sleep effect
		g_game.addMagicEffect(player->getPosition(), NM_ME_SLEEP);

		// kick player after he sees himself walk onto the bed and it change id
		uint32_t playerId = player->getID();
		Scheduler::getScheduler().addEvent(createSchedulerTask(250, boost::bind(&Game::kickPlayer, &g_game, playerId, false)));

		// change self and partner's appearance
		updateAppearance(player);
		partner->updateAppearance(player);
	}
}

void BedItem::wakeUp(Player* player)
{
	// avoid crashes
	if((house == NULL) || (partner == NULL))
		return;

	if(sleeperGUID != 0)
	{
		if((player == NULL))
		{
			std::string name;
			bool ret = IOLoginData::getInstance()->getNameByGuid(sleeperGUID, name);
			if(ret)
			{
				player = new Player(name, NULL);
				ret = IOLoginData::getInstance()->loadPlayer(player, name, false);
				if(ret)
				{
					regeneratePlayer(player);
					IOLoginData::getInstance()->savePlayer(player, true);
				}
				player->releaseThing2();
			}
		}
		else
		{
			regeneratePlayer(player);
			g_game.addCreatureHealth(player);
		}
	}

	// update the BedSleepersMap
	Beds::getInstance().setBedSleeper(NULL, sleeperGUID);

	// unset sleep info
	internalRemoveSleeper();
	partner->internalRemoveSleeper();

	// change self and partner's appearance
	updateAppearance(NULL);
	partner->updateAppearance(NULL);
}

void BedItem::regeneratePlayer(Player* player) const
{
	int32_t sleptTime = int32_t(time(NULL) - sleepStart);

	Condition* condition = player->getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT);
	if(condition)
	{
		int32_t regen = 0;
		if(condition->getTicks() != -1)
		{
			regen = std::min((condition->getTicks()/1000), sleptTime) / 30;
			int32_t newRegenTicks = condition->getTicks() - (regen * 30000);
			if(newRegenTicks <= 0)
			{
				player->removeCondition(condition);
				condition = NULL;
			}
			else
				condition->setTicks(newRegenTicks);
		}
		else
			regen = sleptTime / 30;

		player->changeHealth(regen);
		player->changeMana(regen);
	}

	int32_t soulRegen = (int32_t)std::max((float)0, ((float)sleptTime/(60*15)));
	player->changeSoul(soulRegen);
}

void BedItem::updateAppearance(const Player* player)
{
	const ItemType& it = Item::items[getID()];
	if(player)
		g_game.transformItem(this, it.transformToOnUse[player->getSex()]);
	else
		g_game.transformItem(this, it.transformToFree);
}

void BedItem::internalSetSleeper(const Player* player)
{
	std::string desc_str = player->getName() + " is sleeping there.";

	setSleeper(player->getGUID());
	setSleepStart(time(NULL));
	setSpecialDescription(desc_str);
}

void BedItem::internalRemoveSleeper()
{
	setSleeper(0);
	setSleepStart(0);
	setSpecialDescription("Nobody is sleeping there.");
}

Beds& Beds::getInstance()
{
	static Beds instance;
	return instance;
}

BedItem* Beds::getBedBySleeper(uint32_t guid)
{
	std::map<uint32_t, BedItem*>::iterator it = BedSleepersMap.find(guid);
	if(it != BedSleepersMap.end())
		return it->second;

	return NULL;
}

void Beds::setBedSleeper(BedItem* bed, uint32_t guid)
{
	BedSleepersMap[guid] = bed;
}
