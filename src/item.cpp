//////////////////////////////////////////////////////////////////////
// OpenTibia - an opensource roleplaying game
//////////////////////////////////////////////////////////////////////
// Represents an item
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

#include "definitions.h"
#include "item.h"
#include "container.h"
#include "depot.h"
#include "teleport.h"
#include "trashholder.h"
#include "mailbox.h"
#include "house.h"
#include "game.h"
#include "luascript.h"
#include "configmanager.h"
#include "weapons.h"
#include "beds.h"

#include "actions.h"
#include "combat.h"

#include <iostream>
#include <iomanip>

extern Game g_game;
extern ConfigManager g_config;
extern Weapons* g_weapons;

Items Item::items;

Item* Item::CreateItem(const uint16_t _type, uint16_t _count /*= 1*/)
{
	Item* newItem = NULL;

	const ItemType& it = Item::items[_type];

	if(it.group == ITEM_GROUP_DEPRECATED)
	{
		#ifdef __DEBUG__
		std::cout << "Error: [Item::CreateItem] Item id " << it.id << " has been declared deprecated."  << std::endl;
		#endif
		return NULL;
	}

	if(it.id != 0)
	{
		if(it.isDepot())
			newItem = new Depot(_type);
		else if(it.isContainer())
			newItem = new Container(_type);
		else if(it.isTeleport())
			newItem = new Teleport(_type);
		else if(it.isMagicField())
			newItem = new MagicField(_type);
		else if(it.isDoor())
			newItem = new Door(_type);
		else if(it.isTrashHolder())
			newItem = new TrashHolder(_type, it.magicEffect);
		else if(it.isMailbox())
			newItem = new Mailbox(_type);
		else if(it.isBed())
			newItem = new BedItem(_type);
		else if(it.id >= 2210 && it.id <= 2212)
			newItem = new Item(_type - 3, _count);
		else if(it.id == 2215 || it.id == 2216)
			newItem = new Item(_type - 2, _count);
		else if(it.id >= 2202 && it.id <= 2206)
			newItem = new Item(_type - 37, _count);
		else if(it.id == 2640)
			newItem = new Item(6132, _count);
		else if(it.id == 6301)
			newItem = new Item(6300, _count);
			//[ added for beds system
		else if(it.isBed()){
			newItem = new BedItem(_type);
		}
		else
			newItem = new Item(_type, _count);

		newItem->useThing2();
	}
	return newItem;
}

Item* Item::CreateItem(PropStream& propStream)
{
	uint16_t _id;
	
	if(!propStream.GET_USHORT(_id)){
		return NULL;
	}

	const ItemType& iType = Item::items[_id];
	uint8_t _count = 0;

	if(iType.stackable || iType.isSplash() || iType.isFluidContainer())
	{
		if(!propStream.GET_UCHAR(_count))
			return NULL;
	}

	if(g_config.getString(ConfigManager::RANDOMIZE_TILES) == "yes")
	{
		if(_id == 352 || _id == 353)
			_id = 351;
		else if(_id >= 709 && _id <= 711)
			_id = 708;
		else if(_id >= 3154 && _id <= 3157)
			_id = 3153;
		else if(_id >= 4527 && _id <= 4541 || _id == 4756)
			_id = 4526;
		else if(_id >= 4609 && _id <= 4619)
			_id = 4608;
		else if(_id >= 4692 && _id <= 4701)
			_id = 4691;
		else if(_id >= 5711 && _id <= 5726)
			_id = 101;
		else if(_id >= 6580 && _id <= 6593)
			_id = 670;
		else if(_id >= 6683 && _id <= 6686)
			_id = 671;
		else if(_id >= 5406 && _id <= 5410)
			_id = 5405;
		else if(_id >= 6805 && _id <= 6809)
			_id = 6804;
		else if(_id >= 7063 && _id <= 7066)
			_id = 7062;

		if((bool)random_range(0, 1))
		{
			switch(_id)
			{
				case 101:
					_id = random_range(5711, 5726);
					break;
				case 351:
				case 708:
					_id += random_range(1, 3);
					break;
				case 3153:
				case 7062:
					_id += random_range(1, 4);
					break;
				case 670:
					_id = random_range(6580, 6593);
					break;
				case 671:
					_id = random_range(6683, 6686);
					break;
				case 4405:
				case 4422:
					_id += random_range(1, 16);
					break;
				case 4526:
					_id += random_range(1, 15);
					break;
				case 4608:
					_id += random_range(1, 11);
					break;
				case 4691:
					_id += random_range(1, 10);
					break;
				case 5405:
				case 6804:
					_id += random_range(1, 5);
					break;
			}
		}
	}

	return Item::CreateItem(_id, _count);
}

