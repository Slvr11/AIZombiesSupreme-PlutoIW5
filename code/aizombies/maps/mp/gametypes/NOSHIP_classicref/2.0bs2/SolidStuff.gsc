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
		RandomWeapon((-1608,9688,2179),(0,90,0));
		wait 0.1;
		level.boxposition = 0;
		level.box = 0;
		break;
		case 1: level thread BoxMoveAnimation();
		wait 5;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((-1939,10416,2275),(0,0,0));
		wait 0.1;
		level.boxposition = 1;
		level.box = 0;
		break;
		case 2: level thread BoxMoveAnimation();
		wait 5;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((-942,10876,2179),(0,90,0));
		wait 0.1;
		level.boxposition = 2;
		level.box = 0;
		break;
		case 3: level thread BoxMoveAnimation();
		wait 5;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((-666,11472,2179),(0,0,0));
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
		RandomWeapon((2308,10069,4124),(0,0,0));
		wait 0.1;
		level.boxposition = 0;
		level.box = 0;
		break;
		case 1: level thread BoxMoveAnimation();
		wait 5;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((1439,10831,3371),(0,90,0));
		wait 0.1;
		level.boxposition = 1;
		level.box = 0;
		break;
		case 2: level thread BoxMoveAnimation();
		wait 5;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((5066,2931,2355),(0,0,0));
		wait 0.1;
		level.boxposition = 2;
		level.box = 0;
		break;
		case 3: level thread BoxMoveAnimation();
		wait 5;
		level.blockmove delete();
		level playSound( "emp_activate" );
		RandomWeapon((2727,11599,3371),(0,0,0));
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
	mapname = getDvar("mapname");
	if(mapname == "mp_afghan" && level.boxposition == 0)
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
	else if(mapname == "mp_afghan" && level.boxposition == 1)
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
	else if(mapname == "mp_afghan" && level.boxposition == 2)
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
	else if(mapname == "mp_afghan" && level.boxposition == 3)
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
	if(mapname == "mp_highrise" && level.edit == 0 && level.boxposition == 0)
	{
		level.blockmove = spawn("script_model", (-1608,9688,2179));
		level.blockmove.angles = (0,90,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	else if(mapname == "mp_highrise" && level.edit == 0 && level.boxposition == 1)
	{
		level.blockmove = spawn("script_model", (-1939,10416,2275));
		level.blockmove.angles = (0,0,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	else if(mapname == "mp_highrise" && level.edit == 0 && level.boxposition == 2)
	{
		level.blockmove = spawn("script_model", (-942,10876,2179));
		level.blockmove.angles = (0,90,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	else if(mapname == "mp_highrise" && level.edit == 0 && level.boxposition == 3)
	{
		level.blockmove = spawn("script_model", (-666,11472,2179));
		level.blockmove.angles = (0,0,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	if(mapname == "mp_highrise" && level.edit == 1 && level.boxposition == 0)
	{
		level.blockmove = spawn("script_model", (2308,10069,4075));
		level.blockmove.angles = (0,0,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	else if(mapname == "mp_highrise" && level.edit == 1 && level.boxposition == 1)
	{
		level.blockmove = spawn("script_model", (1439,10831,3371));
		level.blockmove.angles = (0,90,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	else if(mapname == "mp_highrise" && level.edit == 1 && level.boxposition == 2)
	{
		level.blockmove = spawn("script_model", (5066,2931,2355));
		level.blockmove.angles = (0,0,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	else if(mapname == "mp_highrise" && level.edit == 1 && level.boxposition == 3)
	{
		level.blockmove = spawn("script_model", (2727,11599,3371));
		level.blockmove.angles = (0,0,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	if(mapname == "mp_nightshift" && level.boxposition == 0 && level.edit == 0)
	{
		level.blockmove = spawn("script_model", (-2000.1,-366.9,144.1));
		level.blockmove.angles = (0,90,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	else if(mapname == "mp_nightshift" && level.boxposition == 1 && level.edit == 0)
	{
		level.blockmove = spawn("script_model", (-2356.7,-912.9,139.1));
		level.blockmove.angles = (0,0,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	else if(mapname == "mp_nightshift" && level.boxposition == 2 && level.edit == 0)
	{
		level.blockmove = spawn("script_model", (-1176.0,-1986.6,11.1));
		level.blockmove.angles = (0,180,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	else if(mapname == "mp_nightshift" && level.boxposition == 3 && level.edit == 0)
	{
		level.blockmove = spawn("script_model", (-1432.0,-192.9,3.1));
		level.blockmove.angles = (0,180,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	else if(mapname == "mp_nightshift" && level.boxposition == 4 && level.edit == 0)
	{
		level.blockmove = spawn("script_model", (-1414.8,-1984.9,3.1));
		level.blockmove.angles = (0,180,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	if(mapname == "mp_nightshift" && level.boxposition == 0 && level.edit == 1)
	{
		level.blockmove = spawn("script_model", (1965,-500,16));
		level.blockmove.angles = (0,90,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,60), 3);
	}
	else if(mapname == "mp_nightshift" && level.boxposition == 1 && level.edit == 1)
	{
		level.blockmove = spawn("script_model", (1574,426,24));
		level.blockmove.angles = (0,90,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,60), 3);
	}
	else if(mapname == "mp_nightshift" && level.boxposition == 2 && level.edit == 1)
	{
		level.blockmove = spawn("script_model", (505,-734,11));
		level.blockmove.angles = (0,90,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,60), 3);
	}
	else if(mapname == "mp_nightshift" && level.boxposition == 3 && level.edit == 1)
	{
		level.blockmove = spawn("script_model", (865,-2096,43));
		level.blockmove.angles = (0,180,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,60), 3);
	}
	else if(mapname == "mp_nightshift" && level.boxposition == 4 && level.edit == 1)
	{
		level.blockmove = spawn("script_model", (-1414.8,-1984.9,3.1));
		level.blockmove.angles = (0,90,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,-60), 3);
	}
	if(mapname == "mp_nightshift" && level.boxposition == 0 && level.edit == 2)
	{
		level.blockmove = spawn("script_model", (2040,-1266,16));
		level.blockmove.angles = (0,90,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,60), 3);
	}
	else if(mapname == "mp_nightshift" && level.boxposition == 1 && level.edit == 2)
	{
		level.blockmove = spawn("script_model", (1590,-1393,8));
		level.blockmove.angles = (0,90,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,60), 3);
	}
	else if(mapname == "mp_nightshift" && level.boxposition == 2 && level.edit == 2)
	{
		level.blockmove = spawn("script_model", (1830,-2360,4));
		level.blockmove.angles = (0,0,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,60), 3);
	}
	if(mapname == "mp_derail" && level.boxposition == 0)
	{
		level.blockmove = spawn("script_model", (1790,3371,294));
		level.blockmove.angles = (0,0,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,60), 5);
	}
	else if(mapname == "mp_derail" && level.boxposition == 1)
	{
		level.blockmove = spawn("script_model", (2191,2949,158));
		level.blockmove.angles = (0,90,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,60), 5);
	}
	else if(mapname == "mp_derail" && level.boxposition == 2)
	{
		level.blockmove = spawn("script_model", (1901,2060,294));
		level.blockmove.angles = (0,0,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,60), 5);
	}
}

SpawnRandomBoxLocation()
{
	self endon("disconnect");
	{
		mapname = getDvar("mapname");
		if(mapname == "mp_derail" && level.box >= 6 && level.boxposition == 0 && level.edit == 0)
		{
			level thread BoxSwitchDerail();
		}
		else if(mapname == "mp_derail" && level.box <= 6 && level.boxposition == 0 && level.edit == 0)
		{
			RandomWeapon((1790,3371,294),(0,0,0));
		}
		else if(mapname == "mp_derail" && level.box >= 6 && level.boxposition == 1 && level.edit == 0)
		{
			level thread BoxSwitchDerail();
		}
		else if(mapname == "mp_derail" && level.box <= 6 && level.boxposition == 1 && level.edit == 0)
		{
			RandomWeapon((2191,2949,158),(0,90,0));
		}
		else if(mapname == "mp_derail" && level.box >= 6 && level.boxposition == 2 && level.edit == 0)
		{
			level thread BoxSwitchDerail();
		}
		else if(mapname == "mp_derail" && level.box <= 6 && level.boxposition == 2 && level.edit == 0)
		{
			RandomWeapon((1901,2060,294),(0,0,0));
		}
		else if(mapname == "mp_derail" && level.edit == 1)
		{
			RandomWeapon((863,-6096,131),(0,0,0));
		}
		else if(mapname == "mp_nightshift" && level.box >= 5 && level.boxposition == 0 && level.edit == 2)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(mapname == "mp_nightshift" && level.box <= 5 && level.boxposition == 0 && level.edit == 2)
		{
			RandomWeapon((2040,-1266,16),(0,90,0));
		}
		else if(mapname == "mp_nightshift" && level.box >= 5 && level.boxposition == 1 && level.edit == 2)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(mapname == "mp_nightshift" && level.box <= 5 && level.boxposition == 1 && level.edit == 2)
		{
			RandomWeapon((1590,-1393,8),(0,90,0));
		}
		else if(mapname == "mp_nightshift" && level.box >= 5 && level.boxposition == 2 && level.edit == 2)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(mapname == "mp_nightshift" && level.box <= 5 && level.boxposition == 2 && level.edit == 2)
		{
			RandomWeapon((1830,-2360,4),(0,0,0));
		}
		else if(mapname == "mp_nightshift" && level.box >= 5 && level.boxposition == 0 && level.edit == 1)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(mapname == "mp_nightshift" && level.box <= 5 && level.boxposition == 0 && level.edit == 1)
		{
			RandomWeapon((1965,-500,16),(0,90,0));
		}
		else if(mapname == "mp_nightshift" && level.box >= 5 && level.boxposition == 1 && level.edit == 1)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(mapname == "mp_nightshift" && level.box <= 5 && level.boxposition == 1 && level.edit == 1)
		{
			RandomWeapon((1574,426,24),(0,90,0));
		}
		else if(mapname == "mp_nightshift" && level.box >= 5 && level.boxposition == 2 && level.edit == 1)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(mapname == "mp_nightshift" && level.box <= 5 && level.boxposition == 2 && level.edit == 1)
		{
			RandomWeapon((505,-734,11),(0,90,0));
		}
		else if(mapname == "mp_nightshift" && level.box >= 6 && level.boxposition == 3 && level.edit == 1)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(mapname == "mp_nightshift" && level.box <= 6 && level.boxposition == 3 && level.edit == 1)
		{
			RandomWeapon((865,-2096,43),(0,180,0));
		}
		else if(mapname == "mp_nightshift" && level.box >= 6 && level.boxposition == 4 && level.edit == 1)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(mapname == "mp_nightshift" && level.box <= 6 && level.boxposition == 4 && level.edit == 1)
		{
			RandomWeapon((1631,-770,119),(0,90,0));
		}
		else if(mapname == "mp_nightshift" && level.box >= 6 && level.boxposition == 0 && level.edit == 0)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(mapname == "mp_nightshift" && level.box <= 6 && level.boxposition == 0 && level.edit == 0)
		{
			RandomWeapon((-2000.1,-366.9,144.1),(0,90,0));
		}
		else if(mapname == "mp_nightshift" && level.box >= 6 && level.boxposition == 1 && level.edit == 0)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(mapname == "mp_nightshift" && level.box < 6 && level.boxposition == 1 && level.edit == 0)
		{
			RandomWeapon((-2356.7,-912.9,139.1),(0,0,0));
		}
		else if(mapname == "mp_nightshift" && level.box >= 6 && level.boxposition == 2 && level.edit == 0)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(mapname == "mp_nightshift" && level.box <= 6 && level.boxposition == 2 && level.edit == 0)
		{
			RandomWeapon((-1176.0,-1986.6,11.1),(0,180,0));
		}
		else if(mapname == "mp_nightshift" && level.box >= 6 && level.boxposition == 3 && level.edit == 0)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(mapname == "mp_nightshift" && level.box <= 6 && level.boxposition == 3 && level.edit == 0)
		{
			RandomWeapon((-1432.0,-192.9,3.1),(0,180,0));
		}
		else if(mapname == "mp_nightshift" && level.box >= 6 && level.boxposition == 4 && level.edit == 0)
		{
			level thread BoxSwitchSkidrow();
		}
		else if(mapname == "mp_nightshift" && level.box <= 6 && level.boxposition == 4 && level.edit == 0)
		{
			RandomWeapon((-1414.8,-1984.9,3.1),(0,180,0));
		}
		else if(mapname == "mp_rust")
		{
			RandomWeapon((111,819,-104),(0,90,0));
		}
		else if(mapname == "mp_afghan" && level.box >= 4 && level.boxposition == 0 && level.edit == 0)
		{
			level thread BoxSwitchAfghan();
		}
		else if(mapname == "mp_afghan" && level.box <= 4 && level.boxposition == 0 && level.edit == 0)
		{
			RandomWeapon((-1672,-1081,-1444),(0,44,0));
		}
		else if(mapname == "mp_afghan" && level.box >= 4 && level.boxposition == 1 && level.edit == 0)
		{
			level thread BoxSwitchAfghan();
		}
		else if(mapname == "mp_afghan" && level.box <= 4 && level.boxposition == 1 && level.edit == 0)
		{
			RandomWeapon((-3434,1581,-1443),(0,115,0));
		}
		else if(mapname == "mp_afghan" && level.box >= 4 && level.boxposition == 2 && level.edit == 0)
		{
			level thread BoxSwitchAfghan();
		}
		else if(mapname == "mp_afghan" && level.box <= 5 && level.boxposition == 2 && level.edit == 0)
		{
			RandomWeapon((-2629,-267,-1439),(0,79,0));
		}
		else if(mapname == "mp_afghan" && level.box >= 4 && level.boxposition == 3 && level.edit == 0)
		{
			level thread BoxSwitchAfghan();
		}
		else if(mapname == "mp_afghan" && level.box <= 5 && level.boxposition == 3 && level.edit == 0)
		{
			RandomWeapon((-2755,-1177,-1440),(0,73,0));
		}
		else if(mapname == "mp_afghan" && level.edit == 1)
		{
			RandomWeapon((9374,3234,130),(0,268,0));
		}
		else if(mapname == "mp_highrise" && level.edit == 0 && level.box >= 5 && level.boxposition == 0)
		{
			level thread BoxSwitchHighrise();
		}
		else if(mapname == "mp_highrise" && level.edit == 0 && level.box <= 5 && level.boxposition == 0)
		{
			RandomWeapon((-1608,9688,2179),(0,90,0));
		}
		else if(mapname == "mp_highrise" && level.edit == 0 && level.box >= 5 && level.boxposition == 1)
		{
			level thread BoxSwitchHighrise();
		}
		else if(mapname == "mp_highrise" && level.edit == 0 && level.box <= 5 && level.boxposition == 1)
		{
			RandomWeapon((-1939,10416,2275),(0,0,0));
		}
		else if(mapname == "mp_highrise" && level.edit == 0 && level.box >= 5 && level.boxposition == 2)
		{
			level thread BoxSwitchHighrise();
		}
		else if(mapname == "mp_highrise" && level.edit == 0 && level.box <= 5 && level.boxposition == 2)
		{
			RandomWeapon((-942,10876,2179),(0,90,0));
		}
		else if(mapname == "mp_highrise" && level.edit == 0 && level.box >= 5 && level.boxposition == 3)
		{
			level thread BoxSwitchHighrise();
		}
		else if(mapname == "mp_highrise" && level.edit == 0 && level.box <= 5 && level.boxposition == 3)
		{
			RandomWeapon((-666,11472,2179),(0,0,0));
		}
		else if(mapname == "mp_highrise" && level.edit == 1 && level.box >= 6 && level.boxposition == 0)
		{
			level thread BoxSwitchHighrise2();
		}
		else if(mapname == "mp_highrise" && level.edit == 1 && level.box <= 6 && level.boxposition == 0)
		{
			RandomWeapon((2308,10069,4075),(0,0,0));
		}
		else if(mapname == "mp_highrise" && level.edit == 1 && level.box >= 6 && level.boxposition == 1)
		{
			level thread BoxSwitchHighrise2();
		}
		else if(mapname == "mp_highrise" && level.edit == 1 && level.box <= 6 && level.boxposition == 1)
		{
			RandomWeapon((1439,10831,3371),(0,90,0));
		}
		else if(mapname == "mp_highrise" && level.edit == 1 && level.box >= 6 && level.boxposition == 2)
		{
			level thread BoxSwitchHighrise2();
		}
		else if(mapname == "mp_highrise" && level.edit == 1 && level.box <= 6 && level.boxposition == 2)
		{
			RandomWeapon((5066,2931,2355),(0,0,0));
		}
		else if(mapname == "mp_highrise" && level.edit == 1 && level.box >= 6 && level.boxposition == 3)
		{
			level thread BoxSwitchHighrise2();
		}
		else if(mapname == "mp_highrise" && level.edit == 1 && level.box <= 6 && level.boxposition == 3)
		{
			RandomWeapon((2727,11599,3371),(0,0,0));
		}
		else if(mapname == "mp_invasion")
		{
			RandomWeapon((-401,1368,267),(0,100,0));
		}
		else if(mapname == "mp_favela" && level.edit == 0)
		{
			RandomWeapon((1909,2486,291),(0,30,0));
		}
		else if(mapname == "mp_favela" && level.edit == 1)
		{
			RandomWeapon((-2395,2354,-765),(0,283,0));
		}
		else if(mapname == "mp_favela" && level.edit == 2)
		{
			RandomWeapon((-3782,-9312,-791),(0,160,0));
		}
		else if(mapname == "mp_checkpoint")
		{
			RandomWeapon((2740,2738,8),(0,90,0));
		}
		else if(mapname == "mp_quarry")
		{
			RandomWeapon((-3422,504,-269),(0,0,0));
		}
		else if(mapname == "mp_subbase")
		{
			RandomWeapon((-215,-4048,26),(0,90,0));
		}
		else if(mapname == "mp_strike")
		{
			RandomWeapon((-2199,1240,31),(0,0,0));
		}
		else if(mapname == "mp_vacant")
		{
			RandomWeapon((445,1526,-96),(0,0,0));
		}
		else if(mapname == "mp_underpass")
		{
			RandomWeapon((3968,2426,395),(0,90,0));
		}
		else if(mapname == "mp_rundown")
		{
			RandomWeapon((1407,2651,77),(0,0,0));
		}
		else if(mapname == "mp_fuel2")
		{
			RandomWeapon((-5996,1435,-125),(0,158,0));
		}
		else if(mapname == "mp_storm")
		{
			RandomWeapon((3465,-975,-52),(0,0,0));
		}
		else if(mapname == "mp_estate")
		{
			RandomWeapon((-3191,-1275,-527),(0,156,0));
		}
		else if(mapname == "mp_boneyard")
		{
			RandomWeapon((167,-1775,-124),(0,105,0));
		}
		else if(mapname == "mp_terminal")
		{
			RandomWeapon((4107,3232,203),(0,90,0));
		}
		else if(mapname == "mp_brecourt")
		{
			RandomWeapon((1259,-669,-44),(0,290,0));
		}
		else if(mapname == "mp_overgrown")
		{
			RandomWeapon((-1700,-5439,-148),(0,353,0));
		}
		else if(mapname == "mp_compact")
		{
			RandomWeapon((2250.3,3311.6,63.7),(0,0,0));
		}
		else if(mapname == "mp_crash")
		{
			RandomWeapon((-746,-2175,155),(0,0,0));
		}
		else if(mapname == "mp_abandon")
		{
			RandomWeapon((-2779,2928,3),(0,54,0));
		}
		else if(mapname == "mp_complex")
		{
			RandomWeapon((2500,-907,407),(0,90,0));
		}
		else if(mapname == "mp_trailerpark")
		{
			RandomWeapon((271.1,-2360.1,11.1),(0,90,0));
		}
		else if(mapname == "estate")
		{
			RandomWeapon((-166,63,179),(0,168,0));
		}
		else if(mapname == "arcadia")
		{
			RandomWeapon((4256,-7531,2380),(0,330,0));
		}
		else if(mapname == "oilrig")
		{
			RandomWeapon((-56,1022,-1388),(0,90,0));
		}
		else if(mapname == "mp_nuked")
		{
			RandomWeapon((-219,502,-50),(0,34,0));
		}
		else if(mapname == "invasion")
		{
			RandomWeapon((1240,5291,2291),(0,270,0));
		}
		else if(mapname == "mp_cross_fire")
		{
			RandomWeapon((2391,-3274,-48),(0,60,0));
		}
		else if(mapname == "contingency")
		{
			RandomWeapon((-13071,2834,620),(0,90,0));
		}
		else if(mapname == "favela")
		{
			switch(level.edit)
			{
				case 0:
				RandomWeapon((-4859,1994,791),(0,142,0));
				break;
				case 1:
				RandomWeapon((3176,-2047,651),(0,0,0));
				break;
			}
		}
		else
		{
			RandomWeapon(level.random_org,level.random_ang);
		}
	}
}