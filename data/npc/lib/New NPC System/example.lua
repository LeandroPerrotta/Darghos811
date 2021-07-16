-- Start NPC!
NPC = NPC:new()

function onCreatureAppear(cid) 
	-- soon	
end

function onThink()
	-- soon
end

function onCreatureDisappear(cid) 
	-- soon
end

function onCreatureSay(cid, type, msg)		
	-- soon
end

-- Shop example

John = Shop:new(
					BUY_LIST =
					{
						["item_name"] = {id = , price = , count = }
					}
				)
				
-- Dialog example

Dialog = Say:new(
					[1] = {{"hi", "hello"}, "hello, my friend"},
					[2] = {"use function", useFunction()},
					[3] = {"msg with delay", {"msg1", "msg2", "msg3"}, delay = 2000},
				)
				
-- Travel example

Midas = Travel:new(
						TRAVEL_LIST =
						{
							["Thais"] = {price = 100, pos = {x = 100, y = 200, z = 7}, premium = true}
							["Edron"] = {price = 150, pos = {x = 200, y = 100, z = 7}, premium = false}
						}
						
-- Quest example

Terry = Quest:new(
						["Warlock quest"] = {recipe = {{1234, 1}, {2312, 1}}, award = {{1254, 1}, {1256, 1}}}
				)


				
	

				
