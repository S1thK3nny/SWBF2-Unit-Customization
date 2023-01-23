--STAR WARS BATTLEFRONT II - CUSTOMIZATION
--Script written by S1thK3nny
--Work it harder, make it better, do it faster, makes us stronger


print("POC Customization loading...")


--Incase some values were saved. Well, now they're not!
local repunit = {}
local specialoperations = nil
local rephero = nil

local cisunit = {}
local cishero = nil



function SetupCustomizedMatch()

    randomizeSides()
    loadUnits(rema_database.data.legion, republic_units, repunit)
    loadUnits(1, separatist_units, cisunit) --ergh...yeah considering there isn't even a dropdown for this, let's go with 1
    loadSpecial(rema_database.data.extraUnit)
    rephero = loadHeroes(rema_database.data.chosenHero, republic_heroes)
    cishero = loadHeroes(1, separatist_heroes)

    if(repunit[9] ~= nil) then
        NewSetupTeams(4)
        print("POC: RepUnit9 is not nil!")
    elseif(repunit[8] ~= nil) then
        NewSetupTeams(3)
        print("POC: RepUnit8 is not nil!")
    elseif(repunit[7] ~= nil) then
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

republic_units = {
    {id = 1, units = {
        "rep_inf_clone_trooper",
        "rep_inf_clone_marine",
        "rep_inf_clone_sniper",
        "rep_inf_clone_engineer",
        "rep_inf_clone_medic",
        "rep_inf_clone_trooper_sergeant",
        "rep_inf_clone_jettrooper",
        "rep_inf_commander_vain",
        
    }, side = "galactic_republic.lvl"},

    {id = 2, units = {
        "rep_inf_501st_legion_clone_trooper",
        "rep_inf_501st_legion_clone_rocketeer",
        "rep_inf_501st_legion_clone_sniper",
        "rep_inf_501st_legion_clone_engineer",
        "rep_inf_501st_legion_clone_medic",
        "rep_inf_501st_legion_clone_gunner",
        "rep_inf_501st_legion_jet_trooper",
        "rep_inf_arc_trooper_fives",
    }, side = "galactic_republic.lvl",
    phase1variant = {
        "rep_inf_501st_legion_clone_trooper_phase1",
        "rep_inf_501st_legion_clone_rocketeer_phase1",
        "rep_inf_501st_legion_clone_sniper_phase1",
        "rep_inf_501st_legion_clone_engineer_phase1",
        "rep_inf_501st_legion_clone_gunner_phase1",
        "rep_inf_sergeant_denal",
        "rep_inf_captain_rex_phase1",
    }},

    {id = 3, units = {
        "rep_inf_212th_trooper",
        "rep_inf_212th_rocketeer",
        "rep_inf_212th_sniper",
        "rep_inf_212th_engineer",
        "rep_inf_212th_medic",
        "rep_inf_212th_gunner",
        "rep_inf_212th_jet_trooper",
    }, side = "rep_uta.lvl"},

    {id = 4, units = {
        "rep_inf_104th_battalion_wolfpack_trooper",
        "rep_inf_104th_battalion_wolfpack_rocketeer",
        "rep_inf_104th_battalion_wolfpack_sniper",
        "rep_inf_104th_battalion_wolfpack_engineer",
        "rep_inf_104th_battalion_wolfpack_medic",
        "rep_inf_104th_battalion_wolfpack_gunner",
        "rep_inf_104th_battalion_wolfpack_jet_trooper",
        "rep_inf_commander_wolffe",
    }, side = "galactic_republic.lvl"},

    {id = 5, units = {
        "rep_inf_5th_trooper",
        "rep_inf_5th_rocketeer",
        "rep_inf_5th_sniper",
        "rep_inf_5th_engineer",
        "rep_inf_5th_gunner",
        "rep_inf_5th_commander",
        "rep_inf_5th_commando",
    }, side = "galactic_republic.lvl"},

    {id = 6, units = {
        "rep_inf_coruscant_guard_shock_trooper",
        "rep_inf_coruscant_guard_shock_rocketeer",
        "rep_inf_coruscant_guard_shock_sniper",
        "rep_inf_coruscant_guard_shock_medic",
        "rep_inf_senate_commando",
        "rep_inf_senate_commando_captain",
        "rep_inf_coruscant_guard_riot_trooper",
        "rep_inf_commander_thorn",
    }, side = "galactic_republic.lvl",
    phase1variant = {
        "rep_inf_coruscant_guard_shock_trooper_phase1",
        "rep_inf_coruscant_guard_shock_rocketeer_phase1",
        "rep_inf_coruscant_guard_shock_sniper_phase1",
        "rep_inf_coruscant_guard_shock_medic_phase1",
        "rep_inf_senate_commando",
        "rep_inf_senate_commando_captain",
        "rep_inf_coruscant_guard_riot_trooper_phase1",
        "rep_inf_commander_stone",
    }},

    {id = 7, units = {
        "rep_inf_galactic_marine",
        "rep_inf_galactic_marine_rocketeer",
        "rep_inf_galactic_marine_sniper",
        "rep_inf_galactic_marine_engineer",
        "rep_inf_galactic_marine_gunner",
        "rep_inf_Commander_Bacara",
    }, side = "galactic_republic.lvl"},

    {id = 8, units = {
        "rep_inf_galactic_marine_kellers_unit_backpackless",
        "rep_inf_galactic_marine_kellers_unit_rocketeer",
        "rep_inf_galactic_marine_kellers_unit_sniper_backpackless",
        "rep_inf_galactic_marine_kellers_unit_engineer",
        "rep_inf_galactic_marine_kellers_unit_gunner",
        "rep_inf_commander_keller",
    }, side = "galactic_republic.lvl"},
}

