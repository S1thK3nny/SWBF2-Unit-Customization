--
-- Copyright (c) 2005 Pandemic Studios, LLC. All rights reserved.
--
ScriptCB_DoFile("setup_teams") 
ScriptCB_DoFile("ObjectiveConquest")
ScriptCB_DoFile("zzz_customize")

function ScriptPostLoad()

        --This defines the CPs.  These need to happen first
    cp1 = CommandPost:New{name = "cp1"}
    cp2 = CommandPost:New{name = "cp2"}
    cp3 = CommandPost:New{name = "cp3"}

	cp6 = CommandPost:New{name = "cp6"}
	cp7 = CommandPost:New{name = "cp7"}
	cp8 = CommandPost:New{name = "cp8"}

    
    --This sets up the actual objective.  This needs to happen after cp's are defined
    conquest = ObjectiveConquest:New{teamATT = ATT, teamDEF = DEF, textATT = "game.modes.con", textDEF = "game.modes.con2", multiplayerRules = true}
    
    --This adds the CPs to the objective.  This needs to happen after the objective is set up
	conquest:AddCommandPost(cp1)
	conquest:AddCommandPost(cp2)
	conquest:AddCommandPost(cp3)

	conquest:AddCommandPost(cp6)
	conquest:AddCommandPost(cp7)
	conquest:AddCommandPost(cp8)
	
    
    SetUberMode(1);

conquest:Start()
    AddAIGoal(1, "conquest", 1000)
    AddAIGoal(2, "conquest", 1000)
    AddAIGoal(3, "conquest", 1000)
EnableSPHeroRules()    
end

---------------------------------------------------------------------------
-- FUNCTION:    ScriptInit
-- PURPOSE:     This function is only run once
-- INPUT:
-- OUTPUT:
-- NOTES:       The name, 'ScriptInit' is a chosen convention, and each
--              mission script must contain a version of this function, as
--              it is called from C to start the mission.
---------------------------------------------------------------------------


