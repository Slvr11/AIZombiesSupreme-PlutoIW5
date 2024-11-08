#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;

WaypointInit()
{
	level.botwaypoints[0] = CreateWayPoint(172,-219,-59);
	level.botwaypoints[1] = CreateWayPoint(-216,-305,-50);
	level.botwaypoints[2] = CreateWayPoint(-288,308,-51);
	level.botwaypoints[3] = CreateWayPoint(-9,383,-59);
	level.botwaypoints[4] = CreateWayPoint(-200,904,-52);
	level.botwaypoints[5] = CreateWayPoint(305,875,-51);
	level.botwaypoints[6] = CreateWayPoint(497,756,-51);
	level.botwaypoints[7] = CreateWayPoint(1093,910,-51);
	level.botwaypoints[8] = CreateWayPoint(1556,543,-52);
	level.botwaypoints[9] = CreateWayPoint(1633,158,-52);
	level.botwaypoints[10] = CreateWayPoint(1392,161,-53);
	level.botwaypoints[11] = CreateWayPoint(576,-103,-53);
	level.botwaypoints[12] = CreateWayPoint(327,341,-56);
	level.botwaypoints[13] = CreateWayPoint(87,355,-25);
	level.botwaypoints[14] = CreateWayPoint(-548,409,-45);
	level.botwaypoints[15] = CreateWayPoint(-940,487,-45);
	level.botwaypoints[16] = CreateWayPoint(-874,660,-45);
	level.botwaypoints[17] = CreateWayPoint(-1376,826,-52);
	level.botwaypoints[18] = CreateWayPoint(-1479,275,-52);
	level.botwaypoints[19] = CreateWayPoint(-1058,137,-47);
	level.botwaypoints[20] = CreateWayPoint(-1104,-56,-53);
	level.botwaypoints[21] = CreateWayPoint(-671,-147,-46);
	level.botwaypoints[22] = CreateWayPoint(-280,190,-57);
	level.botwaypoints[23] = CreateWayPoint(-878,81,-45);
	level.botwaypoints[24] = CreateWayPoint(-782,228,-45);
	level.botwaypoints[25] = CreateWayPoint(-583,568,-45);
	level.botwaypoints[26] = CreateWayPoint(-795,660,90);
	level.botwaypoints[27] = CreateWayPoint(-913,694,90);
	level.botwaypoints[28] = CreateWayPoint(-847,408,90);
	level.botwaypoints[29] = CreateWayPoint(-595,279,90);
	level.botwaypoints[30] = CreateWayPoint(-1177,669,88);
	level.botwaypoints[31] = CreateWayPoint(-1248,467,-47);
	level.botwaypoints[32] = CreateWayPoint(-939,904,-53);
	level.botwaypoints[33] = CreateWayPoint(-1672,966,-52);
	level.botwaypoints[34] = CreateWayPoint(-248,732,-52);
	level.botwaypoints[35] = CreateWayPoint(680,477,-46);
	level.botwaypoints[36] = CreateWayPoint(900,684,-45);
	level.botwaypoints[37] = CreateWayPoint(1127,726,-46);
	level.botwaypoints[38] = CreateWayPoint(899,263,-45);
	level.botwaypoints[39] = CreateWayPoint(719,46,-45);
	level.botwaypoints[40] = CreateWayPoint(993,132,90);
	level.botwaypoints[41] = CreateWayPoint(1086,174,90);
	level.botwaypoints[42] = CreateWayPoint(982,311,90);
	level.botwaypoints[43] = CreateWayPoint(668,187,90);
	level.botwaypoints[44] = CreateWayPoint(1333,303,88);
	level.botwaypoints[45] = CreateWayPoint(1265,531,-46);
}

Init()
{
    level thread PrecacheNukeTown();
	level thread SpawnObjects();
}

PrecacheNukeTown()
{

}

