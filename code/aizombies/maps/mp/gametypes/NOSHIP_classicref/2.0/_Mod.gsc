#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;
#include AImod\spawn;
#include AImod\_weapon;

/*
AI Zombies eXtreme V1.8
by [115]Death

Main Website
http://alteriwnet-115aizombie.de.tl/
Forums
http://alteriwnet-115aizombie.forumprofi.de/index.php

Animated-Ai Bots Unlike Any Other.
Goal: Survive all 30 waves of zombies and crawlers.

Overall Credits:
Rendflex and Yamato for animations.
[115]xSillent [Testing]
My Clan [115]

Some Functions ::
[[level.SpawnTrigger]] (where[Origin], to[Origin], height, radius, map);//Creates a 'anti-glitch' spot or even a teleport if you modify the function.
[[level.SpawnWeapon]]  (Weapon[Name], where[Origin], [optional]angles);//Spawns a gun at the location specified.

There tends to be lag on dedicated servers I am working out a possible fix [Fixed].
*/

//TODO: clean up code a bit
ModLoad()
{
/* Mapedit Don't Touch This Shit */
level thread maps\mp\gametypes\MapEdit::init();

/* Global Vars */
//Bots --------------------
level.MaxWaves = 30;//can change
level.BotsForIcons = 10;//can change
level.SpawnedBots = 0;
level.RealSpawnedBots = 0;
level.BotsForWave = 0;
level.day = 0;
level.nuked = 0;
//Waves -------------------
level.Wave = 0;
//Game State --------------
level.zState = "intermission";
//Timers ------
level.IntermissionTimeStart = 30;//can change
level.IntermissionTime = 0;
level.timeplayedminutes = 0;
level.timeplayed = 0;
//Brightness --------------
level.brightness = -0.07;
//Main Dvars -------------------
setDvar( "g_speed", 190 );
setDvar( "g_hardcore", 1 );
setDvar( "scr_diehard", 1 );
setDvar( "ui_netGametypeName", "^1Zombies" );
setDvar( "scr_war_timelimit", 0 );
setDvar( "g_ScoresColor_Allies", "0 1 0 0" );
setDvar( "g_TeamColor_Allies", "0 1 0 0" );
/* Connection Dvars */	
if(getDvar("z_dedicated") == "")
	setDvar( "z_dedicated", 0 ); //If Dedicated Server or Not 0 = Not Server 1 = Server
/* ZombieMod Dvars */
if(getDvar("z_money") == "")
	setDvar( "z_money", 500 ); //Start Money
if(getDvar("z_endgame") == "")
	setDvar( "z_endgame", 1 );
if(getDvar("z_find") == "") //If the zombies can find the player
	setDvar( "z_find", 1 );
/* Killstreak Dvars */
if(getDvar("z_airstrike") == "")
	setDvar( "z_airstrike", 125 );
if(getDvar("z_25") == "")
	setDvar( "z_25", 25 );
if(getDvar("z_predator_missile") == "")
	setDvar( "z_predator_missile", 50 );
if(getDvar("z_random_1") == "")
	setDvar( "z_random_1", 75 );
if(getDvar("z_sentry") == "")
	setDvar( "z_sentry", 100 );
if(getDvar("z_random_4") == "")
	setDvar( "z_random_4", 150 );
if(getDvar("z_sub") == "")
	setDvar( "z_sub", 175 );
if(getDvar("z_lmg") == "")
	setDvar( "z_lmg", 300 );
if(getDvar("z_overwatch") == "")
	setDvar( "z_overwatch", 400 );
if(getDvar("z_super") == "")
	setDvar( "z_super", 275 );
if(getDvar("z_vision") == "")
	setDvar( "z_vision", 250 );
if(getDvar("z_nuke") == "")
	setDvar( "z_nuke", 650 );
/* Init */
level thread EndMatch();
level FuncsMain();
level precacheItems();
level thread AImod\_hud::IntermissionCountdown();
level thread AImod\_Bot::Init();
level thread Shaders();
level thread UpdateTimePlayed();
level thread InitCountableWeapons();
/* Special Guns Load */
level thread maps\mp\coolweapons\_raygun::init();
level thread maps\mp\coolweapons\_flamethrower::init();
level thread maps\mp\coolweapons\_upgradedraygun::init();
level thread maps\mp\coolweapons\_upgradedflamethrower::init();
level thread maps\mp\coolweapons\_upgradededexplosiveintervention::init();
level thread maps\mp\coolweapons\_explosiveintervention::init();
/* Tweakable */
level.ZombieHealth = 90;//can change
level.destructibleSpawnedEntsLimit += 300;

/* Spawn Anti-Glitch spots */
[[level.SpawnTrigger]] ((1284, 2600, 167), (942, 2604, 51), 50, 100, "mp_terminal");
[[level.SpawnTrigger]] ((1803, 2502, 140), (1790, 2643, 51), 50, 100, "mp_terminal");

/* Hud */
level thread AImod\_hud::HudMain();
level thread AImod\_hud::HudMain2();

/* Player Connect */
level thread onPlayerConnect();

/* Player Pain Vision */
level thread SetVisionPain();

/* EndGame Text */
level.zombieDeath[0] = "Humans Defeated The Zombies!";
level.zombieDeath[1] = "Humans Survived!";
level.zombieDeath[2] = "Good Job Humans!";
level.zombieDeath[3] = "Humans Are All Alive!";
level.zombieDeath[4] = "My Face For Humans :D!";
level.zombieDeath[5] = "Mother Fucker You Survived Humans!";
level.zombieDeath[6] = "Great Job Humans!";
level.zombieDeath[7] = "Good Jon Get Ready For the Next Map!";
level.zombieDeath[8] = "Zombies are so perverts Humans FTW!";
level.zombieDeath[9] = "Humans 1 Zombies 0";
level.zombieDeath[10] = "Humans Win Bitches!";
level.zombieDeath[11] = "Victory!!!";
level.zombieDeath[12] = "Enemy Down!!!";
}

