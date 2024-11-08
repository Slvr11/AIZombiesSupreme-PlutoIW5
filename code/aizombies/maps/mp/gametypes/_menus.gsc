#include maps\mp\_utility;

init()
{
	if ( !isDefined( game["gamestarted"] ) )
	{
		game["menu_team"] = "team_marinesopfor";
		game["menu_class_allies"] = "class_marines";
		game["menu_changeclass_allies"] = "changeclass_marines";
		game["menu_initteam_allies"] = "initteam_marines";
		game["menu_class_axis"] = "class_opfor";
		game["menu_changeclass_axis"] = "changeclass_opfor";
		game["menu_initteam_axis"] = "initteam_opfor";
		game["menu_class"] = "class";
		game["menu_changeclass"] = "changeclass";
		game["menu_controls"] = "ingame_controls";
	
		if ( !level.console )
		{
			game["menu_muteplayer"] = "muteplayer";
			precacheMenu(game["menu_muteplayer"]);			
		}
		else
		{
			game["menu_leavegame"] = "popup_leavegame";

			precacheMenu(game["menu_leavegame"]);
			
			//precacheMenu("status_update");
		}
	
		precacheMenu("scoreboard");
		precacheMenu(game["menu_team"]);
		precacheMenu(game["menu_class_allies"]);
		precacheMenu(game["menu_changeclass_allies"]);
		precacheMenu(game["menu_initteam_allies"]);
		precacheMenu(game["menu_class_axis"]);
		precacheMenu(game["menu_changeclass_axis"]);
		precacheMenu(game["menu_class"]);
		precacheMenu(game["menu_changeclass"]);
		precacheMenu(game["menu_initteam_axis"]);
		//precacheMenu(game["menu_onemanarmy"]);
	}

	level thread onPlayerConnect();
}

onPlayerConnect()
{
	for(;;)
	{
		level waittill("connected", player);

		player thread onMenuResponse();
	}
}


isOptionsMenu( menu )
{
	if ( menu == game["menu_changeclass"] )
		return true;
		
	if ( menu == game["menu_team"] )
		return true;

	if ( menu == game["menu_controls"] )
		return true;

	if ( isSubStr( menu, "pc_options" ) )
		return true;

	return false;
}


onMenuResponse()
{
	self endon("disconnect");
	
	for(;;)
	{
		self waittill("menuresponse", menu, response);
		
		if ( response == "back" )
		{
			self closepopupMenu();
			self closeInGameMenu();

			if ( isOptionsMenu( menu ) )
			{
				if( self.pers["team"] == "allies" )
					self openpopupMenu( game["menu_class_allies"] );
				if( self.pers["team"] == "axis" )
					self openpopupMenu( game["menu_class_axis"] );
			}
			continue;
		}
		
		if(response == "changeteam")
		{
			self closepopupMenu();
			self closeInGameMenu();
			//self openpopupMenu(game["menu_team"]);
			self iPrintLnBold(level.gameStrings[18]);
		}
	
		if(response == "changeclass_marines" )
		{
			self closepopupMenu();
			self closeInGameMenu();
			//self openpopupMenu( game["menu_changeclass_allies"] );
			self iPrintLnBold(level.gameStrings[18]);
			continue;
		}

		if(response == "changeclass_opfor" )
		{
			self closepopupMenu();
			self closeInGameMenu();
			self openpopupMenu( game["menu_changeclass_axis"] );
			continue;
		}

		//if(response == "changeclass_marines_splitscreen" )
			//self openpopupMenu( "changeclass_marines_splitscreen" );

		//if(response == "changeclass_opfor_splitscreen" )
			//self openpopupMenu( "changeclass_opfor_splitscreen" );
		
		if(response == "endgame")
		{
			if(level.splitscreen)
			{
				endparty();

				if ( !level.gameEnded )
				{
					level thread maps\mp\gametypes\_gamelogic::forceEnd();
				}
			}
				
			continue;
		}

		if ( response == "endround" )
		{
			if ( !level.gameEnded )
			{
				level thread maps\mp\gametypes\_gamelogic::forceEnd();
			}
			else
			{
				self closepopupMenu();
				self closeInGameMenu();
				self iprintln( &"MP_HOST_ENDGAME_RESPONSE" );
			}			
			continue;
		}

		if(menu == game["menu_team"])
		{
			switch(response)
			{
			case "allies":
				//self [[level.allies]]();
				break;

			case "axis":
				//self [[level.axis]]();
				break;

			case "autoassign":
				//self [[level.autoassign]]();
				break;

			case "spectator":
				//self [[level.spectator]]();
				break;
			}
			self iPrintLnBold(level.gameStrings[18]);
		}	// the only responses remain are change class events
		else if ( menu == game["menu_changeclass"] ||
				( isDefined( game["menu_changeclass_defaults_splitscreen"] ) && menu == game["menu_changeclass_defaults_splitscreen"] ) ||
				( isDefined( game["menu_changeclass_custom_splitscreen"] ) && menu == game["menu_changeclass_custom_splitscreen"] ) )
		{
			self closepopupMenu();
			self closeInGameMenu();

			self.selectedClass = true;
			self iPrintLnBold(level.gameStrings[18]);
			//self [[level.class]](response);
		}
		else if ( !level.console )
		{
			if(menu == game["menu_quickcommands"])
				maps\mp\gametypes\_quickmessages::quickcommands(response);
			else if(menu == game["menu_quickstatements"])
				maps\mp\gametypes\_quickmessages::quickstatements(response);
			else if(menu == game["menu_quickresponses"])
				maps\mp\gametypes\_quickmessages::quickresponses(response);
		}
	}
}


getTeamAssignment()
{
	return "allies";
}


menuAutoAssign()
{
	self closeMenus();
}


beginClassChoice( forceNewChoice )
{
	self bypassClassChoice();
}


//	JDS TODO: this will become a level.onClassChoice so private matches can override class selection
bypassClassChoice()
{
	self.selectedClass = true;
	//self [[level.class]]("class0");	
}


beginTeamChoice()
{
}


showMainMenuForTeam()
{
}

menuAllies()
{
	self closeMenus();
	self iPrintLnBold(level.gameStrings[18]);
}


menuAxis()
{
	self closeMenus();
	self iPrintLnBold(level.gameStrings[18]);
}


menuSpectator()
{
	self closeMenus();
	
	if( isDefined( self.pers["team"] ) && self.pers["team"] == "spectator" )
		return;

	if( isAlive( self ) )
	{
		assert( isDefined( self.pers["team"] ) );
		self.switching_teams = true;
		self.joining_team = "spectator";
		self.leaving_team = self.pers["team"];
		self suicide();
	}

	self addToTeam( "spectator" );
	self.pers["class"] = undefined;
	self.class = undefined;

	self thread maps\mp\gametypes\_playerlogic::spawnSpectator();
}


menuClass( response )
{
	self closeMenus();
	self iPrintLnBold(level.gameStrings[18]);
}



addToTeam( team, firstConnect )
{
}