Teleporter(pos, angle, end)
{
	level.teleporter[0] = spawn("script_model", pos );
	level.teleporter[0] setModel("com_plasticcase_friendly");
	level.teleporter[0].angles = angle;
	level.teleporter[0] CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	level.teleporter[0] setContents(1);
	curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();	
	objective_add( curObjID, "invisible", (0,0,0) );
	objective_position( curObjID, level.teleporter[0].origin );
	objective_state( curObjID, "active" );
	objective_team( curObjID, "allies" );
	objective_icon( curObjID, "hudicon_neutral" );
	level.teleporter[0].trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
	level.teleporter[0].trigger.angles = angle;
	level.teleporter[0] thread TeleporterThink(pos, angle, end);
	wait 0.01;
}

TeleporterThink(pos, angle, end)
{
	self endon("disconnect");
	while(1)
	{
		self.trigger waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75 && level.power == 0)
		{
			Player setLowerMessage("activate", "Power needs to be activated" );
		}
		else if(Distance(pos, Player.origin) <= 75 && level.power == 1)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 to use Teleporter [^2$^32000^7]" );
		}
		if(Distance(pos, Player.origin) > 50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.pers["team"] == "allies" && level.power == 0 && player useButtonPressed())
		{
			player iPrintln("^1Power needs to be activated!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money < 2000 && level.power == 1 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1Not enough money for Teleporter need $2000!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.pers["team"] == "allies" && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player.money -= 2000;
			player notify("MONEY");
			player ShellShock( "frag_grenade_mp", 3 );
			wait 2;
			player ShellShock( "concussion_grenade_mp", 3 );
			player thread AImod\_Mod::TextPopup( "Teleported!" );
			player.oldorigin = self.origin;
			player setorigin(end);
			player setplayerangles((0,270,0));
			player thread SpawnBack(30);
			level notify("boxend");
		}
		wait 0.01;
	}
}

TeleporterBonus(pos, angle, end, endangle)
{
	level.teleporter[1] = spawn("script_model", pos );
	level.teleporter[1] setModel("com_plasticcase_friendly");
	level.teleporter[1].angles = angle;
	level.teleporter[1] CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	level.teleporter[1] setContents(1);
	curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();	
	objective_add( curObjID, "invisible", (0,0,0) );
	objective_position( curObjID, level.teleporter[1].origin );
	objective_state( curObjID, "active" );
	objective_team( curObjID, "allies" );
	objective_icon( curObjID, "hudicon_neutral" );
	level.teleporter[1].trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
	level.teleporter[1].trigger.angles = angle;
	level.teleporter[1] thread TeleporterBonusThink(pos, angle, end, endangle);
	wait 0.01;
}

TeleporterBonus2(pos, angle, end, endangle)
{
	level.teleporter[2] = spawn("script_model", pos );
	level.teleporter[2] setModel("com_plasticcase_friendly");
	level.teleporter[2].angles = angle;
	level.teleporter[2] CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	level.teleporter[2] setContents(1);
	curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();	
	objective_add( curObjID, "invisible", (0,0,0) );
	objective_position( curObjID, level.teleporter[2].origin );
	objective_state( curObjID, "active" );
	objective_team( curObjID, "allies" );
	objective_icon( curObjID, "hudicon_neutral" );
	level.teleporter[2].trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
	level.teleporter[2].trigger.angles = angle;
	level.teleporter[2] thread TeleporterBonusThink(pos, angle, end, endangle);
	wait 0.01;
}

TeleporterBonusThink(pos, angle, end, endangle)
{
	self endon("disconnect");
	while(1)
	{
		self.trigger waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75 && level.power == 0)
		{
			Player setLowerMessage("activate", "Power needs to be activated" );
		}
		else if(Distance(pos, Player.origin) <= 75 && level.power == 1)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 to use Special Teleporter [^5Need 600 Bonus Points^7]" );
		}
		if(Distance(pos, Player.origin) > 50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.pers["team"] == "allies" && level.power == 0 && player useButtonPressed())
		{
			player iPrintln("^1Power needs to be activated!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.bonus < 600 && level.power == 1 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player iPrintln("^1Not enough money for Teleporter need 600 bonus points!");
			wait 1;
		}
		else if(Distance(pos, Player.origin) <= 75 && player.pers["team"] == "allies" && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player.bonus -= 600;
			player notify("BONUS");
			player ShellShock( "frag_grenade_mp", 3 );
			wait 2;
			playFx(loadfx("explosions/tanker_explosion"),player.origin);
			player playSound("explo_mine");
			player ShellShock( "concussion_grenade_mp", 3 );
			player thread AImod\_Mod::TextPopup( "Teleported!" );
			player.oldorigin = self.origin;
			player setorigin(end);
			player setplayerangles(endangle);
			player thread SpawnBack(20);
			level notify("boxend");
			self delete();
		}
		wait 0.01;
	}
}

