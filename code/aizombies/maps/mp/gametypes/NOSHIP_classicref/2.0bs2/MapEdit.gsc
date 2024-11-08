#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\SolidStuff;
#include maps\mp\gametypes\MapSpawns;
#include AImod\_OtherFunctions;
#include AImod\_weapon;
#include AImod\_hud;
#include AImod\_text;

init()
{
	//Yamato - this must be threaded in init
	AddBoxType( "ammo", "waypoint_ammo_friendly", ::AmmoRefill, "Hold ^3[{+activate}]^7 for an Ammo Refill", "waypoint_ammo_friendly" );
    AddBoxType( "stalker", "specialty_pistoldeath_upgrade", ::SetStalker, "Hold ^3[{+activate}]^7 to get Stalker perk", "specialty_pistoldeath_upgrade" );
    wait ( 0.1 );
	level.spawnlogic = [];
	level.boxicon = 0;
	level.box = 0;
	level.boxposition = 0;
	level.doCustomMap = 0;
	level.doorwait = 2;
	level thread mp\maps\mp_afghan::PrecacheAghan();
	level.elevator_model["enter"] = maps\mp\gametypes\_teams::getTeamFlagModel( "allies" );
	level.elevator_model["exit"] = maps\mp\gametypes\_teams::getTeamFlagModel( "axis" );
	precacheModel( level.elevator_model["enter"] );
	precacheModel( level.elevator_model["exit"] );
	precacheModel( "com_locker_double" );
	precacheModel( "com_teddy_bear" );
	precacheModel( "com_cellphone_on" ); //for music player
	//just doing it again... 
    game["menu_music_player"] = "music_player";	
	
	precacheMenu(game["menu_quickmessage"]);
	precacheMenu(game["menu_quickcommands"]);
	precacheMenu(game["menu_quickstatements"]);
	precacheMenu(game["menu_quickresponses"]);
	
	precacheMenu(game["menu_music_player"]);	
	
	wait 0.001;
	switch(getDvar("mapname"))
	{
		case "mp_afghan":
		/** Afghan **/ 
		switch(randomInt(2))
		{
			case 0:
			level thread Afghan();
			level.edit = 0;
			level thread mp\maps\mp_afghan::WaypointInit();
			break;
			case 1:
			level thread Afghan2();
			level.edit = 1;
			level thread mp\maps\mp_afghan::Afghan2Init();
			break;
		}
		break;
		case "mp_boneyard":
		/** Scrapyard **/ 
		level thread Scrapyard();
		level thread mp\maps\mp_scrapyard::WaypointInit();
		break;
		case "mp_brecourt":
		/** Wasteland **/ 
		level thread Wasteland();
		level thread mp\maps\mp_wasteland1::Init();
		level thread mp\maps\mp_wasteland1::WaypointInit();
		break;
		case "mp_checkpoint":
		/** Karachi **/ 
		level thread Karachi();
		break;
		case "mp_derail":
		/** Derail **/ 
		switch(randomInt(2))
		{
			case 0:
			level thread Derail();
			level.edit = 0;
			level thread mp\maps\mp_derail::WaypointInit();
			break;
			case 1:
			level thread Derail2();
			level.edit = 1;
			break;
		}
		break;
		case "mp_estate":
		/** Estate **/ 
		level thread Estate();
		level.power = 1;
		break;
		case "mp_favela":
		/** Favela **/ 
		switch(randomInt(3))
		{
			case 0:
			level thread Favela();
			level.edit = 0;
			break;
			case 1:
			level thread Favela2();
			level.edit = 1;
			break;
			case 2:
			level thread Favela3();
			level.edit = 2;
			break;
		}
		break;
		case "mp_highrise":
		/** HighRise **/ 
		switch(randomInt(2))
		{
			case 0: //High Hilton
			level thread HighRise();
			level.edit = 0;
			level thread mp\maps\mp_highrise::WaypointInit();
			break;
			case 1: //Infestation
			level thread HighRise2();
			level thread mp\maps\mp_highrise2::Init();
			level.edit = 1;
			break;
		}
		break;
		case "mp_nightshift":
		/** Skidrow **/
		switch(randomInt(3))
		{
			case 0:
			level thread Skidrow();
			level thread mp\maps\mp_skidrow::WaypointInit();
			level.edit = 0;
			break;
			case 1:
			level thread Skidrow2();
			level thread mp\maps\mp_skidrow2::Init();
			level thread mp\maps\mp_skidrow2::WaypointInit();
			level.edit = 1;
			break;
			case 2:
			level thread Skidrow3();
			level.edit = 2;
			break;
		}
		break;
		case "mp_invasion":
		/** Invasion **/ 
		level thread Invasion();
		level thread mp\maps\mp_invasion::Init();
		level thread mp\maps\mp_invasion::WaypointInit();
		break;
		case "mp_quarry":
		/** Quarry **/ 
		level thread Quarry();
		level thread mp\maps\mp_quarry::Init();
		level thread mp\maps\mp_quarry::WaypointInit();
		break;
		case "mp_rundown":
		/** Rundown **/ 
		level thread Rundown();
		level thread mp\maps\mp_rundown::Init();
		level thread mp\maps\mp_rundown::WaypointInit();
		break;
		case "mp_rust":
		/** Rust **/ 
		level thread Rust();
		level thread mp\maps\mp_rust::Init();
		level thread mp\maps\mp_rust::WaypointInit();
		break;
		case "mp_subbase":
		/** SubBase **/ 
		level thread SubBase();
		level thread mp\maps\mp_subbase::Init();
		level.power = 1;
		break;
		case "mp_terminal":
		/** Terminal **/ 
		level thread Terminal();
		level thread mp\maps\mp_terminal1::Init();
		level thread mp\maps\mp_terminal1::WaypointInit();
		break;
		case "mp_underpass":
		/** Underpass **/ 
		level thread Underpass();
		level thread mp\maps\mp_underpass::WaypointInit();
		break;
		case "mp_overgrown":
		/** Overgrown **/ 
		level thread Overgrown();
		level.power = 1;
		break;
		case "mp_trailerpark":
		/** TrailerPark **/ 
		level thread Trailerpark();
		level thread mp\maps\mp_trailerpark::WaypointInit();
		break;
		case "mp_compact":
		/** Salvage **/ 
		level thread Salvage();
		level thread mp\maps\mp_salvage::Init();
		level thread mp\maps\mp_salvage::WaypointInit();
		break;
		case "mp_strike":
		/** Strike **/ 
		level thread Strike();
		break;
		case "mp_complex":
		/** Bailout **/
		level thread Bailout();
		level thread mp\maps\mp_bailout::Init();
		level thread mp\maps\mp_bailout::WaypointInit();
		break;
		case "mp_abandon":
		/** Carnival **/
		level thread Carnival();
		level thread mp\maps\mp_carnival::WaypointInit();
		break;
		case "mp_vacant":
		/** Vacant **/
		level thread Vacant();
		level thread mp\maps\mp_vacant::WaypointInit();
		break;
		case "mp_storm":
		/** Storm **/
		level thread Storm();
		level thread mp\maps\mp_storm::WaypointInit();
		break;
		case "mp_fuel2":
		/** Fuel **/
		level thread Fuel();
		level.power = 1;
		break;
		case "mp_crash":
		/** Crash **/
		level thread Crash();
		level thread mp\maps\mp_crash::WaypointInit();
		level.power = 1;
		break;
		case "estate":
		/** Safehouse **/
		level thread Safehouse();
		level thread mp\maps\safehouse::Init();
		level thread mp\maps\safehouse::WaypointInit();
		break;
		case "co_hunted":
		/** Village **/
		level thread Village();
		break;
		case "arcadia":
		/** Arcadia **/
		level thread arcadia();
		break;
		case "contingency":
		/** Contingency **/
		level thread mp\maps\contingency::Init();
		level thread mp\maps\contingency::WaypointInit();
		level thread Contingency();
		break;
		case "oilrig":
		/** Oilrig **/
		level thread Oilrig();
		break;
		case "mp_nuked":
		/** Nuketown **/
		level thread Nuketown();
		level thread mp\maps\mp_nuked::Init();
		level thread mp\maps\mp_nuked::WaypointInit();
		break;
		case "invasion":
		/** BurgerTown **/
		level thread BurgerTown();
		level thread mp\maps\invasion::Init();
		level thread mp\maps\invasion::WaypointInit();
		break;
		case "af_caves":
		/** Caves **/
		level thread Caves();
		level thread mp\maps\af_caves::Init();
		break;
		case "favela":
		switch(randomInt(2))
		{
			/** Favela Shanties **/
			case 0:
			level thread Shanties();
			level thread mp\maps\shanties::Init();
			level thread mp\maps\shanties::WaypointInit();
			level.edit = 0;
			break;
			/** Favela Shanties Hotel **/
			case 1:
			level thread Shanties_Hotel();
			level thread mp\maps\shanties_hotel::Init();
			level thread mp\maps\shanties_hotel::WaypointInit();
			level.edit = 1;
			break;
		}
		case "mp_cross_fire":
		/** Crossfire **/
		level thread Crossfire();
		break;
		case "mp_bloc":
		/** Bloc **/
		level thread Bloc();
		break;
		case "mp_cargoship":
		/** Wet Work **/
		level thread WetWork();
	}
}

