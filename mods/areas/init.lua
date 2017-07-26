-- Areas mod by ShadowNinja
-- Based on node_ownership
-- License: LGPLv2+

local version = "1.0"
local modname = minetest.get_current_modname()
minetest.log("action", "[" .. modname .. "] version " .. version .. " loaded.")

areas = {}

areas.adminPrivs = {areas=true}
areas.startTime = os.clock()

areas.modpath = minetest.get_modpath("areas")
dofile(areas.modpath.."/settings.lua")
dofile(areas.modpath.."/api.lua")
dofile(areas.modpath.."/internal.lua")
dofile(areas.modpath.."/chatcommands.lua")
dofile(areas.modpath.."/pos.lua")
dofile(areas.modpath.."/interact.lua")
dofile(areas.modpath.."/legacy.lua")
dofile(areas.modpath.."/hud.lua")

areas:load()

minetest.register_privilege("areas", {
	description = "Can administer areas."
})
minetest.register_privilege("areas_high_limit", {
	description = "Can can more, bigger areas."
})

if not minetest.registered_privileges[areas.config.self_protection_privilege] then
	minetest.register_privilege(areas.config.self_protection_privilege, {
		description = "Can protect areas.",
	})
end

if minetest.settings:get_bool("log_mod") then
	local diffTime = os.clock() - areas.startTime
	minetest.log("action", "areas loaded in "..diffTime.."s.")
end

