#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;

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

SpawnObjects()
{
    Tree1((984,2536,75),(0,90,0));
	ZipLine((1403,3316,75),(0,0,0),(1638, 3308,252),(1630, 2414,252),(1052, 2402,130),(1047, 2902,96),(1009, 3261,130));
	Tree2((356,2381,128),(0,90,0));
}