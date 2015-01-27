--[[
	Crafts Botania flowers into pedals and
	puts them back into the chest.

	Make sure you set the chest and direction variables.
--]]

local chest = peripheral.wrap('front')
local direction = 'north'

function empty_turtle()
	for a=1,16 do
		turtle.select( a )
		turtle.drop()
	end
	sleep( 0.5 )
	turtle.select( 1 )
end

function craft_pedal( slot_num )
	chest.pushItem( direction, tonumber( slot_num ) )
	sleep( 0.5 )
	turtle.craft()
	empty_turtle()
end	

function maybe_craft_pedal( slot_num )
	local stack_info = chest.getStackInSlot( tonumber( slot_num ) )
	sleep( 0.5 )

	if nil == stack_info then
		write('.')
		return
	end

	if nil == stack_info.name or nil == stack_info.mod_id then
		write('.')
		return
	end

	if stack_info.name == 'flower' and stack_info.mod_id == "Botania" then
		craft_pedal( slot_num )
		write('+')
	end
end

function loop_slots()
	for i=1, chest.getInventorySize() do
		maybe_craft_pedal( i )
		write('.')
	end
end

term.clear()
term.setCursorPos( 1,1 )
textutils.slowPrint( 'Crafting Pedals')
print('')
write('.')
loop_slots()
write('  FINISHED')
print('')