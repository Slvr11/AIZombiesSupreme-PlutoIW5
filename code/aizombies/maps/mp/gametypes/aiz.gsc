#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

main()
{
	if(getdvar("mapname") == "mp_background")
		return;

	maps\mp\gametypes\_globallogic::init();
	maps\mp\gametypes\_callbacksetup::SetupCallbacks();
	maps\mp\gametypes\_globallogic::SetupCallbacks();

	maps\mp\gametypes\_aiz::init();
	
	registerRoundSwitchDvar( level.gameType, 0, 0, 9 );
	registerTimeLimitDvar( level.gameType, 0 );
	registerScoreLimitDvar( level.gameType, 0 );
	registerRoundLimitDvar( level.gameType, 1 );
	registerWinLimitDvar( level.gameType, 1 );
	registerNumLivesDvar( level.gameType, 0 );
	registerHalfTimeDvar( level.gameType, 0 );

	level.matchRules_damageMultiplier = 0;
	level.matchRules_vampirism = 0;

	level.teamBased = true;
	
	level.onStartGameType = ::onStartGameType;

	game["dialog"]["gametype"] = "null";
	game["dialog"]["boost"] = "null";
	game["dialog"]["offense_obj"] = "null";
	game["dialog"]["defense_obj"] = "null";

	game["strings"]["overtime_hint"] = &"MP_FIRST_BLOOD";
	game["strings"]["waiting_for_teams"] = &"AIZ_GET_READY";
	game["strings"]["match_starting_in"] = &"AIZ_GET_READY";
}

onStartGameType()
{
	setClientNameMode("auto_change");

	setObjectiveText( "allies", &"AIZ_SURVIVE_N_WAVES" );
	setObjectiveText( "axis", &"AIZ_SURVIVE_N_WAVES" );
	setObjectiveScoreText( "allies", &"AIZ_SURVIVE_N_WAVES" );
	setObjectiveScoreText( "axis", &"AIZ_SURVIVE_N_WAVES" );

	level.spawnMins = ( 0, 0, 0 );
	level.spawnMaxs = ( 0, 0, 0 );	
	//maps\mp\gametypes\_spawnlogic::placeSpawnPoints( "mp_tdm_spawn_allies_start" );
	//maps\mp\gametypes\_spawnlogic::placeSpawnPoints( "mp_tdm_spawn_axis_start" );
	//maps\mp\gametypes\_spawnlogic::addSpawnPoints( "allies", "mp_tdm_spawn" );
	//maps\mp\gametypes\_spawnlogic::addSpawnPoints( "axis", "mp_tdm_spawn" );
	
	level.mapCenter = maps\mp\gametypes\_spawnlogic::findBoxCenter( level.spawnMins, level.spawnMaxs );
	setMapCenter( level.mapCenter );
	
	allowed[0] = level.gameType;
	allowed[1] = "airdrop_pallet";
	
	level.blockWeaponDrops = true;
	
	maps\mp\gametypes\_gameobjects::main(allowed);
}