separatist_units = {
    {id = 1, units = {
        "cis_inf_b1_battle_droid",
        "cis_inf_security_b1_battle_droid",
        "cis_inf_b1_battle_droid_sniper",
        "cis_inf_b1_battle_droid_engineer",
        "cis_inf_b2_super_battle_droid",
        "cis_inf_b2_super_battle_droid_commander",
        "cis_inf_droideka",
        "cis_inf_oom_command_battle_droid",
        "cis_inf_ig-100_magnaguard",
        "cis_inf_count_dooku",
    }, side = "separatist_alliance.lvl",
    phase1variant = {
        "cis_inf_b1_battle_droid",
        "cis_inf_security_b1_battle_droid",
        "cis_inf_b1_battle_droid_sniper",
        "cis_inf_b1_battle_droid_engineer",
        "cis_inf_b2_super_battle_droid",
        "cis_inf_b2_super_battle_droid_commander",
        "cis_inf_droideka",
        "cis_inf_oom_command_battle_droid",
        "cis_inf_ig-100_magnaguard_season1",
        "cis_inf_count_dooku",
    }},
}

function loadUnits(id, unittable, sidetable) --rema id from the IF, table to be loaded, rep or cis
    if id == nil then id = 1 end
    for i, unit in ipairs(unittable) do
        if unit.id == id then
            print("POC Customization: ID is ", id)
            if(rema_database.data.phase1 and unit.phase1variant~=nil) then
                ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\" .. unit.side, unpack(unit.phase1variant))
                for i = 1, table.getn(unit.phase1variant) do
                    sidetable[i] = unit.phase1variant[i]
                end
                break
            else
                ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\" .. unit.side, unpack(unit.units))
                for i = 1, table.getn(unit.units) do
                    sidetable[i] = unit.units[i]
                end
                break
            end
        end
    end
end



special = {
    {id = 2, unit = "rep_inf_boss", side = "galactic_republic.lvl"},
    {id = 3, unit = "rep_inf_fixer", side = "galactic_republic.lvl"},
    {id = 4, unit = "rep_inf_sev", side = "galactic_republic.lvl"},
    {id = 5, unit = "rep_inf_scorch", side = "galactic_republic.lvl"},
    {id = 6, unit = "rep_inf_gregor", side = "rep_uta.lvl"},
    {id = 7, unit = "rep_inf_bad_batch_crosshair", side = "bad_batch.lvl"},
    {id = 8, unit = "rep_inf_bad_batch_hunter", side = "bad_batch.lvl"},
    {id = 9, unit = "rep_inf_bad_batch_tech", side = "bad_batch.lvl"},
    {id = 10, unit = "rep_inf_bad_batch_wrecker", side = "bad_batch.lvl"},
}

