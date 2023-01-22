print("POC Customization loading...")

--Incase some values were saved. Well, now they're not!
local repunit1 = nil
local repunit2 = nil
local repunit3 = nil
local repunit4 = nil
local repunit5 = nil
local repunit6 = nil
local repunit7 = nil
local repunit8 = nil
local repunit9 = nil
local specialoperations = nil

local cisunit1 = nil
local cisunit2 = nil
local cisunit3 = nil
local cisunit4 = nil
local cisunit5 = nil
local cisunit6 = nil
local cisunit7 = nil
local cisunit8 = nil
--local cisunit9 = nil



function SetupCustomizedMatch()
    randomizeSides()
    loadUnits(rema_database.data.legion)
    loadSpecial(rema_database.data.extraUnit)
    loadHeroes(rema_database.data.chosenHero)
    if(repunit9 ~= nil) then
        NewSetupTeams(4)
        print("POC: RepUnit9 is not nil!")
    elseif(repunit8 ~= nil) then
        NewSetupTeams(3)
        print("POC: RepUnit8 is not nil!")
    elseif(repunit7 ~= nil) then
        NewSetupTeams(2)
        print("POC: RepUnit7 is not nil!")
    else
        NewSetupTeams(1)
        print("POC: Loading default roster!")
    end
end



function SetupMap()
    if(rema_database.data.randomCycle ~= nil and rema_database.data.randomCycle == true) then
        rema_database.data.chosenDayTime = math.random(1, 2) --Rema database is failing here, update when adding entries!
    end

    loadMap(rema_database.data.chosenDayTime)
end



function randomizeSides()
    if(rema_database.data.randomLegion ~= nil and rema_database.data.randomLegion == true) then
        rema_database.data.legion = math.random(1, 8) --Rema database is failing here, update when adding entries!
    end
    if(rema_database.data.randomSP ~= nil and rema_database.data.randomSP == true) then
        rema_database.data.extraUnit = math.random(1, 10) --Rema database is failing here, update when adding entries!
    end
    if(rema_database.data.randomHeroes ~= nil and rema_database.data.randomHeroes == true) then
        rema_database.data.chosenHero = math.random(1, 6) --Rema database is failing here, update when adding entries!
    end
end



