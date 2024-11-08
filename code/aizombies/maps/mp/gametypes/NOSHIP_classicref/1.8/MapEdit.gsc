#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\SolidStuff;
#include AImod\_OtherFunctions;
#include AImod\_weapon;

init()
{
	level.weapons[0] = "beretta_mp";
	level.weapons[1] = "usp_mp";
	level.weapons[2] = "deserteagle_mp";
	level.weapons[3] = "coltanaconda_mp";
	level.weapons[4] = "glock_mp";
	level.weapons[5] = "beretta393_mp";
	level.weapons[6] = "mp5k_mp";
	level.weapons[7] = "pp2000_mp";
	level.weapons[8] = "pp2000_eotech_mp";
	level.weapons[9] = "uzi_mp";
	level.weapons[10] = "p90_mp";
	level.weapons[11] = "kriss_mp";
	level.weapons[12] = "ump45_mp";
	level.weapons[13] = "tmp_mp";
	level.weapons[14] = "ak47_mp";
	level.weapons[15] = "m16_reflex_mp";
	level.weapons[16] = "m4_reflex_mp";
	level.weapons[17] = "fn2000_mp";
	level.weapons[18] = "masada_mp";
	level.weapons[19] = "famas_mp";
	level.weapons[20] = "fal_mp";
	level.weapons[21] = "scar_mp";
	level.weapons[22] = "tavor_mp";
	level.weapons[23] = "m79_mp";
	level.weapons[24] = "rpg_mp";
	level.weapons[25] = "at4_mp";
	level.weapons[26] = "javelin_mp";
	level.weapons[27] = "barrett_mp";
	level.weapons[28] = "wa2000_acog_mp";
	level.weapons[29] = "m21_acog_mp";
	level.weapons[30] = "cheytac_mp";
	level.weapons[31] = "ranger_mp";
	level.weapons[32] = "model1887_mp";
	level.weapons[33] = "model1887_fmj_mp";
	level.weapons[34] = "striker_mp";
	level.weapons[35] = "aa12_mp";
	level.weapons[36] = "m1014_mp";
	level.weapons[37] = "spas12_mp";
	level.weapons[38] = "rpd_mp";
	level.weapons[39] = "sa80_mp";
	level.weapons[40] = "mg4_mp";
	level.weapons[41] = "m240_grip_mp";
	level.weapons[42] = "aug_mp";
	level.weapons[43] = "onemanarmy_mp";
	level.weapons[44] = "m4_silencer_mp";
	level.weapons[45] = "tmp_silencer_mp";
	level.boxicon = 0;
	level.box = 0;
	level.boxposition = 0;
	level.doCustomMap = 0;
	level.doorwait = 2;
	level.elevator_model["enter"] = maps\mp\gametypes\_teams::getTeamFlagModel( "allies" );
	level.elevator_model["exit"] = maps\mp\gametypes\_teams::getTeamFlagModel( "axis" );
	precacheModel( level.elevator_model["enter"] );
	precacheModel( level.elevator_model["exit"] );
	precacheModel( "com_locker_double" );
	precacheModel( "vehicle_av8b_harrier_jet_mp" );
	precacheModel( "com_teddy_bear" );
	wait 0.001;
	if(getDvar("mapname") == "mp_afghan")
	{
		/** Afghan **/ 
		level thread Afghan();
		level thread mp\maps\mp_afghan::WaypointInit();
		level.doCustomMap = 1;
	}
	if(getDvar("mapname") == "mp_boneyard")
	{
		/** Scrapyard **/ level thread Scrapyard();
		level thread mp\maps\mp_scrapyard::WaypointInit();
		level.doCustomMap = 1;
	}
	if(getDvar("mapname") == "mp_brecourt")
	{
		/** Wasteland **/ level thread Wasteland();
		level thread mp\maps\mp_wasteland1::Init();
		level thread mp\maps\mp_wasteland1::WaypointInit();
		level.doCustomMap = 1;
	}
	if(getDvar("mapname") == "mp_checkpoint")
	{
		/** Karachi **/ 
		level thread Karachi();
		level.doCustomMap = 1;
	}
	if(getDvar("mapname") == "mp_derail")
	{
		/** Derail **/ 
		level thread Derail();
		level thread mp\maps\mp_derail::WaypointInit();
		level.doCustomMap = 1;
	}
	if(getDvar("mapname") == "mp_estate")
	{
		/** Estate **/ level thread Estate();
		level.doCustomMap = 1;
	}
	if(getDvar("mapname") == "mp_favela")
	{
		/** Favela **/ level thread Favela();
		level.doCustomMap = 1;
	}
	if(getDvar("mapname") == "mp_highrise")
	{
		/** HighRise **/ 
		switch(randomInt(2))
		{
			case 0: //Sunset Infestation
			level thread HighRise();
			level.edit = 0;
			break;
			case 1: //Infestation
			level thread HighRise2();
			level.edit = 1;
			break;
		}
		level.doCustomMap = 1;
	}
	if(getDvar("mapname") == "mp_nightshift")
	{
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
		level.doCustomMap = 1;
	}
	if(getDvar("mapname") == "mp_invasion")
	{
		/** Invasion **/ 
		level thread Invasion();
		level.doCustomMap = 1;
	}
	if(getDvar("mapname") == "mp_quarry")
	{
		/** Quarry **/ 
		level thread Quarry();
		level.doCustomMap = 1;
	}
	if(getDvar("mapname") == "mp_rundown")
	{
		/** Rundown **/ 
		level thread Rundown();
		level thread mp\maps\mp_rundown::Init();
		level.doCustomMap = 1;
	}
	if(getDvar("mapname") == "mp_rust")
	{
		/** Rust **/ 
		switch(randomInt(2))
		{
			case 0:
			level thread Rust();
			level thread mp\maps\mp_rust::WaypointInit();
			level.edit = 0;
			break;
			case 1:
			level thread Rust2();
			level thread mp\maps\mp_rust2::WaypointInit();
			level.edit = 1;
			break;
		}
		level.doCustomMap = 1;
	}
	if(getDvar("mapname") == "mp_subbase")
	{
		/** SubBase **/ 
		level thread SubBase();
		level thread mp\maps\mp_subbase::Init();
		level.doCustomMap = 1;
	}
	if(getDvar("mapname") == "mp_terminal")
	{
		/** Terminal **/ 
		level thread Terminal();
		level thread mp\maps\mp_terminal1::Init();
		level.doCustomMap = 1;
	}
	if(getDvar("mapname") == "mp_underpass")
	{
		/** Underpass **/ 
		level thread Underpass();
		level thread mp\maps\mp_underpass::WaypointInit();
		level.doCustomMap = 1;
	}
	if(getDvar("mapname") == "mp_overgrown")
	{
		/** overgrown **/ 
		level thread Overgrown();
		level.doCustomMap = 1;
	}
	if(getDvar("mapname") == "mp_trailerpark")
	{
		/** TrailerPark **/ 
		level thread Trailerpark();
		level thread mp\maps\mp_trailerpark::WaypointInit();
		level.doCustomMap = 1;
	}
	if(getDvar("mapname") == "mp_compact")
	{
		/** Salvage **/ 
		level thread Salvage();
		level thread mp\maps\mp_salvage::WaypointInit();
		level.doCustomMap = 1;
	}
	if(getDvar("mapname") == "mp_strike")
	{
		/** Strike **/ level thread Strike();
		level.doCustomMap = 1;
	}
	if(getDvar("mapname") == "mp_complex")
	{
		/** Bailout **/
		level thread Bailout();
		level.doCustomMap = 1;
	}
	if(getDvar("mapname") == "mp_abandon")
	{
		/** Carnival **/
		level thread Carnival();
		level thread mp\maps\mp_carnival::WaypointInit();
		level.doCustomMap = 1;
	}
	if(getDvar("mapname") == "mp_vacant")
	{
		/** Vacant **/
		level thread Vacant();
		level thread mp\maps\mp_vacant::WaypointInit();
		level.doCustomMap = 1;
	}
	if(getDvar("mapname") == "mp_storm")
	{
		/** Storm **/
		level thread Storm();
		level thread mp\maps\mp_storm::WaypointInit();
		level.doCustomMap = 1;
	}
	if(level.doCustomMap == 1)
	{
		level.gameState = "starting";
		level thread CreateMapWait();
	}
	else
	{
		level.gameState = "starting";
		wait 15;
		level notify("CREATED");
	}
}

CreateMapWait()
{
	level notify("CREATED");
	foreach(player in level.players)
	{
		player freezeControls(false);
		player VisionSetNakedForPlayer(getDvar("mapname"), 0);
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
	level.block.headIcon setShader( "hud_icon_m16a4", 10,10 );
	level.block.headIcon setWaypoint( true, true, false );
	level.block thread RandomWeaponThink(pos, angle);
	if(level.boxicon == 0)
	{
		curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();	
		objective_add( curObjID, "invisible", (0,0,0) );
		objective_position( curObjID, level.block.origin );
		objective_state( curObjID, "active" );
		objective_team( curObjID, "allies" );
		objective_icon( curObjID, "hud_icon_m16a4" );
		level thread RandomWeaponUpdateIconPosition(curObjID);
		level.boxicon = 1;
	}
	level.trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
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
			wait 1;
			level notify("box_slow");
			wait 0.3;
			self thread RandomWeaponSlowest();
			wait 1;
			level notify("box_slowest");	
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
		level.boxWeapon = level.weapons[RandomInt( level.weapons.size )];
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
		level.boxWeapon = level.weapons[RandomInt( level.weapons.size )];
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
		level.boxWeapon = level.weapons[RandomInt( level.weapons.size )];
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
		self thread maps\mp\gametypes\BoxText::BoxWeaponText();
		if(Distance(pos, self.origin) <= 75)
		{
			self setLowerMessage("trade", "Hold ^3[{+activate}]^7 to Trade Weapons for " + level.guntext );
		}
		else
		{
			if(Distance(pos, self.origin) >50) self ClearLowerMessage("trade", 1);
		}
		if(Distance(pos, self.origin) <= 75 && self getAllWeapons(level.boxWeapon) == false && self.weapons == 0 && self useButtonPressed())
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
		else if(Distance(pos, self.origin) <= 75 && self getAllWeapons(level.boxWeapon) == true && self.weapons == 0 && self useButtonPressed())
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
		if(Distance(pos, self.origin) <= 75 && self getAllWeapons(level.boxweapon) == false && self.weapons == 1 && self useButtonPressed())
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
		else if(Distance(pos, self.origin) <= 75 && self getAllWeapons(level.boxweapon) == true && self.weapons == 1 && self useButtonPressed())
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
	block.headIcon = newHudElem();
	block.headIcon.x = block.origin[0];
	block.headIcon.y = block.origin[1];
	block.headIcon.z = block.origin[2] + 50;
	block.headIcon.alpha = 0.85;
	block.headIcon setShader( "cardicon_fmj", 10,10 );
	block.headIcon setWaypoint( true, true, false );
	curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();	
	objective_add( curObjID, "invisible", (0,0,0) );
	objective_position( curObjID, block.origin );
	objective_state( curObjID, "active" );
	objective_team( curObjID, "allies" );
	objective_icon( curObjID, "cardicon_fmj" );
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
		player thread maps\mp\gametypes\BoxText::UpgradeWeaponText();
		if(Distance(pos, Player.origin) <= 75)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 to Upgrade your ^1" + level.upgradetext + "^7 [^2$^45000^7]" );
		}
		if(Distance(pos, Player.origin) >=50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player getCurrentWeapon() == level.weapons && player.money >= 5000 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player.money -= 5000;
			player notify("MONEY");
			player thread maps\mp\gametypes\_rank::scorePopup( -5000, 0, (1,0,0), 1 );
			player thread AImod\_Mod::TextPopup("Weapon Upgraded!");
			player playLocalSound( maps\mp\gametypes\_teams::getTeamVoicePrefix( "allies" ) + "victory_music" );
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
			level.upgradeweapon MoveTo(pos+(0,0,10), 2);
			wait 2;
			level.upgradeweapon delete();
			player maps\mp\gametypes\Upgrade::giveUpgradedWeapon(pos, angle, player.gunup);
			wait 1;
			player ClearLowerMessage("upgradetrade", 1);
		}
		else if(Distance(pos, Player.origin) <= 75 && player getCurrentWeapon() == level.weapons && player.money <= 5000 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("You do not have enough money for Weapon Upgrade Need $5000!");
			wait 1;
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
	block.headIcon = newHudElem();
	block.headIcon.x = block.origin[0];
	block.headIcon.y = block.origin[1];
	block.headIcon.z = block.origin[2] + 50;
	block.headIcon.alpha = 0.85;
	block.headIcon setShader( "waypoint_ammo_friendly", 10,10 );
	block.headIcon setWaypoint( true, true, false );
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
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 for Ammo[^2$^3750^7]" );
		}
		if(Distance(pos, Player.origin) > 50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.money >= 750 && player.pers["team"] == "allies" && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player.money -= 750;
			player notify("MONEY");
			player thread maps\mp\gametypes\_rank::scorePopup( -750, 0, (1,0,0), 1 );
			player thread AImod\_Mod::TextPopup( "Ammo!" );
			player maps\mp\killstreaks\_airdrop::refillAmmo();
			level notify("boxend");
			player playLocalSound( "ammo_crate_use" );
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money <= 750 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1Not enough money for Ammo Need $750!");
			wait 1;
		}
		wait 0.01;
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
	block.headIcon = newHudElem();
	block.headIcon.x = block.origin[0];
	block.headIcon.y = block.origin[1];
	block.headIcon.z = block.origin[2] + 50;
	block.headIcon.alpha = 0.85;
	block.headIcon setShader( "cardicon_8ball", 10,10 );
	block.headIcon setWaypoint( true, true, false );
	block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
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
		if(Distance(pos, Player.origin) <= 75)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 for Speed Cola [^2$^33000^7]" );
		}
		if(Distance(pos, Player.origin) >50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.money >= 3000 && player.pers["team"] == "allies" && player.speedreload == 0 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player.money -= 3000;
			player notify("MONEY");
			player thread maps\mp\gametypes\_rank::scorePopup( -3000, 0, (1,0,0), 1 );
			player thread AImod\_Mod::TextPopup( "Speed Reload!" );
			player _setPerk("specialty_fastreload");
			player _setPerk("specialty_quickdraw");
			player.speedreload = 1;
			player.zombieperks += 1;
			wait 0.1;
			player thread PerkHud( "specialty_fastreload_upgrade" );
			level notify("boxend");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money <= 3000 && player.speedreload == 0 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1Not enough money for Speed Cola Need $3000!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money >= 0 && player.speedreload == 1 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1You have already bought Speed Cola!");
			wait 1;
		}
		wait 0.01;
	}
}

