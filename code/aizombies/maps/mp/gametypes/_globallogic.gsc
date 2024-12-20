#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

init()
{
	level.splitscreen = isSplitScreen();
	level.ps3 = (getDvar( "ps3Game" ) == "true");
	level.xenon = (getDvar( "xenonGame" ) == "true");
	level.wii = ( GetDvar( "wiiGame" ) == "true" );
	level.console = (level.ps3 || level.xenon || level.wii );
	
	level.onlineGame = getDvarInt( "onlinegame" );
	level.rankedMatch = ( !level.onlineGame || !getDvarInt( "xblive_privatematch" ) );
	
	/#
	if ( getdvarint( "scr_forcerankedmatch" ) == 1 )
	{
		level.onlineGame = true;
		level.rankedMatch = true;
	}
	#/

	level.script = toLower( getDvar( "mapname" ) );
	level.gametype = toLower( getDvar( "g_gametype" ) );

	level.otherTeam["allies"] = "axis";
	level.otherTeam["axis"] = "allies";

	level.teamBased = false;
	
	level.objectiveBased = false;
	
	level.endGameOnTimeLimit = true;
	
	level.showingFinalKillcam = false;
	
	level.tiSpawnDelay = getDvarInt( "scr_tispawndelay" );
	
	// hack to allow maps with no scripts to run correctly
	if ( !isDefined( level.tweakablesInitialized ) )
		maps\mp\gametypes\_tweakables::init();
	
	level.halftimeType = "halftime";
	level.halftimeSubCaption = &"MP_SWITCHING_SIDES";
	
	level.lastStatusTime = 0;
	level.wasWinning = "none";
	
	level.lastSlowProcessFrame = 0;
	
	level.placement["allies"] = [];
	level.placement["axis"] = [];
	level.placement["all"] = [];
	
	level.postRoundTime = 5.0;
	
	level.playersLookingForSafeSpawn = [];
	
	registerDvars();

	precacheModel( "vehicle_mig29_desert" );
	precacheModel( "projectile_cbu97_clusterbomb" );
	precacheModel( "tag_origin" );	

	level.fx_airstrike_afterburner = loadfx ("fire/jet_afterburner");
	level.fx_airstrike_contrail = loadfx ("smoke/jet_contrail");
	
	level.teamCount["allies"] = 0;
	level.teamCount["axis"] = 0;
	level.teamCount["spectator"] = 0;

	level.aliveCount["allies"] = 0;
	level.aliveCount["axis"] = 0;
	level.aliveCount["spectator"] = 0;
	
	level.livesCount["allies"] = 0;
	level.livesCount["axis"] = 0;

	level.oneLeftTime = [];
	
	level.hasSpawned["allies"] = 0;
	level.hasSpawned["axis"] = 0;
}


registerDvars()
{
	makeDvarServerInfo( "ui_bomb_timer", 0 );
	makeDvarServerInfo( "ui_nuke_end_milliseconds", 0 );
	makeDvarServerInfo( "ui_danger_team", "" );	
	makeDvarServerInfo( "ui_inhostmigration", 0 );
	makeDvarServerInfo( "ui_override_halftime", 0 );
	
	makeDvarServerInfo( "camera_thirdPerson", getDvarInt( "scr_thirdPerson" ) );
}

SetupCallbacks()
{
	level.onXPEvent = ::onXPEvent;
	
	level.getSpawnPoint = ::blank;
	level.onSpawnPlayer = ::blank;
	level.onRespawnDelay = ::blank;

	level.onTimeLimit = maps\mp\gametypes\_gamelogic::default_onTimeLimit;
	level.onHalfTime = maps\mp\gametypes\_gamelogic::default_onHalfTime;
	level.onDeadEvent = maps\mp\gametypes\_gamelogic::default_onDeadEvent;
	level.onOneLeftEvent = maps\mp\gametypes\_gamelogic::default_onOneLeftEvent;
	
	level.onPrecacheGametype = ::blank;
	level.onStartGameType = ::blank;
	level.onPlayerKilled = ::blank;

	level.autoassign = maps\mp\gametypes\_menus::menuAutoAssign;
	level.spectator = maps\mp\gametypes\_menus::menuSpectator;
	level.class = maps\mp\gametypes\_menus::menuClass;
	level.allies = maps\mp\gametypes\_menus::menuAllies;
	level.axis = maps\mp\gametypes\_menus::menuAxis;
}



blank( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10 )
{
}

testMenu()
{
	self endon ( "death" );
	self endon ( "disconnect" );
	
	for ( ;; )
	{
		wait ( 10.0 );
		
		notifyData = spawnStruct();
		notifyData.titleText = &"MP_CHALLENGE_COMPLETED";
		notifyData.notifyText = "wheee";
		notifyData.sound = "mp_challenge_complete";
	
		self thread maps\mp\gametypes\_hud_message::notifyMessage( notifyData );
	}
}

testShock()
{
	self endon ( "death" );
	self endon ( "disconnect" );
	
	for ( ;; )
	{
		wait ( 3.0 );

		numShots = randomInt( 6 );
		
		for ( i = 0; i < numShots; i++ )
		{
			iPrintLnBold( numShots );
			self shellShock( "frag_grenade_mp", 0.2 );
			wait ( 0.1 );
		}
	}
}


onXPEvent( event )
{
	//self thread maps\mp\_loot::giveMoney( event, 10 );
	self thread maps\mp\gametypes\_rank::giveRankXP( event );
}



fakeLag()
{
	self endon ( "disconnect" );
	self.fakeLag = randomIntRange( 50, 150 );
	
	for ( ;; )
	{
		self setClientDvar( "fakelag_target", self.fakeLag );
		wait ( randomFloatRange( 5.0, 15.0 ) );
	}
}




debugLine( start, end )
{
	for ( i = 0; i < 50; i++ )
	{
		line( start, end );
		wait .05;
	}
}
