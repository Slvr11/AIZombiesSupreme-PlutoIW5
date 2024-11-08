#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AIMod\_OtherFunctions;

KillerHeli()
{
	startPoints = getEntArray( "heli_start", "targetname" );
	startPoint = startPoints[ randomint( 65535 ) % startPoints.size ].origin;
	
	if(getDvarInt("z_dedicated") == 0)
	{
		foreach(player in level.players)
			player PlaySound("US_1mc_enemy_hind");
	}
	wait 1;
	player = level.players[RandomInt(level.players.size)];
	level.heli = spawnHelicopter(player, startPoint, (0,0,0), "pavelow_mp", "vehicle_little_bird_armed");
	level.heli.pilot1 = spawn( "script_model", level.heli.origin );
	level.heli.pilot1 setModel("tag_origin");
	level.heli.pilot1 EnableLinkTo();
	level.heli.pilot1 LinkTo( level.heli, "tag_pilot1", (0,0,-25), (0,0,0) );
	level.Camera = spawn("script_model", player.origin+(0,0,50));
	level.Camera setModel("tag_origin");
	level.Camera NotSolid();
	level.Camera EnableLinkTo();
	level.players[RandomInt(level.players.size)] sayAll("^7Good job guys we are exfiltrating now!");
	level.heli playSound("US_1mc_use_apache");
	level.heli Vehicle_SetSpeed( 30, 20 );
    level.heli setvehgoalpos(player.origin+(0,0,1000),1);
	level.heli waittillmatch("goal");
	level.players[RandomInt(level.players.size)] sayAll("^7Nice job guys now let's get the fuck out of here!");
	level.heli loadAllPlayersOn();
	
	level.heli Vehicle_SetSpeed(20,30);
    level.heli setvehgoalpos(level.heli.origin+(0,0,2000),1);
	level.heli waittillmatch("goal");
	level.heli Vehicle_SetSpeed(30,40);
	level.heli setvehgoalpos(level.mapCenter+(RandomIntRange(-50000,50000),RandomIntRange(-50000,50000),RandomIntRange(1000,1500)),1);
	foreach(player in level.players)
	{
		player thread maps\mp\gametypes\_rank::scorePopup(10000, 0, (1,1,0.5));
		player thread AImod\_Mod::TextPopup( "10000 Rank XP!" );
		player thread maps\mp\gametypes\_rank::giveRankXP("kill", 10000 );
		player.xpearned += 10000;
	}
	wait 12;
	level thread NukeFlashWin();
	PlaySoundToEveryone( "nuke_explosion" );
	wait 0.4;
	PlaySoundToEveryone( "nuke_wave" );
	wait 0.5;
	level.heli thread HeliSpin();
	earthquake(1.3,1.1, player.origin, 3000);
	wait 1;
	VisionSetNaked( "coup_sunblind", 0.2 );
	level.heli playSound("cobra_helicopter_crash");
	wait 2;
	VisionSetNaked( "blacktest", 0.1 );
	thread maps\mp\gametypes\_gamelogic::endGame( "allies", level.zombieDeath[randomInt(level.zombieDeath.size)] );
	
}

loadAllPlayersOn()
{
	VisionSetNaked("blacktest", 2.5);	
	
	wait 0.5;
	
	foreach( player in level.players)
		player ShellShock( "frag_grenade_mp", 2 );
	
	wait 2.5;
	
	foreach( player in level.players)
	{
		player hide();
		player notSolid();
		player disableWeapons();
		player playerlinkTo(level.Camera, "tag_origin");
		player setStance("crouch");		
	}
	
	wait 0.5;
	
	level.Camera linkto(level.heli.pilot1, "tag_origin", (0,0,0),(0,0,0));
	
	foreach(player in level.players)
	{
		player thread forceStance( "crouch" );
		player thread AImod\_OtherFunctions::SetVision(1.5);
	}
}

forceStance( stance )
{
	self endon("death");
	
	while( true )
	{
		self setStance( stance );
		waitframe();
	}
}