SteadyAim(pos, angle)
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
	objective_icon( curObjID, "specialty_steadyaim_upgrade" );
    trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
    trigger.angles = angle;
	trigger thread SteadyAimThink(pos);
    wait 0.01;
}

SteadyAimThink(pos, angle)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 for Steady Aim [^2$^32000^7]" );
		}
		if(Distance(pos, Player.origin) >50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.money >= 2000 && player.pers["team"] == "allies" && player.steadyaim == 0 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player.money -= 2000;
			player notify("MONEY");
			player thread maps\mp\gametypes\_rank::scorePopup( -2000, 0, (1,0,0), 1 );
			player thread AImod\_Mod::TextPopup( "Steady Aim!" );
			player _setPerk("specialty_bulletaccuracy");
			player _setPerk("specialty_steelnerves");
			player.steadyaim = 1;
			player setClientDvar("ui_drawCrosshair", 1);
			player.zombieperks += 1;
			wait 0.1;
			player thread PerkHud( "specialty_steadyaim_upgrade" );
			level notify("boxend");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money <= 2000 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1Not enough money for Steady Aim Need $2000!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money >= 2000 && player.steadyaim == 1 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1You have already bought Steady Aim!");
			wait 1;
		}
		wait 0.01;
	}
}

AmmOMatic(pos, angle)
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
	objective_icon( curObjID, "cardicon_bullets_50cal" );
    trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
    trigger.angles = angle;
	trigger thread AmmOMaticThink(pos);
    wait 0.01;
}

AmmOMaticThink(pos, angle)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 for Amm-O-Matic [^2$^36500^7]" );
		}
		if(Distance(pos, Player.origin) >50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.money >= 6500 && player.pers["team"] == "allies" && player.ammomatic == 0 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player.money -= 6500;
			player notify("MONEY");
			player thread maps\mp\gametypes\_rank::scorePopup( -6500, 0, (1,0,0), 1 );
			player thread AImod\_Mod::TextPopup( "Amm-O-Matic!" );
			player.ammomatic = 1;
			player.zombieperks += 1;
			wait 0.1;
			player thread PerkHud( "cardicon_bullets_50cal" );
			level notify("boxend");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money <= 6500 && player useButtonPressed())
		{
			player iPrintln("^1Not enough money for Amm-O-Matic Need $6500!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money >= 6500 && player.ammomatic == 1 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1You have already bought Amm-O-Matic!");
			wait 1;
		}
		wait 0.01;
	}
}

StoppingPower(pos, angle)
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
	objective_icon( curObjID, "specialty_bulletdamage_upgrade" );
    trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
    trigger.angles = angle;
	trigger thread StoppingPowerThink(pos);
    wait 0.01;
}

StoppingPowerThink(pos, angle)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 for Stopping Power [^2$^32500^7]" );
		}
		if(Distance(pos, Player.origin) >50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.money >= 2500 && player.pers["team"] == "allies" && player.stoppingpower == 0 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player.money -= 2500;
			player notify("MONEY");
			player thread maps\mp\gametypes\_rank::scorePopup( -2500, 0, (1,0,0), 1 );
			player thread AImod\_Mod::TextPopup( "Stopping Power!" );
			player _setPerk("specialty_bulletdamage");
			player.stoppingpower = 1;
			player.zombieperks += 1;
			wait 0.1;
			player thread PerkHud( "specialty_bulletdamage_upgrade" );
			level notify("boxend");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money <= 2500 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1Not enough money for Stopping Power Need $2500!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money >= 2500 && player.stoppingpower == 1 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1You have already bought StoppingPower!");
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
		if(Distance(pos, Player.origin) <= 75)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 for Last Stand Pro [^2$^32500^7]" );
		}
		if(Distance(pos, Player.origin) >50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.money >= 2500 && player.pers["team"] == "allies" && player.autorevive == 0 && player.standpro <= 2 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player.money -= 2500;
			player notify("MONEY");
			player thread maps\mp\gametypes\_rank::scorePopup( -2500, 0, (1,0,0), 1 );
			player thread AImod\_Mod::TextPopup( "Last Stand Pro!" );
			player maps\mp\perks\_perks::givePerk("specialty_finalstand");
			player.autorevive += 1;
			player.standpro += 1;
			wait 0.1;
			player thread PerkLastStandPro();
			level notify("boxend");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money <= 2500 && player useButtonPressed())
		{
			player iPrintln("^1Not enough money for Last Stand Pro Need $2500!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money >= 2500 && player.autorevive == 1 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1You have already bought Last Stand Pro!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money >= 2500 && player.autorevive >= 0 && player.standpro >= 2 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1You have already bought Last Stand Pro 3 Times!");
			wait 1;
		}
		wait 0.01;
	}
}

PerkLastStandPro()
{
	self.laststandpro = NewClientHudElem( self );
	self.laststandpro.alignX = "center";
	self.laststandpro.alignY = "middle";
	self.laststandpro.horzAlign = "center";
	self.laststandpro.vertAlign = "middle";
	self.laststandpro.x = 0;
	self.laststandpro.y = 0;
	self.laststandpro.foreground = true;
	self.laststandpro setIconShader( "specialty_pistoldeath_upgrade" );
	self.laststandpro setIconSize( 100, 100 );
	self.laststandpro.alpha = 1;	
	self.laststandpro scaleOverTime( 3, 40, 40 );
	self.laststandpro moveOverTime( 3 );
	self.laststandpro.x = 0;
	self.laststandpro.y = 220;
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
		if(Distance(pos, Player.origin) <= 75)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 for Stamin-Up [^2$^32500^7]" );
		}
		if(Distance(pos, Player.origin) >50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.money >= 2500 && player.pers["team"] == "allies" && player.speedy == 0 && player useButtonPressed())
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
			player thread PerkHud( "specialty_lightweight_upgrade" );
			level notify("boxend");
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
		wait 0.01;
	}
}

DoublePoints(pos, angle)
{
	block = spawn("script_model", pos+(0,0,50) );
	block setModel("com_plasticcase_friendly");
	block.angles = angle;
	block Solid();
	level.extra = 0;
	block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	block moveto(pos,3);
	curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();	
	objective_add( curObjID, "invisible", (0,0,0) );
	objective_position( curObjID, block.origin );
	objective_state( curObjID, "active" );
	objective_team( curObjID, "allies" );
	objective_icon( curObjID, "specialty_hardline_upgrade" );
    trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
    trigger.angles = angle;
	trigger thread DoublePointsThink(pos);
    wait 0.01;
}

DoublePointsThink(pos, angle)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 for Double Points ^3[^5Need 200 Bonus Points^3]" );
		}
		if(Distance(pos, Player.origin) >50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.bonus >= 200 && player.pers["team"] == "allies" && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player.bonus -= 200;
			player notify("BONUS");
			player thread maps\mp\gametypes\_rank::scorePopup( -200, 0, (0,1,1), 1 );
			player thread AImod\_Mod::TextPopup( "Double Points!" );
			player.extra = 1;
			player.zombieperks += 1;
			wait 0.1;
			player thread PerkHud( "specialty_hardline_upgrade" );
			level notify("boxend");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 2500 && player.bonus <= 200 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1Not enough ^5Bonus Points ^1for Double Points Need 200 Bonus Points!");
			wait 1;
		}
		wait 0.01;
	}
}

PerkHud( shader )
{
	if(self.zombieperks == 1)
	{
		self.perk1 = NewClientHudElem( self );
		self.perk1.alignX = "center";
		self.perk1.alignY = "middle";
		self.perk1.horzAlign = "center";
		self.perk1.vertAlign = "middle";
		self.perk1.x = 0;
		self.perk1.y = 0;
		self.perk1.foreground = true;
		self.perk1 setIconShader( shader );
		self.perk1 setIconSize( 100, 100 );
		self.perk1.alpha = 1;
		self.perk1 scaleOverTime( 3, 25, 25 );
		self.perk1 moveOverTime( 3 );
		self.perk1.x = -410;
		self.perk1.y = 187;
	}
	if(self.zombieperks == 2)
	{
		self.perk2 = NewClientHudElem( self );
		self.perk2.alignX = "center";
		self.perk2.alignY = "middle";
		self.perk2.horzAlign = "center";
		self.perk2.vertAlign = "middle";
		self.perk2.x = 0;
		self.perk2.y = 0;
		self.perk2.foreground = true;
		self.perk2 setIconShader( shader );
		self.perk2 setIconSize( 100, 100 );
		self.perk2.alpha = 1;
		self.perk2 scaleOverTime( 3, 25, 25 );
		self.perk2 moveOverTime( 3 );
		self.perk2.x = -388;
		self.perk2.y = 187;
	}
	if(self.zombieperks == 3)
	{
		self.perk3 = NewClientHudElem( self );
		self.perk3.alignX = "center";
		self.perk3.alignY = "middle";
		self.perk3.horzAlign = "center";
		self.perk3.vertAlign = "middle";
		self.perk3.x = 0;
		self.perk3.y = 0;
		self.perk3.foreground = true;
		self.perk3 setIconShader( shader );
		self.perk3 setIconSize( 100, 100 );
		self.perk3.alpha = 1;
		self.perk3 scaleOverTime( 3, 25, 25 );
		self.perk3 moveOverTime( 3 );
		self.perk3.x = -366;
		self.perk3.y = 187;
	}
	if(self.zombieperks == 4)
	{
		self.perk4 = NewClientHudElem( self );
		self.perk4.alignX = "center";
		self.perk4.alignY = "middle";
		self.perk4.horzAlign = "center";
		self.perk4.vertAlign = "middle";
		self.perk4.x = 0;
		self.perk4.y = 0;
		self.perk4.foreground = true;
		self.perk4 setIconShader( shader );
		self.perk4 setIconSize( 100, 100 );
		self.perk4.alpha = 1;
		self.perk4 scaleOverTime( 3, 25, 25 );
		self.perk4 moveOverTime( 3 );
		self.perk4.x = -344;
		self.perk4.y = 187;
	}
	if(self.zombieperks == 5)
	{
		self.perk5 = NewClientHudElem( self );
		self.perk5.alignX = "center";
		self.perk5.alignY = "middle";
		self.perk5.horzAlign = "center";
		self.perk5.vertAlign = "middle";
		self.perk5.x = 0;
		self.perk5.y = 0;
		self.perk5.foreground = true;
		self.perk5 setIconShader( shader );
		self.perk5 setIconSize( 100, 100 );
		self.perk5.alpha = 1;
		self.perk5 scaleOverTime( 3, 25, 25 );
		self.perk5 moveOverTime( 3 );
		self.perk5.x = -322;
		self.perk5.y = 187;
	}
	if(self.zombieperks == 6)
	{
		self.perk6 = NewClientHudElem( self );
		self.perk6.alignX = "center";
		self.perk6.alignY = "middle";
		self.perk6.horzAlign = "center";
		self.perk6.vertAlign = "middle";
		self.perk6.x = 0;
		self.perk6.y = 0;
		self.perk6.foreground = true;
		self.perk6 setIconShader( shader );
		self.perk6 setIconSize( 100, 100 );
		self.perk6.alpha = 1;
		self.perk6 scaleOverTime( 3, 25, 25 );
		self.perk6 moveOverTime( 3 );
		self.perk6.x = -300;
		self.perk6.y = 187;
	}
	if(self.zombieperks == 7)
	{
		self.perk7 = NewClientHudElem( self );
		self.perk7.alignX = "center";
		self.perk7.alignY = "middle";
		self.perk7.horzAlign = "center";
		self.perk7.vertAlign = "middle";
		self.perk7.x = 0;
		self.perk7.y = 0;
		self.perk7.foreground = true;
		self.perk7 setIconShader( shader );
		self.perk7 setIconSize( 100, 100 );
		self.perk7.alpha = 1;
		self.perk7 scaleOverTime( 3, 25, 25 );
		self.perk7 moveOverTime( 3 );
		self.perk7.x = -278;
		self.perk7.y = 187;
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
		if(Distance(pos, Player.origin) <= 75)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 for Juggernog [^2$^32500^7]" );
		}
		if(Distance(pos, Player.origin) >50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.money >= 2500 && player.nobuyhealth == 0 && player.maxhealth <= 100 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player.money -= 2500;
			player notify("MONEY");
			player thread maps\mp\gametypes\_rank::scorePopup( -2500, 0, (1,0,0), 1 );
			player thread AImod\_Mod::TextPopup( "Juggernog!" );
			player.maxhealth += 100;
			player.zombieperks += 1;
			wait 0.1;
			player thread PerkHud( "cardicon_juggernaut_2" );
			level notify("boxend");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money <= 2500 && player.maxhealth <= 100 && player.nobuyhealth == 0 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1Not enough money for Juggernog $2500!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money >= 0 && player useButtonPressed() && player.maxhealth >= 100 && player.nobuyhealth == 0)
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
		wait 0.01;
	}
}

