
-- Load support for intllib.
local path = minetest.get_modpath(minetest.get_current_modname()) .. "/"

if minetest.get_translator ~= nil then
	S = minetest.get_translator("mobs")
else
	if minetest.get_modpath("intllib") then
		dofile(minetest.get_modpath("intllib").."/init.lua")
		if intllib.make_gettext_pair then
			-- New method using gettext.
			gettext, ngettext = intllib.make_gettext_pair()
		else
			-- Old method using text files.
		gettext = intllib.Getter()
		end
		S = gettext
	else
	-- mock the translator function for MT 0.4
		function minetest.translate(textdomain, str, ...)
			local arg = {n=select('#', ...), ...}
			return str:gsub("@(.)", function(matched)
				local c = string.byte(matched)
				if string.byte("1") <= c and c <= string.byte("9") then
					return arg[c - string.byte("0")]
				else
					return matched
				end
			end)
		end
		function minetest.get_translator(textdomain)
			return function(str, ...) return  minetest.translate(textdomain or "", str, ...) end
		end
		S = minetest.get_translator("mobs")
	end
end

mobs.intllib = S


-- Check for custom mob spawn file
local input = io.open(path .. "spawn.lua", "r")

if input then
	mobs.custom_spawn_animal = true
	input:close()
	input = nil
end


-- Animals
dofile(path .. "chicken.lua") -- JKmurray
dofile(path .. "cow.lua") -- KrupnoPavel
dofile(path .. "rat.lua") -- PilzAdam
dofile(path .. "sheep.lua") -- PilzAdam
dofile(path .. "warthog.lua") -- KrupnoPavel
dofile(path .. "bee.lua") -- KrupnoPavel
dofile(path .. "bunny.lua") -- ExeterDad
dofile(path .. "kitten.lua") -- Jordach/BFD
dofile(path .. "penguin.lua") -- D00Med
dofile(path .. "panda.lua") -- AspireMint


-- Load custom spawning
if mobs.custom_spawn_animal then
	dofile(path .. "spawn.lua")
end


-- Lucky Blocks
dofile(path .. "lucky_block.lua")


print ("[MOD] Mobs Redo Animals loaded")