Shaders()
{
    //Icons//
	precacheShader("hudicon_neutral");
	precacheShader("cardicon_fmj");
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
	//Gun Icons//
	precacheShader("hud_icon_m16a4");
	precacheShader("hud_icon_ump45");
	precacheShader("hud_icon_rpd");
	precacheShader("hud_icon_usp_45");
	precacheShader("hud_icon_m9beretta");
	precacheShader("hud_icon_colt_anaconda");
	precacheShader("hud_icon_desert_eagle");
	precacheShader("hud_icon_glock");
	precacheShader("hud_icon_beretta393");
	precacheShader("hud_icon_mp5k");
	precacheShader("hud_icon_pp2000");
	precacheShader("hud_icon_mini_uzi");
	precacheShader("hud_icon_p90");
	precacheShader("hud_icon_kriss");
	precacheShader("hud_icon_mp9");
	precacheShader("hud_icon_ak47");
	precacheShader("hud_icon_m4carbine");
	precacheShader("hud_icon_fn2000");
	precacheShader("hud_icon_masada");
	precacheShader("hud_icon_famas");
	precacheShader("hud_icon_fnfal");
	precacheShader("hud_icon_scar_h");
	precacheShader("hud_icon_tavor");
	precacheShader("hud_icon_m79");
	precacheShader("hud_icon_rpg");
	precacheShader("hud_icon_at4");
	precacheShader("hud_icon_javelin");
	precacheShader("hud_icon_barrett50cal");
	precacheShader("hud_icon_wa2000");
	precacheShader("hud_icon_m14ebr");
	precacheShader("hud_icon_cheytac");
	precacheShader("hud_icon_sawed_off");
	precacheShader("hud_icon_model1887");
	precacheShader("hud_icon_striker");
	precacheShader("hud_icon_aa12");
	precacheShader("hud_icon_benelli_m4");
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
	precacheShader("equipment_c4");
	//Killstreak Icons//
	precacheShader("dpad_killstreak_uav");
	precacheShader("dpad_killstreak_hellfire_missile");
	precacheShader("dpad_killstreak_sentry_gun");
	precacheShader("dpad_killstreak_emp");
	precacheShader("dpad_killstreak_nuke");
	//Models//
	precacheModel("projectile_cbu97_clusterbomb");
	precacheModel("vehicle_uav_static_mp");
	precacheModel("vehicle_ac130_low_mp");
	precacheItem("stinger_mp");
	precacheItem("javelin_mp");
	level.startNode = level.heli_start_nodes[randomInt(level.heli_start_nodes.size)];
	level.leaveNode = level.heli_leave_nodes[ randomInt( level.heli_leave_nodes.size ) ];
}