Item::Item(const uint16_t _type, uint16_t _count /*= 0*/) :
	ItemAttributes()
{
	id = _type;

	const ItemType& it = items[id];

	count = 1;
	charges = it.charges;
	fluid = 0;

	if(it.isFluidContainer() || it.isSplash())
		fluid = _count;
	else if(it.stackable && _count != 0)
		count = _count;
	else if(it.charges != 0 && _count != 0)
		charges = _count;

	loadedFromMap = false;
	setDefaultDuration();
}

Item::Item(const Item &i) :
	Thing(), ItemAttributes()
{
	//std::cout << "Item copy constructor " << this << std::endl;
	id = i.id;
	count = i.count;
	charges = i.charges;
	fluid = i.fluid;
	
	m_attributes = i.m_attributes;
	if(i.m_firstAttr)
		m_firstAttr = new Attribute(*i.m_firstAttr);
}

Item* Item::clone() const
{
	Item* _item = Item::CreateItem(id, count);
	_item->m_attributes = m_attributes;
	if(m_firstAttr)
		_item->m_firstAttr = new Attribute(*m_firstAttr);
	return _item;
}

Item::~Item()
{
	if(getUniqueId() != 0)
		ScriptEnviroment::removeUniqueThing(this);
}

void Item::setDefaultSubtype()
{
	const ItemType& it = items[id];

	count = 1;
	charges = it.charges;
	fluid = 0;
}

void Item::setID(uint16_t newid)
{
	const ItemType& prevIt = Item::items[id];
	id = newid;

	const ItemType& it = Item::items[newid];
	uint32_t newDuration = it.decayTime * 1000;

	if(newDuration == 0 && !it.stopTime && it.decayTo == -1)
	{
		removeAttribute(ATTR_ITEM_DECAYING);
		removeAttribute(ATTR_ITEM_DURATION);
	}

	if(newDuration > 0 && (!prevIt.stopTime || !hasAttribute(ATTR_ITEM_DURATION)))
	{
		setDecaying(DECAYING_FALSE);
		setDuration(newDuration);
	}
}

uint8_t Item::getItemCountOrSubtype() const
{
	const ItemType& it = items[getID()];

	if(it.isFluidContainer() || it.isSplash())
		return fluid;
	else if(it.charges != 0)
		return charges;
	else
		return count;
}

void Item::setItemCountOrSubtype(uint8_t n)
{
	const ItemType& it = items[id];
	if(it.isFluidContainer() || it.isSplash())
		fluid = n;
	else if(it.charges != 0)
		charges = n;
	else
		count = n;
}

bool Item::hasSubType() const
{
	const ItemType& it = items[id];
	return it.hasSubType();
}

uint8_t Item::getSubType() const
{
	const ItemType& it = items[getID()];

	if(it.isFluidContainer() || it.isSplash()){
		return fluid;
	}
	else if(it.charges != 0){
		return charges;
	}

	return 0;
}

bool Item::unserialize(xmlNodePtr nodeItem)
{
	int32_t intValue;
	std::string strValue;

	if(readXMLInteger(nodeItem, "id", intValue))
		id = intValue;
	else
		return false;

	if(readXMLInteger(nodeItem, "count", intValue))
		setItemCountOrSubtype(intValue);

	if(readXMLString(nodeItem, "special_description", strValue))
		setSpecialDescription(strValue);

	if(readXMLString(nodeItem, "text", strValue))
		setText(strValue);

	if(readXMLInteger(nodeItem, "written_date", intValue))
		setDate(intValue);

	if(readXMLString(nodeItem, "writer", strValue))
		setWriter(strValue);

	if(readXMLInteger(nodeItem, "actionId", intValue))
		setActionId(intValue);
			
	if(readXMLInteger(nodeItem, "uniqueId", intValue))
		setUniqueId(intValue);

	if(readXMLInteger(nodeItem, "duration", intValue))
		setDuration(intValue);

	if(readXMLInteger(nodeItem, "decayState", intValue))
	{
		ItemDecayState_t decayState = (ItemDecayState_t)intValue;
		if(decayState != DECAYING_FALSE)
			setDecaying(DECAYING_PENDING);
	}
	
	return true;
}

