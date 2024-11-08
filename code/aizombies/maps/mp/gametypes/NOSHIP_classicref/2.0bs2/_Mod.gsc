#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;
#include AImod\spawn;
#include AImod\_weapon;
#include AImod\_player;

/*************************************************************************************************************************************************************************************************************************************************************
*																												AI Zombies eXtreme V2																														 *
*																											Animated bots that have AI.																														 *
*																								Goal: Survive the attack of the undead. The waves can be set by "z_waves"																					 *
*																																																															 *
*																													Overall Credits:																														 *
*																											Zombiefan564 for overall coding																													 *
*																											DidUknowiPwn & momo5502 for assisting.																											 *
*																											Rendflex & Yamato for animations.																												 *
*																											reaaL for the music player!																														 *
*																																																															 *
*																											© 2011-2013 by Zombiefan564 ©																													 *
*														Do not edit this mod without contacting me, Zombiefan564, my skype is magicownage and my youtube page is 564Zombies. If you do you may be in trouble.												 *
*																																																															 *
*														If there is lag on your dedicated servers it means you need better upload to handle the mod or need to reduce the number of people in the server.													 *
*************************************************************************************************************************************************************************************************************************************************************/

//TODO: clean up code a bit
ModLoad()
{
	/* Mapedit Don't Touch This Shit */
	level thread maps\mp\gametypes\MapEdit::init();

	level thread doGVars();
	level thread scripts\functions::doDvars();

	/* Init */
	level AImod\_Bot::TypeSetup();
	level AImod\_dogs::initDogs();
	level thread EndMatch();
	level FuncsMain();
	level precacheItems();
	level thread AImod\_hud::IntermissionCountdown();
	level thread AImod\animation::Init();
	level thread Shaders();
	level thread UpdateTimePlayed();
	level thread InitCountableWeapons();
	level thread AImod\_botUtil::PickLevelModel();
	level thread initGiveWeapon();
	
	/* Variables */
	level.insta_ko = 0;
	level.double_points = 0;
	
	/* Tweakable */
	level.ZombieHealth = 90;//can change
	level.destructibleSpawnedEntsLimit += 300;

	/* Spawn Anti-Glitch spots */
	[[level.SpawnTrigger]] ((1284, 2600, 167), (942, 2604, 51), 50, 100, "mp_terminal");
	[[level.SpawnTrigger]] ((1803, 2502, 140), (1790, 2643, 51), 50, 100, "mp_terminal");

	/* Player Connect */
	level thread onPlayerConnect();

	/* EndGame Text */
	level.zombieDeath[0] = "Humans Defeated The Zombies!";
	level.zombieDeath[1] = "Humans Survived!";
	level.zombieDeath[2] = "Good Job Humans!";
	level.zombieDeath[3] = "Humans Are All Alive!";
	level.zombieDeath[4] = "My Face For Humans :D!";
	level.zombieDeath[5] = "Mother Fucker You Survived, Humans!";
	level.zombieDeath[6] = "Great Job Humans!";
	level.zombieDeath[7] = "Good Job Get Ready For the Next Map!";
	level.zombieDeath[8] = "Zombies are so perverts, Humans FTW!";
	level.zombieDeath[9] = "Humans 1 Zombies 0";
	level.zombieDeath[10] = "Humans Win Bitches!";
	level.zombieDeath[11] = "Victory!!!";
	level.zombieDeath[12] = "Enemy Down!!!";

	wait 2;// Wait so the map can load

	level thread SetVisionPain();// Pain Vision
}

doGVars()
{
	/* Global Vars */
	//Bots --------------------
	level.SpawnedBots     = 0;
	level.RealSpawnedBots = 0;
	level.BotsForWave     = 0;
	level.day             = 0;
	level.nuked           = 0;
	level.crawlers        = 0;
	level.boss            = 0;
	level.hellzombie      = 0;
	level.hellboss        = 0;
	level.progressmap     = 0;
	level.roundnotstarted = 0;
	//Waves -------------------
	level.Wave = 0;
	//Game State --------------
	level.zState = "intermission";
	//Timers ------------------
	level.IntermissionTimeStart = 30;//can change
	level.IntermissionTimeRound = 20;
	level.IntermissionTime      = 0;
	level.timeplayedminutes     = 0;
	level.timeplayed            = 0;
	//Brightness --------------
	level.brightness = -0.07;
}

