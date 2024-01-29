--STAR WARS BATTLEFRONT II - CUSTOMIZATION
--Script written by S1thK3nny
--Remaster by GTanakin

__scriptName__ = "[POC: POC_option_script]: "

function swbf2Remaster_getCustomQuickSettings()
	local customSettings = {
	}
	return customSettings
end

-----------------------------------------------------------------------------------------------------------
-- Custom Minipage

-- "this" refers to the minipage, remember that

local rema_database_dvalues = {
    legion = 1,
    extraUnit = 1,
    chosenHero = 1,
    chosenDayTime = 1,
    phase1 = false,
    randomLegion = false,
    randomSP = false,
    randomHeroes = false,
    randomCycle = false
}

function POC_minipage_enter(this, bFwd)
	
	-- check if any of the rema_database values are nil. If so, set them to their default.
	for k, v in pairs(rema_database_dvalues) do
		if rema_database.data[k] == nil then
			rema_database.data[k] = v
		end
	end

	-- Used to simplify the TickBox ticking
	tickBoxMapping = {
		["yesPhase1"] = {tickBox = this.minipage.TickBoxContainer.phase1TickBoxContainer.phase1TickBox, dataField = "phase1"},
		["yesRandomLegion"] = {tickBox = this.minipage.TickBoxContainer.randomizerContainer.randomLegionTickBox, dataField = "randomLegion"},
		["yesRandomSP"] = {tickBox = this.minipage.TickBoxContainer.randomizerContainer.randomSPTickBox, dataField = "randomSP"},
		["yesRandomHeroes"] = {tickBox = this.minipage.TickBoxContainer.randomizerContainer.randomHeroesTickBox, dataField = "randomHeroes"},
		["yesRandomCycle"] = {tickBox = this.minipage.TickBoxContainer.randomizerContainer.randomCycleTickBox, dataField = "randomCycle"}
	}

	dropdowns = {
		{
			dest = this.minipage.DropDownContainer.dropdownLegions,
			stringList = {"Normal", "501st Legion", "212th Battalion", "104th Battalion", "5th Fleet Security", "Shock Troopers", "Galactic Marines", "Galactic Marines (Kellers Unit)"},
			dataField = 'legion',
			layout = POC_minipag_dropdown_layout
		},
		{
			dest = this.minipage.DropDownContainer.dropdownExtra,
			stringList = {"None", "RC-1138 'Boss'", "RC-1140 'Fixer'", "RC-1207 'Sev'", "RC-1262 'Scorch'", "CC-5576 'Gregor'", "Clone Force 99 - Crosshair", "Clone Force 99 - Hunter", "Clone Force 99 - Tech", "Clone Force 99 - Wrecker"},
			dataField = 'extraUnit',
			layout = POC_minipag_dropdown_extra_layout
		},
		{
			dest = this.minipage.DropDownContainer.dropdownHeroes,
			stringList = {"Anakin Skywalker", "Obi-Wan Kenobi", "Plo Koon", "Grand Master Yoda", "Ahsoka Tano", "Mace Windu"},
			dataField = 'chosenHero',
			layout = POC_minipag_dropdown_heroes_layout
		},
		{
			dest = this.minipage.DropDownContainer.dropdownMapCycle,
			stringList = {"Day time", "Night time"},
			dataField = 'chosenDayTime',
			layout = POC_minipag_dropdown_mapCycle_layout
		}
	}

	-- let's fill our dropdown with data
	updateDropdownList(this)
end



function POC_minipage_exit(this)
	printCurrentSettings()
end



function POC_handle_input(this)

	for i, dropdown in ipairs(dropdowns) do
		handleDropdownSelection(this, dropdown.dest, dropdown.dataField, table.getn(dropdown.stringList))
	end	

	-- default handle (listbox scrolls for example)
	if gShellScreen_fnDefaultInputAccept(this, false) then
		return
	end

	-- tickBoxMapping table declared in POC_minipage_enter
	if tickBoxMapping[this.CurButton] then
		updateCheckboxData(tickBoxMapping[this.CurButton].tickBox, tickBoxMapping[this.CurButton].dataField)
	elseif this.CurButton ~= nil then
		-- Iterate over each dropdown to check which one got clicked, then open or close it
		for _, dropdown in ipairs(dropdowns) do
			if string.sub(this.CurButton, 13, string.len(this.CurButton)) == dropdown.layout.tag then
				dropdown.dest.expanded = toggleDropdown(dropdown.dest.expanded, dropdown.layout, rema_database.data[dropdown.dataField])
			end
		end
	end

	updateDropdownList(this)
