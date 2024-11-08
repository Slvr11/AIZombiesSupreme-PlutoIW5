#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;

WaypointInit()
{
	level.botwaypoints[level.botwaypoints.size] = CreateWayPoint(-31,-212,-234);
	level.botwaypoints[level.botwaypoints.size] = CreateWayPoint(-452,-67,-221);
	level.botwaypoints[level.botwaypoints.size] = CreateWayPoint(-442,724,-224);
	level.botwaypoints[level.botwaypoints.size] = CreateWayPoint(-404,1759,-226);
	level.botwaypoints[level.botwaypoints.size] = CreateWayPoint(617,1772,-220);
	level.botwaypoints[level.botwaypoints.size] = CreateWayPoint(1498,1139,-223);
	level.botwaypoints[level.botwaypoints.size] = CreateWayPoint(1523,668,-216);
	level.botwaypoints[level.botwaypoints.size] = CreateWayPoint(1317,320,-231);
	level.botwaypoints[level.botwaypoints.size] = CreateWayPoint(1578,195,-221);
	level.botwaypoints[level.botwaypoints.size] = CreateWayPoint(1557,-183,-211);
	level.botwaypoints[level.botwaypoints.size] = CreateWayPoint(1034,-111,-227);
	level.botwaypoints[level.botwaypoints.size] = CreateWayPoint(579,-31,-210);
	level.botwaypoints[level.botwaypoints.size] = CreateWayPoint(559,-154,-216);
	level.botwaypoints[level.botwaypoints.size] = CreateWayPoint(180,-190,-219);
	level.botwaypoints[level.botwaypoints.size] = CreateWayPoint(2,268,-230);
	level.botwaypoints[level.botwaypoints.size] = CreateWayPoint(-69,1096,-227);
	level.botwaypoints[level.botwaypoints.size] = CreateWayPoint(362,1193,-222);
	level.botwaypoints[level.botwaypoints.size] = CreateWayPoint(604,899,-182);
	level.botwaypoints[level.botwaypoints.size] = CreateWayPoint(705,1551,-230);
	level.botwaypoints[level.botwaypoints.size] = CreateWayPoint(1329,968,-219);
	level.botwaypoints[level.botwaypoints.size] = CreateWayPoint(1234,348,-230);
	level.botwaypoints[level.botwaypoints.size] = CreateWayPoint(565,182,-230);
	level.botwaypoints[level.botwaypoints.size] = CreateWayPoint(115,206,-236);
}

Init()
{
    level thread PrecacheRust();
	level thread SpawnObjects();
}

PrecacheRust()
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
			player setplayerangles((0,90,0));
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
	Teleporter((1300,1332,-94),(0,90,0),(697,1002,279));
	TeleporterBonus((1772,1656,-115),(0,90,0),(1214,86,27),(0,0,0));
	BonusDrop2((1325,54,-224),(0,0,0),"Blundergat");
}