function loadUnits(id)
    
    if(id == 1) or (id == nil) then
        print("POC Customization: ID is 1")
        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\galactic_republic.lvl",
            "rep_inf_commander_vain",
            "rep_inf_clone_trooper",
            "rep_inf_clone_trooper_sergeant",
            "rep_inf_clone_medic",
            "rep_inf_clone_engineer",
            "rep_inf_clone_sniper",
            "rep_inf_clone_jettrooper",
            "rep_inf_clone_marine")

            repunit1 = "rep_inf_clone_trooper"
            repunit2 = "rep_inf_clone_marine"
            repunit3 = "rep_inf_clone_sniper"
            repunit4 = "rep_inf_clone_engineer"
            repunit5 = "rep_inf_clone_medic"
            repunit6 = "rep_inf_clone_trooper_sergeant"
            repunit7 = "rep_inf_clone_jettrooper"
            repunit8 = "rep_inf_commander_vain"

    elseif(id == 2) then
        print("POC Customization: ID is 2")
        if(rema_database.data.phase1) then
            ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\galactic_republic.lvl",
            "rep_inf_501st_legion_clone_trooper_phase1",
            "rep_inf_501st_legion_clone_rocketeer_phase1",
            "rep_inf_501st_legion_clone_sniper_phase1",
            "rep_inf_501st_legion_clone_engineer_phase1",
            "rep_inf_501st_legion_clone_gunner_phase1",
            "rep_inf_captain_rex_phase1",
            "rep_inf_sergeant_denal")
            
            repunit1 = "rep_inf_501st_legion_clone_trooper_phase1"
            repunit2 = "rep_inf_501st_legion_clone_rocketeer_phase1"
            repunit3 = "rep_inf_501st_legion_clone_sniper_phase1"
            repunit4 = "rep_inf_501st_legion_clone_engineer_phase1"
            repunit5 = "rep_inf_501st_legion_clone_gunner_phase1"
            repunit6 = "rep_inf_sergeant_denal"
            repunit7 = "rep_inf_captain_rex_phase1"
        else
            ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\galactic_republic.lvl",
            "rep_inf_501st_legion_clone_trooper",
            "rep_inf_501st_legion_clone_rocketeer",
            "rep_inf_501st_legion_clone_sniper",
            "rep_inf_501st_legion_clone_engineer",
            "rep_inf_501st_legion_clone_medic",
            "rep_inf_501st_legion_clone_gunner",
            "rep_inf_501st_legion_jet_trooper",
            "rep_inf_arc_trooper_fives")
            
            repunit1 = "rep_inf_501st_legion_clone_trooper"
            repunit2 = "rep_inf_501st_legion_clone_rocketeer"
            repunit3 = "rep_inf_501st_legion_clone_sniper"
            repunit4 = "rep_inf_501st_legion_clone_engineer"
            repunit5 = "rep_inf_501st_legion_clone_medic"
            repunit6 = "rep_inf_501st_legion_clone_gunner"
            repunit7 = "rep_inf_501st_legion_jet_trooper"
            repunit8 = "rep_inf_arc_trooper_fives"
        end
        

    elseif(id == 3) then
        print("POC Customization: ID is 3")

        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\rep_uta.lvl",
            "rep_inf_212th_trooper",
            "rep_inf_212th_rocketeer",
            "rep_inf_212th_sniper",
            "rep_inf_212th_engineer",
            "rep_inf_212th_medic",
            "rep_inf_212th_gunner",
            "rep_inf_212th_jet_trooper")

        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\galactic_republic.lvl",
            "rep_inf_marshal_commander_cody")

            repunit1 = "rep_inf_212th_trooper"
            repunit2 = "rep_inf_212th_rocketeer"
            repunit3 = "rep_inf_212th_sniper"
            repunit4 = "rep_inf_212th_engineer"
            repunit5 = "rep_inf_212th_medic"
            repunit6 = "rep_inf_212th_gunner"
            repunit7 = "rep_inf_212th_jet_trooper"
            repunit8 = "rep_inf_marshal_commander_cody"
            
    elseif(id == 4) then
        print("POC Customization: ID is 4")

        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\galactic_republic.lvl",
            "rep_inf_104th_battalion_wolfpack_trooper",
            "rep_inf_104th_battalion_wolfpack_rocketeer",
            "rep_inf_104th_battalion_wolfpack_sniper",
            "rep_inf_104th_battalion_wolfpack_engineer",
            "rep_inf_104th_battalion_wolfpack_medic",
            "rep_inf_104th_battalion_wolfpack_gunner",
            "rep_inf_104th_battalion_wolfpack_jet_trooper",
            "rep_inf_commander_wolffe")
            
            repunit1 = "rep_inf_104th_battalion_wolfpack_trooper"
            repunit2 = "rep_inf_104th_battalion_wolfpack_rocketeer"
            repunit3 = "rep_inf_104th_battalion_wolfpack_sniper"
            repunit4 = "rep_inf_104th_battalion_wolfpack_engineer"
            repunit5 = "rep_inf_104th_battalion_wolfpack_medic"
            repunit6 = "rep_inf_104th_battalion_wolfpack_gunner"
            repunit7 = "rep_inf_104th_battalion_wolfpack_jet_trooper"
            repunit8 = "rep_inf_commander_wolffe"

    elseif(id == 5) then
        print("POC Customization: ID is 5")

        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\galactic_republic.lvl",
            "rep_inf_5th_trooper",
            "rep_inf_5th_rocketeer",
            "rep_inf_5th_sniper",
            "rep_inf_5th_engineer",
            "rep_inf_5th_gunner",
            "rep_inf_5th_commander",
            "rep_inf_5th_commando")

            repunit1 = "rep_inf_5th_trooper"
            repunit2 = "rep_inf_5th_rocketeer"
            repunit3 = "rep_inf_5th_sniper"
            repunit4 = "rep_inf_5th_engineer"
            repunit5 = "rep_inf_5th_gunner"
            repunit6 = "rep_inf_5th_commando"
            repunit7 = "rep_inf_5th_commander"

    elseif(id == 6) then
        print("POC Customization: ID is 6")
        if(rema_database.data.phase1) then
            ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\galactic_republic.lvl",
            "rep_inf_coruscant_guard_shock_trooper_phase1",
            "rep_inf_coruscant_guard_shock_rocketeer_phase1",
            "rep_inf_coruscant_guard_shock_sniper_phase1",
            "rep_inf_coruscant_guard_shock_medic_phase1",
            "rep_inf_senate_commando",
            "rep_inf_senate_commando_captain",
            "rep_inf_coruscant_guard_riot_trooper_phase1",
            "rep_inf_commander_stone")

            repunit1 = "rep_inf_coruscant_guard_shock_trooper_phase1"
            repunit2 = "rep_inf_coruscant_guard_shock_rocketeer_phase1"
            repunit3 = "rep_inf_coruscant_guard_shock_sniper_phase1"
            repunit4 = "rep_inf_coruscant_guard_shock_medic_phase1"
            repunit5 = "rep_inf_senate_commando"
            repunit6 = "rep_inf_senate_commando_captain"
            repunit7 = "rep_inf_coruscant_guard_riot_trooper_phase1"
            repunit8 = "rep_inf_commander_stone"
        else
            ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\galactic_republic.lvl",
            "rep_inf_coruscant_guard_shock_trooper",
            "rep_inf_coruscant_guard_shock_rocketeer",
            "rep_inf_coruscant_guard_shock_sniper",
            "rep_inf_coruscant_guard_shock_medic",
            "rep_inf_senate_commando",
            "rep_inf_senate_commando_captain",
            "rep_inf_coruscant_guard_riot_trooper",
            "rep_inf_commander_thorn")

            repunit1 = "rep_inf_coruscant_guard_shock_trooper"
            repunit2 = "rep_inf_coruscant_guard_shock_rocketeer"
            repunit3 = "rep_inf_coruscant_guard_shock_sniper"
            repunit4 = "rep_inf_coruscant_guard_shock_medic"
            repunit5 = "rep_inf_senate_commando"
            repunit6 = "rep_inf_senate_commando_captain"
            repunit7 = "rep_inf_coruscant_guard_riot_trooper"
            repunit8 = "rep_inf_commander_thorn"
        end

    elseif(id == 7) then
        print("POC Customization: ID is 7")

        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\galactic_republic.lvl",
            "rep_inf_galactic_marine",
            "rep_inf_galactic_marine_rocketeer",
            "rep_inf_galactic_marine_sniper",
            "rep_inf_galactic_marine_engineer",
            "rep_inf_galactic_marine_gunner",
            "rep_inf_Commander_Bacara")

            repunit1 = "rep_inf_galactic_marine"
            repunit2 = "rep_inf_galactic_marine_rocketeer"
            repunit3 = "rep_inf_galactic_marine_sniper"
            repunit4 = "rep_inf_galactic_marine_engineer"
            repunit5 = "rep_inf_galactic_marine_gunner"
            repunit6 = "rep_inf_Commander_Bacara"

    else
        print("POC Customization: ID is 8 or greater")

        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\galactic_republic.lvl",
            "rep_inf_galactic_marine_kellers_unit_backpackless",
            "rep_inf_galactic_marine_kellers_unit_rocketeer",
            "rep_inf_galactic_marine_kellers_unit_sniper_backpackless",
            "rep_inf_galactic_marine_kellers_unit_engineer",
            "rep_inf_galactic_marine_kellers_unit_gunner",
            "rep_inf_commander_keller")

            repunit1 = "rep_inf_galactic_marine_kellers_unit_backpackless"
            repunit2 = "rep_inf_galactic_marine_kellers_unit_rocketeer"
            repunit3 = "rep_inf_galactic_marine_kellers_unit_sniper_backpackless"
            repunit4 = "rep_inf_galactic_marine_kellers_unit_engineer"
            repunit5 = "rep_inf_galactic_marine_kellers_unit_gunner"
            repunit6 = "rep_inf_commander_keller"

    end

    ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\separatist_alliance.lvl",
        "cis_inf_b1_battle_droid",
        "cis_inf_security_b1_battle_droid",
        "cis_inf_b1_battle_droid_sniper",
        "cis_inf_b1_battle_droid_engineer",
        "cis_inf_b2_super_battle_droid",
        "cis_inf_b2_super_battle_droid_commander",
        "cis_inf_droideka",
        "cis_inf_oom_command_battle_droid",
        "cis_inf_ig-100_magnaguard",
        "cis_inf_count_dooku")

    if(rema_database.data.phase1) then
        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\separatist_alliance.lvl",
        "cis_inf_ig-100_magnaguard_season1")
        cisunit7 = "cis_inf_ig-100_magnaguard_season1"
    else 
        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\separatist_alliance.lvl",
        "cis_inf_ig-100_magnaguard")
        cisunit7 = "cis_inf_ig-100_magnaguard"
    end

        cisunit1 = "cis_inf_b1_battle_droid"
        cisunit2 = "cis_inf_security_b1_battle_droid"
        cisunit3 = "cis_inf_b1_battle_droid_sniper"
        cisunit4 = "cis_inf_b1_battle_droid_engineer"
        cisunit5 = "cis_inf_b2_super_battle_droid"
        cisunit6 = "cis_inf_droideka"
        cisunit8 = "cis_inf_oom_command_battle_droid"
        cishero = "cis_inf_count_dooku"

        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SOUND\\DOK.lvl;DOKcw")