RandomWeapon(pos, angle)
{
	level.block = spawn("script_model", pos);
	level.randomweaponbox = level.block;
	level.block setModel("com_plasticcase_friendly");
	level.block.angles = angle;
	level.block Solid();
	level.block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	level.block.headIcon = newHudElem();
	level.block.headIcon.x = level.block.origin[0];
	level.block.headIcon.y = level.block.origin[1];
	level.block.headIcon.z = level.block.origin[2] + 60;
	level.block.headIcon.alpha = 0.85;
	level.block.headIcon setShader( "weapon_m16a4", 10,30 );
	level.block.headIcon setWaypoint( true, true, false );
	level.random_org = pos;
	level.random_ang = angle;
	level.block thread RandomWeaponThink(pos, angle);
	if(level.boxicon == 0)
	{
		curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();	
		objective_add( curObjID, "invisible", (0,0,0) );
		objective_position( curObjID, level.block.origin );
		objective_state( curObjID, "active" );
		objective_team( curObjID, "allies" );
		objective_icon( curObjID, "weapon_m16a4" );
		level thread RandomWeaponUpdateIconPosition(curObjID);
		level.boxicon = 1;
	}
	level.trigger = spawn( "trigger_radius", pos, 0, 50, 85 );
	level.trigger.angles = angle;
	wait 0.01;
	level.trigger thread RandomWeaponThink(pos, angle);
	level.block thread RandomBoxDeleteOnWeaponNoTake();
	level.block thread BoxDestroy();
}

RandomWeaponUpdateIconPosition(curObjID)
{
	while(1)
	{
		objective_position( curObjID, level.randomweaponbox.origin );
		wait 0.05;
	}
}

BoxDestroy()
{
	while(1)
    {
        level waittill ("box_delete");
        {
		    self delete();
			self.headIcon destroy();
			self.trigger delete();
			level.wep delete();
        }
	    wait 0.1;
	}
}

RandomWeaponThink(pos, angle)
{
	self endon("disconnect");
	self endon("box");
	level endon("endrandom");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 for a Random Weapon [^2$^3950^7]" );
		}
		if(Distance(pos, Player.origin) > 50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.money >= 950 && player.pers["team"] == "allies" && player useButtonPressed() && player.notusebox == 1)
		{
			player ClearLowerMessage("activate", 1);
			player iPrintlnbold("^1You may not use the box at this time!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money >= 950 && player.pers["team"] == "allies" && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player.money -= 950;
			player notify("MONEY");
			player thread maps\mp\gametypes\_rank::scorePopup( -950, 0, (1,0,0), 1 );
			player thread AImod\_Mod::TextPopup( "Random Weapon!" );
			if(getDvarInt("z_dedicated") == 0)	
				self playSound("mp_bonus_start");
			level.box += 1;
			level.wep = spawn("script_model", pos+(0,5,0));
			level.wep.angles = angle;
			level.wep MoveTo(level.wep.origin+(0,0,40), 3);
			level thread RandomWeaponFast();
			wait 2;
			level notify("box_fast");
			wait 0.12;
			level thread RandomWeaponMedium();
			wait 1;
			level notify("box_medium");
			wait 0.2;
			level thread RandomWeaponSlow();
			wait 0.3;
			level notify("box_slow");
			wait 0.5;
			player thread giveWeaponFunc(pos);			
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money <= 950 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1Not enough money for a Random Weapon Need ^2$^3950!");
			wait 1;
		}
		wait 0.01;
	}
}

RandomWeaponFast()
{
	level endon("box_fast");
	while(1)
	{
		level.boxWeapon = level.weapons[RandomInt( 65535 ) % level.weapons.size];
		level.wep setModel(GetWeaponModel(level.boxWeapon, 0));
		level.wep thread HideGunParts(level.boxWeapon);
		wait 0.12;
	}
}

RandomWeaponMedium()
{
	level endon("box_medium");
	while(1)
	{
		level.boxWeapon = level.weapons[RandomInt( 65535 ) % level.weapons.size];
		if(level.boxWeapon == "pp2000_eotech_mp")
			level.wep setModel(GetWeaponModel(level.boxWeapon, 6));
		else if(level.boxWeapon == "tmp_silencer_mp")
			level.wep setModel(GetWeaponModel(level.boxWeapon, 8));
		else
			level.wep setModel(GetWeaponModel(level.boxWeapon, 0));
		level.wep thread HideGunParts(level.boxWeapon);
		wait 0.2;
	}
}

RandomWeaponSlow()
{
	level endon("box_slow");
	while(1)
	{
		level.boxWeapon = level.weapons[RandomInt( 65535 ) % level.weapons.size];
		if(level.boxWeapon == "pp2000_eotech_mp")
			level.wep setModel(GetWeaponModel(level.boxWeapon, 6));
		else if(level.boxWeapon == "tmp_silencer_mp")
			level.wep setModel(GetWeaponModel(level.boxWeapon, 8));
		else
			level.wep setModel(GetWeaponModel(level.boxWeapon, 0));
		level.wep thread HideGunParts(level.boxWeapon);
		wait 0.3;
	}
}

RandomWeaponSlowest()
{
	level endon("box_slowest");
	while(1)
	{
		level.boxWeapon = level.weapons[RandomInt( level.weapons.size )];
		if(level.boxWeapon == "pp2000_eotech_mp")
			level.wep setModel(GetWeaponModel(level.boxWeapon, 6));
		else if(level.boxWeapon == "tmp_silencer_mp")
			level.wep setModel(GetWeaponModel(level.boxWeapon, 8));
		else
			level.wep setModel(GetWeaponModel(level.boxWeapon, 0));
		level.wep thread HideGunParts(level.boxWeapon);
		wait 0.5;
	}
}

giveWeaponFunc(pos)
{
	level endon("disconnect");
	level endon("box");
	level notify("endrandom");
	level.boxWeapon = level.weapons[RandomInt( level.weapons.size )];
	if(level.boxWeapon == "pp2000_eotech_mp")
		level.wep setModel(GetWeaponModel(level.boxWeapon, 6));
	else if(level.boxWeapon == "tmp_silencer_mp")
		level.wep setModel(GetWeaponModel(level.boxWeapon, 8));
	else
		level.wep setModel(GetWeaponModel(level.boxWeapon, 0));
	level.wep thread HideGunParts(level.boxWeapon);
	while(1)
	{
		if(Distance(pos, self.origin) <= 75 && self.notusebox == 0)
		{
			self setLowerMessage("trade", "Hold ^3[{+activate}]^7 to Trade Weapons" );
		}
		else if(Distance(pos, self.origin) <= 75 && self.notusebox == 1)
		{
			self setLowerMessage("trade", "^1Glitcher get out of here");
		}
		else
		{
			if(Distance(pos, self.origin) >50) self ClearLowerMessage("trade", 1);
		}
		if(Distance(pos, self.origin) <= 75 && self getAllWeapons(level.boxWeapon) == false && self.weapons == 0 && self useButtonPressed() && self.notusebox == 0)
		{
			self ClearLowerMessage("trade", 1);
			self notify("newWeapon");
			wait 0.1;
			if(level.boxWeapon == "pp2000_eotech_mp")
				self _giveWeapon(level.boxWeapon, 6);
			else if(level.boxWeapon == "tmp_silencer_mp")
				self _giveWeapon(level.boxWeapon, 8);
			else
				self _giveWeapon(level.boxWeapon, 0);
			self switchToWeapon(level.boxWeapon);
			self giveMaxAmmo(level.boxWeapon);
			self.weapons = 1;
			wait 0.01;
			level notify("stopspawner");
			level.wep delete();
			level thread RandomBoxDeleteOnWeaponTake();
			level notify("box");
		}
		else if(Distance(pos, self.origin) <= 75 && self getAllWeapons(level.boxWeapon) == true && self.weapons == 0 && self useButtonPressed() && self.notusebox == 0)
		{
			self ClearLowerMessage("trade", 1);
			self notify("newWeapon");
			self switchToWeapon(level.boxWeapon);
			self giveMaxAmmo(level.boxWeapon);
			wait 0.01;
			level notify("stopspawner");
			level.wep delete();
			level thread RandomBoxDeleteOnWeaponTake();
			level notify("box");
		}
		if(Distance(pos, self.origin) <= 75 && self getAllWeapons(level.boxweapon) == false && self.weapons == 1 && self useButtonPressed() && self.notusebox == 0)
		{
			self ClearLowerMessage("trade", 1);
			self notify("newWeapon");
			self takeWeapon(self getCurrentWeapon());
			wait 0.1;
			if(level.boxWeapon == "pp2000_eotech_mp")
				self _giveWeapon(level.boxWeapon, 6);
			else if(level.boxWeapon == "tmp_silencer_mp")
				self _giveWeapon(level.boxWeapon, 8);
			else
				self _giveWeapon(level.boxWeapon, 0);
			self switchToWeapon(level.boxWeapon);
			self giveMaxAmmo(level.boxWeapon);
			wait 0.01;
			level notify("stopspawner");
			level.wep delete();
			level thread RandomBoxDeleteOnWeaponTake();
			level notify("box");
		}
		else if(Distance(pos, self.origin) <= 75 && self getAllWeapons(level.boxweapon) == true && self.weapons == 1 && self useButtonPressed() && self.notusebox == 0)
		{
			self ClearLowerMessage("trade", 1);
			self notify("newWeapon");
			self switchToWeapon(level.boxWeapon);
			self giveMaxAmmo(level.boxWeapon);
			wait 0.01;
			level notify("stopspawner");
			level.wep delete();
			level thread RandomBoxDeleteOnWeaponTake();
			level notify("box");
		}
		else if(Distance(pos, self.origin) <= 75 && self useButtonPressed() && self.notusebox == 0)
		{
			self iPrintlnbold("trade", "^1Trying to glitch eh get out of here FU");
		}
		wait 0.01;
	}
}