DestoyHud()
{
	self endon("disconnect");
    {
		self.moneyS destroy();
		wait 0.00001;
		self.bonusS destroy();
		wait 0.00001;
		self.ammoBoard destroy();
		wait 0.00001;
		self.stockBoard destroy();
		wait 0.00001;
		self.moneytext destroy();
		wait 0.00001;
		self.bonustext destroy();
		wait 0.00001;
		self.weapontext destroy();
		wait 0.00001;
		self.powertext destroy();
		wait 0.00001;
		self.GrenadeIcon destroy();
	}
}

DestoyPerkHud()
{
	self endon("disconnect");
    {
		self.perk1 destroy();
		wait 0.00001;
		self.perk2 destroy();
		wait 0.00001;
		self.perk3 destroy();
		wait 0.0001;
		self.perk4 destroy();
		wait 0.00001;
		self.perk5 destroy();
		wait 0.00001;
		self.perk6 destroy();
		wait 0.00001;
		self.perk7 destroy();
		wait 0.00001;
	}
}

Death()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("death");
		self notify("menuresponse", game["menu_team"], "spectator");
		self thread maps\mp\gametypes\_playerlogic::respawn_asSpectator( self.origin + (0, 0, 60), self.angles );
		self thread DestoyHud();
		self thread DestoyPerkHud();
		self thread AImod\_Mod::TextPopup( "Death!" );
		self thread SetVision();
		self allowSpectateTeam( "freelook", true );
		self iprintlnbold("^1Wait for the round to end");
	}
	wait 1;
}

Live()
{
	self endon("disconnect");
	for(;;)
    {
        if(level.zState == "intermission" && self.pers["team"] == "spectator")
        {
		    self notify("menuresponse", game["menu_team"], "allies");
		    wait 0.01;
		    self notify("menuresponse", "changeclass", "class1");
        }
	    wait 1;
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
		players = maps\mp\gametypes\_teams::CountPlayers();
		if(players["allies"] <= 0)
		{
		    if(getdvar("z_endgame") == "1" && level.zState != "intermission")
			{
				foreach(player in level.players)
				{
				    player freezeControls(true);
				    player VisionSetNakedForPlayer( "blacktest", 7 );
					player thread AImod\_Intro::IntroText( "Humans Survived" );
					player thread AImod\_Intro::IntroText2( level.timeplayedminutes + " Minutes" );
					player thread AImod\_Intro::IntroText3( level.timeplayed + " Seconds" );
				}
				wait 7;
				level thread zombie_endGame( winner, level.zombieDeath[randomInt(level.zombieDeath.size)] );
				level notify("endgame_played");
			}
		}
		wait 3;
	}
}

ShowHost(player)
{
	self endon("disconnect");
	player notifyOnPlayerCommand("showHost", "+scores");
	player notifyOnPlayerCommand("hideHost", "-scores");
	for(;;)
	{
		player waittill("showHost");
		hostname = player createFontString("objective", 1.2);
		hostname setPoint("TOPCENTER", "TOPCENTER", 0, 80);
		hostname setText( level.hostname );
		hostname.glowColor = (0.3, 0.6, 0.3);
		hostname.glowAlpha = 1;
		hostname.alpha = 1;
		player thread HostnamePulse(hostname);
		player waittill("hideHost");
		player notify("score_hud_destroy");
		hostname destroy();
	}
}

