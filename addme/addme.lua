--Search through the missionlist to find a map that matches mapName,
--then insert the new flags into said entry.
--Use this when you know the map already exists, but this content patch is just
--adding new gamemodes (otherwise you should just add whole new entries to the missionlist)
function AddNewGameModes(missionList, mapName, newFlags)
	for i, mission in missionList do
		if mission.mapluafile == mapName then
			for flag, value in pairs(newFlags) do
				mission[flag] = value
			end
		end
	end
end

--insert totally new maps here:
local sp_n = 0
local mp_n = 0
sp_n = table.getn(sp_missionselect_listbox_contents)

AddNewGameModes(sp_missionselect_listbox_contents, "tat2%s_%s", {era_z = 1, mode_con_z = 1, change = { era_z = { name="Star Wars: The Clone Wars CUSTOMIZED", icon2="era_icon_l" },},})
AddNewGameModes(mp_missionselect_listbox_contents, "tat2%s_%s", {era_z = 1, mode_con_z = 1, change = { era_z = { name="Star Wars: The Clone Wars CUSTOMIZED", icon2="era_icon_l" },},})

-- associate this mission name with the current downloadable content directory
-- (this tells the engine which maps are downloaded, so you need to include all new mission lua's here)
-- first arg: mapluafile from above
-- second arg: mission script name
-- third arg: level memory modifier.  the arg to LuaScript.cpp: DEFAULT_MODEL_MEMORY_PLUS(x)

AddDownloadableContent("tat2","tat2z_con",4)

-- all done
newEntry = nil
n = nil

-- Now load our core.lvl into the shell to add our localize keys
ReadDataFile("..\\..\\addon\\POC\\data\\_LVL_PC\\core.lvl")
ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\core.lvl")