Upgrade(pos, angle, gunspawn)
{
	block = spawn("script_model", pos + (0, 0, -15) );
	block setModel("com_plasticcase_beige_big");
	block.angles = angle;
	block Solid();
	block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	block2 = spawn("script_model", pos + (0,0,30));
	block2 setModel("com_plasticcase_friendly");
	block2.angles = angle;
	block2 Solid();
	block2 hide();
	block2 CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	/*block.headIcon = newHudElem();
	block.headIcon.x = block.origin[0];
	block.headIcon.y = block.origin[1];
	block.headIcon.z = block.origin[2] + 50;
	block.headIcon.alpha = 0.85;
	block.headIcon setShader( "cardicon_juggernaut_1", 10,10 );
	block.headIcon setWaypoint( true, true, false );*/
	block thread BoxShader("cardicon_juggernaut_1");
	curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();	
	objective_add( curObjID, "invisible", (0,0,0) );
	objective_position( curObjID, block.origin );
	objective_state( curObjID, "active" );
	objective_team( curObjID, "allies" );
	objective_icon( curObjID, "cardicon_juggernaut_1" );
	trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
	trigger.angles = angle;
	trigger thread UpgradeThink(pos, angle, gunspawn);
	wait 0.01;
}

UpgradeThink(pos, angle, gunspawn)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75 && level.power == 0)
		{
			Player setLowerMessage("activate", "Power needs to be activated" );
		}
		else if(Distance(pos, Player.origin) <= 75)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 to Upgrade your ^1Current Weapon^7 [^2$^45000^7]" );
		}
		if(Distance(pos, Player.origin) >=50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.pers["team"] == "allies" && level.power == 0 && player useButtonPressed())
		{
			player iPrintln("^1Power needs to be activated!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player getCurrentWeapon() == level.weapons && player.money <= 5000 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("You do not have enough money for Weapon Upgrade Need $5000!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player getCurrentWeapon() == level.weapons && player.money >= 5000 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player.money -= 5000;
			player notify("MONEY");
			player thread maps\mp\gametypes\_rank::scorePopup( -5000, 0, (1,0,0), 1 );
			player thread AImod\_Mod::TextPopup("Weapon Upgraded!");
			player.gun = player getCurrentWeapon();
			player.gunup = player.gun;
			level.upgradeweapon = spawn("script_model", player.origin+(0,0,50));
			if(player.gunup == "pp2000_eotech_mp")
				level.upgradeweapon setModel(GetWeaponModel(player.gunup, 6));
			else if(player.gunup == "tmp_silencer_mp")
				level.upgradeweapon setModel(GetWeaponModel(player.gunup, 8));
			else
				level.upgradeweapon setModel(GetWeaponModel(player.gunup, 0));
			level.upgradeweapon.angles = angle;
			level.upgradeweapon thread HideGunParts(player.gunup);
			player takeWeapon(player getCurrentWeapon());
			player switchtoRandomWeapon();
			wait 0.4;
			player playSound( maps\mp\gametypes\_teams::getTeamVoicePrefix( player.team )+"mp_rsp_comeon" );
			level.upgradeweapon MoveTo(pos+(0,0,10), 2);
			wait 2;
			level.upgradeweapon delete();
			player maps\mp\gametypes\Upgrade::giveUpgradedWeapon(pos, angle, player.gunup);
			wait 1;
			player ClearLowerMessage("upgradetrade", 1);
		}
		wait 0.01;
	}
}

Ammo(pos, angle)
{
	block = spawn("script_model", pos );
	block setModel("com_plasticcase_friendly");
	block.angles = angle;
	block Solid();
	block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	laptop = spawn("script_model", pos+(0,0,17) );
	laptop setModel("com_laptop_2_open");
	laptop.angles = angle;
	laptop Solid();
	laptop thread rotateLaptop();
	/*block.headIcon = newHudElem();
	block.headIcon.x = block.origin[0];
	block.headIcon.y = block.origin[1];
	block.headIcon.z = block.origin[2] + 50;
	block.headIcon.alpha = 0.85;
	block.headIcon setShader( "waypoint_ammo_friendly", 10,10 );
	block.headIcon setWaypoint( true, true, false );*/
	block thread BoxShader("waypoint_ammo_friendly");
	curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();	
	objective_add( curObjID, "invisible", (0,0,0) );
	objective_position( curObjID, block.origin );
	objective_state( curObjID, "active" );
	objective_team( curObjID, "allies" );
	objective_icon( curObjID, "waypoint_ammo_friendly" );
	trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
	trigger.angles = angle;
	trigger thread AmmoThink(pos);
	wait 0.01;
}

AmmoThink(pos, angle)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 for Ammo[^2$^34500^7]" );
		}
		if(Distance(pos, Player.origin) > 50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.money >= 4500 && player.pers["team"] == "allies" && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player.money -= 4500;
			player notify("MONEY");
			player thread maps\mp\gametypes\_rank::scorePopup( -4500, 0, (1,0,0), 1 );
			player thread AImod\_Mod::TextPopup( "Ammo!" );
			weaponList = player GetWeaponsListAll();
			foreach ( weaponName in weaponList )
			{
				if(weaponName == "beretta_akimbo_xmags_mp")
				{
					continue;
				}	
				player giveMaxAmmo( weaponName );
				player setweaponammoclip("frag_grenade_mp", 4); //we'll set it to 2.
			}		
			level notify("boxend");
			player playLocalSound( "ammo_crate_use" );
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money <= 4500 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1Not enough money for Ammo Need $4500!");
			wait 1;
		}
		wait 0.01;
	}
}

KillstreakBox(pos, angle)
{
	block = spawn("script_model", pos );
	block setModel("com_plasticcase_friendly");
	block.angles = angle;
	block Solid();
	block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	laptop = spawn("script_model", pos+(0,0,17) );
	laptop setModel("com_laptop_2_open");
	laptop.angles = angle;
	laptop Solid();
	laptop thread rotateLaptop();
	/*block.headIcon = newHudElem();
	block.headIcon.x = block.origin[0];
	block.headIcon.y = block.origin[1];
	block.headIcon.z = block.origin[2] + 50;
	block.headIcon.alpha = 0.85;
	block.headIcon setShader( "cardicon_harrier", 10,10 );
	block.headIcon setWaypoint( true, true, false );*/
	block thread BoxShader("cardicon_harrier");
	curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();	
	objective_add( curObjID, "invisible", (0,0,0) );
	objective_position( curObjID, block.origin );
	objective_state( curObjID, "active" );
	objective_team( curObjID, "allies" );
	objective_icon( curObjID, "cardicon_harrier" );
	trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
	trigger.angles = angle;
	trigger thread KillstreakBoxThink(pos);
	wait 0.01;
}

KillstreakBoxThink(pos, angle)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 for a Random Killstreak[^5Need 200 Bonus Points^7]" );
		}
		if(Distance(pos, Player.origin) > 50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.bonus >= 200 && player.pers["team"] == "allies" && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player.bonus -= 200;
			player notify("BONUS");
			player thread KillStreakRandom();
			player thread maps\mp\gametypes\_rank::scorePopup( -200, 0, (1,0,0), 1 );	
			level notify("boxend");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.bonus <= 200 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1Not enough bonus points for a random killstreak! Need ^2200^1 Bonus Points!");
			wait 1;
		}
		wait 0.01;
	}
}

KillStreakRandom()
{
	self endon("disconnect");
	switch(randomInt(4))
	{
		case 0: Announcement(self.name + " Bought ^3Predator Missile!");
		self maps\mp\killstreaks\_killstreaks::giveKillstreak( "predator_missile", true );
		self maps\mp\gametypes\_hud_message::killstreakSplashNotify( "predator_missile_pickup");
		break;
		case 1: Announcement(self.name + " Bought an ^3Airstrike");
		self maps\mp\killstreaks\_killstreaks::giveKillstreak( "uav", true );
		wait 3.0;
		self maps\mp\gametypes\_hud_message::killstreakSplashNotify( "airstrike");
		break;
		case 2: 
		Announcement(self.name + " Bought a Super Airstrike");
		self maps\mp\killstreaks\_killstreaks::giveKillstreak( "counter_uav", true );
		wait 3.0;
		self maps\mp\gametypes\_hud_message::killstreakSplashNotify( "ac130");
		break;
		case 3: 
		Announcement(self.name + " Bought a Sentry Gun");
		self maps\mp\killstreaks\_killstreaks::giveKillstreak( "sentry", true );
		wait 3.0;
		self maps\mp\gametypes\_hud_message::killstreakSplashNotify( "sentry");
		break;
	}
}

