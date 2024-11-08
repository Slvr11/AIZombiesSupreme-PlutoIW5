#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;

Init()
{
    level thread PrecacheSubbase();
	level thread SpawnObjects();
}

PrecacheSubbase()
{

}

Car1(pos, angle)
{
	foliage = spawn("script_model", pos );
	foliage setModel("vehicle_uaz_winter_destructible");
	foliage.angles = angle;
	foliage setContents(1);
    wait 0.01;
}

FlagEnemy(pos, angle)
{
	foliage = spawn("script_model", pos );
	foliage setModel(maps\mp\gametypes\_teams::getTeamFlagModel( "axis" ));
	foliage.angles = angle;
	foliage setContents(1);
    wait 0.01;
}

FlagFriendly(pos, angle)
{
	foliage = spawn("script_model", pos );
	foliage setModel(maps\mp\gametypes\_teams::getTeamFlagModel( "allies" ));
	foliage.angles = angle;
	foliage setContents(1);
    wait 0.01;
}

TNTBomb(pos, angle)
{
	tnt = spawn("script_model", pos );
	tnt setModel("mil_tntbomb_mp");
	tnt.angles = angle;
	tnt setContents(1);
    wait 0.01;
}

Mig(pos, angle)
{
	mig = spawn("script_model", pos );
	mig setModel("vehicle_mig29_desert");
	mig.angles = angle;
	mig setContents(1);
    wait 0.01;
}

FXFire(pos)
{
	while(1)
	{
		playFx(loadfx("props/barrel_fire"),pos);
		wait 1;
	}
}

SmokeFx(pos)
{
	while(1)
	{
		playFx(loadfx("smoke/smoke_trail_black_heli_emitter"),pos);
		wait 1;
	}
}

LightFxGreen(pos)
{
	while(1)
	{
		playFx(loadfx("misc/aircraft_light_wingtip_green"),pos);
		wait 1;
	}
}

LightFxRed(pos)
{
	while(1)
	{
		playFx(loadfx("misc/aircraft_light_red_blink"),pos);
		wait 1;
	}
}

SpawnObjects()
{
	Car1((-340,-3788,16),(0,26,0));
	FlagFriendly((-336,-3851,73),(0,180,0));
	FlagEnemy((133,-4008,472),(0,90,0));
	TNTBomb((-323,-3859,47),(90,90,0));
	Mig((-959,-4294,-40),(32,90,45));
	Mig((-1140,-3913,-211),(32,-90,45));
	FXFire((-929,-4227,-20));
	SmokeFx((-930,-4519,92));
	SmokeFx((-974,-4495,126));
	LightFxRed((-1106,-4355,192));
}