end



function loadSpecial(id)
    if(id == 1) or (id == nil) then
        print("POC: No special unit!")
    elseif(id == 2) then
        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\galactic_republic.lvl","rep_inf_boss")
        specialoperations = "rep_inf_boss"
    elseif(id == 3) then
        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\galactic_republic.lvl","rep_inf_fixer")
        specialoperations = "rep_inf_fixer"
    elseif(id == 4) then
        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\galactic_republic.lvl","rep_inf_sev")
        specialoperations = "rep_inf_sev"
    elseif(id == 5) then
        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\galactic_republic.lvl","rep_inf_scorch")
        specialoperations = "rep_inf_scorch"
    elseif(id == 6) then
        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\rep_uta.lvl","rep_inf_gregor")
        specialoperations = "rep_inf_gregor"
    elseif(id == 7) then
        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\galactic_republic.lvl",
            "rep_inf_scorch",
            "rep_inf_sev",
            "rep_inf_fixer",
            "rep_inf_boss")
        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\bad_batch.lvl","rep_inf_bad_batch_crosshair")
        specialoperations = "rep_inf_bad_batch_crosshair"
    elseif(id == 8) then
        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\galactic_republic.lvl",
            "rep_inf_scorch",
            "rep_inf_sev",
            "rep_inf_fixer",
            "rep_inf_boss")
        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\bad_batch.lvl","rep_inf_bad_batch_hunter")
        specialoperations = "rep_inf_bad_batch_hunter"
    elseif(id == 9) then
        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\galactic_republic.lvl",
            "rep_inf_scorch",
            "rep_inf_sev",
            "rep_inf_fixer",
            "rep_inf_boss",
            "rep_inf_captain_rex")
        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\bad_batch.lvl","rep_inf_bad_batch_tech")
        specialoperations = "rep_inf_bad_batch_tech"
    elseif(id == 10) then
        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\galactic_republic.lvl",
            "rep_inf_scorch",
            "rep_inf_sev",
            "rep_inf_fixer",
            "rep_inf_boss",
            "rep_inf_captain_rex")
        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\bad_batch.lvl","rep_inf_bad_batch_wrecker")
        specialoperations = "rep_inf_bad_batch_wrecker"
    end