Gambler(pos, angle)
{
	block = spawn("script_model", pos );
	block setModel("com_plasticcase_friendly");
	block.angles = angle;
	block Solid();
	laptop = spawn("script_model", pos+(0,0,17) );
	laptop setModel("com_laptop_2_open");
	laptop.angles = angle;
	laptop Solid();
	laptop thread rotateLaptop();
	/*block.headIcon = newHudElem();
	block.headIcon.x = block.origin[0];
	block.headIcon.y = block.origin[1];
	block.headIcon.z = block.origin[2] + 50;
	block.headIcon.alpha = 0.85;
	block.headIcon setShader( "cardicon_8ball", 10,10 );
	block.headIcon setWaypoint( true, true, false );*/
	block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	block thread BoxShader("cardicon_8ball");
	curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();	
	objective_add( curObjID, "invisible", (0,0,0) );
	objective_position( curObjID, block.origin );
	objective_state( curObjID, "active" );
	objective_team( curObjID, "allies" );
	objective_icon( curObjID, "cardicon_8ball" );
    trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
    trigger.angles = angle;
	trigger thread GamblerThink(pos, angle, laptop);
    wait 0.01;
}

rotateLaptop()
{
	for(;;)
	{
		self rotateyaw(-360,7);
		wait 7;
	}
}

GamblerThink(pos, angle, laptop)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 for Gambler [^2$^31000^7]" );
		}
		if(Distance(pos, Player.origin) >= 50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.money >= 1000 && player.gambler == 0 && player.pers["team"] == "allies" && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player.money -= 1000;
			player notify("MONEY");
			player thread maps\mp\gametypes\_rank::scorePopup( -1000, 0, (1,0,0), 1 );
			player thread AImod\_Mod::TextPopup( "Gambler!" );
			player.gambler = 1;
			laptop MoveTo(laptop.origin+(0,0,30), 2);
			player iPrintlnBold(" ^2Your results will show in 10 seconds");
			wait 1.0;
			player iPrintlnBold(" ^29");
			wait 1.0;
			player iPrintlnBold(" ^28");
			wait 1.0;
			player iPrintlnBold(" ^27");
			wait 1.0;
			player iPrintlnBold(" ^26");
			wait 1.0;
			player iPrintlnBold(" ^25");
			wait 1.0;
			player iPrintlnBold(" ^24");
			wait 1.0;
			player iPrintlnBold(" ^23");
			wait 1.0;
			laptop MoveTo(laptop.origin-(0,0,30), 2);
			player iPrintlnBold(" ^22");
			wait 1.0;
			player iPrintlnBold(" ^21");
			wait 1.0;
			player thread MoneyGambler();
			level notify("boxend");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money <= 1000 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1Not enough money for Gambler Need $1000!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money >= 1000 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1You may only use the gambler once per round!");
			wait 1;
		}
		wait 0.01;
	}
}

SpawnBox(pos, angle, model, type, icon, perk, cost, variable, text, textpopup)
{
	level.block = spawn("script_model", pos+(0,0,10) );
	level.block setModel(model);
	level.block.angles = angle;
	level.block notSolid();
	level.block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	level.block.trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
	level.block.trigger.angles = angle;
	level.block thread SpawnBoxInitThink(pos, angle, type, icon, perk, cost, variable, text, textpopup);
	wait 0.01;
}

SpawnBoxInitThink(pos, angle, type, icon, perk, cost, variable, text, textpopup)
{
	switch(type)
	{
		case "Perk":
		self thread SpawnBoxPerkThink(pos, angle, type, icon, perk, cost, variable, text, textpopup);
		break;
	}
}

SpawnBoxPerkThink(pos, angle, type, icon, perk, cost, variable, text, textpopup)
{
	self endon("disconnect");
	while(1)
	{
		self.trigger waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75 && level.power == 0)
		{
			Player setLowerMessage("activate", "Power needs to be activated" );
		}
		if(Distance(pos, Player.origin) <= 75 && level.power == 1)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 to buy " + text + " [^2$^3"+cost+"^7]" );
		}
		if(Distance(pos, Player.origin) >50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.pers["team"] == "allies" && level.power == 0 && player useButtonPressed())
		{
			player iPrintln("^1Power needs to be activated!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money >= 0 && variable == 1 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1You have already bought " + text + "!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money >= cost && player.pers["team"] == "allies" && level.power == 1 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player.money -= cost;
			player notify("MONEY");
			player _setPerk(perk);
			variable = 1;
			player.zombieperks += 1;
			wait 0.1;
			player thread PerkHud(icon, (0.3,0.9,0.3), textpopup);
			level notify("boxend");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money <= cost && level.power == 1 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1Not enough money for " + text + " Need $"+cost+"!");
			wait 1;
		}
		wait 0.01;
	}
}

MusicPlayerBox(pos, angle)
{
	block = spawn("script_model", pos );
	block setModel("com_plasticcase_enemy");
	block.angles = angle;
	block Solid();
	block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	item = spawn("script_model", pos+(0,0,20) );
	item setModel("com_cellphone_on");
	item.angles = angle;
	item Solid();
	level.radiobox = item;
	block thread BoxShader("cardicon_harrier");
	curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();	
	objective_add( curObjID, "invisible", (0,0,0) );
	objective_position( curObjID, block.origin );
	objective_state( curObjID, "active" );
	objective_team( curObjID, "allies" );
	objective_icon( curObjID, "cardicon_harrier" );
	trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
	trigger.angles = angle;
	trigger thread MusicPlayerBoxThink(pos);
	wait 0.01;
}

MusicPlayerBoxThink(pos, angle)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
			if( level.in_music == 0 )
				Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 for Music Player." );
			else
				Player setLowerMessage("activate", "^1Music is already playing!" );
		}
		if(Distance(pos, Player.origin) > 50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		else if(Distance(pos, Player.origin) <= 75 && player.pers["team"] == "allies" && player useButtonPressed() && level.in_music == 0)
		{
			player ClearLowerMessage("activate", 1);
			player openpopupMenu(game["menu_music_player"]);
			level.curr_song = player MusicResponse();
			
			if( isDefined( level.curr_song ) )
			{
				thread MusicPlayerPlaySong();
			}
			level notify("boxend");
			wait 1;
		}
		wait 0.01;
	}
}

MusicPlayerPlaySong()
{
	level.in_music = 1;

	MusicPlay( level.curr_song.song, true );
	wait level.curr_song.length;
	MusicStop(1);
	level.in_music = 0;

	level.curr_song = undefined;
	level notify("musicplayer_finished");
}


MusicResponse()
{
	self endon("disconnect");
	
	self waittill( "menuresponse", menu, response );
	
	if( menu != game["menu_music_player"] )
		return self MusicResponse();
		
	self closepopupMenu();
	self closeInGameMenu();
		
	if( response == "close" )
		return undefined;
	
	if( !isDefined( level.music[ response ] ) )
		return undefined;
			
	return level.music[ response ];
}

SpeedReload(pos, angle)
{
	block = spawn("script_model", pos+(0,0,50) );
	block setModel("com_plasticcase_friendly");
	block.angles = angle;
	block Solid();
	block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	block moveto(pos,3);
	curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();	
	objective_add( curObjID, "invisible", (0,0,0) );
	objective_position( curObjID, block.origin );
	objective_state( curObjID, "active" );
	objective_team( curObjID, "allies" );
	objective_icon( curObjID, "specialty_fastreload_upgrade" );
    trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
    trigger.angles = angle;
	trigger thread SpeedReloadThink(pos);
    wait 0.01;
}

SpeedReloadThink(pos, angle)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75 && level.power == 0)
		{
			Player setLowerMessage("activate", "Power needs to be activated" );
		}
		if(Distance(pos, Player.origin) <= 75 && level.power == 1)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 for Speed Cola [^2$^33000^7]" );
		}
		if(Distance(pos, Player.origin) >50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.pers["team"] == "allies" && level.power == 0 && player useButtonPressed())
		{
			player iPrintln("^1Power needs to be activated!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money >= 0 && player.speedreload == 1 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1You have already bought Speed Cola!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money >= 3000 && player.pers["team"] == "allies" && level.power == 1 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player.money -= 3000;
			player notify("MONEY");
			player thread maps\mp\gametypes\_rank::scorePopup( -3000, 0, (0,1,0), 1 );
			player thread AImod\_Mod::TextPopup( "Speed Reload!" );
			player _setPerk("specialty_fastreload");
			player _setPerk("specialty_quickdraw");
			player.speedreload = 1;
			player.zombieperks += 1;
			wait 0.1;
			player thread PerkHud( "specialty_fastreload_upgrade", (0.3,0.9,0.3), "Reload Lightning Fast");
			level notify("boxend");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money <= 3000 && level.power == 1 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1Not enough money for Speed Cola Need $3000!");
			wait 1;
		}
		wait 0.01;
	}
}

