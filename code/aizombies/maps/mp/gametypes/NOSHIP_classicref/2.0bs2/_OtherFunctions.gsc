#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

precacheItems()
{
game["strings"]["MP_HORDE_BEGINS_IN"] = "Next Round In:";
game["strings"]["MONEYTEXT"] = "^2Money $";
game["strings"]["MONEYTEXT2"] = "^1Money $";
game["strings"]["MONEYTEXT3"] = "^3Money $";
game["strings"]["BONUSTEXT"] = "^5BonusPoints";

precacheString(game["strings"]["MP_HORDE_BEGINS_IN"]);
precacheString(game["strings"]["MONEYTEXT"]);
precacheString(game["strings"]["MONEYTEXT2"]);
precacheString(game["strings"]["MONEYTEXT3"]);
precacheString(game["strings"]["BONUSTEXT"]);
}

FuncsMain()
{
level.SpawnTrigger = AImod\_botUtil::SpawnTrigger;
level.SpawnWeapon = AImod\_botUtil::SpawnWeapon;
level.SpawnClient = maps\mp\gametypes\_playerlogic::spawnPlayer;
}

GiveWeaponAndAmmo( WeaponName, CamoID, Akimbo ){
	self giveWeapon( WeaponName, CamoID, Akimbo );
	self GiveMaxAmmo( WeaponName );
}

setAC130Options( FlareAmount, UseDuration )
{
	level.ac130_use_duration = UseDuration;
	level.ac130_num_flares = FlareAmount;
}

setRecoilScale( scale )
{
	self player_recoilScaleOn( scale );
}

VectorScale(vec, scale)
{
	vec = (vec[0] * scale, vec[1] * scale, vec[2] * scale);
	return vec;
}

GetHost( )
{
	if( isDefined( level.host ) )
		return level.host;
		
	foreach( player in level.players )
	{
		if(player isHost())
		{
			level.host = player;
			return player;
		}
	}
	
	return 0;
}

PlaySoundToEveryone( sound )
{
	foreach( player in level.players )
	{
		player playLocalSound( sound );
	}
}

CreateWayPoint( x, y, z )
{
	waypoint = SpawnStruct();
	waypoint.origin = ( x, y, z );
	
	return waypoint;
}

DestroyOnDeath( hudElem )
{
	self waittill ( "death" );
	hudElem destroy();
}

BotDestroyOnDeath( icon )
{
	self waittill("bot_death");
	icon destroy();
}

