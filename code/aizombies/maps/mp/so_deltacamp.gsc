#include maps\mp\_utility;
#include common_scripts\utility;

main()
{	
	maps\mp\_load::main();
	
	AmbientPlay( "ambient_mp_dome" );
	
    maps\mp\_compass::setupMiniMap( "compass_map_so_deltacamp" );	
	
	setdvar( "r_lightGridEnableTweaks", 1 );
	setdvar( "r_lightGridIntensity", 1.33 );
	
	game["attackers"] = "allies";
	game["defenders"] = "axis";

	audio_settings();

	VisionSetNaked("so_deltacamp", 0);
	VisionSetNight( "default_night_mp" );
	VisionSetMissilecam( "missilecam" );
	VisionSetThermal( game[ "thermal_vision" ] );
	VisionSetPain( "near_death_mp", 0 );

	setdvar("ui_mapname", "mp_deltacamp");
}

audio_settings()
{
//	maps\mp\_audio::add_reverb( "name", "room type", wetlevel, drylevel, fadetime )
	maps\mp\_audio::add_reverb( "default", "quarry", 0.15, 0.9, 2 );
}