DoubleTap(pos, angle)
{
	block = spawn("script_model", pos+(0,0,50) );
	block setModel("com_plasticcase_friendly");
	block.angles = angle;
	block Solid();
	block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	block moveto(pos,3);
	curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();	
	objective_add( curObjID, "invisible", (0,0,0) );
	objective_position( curObjID, block.origin );
	objective_state( curObjID, "active" );
	objective_team( curObjID, "allies" );
	objective_icon( curObjID, "cardicon_doubletap" );
    trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
    trigger.angles = angle;
	trigger thread DoubleTapThink(pos);
    wait 0.01;
}

DoubleTapThink(pos, angle)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75 && level.power == 0)
		{
			Player setLowerMessage("activate", "Power needs to be activated" );
		}
		else if(Distance(pos, Player.origin) <= 75)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 for Double Tap 2.0 [^2$^32000^7]" );
		}
		if(Distance(pos, Player.origin) >50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.pers["team"] == "allies" && level.power == 0 && player useButtonPressed())
		{
			player iPrintln("^1Power needs to be activated!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money <= 2000 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1Not enough money for Double Tap 2.0 Need $2000!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money >= 2000 && player.stoppingpower == 1 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1You have already bought Double Tap 2.0!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money >= 2000 && player.pers["team"] == "allies" && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player.money -= 2000;
			player notify("MONEY");
			player thread maps\mp\gametypes\_rank::scorePopup( -2000, 0, (1,0,0), 1 );
			player thread AImod\_Mod::TextPopup( "Double Tap!" );
			player.stoppingpower = 1;
			player.zombieperks += 1;
			wait 0.1;
			player thread PerkHud( "cardicon_doubletap", (0.9,0.5,0.2), "Doubles the Damage of all Guns" );
			level notify("boxend");
			wait 1;
		}
		wait 0.01;
	}
}

LastStandPro(pos, angle)
{
	block = spawn("script_model", pos+(0,0,50) );
	block setModel("com_plasticcase_friendly");
	block.angles = angle;
	block Solid();
	block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	block moveto(pos,3);
	curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();	
	objective_add( curObjID, "invisible", (0,0,0) );
	objective_position( curObjID, block.origin );
	objective_state( curObjID, "active" );
	objective_team( curObjID, "allies" );
	objective_icon( curObjID, "specialty_pistoldeath_upgrade" );
	trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
	trigger.angles = angle;
	trigger thread LastStandProThink(pos);
	wait 0.01;
}

LastStandProThink(pos, angle)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75 && level.power == 0)
		{
			Player setLowerMessage("activate", "Power needs to be activated" );
		}
		else if(Distance(pos, Player.origin) <= 75)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 for Quick Revive Pro [^2$^32500^7]" );
		}
		if(Distance(pos, Player.origin) >50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.pers["team"] == "allies" && level.power == 0 && player useButtonPressed())
		{
			player iPrintln("^1Power needs to be activated!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money >= 2500 && player.autorevive == 1 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1You have already bought Quick Revive Pro!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money >= 2500 && player.autorevive >= 0 && player.standpro >= 3 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1You have already bought Quick Revive Pro 3 Times!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money >= 2500 && player.pers["team"] == "allies" && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player.money -= 2500;
			player notify("MONEY");
			player thread maps\mp\gametypes\_rank::scorePopup( -2500, 0, (1,0,0), 1 );
			player thread AImod\_Mod::TextPopup( "Quick Revive Pro!" );
			player.autorevive += 1;
			player.standpro += 1;
			wait 0.1;
			player thread PerkLastStandPro("specialty_pistoldeath_upgrade", (0,1,1), "Quick Revive Pro");
			level notify("boxend");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money <= 2500 && player useButtonPressed())
		{
			player iPrintln("^1Not enough money for Last Stand Pro Need $2500!");
			wait 1;
		}
		wait 0.01;
	}
}

Speedy(pos, angle)
{
	block = spawn("script_model", pos+(0,0,50) );
	block setModel("com_plasticcase_friendly");
	block.angles = angle;
	block Solid();
	block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	block moveto(pos,3);
	curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();	
	objective_add( curObjID, "invisible", (0,0,0) );
	objective_position( curObjID, block.origin );
	objective_state( curObjID, "active" );
	objective_team( curObjID, "allies" );
	objective_icon( curObjID, "specialty_lightweight_upgrade" );
    trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
    trigger.angles = angle;
	trigger thread SpeedyThink(pos);
    wait 0.01;
}

SpeedyThink(pos, angle)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75 && level.power == 0)
		{
			Player setLowerMessage("activate", "Power needs to be activated" );
		}
		else if(Distance(pos, Player.origin) <= 75 && level.power == 1)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 for Stamin-Up [^2$^32500^7]" );
		}
		if(Distance(pos, Player.origin) >50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.pers["team"] == "allies" && level.power == 0 && player useButtonPressed())
		{
			player iPrintln("^1Power needs to be activated!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money <= 2500 && player.speedy == 0 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1Not enough money for Stamin-Up Need $2500!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money >= 0 && player.speedy == 1 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1You have already bought Stamin-Up!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money >= 2500 && player.pers["team"] == "allies" && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player.money -= 2500;
			player notify("MONEY");
			player thread maps\mp\gametypes\_rank::scorePopup( -2500, 0, (1,0,0), 1 );
			player thread AImod\_Mod::TextPopup( "Stamin-Up!" );
			player _setPerk("specialty_marathon");
			player _setPerk("specialty_lightweight");
			player _setPerk("specialty_fastsprintrecovery");
			player.speedy = 1;
			player.zombieperks += 1;
			wait 0.1;
			player thread PerkHud( "specialty_lightweight_upgrade", (0.9,0.9,0.3), "Run and Sprint Longer and Faster");
			level notify("boxend");
			wait 1;
		}
		wait 0.01;
	}
}
	
Health(pos, angle)
{
	block = spawn("script_model", pos+(0,0,50) );
	block setModel("com_plasticcase_friendly");
	block.angles = angle;
	block Solid();
	block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	block moveto(pos,3);
	curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();	
	objective_add( curObjID, "invisible", (0,0,0) );
	objective_position( curObjID, block.origin );
	objective_state( curObjID, "active" );
	objective_team( curObjID, "allies" );
	objective_icon( curObjID, "cardicon_juggernaut_2" );
    trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
    trigger.angles = angle;
	trigger thread HealthThink(pos);
    wait 0.01;
}

HealthThink(pos, angle)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75 && level.power == 0)
		{
			Player setLowerMessage("activate", "Power needs to be activated" );
		}
		else if(Distance(pos, Player.origin) <= 75)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 for Juggernog [^2$^32500^7]" );
		}
		if(Distance(pos, Player.origin) >50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.pers["team"] == "allies" && level.power == 0 && player useButtonPressed())
		{
			player iPrintln("^1Power needs to be activated!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money <= 2500 && player.maxhealth <= 100 && player.nobuyhealth == 0 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1Not enough money for Juggernog $2500!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money >= 0 && player useButtonPressed() && player.maxhealth > 100 && player.nobuyhealth == 0)
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1You have already bought Juggernog!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money >= 0 && player useButtonPressed() && player.nobuyhealth == 1)
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1You may not buy Juggernog at this time!");
			wait 1;
		}
		if(Distance(pos, Player.origin) <= 75 && player.money >= 2500 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player.money -= 2500;
			player notify("MONEY");
			player thread maps\mp\gametypes\_rank::scorePopup( -2500, 0, (1,0.3,0.3), 1 );
			player thread AImod\_Mod::TextPopup( "Juggernog!" );
			player.maxhealth += 100;
			player.zombieperks += 1;
			wait 0.1;
			player thread PerkHud( "cardicon_juggernaut_2", (1,0.3,0.3), "200 Health");
			level notify("boxend");
			wait 1;
		}
		wait 0.01;
	}
}

Stalker(pos, angle)
{
	block = spawn("script_model", pos+(0,0,50) );
	block setModel("com_plasticcase_friendly");
	block.angles = angle;
	block Solid();
	block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	block moveto(pos,3);
	curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();	
	objective_add( curObjID, "invisible", (0,0,0) );
	objective_position( curObjID, block.origin );
	objective_state( curObjID, "active" );
	objective_team( curObjID, "allies" );
	objective_icon( curObjID, "cardicon_expert_aug" );
    trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
    trigger.angles = angle;
	trigger thread StalkerThink(pos);
    wait 0.01;
}

