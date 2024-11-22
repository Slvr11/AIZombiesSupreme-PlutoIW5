#include common_scripts\utility;
#include maps\mp\_utility;

//Intervention is missing scope in upgrade
//Optimize player code?
//Add pap to hand gun?
//Dog hitboxes are rotated oddly. They still are valid for the upper 2/3 of the dog
//Fix dog movement run to walk logic

//Rework onPlayerDisconnect. Cannot check weapon ownership there
//Sentry does not barrel spin
//Enable gifting?
//Upgrade can break if another player uses right as the gun comes up

init()
{
    //Required sets for Pluto
    level.console = false;
    level.heli_maxhealth = 1000;
    level.rankedMatch = true;
    level.numGametypeReservedObjectives = 0;
	level.sentrySettings = [];
	level.sentrySettings["sentry_minigun"] = spawnStruct();
	level.sentrySettings["sentry_minigun"].spinupTime = 0.05;
    level.killstreakSpawnShield = 0;
    
    loadConfig();

    level.gameStrings = maps\mp\gametypes\_aiz_game_text::initGameStrings();

    if (getDvarInt("sv_maxclients") > 8)
    {
        printLn("The current max players for AIZombies can only be 8 or below. The current setting is " + getDvar("sv_maxClients") + ". It has been set to 8.");
        makeDvarServerInfo("sv_maxClients", 8);
        
        //if (getDvarInt("sv_privateClients") > 0)
        //{
            //setDvar("sv_privateClients", 0);
            //makeDvarServerInfo("sv_privateClientsForClients", 0);
        //}
        map_restart(false);
        return;
    }

    level._mapname = getMapname();
    level.zombieMapname = undefined;
    level.isHellMap = false;
    level.zState = "intermission";
    level.gameEnded = false;
    level.gameStarted = false;
    level.intermissionTimerNum = 30;
    //level.firstIntermission = true;
    level.timePlayedMinutes = 0;
    level.timePlayed = 0;
    //level.secondsTimerStarted = false;
    level.intermissionTimerStarted = false;
    level.zombieDeath = [];

    for (i = 0; i < 14; i++)
    {
        level.zombieDeath[i] = level.gameStrings[i];
    }

    level.bodyModel = getPlayerModelsForLevel(false);
    level.headModel = getPlayerModelsForLevel(true);
    //Set via dvar
    //level.maxPlayerHealth = 101;
    //level.maxPlayerHealth_Jugg = 251;
    level.powerActivated = false;
    level.tempPowerActivated = false;
    level.version = "1.2";
    level.dev = "Slvr99";

    level.pauseMenu = "class";
    level.vision = "";
    level.bossVision = "cobra_sunset1";
    level.hellVision = "cobra_sunset3";

    level.mapHeight = 0;
    level.totalWaves = 30;

    level.currentRayguns = 0;
    level.maxRayguns = 2;
    level.currentThunderguns = 0;
    level.maxThunderguns = 1;
    level.currentZappers = 0;

    level.freezerActivated = false;

    maps\mp\gametypes\_aiz_bot_util::init();
    maps\mp\gametypes\_aiz_hud::init();
    maps\mp\gametypes\_aiz_killstreaks::init();
    maps\mp\gametypes\_aiz_map_edits::init();
    maps\mp\gametypes\_aiz_round_system::init();

    maps\mp\gametypes\_aiz_maps::setRandomMapVariation();

    switch (level._mapname)
    {
        case "mp_dome":
            level.mapHeight = -600;
            break;
        case "mp_alpha":
        case "mp_mogadishu":
        case "mp_park":
            level.mapHeight = -100;
            break;
        case "mp_bootleg":
            level.mapHeight = -150;
            break;
        case "mp_bravo":
            level.mapHeight = 900;
            break;
        case "mp_exchange":
            level.mapHeight = -200;
            break;
        case "mp_interchange":
        case "mp_nola":
        case "mp_six_ss":
            level.mapHeight = -15;
            break;
        case "mp_lambeth":
            level.mapHeight = -375;
            break;
        case "mp_paris":
            level.mapHeight = -75;
            break;
        case "mp_seatown":
            level.mapHeight = 100;
            break;
        case "mp_underground":
            level.mapHeight = -300;
            break;
        case "mp_village":
        case "mp_qadeem":
            level.mapHeight = 100;
            break;
        case "mp_aground_ss":
        case "mp_boardwalk":
        case "mp_courtyard_ss":
        case "mp_roughneck":
            level.mapHeight = -50;
            break;
        case "mp_burn_ss":
            level.mapHeight = -70;
            break;
        case "mp_cement":
            level.mapHeight = 250;
            break;
        case "mp_crosswalk_ss":
            level.mapHeight = 1760;
            break;
        case "mp_hillside_ss":
            level.mapHeight = 1930;
            break;
        case "mp_meteora":
        case "mp_restrepo_ss":
            level.mapHeight = 1500;
            break;
        case "mp_overwatch":
            level.mapHeight = 12500;
            break;
        case "mp_italy":
            level.mapHeight = 650;
            break;
        case "mp_moab":
        case "mp_shipbreaker":
            level.mapHeight = 350;
            break;
        case "mp_morningwood":
            level.mapHeight = 1100;
            break;
        default:
            level.mapHeight = 0;
            break;
    }

    maps\mp\gametypes\_aiz_killstreaks::initMapKillstreak();

    level.onPrecacheGameType = ::onPrecacheGameType;
    onPrecacheGameType();
    level.onSpawnPlayer = ::onPlayerSpawn;
    level.modifyPlayerDamage = ::modifyPlayerDamage;
    level.onNormalDeath = ::onNormalDeath;
	level.onPlayerKilled = ::onPlayerKilled;
    level.getSpawnPoint = ::getRandomSpawnpoint;
    level.callbackPlayerLastStand = ::onPlayerLastStand;

    makeDvarServerInfo("cg_drawCrosshair", 1);
    makeDvarServerInfo("ui_drawCrosshair", 1);
    makeDvarServerInfo("cg_crosshairDynamic", 1);

    initGameNotifies();

    makeDvarServerInfo("ui_gametype", "aiz");
    makeDvarServerInfo("didyouknow", "^1AIZombies Supreme Made by ^2Slvr99");
    makeDvarServerInfo("g_motd", "^1AIZombies Supreme Made by ^2Slvr99");
    makeDvarServerInfo("sv_motd", "^1AIZombies Supreme Made by ^2Slvr99");
    makeDvarServerInfo("motd", "^1AIZombies Supreme Made by ^2Slvr99");
    //makeDvarServerInfo("ui_connectScreenTextGlowColor", (0, 1, 0));
    makeDvarServerInfo("ui_allow_teamchange", 0);
    makeDvarServerInfo("ui_allow_classchange", 0);

    //Server netcode adjustments//
    setDvar("com_maxfps", 0);
    //-IW5 server update rate-
    setDevDvar("sv_network_fps", 200);
    //-Turn off flood protection-
    //setDvar("sv_floodProtect", 0);
    //-Setup larger snapshot size and remove/lower delay-
    //Reverting
    setDvar("sv_hugeSnapshotSize", 4000);
    setDvar("sv_hugeSnapshotDelay", 200);
    //-Remove ping degradation-
    setDvar("sv_pingDegradation", 0);
    setDvar("sv_pingDegradationLimit", 9999);
    //-Improve ping throttle-
    setDvar("sv_acceptableRateThrottle", 9999);
    setDvar("sv_newRateThrottling", 0);
    setDvar("sv_newRateInc", 200);
    setDvar("sv_newRateCap", 500);
    //-Tweak ping clamps-
    setDvar("sv_minPingClamp", 50);
    //-Increase server think rate per frame-
    setDvar("sv_cumulThinkTime", 1000);
    //-Disable playlist checking-
    setDvar("playListUpdateCheckMinutes", 999999999);

    //End server netcode//

    //EXPERIMENTALS
    //-Lock CPU threads-
    setDvar("sys_lockThreads", "all");
    //-Prevent game from attempting to slow time for frames-
    setDvar("com_maxFrameTime", 100);
    //-Enable turning anims on players-
    setDvar("player_turnAnims", 1);
    setDvar("bg_legYawTolerance", 50);
    //-Disable riot shield bullet ricochet-
    setDvar("bullet_ricochetBaseChance", 0);

    setTeamRadar("allies", true);
    setPlayerIgnoreRadiusDamage(true);
    setDynamicDvar("scr_war_timelimit", 0);//Hardcode unlimited time
    //setDvar("sv_connectTimeout", 60);

    //Set high quality voice chat audio
    setDvar("sv_voiceQuality", 9);
    setDvar("maxVoicePacketsPerSec", 2000);
    setDvar("maxVoicePacketsPerSecForServer", 1000);
    //Ensure all players are heard regardless of any settings
    setDvar("cg_everyoneHearsEveryone", 1);

    //Gameplay tweaks
    setDvar("perk_diveViewRollSpeed", 0.00001);
    setDvar("perk_diveGravityScale", 0.4);
    //setDvar("perk_weapSpreadMultiplier", 0);
    setDvar("scr_game_playerwaittime", 5);
    setDvar("scr_game_matchstarttime", 0);
    //setDvar("scr_game_graceperiod", 1);
    setDvar("ui_hud_showdeathicons", "0");//Disable death icons
    //setDvar("missileJavDuds", 1);//Disable javelin explosions at close range

    setDvarIfUninitialized("aiz_useMW2Visions", 0);

    level thread onPlayerConnect();

    if (getDvarInt("aiz_useMW2Visions") > 0) level.vision = getMW2Vision();

    level.levelHeight = getEnt("airstrikeheight", "targetname");
    if (isDefined(level.levelHeight)) level.heliHeight = level.levelHeight.origin[2];

    setDvar("g_hardcore", 0);
    level.hardcoreMode = false;

    level.waypoints = [];

    maps\mp\gametypes\_aiz_waypoints::createWaypoints();
    maps\mp\gametypes\_aiz_maps::loadMapEdits();

    level thread maps\mp\gametypes\_aiz_hud::createServerHud();

    //Seasonal elements
    //checkForSeasons();

    thread maps\mp\gametypes\_aiz_map_edits::cleanLevelEnts();

    for (i = 0; i < 30; i++)//init botPool. Can be changed to higher number of offhand bots
    {
        maps\mp\gametypes\_aiz_bot_util::createBot(false);
        if (level._mapname != "mp_base") maps\mp\gametypes\_aiz_bot_util::createBot(true);//Crawlers
    }
    if (level._mapname != "mp_base")
        for (i = 0; i < 10; i++) maps\mp\gametypes\_aiz_bot_util::createBot_boss();//Boss bots

    initGameVisions();

    //level thread runGameTimeoutReset();

    //Dome Easter egg init
    if (level._mapname == "mp_dome")
    {
        level.dome_windmillList = [];
        level thread maps\mp\gametypes\_aiz_map_edits::dome_deleteDynamicModels();

        maps\mp\gametypes\_aiz_map_edits::dome_initEasterEgg();

        //maps\mp\gametypes\_aiz_map_edits::initDomeMoon();
    }

    //init voting map table
    index = 0;
    for (i = 110; i < 145; i++)
    {
        level.mapNames[index] = level.gameStrings[i];
        index++;
    }
    index = 0;
    for (i = 145; i < 180; i++)
    {
        level.mapDesc[index] = level.gameStrings[i];
        index++;
    }

    level.mapNames[level.mapNames.size] = level.gameStrings[86];
    level.mapDesc[level.mapDesc.size] = level.gameStrings[87];
}

