--STAR WARS BATTLEFRONT II - CUSTOMIZATION
--Script written by S1thK3nny
--Remaster by GTanakin

function swbf2Remaster_getCustomQuickSettings()
	local customSettings = {
	}
	return customSettings
end

-----------------------------------------------------------------------------------------------------------
-- Custom Minipage

--"this" refers to the minipage, remember that

function POC_minipage_updateDropdownList(this)

	local dest = this.minipage.mySection.dropdownLegions --Dest is the dropdownLegions
	local dropDownLegionStringList = { --The strings for the dropdown
		"Normal",
		"501st Legion",
		"212th Battalion",
		"104th Battalion",
		"5th Fleet Security",
		"Shock Troopers",
		"Galactic Marines",
		"Galactic Marines (Kellers Unit)",
	}
	dropDownLegionStringListLength = table.getn(dropDownLegionStringList)

	local destExtra = this.minipage.mySection.dropdownExtra
	local dropDownExtraStringList = {
		"None",
		"RC-1138 'Boss'",
		"RC-1140 'Fixer'",
		"RC-1207 'Sev'",
		"RC-1262 'Scorch'",
		"CC-5576 'Gregor'",
		"Clone Force 99 - Crosshair",
		"Clone Force 99 - Hunter",
		"Clone Force 99 - Tech",
		"Clone Force 99 - Wrecker",
	}
	dropDownExtraStringListLength = table.getn(dropDownExtraStringList)

	local destHeroes = this.minipage.mySection.dropdownHeroes
	local dropDownHeroesStringList = {
		"Anakin Skywalker",
		"Obi-Wan Kenobi",
		"Plo Koon",
		"Grand Master Yoda",
		"Ahsoka Tano",
		"Mace Windu",
	}
	dropDownHeroesStringListLength = table.getn(dropDownHeroesStringList)

	local destMapCycle = this.minipage.mySection.dropdownMapCycle
	local dropDownMapCycleStringList = {
		"Day time",
		"Night time"
	}
	dropDownMapCycleStringListLength = table.getn(dropDownMapCycleStringList)

	--READ! When adding a new dropdown, add it to this table!
	destDropdown = {
		dest,
		destExtra,
		destHeroes,
		destMapCycle
	}



	if dest.expanded == true then
		IFObj_fnSetVis(dest.listbox, true)
		ListManager_fnAutoscroll(dest.listbox, dropDownLegionStringList, POC_minipag_dropdown_layout.lst)
		POC_minipage_dropDownCloseOthers(this, dest)
		--------------------------------------------------------
	else
		IFObj_fnSetVis(dest.listbox, false)
		local selectedString = dropDownLegionStringList[rema_database.data.legion]
		RoundIFButtonLabel_fnSetString(dest.button, selectedString)
	end


	if destExtra.expanded == true then
		IFObj_fnSetVis(destExtra.listbox, true)
		ListManager_fnAutoscroll(destExtra.listbox, dropDownExtraStringList, POC_minipag_dropdown_extra_layout.lst)
		POC_minipage_dropDownCloseOthers(this, destExtra)
		--------------------------------------------------------
	else
		IFObj_fnSetVis(destExtra.listbox, false)
		local selectedStringExtra = dropDownExtraStringList[rema_database.data.extraUnit]
		RoundIFButtonLabel_fnSetString(destExtra.button, selectedStringExtra)
	end


	if destHeroes.expanded == true then
		IFObj_fnSetVis(destHeroes.listbox, true)
		ListManager_fnAutoscroll(destHeroes.listbox, dropDownHeroesStringList, POC_minipag_dropdown_heroes_layout.lst)
		POC_minipage_dropDownCloseOthers(this, destHeroes)
		--------------------------------------------------------
	else
		IFObj_fnSetVis(destHeroes.listbox, false)
		local selectedStringHeroes = dropDownHeroesStringList[rema_database.data.chosenHero]
		RoundIFButtonLabel_fnSetString(destHeroes.button, selectedStringHeroes)
	end

	if destMapCycle.expanded == true then
		IFObj_fnSetVis(destMapCycle.listbox, true)
		ListManager_fnAutoscroll(destMapCycle.listbox, dropDownMapCycleStringList, POC_minipag_dropdown_mapCycle_layout.lst)
		POC_minipage_dropDownCloseOthers(this, destMapCycle)
		--------------------------------------------------------
	else
		IFObj_fnSetVis(destMapCycle.listbox, false)
		local selectedStringMapCycle = dropDownMapCycleStringList[rema_database.data.chosenDayTime]
		RoundIFButtonLabel_fnSetString(destMapCycle.button, selectedStringMapCycle)
	end

end



function POC_minipage_dropDownCloseOthers(this, drop)
	for key, value in pairs(destDropdown) do
		--print(key, value.tag, drop.tag)
		if (drop.tag ~= "_dropdown_" .. value.tag) then -- the "_dropdown_" is needed, otherwise the comparison will not work.
			value.expanded = false
		end
	 end
end