Power(pos, angle)
{
	block = spawn("script_model", pos );
	block setModel("com_locker_double");
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
	trigger thread PowerThink(pos);
	block thread PowerDestroy();
    wait 0.01;
}   

PowerThink(pos, angle)
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
			player thread EmpEffect();
			player playSound("nuke_explosion");
			player thread maps\mp\gametypes\_rank::scorePopup( -10000, 0, (1,0,0), 1 );
			level.playername = player.name;
			foreach(player in level.players)
			{
			    player thread AImod\_Mod::TextPopup( "Power!" );
				player thread AImod\_Intro::TextMap( 1, (2,1,0), (1,0,0), 0.50, level.playername );
				player thread AImod\_Intro::TextMap2( "Power Activated", 1, (1,0,0), (1,0,0), 0.50 );
			}
			Announcement( "^2" + self.name + "^3Has activated the power." );
			level.power = 1;
			level.activeUAVs["allies"]++;	
			level notify("uav_update");
			level thread PowerSpawner();
			level notify("power_activated");
			level notify("Destroy");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 10000 && player.money <= 750 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1Not enough money for Power Need 10000!");
			wait 1;
		}
		wait 0.01;
	}
}

Power2(pos, angle)
{
	level endon("Destroy"); 
	block = spawn("script_model", pos );
	block setModel("vehicle_av8b_harrier_jet_mp");
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
	trigger thread Power2Think(pos);
	block thread PowerDestroy();
    wait 0.01;
}   

Power2Think(pos, angle)
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
			player thread EmpEffect();
			player playSound( "nuke_explosion" );
			player thread maps\mp\gametypes\_rank::scorePopup( -10000, 0, (1,0,0), 1 );
			level.playername = player.name;
			foreach(player in level.players)
			{
			    player thread AImod\_Mod::TextPopup( "Power!" );
				player thread AImod\_Intro::TextMap( 1, (2,1,0), (1,0,0), 0.50, level.playername );
				player thread AImod\_Intro::TextMap2( "Power Activated", 1, (1,0,0), (1,0,0), 0.50 );
			}
			level.power = 1;
			level.activeUAVs["allies"]++;	
			level notify("uav_update");
			level thread PowerSpawner();
			level notify("power_activated");
			level notify("Destroy");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 10000 && player.money <= 750 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1Not enough money for Power Need 10000!");
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
	trigger thread Power3Think(pos);
	block thread PowerDestroy();
    wait 0.01;
}   

Power3Think(pos, angle)
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
			player thread EmpEffect();
			player playSound( "nuke_explosion" );
			player thread maps\mp\gametypes\_rank::scorePopup( -10000, 0, (1,0,0), 1 );
			level.playername = player.name;
			foreach(player in level.players)
			{
			    player thread AImod\_Mod::TextPopup( "Power!" );
				player thread AImod\_Intro::TextMap( 1, (2,1,0), (1,0,0), 0.50, level.playername );
				player thread AImod\_Intro::TextMap2( "Power Activated", 1, (1,0,0), (1,0,0), 0.50 );
			}
			level.power = 1;
			level.activeUAVs["allies"]++;	
			level notify("uav_update");
			level thread PowerSpawner();
			level notify("power_activated");
			level notify("Destroy");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 10000 && player.money <= 750 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1Not enough money for Power Need 10000!");
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

CreateDoors(open, close, angle, size, height, hp, range)
{

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
		for(i = 1;i < blocks;i++)
		{
			block = spawn("script_model", (start + ((XA, YA, 0) * i) + (0, 0, 10) + ((0, 0, ZA) * h)));
			block setContents(1);
			block.angles = Angle;
			block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
			wait 0.0001;
		}
		block = spawn("script_model", ((end[0], end[1], start[2]) + (TXA * -1, TYA * -1, 10) + ((0, 0, ZA) * h)));
		block setContents(1);
		block.angles = Angle;
		block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
		wait 0.0001;
	}
}

CreateWalls2(start, end)
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
		block setContents(1);
		block.angles = Angle;
		wait 0.0001;
		block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
		for(i = 1;i < blocks;i++)
		{
			block = spawn("script_model", (start + ((XA, YA, 0) * i) + (0, 0, 10) + ((0, 0, ZA) * h)));
			block setModel("com_plasticcase_friendly");
			block setContents(1);
			block.angles = Angle;
			block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
			wait 0.0001;
		}
		block = spawn("script_model", ((end[0], end[1], start[2]) + (TXA * -1, TYA * -1, 10) + ((0, 0, ZA) * h)));
		block setModel("com_plasticcase_friendly");
		block setContents(1);
		block.angles = Angle;
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

DoorThink(open, close)
{

}

DoorUse(range)
{
	self endon("disconnect");
}