onPrecacheGameType()
{
    //load fx
    level.fx_carePackage = loadFx("smoke/signal_smoke_airdrop");
    level.fx_rayGun = loadFx("misc/aircraft_light_wingtip_green");
    level.fx_rayGunUpgrade = loadFx("misc/aircraft_light_wingtip_red");
    level.fx_thundergun = loadFx("distortion/distortion_tank_muzzleflash");
    level.fx_zapper = loadFx("explosions/powerlines_f");
    level.fx_zapperTrail = loadFx("props/throwingknife_geotrail");
    level.fx_zapperShot = loadFx("misc/aircraft_light_white_blink");
    level.fx_zapperExplode = loadFx("explosions/powerlines_a");
    level.fx_smallFire = loadFx("fire/vehicle_exp_fire_spwn_child");
    level.fx_nuke = loadFx("explosions/clusterbomb_exp");
    level.fx_greenSmoke = loadFx("misc/flare_ambient_green");
    level.fx_redSmoke = loadFx("misc/flare_ambient");
    level.fx_freezer = loadFx("explosions/emp_grenade");
    level.fx_powerupCollect = loadFx("explosions/powerlines_c");
    level.fx_sentryExplode = loadFx("explosions/sentry_gun_explosion");
    level.fx_sentrySmoke = loadFx("smoke/car_damage_blacksmoke");
    level.fx_sentryDeath = loadFx("explosions/killstreak_explosion_quick");
    level.fx_explode = loadFx("explosions/tanker_explosion");
    level.fx_uavRoute = loadFx("misc/ui_flagbase_silver");
    level.fx_uavRouteFail = loadFx("misc/ui_flagbase_black");
    level.fx_vestFire = loadFx("fire/ballistic_vest_death");
    //level.fx_gunFlash = loadFX("muzzleflashes/ak47_flash_wv");
    //level.fx_sentryTracer = loadFx("impacts/small_metalhit_1_exit");
    level.fx_blood = loadFx("impacts/flesh_hit_body_fatal_exit");
    level.fx_headshotBlood = loadFx("impacts/flesh_hit_head_fatal_exit");
    level.fx_bodyPartExplode = loadFx("impacts/flesh_hit_knife");
    level.fx_glowStickGlow = loadFx("misc/glow_stick_glow_green");
    level.fx_money = loadFx("props/cash_player_drop");
    level.fx_empBlast = loadFx("explosions/emp_flash_mp");
    level.fx_disappear = loadFx("impacts/small_snowhit");
    level.fx_sparks = loadFx("explosions/powerlines_b");
    level.fx_teleportSpark = loadFx("explosions/generator_sparks_d");
    level.fx_powerup = loadFx("misc/light_glow_white_lamp");
    if (level._mapname == "mp_interchange")
    {
        level.fx_crateSmoke = loadFx("smoke/thin_black_smoke_m");
        level.fx_rock = loadFx("smoke/thin_light_smoke_l");
    }
    else if (level._mapname == "mp_carbon" || level._mapname == "mp_roughneck")
        level.fx_trailFX = loadFx("smoke/jet_contrail");
    level.fx_glow = loadFx("misc/outdoor_motion_light");
    level.fx_glow2 = loadFx("props/glow_latern");
    level.fx_crateCollectSmoke = loadFx("props/crateexp_dust");
    //level.fx_flamethrower = loadFx("impacts/pipe_fire");
    level.fx_flamethrowerFlame = loadFx("props/barrel_fire");
    level.fx_flamethrowerImpact = loadFx("smoke/smoke_trail_black_heli");
    level.fx_flamethrowerImpactUpgrade = loadFx("fire/fire_smoke_trail_L");
    level.fx_flamethrowerDeathFX = loadFx("props/barrelExp");
    if (level.classicKillstreaks == 1 || (level.classicKillstreaks == 2 && array_contains(level.classicMaps, level._mapname)))
    {
        level.fx_overwatchSmoke = loadFx("smoke/smoke_trail_black_heli_emitter");
        level.fx_overwatchSecondaryExplosion = loadFx("explosions/helicopter_explosion_secondary_small");
        level.fx_overwatchExplosion = loadFx("explosions/aerial_explosion_littlebird_mp");
        preCacheTurret("pavelow_minigun_mp");
    }

    if (!isDefined(level.teddyModel))
    {
        level.teddyModel = getTeddyModelForLevel();
    }
    preCacheModel(level.teddyModel);
    preCacheModel(level.bodyModel);
    preCacheModel(level.headModel);
    preCacheModel(maps\mp\gametypes\_aiz_map_edits::getAlliesFlagModel(level._mapname));
    preCacheModel(maps\mp\gametypes\_aiz_map_edits::getAxisFlagModel(level._mapname));
    if (!level.legacyPowerupModels || array_contains(level.wawMaps, level._mapname))
    {
        preCacheModel("zombie_ammocan");
        preCacheModel("zombie_firesale");
        preCacheModel("zombie_pickup_minigun");
        preCacheModel("zombie_pickup_perk_bottle");
        preCacheModel("zombie_skull");
        preCacheModel("zombie_x2_icon");
        preCacheModel("zombie_z_money_icon");
        preCacheModel("zombie_bomb");
    }

    preCacheItem("at4_mp");
    preCacheItem("iw5_mk12spr_mp");
    preCacheItem("lightstick_mp");
    preCacheItem("remote_uav_weapon_mp");
    preCacheItem("strike_marker_mp");
    preCacheItem("iw5_xm25_mp");
    preCacheItem("iw5_riotshield_mp");
    preCacheItem(level.mapStreakWeapon);
    preCacheItem("thundergun_mp");
    preCacheItem("thundergunupgraded_mp");
    preCacheItem("iw5_raygun_mp");
    preCacheItem("iw5_deathmachine_mp");
    preCacheItem("airdrop_mega_marker_mp");
    preCacheItem("rsass_hybrid_mp");
    preCacheItem("rsass_hybrid_reflex_mp");

    if (level.mw2Weapons == 1 || (level.mw2Weapons == 2 && array_contains(level.classicMaps, level._mapname)))
    {
        preCacheItem("iw4_aa12_mp");
        preCacheItem("iw4_aa12upgraded_mp");
        preCacheItem("iw4_ak47_mp");
        preCacheItem("iw4_ak47upgraded_mp");
        preCacheItem("iw4_aug_mp");
        preCacheItem("iw4_augupgraded_mp");
        preCacheItem("iw4_augupgraded2_mp");
        preCacheItem("iw4_barrett_mp");
        preCacheItem("iw4_barrettupgraded_mp");
        preCacheItem("iw4_beretta_mp");
        preCacheItem("iw4_berettaupgraded_mp");
        preCacheItem("iw4_beretta393_mp");
        preCacheItem("iw4_beretta393_mp");
        preCacheItem("iw4_coltanaconda_mp");
        preCacheItem("iw4_coltanacondaupgraded_mp");
        preCacheItem("iw4_deathmachine_mp");
        preCacheItem("iw4_dragunov_mp");
        preCacheItem("iw4_dragunovupgraded_mp");
        preCacheItem("iw4_fal_mp");
        preCacheItem("iw4_falupgraded_mp");
        preCacheItem("iw4_famas_mp");
        preCacheItem("iw4_famasupgraded_mp");
        preCacheItem("iw4_fn2000_mp");
        preCacheItem("iw4_fn2000upgraded_mp");
        preCacheItem("iw4_glock_mp");
        preCacheItem("iw4_glockupgraded_mp");
        preCacheItem("iw4_javelin_mp");
        preCacheItem("iw4_kriss_mp");
        preCacheItem("iw4_krissupgraded_mp");
        preCacheItem("iw4_krissupgraded2_mp");
        preCacheItem("iw4_m4reflex_mp");
        preCacheItem("iw4_m4reflexupgraded_mp");
        preCacheItem("iw4_m4silencer_mp");
        preCacheItem("iw4_m4silencerupgraded_mp");
        preCacheItem("iw4_m16_mp");
        preCacheItem("iw4_m16upgraded_mp");
        preCacheItem("iw4_m21_mp");
        preCacheItem("iw4_m21upgraded_mp");
        preCacheItem("iw4_m240_mp");
        preCacheItem("iw4_m240upgraded_mp");
        preCacheItem("iw4_m1014_mp");
        preCacheItem("iw4_m1014upgraded_mp");
        preCacheItem("iw4_masada_mp");
        preCacheItem("iw4_masadaupgraded_mp");
        preCacheItem("iw4_mg4_mp");
        preCacheItem("iw4_mg4upgraded_mp");
        preCacheItem("iw4_model1887_mp");
        preCacheItem("iw4_model1887upgraded_mp");
        preCacheItem("iw4_model1887fmj_mp");
        preCacheItem("iw4_model1887fmjupgraded_mp");
        preCacheItem("iw4_mp5k_mp");
        preCacheItem("iw4_mp5kupgraded_mp");
        preCacheItem("iw4_onemanarmy_mp");
        preCacheItem("iw4_onemanarmyupgraded_mp");
        preCacheItem("iw4_p90_mp");
        preCacheItem("iw4_p90upgraded_mp");
        preCacheItem("iw4_pp2000_mp");
        preCacheItem("iw4_pp2000upgraded_mp");
        preCacheItem("iw4_pp2000upgraded2_mp");
        preCacheItem("iw4_ranger_mp");
        preCacheItem("iw4_rangerupgraded_mp");
        preCacheItem("iw4_raygun_mp");
        preCacheItem("iw4_raygunupgraded_mp");
        preCacheItem("iw4_rpd_mp");
        preCacheItem("iw4_rpdupgraded_mp");
        preCacheItem("iw4_rpg_mp");
        preCacheItem("iw4_rpgupgraded_mp");
        preCacheItem("iw4_sa80_mp");
        preCacheItem("iw4_sa80upgraded_mp");
        preCacheItem("iw4_sa80upgraded2_mp");
        preCacheItem("iw4_scar_mp");
        preCacheItem("iw4_scarupgraded_mp");
        preCacheItem("iw4_spas12_mp");
        preCacheItem("iw4_spas12upgraded_mp");
        preCacheItem("iw4_stinger_mp");
        preCacheItem("iw4_striker_mp");
        preCacheItem("iw4_strikerupgraded_mp");
        preCacheItem("iw4_tavor_mp");
        preCacheItem("iw4_tavorupgraded_mp");
        preCacheItem("iw4_tmp_mp");
        preCacheItem("iw4_tmpupgraded_mp");
        preCacheItem("iw4_tmpsilencer_mp");
        preCacheItem("iw4_tmpsilencerupgraded_mp");
        preCacheItem("iw4_ump45_mp");
        preCacheItem("iw4_ump45upgraded_mp");
        preCacheItem("iw4_ump45upgraded2_mp");
        preCacheItem("iw4_usp_mp");
        preCacheItem("iw4_uspupgraded_mp");
        preCacheItem("iw4_uzi_mp");
        preCacheItem("iw4_uziupgraded_mp");
        preCacheItem("iw4_wa2000_mp");
        preCacheItem("iw4_wa2000upgraded_mp");
        preCacheItem("m79_mp");
        preCacheItem("iw4_colt45_mp");
        preCacheItem("iw4_ak47thermalupgraded_mp");
        preCacheItem("iw4_ak47thermalupgraded_gl_mp");
    }
    if (level.boWeapons == 1)
    {
        preCacheItem("t5_raygun_mp");
        preCacheItem("t5_raygunupgraded_mp");
        preCacheItem("t5_thundergun_mp");
        preCacheItem("t5_thundergunupgraded_mp");
    }

    preCacheTurret("manned_gl_turret_mp");
    preCacheTurret("sentry_minigun_mp");
    preCacheShader("iw5_cardicon_soap");
    preCacheShader("iw5_cardicon_nuke");
    preCacheShader("line_horizontal");
    preCacheShader("hud_iw5_divider");
    preCacheShader("headicon_heli_extract_point");
    preCacheShader("specialty_light_armor");//Juggernog
    preCacheShader("specialty_longersprint_upgrade");//Stamin-up
    preCacheShader("specialty_fastreload_upgrade");//Speed cola
    preCacheShader("specialty_twoprimaries_upgrade");//Mule kick
    preCacheShader("weapon_attachment_rof");//Double Tap
    preCacheShader("specialty_stalker_upgrade");//Stalker soda
    //preCacheShader("specialty_scavenger_upgrade");
    if ((level.classicPerks == 1 && !array_contains(level.wawMaps, level._mapname)) || (level.classicPerks == 2 && array_contains(level.classicMaps, level._mapname)))
    {
        preCacheShader("cardicon_bullets_50cal");
        preCacheShader("specialty_bulletdamage_upgrade");
        preCacheShader("specialty_steadyaim_upgrade");
        preCacheShader("specialty_pistoldeath_upgrade");
    }
    preCacheShader("specialty_bulletpenetration");//Death Machine
    preCacheShader("specialty_bling");//Double points
    preCacheShader("cardicon_skull_black");//Instakill
    preCacheShader("specialty_tacticalinsertion");
    preCacheShader("hud_us_grenade");
    //Compass icons
    preCacheShader("weapon_colt_45");//Weapon box
    preCacheShader("cardicon_brassknuckles");//Upgrade
    preCacheShader("cardicon_8ball");//Gambler
    preCacheShader("waypoint_ammo_friendly");//Ammo
    preCacheShader("cardicon_aircraft_01");//Killstreaks
    preCacheShader("cardicon_bulb");//Power
    preCacheShader("compassping_enemy");//Enemy
    preCacheShader("compass_objpoint_ammo_friendly");//Care package
    precacheMiniMapIcon("compass_objpoint_c130_friendly");//C130

    preCacheShader("specialty_carepackage");//Care package
    preCacheShader("compass_objpoint_deploy_friendly");//Explosive ammo compass
    preCacheShader("killstreak_dragonfly_drone");//Dragonfly drone
    preCacheShader("specialty_predator_missile");//Predator missile
    preCacheShader("killstreak_heli_sniper_crate");//Heli sniper
    preCacheShader("specialty_precision_airstrike");//MW2 Airstrike
    preCacheShader("killstreak_airstrike");//Airstrike
    preCacheShader("specialty_ac130");//Super Airstrike
    preCacheShader("specialty_airdrop_sentry_minigun");//Sentry gun
    preCacheShader("group_icon");//Personal bot
    preCacheShader("killstreak_deployable_exp_ammo");//explosive ammo
    preCacheShader("killstreak_gl_turret");//GL turret
    preCacheShader("specialty_emp");//EMP
    preCacheShader("dpad_killstreak_nuke_static");//Nuke
    preCacheShader("specialty_airdrop_emergency");//Emergency airdrop
    preCacheShader("specialty_helicopter_flares");//Overwatch
    preCacheShader(level.mapStreakIcon);
    for (i = 0; i < 15; i++)
    {
        icon = maps\mp\gametypes\_aiz_killstreaks::getKillstreakCrateIcon(i);
        preCacheShader(icon);
    }
    precacheMiniMapIcon("compassping_friendly_party_mp");//Bot compass

    preCacheHeadIcon("waypoint_revive");
    preCacheStatusIcon("cardicon_iwlogo");
    //killstreaks
    preCacheMpAnim(level.botAnims["idle"]);
    //preCacheMpAnim(level.botAnims["idleRPG"]);
    preCacheMpAnim(level.botAnims["idleMG"]);
    //preCacheMpAnim(level.botAnims["idlePistol"]);
    preCacheMpAnim(level.botAnims["reload"]);
    //preCacheMpAnim(level.botAnims["reloadRPG"]);
    //preCacheMpAnim(level.botAnims["reloadPistol"]);
    preCacheMpAnim(level.botAnims["reloadMG"]);
    preCacheMpAnim(level.botAnims["run"]);
    preCacheMpAnim(level.botAnims["runMG"]);
    //preCacheMpAnim(level.botAnims["runRPG"]);
    //preCacheMpAnim(level.botAnims["runPistol"]);
    //preCacheMpAnim(level.botAnims["runShotgun"]);
    preCacheMpAnim(level.botAnims["runSMG"]);
    //preCacheMpAnim(level.botAnims["runSniper"]);
    preCacheMpAnim(level.botAnims["shoot"]);
    preCacheMpAnim(level.botAnims["shootMG"]);
    //preCacheMpAnim(level.botAnims["shootPistol"]);
    //preCacheMpAnim(level.botAnims["shootRPG"]);

    preCacheVehicle("remote_uav_mp");
    //botAnims
    preCacheMpAnim(level.botAnims["z_attack"]);
    foreach (deathAnim in level.botAnims["z_deaths"])
    {
        preCacheMpAnim(deathAnim);
    }
    //foreach (anim in level.botAnims["z_death_explode"]) preCacheMpAnim(anim);
    preCacheMpAnim(level.botAnims["z_death_nuke"]);
    preCacheMpAnim(level.botAnims["z_idle"]);
    preCacheMpAnim(level.botAnims["z_lose"]);
    preCacheMpAnim(level.botAnims["z_run"]);
    preCacheMpAnim(level.botAnims["z_runHurt"]);
    preCacheMpAnim(level.botAnims["z_walk"]);
    preCacheMpAnim(level.botAnims["z_walkHurt"]);
    preCacheMpAnim(level.botAnims["crawlerAnim_idle"]);
    preCacheMpAnim(level.botAnims["crawlerAnim_attack"]);
    preCacheMpAnim(level.botAnims["crawlerAnim_walk"]);
    preCacheMpAnim(level.botAnims["crawlerAnim_death"]);
    if (array_contains(level.wawMaps, level._mapname))
    {
        preCacheMpAnim(level.botAnims["dog_idle"]);
        preCacheMpAnim(level.botAnims["dog_attack"]);
        preCacheMpAnim(level.botAnims["dog_walk"]);
        preCacheMpAnim(level.botAnims["dog_run"]);
        preCacheMpAnim(level.botAnims["dog_death"]);
        preCacheMpAnim(level.botAnims["dog_lose"]);
    }

    foreach (str in level.gameStrings)
    {
        if (str != &"NULL_EMPTY")
        {
            preCacheString(str);
        }
    }
    foreach (str in level.localizedWeaponNames)
    {
        preCacheString(str);
    }
    foreach (weapon in level.weaponNames)
    {
        upgradeName = getWeaponUpgrade(weapon);
        while (isDefined(upgradeName) && upgradeName != "")
        {
            upgradeStr = maps\mp\gametypes\_aiz_hud::getWeaponName(upgradeName);
            preCacheString(upgradeStr);
            upgradeName = getWeaponUpgrade(upgradeName);
        }
    }
    preCacheString(&"WEAPON_HANDGUN");
    preCacheString(&"WEAPON_DEATHMACHINE");
    preCacheString(&"WEAPON_ZAPPER");
    preCacheString(&"WEAPON_DEPLOY_EXP_AMMO");
    preCacheString(&"WEAPON_DEPLOY_BARBED_WIRE");
    preCacheString(&"WEAPON_OIL_CAN");
    preCacheString(&"WEAPON_MK12SPR");
    preCacheString(&"WEAPON_AK47_THERMAL_UPGRADE_GL");
    preCacheString(&"MP_SLASH");
}

onPlayerConnect()
{
    for(;;)
	{
        level waittill("connected", player);

        player thread onPlayerDisconnect();

        player checkPlayerDev();//Check for dev before we init the player in-case it's an imposter

        //-Player netcode-
        
        //player setClientDvar("snaps", 30);
        //player setClientDvar("rate", 30000);
        //player setClientDvar("cl_maxPackets", 100);
        //player setClientDvar("cl_packetdup", 1);
        //player setClientDvar("com_maxFrameTime", "100");
        
        //-End player netcode-

        //Disable RCon for clients because sad day
        //On second though, happy day today =)
        //player setClientDvar("cl_enableRCon", 0);

        if (!level.intermissionTimerStarted)
        {
            level.intermissionTimerStarted = true;
            level thread runGameTimer();
            startIntermission();
        }

        player.isViewingScoreboard = false;
        player initScoreboardRefresh();

        //player givePerk("specialty_spygame", false);
        
        //Override hardcore dvar in case it was set to true at any point
        setDvar("g_hardcore", 1);
        level.hardcoreMode = false;

        //player setClientDvar("g_hardcore", 1);
        player setClientDvar("cg_crosshairDynamic", 1);
        player setClientDvar("cg_drawCrosshair", 1);
        player setClientDvar("ui_drawCrosshair", 1);
        player setClientDvar("g_TeamName_Allies", level.gameStrings[17]);
        player setClientDvar("g_TeamName_Axis", &"NULL_EMPTY");
        player setClientDvar("g_TeamIcon_Allies", "iw5_cardicon_soap");
        player setClientDvar("g_TeamIcon_MyAllies", "iw5_cardicon_soap");
        player setClientDvar("g_TeamIcon_EnemyAllies", "iw5_cardicon_soap");
        player setClientDvar("g_TeamIcon_Axis", "weapon_missing_image");
        player setClientDvar("g_TeamIcon_MyAxis", "weapon_missing_image");
        player setClientDvar("g_TeamIcon_EnemyAxis", "weapon_missing_image");
        //player setClientDvar("cl_demo_recordPrivateMatch", 0);
        //player setClientDvar("cl_demo_enabled", 0);
        player setClientDvar("cg_drawDamageFlash", 1);
        player setClientDvar("ui_hud_showdeathicons", 0);
        player setClientDvar("cg_scoreboardWidth", "600");
        player setClientDvar("cg_scoreboardFont", 0);
        //player setClientDvar("cg_watersheeting", 0);
        player setClientDvar("cg_waterSheeting_distortionScaleFactor", "0.08 1 0 0");
        player setClientDvar("maxVoicePacketsPerSec", "2000");
        player setClientDvar("maxVoicePacketsPerSecForServer", "1000");
        player setClientDvar("bg_viewKickScale", 0.2);
        player setClientDvar("cg_hudGrenadeIconMaxRangeFrag", 0);
        player setClientDvar("perk_diveViewRollSpeed", 0.0000001);
        player setClientDvar("perk_diveGravityScale", 0.4);
        //player setClientDvar("cg_weaponCycleDelay", 750);//Weapon swap delay has been fixed finally
        //player setClientDvar("gameMode", "so");
        player setClientDvar("useRelativeTeamColors", 1);
        player setClientDvar("bg_legYawTolerance", "50");
        player setClientDvar("player_turnAnims", 1);
        
        player.newGunReady = true; // feature to give 2 guns or a fix
        player.perksBought = []; // set perks to not used for buying
        for (i = 0; i < 7; i++)
        {
            player.perksBought[i] = false;
        }
        player.perkHudsDone = [];
        for (i = 0; i < 7; i++)
        {
            player.perkHudsDone[i] = false;
        }
        player.lastBoughtPerk = "";
        player.totalPerkCount = 0;
        player.gamblerReady = true;
        player.autoRevive = false;
        player.hasDeathMachine = false;
        player.cash = 500;
        player.score = 500;
        player.points = 0;
        player.isDown = false;
        player.deathHud = false;
        player.lastDroppableWeapon = "iw5_usp45_mp";
        //player.lastWeapon = "iw5_usp45_mp";
        player.lastDamageTime = 0;
        player.weaponsList = [];
        player.hasAlteredROF = false;
        player.deathCount = 0;
        player.isAlive = false;
        player.hasUsedBox = false;
        player.sessionTeam = "spectator";
        player.team = "spectator";

        level.rankedMatch = true;//Setting this on connect to ensure it stays this way
        player.usingOnlineDataOffline = false;

        //Reset certain dvars that some servers may have set and not restored
        
        player setClientDvar("waypointIconHeight", "36");
        player setClientDvar("waypointIconWidth", "36");
        
        //player setClientDvar("ui_gametype", "^2AIZombies Supreme");
        //player setClientDvar("ui_customModeName", "^2AIZombies Supreme");
        player setClientDvar("ui_mapname", getZombieMapname());
        //player setClientDvar("party_gametype", "^2AIZombies Supreme");
        player setClientDvar("didyouknow", "^1AIZombies Supreme Made by ^2Slvr99");
        player setClientDvar("motd", "^1AIZombies Supreme Made by ^2Slvr99");
        player setClientDvar("g_motd", "^1AIZombies Supreme Made by ^2Slvr99");
        player setClientDvar( "cg_objectiveText", "Survive " + level.totalWaves + " waves.");
        player setClientDvars("ui_allow_teamchange", 0, "ui_allow_classchange", 0);
        
        //if (level.isHellMap && !level.visionRestored) player visionSetNakedForPlayer(level.hellVision);
        //else player visionSetNakedForPlayer(level.vision);
        //player visionSetThermalForPlayer(level._mapname, 0);
        //player notifyOnPlayerCommand("use_button_pressed", "+activate");
        player notifyOnPlayerCommand("bankWithdraw", "vote yes");
        player notifyOnPlayerCommand("uav_reroute", "vote no");//Drone reroute
        player notifyOnPlayerCommand("weapon_switch_pressed", "weapnext");

        player closeInGameMenu();
        //player closePopUpMenu();
        player thread checkPlayerSpawn();

        player thread doIntro();

        player watchPlayerCommands();
        //player thread watchMissileFire();
        player thread watchGrenadeFire();
        player thread watchReload();
        player thread watchWeaponSwitch();
        player thread watchWeaponSwitchPress();
        player thread watchWeaponChange();
        player thread watchWeaponFired();
        /*
        if (level._mapname == "mp_dome" && getZombieMapname() == "Moonbase")
        {
            player thread watchMoonJump();
        }
        */

        player thread postPlayerConnect();

        //Valentines day code
        /*
        if (isDefined(level.allowGifting))
        {
            giftTrigger = spawn("script_model", player.origin);
            giftTrigger setModel("tag_origin");
            giftTrigger linkTo(player);
            giftTrigger.owner = player;
            giftTrigger.range = 40;
            giftTrigger.usabletype = "giftTrigger";
            player.giftTrigger = giftTrigger;
            level.usables[level.usables.size] = giftTrigger;
        }
        */
    }
}
postPlayerConnect()
{
    wait(0.1);

    self maps\mp\gametypes\_aiz_hud::destroyGameHud();
    self maps\mp\gametypes\_aiz_hud::createPlayerHud();

    self thread playIntroVO();

    //Update max bot count
    maps\mp\gametypes\_aiz_round_system::updateMaxBotCount();
}
checkPlayerSpawn()
{
    wait(0.2);

    if (level.zState == "intermission")
    {
        if (level.gameEnded)
        {
            self closeInGameMenu();
            self closeMenu("team_marinesopfor");
            self setClientDvar("g_scriptMainMenu", "");
            return;
        }
        self spawnPlayer();
    }
    else
    {
        self closeInGameMenu();
        self setClientDvar("g_scriptMainMenu", level.pauseMenu);
        self closeMenu("team_marinesopfor");
        self iPrintLnBold(level.gameStrings[18]);
        self setPlayerAsSpectator();
    }
}

spawnPlayer()
{
    self.sessionState = "playing";
    self.sessionTeam = "allies";
    self.team = "allies";
    self.pers["team"] = "allies";
    self.streakType = "none";
    self.killstreaks = [];
    self.pers["killstreaks"] = [];
    self.pers["voicePrefix"] = "US";
    self.wasTI = false;
    self.maxHealth = level.maxPlayerHealth;
    self.health = level.maxPlayerHealth;
    self takeAllWeapons();
    self clearPerks();
    if (level.playerSpawnLocs.size > 0)
    {
        playerSpawn = randomInt(level.playerSpawnLocs.size);
        self spawn(level.playerSpawnLocs[playerSpawn], level.playerSpawnAngles[playerSpawn]);
    }
    else
    {
        randomSpawn = getRandomSpawnpoint();
        self spawn(randomSpawn.origin, randomSpawn.angles);
    }
    level notify("player_spawned", self);
    self onPlayerSpawn();
}

