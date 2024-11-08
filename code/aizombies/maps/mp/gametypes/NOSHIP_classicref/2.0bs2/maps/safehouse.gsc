#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;

WaypointInit()
{
	level.botwaypoints[0] = CreateWayPoint(423,509,184);
	level.botwaypoints[1] = CreateWayPoint(342,30,312);
	level.botwaypoints[2] = CreateWayPoint(303,-80,312);
	level.botwaypoints[3] = CreateWayPoint(631,-152,312);
	level.botwaypoints[4] = CreateWayPoint(430,-14,312);
	level.botwaypoints[5] = CreateWayPoint(588,214,312);
	level.botwaypoints[6] = CreateWayPoint(739,74,312);
	level.botwaypoints[7] = CreateWayPoint(700,341,312);
	level.botwaypoints[8] = CreateWayPoint(741,216,184);
	level.botwaypoints[9] = CreateWayPoint(605,-124,184);
	level.botwaypoints[10] = CreateWayPoint(332,-278,184);
	level.botwaypoints[11] = CreateWayPoint(138,-230,184);
	level.botwaypoints[12] = CreateWayPoint(879,25,160);
	level.botwaypoints[13] = CreateWayPoint(807,-244,48);
	level.botwaypoints[14] = CreateWayPoint(641,-115,32);
	level.botwaypoints[15] = CreateWayPoint(702,82,32);
	level.botwaypoints[16] = CreateWayPoint(495,126,32);
	level.botwaypoints[17] = CreateWayPoint(548,311,32);
	level.botwaypoints[18] = CreateWayPoint(330,354,28);
	level.botwaypoints[19] = CreateWayPoint(378,145,32);
	level.botwaypoints[20] = CreateWayPoint(341,-90,32);
	level.botwaypoints[21] = CreateWayPoint(111,217,32);
}

Init()
{
    level thread PrecacheBailout();
	level thread SpawnObjects();
}

PrecacheBailout()
{

}

ZipLine(pos, angle, pos1, pos2)
{
	level.zipline = spawn("script_model", pos );
	level.zipline setModel("com_plasticcase_friendly");
	level.zipline.angles = angle;
	level.zipline Solid();
	level.zipline CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
	trigger.angles = angle;
	trigger thread ZipLineThink(pos, angle, pos1, pos2);
	wait 0.01;
}

ZipLineThink(pos, angle, pos1, pos2)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 to use Zipline[^2$^32000^7]" );
		}
		if(Distance(pos, Player.origin) > 50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.money >= 2000 && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player.money -= 2000;
			player notify("MONEY");
			player thread maps\mp\gametypes\_rank::scorePopup( -2000, 0, (1,0,0), 1 );
			player playerlinkto(level.zipline);
			level.zipline MoveTo(pos1, 2);
			wait 2;
			level.zipline MoveTo(pos2, 3);
			wait 3;
			player unlink();
			player thread SpawnBack(30);
			level.zipline MoveTo(pos2, 3);
			wait 3;
			level.zipline MoveTo(pos1, 2);
			wait 2;
			level.zipline MoveTo(pos, 2);
			wait 2;
			level notify("boxend");
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money <= 2000 && player useButtonPressed())
		{
			player iPrintln("^1Not enough money for ZipLine Need $2000!");
			wait 1;
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
			player setplayerangles((0,180,0));
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
	level.specblock.angles = angle;
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
	ZipLine((-213,399,179),(0,80,0),(497,120,691),(8432,6873,-831));
	TeleporterBonus((136,34,27),(0,77,0),(339,5033,-328));
	BonusDrop((422,4169,-165),(0,0,0),"Dual Wield AK-47");
}