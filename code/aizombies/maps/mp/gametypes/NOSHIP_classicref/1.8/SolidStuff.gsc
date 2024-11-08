#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\MapEdit;
#include AImod\_OtherFunctions;

TriggerSolid(pos, angle, number, width, height)
{
	trigger = spawn( "trigger_radius", pos, 0, width, height );
	trigger.angles = angle;
	trigger Solid();
	trigger setContents(1);
	trigger Solid();
}

BoxSwitchAfghan()
{
	switch(randomInt(4))
	{
		case 0: level thread BoxMoveAnimation();
		wait 4;
		level.blockfreeze delete();
		level.bearmove delete();
		foreach( player in level.players )
		{
			player playLocalSound( "emp_activate" );
		}
		RandomWeapon((-1672,-1081,-1444),(0,44,0));
		wait 0.1;
		level.boxposition = 0;
		level.box = 0;
		break;
		case 1: level thread BoxMoveAnimation();
		wait 4;
		level.blockfreeze delete();
		level.bearmove delete();
		foreach( player in level.players )
		{
			player playLocalSound( "emp_activate" );
		}
		RandomWeapon((-3434,1581,-1443),(0,115,0));
		wait 0.1;
		level.boxposition = 1;
		level.box = 0;
		break;
		case 2: level thread BoxMoveAnimation();
		wait 4;
		level.blockfreeze delete();
		level.bearmove delete();
		foreach( player in level.players )
		{
			player playLocalSound( "emp_activate" );
		}
		RandomWeapon((-2629,-267,-1439),(0,79,0));
		wait 0.1;
		level.boxposition = 2;
		level.box = 0;
		break;
		case 3: level thread BoxMoveAnimation();
		wait 4;
		level.blockfreeze delete();
		level.bearmove delete();
		foreach( player in level.players )
		{
			player playLocalSound( "emp_activate" );
		}
		RandomWeapon((-2755,-1177,-1440),(0,73,0));
		wait 0.1;
		level.boxposition = 3;
		level.box = 0;
		break;
	}
}

BoxSwitchHighrise()
{
	switch(randomInt(4))
	{
		case 0: level thread BoxMoveAnimation();
		wait 5;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((-8060.7,6789.3,2331.1),(0,0,0));
		wait 0.1;
		level.boxposition = 0;
		level.box = 0;
		break;
		case 1: level thread BoxMoveAnimation();
		wait 5;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((-9049.5,6786.7,2331.1),(0,0,0));
		wait 0.1;
		level.boxposition = 1;
		level.box = 0;
		break;
		case 2: level thread BoxMoveAnimation();
		wait 5;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((-8942.2,4284.3,2331.1),(0,225,0));
		wait 0.1;
		level.boxposition = 2;
		level.box = 0;
		break;
		case 3: level thread BoxMoveAnimation();
		wait 5;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((-9248.9,5427.1,2331.1),(0,90,0));
		wait 0.1;
		level.boxposition = 3;
		level.box = 0;
		break;
	}
}

BoxSwitchHighrise2()
{
	switch(randomInt(4))
	{
		case 0: level thread BoxMoveAnimation();
		wait 5;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((-13630.1,3855.1,5439.1),(0,0,0));
		wait 0.1;
		level.boxposition = 0;
		level.box = 0;
		break;
		case 1: level thread BoxMoveAnimation();
		wait 5;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((-14032.2,7520.0,5391.1),(0,35,0));
		wait 0.1;
		level.boxposition = 1;
		level.box = 0;
		break;
		case 2: level thread BoxMoveAnimation();
		wait 5;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((-15771.6,6051.3,5439.1),(0,90,0));
		wait 0.1;
		level.boxposition = 2;
		level.box = 0;
		break;
		case 3: level thread BoxMoveAnimation();
		wait 5;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((-14614.7,7443.9,5386.1),(0,33,0));
		wait 0.1;
		level.boxposition = 3;
		level.box = 0;
		break;
	}
}