SetVision(time)
{
	mapname = getDvar("mapname");
	if(!isDefined(time))
		time = 0;
	else if(mapname == "mp_boneyard")
	{
		self VisionSetNakedForPlayer( "cobra_sunset3", time );
		self.brightness = -0.07;
		self setClientDvar("r_brightness", self.brightness);
	}
	else if(mapname == "mp_nightshift" && level.edit == 0)
	{
		self VisionSetNakedForPlayer( "icbm_sunrise2", time );
		self.brightness = -0.05;
		self setClientDvar("r_brightness", self.brightness);
	}
	else if(mapname == "mp_nightshift" && level.edit == 1)
	{
		self VisionSetNakedForPlayer( "cobra_sunset1", time );
		self.brightness = -0.05;
		self setClientDvar("r_brightness", self.brightness);
	}
	else if(mapname == "mp_nightshift" && level.edit == 2)
	{
		self VisionSetNakedForPlayer( "cobra_sunset3", time );
		self.brightness = -0.08;
		self setClientDvar("r_brightness", self.brightness);
	}
	else if(mapname == "mp_afghan")
	{
		self VisionSetNakedForPlayer( "default", time );
	}
	else if(mapname == "mp_underpass")
	{
		self VisionSetNakedForPlayer( "cobra_sunset1", time );
		self.brightness = -0.08;
		self setClientDvar("r_brightness", self.brightness);
	}
	else if(mapname == "mp_trailerpark")
	{
		self VisionSetNakedForPlayer( "cobra_sunset2", time );
		self.brightness = -0.06;
		self setClientDvar("r_brightness", self.brightness);
	}
	else if(mapname == "mp_quarry")
	{
		self VisionSetNakedForPlayer( "cobra_sunset3", time );
		self.brightness = -0.06;
		self setClientDvar("r_brightness", self.brightness);
	}
	else if(mapname == "mp_rust")
	{
		self VisionSetNakedForPlayer( "cobra_sunset1", time );
		self.brightness = -0.02;
		self setClientDvar("r_brightness", self.brightness);
	}
	else if(mapname == "mp_compact")
	{
		self VisionSetNakedForPlayer( "cobra_sunset3", time );
		self.brightness = -0.04;
		self setClientDvar("r_brightness", self.brightness);
	}
	else if(mapname == "mp_strike")
	{
		self VisionSetNakedForPlayer( "cobra_sunset2", 1 );
		self.brightness = -0.05;
		self setClientDvar("r_brightness", self.brightness);
	}
	else if(mapname == "mp_highrise" && level.edit == 0)
	{
		self VisionSetNakedForPlayer( "mp_highrise", time );
	}
	else if(mapname == "mp_highrise" && level.edit == 1)
	{
		self VisionSetNakedForPlayer( "mp_highrise", time );
		self.brightness = -0.07;
		self setClientDvar("r_brightness", self.brightness);
	}
	else if(mapname == "mp_derail")
	{
		self VisionSetNakedForPlayer( "mp_derail", time );
		self.brightness = -0.07;
		self setClientDvar("r_brightness", self.brightness);
	}
	else if(mapname == "mp_terminal")
	{
		self VisionSetNakedForPlayer( "oilrig_exterior_deck0", time );
	}
	else if(mapname == "mp_brecourt")
	{
		self VisionSetNakedForPlayer( "mp_brecourt", time );
	}
	else if(mapname == "mp_subbase")
	{
		self VisionSetNakedForPlayer( "mp_derail", time );
	}
	else if(mapname == "mp_favela" && level.edit == 0)
	{
		self VisionSetNakedForPlayer( "mp_favela", time );
	}
	else if(mapname == "mp_favela" && level.edit == 1)
	{
		self VisionSetNakedForPlayer( "mp_subbase", time );
	}
	else if(mapname == "mp_favela" && level.edit == 2)
	{
		self VisionSetNakedForPlayer( "mp_complex", time );
	}
	else if(mapname == "mp_checkpoint")
	{
		self VisionSetNakedForPlayer( "cobra_sunset2", time );
	}
	else if(mapname == "mp_rundown")
	{
		self VisionSetNakedForPlayer( "mp_downtown_la", time );
	}
	else if(mapname == "mp_complex")
	{
		self VisionSetNakedForPlayer( "mp_complex", time );
	}
	else if(mapname == "mp_invasion")
	{
		self VisionSetNakedForPlayer( "mp_invasion", time );
	}
	else if(mapname == "mp_estate")
	{
		self VisionSetNakedForPlayer( "mp_estate", time );
	}
	else if(mapname == "mp_abandon")
	{
		self VisionSetNakedForPlayer( "mp_abandon", time );
	}
	else if(mapname == "mp_vacant")
	{
		self VisionSetNakedForPlayer( "mp_vacant", time );
	}
	else if(mapname == "mp_storm")
	{
		self VisionSetNakedForPlayer( "mp_storm", time );
	}
	else if(mapname == "mp_fuel2")
	{
		self VisionSetNakedForPlayer( "mp_fuel2", time );
	}
	else if(mapname == "mp_overgrown")
	{
		self VisionSetNakedForPlayer( "mp_overgrown", time );
	}
	else if(mapname == "mp_crash")
	{
		self VisionSetNakedForPlayer( "mp_crash", time );
	}
	else if(mapname == "estate")
	{
		self VisionSetNakedForPlayer( "estate", time );
	}
	else if(mapname == "arcadia")
	{
		self VisionSetNakedForPlayer( "arcadia", time );
	}
	else if(mapname == "airport")
	{
		self VisionSetNakedForPlayer( "airport", time );
	}
	else if(mapname == "co_hunted")
	{
		self VisionSetNakedForPlayer( "co_hunted", time );
	}
	else if(mapname == "oilrig")
	{
		self VisionSetNakedForPlayer( "oilrig", time );
	}
	else if(mapname == "mp_nuked")
	{
		self VisionSetNakedForPlayer( "mp_nuked", time );
	}
	else if(mapname == "invasion")
	{
		self VisionSetNakedForPlayer( "invasion", time );
	}
	else if(mapname == "mp_cross_fire")
	{
		self VisionSetNakedForPlayer("mp_cross_fire", time);
	}
	else if(mapname == "contingency")
	{
		self VisionSetNakedForPlayer("contingency", time);
	}
	else if(mapname == "af_caves")
	{
		self VisionSetNakedForPlayer("af_caves_hostile", time);
	}
	else if(mapname == "favela")
	{
		self VisionSetNakedForPlayer("favela", time);
	}
	else if(level.day == 1)
	{
		self VisionSetNakedForPlayer( getDvar( "mapname" ), time );
	}
	else if(level.crawlers == 1)
	{
		self VisionSetNakedForPlayer( "cobra_sunset3", time );
	}
	else if(level.boss == 1)
	{
		self VisionSetNakedForPlayer( "cobra_sunset1", time );
	}
	else if(level.hellzombie == 1)
	{
		self VisionSetNakedForPlayer( "cobra_sunset2", time );
	}
	else if(level.hellboss == 1)
	{
		self VisionSetNakedForPlayer( "cobra_sunset3", time );
	}
}