HostnamePulse(hostname)
{
	self endon("disconnect");
	self endon("score_hud_destroy");
	while(1)
	{
		hostname fadeOverTime( 1.00 );
		hostname.alpha = 0.50;
		hostname ChangeFontScaleOverTime( 1.00 );
		hostname.fontScale = 1.5;
		wait 1;
		hostname fadeOverTime( 1.00 );
		hostname.alpha = 1;
		hostname ChangeFontScaleOverTime( 1.00 );
		hostname.fontScale = 1.2;
		wait 1;
	}
}

DisableAimOnSomeWeapons()
{
	self endon("disconnect");
	for(;;)
    {
        if(self getCurrentWeapon() == "tmp_silencer_mp" || self getCurrentWeapon() == "tmp_silencer_xmags_mp")
        {
		    self allowADS(false);
        }
		if(self getCurrentWeapon() != "tmp_silencer_mp" || self getCurrentWeapon() != "tmp_silencer_xmags_mp")
        {
		    self allowADS(true);
        }
	    self waittill( "weapon_change" );
	}
}

TextPopup( text )
{
	self endon( "disconnect" );
	wait ( 0.05 );
	self.textPopup destroy();
	self notify( "textPopup" );
	self endon( "textPopup" );
	self.textPopup = newClientHudElem( self );
	self.textPopup.horzAlign = "center";
	self.textPopup.vertAlign = "middle";
	self.textPopup.alignX = "center";
	self.textPopup.alignY = "middle";
	self.textPopup.x = 40;
	self.textPopup.y = -30;
	self.textPopup.font = "hudbig";
	self.textPopup.fontscale = 0.69;
	self.textPopup.color = (25.5, 25.5, 3.6);
	self.textPopup setText(text);
	self.textPopup.alpha = 0.85;
	self.textPopup.glowColor = (0.3, 0.3, 0.9);
	self.textPopup.glowAlpha = 0.55;
	self.textPopup ChangeFontScaleOverTime( 0.1 );
	self.textPopup.fontScale = 0.75;	
    wait 0.1;
	self.textPopup ChangeFontScaleOverTime( 0.1 );
	self.textPopup.fontScale = 0.69;	
	switch(randomInt(2))
	{
	    case 0:
		self.textPopup moveOverTime( 2.00 );
		self.textPopup.x = 100;
		self.textPopup.y = -30;
		break;
		case 1:
		self.textPopup moveOverTime( 2.00 );
		self.textPopup.x = -100;
		self.textPopup.y = -30;
		break;
	}
	wait 1;
	self.textPopup fadeOverTime( 1.00 );
	self.textPopup.alpha = 0;
}

TextPopup2( text )
{
	self endon( "disconnect" );
	wait ( 0.05 );
	self.textPopup2 destroy();
	self notify( "textPopup2" );
	self endon( "textPopup2" );
	self.textPopup2 = newClientHudElem( self );
	self.textPopup2.horzAlign = "center";
	self.textPopup2.vertAlign = "middle";
	self.textPopup2.alignX = "center";
	self.textPopup2.alignY = "middle";
	self.textPopup2.x = 0;
	self.textPopup2.y = 0;
	self.textPopup2.font = "hudbig";
	self.textPopup2.fontscale = 0.69;
	self.textPopup2.color = (25.5, 25.5, 3.6);
	self.textPopup2 setText(text);
	self.textPopup2.alpha = 0.85;
	self.textPopup2.glowColor = (0.3, 0.9, 0.3);
	self.textPopup2.glowAlpha = 0.55;
	self.textPopup2 ChangeFontScaleOverTime( 0.1 );
	self.textPopup2.fontScale = 0.75;	
    wait 0.1;
	self.textPopup2 ChangeFontScaleOverTime( 0.1 );
	self.textPopup2.fontScale = 0.69;	
	switch(randomInt(2))
	{
	    case 0:
		self.textPopup2 moveOverTime( 2.00 );
		self.textPopup2.x = 60;
		self.textPopup2.y = 0;
		break;
		case 1:
		self.textPopup2 moveOverTime( 2.00 );
		self.textPopup2.x = -60;
		self.textPopup2.y = 0;
		break;
	}
	wait 1;
	self.textPopup2 fadeOverTime( 1.00 );
	self.textPopup2.alpha = 0;
}