function ScriptInit()
    -- Designers, these two lines *MUST* be first!
    StealArtistHeap(256*1024)
    SetPS2ModelMemory(2097152 + 65536 * 10)
    SetMemoryPoolSize("ParticleTransformer::ColorTrans",2000)
    SetMemoryPoolSize("ParticleTransformer::PositionTr",2000)
    SetMemoryPoolSize("ParticleTransformer::SizeTransf",2000)
    ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\ingame.lvl")
    ReadDataFile("ingame.lvl")

    --  Republic Attacking (attacker is always #1)
REP = 1
CIS = 2
DES = 3
    --  These variables do not change
ATT = 1
DEF = 2

	SetMemoryPoolSize("Music", 73)

	SetMemoryPoolSize ("ClothData",20)
    SetMemoryPoolSize ("Combo",50)              -- should be ~ 2x number of jedi classes
    SetMemoryPoolSize ("Combo::State",650)      -- should be ~12x #Combo
    SetMemoryPoolSize ("Combo::Transition",650) -- should be a bit bigger than #Combo::State
    SetMemoryPoolSize ("Combo::Condition",650)  -- should be a bit bigger than #Combo::State
    SetMemoryPoolSize ("Combo::Attack",550)     -- should be ~8-12x #Combo
    SetMemoryPoolSize ("Combo::DamageSample",6000)  -- should be ~8-12x #Combo::Attack
    SetMemoryPoolSize ("Combo::Deflect",100)     -- should be ~1x #combo
	SetMemoryPoolSize("SoldierAnimation", 1500)
	SetMemoryPoolSize("FLEffectObject::OffsetMatrix",2000)

    SetTeamAggressiveness(REP, 0.95)
    SetTeamAggressiveness(CIS, 0.95)

    SetMaxFlyHeight(40)
	SetMaxPlayerFlyHeight(40)

    ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SOUND\\995.lvl;995cw")    
    ReadDataFile("sound\\tat.lvl;tat2cw")

    ReadDataFile("..\\..\\addon\\995\\data\\_LVL_PC\\SIDE\\des.lvl",
    "tat_inf_jawa")

    ReadDataFile("SIDE\\tur.lvl",
    "tur_bldg_tat_barge",	
    "tur_bldg_laser")	

    SetupCustomizedMatch()

    -- Jawas --------------------------
    SetTeamName (3, "locals")
    AddUnitClass (3, "tat_inf_jawa", 7)
    SetUnitCount (3, 7)
    SetTeamAsFriend(3,ATT)
    SetTeamAsFriend(3,DEF)
    SetTeamAsFriend(ATT,3)
    SetTeamAsFriend(DEF,3)
    -----------------------------------

    --  Level Stats
    ClearWalkers()
    AddWalkerType(0, 3) -- special -> droidekas
    AddWalkerType(1, 0) -- 1x2 (1 pair of legs)
    AddWalkerType(2, 0) -- 2x2 (2 pairs of legs)
    AddWalkerType(3, 0) -- 3x2 (3 pairs of legs)
    
    local weaponCnt = 210
    SetMemoryPoolSize("Aimer", 1024)
    SetMemoryPoolSize("AmmoCounter", 1024)
    SetMemoryPoolSize("BaseHint", 1024)
    SetMemoryPoolSize("EnergyBar", 1024)
    SetMemoryPoolSize("EntityCloth", 18)
    SetMemoryPoolSize("EntitySoundStream", 10)
    SetMemoryPoolSize("EntitySoundStatic", 0)
    SetMemoryPoolSize("MountedTurret",18)
    SetMemoryPoolSize("PathFollower", 1024)
    SetMemoryPoolSize("Navigator", 1024)
    SetMemoryPoolSize("Obstacle", 1024)
    SetMemoryPoolSize("SoundSpaceRegion", 38)
    SetMemoryPoolSize("TentacleSimulator", 0)
    SetMemoryPoolSize("TreeGridStack", 2048)
    SetMemoryPoolSize("UnitAgent", 1024)
    SetMemoryPoolSize("UnitController", 1024)
    SetMemoryPoolSize("Weapon", 1024)
	SetMemoryPoolSize("EntityFlyer", 4)   

    SetSpawnDelay(10.0, 0.25)
    SetupMap()
    SetDenseEnvironment("false")


    --  Sound Stats
    
    voiceSlow = OpenAudioStream("sound\\global.lvl", "rep_unit_vo_slow")
    AudioStreamAppendSegments("sound\\global.lvl", "cis_unit_vo_slow", voiceSlow)
    AudioStreamAppendSegments("sound\\global.lvl", "des_unit_vo_slow", voiceSlow)
    AudioStreamAppendSegments("sound\\global.lvl", "global_vo_slow", voiceSlow)
    
    voiceQuick = OpenAudioStream("sound\\global.lvl", "rep_unit_vo_quick")
    AudioStreamAppendSegments("sound\\global.lvl", "cis_unit_vo_quick", voiceQuick)     
    
    OpenAudioStream("..\\..\\addon\\995\\data\\_LVL_PC\\SOUND\\995.lvl", "995_music")
    OpenAudioStream("..\\..\\addon\\995\\data\\_LVL_PC\\SOUND\\995.lvl", "995_UNIT_VO_S")
    -- OpenAudioStream("sound\\global.lvl",  "global_vo_quick")
    -- OpenAudioStream("sound\\global.lvl",  "global_vo_slow")
    OpenAudioStream("sound\\tat.lvl",  "tat2")
    OpenAudioStream("sound\\tat.lvl",  "tat2")

    SetBleedingVoiceOver(REP, REP, "rep_off_com_report_us_overwhelmed", 1)
    SetBleedingVoiceOver(REP, CIS, "rep_off_com_report_enemy_losing",   1)
    SetBleedingVoiceOver(CIS, REP, "cis_off_com_report_enemy_losing",   1)
    SetBleedingVoiceOver(CIS, CIS, "cis_off_com_report_us_overwhelmed", 1)
    
    SetLowReinforcementsVoiceOver(REP, REP, "rep_off_defeat_im", .1, 1)
    SetLowReinforcementsVoiceOver(REP, CIS, "rep_off_victory_im", .1, 1)
    SetLowReinforcementsVoiceOver(CIS, CIS, "cis_off_defeat_im", .1, 1)
    SetLowReinforcementsVoiceOver(CIS, REP, "cis_off_victory_im", .1, 1)    

    SetOutOfBoundsVoiceOver(1, "repleaving")
    SetOutOfBoundsVoiceOver(2, "cisleaving")

    SetAmbientMusic(REP, 1.0, "Battle_music",  0,1)
    SetAmbientMusic(REP, 0.8, "Battle_music", 1,1)
    SetAmbientMusic(REP, 0.2, "Battle_music",    2,1)
    SetAmbientMusic(CIS, 1.0, "Battle_music",  0,1)
    SetAmbientMusic(CIS, 0.8, "Battle_music", 1,1)
    SetAmbientMusic(CIS, 0.2, "Battle_music",    2,1)

    SetVictoryMusic(REP, "victory_rep")
    SetDefeatMusic (REP, "rep_tat_amb_defeat")
    SetVictoryMusic(CIS, "cis_tat_amb_victory")
    SetDefeatMusic (CIS, "cis_tat_amb_defeat")

    SetSoundEffect("ScopeDisplayZoomIn",  "binocularzoomin")
    SetSoundEffect("ScopeDisplayZoomOut", "binocularzoomout")
    --SetSoundEffect("WeaponUnableSelect",  "com_weap_inf_weaponchange_null")
    --SetSoundEffect("WeaponModeUnableSelect",  "com_weap_inf_modechange_null")
    SetSoundEffect("SpawnDisplayUnitChange",       "shell_select_unit")
    SetSoundEffect("SpawnDisplayUnitAccept",       "shell_menu_enter")
    SetSoundEffect("SpawnDisplaySpawnPointChange", "shell_select_change")
    SetSoundEffect("SpawnDisplaySpawnPointAccept", "shell_menu_enter")
    SetSoundEffect("SpawnDisplayBack",             "shell_menu_exit")


    SetAttackingTeam(ATT)

    --  Camera Stats
    --Tat2 Mos Eisley
	AddCameraShot(0.974338, -0.222180, 0.035172, 0.008020, -82.664650, 23.668301, 43.955681);
	AddCameraShot(0.390197, -0.089729, -0.893040, -0.205362, 23.563562, 12.914885, -101.465561);
	AddCameraShot(0.169759, 0.002225, -0.985398, 0.012916, 126.972809, 4.039628, -22.020613);
	AddCameraShot(0.677453, -0.041535, 0.733016, 0.044942, 97.517807, 4.039628, 36.853477);
    AddCameraShot(0.866029, -0.156506, 0.467299, 0.084449, 7.685640, 7.130688, -10.895234);

end