SetVisionPain()
{
	mapname = getDvar("mapname");
	if(mapname == "mp_boneyard")
	{
		VisionSetPain("cobra_sunset3");
	}
	else if(mapname == "mp_nightshift" && level.edit == 0)
	{
		VisionSetPain("icbm_sunrise2");
	}
	else if(mapname == "mp_nightshift" && level.edit == 1)
	{
		VisionSetPain("cobra_sunset1");
	}
	else if(mapname == "mp_nightshift" && level.edit == 2)
	{
		VisionSetPain("cobra_sunset3");
	}
	else if(mapname == "mp_afghan")
	{
		VisionSetPain("default");
	}
	else if(mapname == "mp_underpass")
	{
		VisionSetPain("cobra_sunset1");
	}
	else if(mapname == "mp_trailerpark")
	{
		VisionSetPain("cobra_sunset2");
	}
	else if(mapname == "mp_quarry")
	{
		VisionSetPain("cobra_sunset3");
	}
	else if(mapname == "mp_rust")
	{
		VisionSetPain("cobra_sunset1");
	}
	else if(mapname == "mp_compact")
	{
		VisionSetPain("cobra_sunset3");
	}
	else if(mapname == "mp_strike")
	{
		VisionSetPain("cobra_sunset2");
	}
	else if(mapname == "mp_highrise" && level.edit == 0)
	{
		VisionSetPain("mp_highrise");
	}
	else if(mapname == "mp_highrise" && level.edit == 1)
	{
		VisionSetPain("mp_highrise");
	}
	else if(mapname == "mp_derail")
	{
		VisionSetPain("mp_derail");
	}
	else if(mapname == "mp_terminal")
	{
		VisionSetPain("oilrig_exterior_deck0");
	}
	else if(mapname == "mp_brecourt")
	{
		VisionSetPain("mp_brecourt");
	}
	else if(mapname == "mp_subbase")
	{
		VisionSetPain("mp_derail");
	}
	else if(mapname == "mp_favela" && level.edit == 0)
	{
		VisionSetPain("mp_favela");
	}
	else if(mapname == "mp_favela" && level.edit == 1)
	{
		VisionSetPain("mp_subbase");
	}
	else if(mapname == "mp_favela" && level.edit == 2)
	{
		VisionSetPain("mp_complex");
	}
	else if(mapname == "mp_checkpoint")
	{
		VisionSetPain("cobra_sunset2");
	}
	else if(mapname == "mp_rundown")
	{
		VisionSetPain("mp_downtown_la");
	}
	else if(mapname == "mp_complex")
	{
		VisionSetPain("mp_complex");
	}
	else if(mapname == "mp_invasion")
	{
		VisionSetPain("mp_invasion");
	}
	else if(mapname == "mp_estate")
	{
		VisionSetPain("mp_estate");
	}
	else if(mapname == "mp_abandon")
	{
		VisionSetPain("mp_abandon");
	}
	else if(mapname == "mp_vacant")
	{
		VisionSetPain("mp_vacant");
	}
	else if(mapname == "mp_storm")
	{
		VisionSetPain("mp_storm");
	}
	else if(mapname == "mp_fuel2")
	{
		VisionSetPain("mp_fuel2");
	}
	else if(mapname == "mp_overgrown")
	{
		VisionSetPain("mp_overgrown");
	}
	else if(mapname == "mp_crash")
	{
		VisionSetPain("mp_crash");
	}
	else if(mapname == "estate")
	{
		VisionSetPain("estate");
	}
	else if(mapname == "arcadia")
	{
		VisionSetPain("arcadia");
	}
	else if(mapname == "airport")
	{
		VisionSetPain("airport");
	}
	else if(mapname == "co_hunted")
	{
		VisionSetPain("co_hunted");
	}
	else if(mapname == "oilrig")
	{
		VisionSetPain("oilrig");
	}
	else if(mapname == "mp_nuked")
	{
		VisionSetPain("mp_nuked");
	}
	else if(mapname == "invasion")
	{
		VisionSetPain("invasion");
	}
	else if(mapname == "mp_cross_fire")
	{
		VisionSetPain("mp_cross_fire");
	}
	else if(mapname == "contingency")
	{
		VisionSetPain("contingency");
	}
	else if(mapname == "af_caves")
	{
		VisionSetPain("af_caves");
	}
	else if(mapname == "favela")
	{
		VisionSetPain("favela");
	}
	else if(level.day == 1)
	{
		VisionSetPain( getDvar( "mapname" ));
	}
	else if(level.crawlers == 1)
	{
		VisionSetPain( "cobra_sunset3");
	}
	else if(level.boss == 1)
	{
		VisionSetPain( "cobra_sunset1");
	}
	else if(level.hellzombie == 1)
	{
		VisionSetPain( "cobra_sunset2");
	}	
	else if(level.hellboss == 1)
	{
		VisionSetPain( "cobra_sunset3");
	}
}