xmlNodePtr Item::serialize()
{
	xmlNodePtr nodeItem = xmlNewNode(NULL,(const xmlChar*)"item");
	// TODO: Replace stringstream with char
	std::stringstream ss;
	ss.str("");
	ss << getID();
	xmlSetProp(nodeItem, (const xmlChar*)"id", (const xmlChar*)ss.str().c_str());

	if(hasSubType())
	{
		ss.str("");
		ss << (int32_t)getItemCountOrSubtype();
		xmlSetProp(nodeItem, (const xmlChar*)"count", (const xmlChar*)ss.str().c_str());
	}

	if(getSpecialDescription() != "")
	{
		ss.str("");
		ss << getSpecialDescription();
		xmlSetProp(nodeItem, (const xmlChar*)"special_description", (const xmlChar*)ss.str().c_str());
	}

	if(getText() != "")
	{
		ss.str("");
		ss << getText();
		xmlSetProp(nodeItem, (const xmlChar*)"text", (const xmlChar*)ss.str().c_str());
	}
	
	if(getDate() != 0)
	{
		ss.str("");
		ss << getDate();
		xmlSetProp(nodeItem, (const xmlChar*)"written_date", (const xmlChar*)ss.str().c_str());
	}

	if(getWriter() != "")
	{
		ss.str("");
		ss << getWriter();
		xmlSetProp(nodeItem, (const xmlChar*)"writer", (const xmlChar*)ss.str().c_str());
	}

	if(!isNotMoveable() /*moveable*/)
	{
		if(getActionId() != 0)
		{
			ss.str("");
			ss << getActionId();
			xmlSetProp(nodeItem, (const xmlChar*)"actionId", (const xmlChar*)ss.str().c_str());
		}
	}
	
	if(hasAttribute(ATTR_ITEM_DURATION))
	{
		uint32_t duration = getDuration();
		ss.str("");
		ss << duration;
		xmlSetProp(nodeItem, (const xmlChar*)"duration", (const xmlChar*)ss.str().c_str());
	}

	uint32_t decayState = getDecaying();
	if(decayState == DECAYING_TRUE || decayState == DECAYING_PENDING)
	{
		ss.str("");
		ss << decayState;
		xmlSetProp(nodeItem, (const xmlChar*)"decayState", (const xmlChar*)ss.str().c_str());
	}
	return nodeItem;
}

bool Item::readAttr(AttrTypes_t attr, PropStream& propStream)
{
	switch(attr)
	{
		case ATTR_COUNT:
		{
			uint8_t _count = 0;
			if(!propStream.GET_UCHAR(_count)){
				return false;
			}

			setItemCountOrSubtype(_count);
			break;
		}

		case ATTR_ACTION_ID:
		{
			uint16_t _actionid = 0;
			if(!propStream.GET_USHORT(_actionid)){
				return false;
			}

			setActionId(_actionid);
			break;
		}

		case ATTR_UNIQUE_ID:
		{
			uint16_t _uniqueid;
			if(!propStream.GET_USHORT(_uniqueid)){
				return false;
			}

			setUniqueId(_uniqueid);
			break;
		}

		case ATTR_TEXT:
		{
			std::string _text;
			if(!propStream.GET_STRING(_text))
				return false;

			setText(_text);
			break;
		}

		case ATTR_WRITTENDATE:
		{
			uint32_t _writtenDate;
			if(!propStream.GET_ULONG(_writtenDate))
				return false;
			
			setDate(_writtenDate);
			break;
		}

		case ATTR_WRITTENBY:
		{
			std::string _writer;
			if(!propStream.GET_STRING(_writer))
				return false;
			
			setWriter(_writer);
			break;
		}

		case ATTR_DESC:
		{
			std::string _text;
			if(!propStream.GET_STRING(_text))
				return false;

			setSpecialDescription(_text);
			break;
		}

		case ATTR_RUNE_CHARGES:
		{
			uint8_t _charges = 1;
			if(!propStream.GET_UCHAR(_charges))
				return false;

			setItemCountOrSubtype(_charges);
			break;
		}

		case ATTR_DURATION:
		{
			uint32_t duration = 0;
			if(!propStream.GET_ULONG(duration))
				return false;

			setDuration(duration);
			break;
		}
		
		case ATTR_DECAYING_STATE:
		{
			uint8_t state = 0;
			if(!propStream.GET_UCHAR(state))
				return false;

			if(state != DECAYING_FALSE)
				setDecaying(DECAYING_PENDING);
			break;
		}

		//these should be handled through derived classes
		//If these are called then something has changed in the items.otb since the map was saved
		//just read the values

		//Depot class
		case ATTR_DEPOT_ID:
		{
			uint16_t _depotId;
			if(!propStream.GET_USHORT(_depotId))
				return false;

			return true;
			break;
		}

		//Door class
		case ATTR_HOUSEDOORID:
		{
			uint8_t _doorId;
			if(!propStream.GET_UCHAR(_doorId))
				return false;

			return true;
			break;
		}

		//Teleport class
		case ATTR_TELE_DEST:
		{
			TeleportDest* tele_dest;
			if(!propStream.GET_STRUCT(tele_dest))
				return false;

			return true;
			break;
		}

		default:
			return false;
			break;
	}

	return true;
}