function POC_minipage_enter(this, bFwd)
	
	-- init default value if nothing is saved
	-- remember this value will be available ingame
	if rema_database.data.legion == nil then
		rema_database.data.legion = 1
	end

	if rema_database.data.extraUnit == nil then
		rema_database.data.extraUnit = 1
	end

	if rema_database.data.chosenHero == nil then
		rema_database.data.chosenHero = 1
	end

	if rema_database.data.chosenDayTime == nil then
		rema_database.data.chosenDayTime = 1
	end

	if rema_database.data.phase1 == nil then
		rema_database.data.phase1 = false
	end

	if rema_database.data.randomLegion == nil then
		rema_database.data.randomLegion = false
	end

	if rema_database.data.randomSP == nil then
		rema_database.data.randomSP = false
	end

	if rema_database.data.randomHeroes == nil then
		rema_database.data.randomHeroes = false
	end

	if rema_database.data.randomCycle == nil then
		rema_database.data.randomCycle = false
	end

	-- let's fill our dropdown with data
	POC_minipage_updateDropdownList(this)
end



function POC_minipage_exit(this)
	POC_printCurrentSettings()
end



function POC_handle_input(this)
	
	-- Dropdown list element hit
	if gMouseListBox == this.minipage.mySection.dropdownLegions.listbox then
		-- close dropdown
		this.minipage.mySection.dropdownLegions.expanded = false
		
		local newIdx = gMouseListBox.Layout.CursorIdx
		if newIdx and not (newIdx > dropDownLegionStringListLength) then
			if newIdx ~= rema_database.data.legion then
				rema_database.data.legion = newIdx
			end
		end
		
		POC_minipage_updateDropdownList(this)
	end

	if gMouseListBox == this.minipage.mySection.dropdownExtra.listbox then
		this.minipage.mySection.dropdownExtra.expanded = false
		
		local newIdx = gMouseListBox.Layout.CursorIdx
		if newIdx and not (newIdx > dropDownExtraStringListLength) then
			if newIdx ~= rema_database.data.extraUnit then
				rema_database.data.extraUnit = newIdx
			end
		end
		
		POC_minipage_updateDropdownList(this)
	end

	if gMouseListBox == this.minipage.mySection.dropdownHeroes.listbox then
		this.minipage.mySection.dropdownHeroes.expanded = false
		
		local newIdx = gMouseListBox.Layout.CursorIdx
		if newIdx and not (newIdx > dropDownHeroesStringListLength) then
			if newIdx ~= rema_database.data.chosenHero then
				rema_database.data.chosenHero = newIdx
			end
		end
		
		POC_minipage_updateDropdownList(this)
	end

	if gMouseListBox == this.minipage.mySection.dropdownMapCycle.listbox then
		this.minipage.mySection.dropdownMapCycle.expanded = false
		
		local newIdx = gMouseListBox.Layout.CursorIdx
		if newIdx and not (newIdx > dropDownMapCycleStringListLength) then
			if newIdx ~= rema_database.data.chosenDayTime then
				rema_database.data.chosenDayTime = newIdx
			end
		end
		
		POC_minipage_updateDropdownList(this)
	end

	-- default handle (listbox scrolls for example)
	if gShellScreen_fnDefaultInputAccept(this, false) then
		return
	end

	if(this.CurButton == "yesPhase1") then
		if(rema_database.data.phase1) then
			rema_database.data.phase1 = false
			IFImage_fnSetTexture(this.minipage.TickBoxContainer.phase1TickBoxContainer.phase1TickBox,"check_no")
		else
			rema_database.data.phase1 = true
			IFImage_fnSetTexture(this.minipage.TickBoxContainer.phase1TickBoxContainer.phase1TickBox,"check_yes")
		end
		ifelm_shellscreen_fnPlaySound(this.acceptSound)

	elseif(this.CurButton == "yesRandomLegion") then
		if(rema_database.data.randomLegion) then
			rema_database.data.randomLegion = false
			IFImage_fnSetTexture(this.minipage.TickBoxContainer.randomizerContainer.randomLegionTickBox,"check_no")
		else
			rema_database.data.randomLegion = true
			IFImage_fnSetTexture(this.minipage.TickBoxContainer.randomizerContainer.randomLegionTickBox,"check_yes")
		end
		ifelm_shellscreen_fnPlaySound(this.acceptSound)

	elseif(this.CurButton == "yesRandomSP") then
		if(rema_database.data.randomSP) then
			rema_database.data.randomSP = false
			IFImage_fnSetTexture(this.minipage.TickBoxContainer.randomizerContainer.randomSPTickBox,"check_no")
		else
			rema_database.data.randomSP = true
			IFImage_fnSetTexture(this.minipage.TickBoxContainer.randomizerContainer.randomSPTickBox,"check_yes")
		end
		ifelm_shellscreen_fnPlaySound(this.acceptSound)

	elseif(this.CurButton == "yesRandomHeroes") then
		if(rema_database.data.randomHeroes) then
			rema_database.data.randomHeroes = false
			IFImage_fnSetTexture(this.minipage.TickBoxContainer.randomizerContainer.randomHeroesTickBox,"check_no")
		else
			rema_database.data.randomHeroes = true
			IFImage_fnSetTexture(this.minipage.TickBoxContainer.randomizerContainer.randomHeroesTickBox,"check_yes")
		end
		ifelm_shellscreen_fnPlaySound(this.acceptSound)

	elseif(this.CurButton == "yesRandomCycle") then
		if(rema_database.data.randomCycle) then
			rema_database.data.randomCycle = false
			IFImage_fnSetTexture(this.minipage.TickBoxContainer.randomizerContainer.randomCycleTickBox,"check_no")
		else
			rema_database.data.randomCycle = true
			IFImage_fnSetTexture(this.minipage.TickBoxContainer.randomizerContainer.randomCycleTickBox,"check_yes")
		end
		ifelm_shellscreen_fnPlaySound(this.acceptSound)

	elseif this.CurButton ~= nil and string.sub(this.CurButton, 13, 23) == "dropMyLife" then --READ! string.find is slow, using string.sub instead. Compares letters 13 to 23 with the String "dropMyLife". We start at 13 cause before that comes "_ifeDropBtn_" (so, the whole string would be _ifeDropBtn_dropMyLife)
		this.minipage.mySection.dropdownLegions.expanded = not this.minipage.mySection.dropdownLegions.expanded
		POC_minipag_dropdown_layout.lst.SelectedIdx = rema_database.data.legion
		POC_minipag_dropdown_layout.lst.CursorIdx = rema_database.data.legion
		POC_minipag_dropdown_layout.lst.FirstShownIdx = rema_database.data.legion

	elseif this.CurButton ~= nil and string.sub(this.CurButton, 13, 25) == "dropdownExtra" then
		this.minipage.mySection.dropdownExtra.expanded = not this.minipage.mySection.dropdownExtra.expanded
		POC_minipag_dropdown_heroes_layout.lst.SelectedIdx = rema_database.data.extraUnit
		POC_minipag_dropdown_heroes_layout.lst.CursorIdx = rema_database.data.extraUnit
		POC_minipag_dropdown_heroes_layout.lst.FirstShownIdx = rema_database.data.extraUnit

	elseif this.CurButton ~= nil and string.sub(this.CurButton, 13, 26) == "dropdownHeroes" then
		this.minipage.mySection.dropdownHeroes.expanded = not this.minipage.mySection.dropdownHeroes.expanded
		POC_minipag_dropdown_heroes_layout.lst.SelectedIdx = rema_database.data.chosenHero
		POC_minipag_dropdown_heroes_layout.lst.CursorIdx = rema_database.data.chosenHero
		POC_minipag_dropdown_heroes_layout.lst.FirstShownIdx = rema_database.data.chosenHero

	elseif this.CurButton ~= nil and string.sub(this.CurButton, 13, 28) == "dropdownMapCycle" then
		this.minipage.mySection.dropdownMapCycle.expanded = not this.minipage.mySection.dropdownMapCycle.expanded
		POC_minipag_dropdown_heroes_layout.lst.SelectedIdx = rema_database.data.chosenDayTime
		POC_minipag_dropdown_heroes_layout.lst.CursorIdx = rema_database.data.chosenDayTime
		POC_minipag_dropdown_heroes_layout.lst.FirstShownIdx = rema_database.data.chosenDayTime

	--elseif this.minipage.mySection.dropdownLegions.expanded == true then
	--	this.minipage.mySection.dropdownLegions.expanded = false

	--elseif this.minipage.mySection.dropdownExtra.expanded == true then
	--	this.minipage.mySection.dropdownExtra.expanded	= false

	--elseif this.minipage.mySection.dropdownHeroes.expanded == true then
	--	this.minipage.mySection.dropdownHeroes.expanded	= false

	end
	POC_minipage_updateDropdownList(this)
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
		mySection = NewIFContainer{

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
				--textw = 400, --Why do we need this? Simple! "Special Operations" is a long string and will NOT show properly without it!
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
	ifelem_minipage_setRelativePos(elements.mySection, 0.0, 0.1)
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



function POC_printCurrentSettings()
	print("POC: legion: ", rema_database.data.legion)
	print("POC: extraUnit: ", rema_database.data.extraUnit)
	print("POC: chosenHero: ", rema_database.data.chosenHero)
	print("POC: chosenDayTime: ", rema_database.data.chosenDayTime)
	print("POC: phase 1: ", rema_database.data.phase1)
	print("POC: randomLegion: ", rema_database.data.randomLegion)
	print("POC: randomSP: ", rema_database.data.randomSP)
	print("POC: randomHeroes: ", rema_database.data.randomHeroes)
	print("POC: randomCycle: ", rema_database.data.randomCycle)
end



--Listen well
--I noticed that sometimes, some of the booleans are saved, the debugger would show true even if the texture was unticked
--It makes sense, they werent nil so they werent set to false, but the texture for the tickboxes are always "check_no" when booting up
--This shows the actual state, so one will not get fooled.
function showActualTexture(bState)
	if(bState) then
		return "check_yes"
	else
		return "check_no"
	end
end

POC_fnBuildMinipage()