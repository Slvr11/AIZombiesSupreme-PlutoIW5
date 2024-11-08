#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;

WaypointInit()
{
	level.botwaypoints[0] = SpawnStruct();
	level.botwaypoints[0].origin = (3050,2724,40);
	level.botwaypoints[1] = SpawnStruct();
	level.botwaypoints[1].origin = (2579,2791,37);
	level.botwaypoints[2] = SpawnStruct();
	level.botwaypoints[2].origin = (2213,2807,57);
	level.botwaypoints[3] = SpawnStruct();
	level.botwaypoints[3].origin = (2239,3211,60);
	level.botwaypoints[4] = SpawnStruct();
	level.botwaypoints[4].origin = (1683,2902,46);
	level.botwaypoints[5] = SpawnStruct();
	level.botwaypoints[5].origin = (1254,2882,64);
	level.botwaypoints[6] = SpawnStruct();
	level.botwaypoints[6].origin = (1031,2863,96);
	level.botwaypoints[7] = SpawnStruct();
	level.botwaypoints[7].origin = (1877,2481,16);
	level.botwaypoints[8] = SpawnStruct();
	level.botwaypoints[8].origin = (1863,2102,16);
}