onPlayerSpawn()
{
    //self playerHide();
    //self.sessionState = "playing";
    //self.sessionTeam = "allies";
    //self.maxHealth = level.maxPlayerHealth;
    //self.health = level.maxPlayerHealth;
    //self givePerk("specialty_spygame", true);
    //self setSpawnWeapon("iw5_usp45_mp");
    self.pers["team"] = "allies";
    self.curClass = "custom1";
    self.newGunReady = true; // feature to give 2 guns or a fix
    self.perk4weapon = "";
    self.perksBought = []; // set perks to not used for buying
    for (i = 0; i < 7; i++)
    {
        self.perksBought[i] = false;
    }
    self.perkHudsDone = [];
    for (i = 0; i < 7; i++)
    {
        self.perkHudsDone[i] = false;
    }
    self.lastBoughtPerk = "";
    self.totalPerkCount = 0;
    self.gamblerReady = true;
    self.gamblerInUse = false;
    self.autoRevive = false;
    self.isAlive = true;
    currentTime = getTime();
    self.lastDamageTime = currentTime;
    self.lastSpawnTime = currentTime;
    self.spawnTime = currentTime;
    self.weaponsList = [];

    self thread setSpawnModel();
    if (level.isHellMap && !level.visionRestored) self visionSetNakedForPlayer(level.hellVision);
    else self visionSetNakedForPlayer(level.vision);
    self visionSetThermalForPlayer(level._mapname, 0);
    self setClientDvar("thermalBlurFactorScope", 0);//Clear up thermal scope
    self setClientDvar("g_hardcore", 1);
    self setClientDvar("cg_drawCrosshair", 1);
    self setClientDvar("ui_drawCrosshair", 1);
    //self setClientDvar("compassRotation", false);
    //self setClientDvar("g_compassShowEnemies", 1);
    //self setClientDvar("cg_objectiveText", formatString(level.gameStrings[19], level.totalWaves));
    self setClientDvar("ui_gametype", "^2AIZombies Supreme");
    self setClientDvar("ui_mapname", getZombieMapname());
    self setClientDvar("g_scriptMainMenu", level.pauseMenu);
    self setClientDvars("ui_allow_teamchange", 0, "ui_allow_classchange", 0);
    self setViewKickScale(4);

    if (level.zState != "intermission")
    {
        self suicide();
        self setPlayerAsSpectator();
        return;
    }

    self setOffhandSecondaryClass("flash");
    self takeAllWeapons();
    self clearPerks();
    self setCanRadiusDamage(false);
    self openMenu("perk_hide");

    if (level.gameEnded)
    {
        self.sessionState = "spectator";
        return;
    }

    self setStartingPistol();
    self giveWeapon("frag_grenade_mp");
    //self giveMaxAmmo("frag_grenade_mp");
    self setOffhandPrimaryClass("frag");

    self givePerk("specialty_pistoldeath", false);
    //self givePerk("specialty_finalstand", false);
    self givePerk("specialty_extendedmelee", false);
    self setActionSlot(3, "altMode");//Fix the ALTs not working

    if (self.cash < 1500 && level.wave > 10)
    {
        self.cash = 1500;
        self.score = 1500;
        if (isDefined(self.aizHud_created))
        {
            scoreCountHud = self.hud_score;
            scoreCountHud setValue(1500);
        }
    }

    self disableWeaponPickup();

    self.isDown = false;
    self.deathHud = false;//Reset any death machine hud since it's player-based
    self.autoRevive = false;

    self.statusIcon = "";//Fix dead icon sticking
    if (isDefined(self.isDev) && self.isDev)
    {
        self.statusIcon = "cardicon_iwlogo";
        //self.name = "^2Slvr99^7";
        self thread watchDevSay();
    }

    //Hud
    self maps\mp\gametypes\_aiz_hud::updateAmmoHud(true);

    updatePlayerCountForScoreboard();
    //mapEdit init

    self.ammoCostAddition = 0;
    self.ammoMatic = false;

    self thread maps\mp\gametypes\_aiz_map_edits::trackUsablesForPlayer();

    self thread watchPlayerDamage();

    //killstreaks init
    self.kills = 0;
    //self.deaths = 0;
    //self.assists = 0;
    self.ownsPredator = false;
    self.ownsSentry = false;
    self.ownsSentryGL = false;
    self.isCarryingSentry = false;
    self.ownsEMP = false;
    self.ownsAirstrike = false;
    self.ownsMW2Airstrike = false;
    self.ownsSuperAirstrike = false;
    self.ownsNuke = false;
    self.ownsLittlebird = false;
    self.ownsOverwatch = false;
    self.ownsBot = false;
    self.ownsSubBot = false;
    self.ownsLMGBot = false;
    self.ownsAirdrop = false;
    self.ownsEmergencyAirdrop = false;
    self.ownsHeliSniper = false;
    self.ownsExpAmmo = false;
    self.ownsMapStreak = false;
    self.hasExpAmmoPerk = false;
    self.notTargetable = false;
    self.percent = 0;

    //hud init
    if (!isDefined(self.cash))
        self.cash = 500;
    if (!isDefined(self.points))
        self.points = 0;
    self.hasMessageUp = false; 

    //All perks
    if ((isDefined(self.allPerks) && self.allPerks) || (isDefined(level.allPerks) && level.allPerks))
    {
        self maps\mp\gametypes\_aiz_bonus_drops::giveAllPerks();
        //Give hand-gun to fill second slot for mule kick
        self giveWeapon("defaultweapon_mp");
        self updatePlayerWeaponsList("defaultweapon_mp");
    }

    //self notify("spawned_player");

    self setEMPJammed(false);

    self closeInGameMenu();
    self closeMenu("team_marinesopfor");
}
watchDevSay()
{
    self notify("watch_dev_say");

    level endon("game_ended");
    self endon("disconnect");
    self endon("watch_dev_say");

    while (true)
    {
        level waittill("say", message, player);

        if (!isSubStr(message, "/"))
            continue;

        if (message == "/toggleBotsIgnoreMe")
        {
            if (isDefined(player.notTargetable) && player.notTargetable)
            {
                player.notTargetable = false;
                iPrintLn(player.name + " ^7notarget OFF");
            }
            else if (isDefined(player.notTargetable) && !player.notTargetable)
            {
                player.notTargetable = true;
                iPrintLn(player.name + " ^7notarget ON");
            }
        }
        else if (isSubStr(message, "giveGun "))
        {
            tokens = strTok(message, " ");
            weapon = tokens[1];
            if (weaponIsAkimbo(weapon))
                player giveWeapon(weapon, 0, true);
            else
                player giveWeapon(weapon);
            player updatePlayerWeaponsList(weapon);
            player thread switchToWeapon_delay(weapon, .2);
        }
        else if (isSubStr(message, "setWave "))
        {
            tokens = strTok(message, " ");
            wave = int(tokens[1]);
            if (wave > level.totalWaves && level.totalWaves > 0)
            {
                player iPrintLnBold("^1Unable to set wave above " + level.totalWaves + "!");
                continue;
            }
            else if (wave < 0)
            {
                player iPrintLnBold("^1Unable to set wave below 0!");
                continue;
            }
            level.wave = wave;
            level thread maps\mp\gametypes\_aiz_hud::onRoundChange();
        }
        else if (isSubStr(message, "setStreak "))
        {
            tokens = strTok(message, " ");
            kills = int(tokens[1]);
            player.kills = kills;
            player maps\mp\gametypes\_aiz_killstreaks::checkKillstreak();
        }
        else if (message == "/killAllZombies")
        {
            level.nukeOffsetScalar = 0;
            level notify("zombie_nuke");
        }
        else if (message == "/listmapents")
        {
            for (i = 0; i < 2046; i++)
            {
                ent = getEntByNum(i);
                if (!isDefined(ent))
                    continue;

                targetName = ent.targetname;
                if (!isDefined(targetname))
                    targetname = "";
                className = ent.classname;
                if (!isDefined(classname))
                    classname = "";
                model = ent.model;
                if (!isDefined(model))
                    model = "";
                target = ent.target;
                if (!isDefined(target))
                    target = "";
                origin = ent.origin;
                printLn("Entity " + i + ": origin = " + origin + " ; classname = " + classname + " ; targetname = " + targetname + " ; target = " + target +  " ; model = " + model);
            }
        }
        else if (message == "/viewpos")
        {
            printLn(self.origin);
            printLn(self.angles);
        }
    }
}

onPlayerDisconnect()
{
    self waittill("disconnect");

    //Re-enable theater mode for client
    //self setClientDvars("cl_demo_recordPrivateMatch", 1, "cl_demo_enabled", 1);
    //Reset our netcode so we don't ruin other server performance for the player
    //self setClientDvars("sv_fps", 20, "snaps", 20, "rate", 20000);

    //These special weapon checks are disabled since we cannot check for player weapon ownership once they leave
    //TODO: Rework this into a user field and check that way instead
    //if (self hasRayGun()) level.currentRayguns--;
    //else if (self hasThunderGun()) level.currentThunderguns--;

    if (isDefined(self.bot)) self thread maps\mp\gametypes\_aiz_killstreaks::killPlayerBot();
    if (isDefined(self.barbed_wire)) self.barbed_wire maps\mp\gametypes\_aiz_killstreaks::destroyBarbedWire();
    level thread maps\mp\gametypes\_aiz_round_system::checkForEndGame();
    //Moved from Hud.
    self maps\mp\gametypes\_aiz_hud::destroyPlayerHud();

    updatePlayerCountForScoreboard();

    if (isDefined(self.giftTrigger))
    {
        if (array_contains(level.usables, self.giftTrigger)) self.giftTrigger maps\mp\gametypes\_aiz_map_edits::removeUsable();
        self.giftTrigger delete();
        self.giftTrigger = undefined;
    }

    maps\mp\gametypes\_aiz_round_system::updateMaxBotCount();
}

playIntroVO()
{
    wait(1);

    self playLocalSound("US_1mc_aizombies");
}

initGameNotifies()
{
    level thread watchMatchStart();

    level thread watchStingerFired();
}

watchMatchStart()
{
    level endon("game_ended");

    while (!level.gameStarted)
    {
        result = self waittill_any_return("match_start_timer_beginning", "prematch_over");

        foreach (player in level.players)
        {
            if (level.isHellMap)
            {
                if (isPlayer(player))
                {
                    wait(0.5);
                    player visionSetNakedForPlayer(level.hellVision);
                }
            }
            else
            {
                if (isPlayer(player))
                {
                    wait(0.5);
                    player visionSetNakedForPlayer(level.vision);
                }
            }
        }

        if (isDefined(result) && result == "prematch_over")
            level.gameStarted = true;
    }
}
watchGrenadeFire()
{
    level endon("game_ended");
    self endon("disconnect");

    while(true)
    {
        self waittill("grenade_fire", marker, weapon);

        if (!isPlayer(self) || !self.isAlive) continue;

        self maps\mp\gametypes\_aiz_hud::updateAmmoHud(false);

        switch (weapon)
        {
            case "lightstick_mp":
                maps\mp\gametypes\_aiz_bot_util::dropGlowstick(marker.origin);
                break;
            case "strike_marker_mp":
                strikeOwner = marker;
                if (self.ownsAirstrike)
                {
                    strikeOwner = self;
                    //strikeOwner teamSplash("used_ac130");
                    //marker.type = "strike";
                    marker.owner = strikeOwner;

                    self thread takeWeaponAfterWait(0.5, "strike_marker_mp");
                }
                marker thread watchForMarkerStick(3);
                break;
            case "airdrop_mega_marker_mp":
                megaOwner = marker;

                if (self.ownsEmergencyAirdrop)
                {
                    megaOwner = self;
                    megaOwner teamSplash("used_airdrop_mega");
                    //marker.type = "mega";
                    marker.owner = megaOwner;
                    //direction = megaOwner getPlayerAngles();
                    //megaMarker.direction = (0, direction[1], 0);

                    self thread takeWeaponAfterWait(0.5, "airdrop_mega_marker_mp");
                }

                marker thread watchForMarkerStick(0);
                break;
            case "airdrop_marker_mp":
                owner = marker;
                //marker.deleted = 0;

                if (self.ownsAirdrop)
                {
                    owner = self;
                    //marker.type = "care";
                    marker.owner = owner;

                    self thread takeWeaponAfterWait(0.5, "airdrop_marker_mp");
                }

                marker thread watchForMarkerStick(1);
                break;
            case "deployable_vest_marker_mp":
                ammoOwner = marker;

                if (self.ownsExpAmmo)
                {
                    ammoOwner = self;
                    //marker.type = "ammo";
                    marker.owner = ammoOwner;
                    marker setModel("weapon_oma_pack");

                    self thread takeWeaponAfterWait(0.5, "deployable_vest_marker_mp");
                }

                marker thread watchForMarkerStick(2);
                break;
            case "claymore_mp":
                claymoreOwner = marker;

                if (self.ownsMapStreak)
                {
                    claymoreOwner = self;
                    //claymoreOwner teamSplash("used_airdrop_mega");
                    marker.owner = claymoreOwner;

                    self thread takeWeaponAfterWait(0.5, "claymore_mp");
                }

                self maps\mp\gametypes\_aiz_killstreaks::spawnBarbWire(marker, claymoreOwner.origin);
                break;
            case "airdrop_juggernaut_def_mp":
                oilOwner = marker;

                if (self.ownsMapStreak)
                {
                    oilOwner = self;
                    //marker.type = "ammo";
                    marker.owner = oilOwner;

                    self thread takeWeaponAfterWait(0.5, "airdrop_juggernaut_def_mp");
                }

                trail = spawn("script_model", marker.origin);
                trail setModel("tag_origin");
                trail linkTo(marker);

                marker thread watchForMarkerStick(4);
                trail thread deleteOnMarkerStick(marker);

                waitframe();

                playFXOnTag(level.fx_trailFX, trail, "tag_origin");

                break;
        }
    }
}
deleteOnMarkerStick(marker)
{
    marker waittill_any_timeout( 5, "missile_stuck" );

    self delete();
}
/*
watchMoonJump()
{
    level endon("game_ended");
    self endon("disconnect");

    while (true)
    {
        self waittill("jumped");

        if (!self.isAlive) continue;
        if (!isDefined(self.moonGravity)) continue;

        while (!self isOnGround())
        {
            self setStance("stand");
            waitframe();
        }
    }
}
*/
watchReload()
{
    level endon("game_ended");
    self endon("disconnect");

    while (true)
    {
        self waittill("reload");

        if (!self.isAlive) continue;
        //if (!self isReloading()) continue;
        /*
        if (self getCurrentWeapon() == "thundergun_mp" && (self getWeaponAmmoStock("thundergun_mp") == 0 && self.thundergun_stock > 0))
        {
            stock = self.thundergun_stock;
            if (stock == 0) continue;
            stock -= 2;
            self.thundergun_stock = stock;
            self.thundergun_clip = 2;
            self setWeaponAmmoClip("thundergun_mp", 1);
            if (stock > 0) self setWeaponAmmoStock("thundergun_mp", 1);
        }
        else if (self getCurrentWeapon() == "thundergunupgraded_mp" && (self getWeaponAmmoStock("thundergunupgraded_mp") == 0 && self.zeus_stock > 0))
        {
            stock = self.zeus_stock;
            if (stock == 0) continue;
            stock -= 4;
            self.zeus_stock = stock;
            self.zeus_clip = 4;
            self setWeaponAmmoClip("thundergunupgraded_mp", 1);
            //self setWeaponAmmoStock("thundergunupgraded_mp", self getWeaponAmmoStock("thundergunupgraded_mp") - 3);//Take 3 more rockets away
            if (stock > 0) self setWeaponAmmoStock("thundergunupgraded_mp", 1);
        }
        */

        self maps\mp\gametypes\_aiz_hud::updateAmmoHud(false);
    }
}
watchWeaponSwitch()
{
    level endon("game_ended");
    self endon("disconnect");

    while (true)
    {
        self waittill("weapon_switch_started", newWeap);

        if (!self.isAlive) continue;
        if (!self isSwitchingWeapon()) continue;

        if (self.lastDroppableWeapon != newWeap && self hasWeapon(newWeap))
        {
            self maps\mp\gametypes\_aiz_hud::updateAmmoHud(true, newWeap);

            if (isWeaponDeathMachine(newWeap))
            {
                //self givePerk("specialty_extendedmags", false);
                self setWeaponAmmoClip(newWeap, 999);
                self setWeaponAmmoStock(newWeap, 0);
                //self _unSetPerk("specialty_extendedmags");
            }
        }
    }
}
watchWeaponSwitchPress()
{
    level endon("game_ended");
    self endon("disconnect");

    while (true)
    {
        self waittill("weapon_switch_pressed");

        if (!self.isAlive) continue;
        //if (!self isSwitchingWeapon()) continue;

        while (self isSwitchingWeapon())
            waitframe();

        self maps\mp\gametypes\_aiz_hud::updateAmmoHud(true);
    }
}
watchWeaponChange()
{
    level endon("game_ended");
    self endon("disconnect");

    while (true)
    {
        self waittill("weapon_change", weapon);

        if (!self.isAlive) continue;

        if (self getCurrentWeapon() != weapon) continue;

        if (aiz_mayDropWeapon(weapon) && !self.isDown)
            self.lastDroppableWeapon = weapon;

        self maps\mp\gametypes\_aiz_hud::updateAmmoHud(true, weapon);

        self maps\mp\gametypes\_aiz_killstreaks::executeKillstreak(weapon);
        
        self maps\mp\gametypes\_weapons::updateMoveSpeedScale();

        /*
        if (weapon == "trophy_mp")
        {
            if (isDefined(self.hasHelmetOn) && self.hasHelmetOn) self maps\mp\gametypes\_aiz_map_edits::takeOffHelmet();
            else self maps\mp\gametypes\_aiz_map_edits::putOnHelmet();
            continue;
        }
        */

        /*
        if (self.ownsBot && !isSpecialWeapon(weapon))
        {
            bot = self.bot;
            bot maps\mp\gametypes\_aiz_killstreaks::updateBotGun();
        }
        */

        if ((trimWeaponScope(weapon) == "iw5_type95_mp_reflex_xmags_camo11" || trimWeaponScope(weapon) == "iw5_m16_mp_rof_xmags_camo11"))
        {
            self setClientDvar("perk_weapRateMultiplier", "0.001");
            self.hasAlteredROF = true;
            self givePerk("specialty_rof", false);
            continue;
        }
        //else if (isRayGun(weapon))//Raygun is now configured in it's own weapondef
        //{
            //self setClientDvar("perk_weapRateMultiplier", "1");
            //self.hasAlteredROF = true;
            //self givePerk("specialty_rof", false);
            //self _unSetPerk("specialty_rof", false);//Just unset it to keep server-client rate synced
            //continue;
        //}
        else if (self.hasAlteredROF && !isWeaponDeathMachine(weapon))
        {
            self setClientDvar("perk_weapRateMultiplier", "0.75");
            if (array_contains(level.classicMaps, level._mapname))
            {
                self _unSetPerk("specialty_rof");
            }
            else
            {
                if (!self.perksBought[4]) self _unSetPerk("specialty_rof");
                else if (self.perksBought[4] && !self _hasPerk("specialty_rof")) self givePerk("specialty_rof", false);
            }
            self.hasAlteredROF = false;
            continue;
        }

        if (weapon == "iw5_riotshield_mp")
            self givePerk("specialty_fastermelee", false);
        else if (self _hasPerk("specialty_fastermelee")) self _unSetPerk("specialty_fastermelee");

        if (weapon == "stinger_mp")
            self zapper_runFX();
    }
}
watchWeaponFired()
{
    level endon("game_ended");
    self endon("disconnect");

    while (true)
    {
        self waittill("weapon_fired", weapon);

        self specialWeaponFunction(weapon);
    }
}
/*
watchWeaponBeginFiring()
{
    level endon("game_ended");
    self endon("disconnect");

    while (true)
    {
        self waittill("begin_firing");

        if (!self.isAlive) continue;
        currentWeapon = self getCurrentWeapon();
        if (currentWeapon == "stinger_mp")// || currentWeapon == "thundergun_mp" || currentWeapon == "thundergunupgraded_mp")
        {
            self weaponLockFinalize(self);
            self weaponLockNoClearance(false);
            self weaponLockTargetTooClose(false);
        }
    }
}
*/
/*
watchMissileFire()
{
    level endon("game_ended");
    self endon("disconnect");

    while(true)
    {
        self waittill("missile_fire", missile, weapon);

        //Hack in stinger_fired notify to new thundergun weapon
        if (weapon == "thundergun_mp")
        {
            level notify("stinger_fired", self, missile, level);
        }
    }
}
*/
watchStingerFired()
{
    level endon("game_ended");

    while (true)
    {
        self waittill("stinger_fired", player, missile);

        if (player getCurrentWeapon() == "stinger_mp")
        {
            missile delete();

            origin = player getTagOrigin("tag_weapon_left");
            zap = spawn("script_model", origin);
            zap setModel("tag_origin");

            angles = player getPlayerAngles();
            asd = anglesToForward(angles) * 1000000;
            hitPos = bulletTrace(origin, asd, false, zap);

            time = distance(origin, hitPos["position"]) / 1200;
            zap zapper_runZap_entCheck(player, time, hitPos["position"]);

            wait(0.05);
            zap zapper_playZapEffect();
        }
    }
}
watchPlayerCommands()
{
    self thread watchBankWithdraw();

    self thread watchScoreboardOpen();

    self thread watchScoreboardClose();

    //self thread watchPlayerAntiCheat();
}
watchBankWithdraw()
{
    self notify("track_bank");
    level endon("game_ended");
    self endon("track_bank");
    self endon("disconnect");

    while (true)
    {
        self waittill("bankWithdraw");

        foreach (usable in level.usables)
        {
            if (usable.usabletype != "bank") continue;
            if (isDefined(usable.range) && distanceSquared(self.origin, usable.origin) < usable.range)
            {
                self maps\mp\gametypes\_aiz_map_edits::useBank(false);
                break;
            }
        }
    }
}
watchScoreboardOpen()
{
    self endon("disconnect");

    while (true)
    {
        self waittill("+scoreboard");

        self.isViewingScoreboard = true;
    }
}
watchScoreboardClose()
{
    self endon("disconnect");

    while (true)
    {
        self waittill("-scoreboard");

        self.isViewingScoreboard = false;
    }
}
watchPlayerAntiCheat()
{
    self endon("disconnect");

    while (true)
    {
        self waittill("menuresponse", menu, response);

        if (isSubStr(menu, "changeclass") || isSubStr(menu, "givingLoadout"))//Anti force class
        {
            if (response != "allies_recipe1" && response != "back")
                kick(self getEntNum(), "MP_CHANGE_CLASS_NEXT_SPAWN");

            return;
        }
        else if (menu == "team_marinesopfor")//Anti force team
        {
            if (response != "allies")
                kick(self getEntNum(), "MP_CANTJOINTEAM");

            return;
        }
    }
}