StalkerThink(pos, angle)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75 && level.power == 0)
		{
			Player setLowerMessage("activate", "Power needs to be activated" );
		}
		else if(Distance(pos, Player.origin) <= 75 && level.power == 1)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 for Stalker [^2$^32500^7]" );
		}
		if(Distance(pos, Player.origin) >50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.pers["team"] == "allies" && level.power == 0 && player useButtonPressed())
		{
			player iPrintln("^1Power needs to be activated!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money <= 2500 && player.stalker == 0 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1Not enough money for Stalker Need $2500!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money >= 0 && player.stalker == 1 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1You have already bought Stalker!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money >= 2500 && player.pers["team"] == "allies" && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player.money -= 2500;
			player notify("MONEY");
			player thread maps\mp\gametypes\_rank::scorePopup( -2500, 0, (1,0,0), 1 );
			player thread AImod\_Mod::TextPopup( "Stalker!" );
			player thread SetStalker();
			player.stalker = 1;
			player.zombieperks += 1;
			wait 0.1;
			player thread PerkHud( "cardicon_expert_aug", (0.9,0.9,0.3), "Faster moving while ADS.");
			level notify("boxend");
			wait 1;
		}
		wait 0.01;
	}
}
Power3(pos, angle)
{
	level endon("Destroy"); 
	block = spawn("script_model", pos );
	block setModel("com_plasticcase_friendly");
	block.angles = angle;
	block Solid();
	level.power = 0;
	block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	block.headIcon = newHudElem();
	block.headIcon.x = block.origin[0];
	block.headIcon.y = block.origin[1];
	block.headIcon.z = block.origin[2] + 50;
	block.headIcon.alpha = 0.85;
	block.headIcon setShader( "cardicon_bulb", 10,10 );
	block.headIcon setWaypoint( true, true, false );
	block.headIcon thread PowerDestroy();
    trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
    trigger.angles = angle;
	trigger thread Power3Think(pos, angle, block);
	block thread PowerDestroy();
    wait 0.01;
}   

Power3Think(pos, angle, block)
{
	self endon("disconnect");
	level endon("Destroy");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 to activate power [^2$^110000^7]" );
		}
		if(Distance(pos, Player.origin) >50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.money >= 10000 && player.pers["team"] == "allies" && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player.money -= 10000;
			player notify("MONEY");
			block moveTo(block.origin+(0,0,1000), 2.3);
			wait 2.3;
			player thread EmpEffect(block);
			player thread maps\mp\gametypes\_rank::scorePopup( -10000, 0, (1,0,0), 1 );
			level.playername = player.name;
			foreach(player in level.players)
			{
				player playLocalSound("mp_killstreak_pavelow");
			    player thread AImod\_Mod::TextPopup( "Power!" );
				player thread AImod\_Intro::WelcomeText(level.playername, "Activated Power", "", "", "", 1, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (1,0.5,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85, (1,1,1), (0.3,0.9,0.3), 0.85, (1,1,1), (0.3,0.9,0.9), 0.85);
			}
			level.power = 1;
			level notify("power_activated");
			wait 0.5;
			if(getDvarInt("z_dedicated") == 0)
			{
				foreach(player in level.players)
				{
					player playLocalSound( "nuke_explosion" );
					Earthquake( 0.4, 1, player.origin, 100 );
					player setClientDvar("ui_power", 1);
				}
			}
			level notify("Destroy");
		}
		else if(Distance(pos, Player.origin) <= 10000 && player.money <= 750 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1Not enough money for Power Need $10000!");
			wait 1;
		}
		wait 0.01;
	}
}

PowerDestroy()
{
	while(1)
    {
        if(level.power == 1)
        {
		    self delete();
			self.headIcon destroy();
        }
	    wait 0.1;
	}
}

CreateElevator(enter, exit, angle)
{
	flag = spawn( "script_model", enter );
	flag setModel( level.elevator_model["enter"] );
	wait 0.01;
	flag = spawn( "script_model", exit );
	flag setModel( level.elevator_model["exit"] );
	wait 0.01;
	self thread ElevatorThink(enter, exit, angle);
}

CreateBlocks(pos, angle)
{
	block = spawn("script_model", pos );
	block setModel("com_plasticcase_friendly");
	block.angles = angle;
	block Solid();
	block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	wait 0.01;
}

CreateRamps(top, bottom)
{
	D = Distance(top, bottom);
	blocks = roundUp(D/30);
	CX = top[0] - bottom[0];
	CY = top[1] - bottom[1];
	CZ = top[2] - bottom[2];
	XA = CX/blocks;
	YA = CY/blocks;
	ZA = CZ/blocks;
	CXY = Distance((top[0], top[1], 0), (bottom[0], bottom[1], 0));
	Temp = VectorToAngles(top - bottom);
	BA = (Temp[2], Temp[1] + 90, Temp[0]);
	for(b = 0;b < blocks;b++)
	{
		block = spawn("script_model", (bottom + ((XA, YA, ZA) * b)));
		block setModel("com_plasticcase_friendly");
		block.angles = BA;
		block Solid();
		block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
		wait 0.01;
	}
	block = spawn("script_model", (bottom + ((XA, YA, ZA) * blocks) - (0, 0, 5)));
	block setModel("com_plasticcase_friendly");
	block.angles = (BA[0], BA[1], 0);
	block Solid();
	block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	wait 0.001;
}

CreateGrids(corner1, corner2, angle)
{
	W = Distance((corner1[0], 0, 0), (corner2[0], 0, 0));
	L = Distance((0, corner1[1], 0), (0, corner2[1], 0));
	H = Distance((0, 0, corner1[2]), (0, 0, corner2[2]));
	CX = corner2[0] - corner1[0];
	CY = corner2[1] - corner1[1];
	CZ = corner2[2] - corner1[2];
	ROWS = roundUp(W/55);
	COLUMNS = roundUp(L/30);
	HEIGHT = roundUp(H/20);
	XA = CX/ROWS;
	YA = CY/COLUMNS;
	ZA = CZ/HEIGHT;
	center = spawn("script_model", corner1);
	for(r = 0;r <= ROWS;r++)
	{
		for(c = 0;c <= COLUMNS;c++)
		{
			for(h = 0;h <= HEIGHT;h++)
			{
				block = spawn("script_model", (corner1 + (XA * r, YA * c, ZA * h)));
				block setModel("com_plasticcase_friendly");
				block.angles = (0, 0, 0);
				block Solid();
				block LinkTo(center);
				block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
				wait 0.001;
			}
		}
	}
	center.angles = angle;
}

CreateWalls(start, end)
{
	D = Distance((start[0], start[1], 0), (end[0], end[1], 0));
	H = Distance((0, 0, start[2]), (0, 0, end[2]));
	blocks = roundUp(D/55);
	height = roundUp(H/30);
	CX = end[0] - start[0];
	CY = end[1] - start[1];
	CZ = end[2] - start[2];
	XA = (CX/blocks);
	YA = (CY/blocks);
	ZA = (CZ/height);
	TXA = (XA/4);
	TYA = (YA/4);
	Temp = VectorToAngles(end - start);
	Angle = (0, Temp[1], 90);
	for(h = 0;h < height;h++)
	{
		block = spawn("script_model", (start + (TXA, TYA, 10) + ((0, 0, ZA) * h)));
		block setContents(1);
		block.angles = Angle;
		wait 0.0001;
		block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
		block hide();
		for(i = 1;i < blocks;i++)
		{
			block = spawn("script_model", (start + ((XA, YA, 0) * i) + (0, 0, 10) + ((0, 0, ZA) * h)));
			block setContents(1);
			block.angles = Angle;
			block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
			block hide();
			wait 0.0001;
		}
		block = spawn("script_model", ((end[0], end[1], start[2]) + (TXA * -1, TYA * -1, 10) + ((0, 0, ZA) * h)));
		block setContents(1);
		block.angles = Angle;
		block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
		block hide();
		wait 0.0001;
	}
}

CreateVisableWalls(start, end)
{
	D = Distance((start[0], start[1], 0), (end[0], end[1], 0));
	H = Distance((0, 0, start[2]), (0, 0, end[2]));
	blocks = roundUp(D/55);
	height = roundUp(H/30);
	CX = end[0] - start[0];
	CY = end[1] - start[1];
	CZ = end[2] - start[2];
	XA = (CX/blocks);
	YA = (CY/blocks);
	ZA = (CZ/height);
	TXA = (XA/4);
	TYA = (YA/4);
	Temp = VectorToAngles(end - start);
	Angle = (0, Temp[1], 90);
	for(h = 0;h < height;h++)
	{
		block = spawn("script_model", (start + (TXA, TYA, 10) + ((0, 0, ZA) * h)));
		block setModel("com_plasticcase_friendly");
		block.angles = Angle;
		wait 0.0001;
		block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
		for(i = 1;i < blocks;i++)
		{
			block = spawn("script_model", (start + ((XA, YA, 0) * i) + (0, 0, 10) + ((0, 0, ZA) * h)));
			block setModel("com_plasticcase_friendly");
			block.angles = Angle;
			block solid();
			block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
			wait 0.0001;
		}
		block = spawn("script_model", ((end[0], end[1], start[2]) + (TXA * -1, TYA * -1, 10) + ((0, 0, ZA) * h)));
		block setModel("com_plasticcase_friendly");
		block.angles = Angle;
		block solid();
		block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
		wait 0.0001;
	}
}