bool Item::unserializeAttr(PropStream& propStream)
{
	uint8_t attr_type;
	while(propStream.GET_UCHAR(attr_type))
	{
		if(!readAttr((AttrTypes_t)attr_type, propStream))
		{
			std::cout << "Failed to unserialize attr_type: " << (AttrTypes_t)attr_type << " for item: " << id << std::endl;
			return false;
			break;
		}
	}
	return true;
}

bool Item::unserializeItemNode(FileLoader& f, NODE node, PropStream& propStream)
{
	return unserializeAttr(propStream);
}

bool Item::serializeAttr(PropWriteStream& propWriteStream)
{
	if(isRune())
	{
		uint8_t _count = getItemCharge();
		propWriteStream.ADD_UCHAR(ATTR_RUNE_CHARGES);
		propWriteStream.ADD_UCHAR(_count);
	}

	if(!isNotMoveable())
	{
		uint16_t _actionId = getActionId();
		if(_actionId)
		{
			propWriteStream.ADD_UCHAR(ATTR_ACTION_ID);
			propWriteStream.ADD_USHORT(_actionId);
		}
	}

	const std::string& _text = getText();
	if(_text.length() > 0)
	{
		propWriteStream.ADD_UCHAR(ATTR_TEXT);
		propWriteStream.ADD_STRING(_text);
	}

	const time_t _writtenDate = getDate();
	if(_writtenDate > 0)
	{
		propWriteStream.ADD_UCHAR(ATTR_WRITTENDATE);
		propWriteStream.ADD_ULONG(_writtenDate);
	}

	const std::string& _writer = getWriter();
	if(_writer.length() > 0)
	{
		propWriteStream.ADD_UCHAR(ATTR_WRITTENBY);
		propWriteStream.ADD_STRING(_writer);
	}

	const std::string& _specialDesc = getSpecialDescription();
	if(_specialDesc.length() > 0)
	{
		propWriteStream.ADD_UCHAR(ATTR_DESC);
		propWriteStream.ADD_STRING(_specialDesc);
	}

	if(hasAttribute(ATTR_ITEM_DURATION))
	{
		uint32_t duration = getDuration();
		propWriteStream.ADD_UCHAR(ATTR_DURATION);
		propWriteStream.ADD_ULONG(duration);
	}

	uint32_t decayState = getDecaying();
	if(decayState == DECAYING_TRUE || decayState == DECAYING_PENDING)
	{
		propWriteStream.ADD_UCHAR(ATTR_DECAYING_STATE);
		propWriteStream.ADD_UCHAR(decayState);
	}

	return true;
}