zapper_playZapEffect()
{
    playFXOnTag(level.fx_zapperShot, self, "tag_origin");
    playFXOnTag(level.fx_zapperTrail, self, "tag_origin");
    self playLoopSound("tactical_insert_flare_burn");//Zap sound
}

zapper_runFX()
{
    fx = spawnFX(level.fx_zapper, self getTagOrigin("tag_weapon_left"));//playLoopedFX(level.fx_zapper, 0.5, origin);
    //fx linkTo(self, "tag_flash", (0, 0, 0), (0, 0, 0));

    self thread zapper_runSoundEffects();

    self thread zapper_runSparks(fx);
}
zapper_runSparks(fx)
{
    fx endon("death");
    self endon("death");

    while (true)
    {
        if (self getAmmoCount("stinger_mp") > 0 && self.isAlive)
        {
            fx.origin = self getTagOrigin("tag_weapon_left");
            triggerFX(fx);
        }

        if (self getCurrentWeapon() != "stinger_mp" || !self.isAlive)
        {
            fx delete();
            break;
        }
        
        wait(0.05);
    }
}
zapper_runSoundEffects()
{
    level endon("game_ended");

    while (true)
    {
        if (self getCurrentWeapon() != "stinger_mp" || !self.isAlive)
        {
            self stopSounds();
            break;
        }
        if (self getAmmoCount("stinger_mp") > 0) self playSound("talon_destroyed_sparks");
        
        wait(3);
    }
}
zapper_runZap_entCheck(player, time, hitPos)
{
    self vibrate((1, 0, 1), 2, 0.8, time);
    self moveTo(hitPos, time);
    self thread zapper_runEntCheck(player, hitPos);
}
zapper_runEntCheck(player, hitPos)
{
    hasHit = false;
    while (true)
    {
        foreach (bot in level.botsInPlay)
        {
            if (!bot.isAlive) continue;

            botHitbox = bot.hitbox;
            if (distanceSquared(self.origin, botHitbox.origin) > 40000) continue;

            hasHit = true;
            break;
        }
        if (distanceSquared(self.origin, hitPos) < 4 || hasHit)
        {
            self zapper_checkForNearbyTargets(player);
            return;
        }

        wait(0.05);
    }
}
zapper_checkForNearbyTargets(player)
{
    foreach (bot in level.botsInPlay)
    {
        if (!bot.isAlive) continue;

        botHitbox = bot.hitbox;
        if (distanceSquared(self.origin, botHitbox.origin) > 40000) continue;

        self thread zapper_zapTarget(player, bot);
        return;
    }

    playSoundAtPos(self.origin, "trophy_fire");
    playFX(level.fx_zapperExplode, self.origin);
    self delete();
}
zapper_zapTarget(player, bot)
{
    zapPos = bot getTagOrigin("j_head");
    self moveTo(zapPos, 0.1);

    wait(0.05);

    mod = "MOD_HEADSHOT";
    isCrawler = !isDefined(bot.head) && !isDefined(bot.isBoss);
    if (isCrawler) mod = "MOD_PASSTHRU";
    bot.hitbox notify("damage", 10000, player, (0, 0, 0), zapPos, mod, "", "", "j_head", 0, "stinger_mp");//Moving damage notify here to give it a frame to process before looping again

    wait(0.05);

    playSoundAtPos(self.origin, "trophy_fire");
    playFX(level.fx_zapperExplode, zapPos);

    self zapper_checkForNearbyTargets(player);//Loop again
}
runRaygun(player, time, hitPos, fxName, damage)
{
    self moveTo(hitPos, time);
    wait(min(time, 5));
    stopFXOnTag(fxName, self, "tag_origin");
    if (fxName == level.fx_rayGunUpgrade)
        explodeFx = level.fx_redSmoke;
    else
        explodeFx = level.fx_greenSmoke;
    playFXOnTag(explodeFx, self, "tag_origin");
    radiusDamage(hitPos, 96, damage, 100, player);
    wait(0.1);
    self delete();
}

runRaygun_entCheck(player, time, hitPos, fxName, damage)
{
    self moveTo(hitPos, time);
    self thread runRaygun_entCheckLoop(player, hitPos, fxName, damage);
}
runRaygun_entCheckLoop(player, hitPos, fxName, damage)
{
    shotTime = getTime();
    closest = undefined;
    while (true)
    {
        foreach (bot in level.botsInPlay)
        {
            if (distanceSquared(bot.hitbox.origin, self.origin) < 1600)
            {
                closest = bot;
                break;
            }
        }

        if (distanceSquared(self.origin, hitPos) < 4 || isDefined(closest) || getTime() > shotTime + 6000)
        {
            stopFXOnTag(fxName, self, "tag_origin");
            if (fxName == level.fx_rayGunUpgrade)
                explodeFx = level.fx_redSmoke;
            else
                explodeFx = level.fx_greenSmoke;
            playFXOnTag(explodeFx, self, "tag_origin");
            radiusDamage(self.origin, 96, damage, 100, player);

            wait(0.1);

            self delete();
            break;
        }
        
        waitframe();
    }
}
specialWeaponFunction(weapon)
{
    if (!self.isAlive) return;

    self maps\mp\gametypes\_aiz_hud::updateAmmoHud(false);

    //if (self getAmmoCount(weapon) == 0) return;
    //isFiring = self attackButtonPressed();
    //if (!isFiring) return;

    if (weapon == "iw5_usp45_mp_akimbo_silencer02" || weapon == "iw4_berettaupgraded_mp" || weapon == "iw4_colt45upgraded_mp")
    {
        angles = self getPlayerAngles();
        asd = anglesToForward(angles) * 1000000;
        origin = self getTagOrigin("tag_weapon_left");
        magicBullet("m320_mp", origin, asd, self);
    }
    else if (weapon == "rpg_mp")
    {
        self thread fireUpgradedRPG(1);
    }
    else if (weapon == "iw4_rpgupgraded_mp")
    {
        self thread fireUpgradedRPG(2);
    }
    else if (weapon == "uav_strike_marker_mp")
    {
        angles = self getPlayerAngles();
        asd = anglesToForward(angles) * 1000000;
        origin = self getTagOrigin("tag_weapon_left");
        magicBullet("iw5_xm25_mp", origin, asd, self);
        magicBullet("rpg_mp", origin, asd, self);
        magicBullet("iw5_smaw_mp", origin, asd, self);
        //magicBullet("stinger_mp", origin, asd, self);
        self setWeaponAmmoStock("uav_strike_marker_mp", 2);
    }
    else if (isRayGun(weapon) && weapon != "t5_raygun_mp" && weapon != "t5_raygunupgraded_mp")
    {
        angles = self getPlayerAngles();
        asd = anglesToForward(angles) * 1000000;
        origin = self getTagOrigin("tag_weapon_left");
        hitPos = bulletTrace(origin, asd, false, self);
        fx = spawn("script_model", origin);
        fx setModel("tag_origin");
        if (weapon == "iw5_raygun_mp_eotechsmg_xmags_scope7" || weapon == "iw4_raygunupgraded_mp")
            fxName = level.fx_rayGunUpgrade;
        else
            fxName = level.fx_rayGun;
        fx thread startRayGunShotFX(fxName);
        time = distance(origin, hitPos["position"]) / 1200;
        if (weapon == "iw5_raygun_mp_eotechsmg_xmags_scope7" || weapon == "iw4_raygunupgraded_mp")
            damage = 2000;
        else
            damage = 1000;
        //fx thread runRaygun(self, time, hitPos["position"], fxName, damage);
        fx runRaygun_entCheck(self, time, hitPos["position"], fxName, damage);
    }
    else if (weapon == "iw5_pp90m1_mp_silencer_xmags_camo10")
    {
        origin = self getTagOrigin("tag_weapon_left");
        angles = self getTagAngles("tag_weapon_left");
        forward = anglesToForward(angles);
        up = anglesToUp(angles);
        flameFX = spawnFX(level.fx_flamethrower, origin, forward, up);
        triggerFX(flameFX);
        flameFX thread deleteAfterTime(0.1);
    }
    else if (weapon == "iw4_tmpsilencer_mp" || weapon == "iw4_tmpsilencerupgraded_mp")
    {
        angles = self getPlayerAngles();
        forward = anglesToForward(angles);
        origin = self getTagOrigin("tag_weapon_left");
		end = origin + (forward * 1000);

		self thread runFlameFX(origin, forward, weapon == "iw4_tmpsilencerupgraded_mp");
    }
    else if (isThunderGun(self getCurrentWeapon()))
    {
        fxOrigin = self getTagOrigin("tag_weapon_left");
        playFX(level.fx_thundergun, fxOrigin);//No angles because the fx is billboard

        //self playSound("missile_attackheli_fire");

        physicsExplosionCylinder(fxOrigin, 512, 128, 25);

        foreach (bot in level.botsInPlay)
        {
            if (!bot.isAlive) continue;

            hitbox = bot.hitbox;
            playerOrigin = self.origin;
            isVisible = self worldPointInReticle_Circle(hitbox.origin, 125, 105) && distanceSquared(bot.origin, playerOrigin) < 360000;
            visibility = bot sightConeTrace(self getEye(), self);
            if (isVisible && visibility > 0)
            {
                if (weapon == "thundergunupgraded_mp" || weapon == "t5_thundergunupgraded_mp")
                    damage = 3000;
                else
                    damage = 1500;
                hitbox notify("damage", (damage - distance(bot.origin, playerOrigin)), self, (0, 0, 0), bot.origin, "MOD_IMPACT", "", "", "", 0, "bomb_site_mp");
            }
        }
    }
    else if (weapon == "iw4_model1887fmjupgraded_mp")
    {
        angles = self getPlayerAngles();
        targetPos = anglesToForward(angles) * 1000000;
        eyeTag = self getTagOrigin("tag_eye");
        magicBullet("iw4_spas12_mp", eyeTag, targetPos, self);
        magicBullet("iw4_model1887_mp", eyeTag, targetPos, self);
        magicBullet("iw5_cheytac_mp", eyeTag, targetPos, self);
        switch(randomInt(30))
        {
            case 1:
                magicBullet("rpg_mp", eyeTag, targetPos, self);
                break;
            case 20:
                magicBullet("ac130_40mm_mp", eyeTag, targetPos, self);
                break;
            case 10:
                magicBullet("m79_mp", eyeTag, targetPos, self);
                break;
        }
    }
    else if (weapon == "iw4_javelin_mp")
    {
        angles = self getPlayerAngles();
        asd = anglesToForward(angles) * 1000000;
        eyeTag = self getTagOrigin("tag_eye");
        magicBullet("javelin_mp", eyeTag, asd, self);
        self thread MW2LauncherCooldown("iw4_javelin_mp", 15);
    }
    else if (weapon == "iw4_stinger_mp")
    {
        angles = self getPlayerAngles();
        asd = anglesToForward(angles) * 1000000;
        eyeTag = self getTagOrigin("tag_eye");
        switch(randomInt(3))
        {
            case 0:
                magicBullet("javelin_mp", eyeTag, asd, self);
                break;
            case 1:
                magicBullet("at4_mp", eyeTag, asd, self);
                break;
            case 2:
                magicBullet("ac130_105mm_mp", eyeTag, asd, self);
                break;
        }
        self thread MW2LauncherCooldown("iw4_stinger_mp", 5);
    }

    if (isRayGun(weapon) && weapon != "t5_raygun_mp" && weapon != "t5_raygunupgraded_mp")
            self playSound("whizby_far_00_L");
    if (weaponIsUpgrade(weapon) && !isWeaponDeathMachine(weapon) && weapon != "t5_raygunupgraded_mp")
        self playSound("whizby_far_05_L");
}
fireUpgradedRPG(shots)
{
    self endon("death");
    self endon("disconnect");

    angles = self getPlayerAngles();
    asd = anglesToForward(angles) * 1000000;
    origin = self getTagOrigin("tag_weapon_left");
    for(i = 0; i < shots; i += 1)
	{
        wait(0.1);
        magicBullet("rpg_mp", origin, asd, self);
    }
}
runFlameFX(startPos, direction, upgrade)
{
    self endon("disconnect");

    pos = startPos + (direction * 150); 
	doDamage = true;
    hasHitBot = false;

	for(i = 0;;i++) 
	{
		pos = startPos + (direction * (i * 100)); 

		if(distanceSquared(startPos, pos) > 1000000) 
		{
			doDamage = false;
			break;
		}

        foreach (bot in level.botsInPlay)
        {
            if (distanceSquared(bot.hitbox.origin, pos) < 4096)
            {
                hasHitBot = true;
                break;
            }
        }

		if(!bulletTracePassed(startPos, pos, false, self) || hasHitBot)
		{
            trace = bulletTrace(startPos, pos, false, self);
            if (upgrade)
                impactFX = spawnFX(level.fx_flamethrowerImpactUpgrade, trace["position"]);
            else
			    impactFX = spawnFX(level.fx_flamethrowerImpact, trace["position"]);

			triggerFX(impactFX);

			wait(0.2);

			impactFX delete();
			
			break;
		}

		flameFX = spawnFX(level.fx_flamethrowerFlame, pos);
		triggerFX(flameFX);
		flameFX thread deleteAfterTime(0.1);

		wait(0.05);
	}

	if(doDamage)
    {
        foreach (bot in level.botsInPlay)
        {
            if (distanceSquared(bot.hitbox.origin, pos) < 4096)
            {
                damage = 40;
                if (upgrade)
                    damage = 140 - distance(bot.hitbox.origin, pos);
                weapon = "iw4_tmpsilencer_mp";
                if (upgrade)
                    weapon = "iw4_tmpsilencerupgrade_mp";

                bot.hitbox notify("damage", damage, self, (0, 0, 0), pos, "MOD_FLAME", "", "", "", 0, weapon);
            }
        }
        //radiusDamage(pos, 20, 40, 40, self);
    }
}
MW2LauncherCooldown(weapon, time)
{
    level endon("game_ended");
    self endon("death");
    self endon("disconnect");

    self iPrintlnBold("Reloading. Wait &&1 seconds", time);

    wait(1);

    for (i = time - 1; i > 0; i--)
    {
        self iPrintlnBold("&&1 seconds", i);
        wait(1);
    }
    self iPrintlnBold("Weapon Ready to Fire");
    self setWeaponAmmoClip(weapon, 1);
}
startRayGunShotFX(fxName)
{
    wait(0.05);

    playFXOnTag(fxName, self, "tag_origin");
}
deleteAfterTime(time)
{
    wait(time);

    self delete();
}
watchForMarkerStick(type)
{
    self waittill_any_timeout( 5, "missile_stuck" );
    self onMissileStuck(type);
}

onMissileStuck(type)
{
    //if (!isDefined(self.type) || self.type == "") return;
    dropPos = self.origin;
    switch (type)
    {
        case 0:
            playFX(level.fx_carePackage, dropPos, anglesToForward(self.angles), anglesToRight(self.angles));
            self playSound("smokegrenade_explode_default");
            maps\mp\gametypes\_aiz_killstreaks::callEmergencyAirdrop(self, dropPos);
            break;
        case 1:
            playFX(level.fx_carePackage, dropPos, anglesToForward(self.angles), anglesToRight(self.angles));
            self playSound("smokegrenade_explode_default");
            maps\mp\gametypes\_aiz_killstreaks::callAirdrop(self, dropPos);
            break;
        case 2:
            maps\mp\gametypes\_aiz_killstreaks::deployableExpAmmo(self, dropPos);
            break;
        case 3:
            self maps\mp\gametypes\_aiz_killstreaks::airStrike(dropPos);
            break;
        case 4:
            maps\mp\gametypes\_aiz_killstreaks::spawnOilSpill(self, dropPos);
            break;
        default:
            break;
    }
    //self.type = undefined;
}