end



POC_minipag_dropdown_layout = {
	tag = "dropMyLife",
	string = "button",
	btnw = 350,
	x = 0,
	y = 0,
	btnFont = "gamefont_medium_rema",
	lstHeight = 150,
	lst = {
		ySpacing = 0,
		font = "gamefont_small_rema",
		halign = "left",
		valign = "vcenter",
		flashy = 0,
		slider = 1,
	},
}

POC_minipag_dropdown_extra_layout = {
	tag = "dropdownExtra",
	string = "button",
	btnw = 350,
	x = 400,
	y = 0,
	btnFont = "gamefont_medium_rema",
	lstHeight = 150,
	lst = {
		ySpacing = 0,
		font = "gamefont_small_rema",
		halign = "left",
		valign = "vcenter",
		flashy = 0,
		slider = 1,
	},
}

POC_minipag_dropdown_heroes_layout = {
	tag = "dropdownHeroes",
	string = "button",
	btnw = 350,
	x = 800,
	y = 0,
	btnFont = "gamefont_medium_rema",
	lstHeight = 150,
	lst = {
		ySpacing = 0,
		font = "gamefont_small_rema",
		halign = "left",
		valign = "vcenter",
		flashy = 0,
		slider = 1,
	},
}

POC_minipag_dropdown_mapCycle_layout = {
	tag = "dropdownMapCycle",
	string = "button",
	btnw = 350,
	x = 1200,
	y = 0,
	btnFont = "gamefont_medium_rema",
	lstHeight = 150,
	lst = {
		ySpacing = 0,
		font = "gamefont_small_rema",
		halign = "left",
		valign = "vcenter",
		flashy = 0,
		slider = 1,
	},
}