BoxSwitchSkidrow()
{
	if(level.edit == 0) switch(randomInt(5))
	{
		case 0: level thread BoxMoveAnimation();
		wait 5;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((-2000.1,-366.9,144.1),(0,90,0));
		wait 0.1;
		level.boxposition = 0;
		level.box = 0;
		break;
		case 1: level thread BoxMoveAnimation();
		wait 5;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((-2356.7,-912.9,139.1),(0,0,0));
		wait 0.1;
		level.boxposition = 1;
		level.box = 0;
		break;
		case 2: level thread BoxMoveAnimation();
		wait 5;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((-1176.0,-1986.6,11.1),(0,180,0));
		wait 0.1;
		level.boxposition = 2;
		level.box = 0;
		break;
		case 3: level thread BoxMoveAnimation();
		wait 5;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((-1432.0,-192.9,3.1),(0,180,0));
		wait 0.1;
		level.boxposition = 3;
		level.box = 0;
		break;
		case 4: level thread BoxMoveAnimation();
		wait 5;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((-1414.8,-1984.9,3.1),(0,180,0));
		wait 0.1;
		level.boxposition = 4;
		level.box = 0;
		break;
	}
	else if(level.edit == 1) switch(randomInt(5))
	{
		case 0: level thread BoxMoveAnimation();
		wait 3;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((1965,-500,16),(0,90,0));
		wait 0.1;
		level.boxposition = 0;
		level.box = 0;
		break;
		case 1: level thread BoxMoveAnimation();
		wait 3;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((1574,426,24),(0,90,0));
		wait 0.1;
		level.boxposition = 1;
		level.box = 0;
		break;
		case 2: level thread BoxMoveAnimation();
		wait 3;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((505,-734,11),(0,90,0));
		wait 0.1;
		level.boxposition = 2;
		level.box = 0;
		break;
		case 3: level thread BoxMoveAnimation();
		wait 3;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((865,-2096,43),(0,180,0));
		wait 0.1;
		level.boxposition = 3;
		level.box = 0;
		break;
		case 4: level thread BoxMoveAnimation();
		wait 3;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((1631,-770,119),(0,90,0));
		wait 0.1;
		level.boxposition = 4;
		level.box = 0;
		break;
	}
	else if(level.edit == 2) switch(randomInt(3))
	{
		case 0: level thread BoxMoveAnimation();
		wait 3;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((2040,-1266,16),(0,90,0));
		wait 0.1;
		level.boxposition = 0;
		level.box = 0;
		break;
		case 1: level thread BoxMoveAnimation();
		wait 3;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((1590,-1393,8),(0,90,0));
		wait 0.1;
		level.boxposition = 1;
		level.box = 0;
		break;
		case 2: level thread BoxMoveAnimation();
		wait 3;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((1830,-2360,4),(0,0,0));
		wait 0.1;
		level.boxposition = 2;
		level.box = 0;
		break;
	}
}

BoxSwitchDerail()
{
	switch(randomInt(3))
	{
		case 0: level thread BoxMoveAnimation();
		wait 5;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((1790,3371,294),(0,0,0));
		wait 0.1;
		level.boxposition = 0;
		level.box = 0;
		break;
		case 1: level thread BoxMoveAnimation();
		wait 5;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((2191,2949,158),(0,90,0));
		wait 0.1;
		level.boxposition = 1;
		level.box = 0;
		break;
		case 2: level thread BoxMoveAnimation();
		wait 5;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((1901,2060,294),(0,0,0));
		wait 0.1;
		level.boxposition = 2;
		level.box = 0;
		break;
	}
}