KillEnt( ent, time )
{
    wait time;
	ent hide();
    ent delete();
	ent destroy();
}

TimePlayed()
{
	while(1)
	{
	    wait 1;
		self.timeplayed += 1;
	}
}

UpdateTimePlayed()
{
    while(1)
	{
	    if(level.timeplayed >= 60)
		{
			level.timeplayedminutes += 1;
			level.timeplayed = 0;
		}
		else
		{
			level.timeplayed += 1;
			wait 0.1;
		}
	    wait 1;
	}
}

CustomMapnames()
{
	name = undefined;
	mapname = getDvar("mapname");
	if(mapname == "mp_afghan" && level.edit == 0)
	{
		name = "Desert Wasteland";
	}
	else if(mapname == "mp_afghan" && level.edit == 1)
	{
		name = "On the Edge";
	}
	else if(mapname == "mp_nightshift" && level.edit == 0)
	{
		name = "Sunrise Apartments";
	}
	else if(mapname == "mp_nightshift" && level.edit == 1)
	{
		name = "Rundown Apartments";
	}
	else if(mapname == "mp_nightshift" && level.edit == 2)
	{
		name = "River Canal";
	}
	else if(mapname == "mp_rust")
	{
		name = "Raging River";
	}
	else if(mapname == "mp_trailerpark")
	{
		name = "Abandoned Gas Station";
	}
	else if(mapname == "mp_boneyard")
	{
		name = "Deserted Entrance";
	}
	else if(mapname == "mp_quarry")
	{
		name = "High Cry";
	}
	else if(mapname == "mp_compact")
	{
		name = "Snowy Vacation";
	}
	else if(mapname == "mp_underpass")
	{
		name = "Shipping Yard";
	}
	else if(mapname == "mp_strike")
	{
		name = "Back Ally";
	}
	else if(mapname == "mp_highrise" && level.edit == 0)
	{
		name = "High Hilton";
	}
	else if(mapname == "mp_highrise" && level.edit == 1)
	{
		name = "The Twin Buildings";
	}
	else if(mapname == "mp_derail" && level.edit == 0)
	{
		name = "Frozen Warehouse";
	}
	else if(mapname == "mp_derail" && level.edit == 1)
	{
		name = "Frozen Train Tracks";
	}
	else if(mapname == "mp_terminal")
	{
		name = "Death Row";
	}
	else if(mapname == "mp_brecourt")
	{
		name = "B.Z.K Headquarters";
	}
	else if(mapname == "mp_subbase")
	{
		name = "Sub Pens of Hell";
	}
	else if(mapname == "mp_checkpoint")
	{
		name = "Shipping Dock";
	}
	else if(mapname == "mp_favela" && level.edit == 0)
	{
		name = "Rundown Town";
	}
	else if(mapname == "mp_favela" && level.edit == 1)
	{
		name = "Foggy Forest";
	}
	else if(mapname == "mp_favela" && level.edit == 2)
	{
		name = "Sea Side Village";
	}
	else if(mapname == "mp_estate")
	{
		name = "Falls of Hell";
	}
	else if(mapname == "estate")
	{
		name = "Safehouse";
	}
	else if(mapname == "mp_rundown")
	{
		name = "Old Shack";
	}
	else if(mapname == "mp_complex")
	{
		name = "Apartment Invasion";
	}
	else if(mapname == "mp_invasion")
	{
		name = "Mob of the Bridge";
	}
	else if(mapname == "mp_abandon")
	{
		name = "Carnival Parking Lot";
	}
	else if(mapname == "mp_vacant")
	{
		name = "Chernoybl Disaster";
	}
	else if(mapname == "mp_storm")
	{
		name = "Dryed Aqueduct";
	}
	else if(mapname == "mp_fuel2")
	{
		name = "Royal Oil Industries";
	}
	else if(mapname == "mp_overgrown")
	{
		name = "Overgrown Hell";
	}
	else if(mapname == "mp_crash")
	{
		name = "Hell Tunnel";
	}
	else if(mapname == "mp_nuked")
	{
		name = "Nuketown";
	}
	else if(mapname == "invasion")
	{
		name = "Summertime Hell";
	}
	else if(mapname == "mp_cross_fire")
	{
		name = "Alley of Hell";
	}
	else if(mapname == "contingency")
	{
		name = "Roadblock";
	}
	else if(mapname == "af_caves")
	{
		name = "Caves";
	}
	else if(mapname == "ending")
	{
		name = "Museum";
	}
	else if(mapname == "favela")
	{
		name = "Hotel";
	}
	else if(mapname == "arcadia")
	{
		name = "Arcadia";
	}
	else 
	{
		name = "Unknown/Invalid Map Name, _OtherFunctions.gsc";
	}
	return name;
}

