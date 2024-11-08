#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;

Init()
{
	level thread SpawnObjects();
}

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

BotSpawnsHighrise2()
{
	spawn = [];
	if(level.progressmap == 0)
	{
		spawn[spawn.size] = (1563,10638,3376);
		spawn[spawn.size] = (1548,11128,3376);
		spawn[spawn.size] = (1434,11622,3376);
		spawn[spawn.size] = (1455,10273,3376);
	}	
	else if(level.progressmap == 1)
	{
		spawn[spawn.size] = (1469,11194,4080);
		spawn[spawn.size] = (1470,10902,4080);
		spawn[spawn.size] = (1472,10495,4080);
		spawn[spawn.size] = (1982,10727,4080);
	}	
	else if(level.progressmap == 2)
	{
		spawn[spawn.size] = (4652,3148,2360);
		spawn[spawn.size] = (4405,3152,2360);
		spawn[spawn.size] = (4052,3159,2360);
		spawn[spawn.size] = (4195,2842,2360);
	}	
	return spawn[randomint(spawn.size)];	
}

Elevator(pos, angle, pos1)
{
	block = spawn("script_model", pos );
	block setModel("com_plasticcase_friendly");
	block.angles = angle;
	block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	block setContents(1);
	trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
	trigger.angles = angle;
	trigger thread ElevatorThink(pos, angle, pos1, block);
	wait 0.01;
}

ElevatorThink(pos, angle, pos1,block)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 to use Elevator" );
		}
		if(Distance(pos, Player.origin) > 50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.pers["team"] == "allies" && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			block setContents(0);
			player playerlinkto(block);
			player thread AImod\_Mod::TextPopup( "Elevator!" );
			block MoveTo(pos1, 3);
			wait 3;
			player unlink();
			block MoveTo(pos, 2);
			wait 2;
			block setContents(1);
			level notify("boxend");
		}
		wait 0.01;
	}
}

Zipline(pos, angle, pos1)
{
	block = spawn("script_model", pos );
	block setModel("com_plasticcase_friendly");
	block.angles = angle;
	block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	block setContents(1);
	trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
	trigger.angles = angle;
	trigger thread ZiplineThink(pos, angle, pos1, block);
	wait 0.01;
}

ZiplineThink(pos, angle, pos1,block)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
			Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 to use Zipline" );
		}
		if(Distance(pos, Player.origin) > 50)
		{
			Player ClearLowerMessage("activate", 1);
		}
		if(Distance(pos, Player.origin) <= 75 && player.pers["team"] == "allies" && player useButtonPressed())
		{
			player ClearLowerMessage("activate", 1);
			block setContents(0);
			player playerlinkto(block);
			player thread AImod\_Mod::TextPopup( "Zipline!" );
			block MoveTo(pos1, 5);
			wait 5;
			player unlink();
			block MoveTo(pos, 2);
			wait 2;
			block setContents(1);
			level notify("boxend");
		}
		wait 0.01;
	}
}

SpawnObjects()
{
	Elevator((1319,10828,3376),(0,90,0),(1319,10828,4100));
	Elevator((1808,11462,4075),(0,0,0),(1808,11462,3376));
	Zipline((3000,9943,3376),(0,0,0),(3705,3599,2420));
	Zipline((4191,3705,2360),(0,0,0),(1681,10073,3429));
}