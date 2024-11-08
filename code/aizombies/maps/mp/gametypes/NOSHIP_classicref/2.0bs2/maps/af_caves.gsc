#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;

WaypointInit()
{

}

Init()
{
    level thread PrecacheCaves();
	level thread SpawnObjects();
}

PrecacheCaves()
{

}

Checkposition()
{
	while( true )
	{						
		foreach(player in level.players)
		{
			if( !isDefined( player.isPorting ) )
				player.isPorting = false;
				
			if( player _hasPerk("specialty_falldamage"))
				player _unsetPerk("specialty_falldamage");

			if(player.origin[2] < -2000 && !player.isPorting)
				if( level.zState != "intermission" )
					player thread TeleportBack();
		}
		wait (1/30);
		
	}
}

TeleportBack()
{
	self.isPorting = true;
	self ShellShock( "concussion_grenade_mp", 1 );
	self _setPerk("specialty_falldamage");
	wait 0.3;
	self setOrigin( (3231.62, 12620.2, -1826.82) );
	self notify("port_back");
	wait 0.3;
	self _unsetPerk("specialty_falldamage");
	self.isPorting = false;
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
		if(Distance(pos, Player.origin) < 50)
		{
			if( level.zState != "intermission" )
				Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 to use Teleporter for 40 seconds [^2$^31000^7]" );
			else
				Player setLowerMessage("activate", "Hold ^3[{+activate}]^7 to use Teleporter till roundstart [^2Free^7]" );
				
			if(player useButtonPressed())
			{
				player ClearLowerMessage("activate", 1);
				if( level.zState != "intermission" )
				{
					if( player.money < 1000)
						continue;
						
					player.isPorting = true;
					player.money -= 1000;
					player notify("MONEY");
				}
				player ShellShock( "frag_grenade_mp", 1 );
				wait 0.5;
				player ShellShock( "concussion_grenade_mp", 3 );
				player thread AImod\_Mod::TextPopup( "Teleported!" );
				player.oldorigin = self.origin;
				player setorigin(end);
				player setplayerangles((0,270,0));
				player thread SpawnBack(40);
				level notify("boxend");
			}
		}
		else
		{
			Player ClearLowerMessage("activate", 1);
		}
		wait (1/30);
	}
}

SpawnBack(time)
{
	self endon("port_back");
	wait time;
	self.isPorting = false;
}

SpawnObjects()
{
	level thread Checkposition();
	level thread Teleporter((3161.78, 10606.4, -1875.01), (0, 152.494, 0), (2289.3, 11638, -3824.29));
}