ResetDoors(open, hp)
{

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

Afghan()
{
	RandomWeapon((-1672,-1081,-1444),(0,44,0));
	Ammo((-2710,-424,-1444),(0,34,0));
	Power((-3136,41,-1446),(0,333,0));
	DoublePoints((-2928,-417,-1444),(0,123,0));
	Gambler((-2199,-28,-1444),(0,313,0));
	CreateWalls((-2135,-62,-1440),(-2209,43,-1297));
	CreateWalls((-3501,567,-1443),(-3410,1545,-1233));
}

Derail()
{
	CreateWalls((1506,1760,130),(1501,1462,244));
	CreateWalls((1671,3064,130),(1600,2944,244));
	CreateWalls((2711,1122,130),(2523,1152,244));
	CreateWalls((2713,3136,142),(2520,3131,244));
	CreateWalls((1680,3110,158),(1687,3345,227));
	CreateBlocks((2346,3447,294),(0,0,0));
	CreateBlocks((2346,3447,250),(0,0,0));
	CreateBlocks((2346,3447,350),(0,0,0));
	CreateBlocks((1884,3190,456),(0,90,0));
	CreateBlocks((1884,3190,500),(0,90,0));
	CreateBlocks((1884,3190,550),(0,90,0));
	CreateBlocks((1884,3254,450),(0,90,0));
	CreateBlocks((1884,3254,500),(0,90,0));
	CreateBlocks((1884,3254,550),(0,90,0));
	CreateBlocks((2602,2809,158),(0,0,0));
	CreateBlocks((2602,2809,200),(0,0,0));
	CreateBlocks((2602,2809,250),(0,0,0));
	CreateBlocks((1820,2127,320),(0,90,0));
	CreateBlocks((1820,2127,370),(0,90,0));
	CreateBlocks((1820,2198,320),(0,90,0));
	CreateBlocks((1820,2198,370),(0,90,0));
	CreateBlocks((1683,3186,344),(0,90,0));
	CreateBlocks((1684,3269,344),(0,90,0));
	RandomWeapon((1790,3371,294),(0,0,0));
	Ammo((1888,2672,158),(0,90,0));
	Power3((1959,2233,294),(0,90,0));
	DoublePoints((1738,3371,158),(0,0,0));
	Gambler((1810,3084,158),(0,0,0));
}

Estate()
{
	RandomWeapon((-3191,-1275,-527),(0,156,0));
	Upgrade((-3591,-749,-527),(0,24,0));
	Ammo((-3473,-814,-575),(0,116,0));
	DoublePoints((-2042,-525,-341),(0,113,0));
	Gambler((-2321,-45,-286),(0,0,0));
}

Favela()
{
	RandomWeapon((1873,2458,296),(0,207,0));
	Ammo((1717,2640,296),(0,25,0));
	Power3((2189,2635,296),(0,207,0));
	DoublePoints((2034,2829,296),(0,25,0));
	Gambler((2292,2692,296),(0,207,0));
	CreateWalls((2740,2858,250),(3047,3047,469));
}

HighRise()
{
	RandomWeapon((-8060.7,6789.3,2331.1),(0,0,0));
	Ammo((-8245.9,6795.1,2331.1),(0,0,0));
	Power3((-7898.1,5330.9,2331.1),(0,224.9,0));
	DoublePoints((-8124.8,5095.5,2331.1),(0,224.9,0));
	Gambler((-8471.1,4745.8,2331.1),(0,224.9,0));
}

HighRise2()
{
	CreateRamps((-14404,7069.8,5300),(-14380,6890.9,5419.1));
	RandomWeapon((-13630.1,3855.1,5439.1),(0,0,0));
	Ammo((-13051.8,3855.1,5439.1),(0,0,0));
	Power3((-12808.9,3855.1,5439.1),(0,0,0));
	DoublePoints((-15781.4,4024.6,5439.1),(0,90,0));
	Gambler((-15781.4,4223.6,5439.1),(0,90,0));
}

Invasion()
{
	RandomWeapon((2335,12023,11),(0,90,0));
	Power3((2403,12760,11),(0,0,0));
	DoublePoints((2471,11593,11),(0,90,0));
	Ammo((2335,11223,11),(0,90,0));
	Gambler((2472,10874,11),(0,90,0));
}

Karachi()
{
	RandomWeapon((2740,2738,8),(0,90,0));
	Power3((2597,2610,3),(0,0,0));
	DoublePoints((2361,2807,11),(0,90,0));
	Ammo((2582,2892,8),(0,0,0));
	Gambler((2701,2889,3),(0,0,0));
}

Quarry()
{
	RandomWeapon((-1462.1,2046.0,171.1),(0,90,0));
	Ammo((-1832.9,2074.2,171.1),(0,90,0));
	Power3((-4825.4,1997.4,187.1),(0,90,0));
	DoublePoints((-3362.6,1901.5,163.2),(0,90,0));
	Gambler((-1431.1,1693.2,35.1),(0,90,0));
}

Rundown()
{
	RandomWeapon((1407,2651,77),(0,0,0));
	Power3((497,3358,59),(0,0,0));
	DoublePoints((1496,3056,77),(0,90,0));
	Ammo((830,2953,75),(0,90,0));
	Gambler((1215,2988,77),(0,0,0));
	CreateWalls((1536,2303,50),(1472,2300,200));
	CreateWalls((695,2131,100),(495,2174,200));
	CreateWalls((304,2327,140),(163,2936,250));
}

Rust()
{
	thread CreateWalls((-579.5,-9976.5,-290.5),(-1192,-9332.6,0));
	thread CreateWalls((3281.4,-10772.8,-271.1),(3136.1,-9614.3,-73.2));
	RandomWeapon((2749.3,-9489.3,-271.5),(0,-25.1,0));
	Power3((1477.0,-10211.9,-162.4),(0,162.4,0));
	DoublePoints((515.5,-10056.6,-67.3),(0,172.1,0));
	Ammo((1777.3,-10392.6,-201.5),(0,155,0));
	Gambler((2630.3,-9443.5,-276.5),(0,340.8,0));
}

Rust2()
{
	thread CreateGrids((1302,-6124,-286),(936,-6674,-281),(0,0,0));
	thread CreateGrids((1338,-5722,-286),(929,-5392,-281),(0,0,0));
	thread CreateRamps((1184,-6110,-286),(1174,-5741,-286));
	thread CreateRamps((1370,-5368,-270),(1597,-5147,-255));
	RandomWeapon((1138,-5393,-255),(0,0,0));
	DoublePoints((1106,-6128,-255),(0,0,0));
	Ammo((1092,-6437,-255),(0,0,0));
	Gambler((924,-6453,-255),(0,90,0));
	Power3((1783,-4733,-163),(0,90,0));
}

Scrapyard()
{
	RandomWeapon((167,-1775,-124),(0,105,0));
	Ammo((-56,-1799,-120),(0,100,0));
	Power3((88,-2355,-119),(0,120,0));
	DoublePoints((314,-2309,-124),(0,131,0));
	Gambler((960,-1661,-51),(0,90,0));
}

Skidrow()
{
	CreateWalls((-760.1, -918.8, 12.1), (-760.1, -918.8, 100.9));
	CreateWalls((-856.2, 343.4, 152.1), (-856.8, 235.9, 235.9));
	CreateWalls((-152.7, 719.5, 101.2), (55.9, 722.2, 236.8));
	CreateWalls((-266.6, -720.1, 16.1), (-266.6, -767.9, 100.0));
	CreateWalls((-2.1, -1840.1, 16.1), (-5.5, -1935.7, 111.8));
	CreateWalls((-647.9, -1676.0, 152.1), (-536.1, -1676.3, 253.9));
	RandomWeapon((-2000.1,-366.9,144.1),(0,90,0));
	Power3((-923.7,217.4,152.1),(0,0,0));
	DoublePoints((-2082.8,-1556.8,-39.9),(0,0,0));
	Ammo((-2281.3,267.9,32.1),(0,0,0));
	Gambler((-2496.9,-433.0,139.1),(0,90,0));
}

Skidrow2()
{
	CreateWalls((-760,-918,12),(-760, -918, 100));
	CreateWalls((-856,343,152),(-856, 235, 235));
	CreateWalls((-152,719,101),(55, 722, 236));
	CreateWalls((-266,-720,16),(-266, -767, 100.0));
	CreateWalls((-685,-1840,16),(-684,-1935,111));
	CreateWalls((-647,-1676,152),(-536, -1676, 253));
	CreateWalls((-197,-275,200),(-200,-448,263));
	CreateBlocks((-126,-458,214),(0, 0, 0));
	RandomWeapon((1965,-500,16),(0,90,0));
	Power3((-185,96,16),(0,90,0));
	DoublePoints((-2082,-1556,-39),(0,0,0));
	Ammo((1772,-284,16),(0,0,0));
	Gambler((1818,-185,227),(0,0,0));
}

Skidrow3()
{
	CreateWalls((2057,-3601,0),(1576,-3623,200));
	CreateBlocks((2032,-833,16),(0,180,0));
	CreateBlocks((2032,-833,50),(0,180,0));
	CreateBlocks((2032,-833,100),(0,180,0));
	RandomWeapon((2040,-1266,16),(0,90,0));
	Power3((1584,-1842,16),(0,90,0));
	DoublePoints((1825,-1967,8),(0,0,0));
	Ammo((1608,-1247,8),(0,90,0));
	Gambler((1792,-1580,8),(0,90,0));
}

SubBase()
{
	RandomWeapon((-208,-4142,27),(0,90,0));
	Ammo((-495,-4193,17),(0,90,0));
	LastStandPro((-215,-4328,22),(0,90,0));
	Gambler((-488,-4360,25),(0,90,0));
}

Terminal()
{
	CreateWalls((2295, 4425, 210), (2695, 4435, 400.2));
	CreateBlocks((2209,4257,315),(0,180,0));
	CreateBlocks((1453,4440,315),(0,0,0));
	CreateBlocks((1505,4439,315),(0,0,0));
	RandomWeapon((1840,4339,179),(0,90,0));
	Power3((1658,2948,195),(0,190,0));
	DoublePoints((2038,3294,136),(0,316,0));
	Ammo((715,2893,56),(0,0,0));
	Gambler((610,4202,218),(0,180,0));
	CreateWalls((1802,4782, 216),(605, 4781, 267));
	CreateWalls((407,4646, 207),(304, 4648, 293));
	CreateWalls((1858,4435, 324),(1858, 4046, 419));
	CreateWalls((1858,3935, 326),(1858, 3554, 418));
	CreateWalls((1913,3429, 200),(2151, 3191, 295));
}

Underpass()
{
	RandomWeapon((3975,2304,400),(0,90,0));
	Power3((3655,1726,400),(0,0,0));
	DoublePoints((3514,2015,400),(0,132,0));
	Ammo((3545,1552,400),(0,90,0));
	Gambler((3691,2508,400),(0,90,0));
	CreateWalls((4113,3144,432),(4129,3448,500));
	CreateWalls((4129,3448,432),(4008,3468,500));
	CreateWalls((3669,2446,400),(3426,2553,500));
	CreateWalls((3414,2536,400),(3659,2529,500));
	CreateWalls((3426,2553,400),(3414,2536,500));
	CreateWalls((3669,2446,400),(3659,2529,500));
}

Bailout()
{
	RandomWeapon((2717,-2032,1051),(0,0,0));
	Power3((2620,-1948,1051),(0,90,0));
	DoublePoints((2624,-1767,1051),(0,90,0));
	Ammo((2918,-1806,1056),(0,0,0));
	Gambler((3164,-1666,1056),(0,90,0));
}

Carnival()
{
	RandomWeapon((-2779,2928,3),(0,54,0));
	Power3((-2339,2609,3),(0,50,0));
	DoublePoints((-2319,1661,3),(0,140,0));
	Ammo((-2307,3170,3),(0,234,0));
	Gambler((-1759,2968,3),(0,138,0));
	TriggerSolid((-2944,3684,3),(0,0,0),0,100,200);
}

Wasteland()
{
	RandomWeapon((10113,7044,358),(0,90,0));
	Power3((10113,7198,358),(0,90,0));
	DoublePoints((10113,7327,358),(0,90,0));
	Ammo((9480,6527,358),(0,90,0));
	Ammo((10901,7439,1481),(0,0,0));
	Gambler((10113,8312,358),(0,90,0));
	CreateWalls((10694,6956,1545),(10693,7477,1600));
}

Carnaval()
{
	/* NOTHING BECAUSE OF OUT OF MAP! */
}
	
Overgrown()
{
	/* Created by maarten551 */ CreateRamps((1096, -4260, -13), (500, -4388, 109));
	CreateGrids((500, -4200, 114), (143, -4667, 114), (0, 0, 0));
	CreateWalls((500, -4200, 114), (143, -4200, 275));
	/* Door Stuff */ CreateWalls((500, -4200, 114), (500, -4301, 160));
	CreateWalls((500, -4667, 114), (500, -4489, 160));
	CreateWalls((500, -4200, 220), (500, -4667, 275));
	CreateDoors((510, -4301, 120), (500, -4400, 120),(90, 0, 0), 5, 2, 15, 75);
	/* End Door Stuff */ CreateWalls((143, -4667, 114), (500, -4667, 275));
	CreateWalls((143, -4667, 114), (143, -4200, 275));
}

Trailerpark()
{
	RandomWeapon((271.1,-2360.1,11.1),(0,90,0));
	Ammo((2739.8,-2575.6,18.1),(0,90,0));
	Power3((-232.8,-1456.2,11.3),(0,0,0));
	DoublePoints((773.1,-2683.9,20.1),(0,0,0));
	Gambler((977.1,-2744.9,11.1),(0,90,0));
}

Vacant()
{
	RandomWeapon((445,1526,-96),(0,0,0));
	Ammo((-241,692,-31),(0,0,0));
	Power3((-1659,208,-91),(0,90,0));
	DoublePoints((-539,86,-36),(0,90,0));
	Gambler((-828,-261,-37),(0,90,0));
	CreateWalls((-846,-503,-8),(-849,-384,50));
	CreateWalls((-520,16,-31),(-518,-96,50));
	CreateWalls((-848,640,-8),(-846,520,50));
	CreateWalls((-4,677,-32),(-52,675,50));
	CreateWalls((72,959,-32),(73,848,46));
	CreateWalls((343,-880,-32),(346,-928,50));
}

Storm()
{
	RandomWeapon((3465,-975,-52),(0,0,0));
	Ammo((4207,-1009,-52),(0,90,0));
	Power3((4646,-975,-52),(0,0,0));
	DoublePoints((5040,-1235,-52),(0,90,0));
	Gambler((4826,-1328,-52),(0,0,0));
	CreateWalls((4700,-62,8),(4737,-59,100));
	CreateWalls((2163,-843,8),(2120,-842,100));
	CreateWalls((5088,-1360,8),(5004,-1347,100));
}

Salvage()
{
	RandomWeapon((2250.3,3311.6,63.7),(0,0,0));
	Ammo((1644.0,3350.7,87.4),(0,0,0));
	Power3((1608.1,2025.3,152.1),(0,90,0));
	DoublePoints((2103.8,2230.2,16.1),(0,90,0));
	Gambler((1801.2,2000.1,16.1),(0,0,0));
	CreateBlocks((3505.8,2665.8,11.1),(0,0,0));
	CreateBlocks((3505.8,2665.8,51.1),(0,0,0));
	CreateBlocks((3505.8,2665.8,91.1),(0,0,0));
	CreateBlocks((2044.4,1984.2,42.1),(0,0,0));
	CreateBlocks((1998.0,1986.2,42.1),(0,0,0));
	CreateBlocks((1846.3,1989.2,178.1),(0,0,0));
	CreateBlocks((1787.8,1982.3,178.1),(0,0,0));
	CreateBlocks((1595.5,2060.3,45.1),(0,90,0));
	CreateWalls((1936.1,2335.9,300.9),(2487.9,2339.0,0.8));
	CreateWalls((984.1,2623.8,96.1),(1095.9,2614.9,202.4));
}

Strike()
{
	RandomWeapon((-2199,1240,31),(0,0,0));
	Ammo((-2185,1615,24),(0,0,0));
	Power3((-3116,1240,20),(0,0,0));
	DoublePoints((-3959,1380,16),(0,90,0));
	Gambler((-2577,1615,24),(0,0,0));
	CreateWalls((-3538,1216,32),(-3959,1211,128));
	CreateWalls((-3530,1627,16),(-3959,1621,128));
}

RandomBoxDeleteOnWeaponNoTake()
{
	level endon("disconnect");
	level endon("stopspawner");
	{
		level waittill ("endrandom");
		level.wep MoveTo(level.wep.origin+(0,0,-30), 12);
		wait 12;
		level notify("box_move");
		level notify("box");
		level.block delete();
		level.block.headIcon destroy();
		level.block.trigger delete();
		level.wep delete();
		if(getDvar("mapname") == "mp_derail" && level.box >= 6 && level.boxposition == 0)
		{
			level thread BoxSwitchDerail();
		}
		else if(getDvar("mapname") == "mp_derail" && level.box <= 6 && level.boxposition == 0)
		{
			RandomWeapon((1790,3371,294),(0,0,0));
		}
		if(getDvar("mapname") == "mp_derail" && level.box >= 6 && level.boxposition == 1)
		{
			level thread BoxSwitchDerail();
		}
		else if(getDvar("mapname") == "mp_derail" && level.box <= 6 && level.boxposition == 1)
		{
			RandomWeapon((2191,2949,158),(0,90,0));
		}
		if(getDvar("mapname") == "mp_derail" && level.box >= 6 && level.boxposition == 2)
		{
			level thread BoxSwitchDerail();
		}
		else if(getDvar("mapname") == "mp_derail" && level.box <= 6 && level.boxposition == 2)
		{
			RandomWeapon((1901,2060,294),(0,0,0));
		}
		if(getDvar("mapname") == "mp_nightshift" && level.box >= 5 && level.boxposition == 0 && level.edit == 2)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(getDvar("mapname") == "mp_nightshift" && level.box <= 5 && level.boxposition == 0 && level.edit == 2)
		{
			RandomWeapon((2040,-1266,16),(0,90,0));
		}
		if(getDvar("mapname") == "mp_nightshift" && level.box >= 5 && level.boxposition == 1 && level.edit == 2)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(getDvar("mapname") == "mp_nightshift" && level.box <= 5 && level.boxposition == 1 && level.edit == 2)
		{
			RandomWeapon((1590,-1393,8),(0,90,0));
		}
		if(getDvar("mapname") == "mp_nightshift" && level.box >= 5 && level.boxposition == 2 && level.edit == 2)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(getDvar("mapname") == "mp_nightshift" && level.box <= 5 && level.boxposition == 2 && level.edit == 2)
		{
			RandomWeapon((1830,-2360,4),(0,0,0));
		}
		if(getDvar("mapname") == "mp_nightshift" && level.box >= 5 && level.boxposition == 0 && level.edit == 1)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(getDvar("mapname") == "mp_nightshift" && level.box <= 5 && level.boxposition == 0 && level.edit == 1)
		{
			RandomWeapon((1965,-500,16),(0,90,0));
		}
		if(getDvar("mapname") == "mp_nightshift" && level.box >= 5 && level.boxposition == 1 && level.edit == 1)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(getDvar("mapname") == "mp_nightshift" && level.box <= 5 && level.boxposition == 1 && level.edit == 1)
		{
			RandomWeapon((1574,426,24),(0,90,0));
		}
		if(getDvar("mapname") == "mp_nightshift" && level.box >= 5 && level.boxposition == 2 && level.edit == 1)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(getDvar("mapname") == "mp_nightshift" && level.box <= 5 && level.boxposition == 2 && level.edit == 1)
		{
			RandomWeapon((505,-734,11),(0,90,0));
		}
		if(getDvar("mapname") == "mp_nightshift" && level.box >= 6 && level.boxposition == 3 && level.edit == 1)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(getDvar("mapname") == "mp_nightshift" && level.box <= 6 && level.boxposition == 3 && level.edit == 1)
		{
			RandomWeapon((865,-2096,43),(0,180,0));
		}
		if(getDvar("mapname") == "mp_nightshift" && level.box >= 6 && level.boxposition == 4 && level.edit == 1)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(getDvar("mapname") == "mp_nightshift" && level.box <= 6 && level.boxposition == 4 && level.edit == 1)
		{
			RandomWeapon((1631,-770,119),(0,90,0));
		}
		if(getDvar("mapname") == "mp_nightshift" && level.box >= 6 && level.boxposition == 0 && level.edit == 0)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(getDvar("mapname") == "mp_nightshift" && level.box <= 6 && level.boxposition == 0 && level.edit == 0)
		{
			RandomWeapon((-2000.1,-366.9,144.1),(0,90,0));
		}
		if(getDvar("mapname") == "mp_nightshift" && level.box >= 6 && level.boxposition == 1 && level.edit == 0)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(getDvar("mapname") == "mp_nightshift" && level.box < 6 && level.boxposition == 1 && level.edit == 0)
		{
			RandomWeapon((-2356.7,-912.9,139.1),(0,0,0));
		}
		if(getDvar("mapname") == "mp_nightshift" && level.box >= 6 && level.boxposition == 2 && level.edit == 0)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(getDvar("mapname") == "mp_nightshift" && level.box <= 6 && level.boxposition == 2 && level.edit == 0)
		{
			RandomWeapon((-1176.0,-1986.6,11.1),(0,180,0));
		}
		if(getDvar("mapname") == "mp_nightshift" && level.box >= 6 && level.boxposition == 3 && level.edit == 0)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(getDvar("mapname") == "mp_nightshift" && level.box <= 6 && level.boxposition == 3 && level.edit == 0)
		{
			RandomWeapon((-1432.0,-192.9,3.1),(0,180,0));
		}
		if(getDvar("mapname") == "mp_nightshift" && level.box >= 6 && level.boxposition == 4 && level.edit == 0)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(getDvar("mapname") == "mp_nightshift" && level.box <= 6 && level.boxposition == 4 && level.edit == 0)
		{
			RandomWeapon((-1414.8,-1984.9,3.1),(0,180,0));
		}
		if(getDvar("mapname") == "mp_rust" && level.edit == 0)
		{
			RandomWeapon((2749,-9489,-271),(0,-25.1,0));
		}
		if(getDvar("mapname") == "mp_rust" && level.edit == 1)
		{
			RandomWeapon((1138,-5393,-255),(0,0,0));
		}
		if(getDvar("mapname") == "mp_afghan" && level.box >= 4 && level.boxposition == 0)
		{
			level thread BoxSwitchAfghan();
		}
		else if(getDvar("mapname") == "mp_afghan" && level.box <= 4 && level.boxposition == 0)
		{
			RandomWeapon((-1672,-1081,-1444),(0,44,0));
		}
		if(getDvar("mapname") == "mp_afghan" && level.box >= 4 && level.boxposition == 1)
		{
			level thread BoxSwitchAfghan();
		}
		else if(getDvar("mapname") == "mp_afghan" && level.box <= 4 && level.boxposition == 1)
		{
			RandomWeapon((-3434,1581,-1443),(0,115,0));
		}
		if(getDvar("mapname") == "mp_afghan" && level.box >= 4 && level.boxposition == 2)
		{
			level thread BoxSwitchAfghan();
		}
		else if(getDvar("mapname") == "mp_afghan" && level.box <= 5 && level.boxposition == 2)
		{
			RandomWeapon((-2629,-267,-1439),(0,79,0));
		}
		if(getDvar("mapname") == "mp_afghan" && level.box >= 4 && level.boxposition == 3)
		{
			level thread BoxSwitchAfghan();
		}
		else if(getDvar("mapname") == "mp_afghan" && level.box <= 5 && level.boxposition == 3)
		{
			RandomWeapon((-2755,-1177,-1440),(0,73,0));
		}
		if(getDvar("mapname") == "mp_highrise" && level.edit == 0 && level.box >= 5 && level.boxposition == 0)
		{
			level thread BoxSwitchHighrise();
		}
		else if(getDvar("mapname") == "mp_highrise" && level.edit == 0 && level.box <= 5 && level.boxposition == 0)
		{
			RandomWeapon((-8060.7,6789.3,2331.1),(0,0,0));
		}
		if(getDvar("mapname") == "mp_highrise" && level.edit == 0 && level.box >= 5 && level.boxposition == 1)
		{
			level thread BoxSwitchHighrise();
		}
		else if(getDvar("mapname") == "mp_highrise" && level.edit == 0 && level.box <= 5 && level.boxposition == 1)
		{
			RandomWeapon((-9049.5,6786.7,2331.1),(0,0,0));
		}
		if(getDvar("mapname") == "mp_highrise" && level.edit == 0 && level.box >= 5 && level.boxposition == 2)
		{
			level thread BoxSwitchHighrise();
		}
		else if(getDvar("mapname") == "mp_highrise" && level.edit == 0 && level.box <= 5 && level.boxposition == 2)
		{
			RandomWeapon((-8942.2,4284.3,2331.1),(0,225,0));
		}
		if(getDvar("mapname") == "mp_highrise" && level.edit == 0 && level.box >= 5 && level.boxposition == 3)
		{
			level thread BoxSwitchHighrise();
		}
		else if(getDvar("mapname") == "mp_highrise" && level.edit == 0 && level.box <= 5 && level.boxposition == 3)
		{
			RandomWeapon((-9248.9,5427.1,2331.1),(0,90,0));
		}
		if(getDvar("mapname") == "mp_highrise" && level.edit == 1 && level.box >= 6 && level.boxposition == 0)
		{
			level thread BoxSwitchHighrise2();
		}
		else if(getDvar("mapname") == "mp_highrise" && level.edit == 1 && level.box <= 6 && level.boxposition == 0)
		{
			RandomWeapon((-13630.1,3855.1,5439.1),(0,0,0));
		}
		if(getDvar("mapname") == "mp_highrise" && level.edit == 1 && level.box >= 6 && level.boxposition == 1)
		{
			level thread BoxSwitchHighrise2();
		}
		else if(getDvar("mapname") == "mp_highrise" && level.edit == 1 && level.box <= 6 && level.boxposition == 1)
		{
			RandomWeapon((-14032.2,7520.0,5391.1),(0,35,0));
		}
		if(getDvar("mapname") == "mp_highrise" && level.edit == 1 && level.box >= 6 && level.boxposition == 2)
		{
			level thread BoxSwitchHighrise2();
		}
		else if(getDvar("mapname") == "mp_highrise" && level.edit == 1 && level.box <= 6 && level.boxposition == 2)
		{
			RandomWeapon((-15771.6,6051.3,5439.1),(0,90,0));
		}
		if(getDvar("mapname") == "mp_highrise" && level.edit == 1 && level.box >= 6 && level.boxposition == 3)
		{
			level thread BoxSwitchHighrise2();
		}
		else if(getDvar("mapname") == "mp_highrise" && level.edit == 1 && level.box <= 6 && level.boxposition == 3)
		{
			RandomWeapon((-14614.7,7443.9,5386.1),(0,33,0));
		}
		if(getDvar("mapname") == "mp_invasion")
		{
			RandomWeapon((2335,12023,11),(0,90,0));
		}
		if(getDvar("mapname") == "mp_favela")
		{
			RandomWeapon((1873,2458,296),(0,207,0));
		}
		if(getDvar("mapname") == "mp_checkpoint")
		{
			RandomWeapon((2740,2738,8),(0,90,0));
		}
		if(getDvar("mapname") == "mp_quarry")
		{
			RandomWeapon((-1462.1,2046.0,171.1),(0,90,0));
		}
		if(getDvar("mapname") == "mp_subbase")
		{
			RandomWeapon((-208,-4142,27),(0,90,0));
		}
		if(getDvar("mapname") == "mp_strike")
		{
			RandomWeapon((-2199,1240,31),(0,0,0));
		}
		if(getDvar("mapname") == "mp_vacant")
		{
			RandomWeapon((445,1526,-96),(0,0,0));
		}
		if(getDvar("mapname") == "mp_underpass")
		{
			RandomWeapon((3975,2304,400),(0,90,0));
		}
		if(getDvar("mapname") == "mp_rundown")
		{
			RandomWeapon((1407,2651,77),(0,0,0));
		}
		if(getDvar("mapname") == "mp_fuel2")
		{
			RandomWeapon((16183,28529,7212),(0,0,0));
		}
		if(getDvar("mapname") == "mp_storm")
		{
			RandomWeapon((3465,-975,-52),(0,0,0));
		}
		if(getDvar("mapname") == "mp_estate")
		{
			RandomWeapon((-3191,-1275,-527),(0,121,0));
		}
		if(getDvar("mapname") == "mp_boneyard")
		{
			RandomWeapon((167,-1775,-124),(0,80,0));
		}
		if(getDvar("mapname") == "mp_terminal")
		{
			RandomWeapon((1840,4339,179),(0,90,0));
		}
		if(getDvar("mapname") == "mp_brecourt")
		{
			RandomWeapon((10113,7044,358),(0,90,0));
		}
		if(getDvar("mapname") == "mp_overgrown")
		{
			RandomWeapon((1284,2651,-157),(0,90,0));
		}
		if(getDvar("mapname") == "mp_compact")
		{
			RandomWeapon((2250.3,3311.6,63.7),(0,0,0));
		}
		if(getDvar("mapname") == "mp_crash")
		{
			RandomWeapon((-1239,-2646,86),(0,90,0));
		}
		if(getDvar("mapname") == "mp_abandon")
		{
			RandomWeapon((-2779,2928,3),(0,54,0));
		}
		if(getDvar("mapname") == "mp_complex")
		{
			RandomWeapon((2717,-2032,1051),(0,0,0));
		}
		if(getDvar("mapname") == "mp_trailerpark")
		{
			RandomWeapon((271.1,-2360.1,11.1),(0,90,0));
		}
		wait 1;
	}
}

RandomBoxDeleteOnWeaponTake()
{

	{
		level endon("disconnect");
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
		if(getDvar("mapname") == "mp_derail" && level.box >= 6 && level.boxposition == 0)
		{
			level thread BoxSwitchDerail();
		}
		else if(getDvar("mapname") == "mp_derail" && level.box <= 6 && level.boxposition == 0)
		{
			RandomWeapon((1790,3371,294),(0,0,0));
		}
		if(getDvar("mapname") == "mp_derail" && level.box >= 6 && level.boxposition == 1)
		{
			level thread BoxSwitchDerail();
		}
		else if(getDvar("mapname") == "mp_derail" && level.box <= 6 && level.boxposition == 1)
		{
			RandomWeapon((2191,2949,158),(0,90,0));
		}
		if(getDvar("mapname") == "mp_derail" && level.box >= 6 && level.boxposition == 2)
		{
			level thread BoxSwitchDerail();
		}
		else if(getDvar("mapname") == "mp_derail" && level.box <= 6 && level.boxposition == 2)
		{
			RandomWeapon((1901,2060,294),(0,0,0));
		}
		if(getDvar("mapname") == "mp_nightshift" && level.box >= 5 && level.boxposition == 0 && level.edit == 2)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(getDvar("mapname") == "mp_nightshift" && level.box <= 5 && level.boxposition == 0 && level.edit == 2)
		{
			RandomWeapon((2040,-1266,16),(0,90,0));
		}
		if(getDvar("mapname") == "mp_nightshift" && level.box >= 5 && level.boxposition == 1 && level.edit == 2)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(getDvar("mapname") == "mp_nightshift" && level.box <= 5 && level.boxposition == 1 && level.edit == 2)
		{
			RandomWeapon((1590,-1393,8),(0,90,0));
		}
		if(getDvar("mapname") == "mp_nightshift" && level.box >= 5 && level.boxposition == 2 && level.edit == 2)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(getDvar("mapname") == "mp_nightshift" && level.box <= 5 && level.boxposition == 2 && level.edit == 2)
		{
			RandomWeapon((1830,-2360,4),(0,0,0));
		}
		if(getDvar("mapname") == "mp_nightshift" && level.box >= 5 && level.boxposition == 0 && level.edit == 1)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(getDvar("mapname") == "mp_nightshift" && level.box <= 5 && level.boxposition == 0 && level.edit == 1)
		{
			RandomWeapon((1965,-500,16),(0,90,0));
		}
		if(getDvar("mapname") == "mp_nightshift" && level.box >= 5 && level.boxposition == 1 && level.edit == 1)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(getDvar("mapname") == "mp_nightshift" && level.box <= 5 && level.boxposition == 1 && level.edit == 1)
		{
			RandomWeapon((1574,426,24),(0,90,0));
		}
		if(getDvar("mapname") == "mp_nightshift" && level.box >= 5 && level.boxposition == 2 && level.edit == 1)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(getDvar("mapname") == "mp_nightshift" && level.box <= 5 && level.boxposition == 2 && level.edit == 1)
		{
			RandomWeapon((505,-734,11),(0,90,0));
		}
		if(getDvar("mapname") == "mp_nightshift" && level.box >= 6 && level.boxposition == 3 && level.edit == 1)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(getDvar("mapname") == "mp_nightshift" && level.box <= 6 && level.boxposition == 3 && level.edit == 1)
		{
			RandomWeapon((865,-2096,43),(0,180,0));
		}
		if(getDvar("mapname") == "mp_nightshift" && level.box >= 6 && level.boxposition == 4 && level.edit == 1)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(getDvar("mapname") == "mp_nightshift" && level.box <= 6 && level.boxposition == 4 && level.edit == 1)
		{
			RandomWeapon((1631,-770,119),(0,90,0));
		}
		if(getDvar("mapname") == "mp_nightshift" && level.box >= 6 && level.boxposition == 0 && level.edit == 0)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(getDvar("mapname") == "mp_nightshift" && level.box <= 6 && level.boxposition == 0 && level.edit == 0)
		{
			RandomWeapon((-2000.1,-366.9,144.1),(0,90,0));
		}
		if(getDvar("mapname") == "mp_nightshift" && level.box >= 6 && level.boxposition == 1 && level.edit == 0)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(getDvar("mapname") == "mp_nightshift" && level.box < 6 && level.boxposition == 1 && level.edit == 0)
		{
			RandomWeapon((-2356.7,-912.9,139.1),(0,0,0));
		}
		if(getDvar("mapname") == "mp_nightshift" && level.box >= 6 && level.boxposition == 2 && level.edit == 0)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(getDvar("mapname") == "mp_nightshift" && level.box <= 6 && level.boxposition == 2 && level.edit == 0)
		{
			RandomWeapon((-1176.0,-1986.6,11.1),(0,180,0));
		}
		if(getDvar("mapname") == "mp_nightshift" && level.box >= 6 && level.boxposition == 3 && level.edit == 0)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(getDvar("mapname") == "mp_nightshift" && level.box <= 6 && level.boxposition == 3 && level.edit == 0)
		{
			RandomWeapon((-1432.0,-192.9,3.1),(0,180,0));
		}
		if(getDvar("mapname") == "mp_nightshift" && level.box >= 6 && level.boxposition == 4 && level.edit == 0)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(getDvar("mapname") == "mp_nightshift" && level.box <= 6 && level.boxposition == 4 && level.edit == 0)
		{
			RandomWeapon((-1414.8,-1984.9,3.1),(0,180,0));
		}
		if(getDvar("mapname") == "mp_rust" && level.edit == 0)
		{
			RandomWeapon((2749.3,-9489.3,-271.5),(0,-25.1,0));
		}
		if(getDvar("mapname") == "mp_rust" && level.edit == 1)
		{
			RandomWeapon((1138,-5393,-255),(0,0,0));
		}
		if(getDvar("mapname") == "mp_afghan" && level.box >= 4 && level.boxposition == 0)
		{
			level thread BoxSwitchAfghan();
		}
		else if(getDvar("mapname") == "mp_afghan" && level.box <= 4 && level.boxposition == 0)
		{
			RandomWeapon((-1672,-1081,-1444),(0,44,0));
		}
		if(getDvar("mapname") == "mp_afghan" && level.box >= 4 && level.boxposition == 1)
		{
			level thread BoxSwitchAfghan();
		}
		else if(getDvar("mapname") == "mp_afghan" && level.box <= 4 && level.boxposition == 1)
		{
			RandomWeapon((-3434,1581,-1443),(0,115,0));
		}
		if(getDvar("mapname") == "mp_afghan" && level.box >= 4 && level.boxposition == 2)
		{
			level thread BoxSwitchAfghan();
		}
		else if(getDvar("mapname") == "mp_afghan" && level.box <= 5 && level.boxposition == 2)
		{
			RandomWeapon((-2629,-267,-1439),(0,79,0));
		}
		if(getDvar("mapname") == "mp_afghan" && level.box >= 4 && level.boxposition == 3)
		{
			level thread BoxSwitchAfghan();
		}
		else if(getDvar("mapname") == "mp_afghan" && level.box <= 5 && level.boxposition == 3)
		{
			RandomWeapon((-2755,-1177,-1440),(0,73,0));
		}
		if(getDvar("mapname") == "mp_highrise" && level.edit == 0 && level.box >= 5 && level.boxposition == 0)
		{
			level thread BoxSwitchHighrise();
		}
		else if(getDvar("mapname") == "mp_highrise" && level.edit == 0 && level.box <= 5 && level.boxposition == 0)
		{
			RandomWeapon((-8060.7,6789.3,2331.1),(0,0,0));
		}
		if(getDvar("mapname") == "mp_highrise" && level.edit == 0 && level.box >= 5 && level.boxposition == 1)
		{
			level thread BoxSwitchHighrise();
		}
		else if(getDvar("mapname") == "mp_highrise" && level.edit == 0 && level.box <= 5 && level.boxposition == 1)
		{
			RandomWeapon((-9049.5,6786.7,2331.1),(0,0,0));
		}
		if(getDvar("mapname") == "mp_highrise" && level.edit == 0 && level.box >= 5 && level.boxposition == 2)
		{
			level thread BoxSwitchHighrise();
		}
		else if(getDvar("mapname") == "mp_highrise" && level.edit == 0 && level.box <= 5 && level.boxposition == 2)
		{
			RandomWeapon((-8942.2,4284.3,2331.1),(0,225,0));
		}
		if(getDvar("mapname") == "mp_highrise" && level.edit == 0 && level.box >= 5 && level.boxposition == 3)
		{
			level thread BoxSwitchHighrise();
		}
		else if(getDvar("mapname") == "mp_highrise" && level.edit == 0 && level.box <= 5 && level.boxposition == 3)
		{
			RandomWeapon((-9248.9,5427.1,2331.1),(0,90,0));
		}
		if(getDvar("mapname") == "mp_highrise" && level.edit == 1 && level.box >= 6 && level.boxposition == 0)
		{
			level thread BoxSwitchHighrise2();
		}
		else if(getDvar("mapname") == "mp_highrise" && level.edit == 1 && level.box <= 6 && level.boxposition == 0)
		{
			RandomWeapon((-13630.1,3855.1,5439.1),(0,0,0));
		}
		if(getDvar("mapname") == "mp_highrise" && level.edit == 1 && level.box >= 6 && level.boxposition == 1)
		{
			level thread BoxSwitchHighrise2();
		}
		else if(getDvar("mapname") == "mp_highrise" && level.edit == 1 && level.box <= 6 && level.boxposition == 1)
		{
			RandomWeapon((-14032.2,7520.0,5391.1),(0,35,0));
		}
		if(getDvar("mapname") == "mp_highrise" && level.edit == 1 && level.box >= 6 && level.boxposition == 2)
		{
			level thread BoxSwitchHighrise2();
		}
		else if(getDvar("mapname") == "mp_highrise" && level.edit == 1 && level.box <= 6 && level.boxposition == 2)
		{
			RandomWeapon((-15771.6,6051.3,5439.1),(0,90,0));
		}
		if(getDvar("mapname") == "mp_highrise" && level.edit == 1 && level.box >= 6 && level.boxposition == 3)
		{
			level thread BoxSwitchHighrise2();
		}
		else if(getDvar("mapname") == "mp_highrise" && level.edit == 1 && level.box <= 6 && level.boxposition == 3)
		{
			RandomWeapon((-14614.7,7443.9,5386.1),(0,33,0));
		}
		if(getDvar("mapname") == "mp_invasion")
		{
			RandomWeapon((2335,12023,11),(0,90,0));
		}
		if(getDvar("mapname") == "mp_favela")
		{
			RandomWeapon((1873,2458,296),(0,207,0));
		}
		if(getDvar("mapname") == "mp_checkpoint")
		{
			RandomWeapon((2740,2738,8),(0,90,0));
		}
		if(getDvar("mapname") == "mp_quarry")
		{
			RandomWeapon((-1462.1,2046.0,171.1),(0,90,0));
		}
		if(getDvar("mapname") == "mp_subbase")
		{
			RandomWeapon((-208,-4142,27),(0,90,0));
		}
		if(getDvar("mapname") == "mp_strike")
		{
			RandomWeapon((-2199,1240,31),(0,0,0));
		}
		if(getDvar("mapname") == "mp_vacant")
		{
			RandomWeapon((445,1526,-96),(0,0,0));
		}
		if(getDvar("mapname") == "mp_underpass")
		{
			RandomWeapon((3975,2304,400),(0,90,0));
		}
		if(getDvar("mapname") == "mp_rundown")
		{
			RandomWeapon((1407,2651,77),(0,0,0));
		}
		if(getDvar("mapname") == "mp_fuel2")
		{
			RandomWeapon((16183,28529,7212),(0,0,0));
		}
		if(getDvar("mapname") == "mp_storm")
		{
			RandomWeapon((3465,-975,-52),(0,0,0));
		}
		if(getDvar("mapname") == "mp_estate")
		{
			RandomWeapon((-3191,-1275,-527),(0,121,0));
		}
		if(getDvar("mapname") == "mp_boneyard")
		{
			RandomWeapon((167,-1775,-124),(0,80,0));
		}
		if(getDvar("mapname") == "mp_terminal")
		{
			RandomWeapon((1840,4339,179),(0,90,0));
		}
		if(getDvar("mapname") == "mp_brecourt")
		{
			RandomWeapon((10113,7044,358),(0,90,0));
		}
		if(getDvar("mapname") == "mp_overgrown")
		{
			RandomWeapon((1284,2651,-157),(0,90,0));
		}
		if(getDvar("mapname") == "mp_compact")
		{
			RandomWeapon((2250.3,3311.6,63.7),(0,0,0));
		}
		if(getDvar("mapname") == "mp_crash")
		{
			RandomWeapon((-1239,-2646,86),(0,90,0));
		}
		if(getDvar("mapname") == "mp_abandon")
		{
			RandomWeapon((-2779,2928,3),(0,54,0));
		}
		if(getDvar("mapname") == "mp_complex")
		{
			RandomWeapon((2717,-2032,1051),(0,0,0));
		}
		if(getDvar("mapname") == "mp_trailerpark")
		{
			RandomWeapon((271.1,-2360.1,11.1),(0,90,0));
		}
		wait 1;
	}
}

PowerSpawner()
{
	level endon("disconnect");
	wait 1;
	Announcement("^2Power Activated!");
	wait 3.0;
	if(getDvar("mapname") == "mp_rust" && level.edit == 0)
	{
		CreateRamps((2314,-9299,-287),(2654,-8577,-287));
		Upgrade((2649,-8583,-261),(0,90,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText( "Upgrade Has Spawned" );
		}
		wait 3.0;
		SpeedReload((1637.8,-9032.8,-274.2),(0,341.8,0));
		SteadyAim((2176.6,-9246.8,-274.8),(0,335.1,0));
		StoppingPower((3161.6,-10811.7,-176.2),(0,206.2,0));
		Speedy((756.5,-10078.5,-89.8),(0,180,0));
		Health((-161.8,-10090.0,-155.0),(0,177.6,0));
		AmmOMatic((1885,-10492,-216),(0,138,0));
		LastStandPro((1673,-10304,-187),(0,140,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText2( "Perks Have Spawned" );
		}
		wait 3.0;
	}
	if(getDvar("mapname") == "mp_rust" && level.edit == 1)
	{
		Upgrade((1580,-4481,-147),(0,0,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText( "Upgrade Has Spawned" );
		}
		wait 3.0;
		SpeedReload((914,-5550,-255),(0,90,0));
		Health((1353,-5549,-255),(0,90,0));
		LastStandPro((1317,-6359,-255),(0,90,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText2( "Perks Have Spawned" );
		}
		wait 3.0;
	}
	if(getDvar("mapname") == "mp_afghan")
	{
		Upgrade((-2841,-394,-1332),(0,120,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText( "Upgrade Has Spawned" );
		}
		wait 3.0;
		SpeedReload((-2502,-13,-1444),(0,7,0));
		SteadyAim((-2863,-195,-1445),(0,246,0));
		StoppingPower((-3420,379,-1448),(0,280,0));
		Speedy((-3499,920,-1448),(0,282,0));
		Health((-3822,1390,-1448),(0,185,0));
		AmmOMatic((-3481,-342,-1448),(0,8,0));
		LastStandPro((-3541,-511,-1448),(0,343,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText2( "Perks Have Spawned" );
		}
		wait 3.0;
	}
	if(getDvar("mapname") == "mp_highrise" && level.edit == 0)
	{
		Upgrade((-8493.3,5516.3,2331.1),(0,0,0),(-8491,5565,2331));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText( "Upgrade Has Spawned" );
		}
		wait 3.0;
		SpeedReload((-8487.1,5452.1,2331.1),(0,0,0));
		SteadyAim((-8791.6,5474.1,2331.1),(0,90,0));
		StoppingPower((-8666.7,5587.1,2331.1),(0,0,0));
		Speedy((-8642.2,5469.6,2331.1),(0,90,0));
		Health((-8767.5,5348.4,2331.1),(0,0,0));
		AmmOMatic((-9728,6049,2331),(0,90,0));
		LastStandPro((-8443,5731,2331),(0,0,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText2( "Perks Have Spawned" );
		}
		wait 3.0;
	}
	if(getDvar("mapname") == "mp_highrise" && level.edit == 1)
	{
		Upgrade((-14434.5,4573.5,5439.1),(0,0,0),(-14432,4534,5434));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText( "Upgrade Has Spawned" );
		}
		wait 3.0;
		SpeedReload((-12757.6,4033.2,5439.1),(0,90,0));
		SteadyAim((-12757.6,4232.4,5439.1),(0,90,0));
		StoppingPower((-12757.6,4373.7,5439.1),(0,90,0));
		Speedy((-12757.6,4640.9,5439.1),(0,90,0));
		Health((-12757.6,5044.7,5439.1),(0,90,0));
		AmmOMatic((-14593,5474,5434),(0,0,0));
		LastStandPro((-14313,3862,5434),(0,0,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText2( "Perks Have Spawned" );
		}
		wait 3.0;
	}
	if(getDvar("mapname") == "mp_invasion")
	{
		Upgrade((2403,12760,11),(0,0,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText( "Upgrade Has Spawned" );
		}
		wait 3.0;
		SpeedReload((2335,12127,11),(0,90,0));
		SteadyAim((2335,11544,11),(0,90,0));
		StoppingPower((2476,11173,11),(0,90,0));
		Speedy((2335,10865,11),(0,90,0));
		Health((2472,10567,11),(0,90,0));
		AmmOMatic((2335,10182,11),(0,90,0));
		LastStandPro((2474,10170,11),(0,90,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText2( "Perks Have Spawned" );
		}
		wait 3.0;
	}
	if(getDvar("mapname") == "mp_favela")
	{
		Upgrade((2043,2561,291),(0,207,0),(2023,2599,291));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText( "Upgrade Has Spawned" );
		}
		wait 3.0;
		SpeedReload((1468,2492,291),(0,25,0));
		SteadyAim((1606,2570,291),(0,25,0));
		StoppingPower((1572,2310,291),(0,207,0));
		Speedy((1756,2400,291),(0,207,0));
		Health((2695,3160,291),(0,352,0));
		AmmOMatic((2149,2889,291),(0,25,0));
		LastStandPro((1049,2424,292),(0,90,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText2( "Perks Have Spawned" );
		}
	}
	if(getDvar("mapname") == "mp_checkpoint")
	{
		Upgrade((2588,2714,3),(0,90,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText( "Upgrade Has Spawned" );
		}
		wait 3.0;
		Health((2490,2216,12),(0,90,0));
		LastStandPro((2364,2267,11),(0,90,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText2( "Perks Have Spawned" );
		}
	}
	if(getDvar("mapname") == "mp_quarry")
	{
		Upgrade((-1839.9,768.7,169.5),(0,90,0),(-1792,768,169));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText( "Upgrade Has Spawned" );
		}
		wait 3.0;
		CreateRamps((-1634.4,1019.0,20.1),(-1623.5,823.6,176.1));
		SpeedReload((-1660.2,727.1,35.1),(0,0,0));
		SteadyAim((-2395.3,1288.9,31.1),(0,0,0));
		StoppingPower((-1815.1,2789.7,84.9),(0,90,0));
		Speedy((-2020.9,1687.1,35.1),(0,0,0));
		Health((-1424.1,778.7,171.5),(0,90,0));
		AmmOMatic((-2658,2767,84),(0,0,0));
		LastStandPro((-1565,727,169),(0,0,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText2( "Perks Have Spawned" );
		}
		wait 3.0;
	}
	if(getDvar("mapname") == "mp_subbase")
	{
		RandomWeapon((-412,-6440,0),(0,0,0));
	}
	if(getDvar("mapname") == "mp_nightshift" && level.edit == 0)
	{
		Upgrade((-2016.4,-50.8,8.1),(0,90,0),(-1972,-48,3));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText( "Upgrade Has Spawned" );
		}
		wait 3.0;
		SpeedReload((-1576.1,-2213.3,27.1),(0,90,0));
		SteadyAim((-1328.1,-1864.5,8.1),(0,90,0));
		StoppingPower((-318.6,-2023.9,16.1),(0,0,0));
		Speedy((-496.1,-1728.4,152.1),(0,90,0));
		Health((-752.6,-883.2,12.2),(0,0,0));
		AmmOMatic((-1757,304,3),(0,0,0));
		LastStandPro((-1968,-292,3),(0,90,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText2( "Perks Have Spawned" );
		}
		wait 3.0;
	}
	if(getDvar("mapname") == "mp_nightshift" && level.edit == 1)
	{
		Upgrade((1947,309,119),(0,360,0),(1947,257,119));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText( "Upgrade Has Spawned" );
		}
		wait 3.0;
		SpeedReload((31,-991,11),(0,0,0));
		SteadyAim((827,-1799,43),(0,0,0));
		StoppingPower((504,-912,11),(0,90,0));
		Speedy((615,-112,19),(0,180,0));
		Health((1867,186,224),(0,245,0));
		AmmOMatic((-309,-2016,11),(0,0,0));
		LastStandPro((1104,-2112,43),(0,90,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText2( "Perks Have Spawned" );
		}
		wait 3.0;
	}
	if(getDvar("mapname") == "mp_nightshift" && level.edit == 2)
	{
		Upgrade((1834,-2794,8),(0,0,0),(1830,-2744,3));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText( "Upgrade Has Spawned" );
		}
		wait 3.0;
		SpeedReload((2023,-1613,16),(0,90,0));
		SteadyAim((2022,-1792,16),(0,90,0));
		StoppingPower((2023,-1990,16),(0,90,0));
		Speedy((1576,-2521,16),(0,90,0));
		Health((1576,-2863,16),(0,90,0));
		AmmOMatic((1828,-2283,134),(0,0,0));
		LastStandPro((1787,-1748,3),(0,90,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText2( "Perks Have Spawned" );
		}
		wait 3.0;
	}
	if(getDvar("mapname") == "mp_strike")
	{
		Upgrade((-2385,1608,19),(0,0,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText( "Upgrade Has Spawned" );
		}
		wait 3.0;
		SpeedReload((-2378,1248,22),(0,0,0));
		SteadyAim((-2627,1247,17),(0,0,0));
		StoppingPower((-2777,1247,16),(0,0,0));
		Speedy((-2950,1247,15),(0,0,0));
		Health((-3302,1247,12),(0,0,0));
		AmmOMatic((-2742,1608,19),(0,0,0));
		LastStandPro((-3065,1608,19),(0,0,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText2( "Perks Have Spawned" );
		}
		wait 3.0;
	}
	if(getDvar("mapname") == "mp_vacant")
	{
		Upgrade((-1625,972,-83),(0,0,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText( "Upgrade Has Spawned" );
		}
		wait 3.0;
		SpeedReload((-1404,152,-98),(0,0,0));
		SteadyAim((-1760,-62,-100),(0,0,0));
		StoppingPower((-659,78,-100),(0,90,0));
		Speedy((-867,409,-98),(0,90,0));
		Health((196,1600,-101),(0,90,0));
		AmmOMatic((764,1663,-100),(0,90,0));
		LastStandPro((53,1093,-36),(0,90,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText2( "Perks Have Spawned" );
		}
		wait 3.0;
	}
	if(getDvar("mapname") == "mp_underpass")
	{
		Upgrade((3732,2105,395),(0,48,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText( "Upgrade Has Spawned" );
		}
		wait 3.0;
		SpeedReload((3778,1731,395),(0,0,0));
		SteadyAim((4094,1039,427),(0,0,0));
		StoppingPower((3542,1426,395),(0,90,0));
		Speedy((3660,1968,395),(0,46,0));
		Health((3015,3354,395),(0,90,0));
		AmmOMatic((3495,2273,395),(0,238,0));
		LastStandPro((4164,1904,427),(0,0,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText2( "Perks Have Spawned" );
		}
		wait 3.0;
	}
	if(getDvar("mapname") == "mp_rundown")
	{
		Upgrade((1236,2644,82),(0,0,0),(1235,2704,77));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText( "Upgrade Has Spawned" );
		}
		wait 3.0;
		SpeedReload((1426,3187,82),(0,0,0));
		SteadyAim((1343,3187,82),(0,0,0));
		StoppingPower((1366,3028,82),(0,0,0));
		Speedy((1279,3028,82),(0,0,0));
		Health((1708,3040,73),(0,90,0));
		AmmOMatic((391,2320,134),(0,0,0));
		LastStandPro((963,2919,80),(0,90,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText2( "Perks Have Spawned" );
		}
		wait 3.0;
	}
	if(getDvar("mapname") == "mp_fuel2")
	{
		RandomWeapon((16183,28529,7212),(0,0,0));
	}
	if(getDvar("mapname") == "mp_storm")
	{
		Upgrade((3843,-1903,8),(0,0,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText( "Upgrade Has Spawned" );
		}
		wait 3.0;
		SpeedReload((3913,-1519,16),(0,0,0));
		SteadyAim((3144,-968,-48),(0,0,0));
		StoppingPower((3668,-1335,-48),(0,0,0));
		Speedy((2120,-902,8),(0,90,0));
		Health((3412,-844,8),(0,90,0));
		AmmOMatic((5056,-1806,8),(0,90,0));
		LastStandPro((5097,-1360,8),(0,0,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText2( "Perks Have Spawned" );
		}
		wait 3.0;
	}
	if(getDvar("mapname") == "mp_derail")
	{
		Upgrade((2495,3319,294),(0,90,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText( "Upgrade Has Spawned" );
		}
		wait 3.0;
		SpeedReload((1896,2060,158),(0,0,0));
		SteadyAim((1824,2158,158),(0,90,0));
		StoppingPower((1824,2308,158),(0,90,0));
		Speedy((1824,2450,158),(0,90,0));
		Health((2154,2606,282),(0,0,0));
		AmmOMatic((2153,3196,425),(0,90,0));
		LastStandPro((2299,2788,153),(0,0,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText2( "Perks Have Spawned" );
		}
		wait 3.0;
	}
	if(getDvar("mapname") == "mp_estate")
	{
		RandomWeapon((1362,3719,65),(0,0,0));
	}
	if(getDvar("mapname") == "mp_boneyard")
	{
		Upgrade((-537,-2008,-88),(0,90,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText( "Upgrade Has Spawned" );
		}
		wait 3.0;
		SpeedReload((-370,-756,-65),(0,0,0));
		SteadyAim((-553,-756,-76),(0,0,0));
		StoppingPower((-875,-1093,-84),(0,163,0));
		Speedy((-122,-875,-108),(0,90,0));
		Health((1301,-2258,-51),(0,0,0));
		AmmOMatic((-261,-3077,-68),(0,31,0));
		LastStandPro((-565,-2420,0),(0,70,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText2( "Perks Have Spawned" );
		}
		wait 3.0;
	}
	if(getDvar("mapname") == "mp_terminal")
	{
		Upgrade((609,2763,213),(0,180,0),(607,2808,213));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText( "Upgrade Has Spawned" );
		}
		wait 3.0;
		SpeedReload((550,3062,213),(0,90,0));
		SteadyAim((673,3059,213),(0,90,0));
		StoppingPower((550,3527,213),(0,90,0));
		Speedy((1392,4730,55),(0,90,0));
		Health((1761,4215,448),(0,90,0));
		AmmOMatic((354,4595,201),(0,0,0));
		LastStandPro((674,4020,213),(0,90,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText2( "Perks Have Spawned" );
		}
		wait 3.0;
	}
	if(getDvar("mapname") == "mp_brecourt")
	{
		Upgrade((10727,7210,1486),(0,90,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText( "Upgrade Has Spawned" );
		}
		wait 3.0;
		SpeedReload((9983,6227,358),(0,0,0));
		SteadyAim((10116,6224,358),(0,0,0));
		StoppingPower((10241,6224,358),(0,0,0));
		Speedy((10374,-6224,358),(0,0,0));
		Health((10528,6222,358),(0,0,0));
		AmmOMatic((11909,7442,1486),(0,0,0));
		LastStandPro((11911,6989,1486),(0,0,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText2( "Perks Have Spawned" );
		}
		wait 3.0;
	}
	if(getDvar("mapname") == "mp_overgrown")
	{
		RandomWeapon((1284,2651,-157),(0,90,0));
	}
	if(getDvar("mapname") == "mp_compact")
	{
		Upgrade((2807.9,2835.5,70.1),(0,90,0),(2756,2840,70));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText( "Upgrade Has Spawned" );
		}
		wait 3.0;
		CreateRamps((1957.5,2666.8,0.1),(2027.9,2406.3,130));
		SpeedReload((2060.0,3351.9,77.5),(0,0,0));
		SteadyAim((2103.9,2078.5,16.1),(0,90,0));
		StoppingPower((1608.1,2261.2,16.1),(0,90,0));
		Speedy((2491.9,2472.4,29.0),(0,-90,0));
		Health((1937.4,2392.1,16.1),(0,0,0));
		AmmOMatic((1753,2360,11),(0,0,0));
		LastStandPro((1718,2399,11),(0,0,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText2( "Perks Have Spawned" );
		}
		wait 3.0;
	}
	if(getDvar("mapname") == "mp_crash")
	{
		RandomWeapon((-1239,-2646,86),(0,90,0));
	}
	if(getDvar("mapname") == "mp_abandon")
	{
		Upgrade((-1553,2798,3),(0,141,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText( "Upgrade Has Spawned" );
		}
		wait 3.0;
		SpeedReload((-2119,3865,3),(0,20,0));
		SteadyAim((-2898,3629,3),(0,38,0));
		StoppingPower((-3878,2865,3),(0,140,0));
		Speedy((-3281,2486,3),(0,318,0));
		Health((-2248,1351,3),(0,323,0));
		AmmOMatic((-2552,1984,3),(0,140,0));
		LastStandPro((-1901,1150,3),(0,189,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText2( "Perks Have Spawned" );
		}
		wait 3.0;
	}
	if(getDvar("mapname") == "mp_complex")
	{
		Upgrade((3164,-1536,1051),(0,90,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText( "Upgrade Has Spawned" );
		}
		wait 3.0;
		SpeedReload((3166,-1787,1051),(0,90,0));
		SteadyAim((2624,-1642,1051),(0,90,0));
		StoppingPower((2625,-1473,1051),(0,90,0));
		Speedy((3167,-1346,1051),(0,90,0));
		Health((2936,-767,1051),(0,0,0));
		AmmOMatic((2628,-1067,1051),(0,90,0));
		LastStandPro((3138,-899,1051),(0,90,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText2( "Perks Have Spawned" );
		}
		wait 3.0;
	}
	if(getDvar("mapname") == "mp_trailerpark")
	{
		Upgrade((1958.9,-1706.1,15.4),(0,0,0),(1963,-1752,15));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText( "Upgrade Has Spawned" );
		}
		wait 3.0;
		CreateRamps((1739.2, -2213.0, 0), (1741.3, -2479, 190.1));
		SpeedReload((1613.4,-2907.3,190.1),(0,73.6,0));
		SteadyAim((2124.6,-3191.7,190.1),(0,180,0));
		StoppingPower((1918.2,-3199.3,190.1),(0,180,0));
		Speedy((2165.5,-2986.4,190.1),(0,-90,0));
		Health((1672.3,-2478.2,190.1),(0,90,0));
		AmmOMatic((1468,-2950,15),(0,0,0));
		LastStandPro((649,-2676,15),(0,180,0));
		foreach(player in level.players)
		{
			player thread AImod\_Intro::IntroText2( "Perks Have Spawned" );
		}
		wait 3.0;
	}
}

EmpEffect()
{
	level._effect["empuse"] = loadfx ("explosions/emp_flash_mp");
	PlayFx(level._effect["empuse"],self.origin);
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
		self.powertext = self createFontString( "default", 2 );
		self.powertext setPoint( "TOPRIGHT", "TOPRIGHT", 0, 30);
		self.powertext.HideWhenInMenu = true;
	}
	while(1)
	{
		if(level.power <= 0)
		{
			self.powertext setText ("Power Not Activated");
			self.powertext.fontScale = 1.650;
			self.powertext.glowColor = (0.9,0.3,0.3);
			self.powertext.glowAlpha = 1;
		}
		else
		{
			self.powertext fadeOverTime( 3.00 );
			self.powertext.alpha = 0;
			wait 3.0;
			self.powertext setText ("Power Activated");
			self.powertext.fontScale = 1.650;
			self.powertext.glowColor = (0.3,0.9,0.3);
			self.powertext.glowAlpha = 1;
			self.powertext fadeOverTime( 2.00 );
			self.powertext.alpha = 1;
			wait 2.0;
			self.powertext ChangeFontScaleOverTime( 0.1 );
			self.powertext.fontScale = 1.850;
			wait 0.1;
			self.powertext ChangeFontScaleOverTime( 0.1 );
			self.powertext.fontScale = 1.650;
		}
		level waittill("power_activated");
	}
}

MoneyGambler()
{
	self endon("disconnect");
	switch(randomInt(22))
	{
		case 0: self iPrintlnBold(" ^2You have won $500");
		self.money += 500;
		self thread Money();
		self notify("MONEY");
		break;
		case 1: self iPrintlnBold(" ^2You have won $1000");
		self.money += 1000;
		self thread Money();
		self notify("MONEY");
		break;
		case 2: self iPrintlnBold(" ^1You have lost -$1000");
		self.money -= 1000;
		self notify("MONEY");
		break;
		case 3: self iPrintlnBold(" ^2You have won $1500");
		self.money += 1500;
		self thread Money();
		self notify("MONEY");
		break;
		case 4: self iPrintlnBold(" ^2You have won $2000");
		self.money += 2000;
		self thread Money();
		self notify("MONEY");
		break;
		case 5: self iPrintlnBold(" ^2You have won $5000");
		self.money += 5000;
		self thread Money();
		self notify("MONEY");
		break;
		case 6: self iPrintlnBold(" ^2You have won $10000");
		self.money += 10000;
		self thread Money();
		self notify("MONEY");
		break;
		case 7: self iPrintlnBold(" ^2You have won $7500");
		self.money += 7500;
		self thread Money();
		self notify("MONEY");
		break;
		case 8: self iPrintlnBold(" ^1You have lost all your cash");
		self.money = 0;
		self notify("MONEY");
		break;
		case 9: self iPrintlnBold(" ^1You have lost -$500");
		self.money -= 500;
		self notify("MONEY");
		break;
		case 10: self iPrintlnBold(" ^2You have won a Predator Missile");
		self maps\mp\killstreaks\_killstreaks::giveKillstreak( "predator_missile", true );
		self maps\mp\gametypes\_hud_message::killstreakSplashNotify( "predator_missile_pickup");
		case 11: self iPrintlnBold(" ^2You have won a Airstrike");
		self playlocalsound("mp_level_up");
		self maps\mp\killstreaks\_killstreaks::giveKillstreak( "uav", true );
		self maps\mp\gametypes\_hud_message::killstreakSplashNotify( "airstrike");
		break;
		case 12: self iPrintlnBold(" ^2You have won a Sentry Gun!");
		self maps\mp\killstreaks\_killstreaks::giveKillstreak( "sentry", true );
		self maps\mp\gametypes\_hud_message::killstreakSplashNotify( "sentry_pickup");
		break;
		case 13: self iPrintlnBold(" ^2You have won a Super Airstrike");
		self maps\mp\killstreaks\_killstreaks::giveKillstreak( "counter_uav", true );
		self maps\mp\gametypes\_hud_message::killstreakSplashNotify( "ac130");
		break;
		case 14: self iPrintlnBold(" ^2You have won an Overwatch");
		self thread maps\mp\killstreaks\_overwatch::OverwatchStreak();
		self thread AImod\_Mod::TextPopup2("Press [{+actionslot 2}] to use Overwatch");
		self maps\mp\gametypes\_hud_message::killstreakSplashNotify( "littlebird_support");
		break;
		case 15: self iPrintlnBold(" ^2You have won a Extra Weapon Slot");
		self giveWeapon("defaultweapon_mp",10,false);
		wait 0.1;
		self switchToWeapon("defaultweapon_mp",10,false);
		break;
		case 16: self iPrintlnBold(" ^2You have won a Model 1887");
		self.curWeap = self getCurrentWeapon();
		self takeWeapon(self.curWeap);
		self giveWeapon("model1887_fmj_mp",0,false);
		wait 0.1;
		self switchToWeapon("model1887_fmj_mp",0,false);
		self giveMaxAmmo("model1887_fmj_mp",0,false);
		break;
		case 17: self iPrintlnBold("^2God decides if you live or die in 5 seconds");
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
		case 18: self iPrintlnBold("^3You have a 1/2 Chance of a Max Ammo");
		wait 2;
		self thread MaxAmmoRandom();
		break;
		case 19: self iPrintlnBold("^2You get infinite health for 30 seconds");
		self thread InfiniteHealth();
		break;
		case 20: self iPrintlnBold("^2You get double health for 30 seconds");
		self thread DoubleHealth();
		break;
		case 21: self iPrintlnBold("^1All Perks Tooken away and $200");
		self thread TakePerks();
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
		case 1: self iPrintlnBold("^2You live");
		break;
		case 2: self iPrintlnBold("^2You live");
		break;
		case 3: self iPrintlnBold("^2You live");
		break;
	}
}

MaxAmmoRandom()
{
	switch(randomInt(2))
	{
		case 0: self iPrintlnBold("^2You have won the MaxAmmo!");
		self maps\mp\killstreaks\_airdrop::refillAmmo();
		break;
		case 1: self iPrintlnBold("^1No Max Ammo For You!");
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
		self thread AImod\_Bot::BonusDropHud( "Infinite Health", "infinite_health_end", 30 );
		wait 30;
		self notify("infinite_health_end");
		self.maxhealth = 100;
		self.health = self.maxhealth;
		self iPrintlnBold("^1Infinite Health Over!");
		self.nobuyhealth = 0;
	}
	else if(self.health == 200)
	{
		self.maxhealth = 999999;
		self.health = self.maxhealth;
		self.health = 20000;
		self.nobuyhealth = 1;
		self thread AImod\_Bot::BonusDropHud( "Infinite Health", "infinite_health_end", 30 );
		wait 30;
		self notify("infinite_health_end");
		self.maxhealth = 200;
		self.health = self.maxhealth;
		self iPrintlnBold("^1Infinite Health Over!");
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
		self thread AImod\_Bot::BonusDropHud( "Double Health", "double_health_end", 30 );
		wait 30;
		self notify("double_health_end");
		self.maxhealth = 100;
		self.health = self.maxhealth;
		self iPrintlnBold("^1Double Health Over!");
		self.nobuyhealth = 0;
	}
	else if(self.health == 200)
	{
		self.maxhealth = 400;
		self.health = self.maxhealth;
		self.nobuyhealth = 1;
		self thread AImod\_Bot::BonusDropHud( "Double Health", "double_health_end", 30 );
		wait 30;
		self notify("double_health_end");
		self.maxhealth = 200;
		self.health = self.maxhealth;
		self iPrintlnBold("^1Double Health Over!");
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