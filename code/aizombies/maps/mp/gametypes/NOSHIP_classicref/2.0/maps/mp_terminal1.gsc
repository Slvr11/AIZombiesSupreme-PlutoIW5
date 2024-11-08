#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;

Init()
{
    level thread PrecacheTerminal();
	level thread SpawnObjects();
}

PrecacheTerminal()
{

}

ZipLine(pos, angle, pos1)
{
	level.zipline = spawn("script_model", pos );
	level.zipline setModel("com_plasticcase_friendly");
	level.zipline.angles = angle;
	level.zipline CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	level.zipline setContents(1);
	trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
	trigger.angles = angle;
	trigger thread ZipLineThink(pos, angle, pos1);
	wait 0.01;
}

ZipLineThink(pos, angle, pos1)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 to use Zipline[^2$^31000^7]" );
		}
		if(Distance(pos, Player.origin) > 50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.money >= 1000 && player.pers["team"] == "allies" && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			level.zipline setContents(1);
			player thread ZiplineNoMove();
			player.money -= 1000;
			player notify("MONEY");
			player thread maps\mp\gametypes\_rank::scorePopup( -1000, 0, (1,0,0), 1 );
			player thread AImod\_Mod::TextPopup( "ZipLine!" );
			player setorigin(level.zipline.origin+(0,0,10));
			level.zipline MoveTo(pos1, 4);
			wait 4;
			level.zipline setContents(0);
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
			level.zipline MoveTo(pos, 10);
			wait 10;
			level.helper delete();
			level.zipline setContents(1);
			level notify("boxend");
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money <= 1000 && player useButtonPressed())
		{
			player iPrintln("^1Not enough money for ZipLine Need $1000!");
			wait 1;
		}
		wait 0.01;
	}
}

ZipLine2(pos, angle, pos1)
{
	level.zipline2 = spawn("script_model", pos );
	level.zipline2 setModel("com_plasticcase_friendly");
	level.zipline2.angles = angle;
	level.zipline2 CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	level.zipline2 setContents(1);
	trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
	trigger.angles = angle;
	trigger thread ZipLine2Think(pos, angle, pos1);
	wait 0.01;
}

ZipLine2Think(pos, angle, pos1)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 to use Zipline[^2$^31000^7]" );
		}
		if(Distance(pos, Player.origin) > 50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.money >= 1000 && player.pers["team"] == "allies" && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			level.zipline setContents(1);
			player thread ZiplineNoMove();
			player.money -= 1000;
			player notify("MONEY");
			player thread maps\mp\gametypes\_rank::scorePopup( -1000, 0, (1,0,0), 1 );
			player thread AImod\_Mod::TextPopup( "ZipLine!" );
			player setorigin(level.zipline2.origin+(0,0,10));
			level.zipline2 MoveTo(pos1, 4);
			wait 4;
			level.zipline2 setContents(0);
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
			level.zipline2 MoveTo(pos, 10);
			wait 10;
			level.zipline2 setContents(1);
			level.helper2 delete();
			level notify("boxend");
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money <= 1000 && player useButtonPressed())
		{
			player iPrintln("^1Not enough money for ZipLine Need $1000!");
			wait 1;
		}
		wait 0.01;
	}
}

Elevator(pos, angle, pos1)
{
	level.elevator = spawn("script_model", pos );
	level.elevator setModel("com_plasticcase_friendly");
	level.elevator.angles = angle;
	level.elevator CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	level.elevator setContents(1);
	trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
	trigger.angles = angle;
	trigger thread ElevatorThink(pos, angle, pos1);
	wait 0.01;
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

ElevatorThink(pos, angle, pos1)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 to use Elevator[^2$^3750^7]" );
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
			player thread maps\mp\gametypes\_rank::scorePopup( -750, 0, (1,0,0), 1 );
			player thread AImod\_Mod::TextPopup( "Elevator!" );
			player setorigin(level.elevator.origin+(0,0,10));
			level.elevator MoveTo(pos1, 6);
			wait 6;
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
			wait 10;
			level.elevator MoveTo(pos, 6);
			wait 6;
			level notify("boxend");
		}
		else if(Distance(pos, Player.origin) <= 75 && player.money <= 750 && player useButtonPressed())
		{
			player iPrintln("^1Not enough money for Elevator Need $750!");
			wait 1;
		}
		wait 0.01;
	}
}

SpawnObjects()
{
	ZipLine((1595,3988,315),(0,0,0),(1617,3050,197));
	ZipLine2((1401,4040,315),(0,90,0),(619,3836,357));
	Elevator((1771,3938,42),(0,0,0),(1791,3945,306));
}