bool Item::hasProperty(enum ITEMPROPERTY prop) const
{
	const ItemType& it = items[id];

	switch(prop){
		case BLOCKSOLID:
			if(it.blockSolid)
				return true;
			break;

		case MOVEABLE:
			if(it.moveable && getUniqueId() == 0)
				return true;
			break;

		case HASHEIGHT:
			if(it.hasHeight)
				return true;
			break;

		case BLOCKPROJECTILE:
			if(it.blockProjectile)
				return true;
			break;

		case BLOCKPATH:
			if(it.blockPathFind)
				return true;
			break;

		case ISVERTICAL:
			if(it.isVertical)
				return true;
			break;

		case ISHORIZONTAL:
			if(it.isHorizontal)
				return true;
			break;

		case IMMOVABLEBLOCKSOLID:
			if(it.blockSolid && (!it.moveable || getUniqueId() != 0))
				return true;
			break;

		case IMMOVABLEBLOCKPATH:
			if(it.blockPathFind && (!it.moveable || getUniqueId() != 0))
				return true;
			break;

		case SUPPORTHANGABLE:
			if(it.isHorizontal || it.isVertical)
				return true;
			break;

		case IMMOVABLENOFIELDBLOCKPATH:
			if(!it.isMagicField() && it.blockPathFind && (!it.moveable || getUniqueId() != 0))
				return true;
			break;

		case NOFIELDBLOCKPATH:
			if(!it.isMagicField() && it.blockPathFind)
				return true;
			break;

		default:
			return false;
			break;
	}
	return false;
}

double Item::getWeight() const
{
	if(isStackable()){
		return items[id].weight * std::max(1, (int32_t)count);
	}

	return items[id].weight;
}

std::string Item::getDescription(int32_t lookDistance) const
{
	std::stringstream s;
	const ItemType& it = items[id];

	if(it.name.length())
	{
		if(isStackable() && getItemCount() > 1)
		{
			if(it.showCount)
				s << (int)getItemCount() << " ";
			s << it.pluralName;
		}
		else
		{
			if(it.article.length())
				s << it.article << " ";
			s << it.name;
		}
	}
	else
		s << "an item of type " << getID();

	if(it.isRune())
	{
		s << " for magic level " << (int)it.runeMagLevel << "." << std::endl;
		s << "It's an \"" << it.runeSpellName << "\" spell (";
		if(getItemCharge())
			s << (int)getItemCharge();
		else
			s << "1";
		s << "x).";
	}
	else if(isWeapon())
	{
		if(getWeaponType() != WEAPON_AMMO)
		{
			if(getAttack())
			{
				if(getExtraDefense())
					s << " (Atk:" << (int)getAttack() << " Def:" << (int)getDefense() << " " << std::showpos << (int)getExtraDefense() << ")" << std::noshowpos;
				else
					s << " (Atk:" << (int)getAttack() << " Def:" << (int)getDefense() << ")";
			}
			else if(getDefense())
				s << std::endl << " (Def:" << (int)getDefense() << ")";
		}
		s << ".";

		const Weapon* weapon = g_weapons->getWeapon(this);
		if(weapon && weapon->getWieldInfo())
		{
			const uint32_t wieldInfo = weapon->getWieldInfo();
			s << std::endl << "It can only be wielded properly by ";
			if(wieldInfo & WIELDINFO_PREMIUM)
				s << "premium ";

			if(wieldInfo & WIELDINFO_VOCREQ)
				s << weapon->getVocationString();
			else
				s << "players";

			if(wieldInfo & WIELDINFO_LEVEL)
				s << " of level " << (int)weapon->getReqLevel() << " or higher";

			if(wieldInfo & WIELDINFO_MAGLV)
			{
				if(wieldInfo & WIELDINFO_LEVEL)
					s << " and";
				else
					s << " of";
				s << " magic level " << (int)weapon->getReqMagLv() << " or higher";
			}
			s << ".";
		}
	}
	else if(getArmor())
		s << " (Arm:" << (int)getArmor() << ").";
	else if(isFluidContainer())
	{
		if(fluid == 0)
			s << ". It is empty.";
		else
			s << " of " << items[fluid].name << ".";
	}
	else if(isSplash())
	{
		s << " of ";
		if(fluid == 0)
			s << items[1].name << ".";
		else
			s << items[fluid].name << ".";
	}
	else if(it.isKey())
		s << " (Key:" << (int)getActionId() << ").";
	else if(it.isContainer())
		s << " (Vol:" << (int)getContainer()->capacity() << ").";
	else if(it.allowDistRead)
	{
		s << "." << std::endl;
		if(getText() != "")
		{
			if(lookDistance <= 4)
			{
				if(getWriter().length())
				{
					s << getWriter() << " wrote";
					time_t wDate = getDate();
					if(wDate)
					{
						char date[16];
						formatDate2(wDate, date);
						s << " on " << date;
					}
					s << ": ";
				}
				else
					s << "You read: ";
				s << getText();
			}
			else
				s << "You are too far away to read it.";
		}
		else
			s << "Nothing is written on it.";
	}
	else if(it.showCharges)
	{
		uint16_t charges = getItemCharge();
		if(charges > 1)
			s << " that has " << (int)charges << " charges left.";
		else
			s << " that has 1 charge left.";
	}
	else if(it.showDuration)
	{
		if(hasAttribute(ATTR_ITEM_DURATION))
		{
			uint32_t duration = getDuration() / 1000;
			s << " that has energy for ";
			if(duration >= 120)
				s << duration / 60 << " minutes left.";
			else if(duration > 60)
				s << "1 minute left.";
			else
				s << " less than a minute left.";
		}
		else
			s << " that is brand-new.";
	}
	else if(it.isLevelDoor() && getActionId() >= 1000)
		s << " for level " << getActionId() - 1000 << ".";
	else
		s << ".";
	
	if(lookDistance <= 1)
	{
		double weight = getWeight();
		if(weight > 0)
			s << std::endl << getWeightDescription(weight);
	}

	if(getSpecialDescription() != "")
		s << std::endl << getSpecialDescription().c_str();
	else if(it.description.length() && lookDistance <= 1)
		s << std::endl << it.description;
	return s.str();
}