CreateCluster(amount, pos, radius)
{
	for(i = 0; i < amount; i++)
	{
		half = radius / 2;
		power = ((randomInt(radius) - half), (randomInt(radius) - half), 500);
		block = spawn("script_model", pos + (0, 0, 1000) );
		block setModel("com_plasticcase_friendly");
		block.angles = (90, 0, 0);
		block PhysicsLaunchServer((0, 0, 0), power);
		block Solid();
		block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
		block thread ResetCluster(pos, radius);
		wait 0.05;
	}
}

ElevatorThink(enter, exit, angle)
{
	self endon("disconnect");
	while(1)
	{
		foreach(player in level.players)
		{
			if(Distance(enter, player.origin) <= 50){
				player SetOrigin(exit);
				player SetPlayerAngles(angle);
			}
		}
		wait .25;
	}
}

CreateHurtArea(pos, radius, height)
{
	HurtTrigger = spawn( "trigger_radius", pos, 0, radius, height );
	HurtTrigger thread HurtTriggerThink();
}
	
HurtTriggerThink()
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		player thread maps\mp\gametypes\_damage::finishPlayerDamageWrapper( self, self, 99, 0, "MOD_MELEE", "none", player.origin, player.origin, "none", 0, 0 );
		player iprintlnbold("^1The infection is crawling up your ass :D");
		wait 1;
	}
}

ResetCluster(pos, radius)
{
	wait 5;
	self RotateTo(((randomInt(36)*10), (randomInt(36)*10), (randomInt(36)*10)), 1);
	level waittill("RESETCLUSTER");
	self thread CreateCluster(1, pos, radius);
	self delete();
}

roundUp( floatVal )
{
	if ( int( floatVal ) != floatVal )
	{
		return int( floatVal+1 );
	}
	else
	{
		return int( floatVal );
	}
}

CreateProgressArea(pos, radius, height, repeat, forceNum)
{
	level.spawnlogic = spawn( "trigger_radius", pos, 0, radius, height );
	Hasfound = 0;
	if( !Isdefined(forcenum) )
	{
		forcenum = 0;
	}
	level.spawnlogic thread playerEnterArea(radius, Hasfound, repeat, forcenum);
}

playerEnterArea(radius, didfind, repeat, forcenum, range)
{
	for(;;)
	{
		self waittill( "trigger", player );	
		level.progressmap = forcenum;
	}
}

CreateProgressAreaDebug(pos, radius, height, repeat, forceNum)
{
	Areatrigger = spawn( "trigger_radius", pos, 0, radius, height );
	Hasfound = 0;
	if( !Isdefined(forcenum) )
	{
		forcenum = 0;
	}
	Areatrigger thread playerEnterAreaDebug(radius, Hasfound, repeat, forcenum);
	foreach(player in level.players)
	{
		player.rTouch = 0;
	}
}

playerEnterAreaDebug(radius, didfind, repeat, forcenum, range)
{
	for( ;; )
	{
		wait 0.000000000000000000001;
		if(repeat == 1 && didfind == 1)
		{
			foreach(player in level.players)
			{
				if(Distance(self.origin, player.origin) >= radius * 1 && didfind == 1 && player.rTouch != 0)
				{
					level.progressmap = forcenum;
					didfind = 0;
					player iprintlnbold("You left " + level.progressmap);
				}
			}
		}
		self waittill( "trigger", player );
		currentProgressNum = level.progressmap;
		wait 0.000001;		
		if(repeat == 1)
		{
			if(Distance(self.origin, player.origin) <= radius)
			{
				player.rTouch = 1;
				level.progressmap = forcenum;
				didfind = 1;
				player iprintlnbold("Area " + level.progressmap);
			}

		}
	}
}

RandomBoxDeleteOnWeaponNoTake()
{
	level endon("disconnect");
	level endon("stopspawner");
	{
		level waittill("endrandom");
		level.wep MoveTo(level.wep.origin+(0,0,-30), 12);
		wait 12;
		level notify("box_move");
		level notify("box");
		level.block delete();
		level.block.headIcon destroy();
		level.block.trigger delete();
		level.wep delete();
		level thread SpawnRandomBoxLocation();
		wait 1;
	}
}

RandomBoxDeleteOnWeaponTake()
{
	level endon("disconnect");
	{
		wait 1;
		level notify("box_delete");
		level notify("box");
		level.block delete();
		level.block.headIcon destroy();
		level.block.trigger delete();
		foreach(weaps in level.wep)
		{
			weaps delete();
		}
		level thread SpawnRandomBoxLocation();
		wait 1;
	}
}

EmpEffect(block)
{
	level._effect["empuse"] = loadfx ("explosions/emp_flash_mp");
	PlayFx(level._effect["empuse"],block.origin);
}

CreateFXonPos(pos,fx)
{
    playFX(fx, pos);
    angles = (90, 90, 0);
	wait 0.01;
}

PowerHud()
{
	self endon("disconnect");
	if(!isDefined(self.powertext))
	{
		self.powertext = self createFontString( "default", 1.5 );
		self.powertext setPoint( "TOPRIGHT", "TOPRIGHT", 0, 30);
		self.powertext.HideWhenInMenu = true;
	}
	while(1)
	{
		if(level.power <= 0)
		{
			self.powertext setText ("Power Not Activated");
			self.powertext.fontScale = 1.5;
			self.powertext.glowColor = (1,0.5,0.3);
			self.powertext.glowAlpha = 1;
		}
		else
		{
			self.powertext fadeOverTime( 3.00 );
			self.powertext.alpha = 0;
			wait 3.0;
			self.powertext setText ("Power Activated");
			self.powertext.fontScale = 1.5;
			self.powertext.glowColor = (0.3,0.9,0.3);
			self.powertext.glowAlpha = 1;
			self.powertext fadeOverTime( 2.00 );
			self.powertext.alpha = 1;
			wait 2.0;
			self.powertext ChangeFontScaleOverTime( 0.1 );
			self.powertext.fontScale = 1.750;
			wait 0.1;
			self.powertext ChangeFontScaleOverTime( 0.1 );
			self.powertext.fontScale = 1.5;
		}
		level waittill("power_activated");
	}
}

MoneyGambler()
{
	self endon("disconnect");
	switch(randomInt(20))
	{
		case 0:
		self thread GamblerText("You have gained $500", (1,1,1), (0.3,0.9,0.3), 1, 0.85);
		self.money += 500;
		self thread Money();
		self notify("MONEY");
		break;
		case 1:
		self thread GamblerText("You have gained $100", (1,1,1), (0.3,0.9,0.3), 1, 0.85);
		self.money += 100;
		self thread Money();
		self notify("MONEY");
		break;
		case 2: 
		self thread GamblerText("You have lost $1000", (1,1,1), (0.9,0.3,0.3), 1, 0.85);
		self.money -= 1000;
		self notify("MONEY");
		break;
		case 3:
		self thread GamblerText("You have gained $1500", (1,1,1), (0.3,0.9,0.3), 1, 0.85);
		self.money += 1500;
		self thread Money();
		self notify("MONEY");
		break;
		case 4:
		self thread GamblerText("You have gained $2000", (1,1,1), (0.3,0.9,0.3), 1, 0.85);
		self.money += 2000;
		self thread Money();
		self notify("MONEY");
		break;
		case 5:
		self thread GamblerText("You have gained $5000", (1,1,1), (0.3,0.9,0.3), 1, 0.85);
		self.money += 5000;
		self thread Money();
		self notify("MONEY");
		break;
		case 6: 
		self thread GamblerText("You have gained $10000", (1,1,1), (0.3,0.9,0.3), 1, 0.85);
		self.money += 10000;
		self thread Money();
		self notify("MONEY");
		break;
		case 7:
		self thread GamblerText("You have gained $7500", (1,1,1), (0.3,0.9,0.3), 1, 0.85);
		self.money += 7500;
		self thread Money();
		self notify("MONEY");
		break;
		case 8:
		self thread GamblerText("You have lost all your cash", (1,1,1), (0.9,0.3,0.3), 1, 0.85);
		self.money = 0;
		self notify("MONEY");
		break;
		case 9:
		self thread GamblerText("You have lost $500", (1,1,1), (0.9,0.3,0.3), 1, 0.85);
		self.money -= 500;
		self notify("MONEY");
		break;
		case 10:
		self thread GamblerText("You have gained an extra weapon slot", (1,1,1), (0.3,0.9,0.9), 1, 0.85);
		self giveWeapon("defaultweapon_mp",10,false);
		wait 0.1;
		self switchToWeapon("defaultweapon_mp",10,false);
		break;
		case 11:
		self thread GamblerText("You have won a Model 1887", (1,1,1), (0.3,0.9,0.9), 1, 0.85);
		self.curWeap = self getCurrentWeapon();
		self takeWeapon(self.curWeap);
		self giveWeapon("model1887_mp",0,false);
		wait 0.1;
		self switchToWeapon("model1887_mp",0,false);
		self giveMaxAmmo("model1887_mp",0,false);
		break;
		case 12:
		self thread GamblerText("You will Live or Die in 5 seconds", (1,1,1), (0.9,0.5,0.2), 1, 0.85);
		wait 1;
		self iPrintlnBold("^24");
		wait 1;
		self iPrintlnBold("^23");
		wait 1;
		self iPrintlnBold("^22");
		wait 1;
		self iPrintlnBold("^21");
		wait 1;
		self thread Die();
		break;
		case 13:
		self thread GamblerText("You have a 1/2 chance of a Max Ammo", (1,1,1), (0.9,0.9,0.3), 1, 0.85);
		wait 2;
		self thread MaxAmmoRandom();
		break;
		case 14:
		self thread GamblerText("You have gained Infinite Health for 30 seconds", (1,1,1), (0.3,0.9,0.9), 1, 0.85);
		self thread InfiniteHealth();
		break;
		case 15:
		self thread GamblerText("You have gained Double Health for 30 seconds", (1,1,1), (0.3,0.9,0.9), 1, 0.85);
		self thread DoubleHealth();
		break;
		case 16:
		self thread GamblerText("You have lost all Perks and $1000", (1,1,1), (0.9,0.3,0.3), 1, 0.85);
		self thread TakePerks();
		break;
		default:
		self thread GamblerText("You have won nothing", (1,1,1), (0.9,0.3,0.3), 1, 0.85);
		break;
	}
}