NukeFlashWin()
{
	setDvar( "ui_bomb_timer", 0 );
	
	player = level.players[randomint( 65535 ) % level.players.size ];	
	playerForward = anglestoforward( level.heli.angles );
	playerForward = ( playerForward[0], playerForward[1], 0 );
	playerForward = VectorNormalize( playerForward );
	
	nukeDistance = 5000;

	level.nukeEnt = Spawn( "script_model", player.origin + Vector_Multiply( playerForward, nukeDistance ) );
	level.nukeEnt.origin = ( level.nukeEnt.origin[0], level.nukeEnt.origin[1], ( ( level.nukeEnt.origin[2] + level.players[0].origin[2] ) / 2 ) );
	trace = bulletTrace(level.nukeEnt.origin, level.nukeEnt.origin + (0,0,-20000), false, self);
	level.nukeEnt.origin = (trace["position"]);
	level.nukeEnt setModel( "tag_origin" );
	level.nukeEnt.angles = ( 0, (level.heli.angles[1] + 180), 90 );
	level.nukepos = level.nukeEnt.origin;

	for( i=0;i<3;i++)
	{
		level.nukeEnt thread maps\mp\killstreaks\_nuke::nukeEffect();
		level.nukeEnt.origin -= (0, 0, 200);
	}
}

HeliSpin()
{
	self setyawspeed( 180, 180, 180 );
	while(isDefined(self))
	{
		self settargetyaw( self.angles[1]+(162) );
		wait 1;
	}
}

KillAllPlayersAndHelicoperExplode()
{
	self.headIcon destroy();
	self playSound("cobra_helicopter_crash");
	playFx( loadfx( "explosions/helicopter_explosion_mi28_flying" ), self getTagOrigin( "tag_deathfx" ), anglesToForward( self getTagAngles( "tag_deathfx" ) ), anglesToUp( self getTagAngles( "tag_deathfx" ) ) );
	self delete();
	trace = bulletTrace(level.Camera.origin, level.Camera.origin+(0,0,-10000), false, self);
	trace = bulletTrace(level.Camera2.origin, level.Camera.origin+(0,0,-10000), false, self);
	level.Camera unlink();
	level.Camera2 unlink();
	level.Camera moveTo((trace["position"]),2);
	level.Camera2 moveTo((trace["position"]), 2);
	foreach(player in level.players)
	{
		player setPerk("specialty_falldamage");
		player unlink();
		earthquake(1.3,1.1, player.origin, 3000);
		player VisionSetNakedForPlayer("coup_sunblind", 0);	
	}
	wait 2;
	foreach(player in level.players)
	{
		player unlink();
		player show();
		player Solid();
		player enableWeapons();
		player VisionSetNakedForPlayer("mpnuke_aftermath", 2);	
	}
	level.players[RandomInt(level.players.size)] sayAll("Is everyone ok?");
	level.BotsForWave = 0;
	AmbientStop(1);
	wait 7;
	if(getDvarInt("z_dedicated") == 0)
	{
		foreach(player in level.players)
		{
			player playLocalSound("mp_killstreak_harrierstrike");
		}
	}
	foreach(player in level.players)
	{
		player thread maps\mp\gametypes\_rank::scorePopup(10000, 0, (1,1,0.5));
		player thread AImod\_Mod::TextPopup( "10000 Rank XP!" );
		player thread maps\mp\gametypes\_rank::giveRankXP("kill", 10000 );
		player.xpearned += 10000;
	}
	wait 5;
	level thread maps\mp\killstreaks\_nuke::nukeEffects();
	foreach(player in level.players)
	{
		player thread AImod\_text::EndGameText("Humans Survived", level.timeplayedminutes + " Minutes", level.timeplayed + " Seconds", "Waves Survived " + level.Wave, level.zombieDeath[randomInt(level.zombieDeath.size)], 1, (0,1,0), (0.3,0.9,0.9), 0.85, (0,1,0), (0.3,0.9,0.9), 0.85, (0,1,0), (0.3,0.9,0.9), 0.85, (0,1,0), (0.3,0.3,0.9), 0.85, (0,1,0), (0.9,0.3,0.3), 0.85);
		player playlocalsound( "nuke_explosion" );
		player playlocalsound( "nuke_wave" );
		player thread maps\mp\killstreaks\_nuke::nukeVisionReal();
	}
	wait 6;
	thread maps\mp\gametypes\_gamelogic::endGame( "allies", level.zombieDeath[randomInt(level.zombieDeath.size)] );
}

PlayHeliFall()
{
	while(isDefined(self))
	{
		PlayFXOnTag( loadFx("smoke/smoke_trail_black_heli_emitter"), self, "tag_engine_left" );
		PlayFXOnTag( loadFx("fire/fire_smoke_trail_L_emitter"), self, "tag_engine_left" );
		wait 4;
	}
}