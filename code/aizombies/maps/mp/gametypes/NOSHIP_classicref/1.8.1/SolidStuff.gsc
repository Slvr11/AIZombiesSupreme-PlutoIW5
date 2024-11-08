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
		level.blockmove = spawn("script_model", (-1608,9688,2179));
		level.blockmove.angles = (0,90,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	else if(getDvar("mapname") == "mp_highrise" && level.edit == 0 && level.boxposition == 1)
	{
		level.blockmove = spawn("script_model", (-1939,10416,2275));
		level.blockmove.angles = (0,0,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	else if(getDvar("mapname") == "mp_highrise" && level.edit == 0 && level.boxposition == 2)
	{
		level.blockmove = spawn("script_model", (-942,10876,2179));
		level.blockmove.angles = (0,90,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	else if(getDvar("mapname") == "mp_highrise" && level.edit == 0 && level.boxposition == 3)
	{
		level.blockmove = spawn("script_model", (-666,11472,2179));
		level.blockmove.angles = (0,0,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	if(getDvar("mapname") == "mp_highrise" && level.edit == 1 && level.boxposition == 0)
	{
		level.blockmove = spawn("script_model", (2308,10069,4075));
		level.blockmove.angles = (0,0,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	else if(getDvar("mapname") == "mp_highrise" && level.edit == 1 && level.boxposition == 1)
	{
		level.blockmove = spawn("script_model", (1439,10831,3371));
		level.blockmove.angles = (0,90,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	else if(getDvar("mapname") == "mp_highrise" && level.edit == 1 && level.boxposition == 2)
	{
		level.blockmove = spawn("script_model", (5066,2931,2355));
		level.blockmove.angles = (0,0,0);
		level.blockmove setModel("com_plasticcase_friendly");
		level.blockmove Solid();
		level.blockmove MoveTo(level.blockmove.origin+(0,0,100), 5);
	}
	else if(getDvar("mapname") == "mp_highrise" && level.edit == 1 && level.boxposition == 3)
	{
		level.blockmove = spawn("script_model", (2727,11599,3371));
		level.blockmove.angles = (0,0,0);
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

PerkHud( shader )
{
	if(self.zombieperks == 1)
	{
		self.perkhuds[0] = NewClientHudElem( self );
		self.perkhuds[0].alignX = "center";
		self.perkhuds[0].alignY = "middle";
		self.perkhuds[0].horzAlign = "center";
		self.perkhuds[0].vertAlign = "middle";
		self.perkhuds[0].x = 0;
		self.perkhuds[0].y = 0;
		self.perkhuds[0].foreground = true;
		self.perkhuds[0] setIconShader( shader );
		self.perkhuds[0] setIconSize( 100, 100 );
		self.perkhuds[0].alpha = 1;
		self.perkhuds[0] scaleOverTime( 3, 25, 25 );
		self.perkhuds[0] moveOverTime( 3 );
		self.perkhuds[0].x = -410;
		self.perkhuds[0].y = 187;
	}
	if(self.zombieperks == 2)
	{
		self.perkhuds[1] = NewClientHudElem( self );
		self.perkhuds[1].alignX = "center";
		self.perkhuds[1].alignY = "middle";
		self.perkhuds[1].horzAlign = "center";
		self.perkhuds[1].vertAlign = "middle";
		self.perkhuds[1].x = 0;
		self.perkhuds[1].y = 0;
		self.perkhuds[1].foreground = true;
		self.perkhuds[1] setIconShader( shader );
		self.perkhuds[1] setIconSize( 100, 100 );
		self.perkhuds[1].alpha = 1;
		self.perkhuds[1] scaleOverTime( 3, 25, 25 );
		self.perkhuds[1] moveOverTime( 3 );
		self.perkhuds[1].x = -388;
		self.perkhuds[1].y = 187;
	}
	if(self.zombieperks == 3)
	{
		self.perkhuds[2] = NewClientHudElem( self );
		self.perkhuds[2].alignX = "center";
		self.perkhuds[2].alignY = "middle";
		self.perkhuds[2].horzAlign = "center";
		self.perkhuds[2].vertAlign = "middle";
		self.perkhuds[2].x = 0;
		self.perkhuds[2].y = 0;
		self.perkhuds[2].foreground = true;
		self.perkhuds[2] setIconShader( shader );
		self.perkhuds[2] setIconSize( 100, 100 );
		self.perkhuds[2].alpha = 1;
		self.perkhuds[2] scaleOverTime( 3, 25, 25 );
		self.perkhuds[2] moveOverTime( 3 );
		self.perkhuds[2].x = -366;
		self.perkhuds[2].y = 187;
	}
	if(self.zombieperks == 4)
	{
		self.perkhuds[3] = NewClientHudElem( self );
		self.perkhuds[3].alignX = "center";
		self.perkhuds[3].alignY = "middle";
		self.perkhuds[3].horzAlign = "center";
		self.perkhuds[3].vertAlign = "middle";
		self.perkhuds[3].x = 0;
		self.perkhuds[3].y = 0;
		self.perkhuds[3].foreground = true;
		self.perkhuds[3] setIconShader( shader );
		self.perkhuds[3] setIconSize( 100, 100 );
		self.perkhuds[3].alpha = 1;
		self.perkhuds[3] scaleOverTime( 3, 25, 25 );
		self.perkhuds[3] moveOverTime( 3 );
		self.perkhuds[3].x = -344;
		self.perkhuds[3].y = 187;
	}
	if(self.zombieperks == 5)
	{
		self.perkhuds[4] = NewClientHudElem( self );
		self.perkhuds[4].alignX = "center";
		self.perkhuds[4].alignY = "middle";
		self.perkhuds[4].horzAlign = "center";
		self.perkhuds[4].vertAlign = "middle";
		self.perkhuds[4].x = 0;
		self.perkhuds[4].y = 0;
		self.perkhuds[4].foreground = true;
		self.perkhuds[4] setIconShader( shader );
		self.perkhuds[4] setIconSize( 100, 100 );
		self.perkhuds[4].alpha = 1;
		self.perkhuds[4] scaleOverTime( 3, 25, 25 );
		self.perkhuds[4] moveOverTime( 3 );
		self.perkhuds[4].x = -322;
		self.perkhuds[4].y = 187;
	}
	if(self.zombieperks == 6)
	{
		self.perkhuds[5] = NewClientHudElem( self );
		self.perkhuds[5].alignX = "center";
		self.perkhuds[5].alignY = "middle";
		self.perkhuds[5].horzAlign = "center";
		self.perkhuds[5].vertAlign = "middle";
		self.perkhuds[5].x = 0;
		self.perkhuds[5].y = 0;
		self.perkhuds[5].foreground = true;
		self.perkhuds[5] setIconShader( shader );
		self.perkhuds[5] setIconSize( 100, 100 );
		self.perkhuds[5].alpha = 1;
		self.perkhuds[5] scaleOverTime( 3, 25, 25 );
		self.perkhuds[5] moveOverTime( 3 );
		self.perkhuds[5].x = -300;
		self.perkhuds[5].y = 187;
	}
	if(self.zombieperks == 7)
	{
		self.perkhuds[6] = NewClientHudElem( self );
		self.perkhuds[6].alignX = "center";
		self.perkhuds[6].alignY = "middle";
		self.perkhuds[6].horzAlign = "center";
		self.perkhuds[6].vertAlign = "middle";
		self.perkhuds[6].x = 0;
		self.perkhuds[6].y = 0;
		self.perkhuds[6].foreground = true;
		self.perkhuds[6] setIconShader( shader );
		self.perkhuds[6] setIconSize( 100, 100 );
		self.perkhuds[6].alpha = 1;
		self.perkhuds[6] scaleOverTime( 3, 25, 25 );
		self.perkhuds[6] moveOverTime( 3 );
		self.perkhuds[6].x = -278;
		self.perkhuds[6].y = 187;
	}
}