function POC_fnBuildMinipage()
	-- The 3-letter ID, we need this to generate the minipage
	local modID = "POC"
	
	-- if you need the minipage absolut size for some decisions or calculations 
	local width, height = ifelem_minipage_getSize()
	
	-- this table holds all graphic elements we want to show on the minipage
	local elements = {
		DropDownContainer = NewIFContainer{

			legion = NewIFText {
				x = 0,
				y = -2 * ScriptCB_GetFontHeight("gamefont_large_rema"),
				halign = "hcenter",
				--textw = 200,
				nocreatebackground = 1,
				font = "gamefont_large_rema",
				string = "Legion",
			},

			extraunit = NewIFText {
				x = 400,
				y = -2 * ScriptCB_GetFontHeight("gamefont_large_rema"),
				halign = "hcenter",
				nocreatebackground = 1,
				font = "gamefont_large_rema",
				string = "Enforcer",
			},

			heroes = NewIFText {
				x = 800,
				y = -2 * ScriptCB_GetFontHeight("gamefont_large_rema"),
				halign = "hcenter",
				--textw = 200,
				nocreatebackground = 1,
				font = "gamefont_large_rema",
				string = "Heroes",
			},
			mapcycle = NewIFText {
				x = 1200,
				y = -2 * ScriptCB_GetFontHeight("gamefont_large_rema"),
				halign = "hcenter",
				textw = 150,
				nocreatebackground = 1,
				font = "gamefont_large_rema",
				string = "Map Cycle",
			},

			dropdownLegions = ifelem_minipage_NewDropDownButton(POC_minipag_dropdown_layout),
			dropdownExtra = ifelem_minipage_NewDropDownButton(POC_minipag_dropdown_extra_layout),
			dropdownHeroes = ifelem_minipage_NewDropDownButton(POC_minipag_dropdown_heroes_layout),
			dropdownMapCycle = ifelem_minipage_NewDropDownButton(POC_minipag_dropdown_mapCycle_layout),
		},

		TickBoxContainer = NewIFContainer { --Basically like a java swing panel. Like I didn't get enough of that already...
			x = -20,
			y = 50,
			phase1TickBoxContainer = NewIFContainer {
				x = 0,
				y = 0,
				phase1TickBox = NewIFImage {
					x = 0, y = 0,
					texture = showActualTexture(rema_database.data.phase1),
					localpos_l = 1, localpos_t = 1,
					localpos_r = 14, localpos_b = 14,
					AutoHotspot = 1, tag = "yesPhase1",
					bIsFlashObj = 1, flash_alpha = 1.0,
					hotspot_width = era_hotspot_width,
				},
			
				phase1TickBoxText = NewIFText { 
					x = -210,
					y = -10,
					textw = 200,
					halign = "right", valign = "vcenter",
					font = "gamefont_small_rema", 
					startdelay=math.random()*0.5, nocreatebackground=1, 
					string = "Phase 1",
				},
			},
			randomizerContainer = NewIFContainer {
				x = 0,
				y = 30,
				randomLegionTickBox = NewIFImage {
					x = 0, y = 0,
					texture = showActualTexture(rema_database.data.randomLegion),
					localpos_l = 1, localpos_t = 1,
					localpos_r = 14, localpos_b = 14,
					AutoHotspot = 1, tag = "yesRandomLegion",
					bIsFlashObj = 1, flash_alpha = 1.0,
					hotspot_width = era_hotspot_width,
				},
			
				randomLegionTickBoxText = NewIFText { 
					x = -210,
					y = -10,
					textw = 200,
					halign = "right", valign = "vcenter",
					font = "gamefont_small_rema", 
					startdelay=math.random()*0.5, nocreatebackground=1, 
					string = "Random Legion",
				},

				randomSPTickBox = NewIFImage {
					x = 0, 
					y = 30,
					texture = showActualTexture(rema_database.data.randomSP),
					localpos_l = 1, localpos_t = 1,
					localpos_r = 14, localpos_b = 14,
					AutoHotspot = 1, tag = "yesRandomSP",
					bIsFlashObj = 1, flash_alpha = 1.0,
					hotspot_width = era_hotspot_width,
				},
			
				randomSPTickBoxText = NewIFText { 
					x = -210,
					y = 20,
					textw = 200,
					halign = "right", valign = "vcenter",
					font = "gamefont_small_rema", 
					startdelay=math.random()*0.5, nocreatebackground=1, 
					string = "Random Special Operations",
				},

				randomHeroesTickBox = NewIFImage {
					x = 0, 
					y = 60,
					texture = showActualTexture(rema_database.data.randomHeroes),
					localpos_l = 1, localpos_t = 1,
					localpos_r = 14, localpos_b = 14,
					AutoHotspot = 1, tag = "yesRandomHeroes",
					bIsFlashObj = 1, flash_alpha = 1.0,
					hotspot_width = era_hotspot_width,
				},
			
				randomHeroesTickBoxText = NewIFText { 
					x = -210,
					y = 50,
					textw = 200,
					halign = "right", valign = "vcenter",
					font = "gamefont_small_rema", 
					startdelay=math.random()*0.5, nocreatebackground=1, 
					string = "Random Heroes",
				},

				randomCycleTickBox = NewIFImage {
					x = 0, 
					y = 90,
					texture = showActualTexture(rema_database.data.randomCycle),
					localpos_l = 1, localpos_t = 1,
					localpos_r = 14, localpos_b = 14,
					AutoHotspot = 1, tag = "yesRandomCycle",
					bIsFlashObj = 1, flash_alpha = 1.0,
					hotspot_width = era_hotspot_width,
				},
			
				randomCycleTickBoxText = NewIFText { 
					x = -210,
					y = 80,
					textw = 200,
					halign = "right", valign = "vcenter",
					font = "gamefont_small_rema", 
					startdelay=math.random()*0.5, nocreatebackground=1, 
					string = "Random Map Cycle",
				},

			},

		},
	}



	-- ScreenRelativeX and ScreenRelativeY work only once in a child/parent tree
	-- since remaster already needs this to position the minipage container, there
	-- is a helper function to set element's relative position on the minipage.
	ifelem_minipage_setRelativePos(elements.DropDownContainer, 0.0, 0.1)
	ifelem_minipage_setRelativePos(elements.TickBoxContainer, 0.0, 0.1)
	
	-- put all callback functions in this table. Those can be stock shell callbacks
	-- or your own functions you want to add to your screen.
	-- this is optional
	local callbackTable = {
		Enter = POC_minipage_enter,
		Exit = POC_minipage_exit,
		Input_Accept = POC_handle_input,
	}
	
	ifelem_minipage_add(modID, elements, callbackTable)
