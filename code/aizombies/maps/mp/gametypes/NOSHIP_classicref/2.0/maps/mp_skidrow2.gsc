#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;

Init()
{
    level thread PrecacheSkidrow();
	level thread SpawnObjects();
}

PrecacheSkidrow()
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
			player.health = player.maxhealth;
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
			level.zipline MoveTo(pos, 15);
			wait 15;
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
	ZipLine((822,-1730,190),(0,0,0),(1785,-43,223));
}

WaypointInit()
{
	level.botwaypoints[0] = SpawnStruct();
	level.botwaypoints[0].origin = (1450,-968,16);
	level.botwaypoints[1] = SpawnStruct();
	level.botwaypoints[1].origin = (1438,-1278,8);
	level.botwaypoints[2] = SpawnStruct();
	level.botwaypoints[2].origin = (1168,-961,16);
	level.botwaypoints[3] = SpawnStruct();
	level.botwaypoints[3].origin = (1035,-1194,8);
	level.botwaypoints[4] = SpawnStruct();
	level.botwaypoints[4].origin = (1011,-1427,8);
	level.botwaypoints[5] = SpawnStruct();
	level.botwaypoints[5].origin = (1235,-1509,16);
	level.botwaypoints[6] = SpawnStruct();
	level.botwaypoints[6].origin = (1410,-1618,16);
	level.botwaypoints[7] = SpawnStruct();
	level.botwaypoints[7].origin = (554,-1093,8);
	level.botwaypoints[8] = SpawnStruct();
	level.botwaypoints[8].origin = (444,-1485,8);
	level.botwaypoints[9] = SpawnStruct();
	level.botwaypoints[9].origin = (418,-1900,16);
	level.botwaypoints[10] = SpawnStruct();
	level.botwaypoints[10].origin = (722,-1979,48);
	level.botwaypoints[11] = SpawnStruct();
	level.botwaypoints[11].origin = (935,-1966,48);
	level.botwaypoints[12] = SpawnStruct();
	level.botwaypoints[12].origin = (1001,-2135,49);
	level.botwaypoints[13] = SpawnStruct();
	level.botwaypoints[13].origin = (837,-2147,192);
	level.botwaypoints[14] = SpawnStruct();
	level.botwaypoints[14].origin = (922,-2143,113);
	level.botwaypoints[15] = SpawnStruct();
	level.botwaypoints[15].origin = (909,-1858,192);
	level.botwaypoints[16] = SpawnStruct();
	level.botwaypoints[16].origin = (1249,-576,16);
	level.botwaypoints[17] = SpawnStruct();
	level.botwaypoints[17].origin = (1542,-400,16);
	level.botwaypoints[18] = SpawnStruct();
	level.botwaypoints[18].origin = (1650,-113,16);
	level.botwaypoints[19] = SpawnStruct();
	level.botwaypoints[19].origin = (1487,140,16);
	level.botwaypoints[20] = SpawnStruct();
	level.botwaypoints[20].origin = (1192,100,8);
	level.botwaypoints[21] = SpawnStruct();
	level.botwaypoints[21].origin = (894,3,16);
	level.botwaypoints[22] = SpawnStruct();
	level.botwaypoints[22].origin = (777,-556,16);
	level.botwaypoints[23] = SpawnStruct();
	level.botwaypoints[23].origin = (761,-850,16);
	level.botwaypoints[24] = SpawnStruct();
	level.botwaypoints[24].origin = (790,-227,20);
	level.botwaypoints[25] = SpawnStruct();
	level.botwaypoints[25].origin = (158,-189,16);
	level.botwaypoints[26] = SpawnStruct();
	level.botwaypoints[26].origin = (-96,18,16);
	level.botwaypoints[27] = SpawnStruct();
	level.botwaypoints[27].origin = (-5,-412,24);
	level.botwaypoints[28] = SpawnStruct();
	level.botwaypoints[28].origin = (6,-760,16);
	level.botwaypoints[29] = SpawnStruct();
	level.botwaypoints[29].origin = (397,-743,16);
	level.botwaypoints[30] = SpawnStruct();
	level.botwaypoints[30].origin = (231,-134,24);
}