BoxMoveAnimation()
{
	level endon("disconnect");
	if(getDvar("mapname") == "mp_afghan" && level.boxposition == 0)
	{
		level.blockfreeze = spawn("script_model", (-1672,-1081,-1444));
		level.blockfreeze.angles = (0,40,0);
		level.blockfreeze setModel("com_plasticcase_friendly");
		level.blockfreeze Solid();
		level.blockfreeze CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
		level.bearmove = spawn("script_model", level.blockfreeze.origin + (0,0,30));
		level.bearmove.angles = (0,180,0);
		level.bearmove setModel("com_teddy_bear");
		level.bearmove scriptModelPlayAnim("pb_sprint");
		wait 1;
		level.bearmove MoveTo(level.bearmove.origin+(0,0,40), 3);
	}
	else if(getDvar("mapname") == "mp_afghan" && level.boxposition == 1)
	{
		level.blockfreeze = spawn("script_model", (-3434,1581,-1443));
		level.blockfreeze.angles = (0,0,0);
		level.blockfreeze setModel("com_plasticcase_friendly");
		level.blockfreeze Solid();
		level.blockfreeze CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
		level.bearmove = spawn("script_model", level.blockfreeze.origin + (0,0,30));
		level.bearmove.angles = (0,90,0);
		level.bearmove setModel("com_teddy_bear");
		wait 1;
		level.bearmove MoveTo(level.bearmove.origin+(0,0,40), 3);
	}
	else if(getDvar("mapname") == "mp_afghan" && level.boxposition == 2)
	{
		level.blockfreeze = spawn("script_model", (-2629,-267,-1439));
		level.blockfreeze.angles = (0,90,0);
		level.blockfreeze setModel("com_plasticcase_friendly");
		level.blockfreeze Solid();
		level.blockfreeze CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
		level.bearmove = spawn("script_model", level.blockfreeze.origin + (0,0,30));
		level.bearmove.angles = (0,180,0);
		level.bearmove setModel("com_teddy_bear");
		wait 1;
		level.bearmove MoveTo(level.bearmove.origin+(0,0,40), 3);
	}
	else if(getDvar("mapname") == "mp_afghan" && level.boxposition == 3)
	{
		level.blockfreeze = spawn("script_model", (-2755,-1177,-1440));
		level.blockfreeze.angles = (0,0,0);
		level.blockfreeze setModel("com_plasticcase_friendly");
		level.blockfreeze Solid();
		level.blockfreeze CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
		level.bearmove = spawn("script_model", level.blockfreeze.origin + (0,0,30));
		level.bearmove.angles = (0,90,0);
		level.bearmove setModel("com_teddy_bear");
		wait 1;
		level.bearmove MoveTo(level.bearmove.origin+(0,0,40), 3);
	}
	if(getDvar("mapname") == "mp_highrise" && level.edit == 0 && level.boxposition == 0)
	{
		level.blockmove = spawn("script_model", (-8060.7,6789.3,2331.1));
		level.blockmove.angles = (0,0,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	else if(getDvar("mapname") == "mp_highrise" && level.edit == 0 && level.boxposition == 1)
	{
		level.blockmove = spawn("script_model", (-9049.5,6786.7,2331.1));
		level.blockmove.angles = (0,0,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	else if(getDvar("mapname") == "mp_highrise" && level.edit == 0 && level.boxposition == 2)
	{
		level.blockmove = spawn("script_model", (-8942.2,4284.3,2331.1));
		level.blockmove.angles = (0,225,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	else if(getDvar("mapname") == "mp_highrise" && level.edit == 0 && level.boxposition == 3)
	{
		level.blockmove = spawn("script_model", (-9248.9,5427.1,2331.1));
		level.blockmove.angles = (0,90,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	if(getDvar("mapname") == "mp_highrise" && level.edit == 1 && level.boxposition == 0)
	{
		level.blockmove = spawn("script_model", (-13630.1,3855.1,5439.1));
		level.blockmove.angles = (0,0,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	else if(getDvar("mapname") == "mp_highrise" && level.edit == 1 && level.boxposition == 1)
	{
		level.blockmove = spawn("script_model", (-14032.2,7520.0,5391.1));
		level.blockmove.angles = (0,35,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	else if(getDvar("mapname") == "mp_highrise" && level.edit == 1 && level.boxposition == 2)
	{
		level.blockmove = spawn("script_model", (-15771.6,6051.3,5439.1));
		level.blockmove.angles = (0,90,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	else if(getDvar("mapname") == "mp_highrise" && level.edit == 1 && level.boxposition == 3)
	{
		level.blockmove = spawn("script_model", (-14614.7,7443.9,5386.1));
		level.blockmove.angles = (0,33,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	if(getDvar("mapname") == "mp_nightshift" && level.boxposition == 0 && level.edit == 0)
	{
		level.blockmove = spawn("script_model", (-2000.1,-366.9,144.1));
		level.blockmove.angles = (0,90,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	else if(getDvar("mapname") == "mp_nightshift" && level.boxposition == 1 && level.edit == 0)
	{
		level.blockmove = spawn("script_model", (-2356.7,-912.9,139.1));
		level.blockmove.angles = (0,0,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	else if(getDvar("mapname") == "mp_nightshift" && level.boxposition == 2 && level.edit == 0)
	{
		level.blockmove = spawn("script_model", (-1176.0,-1986.6,11.1));
		level.blockmove.angles = (0,180,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	else if(getDvar("mapname") == "mp_nightshift" && level.boxposition == 3 && level.edit == 0)
	{
		level.blockmove = spawn("script_model", (-1432.0,-192.9,3.1));
		level.blockmove.angles = (0,180,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	else if(getDvar("mapname") == "mp_nightshift" && level.boxposition == 4 && level.edit == 0)
	{
		level.blockmove = spawn("script_model", (-1414.8,-1984.9,3.1));
		level.blockmove.angles = (0,180,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	if(getDvar("mapname") == "mp_nightshift" && level.boxposition == 0 && level.edit == 1)
	{
		level.blockmove = spawn("script_model", (1965,-500,16));
		level.blockmove.angles = (0,90,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,60), 3);
	}
	else if(getDvar("mapname") == "mp_nightshift" && level.boxposition == 1 && level.edit == 1)
	{
		level.blockmove = spawn("script_model", (1574,426,24));
		level.blockmove.angles = (0,90,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,60), 3);
	}
	else if(getDvar("mapname") == "mp_nightshift" && level.boxposition == 2 && level.edit == 1)
	{
		level.blockmove = spawn("script_model", (505,-734,11));
		level.blockmove.angles = (0,90,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,60), 3);
	}
	else if(getDvar("mapname") == "mp_nightshift" && level.boxposition == 3 && level.edit == 1)
	{
		level.blockmove = spawn("script_model", (865,-2096,43));
		level.blockmove.angles = (0,180,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,60), 3);
	}
	else if(getDvar("mapname") == "mp_nightshift" && level.boxposition == 4 && level.edit == 1)
	{
		level.blockmove = spawn("script_model", (-1414.8,-1984.9,3.1));
		level.blockmove.angles = (0,90,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,-60), 3);
	}
	if(getDvar("mapname") == "mp_nightshift" && level.boxposition == 0 && level.edit == 2)
	{
		level.blockmove = spawn("script_model", (2040,-1266,16));
		level.blockmove.angles = (0,90,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,60), 3);
	}
	else if(getDvar("mapname") == "mp_nightshift" && level.boxposition == 1 && level.edit == 2)
	{
		level.blockmove = spawn("script_model", (1590,-1393,8));
		level.blockmove.angles = (0,90,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,60), 3);
	}
	else if(getDvar("mapname") == "mp_nightshift" && level.boxposition == 2 && level.edit == 2)
	{
		level.blockmove = spawn("script_model", (1830,-2360,4));
		level.blockmove.angles = (0,0,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,60), 3);
	}
	if(getDvar("mapname") == "mp_derail" && level.boxposition == 0)
	{
		level.blockmove = spawn("script_model", (1790,3371,294));
		level.blockmove.angles = (0,0,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,60), 5);
	}
	else if(getDvar("mapname") == "mp_derail" && level.boxposition == 1)
	{
		level.blockmove = spawn("script_model", (2191,2949,158));
		level.blockmove.angles = (0,90,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,60), 5);
	}
	else if(getDvar("mapname") == "mp_derail" && level.boxposition == 2)
	{
		level.blockmove = spawn("script_model", (1901,2060,294));
		level.blockmove.angles = (0,0,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,60), 5);
	}
}