end



function loadHeroes(id)
    if(id == 1) or (id == nil) then
        if(rema_database.data.phase1) then
            ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\galactic_republic.lvl",
            "rep_inf_anakin_skywalker_season1")
            rephero = "rep_inf_anakin_skywalker_season1"
            ReadDataFile("dc:sound\\R2D.lvl;R2Dcw")
        else
            ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\galactic_republic.lvl",
            "rep_inf_anakin_skywalker")
            rephero = "rep_inf_anakin_skywalker"
        end 
        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SOUND\\ANI.lvl;ANIcw")
        

    elseif(id == 2) then
        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\rep_uta.lvl",
            "rep_hero_obiwan")
        rephero = "rep_hero_obiwan"

    elseif(id == 3) then
        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\galactic_republic.lvl",
            "rep_inf_plo_koon")
        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SOUND\\PLO.lvl;PLOcw")
        rephero = "rep_inf_plo_koon"

    elseif(id == 4) then
        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\galactic_republic.lvl",
            "rep_inf_grand_master_yoda")
        rephero = "rep_inf_grand_master_yoda"

    elseif(id == 5) then
        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\c2.lvl",
            "c2_inf_ahsoka_tano")
        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SOUND\\AHSOKA_TANO.lvl;AHSOKA_TANOcw")
        rephero = "c2_inf_ahsoka_tano"

    elseif(id == 6) then
        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\galactic_republic.lvl",
            "rep_inf_mace_windu")
        rephero = "rep_inf_mace_windu"
    end

