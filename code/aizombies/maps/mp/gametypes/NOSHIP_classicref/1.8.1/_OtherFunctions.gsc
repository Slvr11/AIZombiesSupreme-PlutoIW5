#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

precacheItems()
{
game["strings"]["MP_HORDE_BEGINS_IN"] = "Zombie Round Starts In";
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

	foreach( player in level.players )
	{
		if(player isHost())
			return player;
	}
	
	return 0;
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

SetVision()
{
	if(getdvar("mapname") == "mp_boneyard")
	{
		self VisionSetNakedForPlayer( "cobra_sunset3", 0 );
		self.brightness = -0.07;
		self setClientDvar("r_brightness", self.brightness);
	}
	if(getdvar("mapname") == "mp_nightshift" && level.edit == 0)
	{
		self VisionSetNakedForPlayer( "icbm_sunrise2", 0 );
		self.brightness = -0.05;
		self setClientDvar("r_brightness", self.brightness);
	}
	if(getdvar("mapname") == "mp_nightshift" && level.edit == 1)
	{
		self VisionSetNakedForPlayer( "cobra_sunset1", 0 );
		self.brightness = -0.05;
		self setClientDvar("r_brightness", self.brightness);
	}
	if(getdvar("mapname") == "mp_nightshift" && level.edit == 2)
	{
		self VisionSetNakedForPlayer( "cobra_sunset3", 0 );
		self.brightness = -0.08;
		self setClientDvar("r_brightness", self.brightness);
	}
	if(getdvar("mapname") == "mp_afghan")
	{
		self VisionSetNakedForPlayer( "default", 0 );
	}
	if(getdvar("mapname") == "mp_underpass")
	{
		self VisionSetNakedForPlayer( "cobra_sunset1", 0 );
		self.brightness = -0.08;
		self setClientDvar("r_brightness", self.brightness);
	}
	if(getdvar("mapname") == "mp_trailerpark")
	{
		self VisionSetNakedForPlayer( "cobra_sunset2", 0 );
		self.brightness = -0.06;
		self setClientDvar("r_brightness", self.brightness);
	}
	if(getdvar("mapname") == "mp_quarry")
	{
		self VisionSetNakedForPlayer( "cobra_sunset3", 0 );
		self.brightness = -0.06;
		self setClientDvar("r_brightness", self.brightness);
	}
	if(getdvar("mapname") == "mp_rust" && level.edit == 0)
	{
		self VisionSetNakedForPlayer( "cobra_sunset1", 0 );
		self.brightness = -0.02;
		self setClientDvar("r_brightness", self.brightness);
	}
	if(getdvar("mapname") == "mp_rust" && level.edit == 1)
	{
		self VisionSetNakedForPlayer( "mp_rust", 0 );
	}
	if(getdvar("mapname") == "mp_compact")
	{
		self VisionSetNakedForPlayer( "cobra_sunset3", 0 );
		self.brightness = -0.04;
		self setClientDvar("r_brightness", self.brightness);
	}
	if(getdvar("mapname") == "mp_strike")
	{
		self VisionSetNakedForPlayer( "cobra_sunset2", 0 );
		self.brightness = -0.05;
		self setClientDvar("r_brightness", self.brightness);
	}
	if(getdvar("mapname") == "mp_highrise" && level.edit == 0)
	{
		self VisionSetNakedForPlayer( "mp_highrise", 0 );
	}
	if(getdvar("mapname") == "mp_highrise" && level.edit == 1)
	{
		self VisionSetNakedForPlayer( "mp_highrise", 0 );
		self.brightness = -0.07;
		self setClientDvar("r_brightness", self.brightness);
	}
	if(getdvar("mapname") == "mp_derail")
	{
		self VisionSetNakedForPlayer( "mp_derail", 0 );
		self.brightness = -0.07;
		self setClientDvar("r_brightness", self.brightness);
	}
	if(getdvar("mapname") == "mp_terminal")
	{
		self VisionSetNakedForPlayer( "oilrig_exterior_deck0", 0 );
	}
	if(getdvar("mapname") == "mp_brecourt")
	{
		self VisionSetNakedForPlayer( "mp_brecourt", 0 );
	}
	if(getdvar("mapname") == "mp_subbase")
	{
		self VisionSetNakedForPlayer( "cobra_sunset1", 0 );
		self.brightness = -0.03;
		self setClientDvar("r_brightness", self.brightness);
	}
	if(getdvar("mapname") == "mp_favela")
	{
		self VisionSetNakedForPlayer( "mp_favela", 0 );
	}
	if(getdvar("mapname") == "mp_checkpoint")
	{
		self VisionSetNakedForPlayer( "cobra_sunset2", 0 );
	}
	if(getdvar("mapname") == "mp_rundown")
	{
		self VisionSetNakedForPlayer( "mp_downtown_la", 0 );
	}
	if(getdvar("mapname") == "mp_complex")
	{
		self VisionSetNakedForPlayer( "mp_complex", 0 );
	}
	if(getdvar("mapname") == "mp_invasion")
	{
		self VisionSetNakedForPlayer( "mp_invasion", 0 );
	}
	if(getdvar("mapname") == "mp_estate")
	{
		self VisionSetNakedForPlayer( "mp_estate", 0 );
	}
	if(getdvar("mapname") == "mp_abandon")
	{
		self VisionSetNakedForPlayer( "mp_abandon", 0 );
	}
	if(getdvar("mapname") == "mp_vacant")
	{
		self VisionSetNakedForPlayer( "mp_vacant", 0 );
	}
	if(getdvar("mapname") == "mp_storm")
	{
		self VisionSetNakedForPlayer( "mp_storm", 0 );
	}
	if(getdvar("mapname") == "mp_fuel2")
	{
		self VisionSetNakedForPlayer( "mp_fuel2", 0 );
	}
	if(getdvar("mapname") == "mp_overgrown")
	{
		self VisionSetNakedForPlayer( "mp_overgrown", 0 );
	}
	if(getdvar("mapname") == "mp_crash")
	{
		self VisionSetNakedForPlayer( "mp_crash", 0 );
	}
	if(level.day == 1)
	{
		self VisionSetNakedForPlayer( getDvar( "mapname" ), 0 );
	}
	if(level.crawlers == 1)
	{
		self VisionSetNakedForPlayer( "cobra_sunset3", 0 );
	}
	if(level.boss == 1)
	{
		self VisionSetNakedForPlayer( "cobra_sunset1", 0 );
	}
	if(level.hellzombie == 1)
	{
		self VisionSetNakedForPlayer( "cobra_sunset2", 0 );
	}
	if(level.hellboss == 1)
	{
		self VisionSetNakedForPlayer( "cobra_sunset3", 0 );
	}
}

SetVisionPain()
{
	if(getdvar("mapname") == "mp_boneyard")
	{
		VisionSetPain("cobra_sunset3");
	}
	if(getdvar("mapname") == "mp_nightshift" && level.edit == 0)
	{
		VisionSetPain("icbm_sunrise2");
	}
	if(getdvar("mapname") == "mp_nightshift" && level.edit == 1)
	{
		VisionSetPain("cobra_sunset1");
	}
	if(getdvar("mapname") == "mp_nightshift" && level.edit == 2)
	{
		VisionSetPain("cobra_sunset3");
	}
	if(getdvar("mapname") == "mp_afghan")
	{
		VisionSetPain("default");
	}
	if(getdvar("mapname") == "mp_underpass")
	{
		VisionSetPain("cobra_sunset1");
	}
	if(getdvar("mapname") == "mp_trailerpark")
	{
		VisionSetPain("cobra_sunset2");
	}
	if(getdvar("mapname") == "mp_quarry")
	{
		VisionSetPain("cobra_sunset3");
	}
	if(getdvar("mapname") == "mp_rust" && level.edit == 0)
	{
		VisionSetPain("cobra_sunset1");
	}
	if(getdvar("mapname") == "mp_rust" && level.edit == 1)
	{
		VisionSetPain("mp_rust");
	}
	if(getdvar("mapname") == "mp_compact")
	{
		VisionSetPain("cobra_sunset3");
	}
	if(getdvar("mapname") == "mp_strike")
	{
		VisionSetPain("cobra_sunset2");
	}
	if(getdvar("mapname") == "mp_highrise" && level.edit == 0)
	{
		VisionSetPain("mp_highrise");
	}
	if(getdvar("mapname") == "mp_highrise" && level.edit == 1)
	{
		VisionSetPain("mp_highrise");
	}
	if(getdvar("mapname") == "mp_derail")
	{
		VisionSetPain("mp_derail");
	}
	if(getdvar("mapname") == "mp_terminal")
	{
		VisionSetPain("oilrig_exterior_deck0");
	}
	if(getdvar("mapname") == "mp_brecourt")
	{
		VisionSetPain("mp_brecourt");
	}
	if(getdvar("mapname") == "mp_subbase")
	{
		VisionSetPain("cobra_sunset1");
	}
	if(getdvar("mapname") == "mp_favela")
	{
		VisionSetPain("mp_favela");
	}
	if(getdvar("mapname") == "mp_checkpoint")
	{
		VisionSetPain("cobra_sunset2");
	}
	if(getdvar("mapname") == "mp_rundown")
	{
		VisionSetPain("mp_downtown_la");
	}
	if(getdvar("mapname") == "mp_complex")
	{
		VisionSetPain("mp_complex");
	}
	if(getdvar("mapname") == "mp_invasion")
	{
		VisionSetPain("mp_invasion");
	}
	if(getdvar("mapname") == "mp_estate")
	{
		VisionSetPain("mp_estate");
	}
	if(getdvar("mapname") == "mp_abandon")
	{
		VisionSetPain("mp_abandon");
	}
	if(getdvar("mapname") == "mp_vacant")
	{
		VisionSetPain("mp_vacant");
	}
	if(getdvar("mapname") == "mp_storm")
	{
		VisionSetPain("mp_storm");
	}
	if(getdvar("mapname") == "mp_fuel2")
	{
		VisionSetPain("mp_fuel2");
	}
	if(getdvar("mapname") == "mp_overgrown")
	{
		VisionSetPain("mp_overgrown");
	}
	if(getdvar("mapname") == "mp_crash")
	{
		VisionSetPain("mp_crash");
	}
	if(level.day == 1)
	{
		VisionSetPain( getDvar( "mapname" ));
	}
	if(level.crawlers == 1)
	{
		VisionSetPain( "cobra_sunset3");
	}
	if(level.boss == 1)
	{
		VisionSetPain( "cobra_sunset1");
	}
	if(level.hellzombie == 1)
	{
		VisionSetPain( "cobra_sunset2");
	}	
	if(level.hellboss == 1)
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
	if(getdvar("mapname") == "mp_afghan")
	{
		self setClientDvar("ui_mapname", "Desert Wasteland");
	}
	else if(getdvar("mapname") == "mp_nightshift" && level.edit == 0)
	{
		self setClientDvar("ui_mapname", "Sunrise Apartments");
	}
	else if(getdvar("mapname") == "mp_nightshift" && level.edit == 1)
	{
		self setClientDvar("ui_mapname", "Rundown Apartments");
	}
	else if(getdvar("mapname") == "mp_nightshift" && level.edit == 2)
	{
		self setClientDvar("ui_mapname", "River Canal");
	}
	else if(getdvar("mapname") == "mp_rust" && level.edit == 0)
	{
		self setClientDvar("ui_mapname", "Raging River");
	}
	else if(getdvar("mapname") == "mp_rust" && level.edit == 1)
	{
		self setClientDvar("ui_mapname", "Raging River Storm");
	}
	else if(getdvar("mapname") == "mp_trailerpark")
	{
		self setClientDvar("ui_mapname", "Abandoned Gas Station");
	}
	else if(getdvar("mapname") == "mp_boneyard")
	{
		self setClientDvar("ui_mapname", "Deserted Entrance");
	}
	else if(getdvar("mapname") == "mp_quarry")
	{
		self setClientDvar("ui_mapname", "Construction Graveyard");
	}
	else if(getdvar("mapname") == "mp_compact")
	{
		self setClientDvar("ui_mapname", "Snowy Vacation");
	}
	else if(getdvar("mapname") == "mp_underpass")
	{
		self setClientDvar("ui_mapname", "Shipping Yard");
	}
	else if(getdvar("mapname") == "mp_strike")
	{
		self setClientDvar("ui_mapname", "Back Ally");
	}
	else if(getdvar("mapname") == "mp_highrise" && level.edit == 0)
	{
		self setClientDvar("ui_mapname", "High Hilton");
	}
	else if(getdvar("mapname") == "mp_highrise" && level.edit == 1)
	{
		self setClientDvar("ui_mapname", "The Twin Buildings");
	}
	else if(getdvar("mapname") == "mp_derail")
	{
		self setClientDvar("ui_mapname", "Frozen Warehouse");
	}
	else if(getdvar("mapname") == "mp_terminal")
	{
		self setClientDvar("ui_mapname", "Airport Invasion");
	}
	else if(getdvar("mapname") == "mp_brecourt")
	{
		self setClientDvar("ui_mapname", "Apartment Rooftops");
	}
	else if(getdvar("mapname") == "mp_subbase")
	{
		self setClientDvar("ui_mapname", "Sub Pens of Hell");
	}
	else if(getdvar("mapname") == "mp_checkpoint")
	{
		self setClientDvar("ui_mapname", "Shipping Dock");
	}
	else if(getdvar("mapname") == "mp_favela")
	{
		self setClientDvar("ui_mapname", "^1Rundown Town");
	}
	else if(getdvar("mapname") == "mp_estate")
	{
		self setClientDvar("ui_mapname", "Falls of Hell");
	}
	else if(getdvar("mapname") == "mp_rundown")
	{
		self setClientDvar("ui_mapname", "Old Shack");
	}
	else if(getdvar("mapname") == "mp_complex")
	{
		self setClientDvar("ui_mapname", "Apartment Invasion");
	}
	else if(getdvar("mapname") == "mp_invasion")
	{
		self setClientDvar("ui_mapname", "Dam Sea");
	}
	else if(getdvar("mapname") == "mp_abandon")
	{
		self setClientDvar("ui_mapname", "Carnival Parking Lot");
	}
	else if(getdvar("mapname") == "mp_vacant")
	{
		self setClientDvar("ui_mapname", "Chernoybl Disaster");
	}
	else if(getdvar("mapname") == "mp_storm")
	{
		self setClientDvar("ui_mapname", "Dryed Aqueduct");
	}
	else if(getdvar("mapname") == "mp_fuel2")
	{
		self setClientDvar("ui_mapname", "Nowhere Mountain");
	}
	else if(getdvar("mapname") == "mp_overgrown")
	{
		self setClientDvar("ui_mapname", "Overgrown Hell");
	}
	else if(getdvar("mapname") == "mp_crash")
	{
		self setClientDvar("ui_mapname", "Hell Tunnel");
	}
}

HideGunParts(weapon)
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