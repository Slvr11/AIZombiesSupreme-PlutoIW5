#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;

Init()
{
    level thread PrecacheWasteland();
	level thread SpawnObjects();
}

PrecacheWasteland()
{

}

Teleporter(pos, angle, end)
{
	level.teleporter = spawn("script_model", pos );
	level.teleporter setModel("com_plasticcase_friendly");
	level.teleporter.angles = angle;
	level.teleporter CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	level.teleporter setContents(1);
	trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
	trigger.angles = angle;
	trigger thread TeleporterThink(pos, angle, end);
	wait 0.01;
}

TeleporterThink(pos, angle, end)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 to use Teleporter" );
		}
		if(Distance(pos, Player.origin) > 50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.pers["team"] == "allies" && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			player thread AImod\_Mod::TextPopup( "Teleporter!" );
			player setorigin(end);
			level notify("boxend");
		}
		wait 0.01;
	}
}

Teleporter2(pos, angle, end)
{
	level.teleporter = spawn("script_model", pos );
	level.teleporter setModel("com_plasticcase_friendly");
	level.teleporter.angles = angle;
	level.teleporter CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	level.teleporter setContents(1);
	trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
	trigger.angles = angle;
	trigger thread TeleporterThink(pos, angle, end);
	wait 0.01;
}

SpawnObjects()
{
	Teleporter((10703,6942,358),(0,0,0),(11371,7212,1486));
	Teleporter2((10713,7023,1486),(0,90,0),(9845,7341,358));
}

WaypointInit()
{
	level.botwaypoints[0] = SpawnStruct();
	level.botwaypoints[0].origin = (10860,6414,358);
	level.botwaypoints[1] = SpawnStruct();
	level.botwaypoints[1].origin = (9972,6588,358);
	level.botwaypoints[2] = SpawnStruct();
	level.botwaypoints[2].origin = (9901,7736,358);
	level.botwaypoints[3] = SpawnStruct();
	level.botwaypoints[3].origin = (9856,8772,358);
	level.botwaypoints[4] = SpawnStruct();
	level.botwaypoints[4].origin = (9535,8017,358);
	level.botwaypoints[5] = SpawnStruct();
	level.botwaypoints[5].origin = (9591,6754,358);
	level.botwaypoints[6] = SpawnStruct();
	level.botwaypoints[6].origin = (10570,6826,358);
	level.botwaypoints[7] = SpawnStruct();
	level.botwaypoints[7].origin = (10855,7218,1486);
	level.botwaypoints[8] = SpawnStruct();
	level.botwaypoints[8].origin = (12034,7271,1494);
	level.botwaypoints[9] = SpawnStruct();
	level.botwaypoints[9].origin = (12824,7364,1486);
}