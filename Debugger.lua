--[[
@Name: Debugger
@Version: 0.1.3
@Author: BlackOnix DevCrew
--]]

Debugger = {
	Version  = '0.1.3',
	
	printTable = function(arr, ...)
		local msg = ""
		local substr = ""
		for a, b in pairs({...}) do
			substr = b  .. ' -> ' .. substr
		end
		for k, v in pairs(arr) do
			if (type(v) == 'function') then
				msg = msg .. 'Position: ' .. substr .. k .. ' | Value: Function\n' 
			elseif (type(v) ~= 'table') then
				msg = msg .. 'Position: ' .. substr .. k .. ' | Value: ' .. v .. '\n' 
			else
				msg = msg .. Debugger.printTable(v, k, ...)
			end
		end
		return msg
	end,
	
	getVarType = function(var)
		if (var == nil) then
			return 'Nil'
		elseif (type(var) == 'number') then
			return 'Number'
		elseif (type(var) == 'string') then
			return 'String'
		elseif (type(var) == 'table') then
			 return 'Table'
		elseif (type(var) == 'userdata') then
			 return 'Userdata'
		else
			return 'Type not found.'
		end
	end,
	
	Info = function()
		return 'BlackOnix Table Debugger - Version: ' .. Debugger.Version .. ' Author: Jovial.'
	end
}