startIntermission()
{
    level.zState = "intermission";
    foreach (player in level.players)
    {
        if (player.sessionState != "playing" || !player.isAlive)
        {
            player spawnPlayer();
        }
    }

    if (level.intermissionTimerNum != 30) level thread maps\mp\gametypes\_aiz_hud::roundEndHud();

    intermission = self maps\mp\gametypes\_aiz_hud::createIntermissionTimer();
    intermission fadeOverTime(1);
    intermission.alpha = 1;

    intermission thread runIntermissionTimer();
}

runIntermissionTimer()
{
    while (true)
    {
        wait(1);

        if (level.gameEnded) return false;
        level.intermissionTimerNum--;
        self setValue(level.intermissionTimerNum);

        if (level.intermissionTimerNum == 1)
        {
            self fadeOverTime(1);
            self.alpha = 0;
        }
        else if (level.intermissionTimerNum == 0)
        {
            level.intermissionHud = undefined;
            self destroy();

            level.intermissionTimerNum = 20;
            maps\mp\gametypes\_aiz_round_system::startNextRound();
            level.zState = "ingame";
            break;
        }
    }
}

setStartingPistol()
{
    weapon = "iw5_usp45_mp";//Default
    if ((level.mw2Weapons == 1 || level.mw2Weapons == 2) && array_contains(level.classicMaps, level._mapname))
        weapon = "iw4_beretta_mp";
    else if (array_contains(level.wawMaps, level._mapname))
        weapon = "iw4_colt45_mp";

    if (level.spawnType == 1)//Allow this old spawn method to be used at request
    {
        if (level.mw2Weapons == 1 || (level.mw2Weapons == 2 && array_contains(level.classicMaps, level._mapname)))
            random = randomInt(8);
        else
            random = randomInt(4);

        if (random == 1) weapon = "iw5_p99_mp";
        else if (random == 2) weapon = "iw5_44magnum_mp";
        else if (random == 3) weapon = "iw5_deserteagle_mp";
        else if (random == 4) weapon = "iw4_beretta_mp";
        else if (random == 5) weapon = "iw5_deserteagletactical_mp";
        else if (random == 6) weapon = "iw4_coltanaconda_mp";
        else if (random == 7) weapon = "iw4_colt45_mp";
        //else(0) keep the original set var
    }

    self giveWeapon(weapon);
    self setSpawnWeapon(weapon);
    self giveMaxAmmo(weapon);

    //wait(0.5);
    //self switchToWeaponImmediate(weapon);

    self updatePlayerWeaponsList(weapon);
}

setSpawnModel()
{
    if (!isPlayer(self) || !self.isAlive)
        return;

    self setModel(level.bodyModel);
    self setViewModel("viewmodel_base_viewhands");
    waitframe();
    self attach(level.headModel, "", true);
	self.headModel = level.headModel;
    //self showPart("j_spine4");
    //self show();
}

doIntro()
{
    intros = [];
    currentIntroStringIndex = 78;
    for (i = 0; i < 5; i++)
    {
        intro = newClientHudElem(self);//self createFontString("objective", 1.5);
        intro.elemType = "font";
        intro.parent = level.uiParent;
        intro.children = [];
        intro.font = "objective";
        intro.fontScale = 1.5;
        intro.hideWhenInMenu = true;
        intro.archived = false;
        intro.sort = 1;
        intro maps\mp\gametypes\_hud_util::setPoint("TOP", "TOP", 0, 60 + (i * 16));
        intro.alpha = 1;
        intro.glowColor = (0.5, 0.5, 0.5);
        intro.glowAlpha = 0.7;
        intro.label = level.gameStrings[currentIntroStringIndex];

        if (currentIntroStringIndex == 78)
            intro setPlayerNameString(self);
        else if (currentIntroStringIndex == 79)
            intro setText(level.version);
        else if (currentIntroStringIndex == 80)
            intro setText(getZombieMapname());
        else if (currentIntroStringIndex == 82)
            intro setValue(level.totalWaves);

        intro setPulseFX(75, 10000 - (i * 1000), 2000);

        intros[intros.size] = intro;

        wait(1);

        currentIntroStringIndex++;
    }

    wait(10);

    foreach (intro in intros)
    {
        intro destroy();
    }
}

watchPlayerDamage()
{
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");

    while (true)
    {
        self waittill("damage");

        time = getTime();
        self.lastDamageTime = time;

        self thread onPlayerDamage(time);
    }
}
onPlayerDamage(time)
{
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    self endon("damage");

    wait(7);

    if (self.lastDamageTime == time && self.sessionState == "playing")
        self.health = self.maxHealth;
}
modifyPlayerDamage(victim, attacker, damage, mod, weapon, point, dir, hitLoc, offsetTime)
{
    if (victim.notTargetable)
        return false;

    if (mod == "MOD_FALLING" || mod == "MOD_TRIGGER_HURT")
        return damage;

    if (!isDefined(weapon))
        return false;

    if (weapon == "sentry_minigun_mp" || weapon == "manned_gl_turret_mp" || weapon == level.botWeapon_subBot || weapon == level.botWeapon_LMGBot || weapon == "" || weapon == "none")
        return false;

    return damage;
}

onNormalDeath(victim, attacker, lifeId)
{
    victim onPlayerKilled();
}

onPlayerKilled(eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration, lifeId)
{
    if (self hasThunderGun())
        level.currentThunderguns--;
    else if (self hasRayGun())
        level.currentRayguns--;

    self takeAllWeapons();

    if (level.gameEnded) return;

    self thread onPlayerDeath();
}

onPlayerLastStand(inflictor, attacker, damage, mod, weapon, dir, hitLoc, timeOffset, deathAnimDuration)
{
    if (mod == "MOD_CRUSH" || (mod == "MOD_TRIGGER_HURT" && damage >= self.maxhealth))
    {
        self suicide();
        return;
    }

    if (self.isDown) return;
    self.isDown = true;
    self playSound("freefall_death");

    //if (level._mapname == "mp_dome" && getZombieMapname() == "Moonbase")
        //self notify("helmet_on");

    self disableOffhandWeapons();
    self disableWeaponSwitch();
    self freezeControls(false);
    self.deaths++;

    if (self.autoRevive)
    {
        pulse = self maps\mp\gametypes\_aiz_hud::createReviveOverlayIcon();
        overlay = self maps\mp\gametypes\_aiz_hud::createReviveOverlay();
        overlay fadeOverTime(20);
        overlay.alpha = 0;

        self.hud_perks[6] scaleOverTime(20, 0, 0);
        self thread autoRevive_pulseIcon(pulse);

        self thread autoRevive_revivePlayer(overlay);
        return;
    }

    if (!isDefined(self.allPerks))
    {
        for (i = 0; i < 6; i++)
        {
            if (self.perksBought[i])
            {
                if (i == 0)
                {
                    self.maxhealth = level.maxPlayerHealth;
                    self.health = level.maxPlayerHealth;
                }
                else if (i == 1)
                {
                    self _unSetPerk("specialty_lightweight");
                    //self _unSetPerk("specialty_marathon");
                    self _unSetPerk("specialty_longersprint");
                }
                else if (i == 2)
                {
                    self _unSetPerk("specialty_fastreload");
                    //self _unSetPerk("specialty_quickswap");
                    self _unSetPerk("specialty_quickdraw");
                }
                else if (i == 3)
                {
                    if (isDefined(self.perk4weapon) && self hasWeapon(self.perk4weapon))
                    {
                        perk4weapon = self.perk4weapon;
                        if (isThunderGun(perk4weapon))
                            level.currentThunderguns--;
                        else if (isRayGun(perk4weapon))
                            level.currentRayguns--;
                        self takeWeapon(perk4weapon);
                        self updatePlayerWeaponsList(perk4weapon, true);
                    }
                    else
                    {
                        currentWeapon = self getCurrentWeapon();
                        if (isThunderGun(currentWeapon))
                            level.currentThunderguns--;
                        else if (isRayGun(currentWeapon))
                            level.currentRayguns--;
                        self takeWeapon(currentWeapon);
                        self updatePlayerWeaponsList(currentWeapon, true);
                    }
                    self.perk4weapon = "";
                    self.ammoMatic = false;
                }
                else if (i == 4)
                {
                    self _unSetPerk("specialty_rof");
                    self _unSetPerk("specialty_bulletdamage");
                }
                else if (i == 5)
                {
                    self _unSetPerk("specialty_stalker");
                    self _unSetPerk("specialty_bulletaccuracy");
                }
                self.perksBought[i] = false;
            }
        }
        self.totalPerkCount = 0;
        self maps\mp\gametypes\_aiz_hud::updatePerksHud(true);
    }

    reviveIcon = self maps\mp\gametypes\_aiz_hud::createReviveHeadIcon();
    reviveIcon.color = (1, 1, 1);

    iPrintLn(level.gameStrings[23], self.name);

    //reviver = spawn("script_model", self.origin);
    //reviver setModel("tag_origin");
    reviver = spawn("script_origin", self.origin);
    reviver linkTo(self);
    reviver.usableType = "revive";
    reviver.range = 60;
    reviver.player = self;
    reviver.icon = reviveIcon;
    reviver.user = undefined;
    //reviver.isBeingUsed = false;
    //self.headIcon = "waypoint_revive";
    //self.headIconTeam = "allies";
    reviver maps\mp\gametypes\_aiz_map_edits::addUsable("revive", 50);

    if (!self hasWeapon("iw5_usp45_mp"))
        self giveWeapon("iw5_usp45_mp");
    self giveMaxAmmo("iw5_usp45_mp");
    self switchToWeaponImmediate("iw5_usp45_mp");

    //red = 1;
    self.deathCount = 0;
    self thread startDeathCountdown(reviveIcon, reviver);
}
startDeathCountdown(reviveIcon, reviver)
{
    while (true)
    {
        wait(1);

        if (level.gameEnded || !isDefined(self))
        {
            reviveIcon destroy();
            reviver delete();
            return;
        }

        if (isDefined(reviver.user)) continue;

        if (!self.isDown)
        {
            break;
        }

        if (isPlayer(self)) self pingPlayer();
        self.deathCount++;

        if (self.deathCount == 15 && self.isDown) self visionSetNakedForPlayer("cheat_bw", 15);

        if (self.deathCount > 15)//Tint icon red
        {
            if (reviveIcon.color[1] >= 0.05)
                reviveIcon.color -= (0, 0.05, 0.05);
        }

        if (self.deathCount == 30)
        {
            self suicide();
            //Take score from other players
            foreach (player in level.players)
            {
                if (isDefined(player.isDown) && player.isAlive)
                {
                    if (player.isDown) continue;//Don't punish downed players
                    if (player.sessionState != "playing") continue;//Or spectators

                    amount = int(player.cash / 15);//Take a percent away
                    amount -= amount % 10;//Remove the difference
                    player.cash -= amount;
                    if (player.cash < 0) player.cash = 0;
                    player maps\mp\gametypes\_aiz_hud::scorePopup(-amount);
                    player maps\mp\gametypes\_aiz_hud::scoreMessage(level.gameStrings[24], self);
                }
                else continue;
            }
        }

        if (!self.isAlive)//Check for death after suicide
        {
            reviver maps\mp\gametypes\_aiz_map_edits::removeUsable();
            reviveIcon destroy();
            break;
        }

        if (!self.isDown)
            break;
    }
}
reviveGracePeriod()
{
    self.notTargetable = true;

    wait(1);

    if (isDefined(self))
        self.notTargetable = false;
}

onPlayerDeath()
{
    self.isAlive = false;

    //wait(0.2);

    if (isDefined(self.bot) && self.bot.state != "dead") self thread maps\mp\gametypes\_aiz_killstreaks::killPlayerBot();
    if (!level.isHellMap || (level.isHellMap && level.visionRestored)) self visionSetNakedForPlayer(level.vision);

    self.autoRevive = false;
    self maps\mp\gametypes\_aiz_hud::updatePerksHud(true);
    if (isDefined(self.aizHud_created))
    {
        ksList = self.hud_killstreakSlots;
        foreach (slot in ksList)
            slot.alpha = 0;
        //ksList setText("");
        //message = self.hud_message;
        //message setText("");
        self clearLowerMessage("usable_message");
    }
    
    /*
    if (level._mapname == "mp_dome" && getZombieMapname() == "Moonbase")
    {
        if (isDefined(self.hasHelmetOn))
        {
            helmet = self.hud_helmet;
            helmet destroy();
            self.hud_helmet = undefined;
            self.hasHelmetOn = false;
        }
    }
    */

    updatePlayerCountForScoreboard();

    self clearPlayerWeaponsList();

    self.isDown = true;//Just in case it doesn't get set prior to this stage

    iPrintLn(level.gameStrings[26], self.name);

    self thread playerDeathVisual(10);

    self.sessionState = "dead";
    self.statusIcon = "hud_status_dead";

    self playSound("generic_death_american_" + randomIntRange(1, 9));

    self setPlayerAsSpectator();

    wait(0.5);

    self iPrintLnBold(level.gameStrings[25]);

    wait(0.5);

    self checkForPlayerRespawn();
}
setPlayerAsSpectator()
{
    self setClientDvar("g_scriptMainMenu", level.pauseMenu);
    wait(1);
    self detach(level.headModel, "");
    self.sessionState = "spectator";
    self allowSpectateTeam("allies", true);
    self allowSpectateTeam("axis", true);
    self allowSpectateTeam("freelook", true);
    self allowSpectateTeam("none", true);
    //self notify("menuresponse", "team_marinesopfor", "spectator");
    //wait(0.1);
    //self closeMenu("changeclass");
}
checkForPlayerRespawn()
{
    if (level.zState == "intermission")
        self spawnPlayer();
    else level thread maps\mp\gametypes\_aiz_round_system::checkForEndGame();
}
playerDeathVisual(deathAnimDuration)
{
    self.body = self clonePlayer(deathAnimDuration);
    self.body startRagdoll();
    wait(deathAnimDuration);
    self.body delete();
    self.body = undefined;
}

autoRevive_revivePlayer(overlay)
{
    level endon("game_ended");
    self endon("death");
    self endon("disconnect");

    if (isDefined(overlay)) wait(20);

    if (isDefined(overlay)) overlay destroy();
    if (!self.isAlive) return;
    self lastStandRevive();
    self.isDown = false;
    self.autoRevive = false;
    self enableWeaponSwitch();
    self enableOffhandWeapons();
    weaponList = self.weaponsList;
    if (!array_contains(weaponList, "iw5_usp45_mp"))
    {
        self takeWeapon("iw5_usp45_mp");
        self switchToWeapon(self.lastDroppableWeapon);
    }
    if (self.perksBought[0])
        self.health = level.maxPlayerHealth_Jugg;
    else self.health = level.maxPlayerHealth;
    //self maps\mp\gametypes\_aiz_hud::updatePerksHud(false);
    self.perkHudsDone[6] = false;
    if (isDefined(self.hud_perk7))
    {
        self.hud_perk7.alpha = 0;
        self.hud_perk7 scaleOverTime(0.5, 40, 40);
    }
    self.totalPerkCount--;
    if (weaponList.size != 0) self switchToWeapon(weaponList[0]);
    self visionSetNakedForPlayer("");
}
autoRevive_pulseIcon(pulse)
{
    while (true)
    {
        if (level.gameEnded) break;

        pulse.alpha = 0.9;
        pulse scaleOverTime(0.6, 100, 100);
        pulse fadeOverTime(0.6);
        pulse.alpha = 0;

        if (!self.isDown || !self.isAlive)
        {
            pulse destroy();
            break;
        }

        wait(0.65);

        shaderName = "waypoint_revive";
        if ((level.classicPerks == 1 && !array_contains(level.wawMaps, level._mapname)) || (level.classicPerks == 2 && array_contains(level.classicMaps, level._mapname)))
            shaderName = "specialty_pistoldeath_upgrade";
        pulse setShader(shaderName, 30, 30);

        wait(0.85);
    }
}

loadConfig()
{
    //setDvarIfUninitialized("aiz_language", "english");
    setDvarIfUninitialized("aiz_spawnType", 0);
    setDvarIfUninitialized("aiz_maxHealth", 101);
    setDvarIfUninitialized("aiz_maxHealth_jugg", 251);
    setDvarIfUninitialized("aiz_botStartingHealth", 100);
    setDvarIfUninitialized("aiz_crawlerHealth", 110);
    setDvarIfUninitialized("aiz_bossHealth", 2500);
    setDvarIfUninitialized("aiz_botHealthFactor", 2);
    setDvarIfUninitialized("aiz_botDamage", 50);
    setDvarIfUninitialized("aiz_perkDrops", 1);
    setDvarIfUninitialized("aiz_mapVoting", 1);
    setDvarIfUninitialized("aiz_dlcMaps", 1);
    setDvarIfUninitialized("aiz_mw2Maps", 1);
    setDvarIfUninitialized("aiz_mw2MapsOnly", 0);
    setDvarIfUninitialized("aiz_wawMaps", 1);
    setDvarIfUninitialized("aiz_perkLimit", 4);
    setDvarIfUninitialized("aiz_zombieDeathVoice", 0);
    setDvarIfUninitialized("aiz_newPowerupModels", 1);
    setDvarIfUninitialized("aiz_mw2Weapons", 2);
    setDvarIfUninitialized("aiz_mw2Killstreaks", 2);
    setDvarIfUninitialized("aiz_mw2Perks", 2);
    setDvarIfUninitialized("aiz_boWonderWeapons", 0);
    setDvarIfUninitialized("aiz_maxZombies", 25);
    setDvarIfUninitialized("aiz_maxZombiesUnderLoad", 20);
    setDvarIfUninitialized("aiz_fullFireSale", 0);
    setDvarIfUninitialized("aiz_damageGracePeriod", 0.25);
    setDvarIfUninitialized("aiz_variedZombieSpeed", 2);
    setDvarIfUninitialized("aiz_randomZombieModels", 2);

    setGameDvars();
}

setGameDvars()
{
    level.spawnType = getDvarInt("aiz_spawnType");
    level.maxPlayerHealth = getDvarInt("aiz_maxHealth");
    level.maxPlayerHealth_Jugg = getDvarInt("aiz_maxHealth_jugg");
    level.botHealth = getDvarInt("aiz_botStartingHealth");
    level.crawlerHealth = getDvarInt("aiz_crawlerHealth");
    level.bossHealth = getDvarInt("aiz_bossHealth");
    level.botHealthScalar = getDvarInt("aiz_botHealthFactor");
    level.botDmg = getDvarInt("aiz_botDamage");
    level.perkDropsEnabled = getDvarInt("aiz_perkDrops");
    level.voting = getDvarInt("aiz_mapVoting");
    level.dlcEnabled = getDvarInt("aiz_dlcMaps");
    level.classicMapsEnabled = getDvarInt("aiz_mw2Maps");
    level.classicMapsOnly = getDvarInt("aiz_mw2MapsOnly");
    level.classicKillstreaks = getDvarInt("aiz_mw2Killstreaks");
    level.classicPerks = getDvarInt("aiz_mw2Perks");
    level.wawMapsEnabled = getDvarInt("aiz_wawMaps");
    level.perkLimit = getDvarInt("aiz_perkLimit");
    level.botDeathVoice = getDvarInt("aiz_zombieDeathVoice");
    level.legacyPowerupModels = getDvarInt("aiz_newPowerupModels") == 0;
    level.mw2Weapons = getDvarInt("aiz_mw2Weapons");
    level.maxActiveBots = getDvarInt("aiz_maxZombies");
    level.boWeapons = getDvarInt("aiz_boWonderWeapons");
    level.fullFireSale = getDvarInt("aiz_fullFireSale");
    level.damageGracePeriod = getDvarFloat("aiz_damageGracePeriod") * 1000;
    level.variedBotSpeed = getDvarInt("aiz_variedZombieSpeed");
    level.randomBotModels = getDvarInt("aiz_randomZombieModels");
}

