#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;

WaypointInit()
{
	level.botwaypoints[0] = CreateWayPoint(577,2398,84);
	level.botwaypoints[1] = CreateWayPoint(1616,2496,75);
	level.botwaypoints[2] = CreateWayPoint(1625,3240,80);
	level.botwaypoints[3] = CreateWayPoint(683,3222,79);
	level.botwaypoints[4] = CreateWayPoint(618,2783,78);
	level.botwaypoints[5] = CreateWayPoint(924,2687,80);
	level.botwaypoints[6] = CreateWayPoint(1148,2925,83);
	level.botwaypoints[7] = CreateWayPoint(1510,2917,82);
	level.botwaypoints[8] = CreateWayPoint(1666,2930,74);
	level.botwaypoints[9] = CreateWayPoint(1437,3096,82);
	level.botwaypoints[10] = CreateWayPoint(1219,3115,82);
	level.botwaypoints[11] = CreateWayPoint(1502,2320,64);
	level.botwaypoints[12] = CreateWayPoint(232,2730,116);
	level.botwaypoints[13] = CreateWayPoint(282,2479,150);
	level.botwaypoints[14] = CreateWayPoint(611,2200,103);
	level.botwaypoints[15] = CreateWayPoint(654,3296,75);
}

Init()
{
    level thread PrecacheRundown();
	level thread SpawnObjects();
}

PrecacheRundown()
{
    precacheModel("foliage_tree_palm_bushy_1");
	PrecacheMpAnim( level.anim_prop_models[ "foliage_tree_palm_bushy_1" ][ "strong" ] );
	PrecacheMpAnim( level.anim_prop_models[ "foliage_pacific_fern01_animated" ][ "strong" ] );
}

Tree1(pos, angle)
{
	foliage = spawn("script_model", pos );
	foliage setModel("foliage_tree_palm_bushy_1");
	foliage.angles = angle;
	foliage ScriptModelPlayAnim( level.anim_prop_models[ "foliage_tree_palm_bushy_1" ][ "strong" ] );
	foliage setContents(1);
}

Tree2(pos, angle)
{
	foliage = spawn("script_model", pos );
	foliage setModel("foliage_pacific_fern01_animated");
	foliage.angles = angle;
	foliage ScriptModelPlayAnim( level.anim_prop_models[ "foliage_pacific_fern01_animated" ][ "strong" ] );
	foliage setContents(1);
}

ZipLine(pos, angle, pos1, pos2, pos3, pos4, pos5)
{
	level.zipline = spawn("script_model", pos );
	level.zipline setModel("com_plasticcase_friendly");
	level.zipline.angles = angle;
	level.zipline Solid();
	level.zipline CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
	trigger.angles = angle;
	trigger thread ZipLineThink(pos, angle, pos1, pos2, pos3, pos4, pos5);
	wait 0.01;
}

ZipLineThink(pos, angle, pos1, pos2, pos3, pos4, pos5)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 to use Zipline[^2$^35000^7]" );
		}
		if(Distance(pos, Player.origin) > 50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.money >= 5000 && player.pers["team"] == "allies" && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player thread ZiplineNoMove();
			if(player.maxhealth >= 200)
			{
			    player.maxhealth = 999991;
				player.health = player.maxhealth;
			}
			else
			{
			    player.maxhealth = 999999;
				player.health = player.maxhealth;
			}
			player.health = player.maxhealth;
			player.money -= 5000;
			player notify("MONEY");
			player thread maps\mp\gametypes\_rank::scorePopup( -5000, 0, (1,0,0), 1 );
			player thread AImod\_Mod::TextPopup( "ZipLine!" );
			player setorigin(level.zipline.origin+(0,0,10));
			level.zipline MoveTo(pos1, 5);
			wait 5;
			level.zipline MoveTo(pos2, 10);
			wait 10;
			level.zipline MoveTo(pos3, 10);
			wait 10;
			level.zipline MoveTo(pos4, 10);
			wait 10;
			level.zipline MoveTo(pos5, 10);
			wait 10;
			level.zipline MoveTo(pos, 5);
			wait 5;
			player notify("zipline_off");
			if ( player _hasPerk( "specialty_lightweight" ) )
			{
				player.moveSpeedScaler = 1.1;
				player maps\mp\gametypes\_weapons::updateMoveSpeedScale( "primary" );
			}
			else
			{
				player.moveSpeedScaler = 1.0;
				player maps\mp\gametypes\_weapons::updateMoveSpeedScale( "primary" );
			}
			if(player.maxhealth == 999991)
			{
			    player.maxhealth = 200;
				player.health = player.maxhealth;
			}
			else if(player.maxhealth == 999999)
			{
				player.maxhealth = 100;
				player.health = player.maxhealth;
			}
			level notify("boxend");
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money <= 5000 && player useButtonPressed())
		{
			player iPrintln("^1Not enough money for ZipLine Need $5000!");
			wait 1;
		}
		wait 0.01;
	}
}

ZiplineNoMove()
{
    self endon("disconnect");
    self endon("death");
    self endon("zipline_off");
	while(1)
	{
		self.moveSpeedScaler = 0;
		self maps\mp\gametypes\_weapons::updateMoveSpeedScale( "primary" );
		wait 0.1;
	}
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
			player setplayerangles((0,207,0));
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
	Teleporter((1360,3180,77),(0,0,0),(-50,-1523,175));
	TeleporterBonus((323,3010,95),(0,29,0),(1591,-510,355),(0,341,0));
	BonusDrop2((1912,-614,320),(0,0,0),"Blundergat");
    Tree1((984,2536,75),(0,90,0));
	ZipLine((1403,3316,75),(0,0,0),(1638, 3308,252),(1630, 2414,252),(1052, 2402,130),(1047, 2902,96),(1009, 3261,130));
	Tree2((356,2381,128),(0,90,0));
}