end



function loadMap(id)
    if(id == 1) or (id == nil) then
        print("POC: Customization: Map is day time...")
        ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\995\\tat2.lvl", "tat2_con")
    elseif(id == 2) then
        print("POC: Customization: Map is night time...")
        ReadDataFile("..\\..\\addon\\POC\\data\\_LVL_PC\\POC\\tat2.lvl", "tat2_con")
    end
end



function NewSetupTeams(id, idSP) --id == how many extra units you want to add to the base roster. 1 is none, 2 is 1, 3 is 2 and 4 is 3. This is why shit starts at 0, dear lua
    local Teams = {
        rep = {
            team = REP,
            units = 32,
            reinforcements = 300,
            soldier = {repunit1,12, 12},
            assault = {repunit2,6, 6},
            sniper  = {repunit3,4, 4},
            engineer = {repunit4,4, 4},
            officer  = {repunit5,3, 3},
            special  = {repunit6,3, 3},
        },
    
        cis = {
            team = CIS,
            units = 32,
            reinforcements = 300,
            soldier = {cisunit1,10, 10},
            assault = {cisunit2,6, 6},
            sniper = {cisunit3,4, 4}, 
            engineer = {cisunit4,4, 4},
            officer = {cisunit5,3, 3},
            special = {cisunit6,2, 2},
            extra1 = {cisunit7,2, 2},
            extra2 = {cisunit8,1,1},
        }
    }
    if(id == 1) then
        print("POC: No extra units!")
    elseif(id == 2) then
        Teams.rep.extra1 = {repunit7,2,2}
    elseif(id == 3) then
        Teams.rep.extra1 = {repunit7,2,2}
        Teams.rep.extra2 = {repunit8,1,1}
    elseif(id == 4) then
        Teams.rep.extra1 = {repunit7,2,2}
        Teams.rep.extra2 = {repunit8,1,1}
        Teams.rep.extra3 = {repunit9,1,1}
    end
    if (specialoperations~=nil) then
        Teams.rep.specialoperations = {specialoperations,1,1} --Add the unit to the table
    end 
    SetupTeams(Teams)
    SetHeroClass(REP, rephero)
    SetHeroClass(CIS, cishero)
end