std::string Item::getWeightDescription() const
{
	double weight = getWeight();
	if(weight > 0)
		return getWeightDescription(weight);
	else
		return "";
}

std::string Item::getWeightDescription(double weight) const
{
	std::stringstream ss;
	if(isStackable() && count > 1)
		ss << "They weigh " << std::fixed << std::setprecision(2) << weight << " oz.";
	else
		ss << "It weighs " << std::fixed << std::setprecision(2) << weight << " oz.";
	return ss.str();
}

void Item::setUniqueId(uint16_t n)
{
	if(getUniqueId() != 0)
		return;
	
	ItemAttributes::setUniqueId(n);
	ScriptEnviroment::addUniqueThing(this);
}

bool Item::canDecay()
{
	if(isRemoved()){
		return false;
	}
	if((getUniqueId() != 0) || (getActionId() != 0)){
		return false;
	}
	return (items[id].decayTo != -1);
}

int32_t Item::getWorth() const
{
	switch(getID())
	{
		case ITEM_COINS_GOLD:
			return getItemCount();
			break;
		case ITEM_COINS_PLATINUM:
			return getItemCount() * 100;
			break;
		case ITEM_COINS_CRYSTAL:
			return getItemCount() * 10000;
			break;
		default:
			return 0;
			break;
	}
}

void Item::getLight(LightInfo& lightInfo)
{
	const ItemType& it = items[id];
	lightInfo.color = it.lightColor;
	lightInfo.level = it.lightLevel;
}

std::string ItemAttributes::emptyString("");

const std::string& ItemAttributes::getStrAttr(itemAttrTypes type) const
{
	if(!validateStrAttrType(type))
		return emptyString;
		
	Attribute* attr = getAttrConst(type);
	if(attr)
		return *(std::string*)attr->value;
	else
		return emptyString;
}

void ItemAttributes::setStrAttr(itemAttrTypes type, const std::string& value)
{
	if(!validateStrAttrType(type))
		return;
	
	if(value.length() == 0)
		return;
	
	Attribute* attr = getAttr(type);
	if(attr)
	{
		if(attr->value)
			delete (std::string*)attr->value;

		attr->value = (void*)new std::string(value);
	}
}

bool ItemAttributes::hasAttribute(itemAttrTypes type) const
{
	if(!validateIntAttrType(type))
		return false;

	Attribute* attr = getAttrConst(type);
	if(attr)
		return true;

	return false;
}