function loadSpecial(id)
    if id == nil then id = 1 end
    if(id == 1) then
        print("POC: No special unit!")
    else
        for i, unit in ipairs(special) do
            if unit.id == id then
                print("POC Customization: Enforcer ID is ", id)
                --UNDER ALL CIRCUMSTANCES; LOAD BEFORE THE BAD BATCH UNIT LOADS;
                if(unit.side == "bad_batch.lvl") then
                    print("TEST")
                    ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\galactic_republic.lvl",
                    "rep_inf_scorch",
                    "rep_inf_sev",
                    "rep_inf_fixer",
                    "rep_inf_boss",
                    "rep_inf_captain_rex")
                end
                ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\" .. unit.side, unit.unit)
                specialoperations = unit.unit
                break
            end
        end
    end
end



republic_heroes = {
    {id = 1, unit = "rep_inf_anakin_skywalker", side = "galactic_republic.lvl", sound = "ANI.lvl;ANIcw", phase1variant = "rep_inf_anakin_skywalker_season1"},
    {id = 2, unit = "rep_hero_obiwan", side = "rep_uta.lvl"},
    {id = 3, unit = "rep_inf_plo_koon", side = "galactic_republic.lvl", sound = "PLO.lvl;PLOcw"},
    {id = 4, unit = "rep_inf_grand_master_yoda", side = "galactic_republic.lvl"},
    {id = 5, unit = "c2_inf_ahsoka_tano", side = "c2.lvl", sound = "AHSOKA_TANOcw"},
    {id = 6, unit = "rep_inf_mace_windu", side = "galactic_republic.lvl"},
}

separatist_heroes = {
    {id = 1, unit = "cis_inf_count_dooku", side = "separatist_alliance.lvl", sound = "DOK.lvl;DOKcw"},
}

--For whatever reason, I can't do what I did with the table like in loadUnits here with the rephero and cishero variables. Returning instead.
function loadHeroes(id, heroes) --rema id from the IF, table with units
    if id == nil then id = 1 end
    for i, hero in ipairs(heroes) do
        if hero.id == id then

            print("POC Customization: Hero ID is ", id)
            if(rema_database.data.phase1 and hero.phase1variant~=nil) then
                ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\" .. hero.side, hero.phase1variant)
                return hero.phase1variant
            else
                ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\" .. hero.side, hero.unit)
                return hero.unit
            end

            if(hero.sound~=nil) then
                ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SOUND\\" .. hero.sound)
            end
            break
        end
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
            soldier = {repunit[1],12, 12},
            assault = {repunit[2],6, 6},
            sniper  = {repunit[3],4, 4},
            engineer = {repunit[4],4, 4},
            officer  = {repunit[5],3, 3},
            special  = {repunit[6],3, 3},
        },
    
        cis = {
            team = CIS,
            units = 32,
            reinforcements = 300,
            soldier = {cisunit[1],10, 10},
            assault = {cisunit[2],6, 6},
            sniper = {cisunit[3],4, 4}, 
            engineer = {cisunit[4],4, 4},
            officer = {cisunit[5],3, 3},
            special = {cisunit[6],2, 2},
            extra1 = {cisunit[7],2, 2},
            extra2 = {cisunit[8],1,1},
        }
    }
    if(id == 1) then
        print("POC: No extra units!")
    elseif(id == 2) then
        Teams.rep.extra1 = {repunit[7],2,2}
    elseif(id == 3) then
        Teams.rep.extra1 = {repunit[7],2,2}
        Teams.rep.extra2 = {repunit[8],1,1}
    elseif(id == 4) then
        Teams.rep.extra1 = {repunit[7],2,2}
        Teams.rep.extra2 = {repunit[8],1,1}
        Teams.rep.extra3 = {repunit[9],1,1}
    end
    if (specialoperations~=nil) then
        Teams.rep.specialoperations = {specialoperations,1,1} --Add the unit to the table
    end 
    SetupTeams(Teams)
    SetHeroClass(REP, rephero)
    SetHeroClass(CIS, cishero)
end