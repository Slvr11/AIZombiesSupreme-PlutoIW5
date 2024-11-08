#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;

WaypointInit()
{
	level.botwaypoints[0] = CreateWayPoint(596,5620,2285);
	level.botwaypoints[1] = CreateWayPoint(656,5088,2286);
	level.botwaypoints[2] = CreateWayPoint(1025,5339,2291);
	level.botwaypoints[3] = CreateWayPoint(316,5360,2281);
	level.botwaypoints[4] = CreateWayPoint(661,5030,2286);
}

Init()
{
    level thread PrecacheInvasion();
	level thread SpawnObjects();
}

PrecacheInvasion()
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

TeleporterBonus(pos, angle, end)
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
	level.teleporter[1] thread TeleporterBonusThink(pos, angle, end);
	wait 0.01;
}

TeleporterBonusThink(pos, angle, end)
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
			player setplayerangles((0,0,0));
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
	level.specblock.gun2 = spawn("script_model", pos + (0, 10, 45) );
	level.specblock.gun2 setModel("weapon_ak47_tactical");
	level.specblock.gun2 thread HideGunParts("ak47_fmj_mp");
	level.specblock.trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
	level.specblock.trigger.angles = angle;
	level.specblock.fx = SpawnFX(loadFX("misc/flare_ambient"),level.specblock.origin);
	TriggerFX(level.specblock.fx);
	level.specblock thread BonusDropThink(pos, angle, text);
	level.specblock thread rotateDrop();
	level.specblock.gun2 thread rotateDrop();
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
			self.gun2 delete();
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
	Teleporter((1078,5093,2289),(0,90,0),(426,-4717,2329));
	TeleporterBonus((472,5725,2290),(0,0,0),(-2973,-3563,2382));
	BonusDrop((-2648,-3557,2382),(0,0,0),"Dual Wield AK-47");
}