onPlayerConnect()
{
	for(;;)
	{
		level waittill( "connected", player );
		player thread CustomMapnames();
		player [[level.allies]]();
		player.bonus = 0;
		setDvar("didyouknow","^1Made by [115]Death");
		player.money = getdvarInt("z_money");
		player.standpro = 0;
		player.autorevive = 0;
		player.moving = 0;
		player.isup = 0;
		player thread SetVision();
		player setClientDvar("ui_drawCrosshair", 0);
		player thread maps\mp\gametypes\Upgrade::Javlin();
		player thread AImod\_hud2::IntermissionHud();
		player thread Live();
		player thread Death();
		player thread Shaders();
		player thread DisableAimOnSomeWeapons();
		player thread ShowHost(player);
		player thread onPlayerSpawned();
	}
}

onPlayerSpawned()
{
	self endon( "disconnect" );
	for(;;)
	{
		self waittill( "spawned_player" );
		wait 0.001;
		currentWeapon = self getCurrentWeapon();
		self thread AImod\_hud2::WeaponIcon();
		self thread AImod\_hud2::WeaponText();
		self thread AImod\_hud2::AmmoHud();
		self thread AImod\_hud2::Money();
		self thread AImod\_hud2::BonusPoints();
		self thread AImod\_hud2::GrenadeHud();
		self thread maps\mp\gametypes\MapEdit::PowerHud();
		self notify("menuresponse", game["menu_team"], "allies");
		wait 0.001;
		self notify("menuresponse", "changeclass", "class1");
		wait 0.001;
		self.needsToSpawn = false;
		self player_recoilScaleOn(100);
		self.upgrade = 0;
		self.nobuyhealth = 0;
		self.gambler = 0;
		self.speedy = 0;
		self.stoppingpower = 0;
		self.steadyaim = 0;
		self.speedreload = 0;
		self.ammomatic = 0;
		self.zombieperks = 0;
		self.bonusdrophud = 0;
		self.weapons = 0;
		self.inLastStand = false;
		self.inFinalStand = false;
		self.notusebox = 0;
		self.usingairstrike = "false";
		self notify("revive");
		self.moveSpeedScaler = 1.0;
		self maps\mp\gametypes\_weapons::updateMoveSpeedScale( "primary" );
		self thread TakeWeaponsAfghan();
		self thread TakeWeaponsScrapyard();
		self thread TakeWeaponsSkidrow();
		self thread TakeWeaponsUnderpass();
		self thread TakeWeaponsTrailerPark();
		self thread TakeWeaponsQaurry();
		self thread TakeWeaponsRust();
		self thread TakeWeaponsSalvage();
		self thread TakeWeaponsStrike();
		self thread TakeWeaponsHighrise();
		self thread TakeWeaponsDerail();
		self thread TakeWeaponsTerminal();
		self thread TakeWeaponsWasteland();
		self thread TakeWeaponsSubBase();
		self thread TakeWeaponsKarachi();
		self thread TakeWeaponsFavela();
		self thread TakeWeaponsRundown();
		self thread TakeWeaponsBailout();
		self thread TakeWeaponsInvasion();
		self thread TakeWeaponsEstate();
		self thread TakeWeaponsCarnival();
		self thread TakeWeaponsVacant();
		self thread TakeWeaponsStorm();
		self thread KillIfUnderMap();
		if ( self _hasPerk( "specialty_finalstand" ) )
		{
		}
		else
		{
			self.autorevive = 0;
		}
		if(level.zState != "intermission")
		{
			self notify("menuresponse", game["menu_team"], "spectator");
		}
		else
		{
			self thread pMain();
		}
	}
}