BonusDrop(pos, angle, text)
{
	level.specblock = spawn("script_model", pos + (0, 0, 45) );
	level.specblock setModel("weapon_ak47_tactical");
	level.specblock thread HideGunParts("ak47_fmj_mp");
	level.specblock.angles = angle;
	level.specblock notSolid();
	level.specblock.trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
	level.specblock.trigger.angles = angle;
	level.specblock.fx = SpawnFX(loadFX("misc/flare_ambient"),level.specblock.origin);
	TriggerFX(level.specblock.fx);
	level.specblock thread BonusDropThink(pos, angle, text);
	level.specblock thread rotateDrop();
	wait 0.01;
}

BonusDropThink(pos, angle, text)
{
	self endon("disconnect");
	while(1)
	{
		self.trigger waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
			player thread AImod\_text::BonusDropText(text + "!", 0.85, (1,1,1),(1,0.3,0.3),1); 
			player takeWeapon(player getCurrentWeapon());
			player giveWeapon("ak47_fmj_mp", 0, true);
			player switchToWeapon("ak47_fmj_mp");
			player GiveMaxAmmo("ak47_fmj_mp");
			if(getDvarInt("z_dedicated") == 0)
			{
				player playLocalSound("mp_killstreak_carepackage");
			}
			self delete();
			self.fx delete();
			self.trigger delete();
		}
		wait 0.1;
	}
}

BonusDrop2(pos, angle, text)
{
	level.specblock = spawn("script_model", pos + (0, 0, 45) );
	level.specblock setModel("weapon_sawed_off_double_barrel");
	level.specblock thread HideGunParts("ranger_fmj_mp");
	level.specblock.angles = angle;
	level.specblock notSolid();
	level.specblock.trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
	level.specblock.trigger.angles = angle;
	level.specblock.fx = SpawnFX(loadFX("misc/flare_ambient"),level.specblock.origin);
	TriggerFX(level.specblock.fx);
	level.specblock thread BonusDropThink2(pos, angle, text);
	level.specblock thread rotateDrop();
	wait 0.01;
}

BonusDropThink2(pos, angle, text)
{
	self endon("disconnect");
	while(1)
	{
		self.trigger waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
			player thread AImod\_text::BonusDropText(text + "!", 0.85, (1,1,1),(1,0.3,0.3),1); 
			player takeWeapon(player getCurrentWeapon());
			player giveWeapon("ranger_fmj_mp", 0, true);
			player switchToWeapon("ranger_fmj_mp");
			player GiveMaxAmmo("ranger_fmj_mp");
			if(getDvarInt("z_dedicated") == 0)
			{
				player playLocalSound("mp_killstreak_carepackage");
			}
			self delete();
			self.fx delete();
			self.trigger delete();
		}
		wait 0.1;
	}
}

rotateDrop()
{
	while(self)
	{
		self rotateyaw(-360,5);
		wait 5;
	}
}

SpawnBack(time)
{
	self endon("death");
	wait(time);
	self ShellShock( "frag_grenade_mp", 3 );
	wait 2;
	self ShellShock( "concussion_grenade_mp", 3 );
	self thread AImod\spawn::change_spawns();
}

SpawnObjects()
{
	TeleporterBonus((-1959,629,-52),(0,68,0),(-565,-241,-42),(0,162,0));
	BonusDrop2((-565,-241,-42),(0,0,0),"Blundergat");
}