clipSpaces(input)
{
    newStr = "";
    tokenizedStr = strTok(input, " ");
    foreach (str in tokenizedStr)
    {
        newStr += str;
    }

    return newStr;
}

getPlayerWithMostKills()
{
    score = 0;
    currentPlayer = undefined;
    foreach (player in level.players)
    {
        if (isPlayer(player) && player.score > score)
        {
            score = player.score;
            currentPlayer = player;
        }
    }
    if (isDefined(currentPlayer)) return currentPlayer;
    else
        return getEnt("mp_global_intermission", "classname");
}
getRandomSpawnpoint()
{
    spawns = getEntArray("mp_tdm_spawn", "classname");
    return spawns[randomInt(spawns.size)];
}
getAllEntitiesWithName(targetname)
{
    ents = getEntArray(targetname, "targetname");
    return ents;
}
getZombieMapname()
{
    //NOTE FOR PLUTOIW5: This func has been changed from TeknoMW3. The default names are now the actual mapnames, and all AIZ maps use level.zombieMapname now to save on string resources.
    //Pass through a custom name first before setting defaults
    if (isDefined(level.zombieMapname)) return level.zombieMapname;
    //If there's no custom, set defaults
    else
    {
        if (level._mapname == "mp_alpha") return level.gameStrings[110];
        else if (level._mapname == "mp_bootleg") return level.gameStrings[111];
        else if (level._mapname == "mp_bravo") return level.gameStrings[112];
        else if (level._mapname == "mp_carbon") return level.gameStrings[113];
        else if (level._mapname == "mp_dome") return level.gameStrings[114];
        else if (level._mapname == "mp_exchange") return level.gameStrings[115];
        else if (level._mapname == "mp_hardhat") return level.gameStrings[116];
        else if (level._mapname == "mp_interchange") return level.gameStrings[117];
        else if (level._mapname == "mp_lambeth") return level.gameStrings[118];
        else if (level._mapname == "mp_mogadishu") return level.gameStrings[119];
        else if (level._mapname == "mp_paris") return level.gameStrings[120];
        else if (level._mapname == "mp_plaza2") return level.gameStrings[121];
        else if (level._mapname == "mp_radar") return level.gameStrings[122];
        else if (level._mapname == "mp_seatown") return level.gameStrings[123];
        else if (level._mapname == "mp_underground") return level.gameStrings[124];
        else if (level._mapname == "mp_village") return level.gameStrings[125];
        else if (level._mapname == "mp_italy") return level.gameStrings[126];
        else if (level._mapname == "mp_park") return level.gameStrings[127];
        else if (level._mapname == "mp_morningwood") return level.gameStrings[128];
        else if (level._mapname == "mp_overwatch") return level.gameStrings[129];
        else if (level._mapname == "mp_aground_ss") return level.gameStrings[130];
        else if (level._mapname == "mp_courtyard_ss") return level.gameStrings[131];
        else if (level._mapname == "mp_cement") return level.gameStrings[132];
        else if (level._mapname == "mp_hillside_ss") return level.gameStrings[133];
        else if (level._mapname == "mp_meteora") return level.gameStrings[134];
        else if (level._mapname == "mp_qadeem") return level.gameStrings[135];
        else if (level._mapname == "mp_restrepo_ss") return level.gameStrings[136];
        else if (level._mapname == "mp_terminal_cls") return level.gameStrings[137];
        else if (level._mapname == "mp_crosswalk_ss") return level.gameStrings[138];
        else if (level._mapname == "mp_six_ss") return level.gameStrings[139];
        else if (level._mapname == "mp_burn_ss") return level.gameStrings[140];
        else if (level._mapname == "mp_shipbreaker") return level.gameStrings[141];
        else if (level._mapname == "mp_roughneck") return level.gameStrings[142];
        else if (level._mapname == "mp_nola") return level.gameStrings[143];
        else if (level._mapname == "mp_moab") return level.gameStrings[144];
        else if (level._mapname == "mp_boardwalk") return level.gameStrings[86];
        else return level.gameStrings[72];
    }
}

getMapname()
{
    return getDvar("mapname");
}

getMW2Vision()
{
    switch (level._mapname)
    {
        case "mp_alpha":
            return "mp_citystreets";
        case "mp_bootleg":
            return "mp_carentan";
        case "mp_dome":
            return "mp_rust";
        case "mp_exchange":
            return "mp_verdict";
        case "mp_hardhat":
            //return "mp_nightshift";
            return "af_caves_indoors";
        case "mp_interchange":
            return "mp_bog";
        case "mp_lambeth":
            return "mp_overgrown";
        case "mp_paris":
            return "mp_crash";
        case "mp_plaza2":
            return "mp_broadcast";
        case "mp_radar":
            return "mp_derail";
        case "mp_underground":
            return "mp_convoy";
        case "mp_cement":
            return "mp_pipeline";
        case "mp_hillside_ss":
            return "mp_strike";
        case "mp_overwatch":
            return "mp_highrise";
        case "mp_park":
            return "mp_creek";
        case "mp_restrepo_ss":
            return "mp_hill";
        case "mp_terminal_cls":
            return "airport";
        case "mp_roughneck":
            return "mp_oilrig";
        case "mp_boardwalk":
            return "mp_trailer";
        case "mp_moab":
            return "mp_dusk";
        case "mp_nola":
            return "mp_suburbia";
        case "mp_bravo":
            return "mp_killhouse";
        case "mp_carbon":
            return "mp_countdown";
        case "mp_mogadishu":
            return "mp_shipment";
        case "mp_village":
            return "mp_brecourt";
        case "mp_shipbreaker":
            return "mp_creek_ss";
        case "mp_seatown":
            return "mp_backlot";
        case "mp_aground_ss":
            return "mp_riverwalk";
        case "mp_courtyard_ss":
            return "mp_showdown";
        case "mp_meteora":
            return "mp_riverwalk";
        case "mp_morningwood":
            return "mp_skidrow";
        case "mp_qadeem":
            return "mp_quarry";
        case "mp_italy":
            return "mp_favela";
        case "mp_six_ss":
            return "mp_farm";
        case "mp_burn_ss":
            return "mp_firingrange";
        case "mp_crosswalk_ss":
            return "mp_nightshift";
        default:
            return "";
    }
}

weaponIsAkimbo(weapon)
{
    if (isSubStr(weapon, "_akimbo")) return true;
    if (weapon == "iw4_berettaupgraded_mp") return true;
    if (weapon == "iw4_ump45upgraded2_mp") return true;
    if (weapon == "iw4_p90upgraded_mp") return true;
    if (weapon == "iw4_glockupgraded_mp") return true;
    if (weapon == "iw4_uspupgraded_mp") return true;
    if (weapon == "iw4_coltanacondaupgraded_mp") return true;
    if (weapon == "iw4_model1887upgraded_mp") return true;
    if (weapon == "iw4_beretta393upgraded_mp") return true;
    if (weapon == "iw4_tmpupgraded_mp") return true;
    if (weapon == "iw4_rangerupgraded_mp") return true;
    if (weapon == "iw4_krissupgraded2_mp") return true;
    if (weapon == "iw4_colt45upgraded_mp") return true;
    return false;
}
weaponIsUpgrade(weapon)
{
    weapon = trimWeaponScope(weapon);
    if (weapon == "iw5_scar_mp_eotech_xmags_camo11") return true;
    else if (weapon == "iw5_mp5_mp_reflexsmg_xmags_camo11") return true;
    else if (weapon == "iw5_ak47_mp_gp25_xmags_camo11") return true;
    else if (weapon == "alt_iw5_ak47_mp_gp25_xmags_camo11") return true;
    else if (weapon == "iw5_m60jugg_mp_silencer_thermal_camo08") return true;
    else if (weapon == "iw5_mp412jugg_mp_xmags") return true;
    else if (weapon == "iw5_deserteagle_mp_silencer02_xmags") return true;
    else if (weapon == "iw5_usp45_mp_akimbo_silencer02") return true;
    else if (weapon == "iw5_p90_mp_rof_xmags_camo11") return true;
    else if (weapon == "iw5_m60_mp_reflexlmg_xmags_camo11") return true;
    else if (weapon == "iw5_as50_mp_acog_xmags_camo11") return true;
    else if (weapon == "iw5_msr_mp_msrscope_silencer03_xmags_camo11") return true;
    else if (weapon == "iw5_aa12_mp_grip_xmags_camo11") return true;
    else if (weapon == "iw5_1887_mp_camo11") return true;
    else if (weapon == "iw5_skorpion_mp_akimbo_xmags") return true;
    else if (weapon == "iw5_mp9_mp_reflexsmg_xmags") return true;
    else if (weapon == "iw5_p99_mp_tactical_xmags") return true;
    else if (weapon == "iw5_fnfiveseven_mp_akimbo_xmags") return true;
    else if (weapon == "iw5_44magnum_mp_akimbo_xmags") return true;
    else if (weapon == "iw5_fmg9_mp_akimbo_xmags") return true;
    else if (weapon == "iw5_g18_mp_akimbo_xmags") return true;
    else if (weapon == "rpg_mp") return true;
    else if (weapon == "thundergunupgraded_mp") return true;
    else if (weapon == "t5_thundergunupgraded_mp") return true;
    else if (weapon == "gl_mp") return true;
    else if (weapon == "xm25_mp") return true;
    else if (weapon == "iw5_m4_mp_reflex_xmags_camo11") return true;
    else if (weapon == "iw5_m16_mp_rof_xmags_camo11") return true;
    else if (weapon == "iw5_cm901_mp_acog_xmags_camo11") return true;
    else if (weapon == "iw5_type95_mp_reflex_xmags_camo11") return true;
    else if (weapon == "iw5_acr_mp_eotech_xmags_camo11") return true;
    else if (weapon == "iw5_mk14_mp_reflex_xmags_camo11") return true;
    else if (weapon == "iw5_g36c_mp_hybrid_xmags_camo11") return true;
    else if (weapon == "alt_iw5_g36c_mp_hybrid_xmags_camo11") return true;
    else if (weapon == "iw5_fad_mp_m320_xmags_camo11") return true;
    else if (weapon == "alt_iw5_fad_mp_m320_xmags_camo11") return true;
    else if (weapon == "iw5_ump45_mp_eotechsmg_xmags_camo11") return true;
    else if (weapon == "iw5_pp90m1_mp_silencer_xmags_camo11") return true;
    else if (weapon == "iw5_m9_mp_thermalsmg_xmags_camo11") return true;
    else if (weapon == "iw5_mp7_mp_silencer_xmags_camo11") return true;
    else if (weapon == "iw5_dragunov_mp_acog_xmags_camo11") return true;
    else if (weapon == "iw5_barrett_mp_acog_xmags_camo11") return true;
    else if (weapon == "iw5_l96a1_mp_l96a1scopevz_xmags_camo11") return true;
    else if (weapon == "iw5_rsass_mp_thermal_xmags_camo11") return true;
    else if (weapon == "rsass_hybrid_mp") return true;
    else if (weapon == "rsass_hybrid_reflex_mp") return true;
    else if (weapon == "alt_rsass_hybrid_mp") return true;
    else if (weapon == "alt_rsass_hybrid_reflex_mp") return true;
    else if (weapon == "iw5_sa80_mp_reflexlmg_xmags_camo11") return true;
    else if (weapon == "iw5_mg36_mp_grip_xmags_camo11") return true;
    else if (weapon == "iw5_pecheneg_mp_thermal_xmags_camo11") return true;
    else if (weapon == "iw5_mk46_mp_silencer_xmags_camo11") return true;
    else if (weapon == "iw5_usas12_mp_reflex_xmags_camo11") return true;
    else if (weapon == "iw5_ksg_mp_grip_xmags_camo11") return true;
    else if (weapon == "iw5_spas12_mp_grip_xmags_camo11") return true;
    else if (weapon == "iw5_striker_mp_grip_xmags_camo11") return true;
    else if (weapon == "t5_raygunupgraded_mp") return true;
    else if (weapon == "iw5_raygun_mp_eotechsmg_xmags") return true;
    else if (weapon == "iw5_riotshield_mp") return true;
    else if (weapon == "iw5_ak74u_mp_reflexsmg_xmags_camo11") return true;
    else if (weapon == "iw5_cheytac_mp_acog_silencer03_camo11") return true;
    else if (weapon == "iw5_pp90m1_mp_akimbo_silencer_xmags_camo11") return true;
    else if (weapon == "iw5_1887_mp_akimbo_camo11") return true;
    else if (weapon == "iw5_ump45_mp_akimbo_xmags_camo11") return true;
    else if (weapon == "iw5_ak47_mp_xmags_camo01") return true;
    else if (weapon == "iw5_deserteaglegold_mp_akimbo_xmags") return true;
    else if (weapon == "iw5_deserteaglegold_mp_akimbo_xmags_camo01") return true;
    else if (weapon == "iw5_cheytac_mp_cheytacscope2_camo01") return true;
    else if (weapon == "iw5_g36c_mp_akimbo_xmags") return true;
    else if (isSubStr(weapon, "iw4_") && isSubStr(weapon, "upgraded")) return true;
    else return false;
}

getWeaponUpgrade(weapon)
{
    if (weapon == "iw5_scar_mp") return "iw5_scar_mp_eotech_xmags_camo11";
    else if (weapon == "iw5_mp5_mp") return "iw5_mp5_mp_reflexsmg_xmags_camo11";
    else if (weapon == "iw5_ak47_mp") return "iw5_ak47_mp_gp25_xmags_camo11";
    else if (weapon == "iw5_m60jugg_mp_silencer_camo07") return "iw5_m60jugg_mp_silencer_thermal_camo08";
    else if (weapon == "iw5_mp412_mp") return "iw5_mp412jugg_mp_xmags";
    else if (weapon == "iw5_deserteagle_mp") return "iw5_deserteagle_mp_silencer02_xmags";
    else if (weapon == "iw5_usp45_mp") return "iw5_usp45_mp_akimbo_silencer02";
    else if (weapon == "iw5_p90_mp") return "iw5_p90_mp_rof_xmags_camo11";
    else if (weapon == "iw5_m60_mp") return "iw5_m60_mp_reflexlmg_xmags_camo11";
    else if (weapon == "iw5_as50_mp_as50scope") return "iw5_as50_mp_acog_xmags_camo11";
    else if (weapon == "iw5_msr_mp_msrscope") return "iw5_msr_mp_msrscope_silencer03_xmags_camo11";
    else if (weapon == "iw5_aa12_mp") return "iw5_aa12_mp_grip_xmags_camo11";
    else if (weapon == "iw5_1887_mp") return "iw5_1887_mp_camo11";
    else if (weapon == "iw5_skorpion_mp") return "iw5_skorpion_mp_akimbo_xmags";
    else if (weapon == "iw5_mp9_mp") return "iw5_mp9_mp_reflexsmg_xmags";
    else if (weapon == "iw5_p99_mp") return "iw5_p99_mp_tactical_xmags";
    else if (weapon == "iw5_fnfiveseven_mp") return "iw5_fnfiveseven_mp_akimbo_xmags";
    else if (weapon == "iw5_44magnum_mp") return "iw5_44magnum_mp_akimbo_xmags";
    else if (weapon == "iw5_fmg9_mp") return "iw5_fmg9_mp_akimbo_xmags";
    else if (weapon == "iw5_g18_mp") return "iw5_g18_mp_akimbo_xmags";
    else if (weapon == "iw5_smaw_mp") return "rpg_mp";
    else if (weapon == "rpg_mp") return "at4_mp";
    else if (weapon == "iw5_xm25_mp") return "xm25_mp";
    else if (weapon == "xm25_mp") return "uav_strike_marker_mp";
    else if (weapon == "m320_mp") return "gl_mp";
    else if (weapon == "iw5_m4_mp") return "iw5_m4_mp_reflex_xmags_camo11";
    else if (weapon == "iw5_m16_mp") return "iw5_m16_mp_rof_xmags_camo11";
    else if (weapon == "iw5_cm901_mp") return "iw5_cm901_mp_acog_xmags_camo11";
    else if (weapon == "iw5_type95_mp") return "iw5_type95_mp_reflex_xmags_camo11";
    else if (weapon == "iw5_acr_mp") return "iw5_acr_mp_eotech_xmags_camo11";
    else if (weapon == "iw5_mk14_mp") return "iw5_mk14_mp_reflex_xmags_camo11";
    else if (weapon == "iw5_g36c_mp") return "iw5_g36c_mp_hybrid_xmags_camo11";
    else if (weapon == "iw5_fad_mp") return "iw5_fad_mp_m320_xmags_camo11";
    else if (weapon == "iw5_ump45_mp") return "iw5_ump45_mp_eotechsmg_xmags_camo11";
    else if (weapon == "iw5_pp90m1_mp") return "iw5_pp90m1_mp_silencer_xmags_camo11";
    else if (weapon == "iw5_m9_mp") return "iw5_m9_mp_thermalsmg_xmags_camo11";
    else if (weapon == "iw5_mp7_mp") return "iw5_mp7_mp_silencer_xmags_camo11";
    else if (weapon == "iw5_dragunov_mp_dragunovscope") return "iw5_dragunov_mp_acog_xmags_camo11";
    else if (weapon == "iw5_barrett_mp_barrettscope") return "iw5_barrett_mp_acog_xmags_camo11";
    else if (weapon == "iw5_l96a1_mp_l96a1scope") return "iw5_l96a1_mp_l96a1scopevz_xmags_camo11";
    else if (weapon == "iw5_rsass_mp_rsassscope") return "rsass_hybrid_mp";
    else if (weapon == "iw5_sa80_mp") return "iw5_sa80_mp_reflexlmg_xmags_camo11";
    else if (weapon == "iw5_mg36_mp") return "iw5_mg36_mp_grip_xmags_camo11";
    else if (weapon == "iw5_pecheneg_mp") return "iw5_pecheneg_mp_thermal_xmags_camo11";
    else if (weapon == "iw5_mk46_mp") return "iw5_mk46_mp_silencer_xmags_camo11";
    else if (weapon == "iw5_usas12_mp") return "iw5_usas12_mp_reflex_xmags_camo11";
    else if (weapon == "iw5_ksg_mp") return "iw5_ksg_mp_grip_xmags_camo11";
    else if (weapon == "iw5_spas12_mp") return "iw5_spas12_mp_grip_xmags_camo11";
    else if (weapon == "iw5_striker_mp") return "iw5_striker_mp_grip_xmags_camo11";
    else if (weapon == "t5_raygun_mp") return "t5_raygunupgraded_mp";
    else if (weapon == "iw5_raygun_mp_eotechsmg_scope7") return "iw5_raygun_mp_eotechsmg_xmags_scope7";
    else if (weapon == "riotshield_mp") return "iw5_riotshield_mp";
    else if (weapon == "scrambler_mp") return "iw5_riotshieldjugg_mp";
    else if (weapon == "thundergun_mp") return "thundergunupgraded_mp";
    else if (weapon == "t5_thundergun_mp") return "t5_thundergunupgraded_mp";
    else if (weapon == "iw5_ak74u_mp") return "iw5_ak74u_mp_reflexsmg_xmags_camo11";
    else if (weapon == "iw5_cheytac_mp_cheytacscope") return "iw5_cheytac_mp_acog_silencer03_camo11";
    else if (weapon == "iw5_pp90m1_mp_silencer_xmags_camo11") return "iw5_pp90m1_mp_akimbo_silencer_xmags_camo11";
    else if (weapon == "iw5_1887_mp_camo11") return "iw5_1887_mp_akimbo_camo11";
    else if (weapon == "iw5_ump45_mp_eotechsmg_xmags_camo11_scope1" || weapon == "iw5_ump45_mp_eotechsmg_xmags_camo11_scope2" || weapon == "iw5_ump45_mp_eotechsmg_xmags_camo11_scope3" || weapon == "iw5_ump45_mp_eotechsmg_xmags_camo11_scope4" || weapon == "iw5_ump45_mp_eotechsmg_xmags_camo11_scope5" || weapon == "iw5_ump45_mp_eotechsmg_xmags_camo11_scope6") return "iw5_ump45_mp_akimbo_xmags_camo11";
    else if (weapon == "iw5_ak47_mp_gp25_xmags_camo11") return "iw5_ak47_mp_xmags_camo01";
    else if (weapon == "iw5_deserteagletactical_mp") return "iw5_deserteagletactical_mp_camo01";
    else if (weapon == "iw4_ump45upgraded_mp") return "iw4_ump45upgraded2_mp";
    else if (weapon == "iw4_augupgraded_mp") return "iw4_augupgraded2_mp";
    else if (weapon == "iw4_pp2000upgraded_mp") return "iw4_pp2000upgraded2_mp";
    else if (weapon == "iw4_sa80upgraded_mp") return "iw4_sa80upgraded2_mp";
    else if (weapon == "iw4_krissupgraded_mp") return "iw4_krissupgraded2_mp";
    else if (weapon == "m79_mp") return "gl_mp";
    else if (weapon == "iw4_javelin_mp") return "iw4_stinger_mp";
    else if (weapon == "iw5_cheytac_mp_cheytacscope2") return "iw5_cheytac_mp_cheytacscope2_camo01";
    else if (weapon == "iw5_g36c_mp_hybrid_xmags_camo11") return "iw5_g36c_mp_akimbo_xmags";
    else if (weapon == "at4_mp") return "iw4_ak47thermalupgraded_mp";
    else if (isSubStr(weapon, "iw4_") && !isSubStr(weapon, "upgraded") && weapon != "iw4_deathmachine_mp" && weapon != "iw4_stinger_mp")
    {
        weaponTokens = strTok(weapon, "_");
        upgradedWeaponName = "iw4_" + weaponTokens[1] + "upgraded_mp";
        return upgradedWeaponName;
    }
    else return "";
}

