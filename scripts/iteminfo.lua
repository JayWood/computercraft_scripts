--[[
	Shows item info on screen for the specified inventory side
	@synopsis iteminfo <side> <slot_number>
--]]
os.loadAPI('../API/dumpvar.lua')
local tArgs = {...}

function print_usage()
  term.clear()
  term.setCursorPos( 1,1 )
  print( 'Usage: iteminfo <side> <slotnumber>' )  
end

if #tArgs < 1 then
  print_usage()
  return
end

local slot = tArgs[2]
local side = tArgs[1]

local ch = peripheral.wrap(side)
local stack_info = ch.getStackInSlot( tonumber( slot ) )
textutils.pagedPrint( dmp.dumpvar( stack_info ) )