pMain()
{
	self endon("respawn");
	self endon("death");
	self endon("disconnect");
	self notifyonplayercommand("lal", "+actionslot 1");
	{
		for(;;)
		if(level.IntermissionTime <= 0)
		{
			if(getDvarInt("z_dedicated") == 0)
			{
				self playLocalSound("mp_killstreak_jet");
			}
			else
			{
				self playLocalSound( game["music"]["winning_allies"] );
			}
			self freezeControls(false);
			break;
		}
		else 
		{
			self freezeControls(true);
			wait 0.05;
		}
	}
}

MonitorKillstreaks()
{
	self endon("death");
	self endon("disconnect");
	for(;;)
	{
		if(self.kills == getdvarInt("z_airstrike") && self.pers["lastKillstreak"] != "uav")
		{
		    self thread TextPopup2(getdvarInt("z_airstrike") + " Kills");
			self.pers["lastKillstreak"] = "uav";
			self playlocalsound("mp_level_up");
			self iPrintlnBold(self.name + " ^3" + getdvarInt("z_airstrike") + " Killstreak You have earned the an Airstrike");
			self maps\mp\killstreaks\_killstreaks::giveKillstreak( "uav", true );
			wait 3.0;
			self maps\mp\gametypes\_hud_message::killstreakSplashNotify( "airstrike", getdvarInt("z_airstrike"));
			Announcement(self.name + " ^3Has got the Airstrike");
		}
		if(self.kills == getdvarInt("z_25"))
		{
			self thread TextPopup2(getdvarInt("z_25") + " Kills");
		}
		if(self.kills == getdvarInt("z_predator_missile") && self.pers["lastKillstreak"] != "predator_missile")
		{
		    self thread TextPopup2(getdvarInt("z_predator_missile") + " Kills");
			self.pers["lastKillstreak"] = "predator_missile";
			self playlocalsound("mp_level_up");
			self iPrintlnBold(self.name + " ^3" + getdvarInt("z_predator_missile") + " Killstreak You have earned the Predator Missile");
			self maps\mp\killstreaks\_killstreaks::giveKillstreak( "predator_missile", true );
			wait 3.0;
			self maps\mp\gametypes\_hud_message::killstreakSplashNotify( "predator_missile", getdvarInt("z_predator_missile"));
			Announcement(self.name + " ^3Has got the Predator Missile");
		}
		if(self.kills == getdvarInt("z_random_1") && self.pers["lastKillstreak"] != "random1")
		{
		    self thread TextPopup2(getdvarInt("z_random_1") + " Kills");
			self.pers["lastKillstreak"] = "random1";
			self playlocalsound("mp_level_up");
			self iPrintlnBold(self.name + " ^3" + getdvarInt("z_random_1") + " Killstreak You have earned a random killstreak");
			wait 2.0;
			self thread KillStreakRandom();
			wait 3.0;
			Announcement(self.name + " ^3Has got a random killstreak");
			self thread maps\mp\gametypes\_rank::scorePopup( 100, 0, (0,1,2), 1 );
			self.money += 100;
			self notify("MONEY");
		}
		if(self.kills == getdvarInt("z_sentry") && self.pers["lastKillstreak"] != "sentry")
		{
		    self thread TextPopup2(getdvarInt("z_sentry") + " Kills");
			self.pers["lastKillstreak"] = "sentry";
			self playlocalsound("mp_level_up");
			self iPrintlnBold(self.name + " ^3" + getdvarInt("z_sentry") + " Killstreak You have earned a Sentry Gun");
			self maps\mp\killstreaks\_killstreaks::giveKillstreak("sentry",true);
			wait 3.0;
			self maps\mp\gametypes\_hud_message::killstreakSplashNotify( "sentry", getdvarInt("z_sentry"));
			Announcement(self.name + " ^3Has got a Sentry Gun");
			self thread maps\mp\gametypes\_rank::scorePopup( 500, 0, (0,1,2), 1 );
			self.money += 500;
			self notify("MONEY");
		}
		if(self.kills == getdvarInt("z_random_4") && self.pers["lastKillstreak"] != "random4")
		{
			self.pers["lastKillstreak"] = "random4";
			self playlocalsound("mp_level_up");
			self thread TextPopup2(getdvarInt("z_random_4") + " Kills");
			self iPrintlnBold(self.name + " ^3" + getdvarInt("z_random_4") + " Killstreak you have earned 4 random killstreaks");
			wait 3.0;
			self thread KillStreakRandom();
			wait 3.0;
			self thread KillStreakRandom();
			wait 3.0;
			self thread KillStreakRandom();
			wait 3.0;
			self thread KillStreakRandom();
			wait 3.0;
			Announcement(self.name + " ^3Has got 4 random killstreaks!");
			self thread maps\mp\gametypes\_rank::scorePopup( 1000, 0, (0,1,2), 1 );
			self.money += 1000;
			self notify("MONEY");
		}
		if(self.kills == getdvarInt("z_sub") && self.pers["lastKillstreak"] != "sub")
		{
		    self thread TextPopup2(getdvarInt("z_sub") + " Kills");
			self.pers["lastKillstreak"] = "sub";
			self playlocalsound("mp_level_up");
			self iPrintlnBold(self.name + " ^3" + getdvarInt("z_sub") + " Killstreak Sub Team Ready For Deployment");
			self thread maps\mp\killstreaks\_sniper::SniperStreak();
			wait 3.0;
			self thread TextPopup2("Press [{+actionslot 2}] to use Sub Team");
			Announcement(self.name + " ^3Has got the Sub Team");
		}
		if(self.kills == getdvarInt("z_lmg") && self.pers["lastKillstreak"] != "lmg")
		{
		    self thread TextPopup2(getdvarInt("z_lmg") + " Kills");
			self.pers["lastKillstreak"] = "lmg";
			self playlocalsound("mp_level_up");
			self iPrintlnBold(self.name + " ^3" + getdvarInt("z_lmg") + " Killstreak LMG Team Ready For Deployment");
			self thread maps\mp\killstreaks\_sniper::MachineGunStreak();
			wait 3.0;
			self thread TextPopup2("Press [{+actionslot 2}] to use LMG Team");
			Announcement(self.name + " ^3Has got the LMG Team");
		}
		if(self.kills == getdvarInt("z_overwatch") && self.pers["lastKillstreak"] != "overwatch")
		{
		    self thread TextPopup2(getdvarInt("z_overwatch") + " Kills");
			self.pers["lastKillstreak"] = "overwatch";
			self playlocalsound("mp_level_up");
			self iPrintlnBold(self.name + " ^3" + getdvarInt("z_overwatch") + " Killstreak Overwatch For Deployment");
			self thread maps\mp\killstreaks\_overwatch::OverwatchStreak();
			wait 3.0;
			self maps\mp\gametypes\_hud_message::killstreakSplashNotify( "littlebird_support", getdvarInt("z_overwatch"));
			self thread TextPopup2("Press [{+actionslot 2}] to use Overwatch");
			Announcement(self.name + " ^3Has got an Overwatch");
		}
		if(self.kills == getdvarInt("z_super") && self.pers["lastKillstreak"] != "super")
		{
		    self thread TextPopup2(getdvarInt("z_super") + " Kills");
			self.pers["lastKillstreak"] = "super";
			self playlocalsound("mp_level_up");
			self iPrintlnBold(self.name + " ^3" + getdvarInt("z_super") + " Killstreak You have earned the Super Airstrike");
			self maps\mp\killstreaks\_killstreaks::giveKillstreak( "counter_uav", true );
			wait 3.0;
			self maps\mp\gametypes\_hud_message::killstreakSplashNotify( "ac130", getdvarInt("z_super"));
			Announcement(self.name + " ^3Has got the Super Airstrike");
		}
		if(self.kills == getdvarInt("z_vision") && self.pers["lastKillstreak"] != "emp" && getdvar("mapname") == "mp_boneyard" || self.pers["botKillstreak"] == 250 && self.pers["lastKillstreak"] != "emp" && getdvar("mapname") == "mp_quarry" || self.pers["botKillstreak"] == 250 && self.pers["lastKillstreak"] != "emp" && getdvar("mapname") == "mp_nightshift" && level.edit == 2 || self.pers["botKillstreak"] == 250 && self.pers["lastKillstreak"] != "emp" && getdvar("mapname") == "mp_highrise" && level.edit == 1)
		{
		    self thread TextPopup2(getdvarInt("z_emp") + " Kills");
			self.pers["lastKillstreak"] = "emp";
			self playlocalsound("mp_level_up");
			self iPrintlnBold(self.name + " ^3" + getdvarInt("z_emp") + " Killstreak You have earned the Vision Restorer");
			self maps\mp\killstreaks\_killstreaks::giveKillstreak( "emp", true );
			wait 3.0;
			self maps\mp\gametypes\_hud_message::killstreakSplashNotify( "emp", getdvarInt("z_emp"));
			Announcement(self.name + " ^3Has got the Vision Restorer");
		}
		if(self.kills == getdvarInt("z_nuke") && self.pers["lastKillstreak"] != "nuke")
		{
		    self thread TextPopup2(getdvarInt("z_nuke") + " Kills");
			self.pers["lastKillstreak"] = "nuke";
			self playlocalsound("mp_bomb_plant");
			self iPrintlnBold(self.name + " ^3" + getdvarInt("z_nuke") + " Killstreak You have earned the Tactical Nuke");
			self maps\mp\killstreaks\_killstreaks::giveKillstreak( "nuke", true );
			wait 3.0;
			self maps\mp\gametypes\_hud_message::killstreakSplashNotify( "nuke", getdvarInt("z_nuke"));
			Announcement(self.name + " ^3Has earned the Tactical Nuke");
		}
		self waittill("zombie_killed");
	}
}