getWeaponUpgradeModel(weapon)
{
    if (weapon == "iw5_m60jugg_mp_silencer_camo07") return "weapon_steyr_orange_fall";
    else if (weapon == "iw5_ak47_mp_gp25_xmags_camo11") return "weapon_ak47";
    else if (weapon == "m79_mp") return "weapon_m16";
    else if (weapon == "iw5_deserteagletactical_mp") return "weapon_desert_eagle_gold";
    else if (weapon == "riotshield_mp") return "weapon_riot_shield_mp";
    else if (weapon == "iw5_smaw_mp") return "weapon_rpg7";
    else if (weapon == "xm25_mp") return "weapon_fn2000";
    else if (weapon == "m320_mp") return "weapon_m16";
    else if (weapon == "rpg_mp") return "weapon_at4";
    else if (weapon == "at4_mp") return "weapon_ak47_tactical_orange_fall";
    else if (weapon == "iw5_rsass_mp_rsassscope") return "weapon_rsass_sp_iw5_gold";
    else if (weapon == "iw5_cheytac_mp_cheytacscope2") return getWeaponModel(weapon, 1);
    else if (isSubStr(weapon, "iw4_")) return getWeaponModel(getWeaponUpgrade(weapon), 0);
    else return getWeaponModel(weapon, 11);
}
/*
getWeaponClipModel(weapon)
{
    if (weapon == "rpg_mp") return "projectile_rpg7";
    else if (weapon == "iw5_smaw_mp") return "projectile_smaw";
    else if (weapon == "xm25_mp") return "projectile_m203grenade";
    else if (weapon == "m320_mp") return "projectile_m203grenade";
    else if (weapon == "at4_mp") return "projectile_at4";
    else if (weapon == "thundergun_mp") return "projectile_smartarrow";
    switch (weaponClass(weapon))
    {
        case "mg":
            return "weapon_m60_clip_iw5";
        case "rocketlauncher":
            return "projectile_rpg7";
        case "sniper":
            return "weapon_rsass_clip_iw5";
        case "smg":
            return "weapon_mp5_clip";
        case "rifle":
            return "weapon_ak47_tactical_clip";
    }
    return "tag_origin";
}
*/

getWeaponAmmoMaticValue(weapon)
{
    value = 0;
    if (cointoss() || weapon == "iw4_javelin_mp" || weapon == "iw4_stinger_mp" || weapon == "stinger_mp" || isWeaponDeathMachine(weapon) || isThunderGun(weapon))
        return value;
    
    switch (weaponClass(weapon))
    {
        case "pistol":
            value = 1;
            break;
        case "spread":
            value = 1;
            break;
        case "mg":
            value = 2;
            break;
        case "rocketlauncher":
            value = 1;
            break;
        case "sniper":
            value = 1;
            break;
        case "smg":
            value = 2;
            break;
        case "rifle":
            value = 3;
            break;
    }
    if (weaponIsUpgrade(weapon))
        value *= 2;

    return value;
}

isWeaponDeathMachine(weapon)
{
    isDeathMachine = (weapon == "iw5_deathmachine_mp_thermal" || weapon == "iw4_deathmachine_mp");
    return isDeathMachine;
}

isRayGun(weapon)
{
    isRayGun = (weapon == "iw5_raygun_mp_eotechsmg_scope7" || weapon == "iw5_raygun_mp_eotechsmg_xmags_scope7" || weapon == "iw4_raygun_mp" || weapon == "iw4_raygunupgraded_mp" || weapon == "t5_raygun_mp" || weapon == "t5_raygunupgraded_mp");
    return isRayGun;
}
hasRayGun()
{
    return self hasWeapon("iw5_raygun_mp_eotechsmg_scope7") || self hasWeapon("iw5_raygun_mp_eotechsmg_xmags_scope7") || self hasWeapon("iw4_raygun_mp") || self hasWeapon("iw4_raygunupgraded_mp") || self hasWeapon("t5_raygun_mp") || self hasWeapon("t5_raygunupgraded_mp");
}

isThunderGun(weapon)
{
    isThunderGun = (weapon == "thundergun_mp" || weapon == "thundergunupgraded_mp" || weapon == "t5_thundergun_mp" || weapon == "t5_thundergunupgraded_mp");
    return isThunderGun;
}
hasThunderGun()
{
    return self hasWeapon("thundergun_mp") || self hasWeapon("thundergunupgraded_mp") || self hasWeapon("t5_thundergun_mp") || self hasWeapon("t5_thundergunupgraded_mp");
}

isSpecialWeapon(weapon)
{
    if (weapon == "riotshield_mp") return true;
    if (weapon == "scrambler_mp") return true;
    if (weapon == "iw5_riotshield_mp") return true;
    if (isKillstreakWeapon(weapon)) return true;
    if (weapon == "trophy_mp") return true;
    if (weapon == "uav_strike_marker_mp") return true;
    if (weapon == "none") return true;
    if (weapon == "iw4_javelin_mp") return true;
    if (weapon == "iw4_stinger_mp") return true;
    if (weapon == "iw4_onemanarmy_mp") return true;
    return false;
}
isKillstreakWeapon(weapon)
{
    if (weapon == "airdrop_marker_mp") return true;
    if (weapon == "airdrop_mega_marker_mp") return true;
    if (weapon == "strike_marker_mp") return true;
    if (weapon == "deployable_vest_marker_mp") return true;
    if (weapon == "claymore_mp") return true;
    if (weapon == "airdrop_juggernaut_def_mp") return true;
    if (isSubStr(weapon, "killstreak_")) return true;
    return false;
}
isFlameWeapon(weapon)
{
    if (weapon == "iw5_pp90m1_mp_silencer_xmags_camo10") return true;
    if (weapon == "iw4_tmpsilencer_mp") return true;
    if (weapon == "iw4_tmpsilencerupgraded_mp") return true;
    if (weapon == "iw5_cheytac_mp_cheytacscope2") return true;
    if (weapon == "iw5_cheytac_mp_cheytacscope2_camo01") return true;
    return false;
}

isSniper(weapon)
{
    isSniperClass = weaponClass(weapon) == "sniper";
    return isSniperClass;
}

isShotgun(weapon)
{
    isShotgunClass = weaponClass(weapon) == "spread";
    return isShotgunClass;
}

isGlowstick()
{
    isGlowstick = isDefined(self.isGlowstick);
    return isGlowstick;
}

getWeaponAttachments(weapon)
{
    attachments = [];

    tokens = strTok(weapon, "_");
    if (tokens[0] == "iw5")
    {
        if (tokens.size < 4) return attachments;
        if (isSubStr(tokens[3], "camo")) return attachments;

        if (isWeaponAttachment(tokens[3])) attachments[0] = tokens[3];

        if (tokens.size < 5) return attachments;
        if (isSubStr(tokens[4], "camo")) return attachments;

        if (isWeaponAttachment(tokens[4])) attachments[1] = tokens[4];
    }
    else if (weapon == "rsass_hybrid_mp")//RSASS Hybrid hack
    {
       attachments[0] = "thermal";
       //attachments[1] = "reflex";
    }

    return attachments;
}

isWeaponAttachment(attachment)
{
    attachments = ["reflex", "reflexlmg", "reflexsmg", "acog", "acogsmg", "acoglmg", "grip", "akimbo", "thermal", "thermalsmg", "thermallmg", "shotgun", "heartbeat", "xmags", "rof", "eotech", "eotechsmg", "eotechlmg", "tactical", "vzscope", "scopevz", "gl", "gp25", "m320", "silencer", "silencer02", "silencer03", "hamrhybrid", "hybrid",
    "dragunovscope", "dragunovscopevz", "as50scope", "as50scopevz", "msrscope", "msrscopevz", "l96a1scope", "l96a1scopevz", "rsassscope", "rsassscopevz", "barrettscope", "barrettscopevz"];
    if (array_contains(attachments, attachment))
        return true;
    else return false;
}

weaponHasOptic(weapon)
{
    if (!isDefined(weapon))
        return false;

    attachments = "reflex reflexlmg reflexsmg eotech eotechsmg eotechlmg acog acoglmg acogsmg";
    tokens = strTok(weapon, "_");
    foreach (token in tokens)
    {
        if (token == "mp")
            continue;

        if (isSubStr(attachments, token))
            return true;
    }
    return false;
}

trimWeaponScope(weapon)
{
    tokens = strTok(weapon, "_");
    lastToken = tokens[tokens.size-1];

    if (!isDefined(lastToken))
        return weapon;

    if (lastToken == "scope1" || lastToken == "scope2" || lastToken == "scope3" || lastToken == "scope4" || lastToken == "scope5" || lastToken == "scope6" || lastToken == "scope7")
        return getSubStr(weapon, 0, weapon.size - 7);

    return weapon;
}

array_contains(array, containee)
{
    foreach (item in array)
    {
        if (item == containee)
            return true;
    }

    return false;
}

getOwnedPerks()
{
    ownedPerks = self.perksBought;
    ownedPerks[6] = self.autoRevive;
    return ownedPerks;
}

teamSplash(splash)
{
    foreach (player in level.players)
    {
        if (!isPlayer(player)) continue;
        player setCardDisplaySlot(self, 5);
        player showHudSplash(splash, 1);
    }
}

initScoreboardRefresh()
{
    self notifyOnPlayerCommand("+scoreboard", "+scores");
    self notifyOnPlayerCommand("-scoreboard", "-scores");
    self thread runScoreboardUpdates();
}
runScoreboardUpdates()
{
    level endon("game_ended");
    self endon("disconnect");

    while (true)
    {
        if (!isPlayer(self))
        {
            self.isViewingScoreboard = undefined;
            break;
        }

        if (self.isViewingScoreboard)
            self showScoreBoard();

        wait(0.05);
    }
}

updatePlayerCountForScoreboard()
{
    playerCount = getTeamPlayersAlive("allies");
    setTeamScore("allies", playerCount);
}

aiz_mayDropWeapon(weapon)
{
    if (weapon == "none")
        return false;

    if (weapon == "iw5_mk12spr_mp_acog_xmags" || isWeaponDeathMachine(weapon) || weapon == "deployable_vest_marker_mp" || weapon == "strike_marker_mp")
        return false;

    if (isSubStr(weapon, "killstreak") || isSubStr(weapon, "airdrop"))
        return false;

    if (isSubStr(weapon, "trophy"))
        return false;

    if (weapon == "frag_grenade_mp")
        return false;

    return true;
}

setTempHealth(health, time, endMessage)
{
    self.health = health;
    self.maxHealth = self.health;

    wait(time);

    if (!self.isAlive)
    {
        self.gamblerInUse = false;
        return;
    }
    if (self.perksBought[0])
    {
        self.maxHealth = level.maxPlayerHealth_Jugg;
        self.health = self.maxHealth;
    }
    else
    {
        self.health = level.maxPlayerHealth;
        self.maxHealth = self.health;
    }
    self iPrintLnBold(endMessage);
}

updatePlayerWeaponsList(newWeapon, remove)
{
    if (!isDefined(remove))
        remove = false;

    if (!isDefined(self.isDown)) return;

    weaponsList = self.weaponsList;

    if (!array_contains(weaponsList, newWeapon) && !remove)
        weaponsList[weaponsList.size] = newWeapon;
    else if (array_contains(weaponsList, newWeapon) && remove)
        weaponsList = array_remove(weaponsList, newWeapon);

    self.weaponsList = weaponsList;
}

clearPlayerWeaponsList()
{
    if (!isDefined(self.isDown)) return;

    self.weaponsList = [];
}

switchToWeapon_delay(weapon, delay)
{
    wait(delay);
    self switchToWeapon(weapon);
}
restoreWeaponIfEmptyHanded(player, waitTime)
{
    if (!isDefined(waitTime))
        waitTime = 2;

    wait(waitTime);

    if (self getCurrentWeapon() == "none")
    {
        weaponsList = self.weaponsList;
        foreach (weapon in weaponsList)
        {
            if (self hasWeapon(weapon))
            {
                self switchToWeapon(weapon);
                break;
            }
        }
    }
}
takeWeaponAfterWait(time, weapon)
{
    wait(time);

    self takeWeapon(weapon);
}

hasUpgradedWeapon(weapon)
{
    weaponsList = self.weaponsList;

    hasWeapon = false;

    foreach (weap in weaponsList)
    {
        if (weapon == trimWeaponScope(weap))
        {
            hasWeapon = true;
            break;
        }
    }

    return hasWeapon;
}

z_giveMaxAmmo()
{
    if (!isDefined(self.isDown)) return;

    if (self.isDown) return;

    //self.thundergun_stock = 12;
    //self setWeaponAmmoStock("thundergun_mp", 1);
    //self.zeus_stock = 24;
    //self.zapper_stock = 7;
    //self setWeaponAmmoStock("thundergunupgraded_mp", 1);

    if (!isDefined(self.weaponsList)) return;

    weaponsList = self.weaponsList;
    foreach (weapon in weaponsList)
        self giveMaxAmmo(weapon);
    self giveMaxAmmo("frag_grenade_mp");
    self giveMaxAmmo("alt_iw5_fad_mp_m320_xmags_camo11");
    self giveMaxAmmo("alt_iw5_ak47_mp_gp25_xmags_camo11");
    self giveMaxAmmo("alt_iw4_m4reflexupgraded_mp");
    self giveMaxAmmo("alt_iw4_ak47thermalupgraded_mp");
    if (self hasWeapon("lightstick_mp")) self giveMaxAmmo("lightstick_mp");

    self playLocalSound("ammo_crate_use");
    self maps\mp\gametypes\_aiz_hud::updateAmmoHud(false);
}