end



-----------------------------------------------------------------------------------------------------------
-- Utility functions -- 
-- Do NOT touch unless you know what you are doing

-- print any key from the rema_database that matches the ones in the dvalues table we established to keep track of all our variables.
function printCurrentSettings()
    for k, v in pairs(rema_database.data) do
        if rema_database_dvalues[k] ~= nil then
            print(__scriptName__, k .. ": ", v)
        end
    end
end

-- Listen well
-- I noticed that sometimes, some of the booleans are saved, the debugger would show true even if the texture was unticked
-- It makes sense, they werent nil so they werent set to false, but the texture for the tickboxes are always "check_no" when booting up
-- This shows the actual state, so one will not get fooled.
function showActualTexture(bState)
	if(bState) then
		return "check_yes"
	else
		return "check_no"
	end
end

-- This function updates the visually selected element of the dropdown and closes any other open dropdowns when a new one is opened.
function updateDropdownList(this)
	for _, dropdown in ipairs(dropdowns) do
		if dropdown.dest.expanded == true then
			IFObj_fnSetVis(dropdown.dest.listbox, true)
			ListManager_fnAutoscroll(dropdown.dest.listbox, dropdown.stringList, dropdown.layout.lst)
			closeOtherDropDowns(this, dropdown.dest)
		else
			IFObj_fnSetVis(dropdown.dest.listbox, false)
			local selectedString = dropdown.stringList[rema_database.data[dropdown.dataField]]
			RoundIFButtonLabel_fnSetString(dropdown.dest.button, selectedString)
		end
	end
end

function closeOtherDropDowns(this, drop)
	for _, dropdown in ipairs(dropdowns) do
		if dropdown.dest ~= drop then
			dropdown.dest.expanded = false
		end
	end
end

-- Open / Close a dropdown, then update the dropdown to use the slot of the databaseEntry
function toggleDropdown(minipage_dropdown_expanded, dropdown, databaseEntry)
    minipage_dropdown_expanded = not minipage_dropdown_expanded
    dropdown.lst.SelectedIdx = databaseEntry
    dropdown.lst.CursorIdx = databaseEntry
    dropdown.lst.FirstShownIdx = databaseEntry
    return minipage_dropdown_expanded
end

-- This function handles the selection of an item from a dropdown list.
-- It updates the selected item in the database and refreshes the dropdown list.
function handleDropdownSelection(this, dropdown, dataField, listLength)
    assert(rema_database.data[dataField], __scriptName__ .. "Data field does not exist in rema_database.data: " .. dataField)

    -- Close other dropdowns
    closeOtherDropDowns(this, dropdown)

    if gMouseListBox == dropdown.listbox then
        dropdown.expanded = false
        local newIdx = gMouseListBox.Layout.CursorIdx
        if newIdx and not (newIdx > listLength) then
            if newIdx ~= rema_database.data[dataField] then
                rema_database.data[dataField] = newIdx
            end
        end
        updateDropdownList(this)
    end
end


function updateCheckboxData(checkbox, dataField)
    if rema_database.data[dataField] then
        rema_database.data[dataField] = false
        IFImage_fnSetTexture(checkbox, "check_no")
    else
        rema_database.data[dataField] = true
        IFImage_fnSetTexture(checkbox, "check_yes")
    end
    ifelm_shellscreen_fnPlaySound(this.acceptSound)
end



-----------------------------------------------------------------------------------------------------------
-- Build minipage --

POC_fnBuildMinipage()