KillStreakRandom()
{
	self endon("disconnect");
	switch(randomInt(2))
	{
		case 0: self iPrintlnBold(self.name + " ^3Predator Missile!");
		self maps\mp\killstreaks\_killstreaks::giveKillstreak( "predator_missile", true );
		self maps\mp\gametypes\_hud_message::killstreakSplashNotify( "predator_missile_pickup");
		break;
		case 1: self iPrintlnBold(self.name + " ^3Airstrike");
		self maps\mp\killstreaks\_killstreaks::giveKillstreak( "uav", true );
		wait 3.0;
		self maps\mp\gametypes\_hud_message::killstreakSplashNotify( "airstrike");
		break;
	}
}

KillIfUnderMap()
{
	self endon("death");
	while(1)
	{
		if(getdvar("mapname") == "mp_rust" && self.origin[2] <= -429 && level.edit == 0 || getdvar("mapname") == "mp_rust" && self.origin[2] <= -306 && level.edit == 1)
		{
			self suicide();
		}
		if(getdvar("mapname") == "mp_estate" && self.origin[2] <= -713)
		{
			self suicide();
		}
		if(getdvar("mapname") == "mp_afghan" && self.origin[2] <= -1585)
		{
			self suicide();
		}
		if(getdvar("mapname") == "mp_vacant" && self.origin[2] <= -350)
		{
			self suicide();
		}
		wait 0.1;
	}
}