initGiveWeapon()
{
	level endon("disconnect");
	while(1)
	{
		if(getDvarInt("give_weapon") != 1)
		{
			if(getDvar("give_weapon") == "ammo")
			{
				foreach(player in level.players)
				{
					player giveMaxAmmo(player getCurrentWeapon());
				}
			}
			else
			{
				foreach(player in level.players)
				{
					player takeWeapon(player getCurrentWeapon());
					player giveWeapon(getDvar("give_weapon"),0, true);
					wait 0.01;
					player switchToWeapon(getDvar("give_weapon"));
				}
			}
			setDvar("give_weapon", 1);
		}
		wait 0.1;
	}
}

Shaders()
{
    //Icons//
	precacheShader("hudicon_neutral");
	precacheShader("cardicon_fmj");
	precacheShader("cardicon_juggernaut_1");
	precacheShader("cardicon_ghillie");
	precacheShader("cardicon_juggernaut_2");
	precacheShader("cardicon_bulb");
	precacheShader("cardicon_doubletap");
	precacheShader("cardicon_harrier");
	precacheShader("cardicon_burgertown");
	precacheShader("cardicon_8ball");
	precacheShader("cardicon_bullets_50cal");
	precacheShader("cardicon_gold");
	precacheShader("cardicon_skull");
	precacheShader("cardicon_tsunami");
	precacheShader("cardicon_binoculars_1");
	precacheShader("cardicon_chicken");
	precacheShader("compassping_enemyfiring");
	precacheShader("cardicon_expert_aug"); //stalker
	//Gun Icons//
	precacheShader("hud_icon_m16a4");
	precacheShader("weapon_m16a4");
	precacheShader("hud_icon_ump45");
	precacheShader("hud_icon_rpd");
	precacheShader("hud_icon_usp_45");
	precacheShader("weapon_colt_45");
	precacheShader("hud_icon_m9beretta");
	precacheShader("weapon_m9beretta");
	precacheShader("weapon_colt_anaconda");
	precacheShader("weapon_desert_eagle");
	precacheShader("hud_icon_glock");
	precacheShader("weapon_beretta393");
	precacheShader("hud_icon_mp5k");
	precacheShader("hud_icon_pp2000");
	precacheShader("hud_icon_mini_uzi");
	precacheShader("hud_icon_p90");
	precacheShader("hud_icon_kriss");
	precacheShader("hud_icon_mp9");
	precacheShader("weapon_ak47");
	precacheShader("hud_icon_m4carbine");
	precacheShader("hud_icon_fn2000");
	precacheShader("hud_icon_masada");
	precacheShader("hud_icon_famas");
	precacheShader("hud_icon_fnfal");
	precacheShader("hud_icon_scar_h");
	precacheShader("hud_icon_tavor");
	precacheShader("hud_icon_m79");
	precacheShader("hud_icon_rpg");
	precacheShader("weapon_at4");
	precacheShader("hud_icon_javelin");
	precacheShader("weapon_barrett50cal");
	precacheShader("hud_icon_wa2000");
	precacheShader("hud_icon_m14ebr");
	precacheShader("hud_icon_cheytac");
	precacheShader("hud_icon_sawed_off");
	precacheShader("hud_icon_model1887");
	precacheShader("hud_icon_striker");
	precacheShader("weapon_aa12");
	precacheShader("weapon_benelli_m4");
	precacheShader("hud_icon_spas12");
	precacheShader("hud_icon_rpd");
	precacheShader("hud_icon_sa80");
	precacheShader("hud_icon_mg4");
	precacheShader("hud_icon_m240");
	precacheShader("hud_icon_steyr");
	precacheShader("hud_icon_40mm_grenade");
	precacheShader("hud_icon_stinger");
	//Perk Icons//
	precacheShader("specialty_fastreload_upgrade");
	precacheShader("specialty_bulletdamage_upgrade");
	precacheShader("specialty_lightweight_upgrade");
	precacheShader("specialty_hardline_upgrade");
	precacheShader("specialty_steadyaim_upgrade");
	precacheShader("specialty_pistoldeath");
	precacheShader("specialty_pistoldeath_upgrade");
	//Equipment Icons//
	precacheShader("equipment_frag");
	precacheShader("equipment_semtex");
	precacheShader("equipment_throwing_knife");
	precacheShader("equipment_c4");
	//Killstreak Icons//
	precacheShader("dpad_killstreak_uav");
	precacheShader("dpad_killstreak_hellfire_missile");
	precacheShader("dpad_killstreak_sentry_gun");
	precacheShader("dpad_killstreak_emp");
	precacheShader("dpad_killstreak_nuke");
	//Other Shaders//
	precacheShader("hud_weaponbar");
	precacheShader("line_horizontal");
	precacheShader("weapon_attachment_akimbo");
	//Models//
	precacheModel("projectile_cbu97_clusterbomb");
	precacheModel("vehicle_uav_static_mp");
	precacheModel("vehicle_ac130_low_mp");
	precacheModel("com_plasticcase_beige_big");
	precacheModel("com_laptop_2_open");
	precacheItem("stinger_mp");
	precacheItem("javelin_mp");
	/* Fx's */
	level.ump45Flash = loadfx( "muzzleflashes/ak47_flash_wv" );
	level.rpdFlash = loadfx( "muzzleflashes/saw_flash_wv" );
	level.bloodfx = loadfx("impacts/flesh_hit_body_fatal_exit");
	level.nukefx = loadfx("explosions/player_death_nuke");
	level.nuke2fx = loadfx("explosions/player_death_nuke_flash");
	level.empfx = loadfx("explosions/emp_flash_mp");
	level.zombiefx = loadfx("props/barrel_fire");
	level.crawlerzombiefirefx = loadfx("fire/firelp_small_pm");
	level.SmallFire = loadfx( "fire/firelp_small_pm" );
	level.flareFx = loadFx( "smoke/signal_smoke_airdrop" );
	
	level.startNode = level.heli_start_nodes[randomInt(level.heli_start_nodes.size)];
	level.leaveNode = level.heli_leave_nodes[ randomInt( level.heli_leave_nodes.size ) ];
}