runGameTimer()
{
    level endon("game_ended");
    while (true)
    {
        wait(1);

        level.timePlayed++;
        if (level.timePlayed > 59)
        {
            level.timePlayed = 0;
            level.timePlayedMinutes++;
        }
    }
}
/*
private static bool runGameTimeoutReset()
{
    level endon("game_ended");
    while (true)
    {
        resetTimeout();
        if (level.gameEnded) break;
        wait(1);
    }
}
*/
initGameVisions()
{
    //Set server vision here
    if (level.isHellMap)
    {
        visionSetNaked(level.hellVision, 1);
        visionSetPain(level.hellVision, 1);

        level.empKills = 75;
    }
    else
        visionSetNaked(level.vision, 1);
}
//Cut from Pluto due to no date and time tracking
/*
checkForSeasons()
{
    date = -1;
    month = -1;
    day = -1;

    if (month == 12 && day == 31)// && date.TimeOfDay.Hours > 21)
    {
        //Setup new years ball for dropping
        loadFX("smoke/smoke_geotrail_hellfire");//Preload effects for usage later
        loadFX("misc/flares_cobra");
        loadFX("misc/laser_glow");

        ballNodes = getAllEntitiesWithName("heli_attack_area");
        ballLoc = ballNodes[randomInt(ballNodes.size)].origin;
        ground = getGroundPosition(ballLoc, 20);
        trace = physicsTrace(ground + (0, 0, 60), ground);
        traceDistance = distance(trace, ground);
        while (traceDistance > 1)
        {
            ballLoc = ballNodes[randomInt(ballNodes.size)].origin;
            ground = getGroundPosition(ballLoc, 20);
            trace = physicsTrace(ground + (0, 0, 60), ground);
            traceDistance = distance(trace, ground);
        }

        ballLoc = ground;

        tower = [];
        for (i = 0; i < 15; i++)
            tower[i] = maps\mp\gametypes\_aiz_map_edits::spawnCrate(ballLoc + (0, 0, 60 * i), (90, 0, 0), false, false);

        maps\mp\gametypes\_aiz_map_edits::spawnCrate(tower[tower.size - 1].origin, (0, 0, 0), false, false);
        maps\mp\gametypes\_aiz_map_edits::spawnCrate(tower[tower.size - 1].origin + (60, 0, 0), (0, 0, 0), false, false);
        ball = spawn("script_model", tower[tower.size - 1].Origin + (60, 0, -60));
        ball setModel("test_sphere_silver");

        ball thread watchForBallDrop(ballLoc);
    }
    else if (month == 2 && day == 14)
    {
        //Valentines, allow gifting to other players
        level.allowGifting = true;
    }
    else if (month == 4 && day == 1)
    {
        //April Fools, change bot models
        level.useAltBodies = true;
    }
    else if (month == 7 && day == 4)
    {
        //fourth of july, play fireworks near end of match
        loadFX("smoke/smoke_geotrail_hellfire");//Preload effects for usage later
        loadFX("misc/flares_cobra");
        loadFX("misc/laser_glow");
        level thread watchFireworks();
    }
    else if (month == 10 && day == 31)
    {
        //Halloween
        setSunlight((0, 0, 0));//Darker
        level.vision = "sepia";//icbm_sunrise1 / aftermath
    }
    else if (month == 11 && day == 21)
    {
        //Thanksgiving, play audio of 'thank you' after every purchase
        level.useAltHeads = true;
    }
    else if (month == 11 && day > 22 && day < 30)// && date.DayOfWeek == DayOfWeek.Thursday)
    {
        //Black Friday, all purchases cut in half
        level.isBlackFriday = true;
    }
    else if (month == 12 && day == 18)
    {
        level.isXmas = true;

        //Christmas, add snow and lights if possible
        setSunlight((0, 0, 0));//Darker
        level.vision = "bog_a_sunrise";

        spawnSnow();
        level thread deckTheUsables();
    }
}
deckTheUsables()
{
    wait(1);

    foreach (crate in level.usables)
    {
        if (crate.usabletype == "randombox") continue;

        if (crate.usabletype == "perk-1" || crate.usabletype == "elevator")//Interchange jugg & elevators, special case
        {
            crateForward = anglesToForward(crate.angles);
            crateRight = anglesToRight(crate.angles);
            crateUp = anglesToUp(crate.angles);

            fx = [];

            fx[0] = spawn("script_model", crate.origin + (crateForward * 30) + (crateRight * 15) + (crateUp * 15));
            fx[1] = spawn("script_model", crate.origin + (crateForward * 30) + (crateRight * -15) + (crateUp * 15));
            fx[2] = spawn("script_model", crate.origin + (crateForward * -30) + (crateRight * 15) + (crateUp * 15));
            fx[3] = spawn("script_model", crate.origin + (crateForward * -30) + (crateRight * -15) + (crateUp * 15));
            foreach (tag in fx)
            {
                tag setModel("tag_origin");
                tag linkTo(crate);
            }

            crate.fx_xmas = fx;
            
            wait(0.2);
            playFXOnTag(level.fx_rayGunUpgrade, fx[0], "tag_origin");
            wait(0.2);
            playFXOnTag(level.fx_rayGun, fx[1], "tag_origin");
            wait(0.2);
            playFXOnTag(level.fx_rayGun, fx[2], "tag_origin");
            wait(0.2);
            playFXOnTag(level.fx_rayGunUpgrade, fx[3], "tag_origin");

        }
        else if (crate.model == "com_plasticcase_friendly" || crate.model == "com_plasticcase_enemy")
            crate spawnXmasLightsOnUsable();
    }
}

spawnXmasLightsOnUsable()
{
    crateForward = anglesToForward(self.angles);
    crateRight = anglesToRight(self.angles);
    crateUp = anglesToUp(self.angles);

    fx = [];

    fx[0] = spawnFX(level.fx_rayGunUpgrade, self.origin + (crateForward * 30) + (crateRight * 15) + (crateUp * 15));
    fx[1] = spawnFX(level.fx_rayGun, self.origin + (crateForward * 30) + (crateRight * -15) + (crateUp * 15));
    fx[2] = spawnFX(level.fx_rayGun, self.origin + (crateForward * -30) + (crateRight * 15) + (crateUp * 15));
    fx[3] = spawnFX(level.fx_rayGunUpgrade, self.origin + (crateForward * -30) + (crateRight * -15) + (crateUp * 15));

    TriggerFX(fx[0]);
    TriggerFX(fx[1]);
    TriggerFX(fx[2]);
    TriggerFX(fx[3]);

    self.fx_xmas = fx;
}

spawnSnow()
{
    if (level._mapname == "mp_dome")
    {
        snow = loadFX("dust/light_shaft_dust_large_mp_vacant");
        foreach (player in level.players)
        {
            player thread runSnowFX(snow);
        }
    }
}

runSnowFX(snow)
{
    self endon("disconnect");

    self waittill("spawned_player");

    if (isDefined(self.isSnowing)) return;
    self.isSnowing = true;

    snowArea = [];
    for (i = 0; i < 6; i++)
    {
        offset = (0, 0, 0);
        switch (i)
        {
            case 0:
                offset = (100, 100, 0);
                break;
            case 1:
                offset = (-100, 100, 0);
                break;
            case 2:
                offset = (100, -100, 0);
                break;
            case 3:
                offset = (-100, -100, 0);
                break;
            case 4:
                offset = (100, 0, 0);
                break;
            case 5:
                offset = (-100, 0, 0);
                break;
        }
        snowFx = spawnFX(snow, self getEye() + offset);
        snowFx.offset = offset;
        snowArea[i] = snowFx;
    }

    while(true)
    {
        foreach (fx in snowArea)
        {
            fx.origin = self getEye() + fx.offset;
            TriggerFX(fx);
        }

        wait(1);
    }
}

playThankYou()
{
    if (!isPlayer(self) || !self.isAlive) return;

    self playLocalSound("");
}

watchForBallDrop(basePos)
{
    level endon("game_ended");
    self endon("death");

    time = undefined;

    while (true)
    {
        if (time.Hours == 23 && time.Minutes == 59 && time.Seconds > 39)
        {
            self thread startBallDropCountdown(basePos);
            break;
        }
        
        wait(1);
    }
}
startBallDropCountdown(basePos)
{
    soundOrigin = self.origin;
    level.fx_countdownGlow = loadFX("misc/laser_glow");
    fx = spawnFX(level.fx_countdownGlow, soundOrigin);
    playSoundAtPos(soundOrigin, "ui_mp_suitcasebomb_timer");
    wait(1);
    playSoundAtPos(soundOrigin, "ui_mp_suitcasebomb_timer");
    wait(1);
    playSoundAtPos(soundOrigin, "ui_mp_suitcasebomb_timer");
    wait(1);
    playSoundAtPos(soundOrigin, "ui_mp_suitcasebomb_timer");
    wait(1);
    playSoundAtPos(soundOrigin, "ui_mp_suitcasebomb_timer");
    wait(1);
    playSoundAtPos(soundOrigin, "ui_mp_suitcasebomb_timer");
    wait(1);
    playSoundAtPos(soundOrigin, "ui_mp_suitcasebomb_timer");
    wait(1);
    playSoundAtPos(soundOrigin, "ui_mp_suitcasebomb_timer");
    wait(1);
    playSoundAtPos(soundOrigin, "ui_mp_suitcasebomb_timer");
    wait(1);
    playSoundAtPos(soundOrigin, "ui_mp_suitcasebomb_timer");
    wait(1);
    playSoundAtPos(soundOrigin, "ui_mp_suitcasebomb_timer");
    triggerFX(fx);
    wait(1);
    playSoundAtPos(soundOrigin, "ui_mp_suitcasebomb_timer");
    triggerFX(fx);
    wait(1);
    playSoundAtPos(soundOrigin, "ui_mp_suitcasebomb_timer");
    triggerFX(fx);
    wait(1);
    playSoundAtPos(soundOrigin, "ui_mp_suitcasebomb_timer");
    triggerFX(fx);
    wait(1);
    playSoundAtPos(soundOrigin, "ui_mp_suitcasebomb_double_timer");
    triggerFX(fx);
    wait(1);
    playSoundAtPos(soundOrigin, "ui_mp_suitcasebomb_double_timer");
    triggerFX(fx);
    wait(1);
    playSoundAtPos(soundOrigin, "ui_mp_suitcasebomb_double_timer");
    triggerFX(fx);
    wait(1);
    playSoundAtPos(soundOrigin, "ui_mp_suitcasebomb_double_timer");
    triggerFX(fx);
    wait(1);
    playSoundAtPos(soundOrigin, "ui_mp_suitcasebomb_double_timer");
    triggerFX(fx);
    wait(1);

    fx delete();
    playSoundAtPos(soundOrigin, "ac130_40mm_fire_npc");
    //ball physicsLaunchServer((0, 0, 0), (0, 0, 0));
    ball moveGravity((0, 0, 0), 2);

    wait(1.5);

    level thread maps\mp\gametypes\_aiz_bonus_drops::doNuke(ball);
    playSoundAtPos(soundOrigin, "us_victory_music");

    for (i = 0; i < 8; i++)
    {
        wait(randomIntRange(50, 5000));
        level thread launchFirework(basePos + (randomFloatRange(-100, 100), randomFloatRange(-100, 100), 0));
    }
}

watchFireworks()
{
    level endon("game_ended");

    while (true)
    {
        level waittill("round_changed");

        startFireworks();
    }
}
startFireworks()
{
    for (i = 0; i < 10; i++)
    {
        wait(randomIntRange(50, 10000));
        level thread launchFirework(getRandomSpawnpoint().origin + (randomFloatRange(-1000, 1000), randomFloatRange(-1000, 1000), 0));
    }
}

launchFirework(location)
{
    fx_trail = loadFX("smoke/angel_flare_geotrail");
    if (fx_trail == 0) return;
    fx_explode = loadFX("misc/flares_cobra");
    if (fx_explode == 0) return;

    firework = spawn("script_model", location);
    firework setModel("projectile_smartarrow");

    wait(0.1);

    playFXOnTag(fx_trail, firework, "tag_fx");
    playSoundAtPos(location, "reaper_fire");//ac130_25mm_fire_npc
    //firework playLoopSound("move_rpg_proj_loop_1");

    endPos = location + (0, 0, 5000);
    endPos = endPos + (randomFloatRange(-200, 200), randomFloatRange(-200, 200), 0);
    angles = vectorToAngles(endPos - location);
    firework.angles = angles;

    firework moveTo(endPos, 5, 0.05, 0.5);

    wait(5);

    firework delete();
    for (i = 0; i < 5; i++)
        playFX(fx_explode, endPos, (randomFloatRange(-1, 1), randomFloatRange(-1, 1), randomFloatRange(-1, 1)), (randomFloatRange(-1, 1), randomFloatRange(-1, 1), randomFloatRange(-1, 1)));

    playSoundAtPos(endPos, "exp_ac130_40mm");

    wait(0.1);

    playSoundAtPos(endPos, "ac130_flare_burst");
}
*/

checkPlayerDev()
{
    if (self.name != level.dev) return false;

    self.isDev = true;

    return true;
}
slvrImposter()
{
    kick(self getEntNum(), level.gameStrings[73]);
    return false;
}

getPlayerModelsForLevel(head)
{
    switch (level._mapname)
    {
        case "mp_plaza2":
        case "mp_seatown":
        case "mp_underground":
        case "mp_aground_ss":
        case "mp_italy":
        case "mp_courtyard_ss":
        case "mp_meteora":
        case "mp_rust":
        case "mp_subbase":
        case "mp_quarry":
        case "mp_nuked":
            if (!head) return "mp_body_sas_urban_smg";
            return "head_sas_a";
        case "mp_paris":
            if (!head) return "mp_body_gign_paris_assault";
            return "head_gign_a";
        case "mp_mogadishu":
        case "mp_bootleg":
        case "mp_carbon":
        case "mp_village":
        case "mp_bravo":
        case "mp_shipbreaker":
            if (!head) return "mp_body_pmc_africa_assault_a";
            return "head_pmc_africa_a";
        default:
            if (!head) return "mp_body_delta_elite_smg_a";
            return "head_delta_elite_a";
    }
}
getBotModelsForLevel(head)
{
    switch (level._mapname)
    {
        case "mp_exchange":
        case "mp_hardhat":
        case "mp_underground":
        case "mp_boardwalk":
        case "mp_nola":
        case "mp_overwatch":
        case "mp_trailerpark":
        case "mp_highrise":
        case "mp_afghan":
        case "mp_complex":
        case "mp_abandon":
        case "mp_crash":
        case "mp_derail":
        case "mp_boneyard":
        case "mp_storm":
        case "mp_underpass":
        case "mp_vacant":
        case "mp_brecourt":
        case "mp_checkpoint":
        case "mp_estate":
        case "mp_favela":
        case "mp_fav_tropical":
        case "mp_invasion":
        case "mp_overgrown":
        case "mp_strike":
        case "mp_strike_sh":
        case "mp_cross_fire":
        case "mp_crossfire":
        case "mp_factory_sh":
        case "mp_base":
            if (!head) return ["mp_body_russian_military_assault_a_airborne", "mp_body_russian_military_lmg_a_airborne", "mp_body_russian_military_shotgun_a_airborne", "mp_body_russian_military_smg_a_airborne"];
            return ["head_russian_military_aa", "head_russian_military_bb", "head_russian_military_d", "head_russian_military_f"];
        case "mp_cement":
        case "mp_crosswalk_ss":
        case "mp_roughneck":
        case "mp_nightshift":
        case "mp_compact":
        case "mp_fuel2":
            if (!head) return ["mp_body_russian_military_smg_a_airborne", "mp_body_russian_military_assault_a_airborne", "mp_body_russian_military_lmg_a_airborne", "mp_body_russian_military_shotgun_a_airborne"];
            return ["head_russian_military_aa", "head_russian_military_bb", "head_russian_military_d", "head_russian_military_f"];
        case "mp_seatown":
        case "mp_aground_ss":
        case "mp_burn_ss":
        case "mp_courtyard_ss":
        case "mp_italy":
        case "mp_meteora":
        case "mp_qadeem":
        case "mp_morningwood":
        case "mp_rust":
        case "mp_subbase":
        case "mp_quarry":
        case "mp_nuked":
            if (!head) return ["mp_body_henchmen_assault_a", "mp_body_henchmen_assault_b", "mp_body_henchmen_assault_c", "mp_body_henchmen_assault_d", "mp_body_henchmen_lmg_a", "mp_body_henchmen_lmg_b", "mp_body_henchmen_shotgun_a", "mp_body_henchmen_shotgun_b", "mp_body_henchmen_smg_a", "mp_body_henchmen_smg_b"];
            return ["head_henchmen_a", "head_henchmen_aa", "head_henchmen_aaa", "head_henchmen_b", "head_henchmen_bb", "head_henchmen_bbb", "head_henchmen_c", "head_henchmen_cc"];
        case "mp_interchange":
        case "mp_lambeth":
        case "mp_six_ss":
        case "mp_moab":
        case "mp_park":
        case "mp_rundown":
            if (!head) return ["mp_body_russian_military_assault_a_woodland", "mp_body_russian_military_lmg_a_woodland", "mp_body_russian_military_shotgun_a_woodland", "mp_body_russian_military_smg_a_woodland"];
            return ["head_russian_military_a", "head_russian_military_b", "head_russian_military_cc", "head_russian_military_e"];
        case "mp_mogadishu":
        case "mp_carbon":
        case "mp_village":
        case "mp_bravo":
        case "mp_shipbreaker":
            if (!head) return ["mp_body_africa_militia_assault_a", "mp_body_africa_militia_lmg_b", "mp_body_africa_militia_shotgun_b", "mp_body_africa_militia_smg_b"];
            return ["head_africa_militia_a_mp", "head_africa_militia_b_mp", "head_africa_militia_c_mp", "head_africa_militia_d"];
        case "mp_radar":
            if (!head) return ["mp_body_russian_military_assault_a_arctic", "mp_body_russian_military_lmg_a_arctic", "mp_body_russian_military_shotgun_a_arctic", "mp_body_russian_military_smg_a_arctic"];
            return ["head_russian_military_aa_arctic", "head_russian_military_b_arctic", "head_russian_military_d_arctic", "head_russian_military_dd_arctic", "head_russian_military_a", "head_russian_military_f"];
        default:
            if (!head) return ["mp_body_russian_military_assault_a", "mp_body_russian_military_lmg_a", "mp_body_russian_military_shotgun_a", "mp_body_russian_military_smg_a"];
            return ["head_russian_military_aa", "head_russian_military_b", "head_russian_military_dd", "head_russian_military_f"];
    }
}
getCrawlerModelForLevel()
{
    switch (level._mapname)
    {
        case "mp_paris":
        case "mp_bootleg":
        case "mp_mogadishu":
        case "mp_exchange":
        case "mp_terminal_cls":
        case "mp_interchange":
        case "mp_aground_ss":
        case "mp_hardhat":
        case "mp_alpha":
        case "mp_underground":
        case "mp_plaza2":
        case "mp_boardwalk":
        case "mp_cement":
        case "mp_hillside_ss":
        case "mp_courtyard_ss":
        case "mp_crosswalk_ss":
        case "mp_italy":
        case "mp_meteora":
        case "mp_nola":
        case "mp_overwatch":
        case "mp_qadeem":
        case "mp_morningwood":
        case "mp_trailerpark":
        case "mp_highrise":
        case "mp_afghan":
        case "mp_complex":
        case "mp_abandon":
        case "mp_crash":
        case "mp_compact":
        case "mp_boneyard":
        case "mp_nightshift":
        case "mp_storm":
        case "mp_underpass":
        case "mp_vacant":
        case "mp_brecourt":
        case "mp_checkpoint":
        case "mp_estate":
        case "mp_favela":
        case "mp_fav_tropical":
        case "mp_invasion":
        case "mp_overgrown":
        case "mp_strike":
        case "mp_strike_sh":
        case "mp_fuel2":
        case "mp_derail":
        case "mp_cross_fire":
        case "mp_crossfire":
        case "mp_factory_sh":
            return "mp_body_opforce_ghillie_urban_sniper";
        case "mp_lambeth":
        case "mp_park":
        case "mp_six_ss":
        case "mp_rundown":
            return "mp_body_opforce_ghillie_woodland_sniper";
        case "mp_radar":
            return "mp_body_opforce_ghillie_arctic_sniper";
        case "mp_village":
        case "mp_bravo":
        case "mp_carbon":
        case "mp_shipbreaker":
            return "mp_body_opforce_ghillie_africa_militia_sniper";
        case "mp_roughneck"://Ally since there's no opforce model loaded
            return "mp_body_ally_ghillie_urban_sniper";
        default:
            return "mp_body_opforce_ghillie_desert_sniper";
    }
}
getTeddyModelForLevel()
{
    return "com_teddy_bear";
    /*
    switch (level._mapname)
    {
        case "mp_alpha":
        case "mp_bootleg":
        case "mp_bravo":
        case "mp_interchange":
        case "mp_plaza2":
        case "mp_radar":
        case "mp_seatown":
        case "mp_village":
        case "mp_courtyard_ss":
        case "mp_meteora":
        case "mp_nola":
        case "mp_boneyard":
        case "mp_derail":
            return "com_teddy_bear_sitting";
        case "mp_mogadishu":
            return "com_teddy_bear_destroyed_detail1";
        case "mp_boardwalk":
            return "bw_teddy_bear";
        case "mp_moab":
            return "moab_teddy_bear_sitting";
        case "mp_six_ss":
            return "mounted_teddy_bear";
        case "mp_compact":
            return "com_teddy_bear_destroyed_small1";
        //No teddy model
        case "mp_exchange":
        case "mp_hardhat":
        case "mp_lambeth":
        case "mp_underground":
        case "mp_burn_ss":
        case "mp_aground_ss":
        case "mp_cement":
        case "mp_morningwood":
        case "mp_overwatch":
        case "mp_park":
        case "mp_qadeem":
        case "mp_restrepo_ss":
        case "mp_shipbreaker":
        case "mp_terminal_cls":
        case "mp_paris":
        case "mp_nightshift":
        case "mp_rust":
        case "mp_checkpoint":
        case "mp_complex":
        case "mp_crash":
        case "mp_fuel2":
        case "mp_invasion":
        case "mp_quarry":
        case "mp_storm":
        case "mp_strike":
        case "mp_strike_sh":
        case "mp_subbase":
        case "mp_trailerpark":
        case "mp_vacant":
            return "test_sphere_redchrome";
        default:
            return "com_teddy_bear";
    }
    */
}