void ItemAttributes::removeAttribute(itemAttrTypes type)
{
	//check if we have it
	if((type & m_attributes) != 0)
	{
		//go trough the linked list until find it
		Attribute* prevAttr = NULL;
		Attribute* curAttr = m_firstAttr;
		while(curAttr != NULL)
		{
			if(curAttr->type == type)
			{
				//found so remove it from the linked list
				if(prevAttr)
					prevAttr->next = curAttr->next;
				else
					m_firstAttr = curAttr->next;

				//remove it from flags
				m_attributes = m_attributes & ~type;
				
				//delete string if it is string type
				if(validateStrAttrType(type))
					delete (std::string*)curAttr->value;

				//finally delete the attribute and return
				delete curAttr;
				return;
			}
			//advance in the linked list
			prevAttr = curAttr;
			curAttr = curAttr->next;
		}
	}
}

uint32_t ItemAttributes::getIntAttr(itemAttrTypes type) const
{
	if(!validateIntAttrType(type))
		return 0;
		
	Attribute* attr = getAttrConst(type);
	if(attr)
		return static_cast<uint32_t>(0xFFFFFFFF & reinterpret_cast<ptrdiff_t>(attr->value));
	else
		return 0;
}

void ItemAttributes::setIntAttr(itemAttrTypes type, int32_t value)
{
	if(!validateIntAttrType(type))
		return;
	
	Attribute* attr = getAttr(type);
	if(attr)
		attr->value = reinterpret_cast<void*>(static_cast<ptrdiff_t>(value));
}

void ItemAttributes::increaseIntAttr(itemAttrTypes type, int32_t value)
{
	if(!validateIntAttrType(type))
		return;
	
	Attribute* attr = getAttr(type);
	if(attr)
		attr->value = reinterpret_cast<void*>(static_cast<ptrdiff_t>(static_cast<uint32_t>(0xFFFFFFFF & reinterpret_cast<ptrdiff_t>(attr->value)) + value));
}
	
bool ItemAttributes::validateIntAttrType(itemAttrTypes type)
{
	switch(type)
	{
		case ATTR_ITEM_ACTIONID:
		case ATTR_ITEM_UNIQUEID:
		case ATTR_ITEM_OWNER:
		case ATTR_ITEM_DURATION:
		case ATTR_ITEM_DECAYING:
		case ATTR_ITEM_WRITTENDATE:
			return true;
			break;
	
		default:
			return false;
			break;
	}
	return false;
}

bool ItemAttributes::validateStrAttrType(itemAttrTypes type)
{
	switch(type)
	{
		case ATTR_ITEM_DESC:
		case ATTR_ITEM_TEXT:
		case ATTR_ITEM_WRITTENBY:
			return true;
			break;
		default:
			return false;
			break;
	}
	return false;
}

void ItemAttributes::addAttr(Attribute* attr)
{
	if(m_firstAttr)
	{
		Attribute* curAttr = m_firstAttr;
		while(curAttr->next)
			curAttr = curAttr->next;

		curAttr->next = attr;
	}
	else
		m_firstAttr = attr;

	m_attributes = m_attributes | attr->type;
}

ItemAttributes::Attribute* ItemAttributes::getAttrConst(itemAttrTypes type) const
{
	if((type & m_attributes) == 0)
		return NULL;
	
	Attribute* curAttr = m_firstAttr;
	while(curAttr)
	{
		if(curAttr->type == type)
			return curAttr;

		curAttr = curAttr->next;
	}
	std::cout << "Warning: [ItemAttributes::getAttrConst] (type & m_attributes) != 0 but attribute not found" << std::endl;
	return NULL;
}

ItemAttributes::Attribute* ItemAttributes::getAttr(itemAttrTypes type)
{
	Attribute* curAttr;
	if((type & m_attributes) == 0)
	{
		curAttr = new Attribute(type);
		addAttr(curAttr);
		return curAttr;
	}
	else
	{
		curAttr = m_firstAttr;
		while(curAttr)
		{
			if(curAttr->type == type)
				return curAttr;

			curAttr = curAttr->next;
		}
	}
	std::cout << "Warning: [ItemAttributes::getAttr] (type & m_attributes) != 0 but attribute not found" << std::endl;
	curAttr = new Attribute(type);
	addAttr(curAttr);
	return curAttr;
}

void ItemAttributes::deleteAttrs(Attribute* attr)
{
	if(attr)
	{
		if(validateStrAttrType(attr->type))
			delete (std::string*)attr->value;

		Attribute* next_attr = attr->next;
		attr->next = NULL;
		if(next_attr)
			deleteAttrs(next_attr);

		delete attr;
	}
}

void Item::__startDecaying()
{
	g_game.startDecay(this);
}