HideGunParts(weapon)
{
	hideTagList = GetWeaponHideTags( weapon );
	if(!isDefined(hideTagList))
		return;
	for(i = 0; i < hideTagList.size; i++)
		self HidePart( hideTagList[ i ]);
}

HideGunPartsDOA(weapon)
{
	if(!IsSubStr( weapon, "silencer"))
		self HidePart("tag_silencer");
	if(!IsSubStr( weapon, "reflex" ))
	{
		self HidePart("tag_red_dot");
		self HidePart("tag_tavor_scope");
	}
	if(!IsSubStr( weapon, "thermal" ))
	{
		self HidePart("tag_thermal_scope");
	}
	if(!IsSubStr( weapon, "eotech" ))
	{
		self HidePart("tag_eotech");
		self HidePart("tag_fn2000_scope");
		self HidePArt("tag_rail");
	}
	if(IsSubStr( weapon, "eotech" ) || IsSubStr( weapon, "reflex" ) || IsSubStr( weapon, "thermal" ))
	{
		self HidePart("tag_rear_sight");
		self HidePart("tag_iron_sight");
		self HidePart("tag_sight_on");
	}
	if(!IsSubStr( weapon, "gl" ))
	{
		self HidePart("tag_m203");
		self HidePart("tag_gp25");		
	}
	if(!IsSubStr( weapon, "shotgun" ))
		self HidePart("tag_shotgun");
	if(!IsSubStr( weapon, "acog" ))
	{
		self HidePart("tag_acog_2");
		self HidePart("tag_sa80_scope");
		self HidePart("tag_acog");
		self HidePart("tag_steyr_scope");
		self HidePart("tag_scope");
	}
	if(IsSubStr( weapon, "acog" ) || IsSubStr( weapon, "thermal" ))
	{
		self HidePart("tag_m14ebr_scope");
		self HidePart("tag_m82_scope");
		self HidePart("tag_wa2000_scope");
		self HidePart("tag_cheytac_scope");
	}
	if(!IsSubStr( weapon, "heartbeat" ))
		self HidePart("tag_heartbeat");
	if(!IsSubStr( weapon, "grip" ))
		self HidePart("tag_foregrip");
}

loopMusic(alias, musicLength)
{
	time = musicLength;
	while(level.zState == "playing")
	{
		MusicPlay( alias );
		wait( time );
		musicstop( 1 );
		wait( 1.2 );
	}
	musicstop( 1 );
}

getPlayerWithMostKills()
{
	kills = 0;
	pMostKills = undefined;
	foreach(player in level.players)
	{
		if(player.kills >= kills)
		{
			kills = player.kills;
			pMostKills = player;
		}
	}
	return pMostKills;
}

CountAlivePlayers()
{
	count = 0;
	foreach(player in level.players)
	{
		if(player.playerIsDead == 1)
			continue;
		count++;
	}
	return count;
}

ShowHost(player)
{
	self endon("disconnect");
	player notifyOnPlayerCommand("showHost", "+scores");
	player notifyOnPlayerCommand("hideHost", "-scores");
	for(;;)
	{
		player waittill("showHost");
		hostname = player createFontString("objective", 1.2);
		hostname setPoint("TOPRIGHT", "TOPRIGHT", 0, 0);
		hostname setText("^1AI Zombies eXtreme V2.0 Alpha");
		hostname.alpha = 1;
		player waittill("hideHost");
		hostname destroy();
	}
}