DestoyPerkHud()
{
	self endon("disconnect");
    {
		foreach(PerkIcons in self.perkhud)
		PerkIcons destroy();
	}
}

Death()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("death");
		self thread DestoyPerkHud();
		self thread AImod\_text::HudRightMessage("^1You have died wait till next round to respawn.");
		self iprintln("^1" + self.name + " has been killed");
		wait 1;
		self maps\mp\gametypes\_menus::addToTeam( "spectator" );
		self thread maps\mp\gametypes\_playerlogic::respawn_asSpectator( self.origin + (0, 0, 30), self.angles );
		wait 0.1;
		self allowSpectateTeam( "freelook", true );
		self.playerIsDead = 1;
	}
}

Live()
{
	self endon("disconnect");
	for(;;)
    {
        if(level.zState == "intermission" && self.playerIsDead == 1)
        {
			self maps\mp\gametypes\_menus::addToTeam( "allies" );
		    self thread maps\mp\gametypes\_playerlogic::spawnPlayer();
			self.playerIsDead = 0;
        }
		if(level.zState != "intermission" && self.playerIsDead == 1 && self.pers["team"] == "allies")
        {
			self maps\mp\gametypes\_menus::addToTeam( "spectator" );
			wait 0.1;
			self thread maps\mp\gametypes\_playerlogic::respawn_asSpectator( self.origin + (0, 0, 30), self.angles );
			self allowSpectateTeam( "freelook", true );
			self.playerIsDead = 1;
        }
		if(level.zState != "intermission" && self.playerIsDead == 1 && self.pers["team"] == "spectator" && self getCurrentWeapon() != "none")
        {
			self thread maps\mp\gametypes\_playerlogic::respawn_asSpectator( self.origin + (0, 0, 30), self.angles );
			self allowSpectateTeam( "freelook", true );
			self.playerIsDead = 1;
        }
	    wait 0.1;
	}
}

