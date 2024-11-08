#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;

WaypointInit()
{
	level.botwaypoints[0] = SpawnStruct();
	level.botwaypoints[0].origin = (-829,-1855,128);
	level.botwaypoints[1] = SpawnStruct();
	level.botwaypoints[1].origin = (-989,-2222,119);
	level.botwaypoints[2] = SpawnStruct();
	level.botwaypoints[2].origin = (-1049,-3115,85);
	level.botwaypoints[3] = SpawnStruct();
	level.botwaypoints[3].origin = (-983,-3778,68);
}