Money()
{
	level._effect["money"] = loadfx ("props/cash_player_drop");
	PlayFx(level._effect["money"],self.origin);
}

Die()
{
	switch(randomInt(4))
	{
		case 0: self notify("menuresponse", game["menu_team"], "spectator");
		break;
		default:
		self thread GamblerText("You Live", (1,1,1), (0.3,0.9,0.9), 1, 0.85);
		break;
	}
}

MaxAmmoRandom()
{
	switch(randomInt(2))
	{
		case 0: 
		self thread GamblerText("You have won a Max Anno", (1,1,1), (0.9,0.9,0.3), 1, 0.85);
		self maps\mp\killstreaks\_airdrop::refillAmmo();
		break;
		case 1:
		self thread GamblerText("You did not win a Max Ammo", (1,1,1), (0.9,0.5,0.3), 1, 0.85);
		break;
	}
}

InfiniteHealth()
{
	if(self.health == 100)
	{
		self.maxhealth = 999999;
		self.health = self.maxhealth;
		self.nobuyhealth = 1;
		wait 30;
		self notify("infinite_health_end");
		self.maxhealth = 100;
		self.health = self.maxhealth;
		self thread GamblerText("Infinite Health Over", (1,1,1), (0.9,0.5,0.2), 1, 0.85);
		self.nobuyhealth = 0;
	}
	else if(self.health == 200)
	{
		self.maxhealth = 999999;
		self.health = self.maxhealth;
		self.health = 20000;
		self.nobuyhealth = 1;
		wait 30;
		self notify("infinite_health_end");
		self.maxhealth = 200;
		self.health = self.maxhealth;
		self thread GamblerText("Infinite Health Over", (1,1,1), (0.9,0.5,0.2), 1, 0.85);
		self.nobuyhealth = 0;
	}
}

DoubleHealth()
{
	if(self.health == 100)
	{
		self.maxhealth = 200;
		self.health = self.maxhealth;
		self.nobuyhealth = 1;
		wait 30;
		self notify("double_health_end");
		self.maxhealth = 100;
		self.health = self.maxhealth;
		self thread GamblerText("Double Health Over", (1,1,1), (0.9,0.5,0.2), 1, 0.85);
		self.nobuyhealth = 0;
	}
	else if(self.health == 200)
	{
		self.maxhealth = 400;
		self.health = self.maxhealth;
		self.nobuyhealth = 1;
		wait 30;
		self notify("double_health_end");
		self.maxhealth = 200;
		self.health = self.maxhealth;
		self thread GamblerText("Double Health Over", (1,1,1), (0.9,0.5,0.2), 1, 0.85);
		self.nobuyhealth = 0;
	}
}

TakePerks()
{
	if ( self _hasPerk( "specialty_finalstand" ) )
	{
		self _ClearPerks();
		self maps\mp\perks\_perks::givePerk( "specialty_finalstand" );
	}
	else
	{
		self _ClearPerks();
	}
	self.speedy = 0;
	self.stalker = 0;
	self.stoppingpower = 0;
	self.steadyaim = 0;
	self.speedreload = 0;
	self.maxhealth = 100;
	self.health = self.maxhealth;
	self.ammomatic = 0;
	self.extra = 1;
	self.zombieperks = 0;
	self thread AImod\_Mod::DestoyPerkHud();
	self.money -= 200;
}

//***** Thanks Yamato *****//
//	Original Code intended on 
//only appearing when you were
//on it, so I reverted it.
// -DidUknowiPwn
//http://www.itsmods.com/forum/Thread-Release-Improved-3D-icons.html

AddBoxType( type, shader, function, string, minimap )
{
    if( ! isDefined( level.boxes ) )
        level.boxes = [];
    level.boxes[ type ][ 0 ] = shader;
    level.boxes[ type ][ 1 ] = function;
    level.boxes[ type ][ 2 ] = string;
    level.boxes[ type ][ 3 ] = minimap;
}

SpawnBoxes( position, angle, model, type )
{
    block = spawn( "script_model", position );
    block setModel( model );
    block.angles = angle;
    block Solid();
    block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
    curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();  
    objective_add( curObjID, "invisible", ( 0, 0, 0 ) );
    objective_position( curObjID, position );
    objective_state( curObjID, "active" );
    objective_team( curObjID, "allies" );
    objective_icon( curObjID, level.boxes[ type ][ 3 ] );
    block thread BoxShader( level.boxes[ type ][ 0 ] );
    block thread BoxAction( type );
}

BoxAction( type )
{
    self endon( "death" );
    self endon( "disconnect" );
    boxtrigger = Spawn( "trigger_radius", self.origin, 0, 50, 72 );
    wait ( 0.05 );
    while( 1 )
    {
        boxtrigger waittill( "trigger", player );
        if( !isplayer( player ) )
            continue;
        while( player IsTouching( boxtrigger ) ) 
        {
            if( VectorDot( anglesToForward( player.angles ), VectorNormalize( boxtrigger.origin - player.origin ) ) > 0.766 )
            {
                player setLowerMessage( "activate", level.boxes[ type ][ 2 ] );
                if( player UseButtonPressed() )
                {
                    player thread [[ level.boxes[ type ][ 1 ] ]]();
                    wait ( 0.5 );
                }
            }
            else
                player ClearLowerMessage( "activate", 1 );
            wait ( 0.05 ); 
        }
        player ClearLowerMessage( "activate", 1 );
    }
}

BoxShader( shader )
{
    self endon( "death" );
    self endon( "disconnect" );
    trigger = Spawn( "trigger_radius", self.origin, 0, 150, 72 );
    trigger.icon = NewHudElem( );
    trigger.icon SetShader( shader, 50, 50 );
    trigger.icon.alpha = 0;
    trigger.icon.color = ( 1, 1, 1 );
    trigger thread UpdateShaderPos();    
    trigger.icon SetWayPoint( true, true );
    wait ( 0.05 );
    while( isDefined(trigger) )
    {
        trigger waittill( "trigger", player );
        if( !isplayer( player ) )
            continue;
        while( player IsTouching( trigger ) ) 
        {
            if( VectorDot( anglesToForward( player.angles ), VectorNormalize( trigger.origin - player.origin ) ) > 0.766 )
                  FadeIcon( trigger.icon, "in" );
            else
                FadeIcon( trigger.icon, "out" );
            wait ( 0.05 ); 
        }
        FadeIcon( trigger.icon, "out" );
    }
}

FadeIcon( icon, what )
{
    if( what == "in" )
    {
        icon FadeOverTime( 0.2 );
        icon.alpha = 1;
        wait ( 0.2 );
    }
    else if( what == "out" )
    {
        icon FadeOverTime( 0.2 );
        icon.alpha = 0;
        wait ( 0.2 );
    }
    else
    {
        if( icon.alpha == 0 )
        {
            icon FadeOverTime( 0.2 );
            icon.alpha = 1;
            wait ( 0.2 );
        }
        else
        {
            icon FadeOverTime( 0.2 );
            icon.alpha = 0;
            wait ( 0.2 );
        }
    }
}

UpdateShaderPos()
{
    while( isDefined( self ) )
    {
        self.icon.x = self.origin[ 0 ];
        self.icon.y = self.origin[ 1 ];
        self.icon.z = self.origin[ 2 ] + 55;
        wait ( 0.05 );
    }
}

AmmoRefill()
{
    self maps\mp\killstreaks\_airdrop::refillAmmo();  
    self playLocalSound( "ammo_crate_use" );
}

SetStalker()
{
    self endon( "death" );
    self endon( "disconnect" );
	self LaserOn();
    while( 1 )
    {
        if( self ADSButtonPressed() )
            self SetMoveSpeedScale( 1.3 );
        else
        {
            self SetMoveSpeedScale( 1 );
            self maps\mp\gametypes\_weapons::updateMoveSpeedScale( "primary" );
        }
		wait ( 0.05 );
    }
}