zombie_endGame( winningTeam, endReasonText )
{
    thread maps\mp\gametypes\_gamelogic::endGame( winningTeam, endReasonText );
}

EndMatch()
{
	level endon("disconnect");
	self endon("endgame_played");
	level.EndText = "Zombies have eaten the Humans!";
	winner = "axis";
	wait 35;
	while( 1 )
	{
		players = CountAlivePlayers();
		mostKills = getPlayerWithMostKills();
		if(players <= 0)
		{
		    if(getdvar("z_endgame") == "1" && level.zState != "intermission")
			{
				foreach(player in level.players)
				{
					wait 1;
					MusicStop(1); //better than StopSounds() as it actually fades the music out.
					wait 1;
					//player StopSounds();
					player playLocalSound("mp_killstreak_carepackage");
				    player freezeControls(true);
					level.Camera = spawn("script_model", mostKills.origin+(0,100,100));
					level.Camera setModel("tag_origin");
					movetoLoc = VectorToAngles( Mostkills.origin - level.Camera.origin );
					level.Camera.angles = (0,movetoLoc[1],0);
					level.Camera NotSolid();
					level.Camera EnableLinkTo();
					level.Camera moveTo(level.Camera.origin+(0,0,2000), 25);
					player hide();
					player notSolid();
					player CameraLinkTo( level.Camera, "tag_origin" );
					player thread AImod\_text::EndGameText("Humans Survived for", level.timeplayedminutes + " Minutes", level.timeplayed + " Seconds", "Waves Survived " + level.Wave, "Zombies Win This Round", 1, (1,0,0), (0.3,0.9,0.9), 0.85, (1,0.5,0.3), (0.3,0.9,0.9), 0.85, (1,1,0), (0.3,0.9,0.9), 0.85, (1,0,0), (0.3,0.3,0.9), 0.85, (1,0.5,0.3), (0.9,0.3,0.3), 0.85);
				}
				wait 5;
				//level thread maps\mp\killstreaks\_nuke::nukeEffects();
				level thread NukeFlash();
				if(getDvarInt("z_dedicated") == 0)
					setSlowMotion( 1.0, 0.4, 0.5 );
				foreach(player in level.players)
				{
					player playlocalsound( "nuke_explosion" );
					player playlocalsound( "nuke_wave" );
					player thread maps\mp\killstreaks\_nuke::nukeVisionReal();
				}
				
				level thread EMPFlash();
				
				foreach(zombie in level.bots)
				{
					zombie hide();
					zombie.head hide();
				}
				wait 5; //0.7
				if(getDvarInt("z_dedicated") == 0)
					setSlowMotion( 0.4, 1, 2.0 );
				wait 5;
				level thread zombie_endGame( winner, "Zombies ate the humans");
				level notify("endgame_played");
			}
		}
		wait 3;
	}
}

rotateCamera()
{
	for (;;)
	{
		self rotateyaw( -360, 5 );
		wait ( 5 );
	}
}

NukeFlash( loop )
{
	setDvar( "ui_bomb_timer", 0 );
	
	player = level.Camera;	
	playerForward = anglestoforward( player.angles );
	playerForward = ( playerForward[0], playerForward[1], 0 );
	playerForward = VectorNormalize( playerForward );
	
	nukeDistance = 5000;

	level.nukeEnt = Spawn( "script_model", player.origin + Vector_Multiply( playerForward, nukeDistance ) );
	level.nukeEnt.origin = ( level.nukeEnt.origin[0], level.nukeEnt.origin[1], ( ( level.nukeEnt.origin[2] + level.players[0].origin[2] ) / 2 ) );
	trace = bulletTrace(level.nukeEnt.origin, level.nukeEnt.origin + (0,0,-20000), false, self);
	level.nukeEnt.origin = (trace["position"]);
	level.nukeEnt setModel( "tag_origin" );
	level.nukeEnt.angles = ( 0, (player.angles[1] + 180), 90 );
	level.nukepos = level.nukeEnt.origin;
		
	level.nukeEnt thread maps\mp\killstreaks\_nuke::nukeEffect();
}

empFlash()
{
	wait ( 2.0 );
	
	foreach( player in level.players )
	{
		level.nukeEnt thread maps\mp\killstreaks\_emp::empEffect( player );
	}
}

UpdateZombies(player)
{
	player endon("hideHost");
	while(1)
	{
		self setValue(AImod\_botUtil::ZombieCount());
		wait 0.1;
	}
}

UpdateRound(player)
{
	player endon("hideHost");
	while(1)
	{
		if(level.zState != "intermission")
		{
			self.label = &"Wave: ";
			self setValue(level.Wave);
		}
		else if(level.zState == "intermission")
		{
			self.label = &"Intermission Next Wave: ";
			self setValue(level.Wave + 1);
		}
		wait 0.1;
	}
}

TextPopup( text )
{
	self endon( "disconnect" );
	wait ( 0.05 );
	self.textPopup destroy();
	self notify( "textPopup" );
	self endon( "textPopup" );
	self.textPopup = self createFontString( "hudbig", 0.8 );
	self.textPopup setPoint("BOTTOMCENTER", "BOTTOMCENTER", 0, -65);
	self.textPopup setText(text);
	self.textPopup.alpha = 0.85;
	self.textPopup.glowColor = (0.3, 0.9, 0.9);
	self.textPopup.glowAlpha = 0.55;
	self.textPopup SetPulseFX( 100, 2100, 1000 );
	self.textPopup ChangeFontScaleOverTime( 0.1 );
	self.textPopup.fontScale = 0.75;	
    wait 0.1;
	self.textPopup ChangeFontScaleOverTime( 0.1 );
	self.textPopup.fontScale = 0.65;	
}

TextPopup2( text )
{
	self endon( "disconnect" );
	wait ( 0.05 );
	self.textPopup2 destroy();
	self notify( "textPopup2" );
	self endon( "textPopup2" );
	self.textPopup2 = self createFontString( "hudbig", 0.8 );
	self.textPopup2 setPoint("BOTTOMCENTER", "BOTTOMCENTER", 0, -105);
	self.textPopup2 setText(text);
	self.textPopup2.alpha = 0.85;
	self.textPopup2.glowColor = (0.3, 0.9, 0.3);
	self.textPopup2.glowAlpha = 0.55;
	self.textPopup2 SetPulseFX( 100, 3000, 1000 );
	self.textPopup2 ChangeFontScaleOverTime( 0.1 );
	self.textPopup2.fontScale = 0.75;	
    wait 0.1;
	self.textPopup2 ChangeFontScaleOverTime( 0.1 );
	self.textPopup2.fontScale = 0.65;	
}

onPlayerConnect()
{
	for(;;)
	{
		level waittill( "connected", player );
		if(level.roundnotstarted == 0)
		{
			level notify("start_zombie_round");
			level.roundnotstarted = 1;
		}
		player [[level.allies]]();
		player set_Player_AIZ_Connect_Variables();
		player set_Player_AIZ_Connect_Threads();
		player thread onPlayerSpawned();
	}
}

onPlayerSpawned()
{
	self endon( "disconnect" );
	for(;;)
	{
		self waittill( "spawned_player" );
		self DetachAll();
		wait 0.001;
		self thread AImod\spawn::GiveRandomModel();
		self change_spawns();
		self SpawnAngles();
		if(getDvarInt("z_friend") >= 1)
		{
			self thread maps\mp\killstreaks\_sniper::SpawnChickenFriend(self);
		}
		if(!self _hasPerk( "specialty_finalstand" ))
		{
			self.autorevive = 0;
		}
		if(level.zState != "intermission" && self.playerIsDead == 1)
		{
			self.playerIsDead = 1;
		}
	}
}