#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;
#include AImod\_zombie_spawns;

ZombieCount()
{
	zombCount = 0;
	for(i = 0;i < level.BotsForWave;i++)
	{
		if(isDefined(level.bots[i]) && level.bots[i].crate1.health >= 1 && level.bots[i].pers["isAlive"] == "true") 
			zombCount++;
	}
	return zombCount;
}

SpawnTrigger(Torigin, gotoOrigin, width, height, map_name)
{
	trig = spawn("trigger_radius", Torigin,0,width,height);
	trig.goto = gotoOrigin;
	trig thread waitfortrig(map_name);
	return trig;
}

waitfortrig(map_name)
{
	while(getdvar("mapname") == map_name)
	{
		self waittill("trigger",player);
		if(player.sessionstate != "playing") 
		{
			continue;
		}
		player setOrigin(self.goto);
		player iPrintlnBold("Anti-Glitch");
		wait 0.05;
	}
}

GetMapSpawnPoint( )
{
	level endon("game_ended");
	Waypoint = undefined;
	switch( getDvar("mapname") )
	{
		case "mp_afghan": switch( randomInt(5) )
		{
			case 0: Waypoint = (-3883,-553,-1448);
			break;
			case 1: Waypoint = (-3975,3,-1448);
			break;
			case 2: Waypoint = (-3828,-1164,-1448);
			break;
			case 3: Waypoint = (-4523,1006,-1449);
			break;
			case 4: Waypoint = (-4422,1209,-1449);
			break;
		}
		break;
		case "mp_highrise": if(level.edit == 0) switch( randomInt(5) )
		{
			case 0: Waypoint = (-2727,11367,2275);
			break;
			case 1: Waypoint = (-1677,11280,2179);
			break;
			case 2: Waypoint = (-1684,11124,2179);
			break;
			case 3: Waypoint = (-558,9998,2179);
			break;
			case 4: Waypoint = (-2362,11359,2275);
			break;
		}
		else if(level.edit == 1)
		{
			Waypoint = ZombieSpawnsHighrise2(level.progressmap);
		}
		break;
		case "mp_quarry": switch( randomInt(5) )
		{
			case 0: Waypoint = (-5450.5,2040.9,98.4);
			break;
			case 1: Waypoint = (-5299.9,2052.6,96.5);
			break;
			case 2: Waypoint = (-4564.2,3020.4,81.6);
			break;
			case 3: Waypoint = (-2071.8,765.1,29);
			break;
			case 4: Waypoint = (-2208.5,762.4,28.8);
			break;
		}
		break;
		case "mp_brecourt": switch( randomInt(6) )
		{
			case 0: Waypoint = (10961,6828,358);
			break;
			case 1: Waypoint = (10955,6688,358);
			break;
			case 2: Waypoint = (9850,8886,358);
			break;
			case 3: Waypoint = (9693,8883,358);
			break;
			case 4: Waypoint = (12867,7423,1486);
			break;
			case 5: Waypoint = (12856,7070,1486);
			break;
		}
		break;
		case "mp_rust": if(level.edit == 0) switch( randomInt(8) )
		{
			case 0: Waypoint = (3703,-6900,-220);
			break;
			case 1: Waypoint = (2638,-6917,-258);
			break;
			case 2: Waypoint = (2524,-6328,-231);
			break;
			case 3: Waypoint = (4281,-10529,-162);
			break;
			case 4: Waypoint = (4489,-10224,-199);
			break;
			case 5: Waypoint = (-1342,-9528,-243);
			break;
			case 6: Waypoint = (-1294,-9813,-191);
			break;
			case 7: Waypoint = (-1165,-9661,-213);
			break;
		}
		else if(level.edit == 1) switch( randomInt(8) )
		{
			case 0: Waypoint = (532,-9970,-75);
			break;
			case 1: Waypoint = (842,-10000,-92);
			break;
			case 2: Waypoint = (1154,-9684,-131);
			break;
			case 3: Waypoint = (1483,-9520,-164);
			break;
			case 4: Waypoint = (-651,-5268,-201);
			break;
			case 5: Waypoint = (-712,-5424,-217);
			break;
			case 6: Waypoint = (-2660,-6704,-252);
			break;
			case 7: Waypoint = (-2775,-7030,-245);
			break;
		}
		break;
		case "mp_terminal": switch( randomInt(5) )
		{
			case 0: Waypoint = (2814,2838,63);
			break;
			case 1: Waypoint = (45,4253,51);
			break;
			case 2: Waypoint = (11,4157,51);
			break;
			case 3: Waypoint = (2917,3983,95);
			break;
			case 4: Waypoint = (2426,4398,198);
			break;
		}
		break;
		case "mp_boneyard": switch( randomInt(7) )
		{
			case 0: Waypoint = (-674,-3297,-12);
			break;
			case 1: Waypoint = (1287,-2771,-52);
			break;
			case 2: Waypoint = (1268,-2908,-52);
			break;
			case 3: Waypoint = (1205,-2046,-52);
			break;
			case 4: Waypoint = (1440,-4082,-52);
			break;
			case 5: Waypoint = (-1036,-3259,-12);
			break;
			case 6: Waypoint = (-1212,-2318,-7);
			break;
		}
		break;
		case "mp_underpass": switch( randomInt(4) )
		{
			case 0: Waypoint = (2811,3147,400);
			break;
			case 1: Waypoint = (3009,2663,424);
			break;
			case 2: Waypoint = (2799,2946,395);
			break;
			case 3: Waypoint = (4036,3602,432);
			break;
		}
		break;
		case "mp_derail": switch( randomInt(8) )
		{
			case 0: Waypoint = (981,3216,192);
			break;
			case 1: Waypoint = (1042,3240,192);
			break;
			case 2: Waypoint = (914,1633,198);
			break;
			case 3: Waypoint = (933,1567,176);
			break;
			case 4: Waypoint = (2760,819,186);
			break;
			case 5: Waypoint = (2987,823,188);
			break;
			case 6: Waypoint = (2541,3475,247);
			break;
			case 7: Waypoint = (1695,2781,129);
			break;
		}
		break;
		case "mp_nightshift": if(level.edit == 0) switch( randomInt(7) )
		{
			case 0: Waypoint = (-103.6,-1894.1,11.1);
			break;
			case 1: Waypoint = (48.9,927.4,91.1);
			break;
			case 2: Waypoint = (48.9,805.9,91.1);
			break;
			case 3: Waypoint = (-1856.9,-2192.3,11.9);
			break;
			case 4: Waypoint = (-1803.5,-2203.2,16.1);
			break;
			case 5: Waypoint = (-323.3,-713.0,7.1);
			break;
			case 6: Waypoint = (-364.8,-538.5,7.1);
			break;
		}
		else if(level.edit == 1) switch( randomInt(6) )
		{
			case 0: Waypoint = (-610,-1922,16);
			break;
			case 1: Waypoint = (1904,-1258,3);
			break;
			case 2: Waypoint = (-205,-745,16);
			break;
			case 3: Waypoint = (-107,672,24);
			break;
			case 4: Waypoint = (-6,593,24);
			break;
			case 5: Waypoint = (-611,-1873,16);
			break;
		}
		else if(level.edit == 2) switch( randomInt(4) )
		{
			case 0: Waypoint = (1963,-3377,8);
			break;
			case 1: Waypoint = (1740,-3359,16);
			break;
			case 2: Waypoint = (1666,-3366,16);
			break;
			case 3: Waypoint = (1599,-3368,16);
			break;
		}
		break;
		case "mp_estate": switch( randomInt(6) )
		{
			case 0: Waypoint = (-2602,-2388,-490);
			break;
			case 1: Waypoint = (-2698,-2395,-491);
			break;
			case 2: Waypoint = (-2771,-2384,-489);
			break;
			case 3: Waypoint = (-4069,-5,106);
			break;
			case 4: Waypoint = (-4164,-81,100);
			break;
			case 5: Waypoint = (-2316,-2096,-610);
			break;
		}
		break;
		case "mp_favela": switch( randomInt(3) )
		{
			case 0: Waypoint = (2951,3108,296);
			break;
			case 1: Waypoint = (2892,3025,296);
			break;
			case 2: Waypoint = (2699,3120,296);
			break;
		}
		break;
		case "mp_invasion": switch( randomInt(5) )
		{
			case 0: Waypoint = (4707,12271,4);
			break;
			case 1: Waypoint = (4656,11899,9);
			break;
			case 2: Waypoint = (4139,11325,-37);
			break;
			case 3: Waypoint = (2401,8462,16);
			break;
			case 4: Waypoint = (2460,8366,16);
			break;
		}
		break;
		case "mp_checkpoint": switch( randomInt(8) )
		{
			case 0: Waypoint = (2584,5298,-15);
			break;
			case 1: Waypoint = (2280,5295,-15);
			break;
			case 2: Waypoint = (-42,3239,16);
			break;
			case 3: Waypoint = (-39,3020,16);
			break;
			case 4: Waypoint = (4030,2730,-28);
			break;
			case 5: Waypoint = (4083,3150,-28);
			break;
			case 6: Waypoint = (-68,2785,19);
			break;
			case 7: Waypoint = (4308,2511,3);
			break;
		}
		break;
		case "mp_subbase": switch( randomInt(3) )
		{
			case 0: Waypoint = (-422,-6429,16);
			break;
			case 1: Waypoint = (-339,-6430,16);
			break;
			case 2: Waypoint = (-252,-6434,16);
			break;
		}
		break;
		case "mp_trailerpark": switch( randomInt(6) )
		{
			case 0: Waypoint = (2772.9,-2118.9,16.1);
			break;
			case 1: Waypoint = (2785.4,-2068.2,16.1);
			break;
			case 2: Waypoint = (2754.0,-1988.4,17.1);
			break;
			case 3: Waypoint = (-1299.1,-2064.4,16.0);
			break;
			case 4: Waypoint = (-1176.7,-1980.7,16.0);
			break;
			case 5: Waypoint = (-1203.7,-2142.3,16.0);
			break;
		}
		break;
		case "mp_rundown": switch( randomInt(5) )
		{
			case 0: Waypoint = (445,1859,121);
			break;
			case 1: Waypoint = (1581,2081,-5);
			break;
			case 2: Waypoint = (-86,2560,146);
			break;
			case 3: Waypoint = (117,2234,213);
			break;
			case 4: Waypoint = (514,3748,41);
			break;
		}
		break;
		case "mp_compact": switch( randomInt(4) )
		{
			case 0: Waypoint = (3764,2701,285);
			break;
			case 1: Waypoint = (1050,2000,116);
			break;
			case 2: Waypoint = (1072,1943,133);
			break;
			case 3: Waypoint = (3763,2759,285);
			break;
		}
		break;
		case "mp_strike": switch( randomInt(2) )
		{
			case 0: Waypoint = (-3888,1311,17);
			break;
			case 1: Waypoint = (-3879,1459,16);
			break;
		}
		break;
		case "mp_complex": switch( randomInt(6) )
		{
			case 0: Waypoint = (197,-1142,416);
			break;
			case 1: Waypoint = (-577,692,402);
			break;
			case 2: Waypoint = (1369,744,395);
			break;
			case 3: Waypoint = (-2105,-164,412);
			break;
			case 4: Waypoint = (-2076,-426,412);
			break;
			case 5: Waypoint = (-1925,-1220,412);
			break;
		}
		break;
		case "mp_abandon": switch( randomInt(13) )
		{
			case 0: Waypoint = (-1249,1119,3);
			break;
			case 1: Waypoint = (-2064,1635,3);
			break;
			case 2: Waypoint = (-1143,1217,3);
			break;
			case 3: Waypoint = (-842,2015,3);
			break;
			case 4: Waypoint = (-290,3437,3);
			break;
			case 5: Waypoint = (-829,4036,3);
			break;
			case 6: Waypoint = (-2844,5341,3);
			break;
			case 7: Waypoint = (-3144,5303,3);
			break;
			case 8: Waypoint = (-3674,4526,3);
			break;
			case 9: Waypoint = (-4415,3575,3);
			break;
			case 10: Waypoint = (-4112,1326,1);
			break;
			case 11: Waypoint = (-3793,1030,1);
			break;
			case 12: Waypoint = (-3395,777,1);
			break;
		}
		break;
		case "mp_vacant": switch( randomInt(6) )
		{
			case 0: Waypoint = (-1768,1765,-87);
			break;
			case 1: Waypoint = (-1830,1769,-87);
			break;
			case 2: Waypoint = (-734,1782,-97);
			break;
			case 3: Waypoint = (68,-1375,-88);
			break;
			case 4: Waypoint = (494,-1189,-85);
			break;
			case 5: Waypoint = (-972,-1366,-91);
			break;
		}
		break;
		case "mp_storm": switch( randomInt(6) )
		{
			case 0: Waypoint = (5136,-1295,48);
			break;
			case 1: Waypoint = (5120,-1105,48);
			break;
			case 2: Waypoint = (4957,851,-47);
			break;
			case 3: Waypoint = (4787,794,-48);
			break;
			case 4: Waypoint = (2851,-1777,8);
			break;
			case 5: Waypoint = (4210,-837,8);
			break;
		}
		break;
		case "mp_fuel2": switch( randomInt(7) )
		{
			case 0: Waypoint = (13102,29849,8033);
			break;
			case 1: Waypoint = (12960,29570,8034);
			break;
			case 2: Waypoint = (12704,28048,8465);
			break;
			case 3: Waypoint = (14617,25078,9050);
			break;
			case 4: Waypoint = (18060,32789,8633);
			break;
			case 5: Waypoint = (22002,28482,6810);
			break;
			case 6: Waypoint = (21824,28959,6834);
			break;
		}
		break;
		case "mp_overgrown": switch( randomInt(9) )
		{
			case 0: Waypoint = (-2766,-6210,-143);
			break;
			case 1: Waypoint = (-2773,-6079,-143);
			break;
			case 2: Waypoint = (-2766,-5974,-143);
			break;
			case 3: Waypoint = (-2764,-5577,-144);
			break;
			case 4: Waypoint = (-1999,-6752,-143);
			break;
			case 5: Waypoint = (-1461,-6547,-144);
			break;
			case 6: Waypoint = (-1169,-6295,-144);
			break;
			case 7: Waypoint = (-879,-6137,-150);
			break;
			case 8: Waypoint = (-1522,-6546,-144);
			break;
		}
		break;
		case "mp_crash": switch( randomInt(6) )
		{
			case 0: Waypoint = (-908,-3844,61);
			break;
			case 1: Waypoint = (-1052,-3826,61);
			break;
			case 2: Waypoint = (-1156,-3821,62);
			break;
			case 3: Waypoint = (-426,-1637,88);
			break;
			case 4: Waypoint = (-472,-1567,93);
			break;
			case 5: Waypoint = (-436,-1701,88);
			break;
		}
		break;
	}
	return Waypoint;
}

GetHeadSpawnModelZombie( )
{
	rModel = "";

	switch( getDvar("mapname") )
	{
		case "mp_afghan": switch( randomInt(5) )
		{
			case 0: rModel = "head_opforce_arab_a";
			break;
			case 1: rModel = "head_opforce_arab_b";
			break;
			case 2: rModel = "head_opforce_arab_c";
			break;
			case 3: rModel = "head_opforce_arab_d_hat";
			break;
			case 4: rModel = "head_opforce_arab_e";
			break;
		}
		break;
		case "mp_strike": switch( randomInt(5) )
		{
			case 0: rModel = "head_opforce_arab_a";
			break;
			case 1: rModel = "head_opforce_arab_b";
			break;
			case 2: rModel = "head_opforce_arab_c";
			break;
			case 3: rModel = "head_opforce_arab_d_hat";
			break;
			case 4: rModel = "head_opforce_arab_e";
			break;
		}
		break;
		case "mp_rust": switch( randomInt(5) )
		{
			case 0: rModel = "head_opforce_arab_a";
			break;
			case 1: rModel = "head_opforce_arab_b";
			break;
			case 2: rModel = "head_opforce_arab_c";
			break;
			case 3: rModel = "head_opforce_arab_d_hat";
			break;
			case 4: rModel = "head_opforce_arab_e";
			break;
		}
		case "mp_boneyard": switch( randomInt(5) )
		{
			case 0: rModel = "head_opforce_arab_a";
			break;
			case 1: rModel = "head_opforce_arab_b";
			break;
			case 2: rModel = "head_opforce_arab_c";
			break;
			case 3: rModel = "head_opforce_arab_d_hat";
			break;
			case 4: rModel = "head_opforce_arab_e";
			break;
		}
		break;
		case "mp_trailerpark": switch( randomInt(5) )
		{
			case 0: rModel = "head_opforce_arab_a";
			break;
			case 1: rModel = "head_opforce_arab_b";
			break;
			case 2: rModel = "head_opforce_arab_c";
			break;
			case 3: rModel = "head_opforce_arab_d_hat";
			break;
			case 4: rModel = "head_opforce_arab_e";
			break;
		}
		break;
		case "mp_invasion": switch( randomInt(5) )
		{
			case 0: rModel = "head_opforce_arab_a";
			break;
			case 1: rModel = "head_opforce_arab_b";
			break;
			case 2: rModel = "head_opforce_arab_c";
			break;
			case 3: rModel = "head_opforce_arab_d_hat";
			break;
			case 4: rModel = "head_opforce_arab_e";
			break;
		}
		break;
		case "mp_checkpoint": switch( randomInt(5) )
		{
			case 0: rModel = "head_opforce_arab_a";
			break;
			case 1: rModel = "head_opforce_arab_b";
			break;
			case 2: rModel = "head_opforce_arab_c";
			break;
			case 3: rModel = "head_opforce_arab_d_hat";
			break;
			case 4: rModel = "head_opforce_arab_e";
			break;
		}
		break;
		case "mp_underpass": switch( randomInt(4) )
		{
			case 0: rModel = "head_militia_ba_blk";
			break;
			case 1: rModel = "head_militia_bb_blk_hat";
			break;
			case 2: rModel = "head_militia_bc_blk";
			break;
			case 3: rModel = "head_militia_bd_blk";
			break;
		}
		break;
		case "mp_quarry": switch( randomInt(4) )
		{
			case 0: rModel = "head_militia_ba_blk";
			break;
			case 1: rModel = "head_militia_bb_blk_hat";
			break;
			case 2: rModel = "head_militia_bc_blk";
			break;
			case 3: rModel = "head_militia_bd_blk";
			break;
		}
		break;
		case "mp_favela": switch( randomInt(4) )
		{
			case 0: rModel = "head_militia_ba_blk";
			break;
			case 1: rModel = "head_militia_bb_blk_hat";
			break;
			case 2: rModel = "head_militia_bc_blk";
			break;
			case 3: rModel = "head_militia_bd_blk";
			break;
		}
		break;
		case "mp_rundown": switch( randomInt(4) )
		{
			case 0: rModel = "head_militia_ba_blk";
			break;
			case 1: rModel = "head_militia_bb_blk_hat";
			break;
			case 2: rModel = "head_militia_bc_blk";
			break;
			case 3: rModel = "head_militia_bd_blk";
			break;
		}
		break;
		case "mp_abandon": switch( randomInt(4) )
		{
			case 0: rModel = "head_militia_ba_blk";
			break;
			case 1: rModel = "head_militia_bb_blk_hat";
			break;
			case 2: rModel = "head_militia_bc_blk";
			break;
			case 3: rModel = "head_militia_bd_blk";
			break;
		}
		break;
		case "mp_derail": switch( randomInt(4) )
		{
			case 0: rModel = "head_opforce_arctic_a";
			break;
			case 1: rModel = "head_opforce_arctic_b";
			break;
			case 2: rModel = "head_opforce_arctic_c";
			break;
			case 3: rModel = "head_opforce_arctic_d";
			break;
		}
		break;
		case "mp_compact": switch( randomInt(4) )
		{
			case 0: rModel = "head_opforce_arctic_a";
			break;
			case 1: rModel = "head_opforce_arctic_b";
			break;
			case 2: rModel = "head_opforce_arctic_c";
			break;
			case 3: rModel = "head_opforce_arctic_d";
			break;
		}
		break;
		case "mp_subbase": switch( randomInt(4) )
		{
			case 0: rModel = "head_opforce_arctic_a";
			break;
			case 1: rModel = "head_opforce_arctic_b";
			break;
			case 2: rModel = "head_opforce_arctic_c";
			break;
			case 3: rModel = "head_opforce_arctic_d";
			break;
		}
		break;
		case "mp_highrise": switch( randomInt(5) )
		{
			case 0: rModel = "head_airborne_a";
			break;
			case 1: rModel = "head_airborne_b";
			break;
			case 2: rModel = "head_airborne_c";
			break;
			case 3: rModel = "head_airborne_d";
			break;
			case 4: rModel = "head_airborne_e";
			break;
		}
		break;
		case "mp_terminal": switch( randomInt(5) )
		{
			case 0: rModel = "head_airborne_a";
			break;
			case 1: rModel = "head_airborne_b";
			break;
			case 2: rModel = "head_airborne_c";
			break;
			case 3: rModel = "head_airborne_d";
			break;
			case 4: rModel = "head_airborne_e";
			break;
		}
		break;
		case "mp_complex": switch( randomInt(5) )
		{
			case 0: rModel = "head_airborne_a";
			break;
			case 1: rModel = "head_airborne_b";
			break;
			case 2: rModel = "head_airborne_c";
			break;
			case 3: rModel = "head_airborne_d";
			break;
			case 4: rModel = "head_airborne_e";
			break;
		}
		break;
		case "mp_brecourt": switch( randomInt(5) )
		{
			case 0: rModel = "head_airborne_a";
			break;
			case 1: rModel = "head_airborne_b";
			break;
			case 2: rModel = "head_airborne_c";
			break;
			case 3: rModel = "head_airborne_d";
			break;
			case 4: rModel = "head_airborne_e";
			break;
		}
		break;
		case "mp_nightshift": switch( randomInt(5) )
		{
			case 0: rModel = "head_airborne_a";
			break;
			case 1: rModel = "head_airborne_b";
			break;
			case 2: rModel = "head_airborne_c";
			break;
			case 3: rModel = "head_airborne_d";
			break;
			case 4: rModel = "head_airborne_e";
			break;
		}
		break;
		case "mp_estate": switch( randomInt(5) )
		{
			case 0: rModel = "head_airborne_a";
			break;
			case 1: rModel = "head_airborne_b";
			break;
			case 2: rModel = "head_airborne_c";
			break;
			case 3: rModel = "head_airborne_d";
			break;
			case 4: rModel = "head_airborne_e";
			break;
		}
		break;
		case "mp_vacant": switch( randomInt(5) )
		{
			case 0: rModel = "head_airborne_a";
			break;
			case 1: rModel = "head_airborne_b";
			break;
			case 2: rModel = "head_airborne_c";
			break;
			case 3: rModel = "head_airborne_d";
			break;
			case 4: rModel = "head_airborne_e";
			break;
		}
		break;
		case "mp_storm": switch( randomInt(5) )
		{
			case 0: rModel = "head_airborne_a";
			break;
			case 1: rModel = "head_airborne_b";
			break;
			case 2: rModel = "head_airborne_c";
			break;
			case 3: rModel = "head_airborne_d";
			break;
			case 4: rModel = "head_airborne_e";
			break;
		}
		break;
		case "mp_fuel2": switch( randomInt(5) )
		{
			case 0: rModel = "head_opforce_arab_a";
			break;
			case 1: rModel = "head_opforce_arab_b";
			break;
			case 2: rModel = "head_opforce_arab_c";
			break;
			case 3: rModel = "head_opforce_arab_d_hat";
			break;
			case 4: rModel = "head_opforce_arab_e";
			break;
		}
		break;
		case "mp_overgrown": switch( randomInt(5) )
		{
			case 0: rModel = "head_airborne_a";
			break;
			case 1: rModel = "head_airborne_b";
			break;
			case 2: rModel = "head_airborne_c";
			break;
			case 3: rModel = "head_airborne_d";
			break;
			case 4: rModel = "head_airborne_e";
			break;
		}
		break;
		case "mp_crash": switch( randomInt(5) )
		{
			case 0: rModel = "head_opforce_arab_a";
			break;
			case 1: rModel = "head_opforce_arab_b";
			break;
			case 2: rModel = "head_opforce_arab_c";
			break;
			case 3: rModel = "head_opforce_arab_d_hat";
			break;
			case 4: rModel = "head_opforce_arab_e";
			break;
		}
		break;
	}

	return rModel;
}

GetBossSpawnModel( )
{
	level endon("game_ended");
	rModel = "";
	switch( getDvar("mapname") )
	{
		case "mp_underpass": rModel = "mp_body_riot_op_militia";
		break;
		case "mp_quarry": rModel = "mp_body_riot_op_militia";
		break;
		case "mp_afghan": rModel = "mp_body_riot_op_arab";
		break;
		case "mp_strike": rModel = "mp_body_riot_op_arab";
		break;
		case "mp_rust": rModel = "mp_body_riot_op_arab";
		break;
		case "mp_boneyard": rModel = "mp_body_riot_op_arab";
		break;
		case "mp_trailerpark": rModel = "mp_body_riot_op_arab";
		break;
		case "mp_derail": rModel = "mp_body_riot_op_arctic";
		break;
		case "mp_compact": rModel = "mp_body_riot_op_arctic";
		break;
		case "mp_highrise": rModel = "mp_body_riot_op_airborne";
		break;
		case "mp_terminal": rModel = "mp_body_riot_op_airborne";
		break;
		case "mp_complex": rModel = "mp_body_riot_op_airborne";
		break;
		case "mp_brecourt": rModel = "mp_body_riot_op_airborne";
		break;
		case "mp_nightshift": rModel = "mp_body_riot_op_airborne";
		break;
		case "mp_estate": rModel = "mp_body_riot_op_airborne";
		break;
		case "mp_favela": rModel = "mp_body_riot_op_militia";
		break;
		case "mp_invasion": rModel = "mp_body_riot_op_arab";
		break;
		case "mp_checkpoint": rModel = "mp_body_riot_op_arab";
		break;
		case "mp_subbase": rModel = "mp_body_riot_op_arctic";
		break;
		case "mp_rundown": rModel = "mp_body_riot_op_militia";
		break;
		case "mp_abandon": rModel = "mp_body_riot_op_militia";
		break;
		case "mp_vacant": rModel = "mp_body_riot_op_airborne";
		break;
		case "mp_storm": rModel = "mp_body_riot_op_airborne";
		break;
		case "mp_fuel2": rModel = "mp_body_riot_op_arab";
		break;
		case "mp_overgrown": rModel = "mp_body_riot_op_airborne";
		break;
		case "mp_crash": rModel = "mp_body_riot_op_arab";
		break;
	}
	return rModel;
}

GetBossHeadSpawnModel( )
{
	rModel = "";
	switch( getDvar("mapname") )
	{
		case "mp_underpass": rModel = "head_riot_op_militia";
		break;
		case "mp_quarry": rModel = "head_riot_op_militia";
		break;
		case "mp_afghan": rModel = "head_riot_op_arab";
		break;
		case "mp_strike": rModel = "head_riot_op_arab";
		break;
		case "mp_rust": rModel = "head_riot_op_arab";
		break;
		case "mp_boneyard": rModel = "head_riot_op_arab";
		break;
		case "mp_trailerpark": rModel = "head_riot_op_arab";
		break;
		case "mp_derail": rModel = "head_riot_op_arctic";
		break;
		case "mp_compact": rModel = "head_riot_op_arctic";
		break;
		case "mp_highrise": rModel = "head_riot_op_airborne";
		break;
		case "mp_complex": rModel = "head_riot_op_airborne";
		break;
		case "mp_terminal": rModel = "head_riot_op_airborne";
		break;
		case "mp_brecourt": rModel = "head_riot_op_airborne";
		break;
		case "mp_nightshift": rModel = "head_riot_op_airborne";
		break;
		case "mp_estate": rModel = "mp_body_op_sniper_ghillie_forest";
		break;
		case "mp_favela": rModel = "head_riot_op_militia";
		break;
		case "mp_invasion": rModel = "head_riot_op_arab";
		break;
		case "mp_checkpoint": rModel = "head_riot_op_arab";
		break;
		case "mp_subbase": rModel = "head_riot_op_arctic";
		break;
		case "mp_rundown": rModel = "head_riot_op_militia";
		break;
		case "mp_abandon": rModel = "head_riot_op_militia";
		break;
		case "mp_vacant": rModel = "head_riot_op_airborne";
		break;
		case "mp_storm": rModel = "head_riot_op_airborne";
		break;
		case "mp_fuel2": rModel = "head_riot_op_arab";
		break;
		case "mp_overgrown": rModel = "head_riot_op_airborne";
		break;
		case "mp_crash": rModel = "head_riot_op_arab";
		break;
	}
	return rModel;
}

GetCrawlerHeadModel( )
{
	level endon("game_ended");
	rModel = "";
	switch( getDvar("mapname") )
	{
		case "mp_underpass": rModel = "head_op_sniper_ghillie_forest";
		break;
		case "mp_quarry": rModel = "head_allies_sniper_ghillie_desert";
		break;
		case "mp_afghan": rModel = "head_allies_sniper_ghillie_desert";
		break;
		case "mp_strike": rModel = "head_allies_sniper_ghillie_desert";
		break;
		case "mp_rust": rModel = "head_allies_sniper_ghillie_desert";
		break;
		case "mp_boneyard": rModel = "head_allies_sniper_ghillie_desert";
		break;
		case "mp_trailerpark": rModel = "head_opforce_arab_d_hat";
		break;
		case "mp_derail": rModel = "head_allies_sniper_ghillie_arctic";
		break;
		case "mp_compact": rModel = "head_opforce_arctic_c";
		break;
		case "mp_highrise": rModel = "head_allies_sniper_ghillie_urban";
		break;
		case "mp_terminal": rModel = "head_allies_sniper_ghillie_urban";
		break;
		case "mp_complex": rModel = "head_allies_sniper_ghillie_urban";
		break;
		case "mp_brecourt": rModel = "head_allies_sniper_ghillie_forest";
		break;
		case "mp_nightshift": rModel = "head_allies_sniper_ghillie_urban";
		break;
		case "mp_estate": rModel = "head_allies_sniper_ghillie_forest";
		break;
		case "mp_favela": rModel = "head_allies_sniper_ghillie_urban";
		break;
		case "mp_invasion": rModel = "head_allies_sniper_ghillie_urban";
		break;
		case "mp_checkpoint": rModel = "head_allies_sniper_ghillie_urban";
		break;
		case "mp_subbase": rModel = "head_allies_sniper_ghillie_urban";
		break;
		case "mp_rundown": rModel = "head_allies_sniper_ghillie_desert";
		break;
		case "mp_abandon": rModel = "head_allies_sniper_ghillie_urban";
		break;
		case "mp_vacant": rModel = "head_allies_sniper_ghillie_urban";
		break;
		case "mp_storm": rModel = "head_allies_sniper_ghillie_urban";
		break;
		case "mp_fuel2": rModel = "head_allies_sniper_ghillie_desert";
		break;
		case "mp_overgrown": rModel = "head_allies_sniper_ghillie_forest";
		break;
		case "mp_crash": rModel = "head_allies_sniper_ghillie_urban";
		break;
	}
	return rModel;
}

GetCrawlerSpawnModel( )
{
	level endon("game_ended");
	rModel = "";
	switch( getDvar("mapname") )
	{
		case "mp_underpass": rModel = "mp_body_op_sniper_ghillie_forest";
		break;
		case "mp_quarry": rModel = "mp_body_ally_sniper_ghillie_desert";
		break;
		case "mp_afghan": rModel = "mp_body_ally_sniper_ghillie_desert";
		break;
		case "mp_strike": rModel = "mp_body_ally_sniper_ghillie_desert";
		break;
		case "mp_rust": rModel = "mp_body_ally_sniper_ghillie_desert";
		break;
		case "mp_boneyard": rModel = "mp_body_ally_sniper_ghillie_desert";
		break;
		case "mp_trailerpark": rModel = "mp_body_opforce_arab_lmg_a";
		break;
		case "mp_derail": rModel = "mp_body_ally_sniper_ghillie_arctic";
		break;
		case "mp_compact": rModel = "mp_body_opforce_arctic_lmg_c";
		break;
		case "mp_highrise": rModel = "mp_body_ally_sniper_ghillie_urban";
		break;
		case "mp_terminal": rModel = "mp_body_ally_sniper_ghillie_urban";
		break;
		case "mp_complex": rModel = "mp_body_ally_sniper_ghillie_urban";
		break;
		case "mp_brecourt": rModel = "mp_body_ally_sniper_ghillie_forest";
		break;
		case "mp_nightshift": rModel = "mp_body_op_sniper_ghillie_urban";
		break;
		case "mp_estate": rModel = "mp_body_op_sniper_ghillie_forest";
		break;
		case "mp_favela": rModel = "mp_body_ally_sniper_ghillie_urban";
		break;
		case "mp_invasion": rModel = "mp_body_op_sniper_ghillie_urban";
		break;
		case "mp_checkpoint": rModel = "mp_body_ally_sniper_ghillie_urban";
		break;
		case "mp_subbase": rModel = "mp_body_ally_sniper_ghillie_urban";
		break;
		case "mp_rundown": rModel = "mp_body_ally_sniper_ghillie_desert";
		break;
		case "mp_abandon": rModel = "mp_body_ally_sniper_ghillie_urban";
		break;
		case "mp_vacant": rModel = "mp_body_op_sniper_ghillie_urban";
		break;
		case "mp_storm": rModel = "mp_body_op_sniper_ghillie_urban";
		break;
		case "mp_fuel2": rModel = "mp_body_ally_sniper_ghillie_desert";
		break;
		case "mp_overgrown": rModel = "mp_body_op_sniper_ghillie_forest";
		break;
		case "mp_crash": rModel = "mp_body_op_sniper_ghillie_urban";
		break;
	}
	return rModel;
}

GetSpawnModel( )
{
	level endon("game_ended");
	rModel = "";
	switch( getDvar("mapname") )
	{
		case "mp_underpass": switch( randomInt(11) )
		{
			case 0: rModel = "mp_body_militia_assault_aa_blk";
			break;
			case 1: rModel = "mp_body_militia_assault_aa_wht";
			break;
			case 2: rModel = "mp_body_militia_assault_ab_blk";
			break;
			case 3: rModel = "mp_body_militia_assault_ac_blk";
			break;
			case 4: rModel = "mp_body_militia_lmg_aa_blk";
			break;
			case 5: rModel = "mp_body_militia_lmg_ab_blk";
			break;
			case 6: rModel = "mp_body_militia_lmg_ac_blk";
			break;
			case 7: rModel = "mp_body_militia_smg_aa_blk";
			break;
			case 8: rModel = "mp_body_militia_smg_aa_wht";
			break;
			case 9: rModel = "mp_body_militia_smg_ab_blk";
			break;
			case 10: rModel = "mp_body_militia_smg_ac_blk";
			break;
		}
		break;
		case "mp_quarry": switch( randomInt(11) )
		{
			case 0: rModel = "mp_body_militia_assault_aa_blk";
			break;
			case 1: rModel = "mp_body_militia_assault_aa_wht";
			break;
			case 2: rModel = "mp_body_militia_assault_ab_blk";
			break;
			case 3: rModel = "mp_body_militia_assault_ac_blk";
			break;
			case 4: rModel = "mp_body_militia_lmg_aa_blk";
			break;
			case 5: rModel = "mp_body_militia_lmg_ab_blk";
			break;
			case 6: rModel = "mp_body_militia_lmg_ac_blk";
			break;
			case 7: rModel = "mp_body_militia_smg_aa_blk";
			break;
			case 8: rModel = "mp_body_militia_smg_aa_wht";
			break;
			case 9: rModel = "mp_body_militia_smg_ab_blk";
			break;
			case 10: rModel = "mp_body_militia_smg_ac_blk";
			break;
		}
		break;
		case "mp_afghan": switch( randomInt(4) )
		{
			case 0: rModel = "mp_body_opforce_arab_lmg_a";
			break;
			case 1: rModel = "mp_body_opforce_arab_shotgun_a";
			break;
			case 2: rModel = "mp_body_opforce_arab_smg_a";
			break;
			case 3: rModel = "mp_body_opforce_arab_assault_a";
			break;
		}
		break;
		case "mp_strike": switch( randomInt(4) )
		{
			case 0: rModel = "mp_body_opforce_arab_lmg_a";
			break;
			case 1: rModel = "mp_body_opforce_arab_shotgun_a";
			break;
			case 2: rModel = "mp_body_opforce_arab_smg_a";
			break;
			case 3: rModel = "mp_body_opforce_arab_assault_a";
			break;
		}
		break;
		case "mp_rust": switch( randomInt(8) )
		{
			case 0: rModel = "mp_body_opforce_arab_lmg_a";
			break;
			case 1: rModel = "mp_body_opforce_arab_shotgun_a";
			break;
			case 2: rModel = "mp_body_opforce_arab_smg_a";
			break;
			case 3: rModel = "mp_body_opforce_arab_assault_a";
			break;
			case 4: rModel = "mp_body_desert_tf141_assault_a";
			break;
			case 5: rModel = "mp_body_desert_tf141_lmg";
			break;
			case 6: rModel = "mp_body_desert_tf141_smg";
			break;
			case 7: rModel = "mp_body_desert_tf141_shotgun";
			break;
		}
		break;
		case "mp_boneyard": switch( randomInt(4) )
		{
			case 0: rModel = "mp_body_opforce_arab_lmg_a";
			break;
			case 1: rModel = "mp_body_opforce_arab_shotgun_a";
			break;
			case 2: rModel = "mp_body_opforce_arab_smg_a";
			break;
			case 3: rModel = "mp_body_opforce_arab_assault_a";
			break;
		}
		break;
		case "mp_trailerpark": switch( randomInt(4) )
		{
			case 0: rModel = "mp_body_opforce_arab_lmg_a";
			break;
			case 1: rModel = "mp_body_opforce_arab_shotgun_a";
			break;
			case 2: rModel = "mp_body_opforce_arab_smg_a";
			break;
			case 3: rModel = "mp_body_opforce_arab_assault_a";
			break;
		}
		break;
		case "mp_derail": switch( randomInt(12) )
		{
			case 0: rModel = "mp_body_opforce_arctic_lmg_c";
			break;
			case 1: rModel = "mp_body_opforce_arctic_assault_b";
			break;
			case 2: rModel = "mp_body_opforce_arctic_assault_c";
			break;
			case 3: rModel = "mp_body_opforce_arctic_lmg";
			break;
			case 4: rModel = "mp_body_opforce_arctic_lmg_b";
			break;
			case 5: rModel = "mp_body_opforce_arctic_shotgun";
			break;
			case 6: rModel = "mp_body_opforce_arctic_shotgun_b";
			break;
			case 7: rModel = "mp_body_opforce_arctic_shotgun_c";
			break;
			case 8: rModel = "mp_body_opforce_arctic_smg";
			break;
			case 9: rModel = "mp_body_opforce_arctic_smg_b";
			break;
			case 10: rModel = "mp_body_opforce_arctic_smg_c";
			break;
			case 11: rModel = "mp_body_opforce_arctic_assault_a";
			break;
		}
		break;
		case "mp_compact": switch( randomInt(12) )
		{
			case 0: rModel = "mp_body_opforce_arctic_lmg_c";
			break;
			case 1: rModel = "mp_body_opforce_arctic_assault_b";
			break;
			case 2: rModel = "mp_body_opforce_arctic_assault_c";
			break;
			case 3: rModel = "mp_body_opforce_arctic_lmg";
			break;
			case 4: rModel = "mp_body_opforce_arctic_lmg_b";
			break;
			case 5: rModel = "mp_body_opforce_arctic_shotgun";
			break;
			case 6: rModel = "mp_body_opforce_arctic_shotgun_b";
			break;
			case 7: rModel = "mp_body_opforce_arctic_shotgun_c";
			break;
			case 8: rModel = "mp_body_opforce_arctic_smg";
			break;
			case 9: rModel = "mp_body_opforce_arctic_smg_b";
			break;
			case 10: rModel = "mp_body_opforce_arctic_smg_c";
			break;
			case 11: rModel = "mp_body_opforce_arctic_assault_a";
			break;
		}
		break;
		case "mp_highrise": switch( randomInt(12) )
		{
			case 0: rModel = "mp_body_airborne_assault_a";
			break;
			case 1: rModel = "mp_body_airborne_assault_b";
			break;
			case 2: rModel = "mp_body_airborne_assault_c";
			break;
			case 3: rModel = "mp_body_airborne_lmg";
			break;
			case 4: rModel = "mp_body_airborne_lmg_b";
			break;
			case 5: rModel = "mp_body_airborne_lmg_c";
			break;
			case 6: rModel = "mp_body_airborne_shotgun";
			break;
			case 7: rModel = "mp_body_airborne_shotgun_b";
			break;
			case 8: rModel = "mp_body_airborne_shotgun_c";
			break;
			case 9: rModel = "mp_body_airborne_smg";
			break;
			case 10: rModel = "mp_body_airborne_smg_b";
			break;
			case 11: rModel = "mp_body_airborne_smg_c";
			break;
		}
		break;
		case "mp_terminal": switch( randomInt(12) )
		{
			case 0: rModel = "mp_body_airborne_assault_a";
			break;
			case 1: rModel = "mp_body_airborne_assault_b";
			break;
			case 2: rModel = "mp_body_airborne_assault_c";
			break;
			case 3: rModel = "mp_body_airborne_lmg";
			break;
			case 4: rModel = "mp_body_airborne_lmg_b";
			break;
			case 5: rModel = "mp_body_airborne_lmg_c";
			break;
			case 6: rModel = "mp_body_airborne_shotgun";
			break;
			case 7: rModel = "mp_body_airborne_shotgun_b";
			break;
			case 8: rModel = "mp_body_airborne_shotgun_c";
			break;
			case 9: rModel = "mp_body_airborne_smg";
			break;
			case 10: rModel = "mp_body_airborne_smg_b";
			break;
			case 11: rModel = "mp_body_airborne_smg_c";
			break;
		}
		break;
		case "mp_brecourt": switch( randomInt(12) )
		{
			case 0: rModel = "mp_body_airborne_assault_a";
			break;
			case 1: rModel = "mp_body_airborne_assault_b";
			break;
			case 2: rModel = "mp_body_airborne_assault_c";
			break;
			case 3: rModel = "mp_body_airborne_lmg";
			break;
			case 4: rModel = "mp_body_airborne_lmg_b";
			break;
			case 5: rModel = "mp_body_airborne_lmg_c";
			break;
			case 6: rModel = "mp_body_airborne_shotgun";
			break;
			case 7: rModel = "mp_body_airborne_shotgun_b";
			break;
			case 8: rModel = "mp_body_airborne_shotgun_c";
			break;
			case 9: rModel = "mp_body_airborne_smg";
			break;
			case 10: rModel = "mp_body_airborne_smg_b";
			break;
			case 11: rModel = "mp_body_airborne_smg_c";
			break;
		}
		break;
		case "mp_nightshift": switch( randomInt(12) )
		{
			case 0: rModel = "mp_body_airborne_assault_a";
			break;
			case 1: rModel = "mp_body_airborne_assault_b";
			break;
			case 2: rModel = "mp_body_airborne_assault_c";
			break;
			case 3: rModel = "mp_body_airborne_lmg";
			break;
			case 4: rModel = "mp_body_airborne_lmg_b";
			break;
			case 5: rModel = "mp_body_airborne_lmg_c";
			break;
			case 6: rModel = "mp_body_airborne_shotgun";
			break;
			case 7: rModel = "mp_body_airborne_shotgun_b";
			break;
			case 8: rModel = "mp_body_airborne_shotgun_c";
			break;
			case 9: rModel = "mp_body_airborne_smg";
			break;
			case 10: rModel = "mp_body_airborne_smg_b";
			break;
			case 11: rModel = "mp_body_airborne_smg_c";
			break;
		}
		break;
		case "mp_estate": switch( randomInt(12) )
		{
			case 0: rModel = "mp_body_airborne_assault_a";
			break;
			case 1: rModel = "mp_body_airborne_assault_b";
			break;
			case 2: rModel = "mp_body_airborne_assault_c";
			break;
			case 3: rModel = "mp_body_airborne_lmg";
			break;
			case 4: rModel = "mp_body_airborne_lmg_b";
			break;
			case 5: rModel = "mp_body_airborne_lmg_c";
			break;
			case 6: rModel = "mp_body_airborne_shotgun";
			break;
			case 7: rModel = "mp_body_airborne_shotgun_b";
			break;
			case 8: rModel = "mp_body_airborne_shotgun_c";
			break;
			case 9: rModel = "mp_body_airborne_smg";
			break;
			case 10: rModel = "mp_body_airborne_smg_b";
			break;
			case 11: rModel = "mp_body_airborne_smg_c";
			break;
		}
		break;
		case "mp_favela": switch( randomInt(11) )
		{
			case 0: rModel = "mp_body_militia_assault_aa_blk";
			break;
			case 1: rModel = "mp_body_militia_assault_aa_wht";
			break;
			case 2: rModel = "mp_body_militia_assault_ab_blk";
			break;
			case 3: rModel = "mp_body_militia_assault_ac_blk";
			break;
			case 4: rModel = "mp_body_militia_lmg_aa_blk";
			break;
			case 5: rModel = "mp_body_militia_lmg_ab_blk";
			break;
			case 6: rModel = "mp_body_militia_lmg_ac_blk";
			break;
			case 7: rModel = "mp_body_militia_smg_aa_blk";
			break;
			case 8: rModel = "mp_body_militia_smg_aa_wht";
			break;
			case 9: rModel = "mp_body_militia_smg_ab_blk";
			break;
			case 10: rModel = "mp_body_militia_smg_ac_blk";
			break;
		}
		break;
		case "mp_abandon": switch( randomInt(11) )
		{
			case 0: rModel = "mp_body_militia_assault_aa_blk";
			break;
			case 1: rModel = "mp_body_militia_assault_aa_wht";
			break;
			case 2: rModel = "mp_body_militia_assault_ab_blk";
			break;
			case 3: rModel = "mp_body_militia_assault_ac_blk";
			break;
			case 4: rModel = "mp_body_militia_lmg_aa_blk";
			break;
			case 5: rModel = "mp_body_militia_lmg_ab_blk";
			break;
			case 6: rModel = "mp_body_militia_lmg_ac_blk";
			break;
			case 7: rModel = "mp_body_militia_smg_aa_blk";
			break;
			case 8: rModel = "mp_body_militia_smg_aa_wht";
			break;
			case 9: rModel = "mp_body_militia_smg_ab_blk";
			break;
			case 10: rModel = "mp_body_militia_smg_ac_blk";
			break;
		}
		break;
		case "mp_invasion": switch( randomInt(4) )
		{
			case 0: rModel = "mp_body_opforce_arab_lmg_a";
			break;
			case 1: rModel = "mp_body_opforce_arab_shotgun_a";
			break;
			case 2: rModel = "mp_body_opforce_arab_smg_a";
			break;
			case 3: rModel = "mp_body_opforce_arab_assault_a";
			break;
		}
		break;
		case "mp_checkpoint": switch( randomInt(4) )
		{
			case 0: rModel = "mp_body_opforce_arab_lmg_a";
			break;
			case 1: rModel = "mp_body_opforce_arab_shotgun_a";
			break;
			case 2: rModel = "mp_body_opforce_arab_smg_a";
			break;
			case 4: rModel = "mp_body_opforce_arab_assault_a";
			break;
		}
		break;
		case "mp_subbase": switch( randomInt(12) )
		{
			case 0: rModel = "mp_body_opforce_arctic_lmg_c";
			break;
			case 1: rModel = "mp_body_opforce_arctic_assault_b";
			break;
			case 2: rModel = "mp_body_opforce_arctic_assault_c";
			break;
			case 3: rModel = "mp_body_opforce_arctic_lmg";
			break;
			case 4: rModel = "mp_body_opforce_arctic_lmg_b";
			break;
			case 5: rModel = "mp_body_opforce_arctic_shotgun";
			break;
			case 6: rModel = "mp_body_opforce_arctic_shotgun_b";
			break;
			case 7: rModel = "mp_body_opforce_arctic_shotgun_c";
			break;
			case 8: rModel = "mp_body_opforce_arctic_smg";
			break;
			case 9: rModel = "mp_body_opforce_arctic_smg_b";
			break;
			case 10: rModel = "mp_body_opforce_arctic_smg_c";
			break;
			case 11: rModel = "mp_body_opforce_arctic_assault_a";
			break;
		}
		break;
		case "mp_rundown": switch( randomInt(11) )
		{
			case 0: rModel = "mp_body_militia_assault_aa_blk";
			break;
			case 1: rModel = "mp_body_militia_assault_aa_wht";
			break;
			case 2: rModel = "mp_body_militia_assault_ab_blk";
			break;
			case 3: rModel = "mp_body_militia_assault_ac_blk";
			break;
			case 4: rModel = "mp_body_militia_lmg_aa_blk";
			break;
			case 5: rModel = "mp_body_militia_lmg_ab_blk";
			break;
			case 6: rModel = "mp_body_militia_lmg_ac_blk";
			break;
			case 7: rModel = "mp_body_militia_smg_aa_blk";
			break;
			case 8: rModel = "mp_body_militia_smg_aa_wht";
			break;
			case 9: rModel = "mp_body_militia_smg_ab_blk";
			break;
			case 10: rModel = "mp_body_militia_smg_ac_blk";
			break;
		}
		break;
		case "mp_complex": switch( randomInt(12) )
		{
			case 0: rModel = "mp_body_airborne_assault_a";
			break;
			case 1: rModel = "mp_body_airborne_assault_b";
			break;
			case 2: rModel = "mp_body_airborne_assault_c";
			break;
			case 3: rModel = "mp_body_airborne_lmg";
			break;
			case 4: rModel = "mp_body_airborne_lmg_b";
			break;
			case 5: rModel = "mp_body_airborne_lmg_c";
			break;
			case 6: rModel = "mp_body_airborne_shotgun";
			break;
			case 7: rModel = "mp_body_airborne_shotgun_b";
			break;
			case 8: rModel = "mp_body_airborne_shotgun_c";
			break;
			case 9: rModel = "mp_body_airborne_smg";
			break;
			case 10: rModel = "mp_body_airborne_smg_b";
			break;
			case 11: rModel = "mp_body_airborne_smg_c";
			break;
		}
		break;
		case "mp_vacant": switch( randomInt(12) )
		{
			case 0: rModel = "mp_body_airborne_assault_a";
			break;
			case 1: rModel = "mp_body_airborne_assault_b";
			break;
			case 2: rModel = "mp_body_airborne_assault_c";
			break;
			case 3: rModel = "mp_body_airborne_lmg";
			break;
			case 4: rModel = "mp_body_airborne_lmg_b";
			break;
			case 5: rModel = "mp_body_airborne_lmg_c";
			break;
			case 6: rModel = "mp_body_airborne_shotgun";
			break;
			case 7: rModel = "mp_body_airborne_shotgun_b";
			break;
			case 8: rModel = "mp_body_airborne_shotgun_c";
			break;
			case 9: rModel = "mp_body_airborne_smg";
			break;
			case 10: rModel = "mp_body_airborne_smg_b";
			break;
			case 11: rModel = "mp_body_airborne_smg_c";
			break;
		}
		break;
		case "mp_storm": switch( randomInt(12) )
		{
			case 0: rModel = "mp_body_airborne_assault_a";
			break;
			case 1: rModel = "mp_body_airborne_assault_b";
			break;
			case 2: rModel = "mp_body_airborne_assault_c";
			break;
			case 3: rModel = "mp_body_airborne_lmg";
			break;
			case 4: rModel = "mp_body_airborne_lmg_b";
			break;
			case 5: rModel = "mp_body_airborne_lmg_c";
			break;
			case 6: rModel = "mp_body_airborne_shotgun";
			break;
			case 7: rModel = "mp_body_airborne_shotgun_b";
			break;
			case 8: rModel = "mp_body_airborne_shotgun_c";
			break;
			case 9: rModel = "mp_body_airborne_smg";
			break;
			case 10: rModel = "mp_body_airborne_smg_b";
			break;
			case 11: rModel = "mp_body_airborne_smg_c";
			break;
		}
		break;
		case "mp_fuel2": switch( randomInt(4) )
		{
			case 0: rModel = "mp_body_opforce_arab_lmg_a";
			break;
			case 1: rModel = "mp_body_opforce_arab_shotgun_a";
			break;
			case 2: rModel = "mp_body_opforce_arab_smg_a";
			break;
			case 3: rModel = "mp_body_opforce_arab_assault_a";
			break;
		}
		break;
		case "mp_overgrown": switch( randomInt(12) )
		{
			case 0: rModel = "mp_body_airborne_assault_a";
			break;
			case 1: rModel = "mp_body_airborne_assault_b";
			break;
			case 2: rModel = "mp_body_airborne_assault_c";
			break;
			case 3: rModel = "mp_body_airborne_lmg";
			break;
			case 4: rModel = "mp_body_airborne_lmg_b";
			break;
			case 5: rModel = "mp_body_airborne_lmg_c";
			break;
			case 6: rModel = "mp_body_airborne_shotgun";
			break;
			case 7: rModel = "mp_body_airborne_shotgun_b";
			break;
			case 8: rModel = "mp_body_airborne_shotgun_c";
			break;
			case 9: rModel = "mp_body_airborne_smg";
			break;
			case 10: rModel = "mp_body_airborne_smg_b";
			break;
			case 11: rModel = "mp_body_airborne_smg_c";
			break;
		}
		break;
		case "mp_crash": switch( randomInt(4) )
		{
			case 0: rModel = "mp_body_opforce_arab_lmg_a";
			break;
			case 1: rModel = "mp_body_opforce_arab_shotgun_a";
			break;
			case 2: rModel = "mp_body_opforce_arab_smg_a";
			break;
			case 3: rModel = "mp_body_opforce_arab_assault_a";
			break;
		}
		break;
	}
	return rModel;
}

FriendlyModels()
{
	fModel = "";
	switch( getDvar("mapname") )
	{
		case "mp_afghan":
		switch(randomInt(5))
		{
			case 0:
			fModel = "mp_body_desert_tf141_assault_a";
			break;
			case 1:
			fModel = "mp_body_desert_tf141_lmg";
			break;
			case 2:
			fModel = "mp_body_desert_tf141_smg";
			break;
			case 3:
			fModel = "mp_body_desert_tf141_shotgun";
			break;
			case 4:
			fModel = "mp_body_desert_tf141_assault_b";
			break;
		}
		break;
		case "mp_boneyard":
		switch(randomInt(5))
		{
			case 0:
			fModel = "mp_body_desert_tf141_assault_b";
			break;
			case 1:
			fModel = "mp_body_desert_tf141_lmg";
			break;
			case 2:
			fModel = "mp_body_desert_tf141_smg";
			break;
			case 3:
			fModel = "mp_body_desert_tf141_shotgun";
			break;
			case 4:
			fModel = "mp_body_desert_tf141_assault_a";
			break;
		}
		break;
		case "mp_derail":
		switch(randomInt(5))
		{
			case 0:
			fModel = "mp_body_tf141_assault_a";
			break;
			case 1:
			fModel = "mp_body_tf141_assault_b";
			break;
			case 2:
			fModel = "mp_body_tf141_lmg";
			break;
			case 3:
			fModel = "mp_body_tf141_smg";
			break;
			case 4:
			fModel = "mp_body_tf141_shotgun";
			break;
		}
		break;
		case "mp_estate":
		switch(randomInt(5))
		{
			case 0:
			fModel = "mp_body_forest_tf141_assault_a";
			break;
			case 1:
			fModel = "mp_body_forest_tf141_assault_b";
			break;
			case 2:
			fModel = "mp_body_forest_tf141_lmg";
			break;
			case 3:
			fModel = "mp_body_forest_tf141_smg";
			break;
			case 4:
			fModel = "mp_body_forest_tf141_shotgun";
			break;
		}
		break;
		case "mp_favela":
		switch(randomInt(5))
		{
			case 0:
			fModel = "mp_body_desert_tf141_assault_b";
			break;
			case 1:
			fModel = "mp_body_desert_tf141_lmg";
			break;
			case 2:
			fModel = "mp_body_desert_tf141_smg";
			break;
			case 3:
			fModel = "mp_body_desert_tf141_shotgun";
			break;
			case 4:
			fModel = "mp_body_desert_tf141_assault_a";
			break;
		}
		break;
		case "mp_highrise":
		switch(randomInt(13))
		{
			case 0:
			fModel = "mp_body_us_army_lmg";
			break;
			case 1:
			fModel = "mp_body_us_army_lmg_b";
			break;
			case 2:
			fModel = "mp_body_us_army_lmg_c";
			break;
			case 3:
			fModel = "mp_body_us_army_assault_a";
			break;
			case 4:
			fModel = "mp_body_us_army_assault_b";
			break;
			case 5:
			fModel = "mp_body_us_army_assault_c";
			break;
			case 6:
			fModel = "mp_body_us_army_shotgun";
			break;
			case 7:
			fModel = "mp_body_us_army_shotgun_b";
			break;
			case 8:
			fModel = "mp_body_us_army_shotgun_c";
			break;
			case 9:
			fModel = "mp_body_us_army_smg";
			break;
			case 10:
			fModel = "mp_body_us_army_smg_b";
			break;
			case 11:
			fModel = "mp_body_us_army_smg_c";
			break;
		}
		break;
		case "mp_invasion":
		switch(randomInt(13))
		{
			case 0:
			fModel = "mp_body_us_army_lmg";
			break;
			case 1:
			fModel = "mp_body_us_army_lmg_b";
			break;
			case 2:
			fModel = "mp_body_us_army_lmg_c";
			break;
			case 3:
			fModel = "mp_body_us_army_assault_a";
			break;
			case 4:
			fModel = "mp_body_us_army_assault_b";
			break;
			case 5:
			fModel = "mp_body_us_army_assault_c";
			break;
			case 6:
			fModel = "mp_body_us_army_shotgun";
			break;
			case 7:
			fModel = "mp_body_us_army_shotgun_b";
			break;
			case 8:
			fModel = "mp_body_us_army_shotgun_c";
			break;
			case 9:
			fModel = "mp_body_us_army_smg";
			break;
			case 10:
			fModel = "mp_body_us_army_smg_b";
			break;
			case 11:
			fModel = "mp_body_us_army_smg_c";
			break;
		}
		break;
		case "mp_checkpoint":
		switch(randomInt(4))
		{
			case 0:
			fModel = "mp_body_seal_udt_lmg";
			break;
			case 1:
			fModel = "mp_body_seal_udt_assault_a";
			break;
			case 2:
			fModel = "mp_body_seal_udt_assault_b";
			break;
			case 3:
			fModel = "mp_body_seal_udt_smg";
			break;
		}
		break;
		case "mp_quarry":
		switch(randomInt(5))
		{
			case 0:
			fModel = "mp_body_desert_tf141_assault_a";
			break;
			case 1:
			fModel = "mp_body_desert_tf141_lmg";
			break;
			case 2:
			fModel = "mp_body_desert_tf141_smg";
			break;
			case 3:
			fModel = "mp_body_desert_tf141_shotgun";
			break;
			case 4:
			fModel = "mp_body_desert_tf141_assault_b";
			break;
		}
		break;
		case "mp_rundown":
		switch(randomInt(5))
		{
			case 0:
			fModel = "mp_body_desert_tf141_assault_a";
			break;
			case 1:
			fModel = "mp_body_desert_tf141_lmg";
			break;
			case 2:
			fModel = "mp_body_desert_tf141_smg";
			break;
			case 3:
			fModel = "mp_body_desert_tf141_shotgun";
			break;
			case 4:
			fModel = "mp_body_riot_tf141_desert";
			break;
		}
		break;
		case "mp_rust":
		switch(randomInt(5))
		{
			case 0:
			fModel = "mp_body_desert_tf141_assault_a";
			break;
			case 1:
			fModel = "mp_body_desert_tf141_lmg";
			break;
			case 2:
			fModel = "mp_body_desert_tf141_smg";
			break;
			case 3:
			fModel = "mp_body_desert_tf141_shotgun";
			break;
			case 4:
			fModel = "mp_body_riot_tf141_desert";
			break;
		}
		break;
		case "mp_nightshift": //Skidrow
		switch(randomInt(13))
		{
			case 0:
			fModel = "mp_body_us_army_lmg";
			break;
			case 1:
			fModel = "mp_body_us_army_lmg_b";
			break;
			case 2:
			fModel = "mp_body_us_army_lmg_c";
			break;
			case 3:
			fModel = "mp_body_us_army_assault_a";
			break;
			case 4:
			fModel = "mp_body_us_army_assault_b";
			break;
			case 5:
			fModel = "mp_body_us_army_assault_c";
			break;
			case 6:
			fModel = "mp_body_us_army_shotgun";
			break;
			case 7:
			fModel = "mp_body_us_army_shotgun_b";
			break;
			case 8:
			fModel = "mp_body_us_army_shotgun_c";
			break;
			case 9:
			fModel = "mp_body_us_army_smg";
			break;
			case 10:
			fModel = "mp_body_us_army_smg_b";
			break;
			case 11:
			fModel = "mp_body_us_army_smg_c";
			break;
		}
		break;
		case "mp_subbase":
		switch(randomInt(4))
		{
			case 0:
			fModel = "mp_body_seal_udt_lmg";
			break;
			case 1:
			fModel = "mp_body_seal_udt_assault_a";
			break;
			case 2:
			fModel = "mp_body_seal_udt_assault_b";
			break;
			case 3:
			fModel = "mp_body_seal_udt_smg";
			break;
		}
		break;
		case "mp_terminal":
		switch(randomInt(13))
		{
			case 0:
			fModel = "mp_body_us_army_lmg";
			break;
			case 1:
			fModel = "mp_body_us_army_lmg_b";
			break;
			case 2:
			fModel = "mp_body_us_army_lmg_c";
			break;
			case 3:
			fModel = "mp_body_us_army_assault_a";
			break;
			case 4:
			fModel = "mp_body_us_army_assault_b";
			break;
			case 5:
			fModel = "mp_body_us_army_assault_c";
			break;
			case 6:
			fModel = "mp_body_us_army_shotgun";
			break;
			case 7:
			fModel = "mp_body_us_army_shotgun_b";
			break;
			case 8:
			fModel = "mp_body_us_army_shotgun_c";
			break;
			case 9:
			fModel = "mp_body_us_army_smg";
			break;
			case 10:
			fModel = "mp_body_us_army_smg_b";
			break;
			case 11:
			fModel = "mp_body_us_army_smg_c";
			break;
		}
		break;
		case "mp_underpass":
		switch(randomInt(5))
		{
			case 0:
			fModel = "mp_body_forest_tf141_assault_a";
			break;
			case 1:
			fModel = "mp_body_forest_tf141_assault_b";
			break;
			case 2:
			fModel = "mp_body_forest_tf141_lmg";
			break;
			case 3:
			fModel = "mp_body_forest_tf141_smg";
			break;
			case 4:
			fModel = "mp_body_forest_tf141_shotgun";
			break;
		}
		break;
		case "mp_brecourt":
		switch(randomInt(5))
		{
			case 0:
			fModel = "mp_body_forest_tf141_assault_a";
			break;
			case 1:
			fModel = "mp_body_forest_tf141_assault_b";
			break;
			case 2:
			fModel = "mp_body_forest_tf141_lmg";
			break;
			case 3:
			fModel = "mp_body_forest_tf141_smg";
			break;
			case 4:
			fModel = "mp_body_forest_tf141_shotgun";
			break;
		}
		break;
		case "mp_trailerpark":
		switch(randomInt(13))
		{
			case 0:
			fModel = "mp_body_us_army_lmg";
			break;
			case 1:
			fModel = "mp_body_us_army_lmg_b";
			break;
			case 2:
			fModel = "mp_body_us_army_lmg_c";
			break;
			case 3:
			fModel = "mp_body_us_army_assault_a";
			break;
			case 4:
			fModel = "mp_body_us_army_assault_b";
			break;
			case 5:
			fModel = "mp_body_us_army_assault_c";
			break;
			case 6:
			fModel = "mp_body_us_army_shotgun";
			break;
			case 7:
			fModel = "mp_body_us_army_shotgun_b";
			break;
			case 8:
			fModel = "mp_body_us_army_shotgun_c";
			break;
			case 9:
			fModel = "mp_body_us_army_smg";
			break;
			case 10:
			fModel = "mp_body_us_army_smg_b";
			break;
			case 11:
			fModel = "mp_body_us_army_smg_c";
			break;
		}
		break;
		case "mp_compact":
		switch(randomInt(5))
		{
			case 0:
			fModel = "mp_body_tf141_assault_a";
			break;
			case 1:
			fModel = "mp_body_tf141_assault_b";
			break;
			case 2:
			fModel = "mp_body_tf141_lmg";
			break;
			case 3:
			fModel = "mp_body_tf141_smg";
			break;
			case 4:
			fModel = "mp_body_tf141_shotgun";
			break;
		}
		break;
		case "mp_complex":
		switch(randomInt(13))
		{
			case 0:
			fModel = "mp_body_us_army_lmg";
			break;
			case 1:
			fModel = "mp_body_us_army_lmg_b";
			break;
			case 2:
			fModel = "mp_body_us_army_lmg_c";
			break;
			case 3:
			fModel = "mp_body_us_army_assault_a";
			break;
			case 4:
			fModel = "mp_body_us_army_assault_b";
			break;
			case 5:
			fModel = "mp_body_us_army_assault_c";
			break;
			case 6:
			fModel = "mp_body_us_army_shotgun";
			break;
			case 7:
			fModel = "mp_body_us_army_shotgun_b";
			break;
			case 8:
			fModel = "mp_body_us_army_shotgun_c";
			break;
			case 9:
			fModel = "mp_body_us_army_smg";
			break;
			case 10:
			fModel = "mp_body_us_army_smg_b";
			break;
			case 11:
			fModel = "mp_body_us_army_smg_c";
			break;
		}
		break;
		case "mp_strike":
		switch(randomInt(13))
		{
			case 0:
			fModel = "mp_body_us_army_lmg";
			break;
			case 1:
			fModel = "mp_body_us_army_lmg_b";
			break;
			case 2:
			fModel = "mp_body_us_army_lmg_c";
			break;
			case 3:
			fModel = "mp_body_us_army_assault_a";
			break;
			case 4:
			fModel = "mp_body_us_army_assault_b";
			break;
			case 5:
			fModel = "mp_body_us_army_assault_c";
			break;
			case 6:
			fModel = "mp_body_us_army_shotgun";
			break;
			case 7:
			fModel = "mp_body_us_army_shotgun_b";
			break;
			case 8:
			fModel = "mp_body_us_army_shotgun_c";
			break;
			case 9:
			fModel = "mp_body_us_army_smg";
			break;
			case 10:
			fModel = "mp_body_us_army_smg_b";
			break;
			case 11:
			fModel = "mp_body_us_army_smg_c";
			break;
		}
		break;
		case "mp_abandon":
		switch(randomInt(13))
		{
			case 0:
			fModel = "mp_body_us_army_lmg";
			break;
			case 1:
			fModel = "mp_body_us_army_lmg_b";
			break;
			case 2:
			fModel = "mp_body_us_army_lmg_c";
			break;
			case 3:
			fModel = "mp_body_us_army_assault_a";
			break;
			case 4:
			fModel = "mp_body_us_army_assault_b";
			break;
			case 5:
			fModel = "mp_body_us_army_assault_c";
			break;
			case 6:
			fModel = "mp_body_us_army_shotgun";
			break;
			case 7:
			fModel = "mp_body_us_army_shotgun_b";
			break;
			case 8:
			fModel = "mp_body_us_army_shotgun_c";
			break;
			case 9:
			fModel = "mp_body_us_army_smg";
			break;
			case 10:
			fModel = "mp_body_us_army_smg_b";
			break;
			case 11:
			fModel = "mp_body_us_army_smg_c";
			break;
		}
		break;
		case "mp_vacant":
		switch(randomInt(13))
		{
			case 0:
			fModel = "mp_body_us_army_lmg";
			break;
			case 1:
			fModel = "mp_body_us_army_lmg_b";
			break;
			case 2:
			fModel = "mp_body_us_army_lmg_c";
			break;
			case 3:
			fModel = "mp_body_us_army_assault_a";
			break;
			case 4:
			fModel = "mp_body_us_army_assault_b";
			break;
			case 5:
			fModel = "mp_body_us_army_assault_c";
			break;
			case 6:
			fModel = "mp_body_us_army_shotgun";
			break;
			case 7:
			fModel = "mp_body_us_army_shotgun_b";
			break;
			case 8:
			fModel = "mp_body_us_army_shotgun_c";
			break;
			case 9:
			fModel = "mp_body_us_army_smg";
			break;
			case 10:
			fModel = "mp_body_us_army_smg_b";
			break;
			case 11:
			fModel = "mp_body_us_army_smg_c";
			break;
		}
		break;
		case "mp_storm":
		switch(randomInt(5))
		{
			case 0:
			fModel = "mp_body_desert_tf141_assault_a";
			break;
			case 1:
			fModel = "mp_body_desert_tf141_lmg";
			break;
			case 2:
			fModel = "mp_body_desert_tf141_smg";
			break;
			case 3:
			fModel = "mp_body_desert_tf141_shotgun";
			break;
			case 4:
			fModel = "mp_body_riot_tf141_desert";
			break;
		}
		break;
		case "mp_fuel2":
		switch(randomInt(13))
		{
			case 0:
			fModel = "mp_body_us_army_lmg";
			break;
			case 1:
			fModel = "mp_body_us_army_lmg_b";
			break;
			case 2:
			fModel = "mp_body_us_army_lmg_c";
			break;
			case 3:
			fModel = "mp_body_us_army_assault_a";
			break;
			case 4:
			fModel = "mp_body_us_army_assault_b";
			break;
			case 5:
			fModel = "mp_body_us_army_assault_c";
			break;
			case 6:
			fModel = "mp_body_us_army_shotgun";
			break;
			case 7:
			fModel = "mp_body_us_army_shotgun_b";
			break;
			case 8:
			fModel = "mp_body_us_army_shotgun_c";
			break;
			case 9:
			fModel = "mp_body_us_army_smg";
			break;
			case 10:
			fModel = "mp_body_us_army_smg_b";
			break;
			case 11:
			fModel = "mp_body_us_army_smg_c";
			break;
		}
		break;
		case "mp_overgrown":
		switch(randomInt(5))
		{
			case 0:
			fModel = "mp_body_forest_tf141_assault_a";
			break;
			case 1:
			fModel = "mp_body_forest_tf141_assault_b";
			break;
			case 2:
			fModel = "mp_body_forest_tf141_lmg";
			break;
			case 3:
			fModel = "mp_body_forest_tf141_smg";
			break;
			case 4:
			fModel = "mp_body_forest_tf141_shotgun";
			break;
		}
		break;
		case "mp_crash":
		switch(randomInt(5))
		{
			case 0:
			fModel = "mp_body_desert_tf141_assault_b";
			break;
			case 1:
			fModel = "mp_body_desert_tf141_lmg";
			break;
			case 2:
			fModel = "mp_body_desert_tf141_smg";
			break;
			case 3:
			fModel = "mp_body_desert_tf141_shotgun";
			break;
			case 4:
			fModel = "mp_body_desert_tf141_assault_a";
			break;
		}
		break;
	}
	return fModel;
}

GetHeadSpawnModel( )
{
	level endon("game_ended");
	rModel = "";
	switch( getDvar("mapname") )
	{
		case "mp_afghan": switch( randomInt(4) )
		{
			case 0: rModel = "head_tf141_desert_a";
			break;
			case 1: rModel = "head_tf141_desert_b";
			break;
			case 2: rModel = "head_tf141_desert_c";
			break;
			case 3: rModel = "head_tf141_desert_d";
			break;
		}
		break;
		case "mp_derail": switch( randomInt(4) )
		{
			case 0: rModel = "head_tf141_arctic_a";
			break;
			case 1: rModel = "head_tf141_arctic_b";
			break;
			case 2: rModel = "head_tf141_arctic_c";
			break;
			case 3: rModel = "head_tf141_arctic_d";
			break;
		}
		break;
		case "mp_estate": switch( randomInt(4) )
		{
			case 0: rModel = "head_tf141_forest_a";
			break;
			case 1: rModel = "head_tf141_forest_b";
			break;
			case 2: rModel = "head_tf141_forest_c";
			break;
			case 3: rModel = "head_tf141_forest_d";
			break;
		}
		break;
		case "mp_favela": switch( randomInt(4) )
		{
			case 0: rModel = "head_tf141_desert_a";
			break;
			case 1: rModel = "head_tf141_desert_b";
			break;
			case 2: rModel = "head_tf141_desert_c";
			break;
			case 3: rModel = "head_tf141_desert_d";
			break;
		}
		break;
		case "mp_highrise": switch( randomInt(4) )
		{
			case 0: rModel = "head_us_army_a";
			break;
			case 1: rModel = "head_us_army_b";
			break;
			case 2: rModel = "head_us_army_c";
			break;
			case 3: rModel = "head_us_army_d";
			break;
			case 4: rModel = "head_us_army_f";
			break;
		}
		break;
		case "mp_invasion": switch( randomInt(4) )
		{
			case 0: rModel = "head_us_army_a";
			break;
			case 1: rModel = "head_us_army_b";
			break;
			case 2: rModel = "head_us_army_c";
			break;
			case 3: rModel = "head_us_army_d";
			break;
			case 4: rModel = "head_us_army_f";
			break;
		}
		break;
		case "mp_checkpoint": switch( randomInt(4) )
		{
			case 0: rModel = "head_seal_udt_a";
			break;
			case 1: rModel = "head_seal_udt_c";
			break;
			case 2: rModel = "head_seal_udt_d";
			break;
			case 3: rModel = "head_seal_udt_e";
			break;
		}
		break;
		case "mp_quarry": switch( randomInt(4) )
		{
			case 0: rModel = "head_tf141_desert_a";
			break;
			case 1: rModel = "head_tf141_desert_b";
			break;
			case 2: rModel = "head_tf141_desert_c";
			break;
			case 3: rModel = "head_tf141_desert_d";
			break;
		}
		break;
		case "mp_rundown": switch( randomInt(4) )
		{
			case 0: rModel = "head_tf141_desert_a";
			break;
			case 1: rModel = "head_tf141_desert_b";
			break;
			case 2: rModel = "head_tf141_desert_c";
			break;
			case 3: rModel = "head_tf141_desert_d";
			break;
		}
		break;
		case "mp_rust": switch( randomInt(4) )
		{
			case 0: rModel = "head_tf141_desert_a";
			break;
			case 1: rModel = "head_tf141_desert_b";
			break;
			case 2: rModel = "head_tf141_desert_c";
			break;
			case 3: rModel = "head_tf141_desert_d";
			break;
		}
		break;
		case "mp_boneyard": switch( randomInt(4) )
		{
			case 0: rModel = "head_tf141_desert_a";
			break;
			case 1: rModel = "head_tf141_desert_b";
			break;
			case 2: rModel = "head_tf141_desert_c";
			break;
			case 3: rModel = "head_tf141_desert_d";
			break;
		}
		break;
		case "mp_nightshift": switch( randomInt(4) )
		{
			case 0: rModel = "head_us_army_a";
			break;
			case 1: rModel = "head_us_army_b";
			break;
			case 2: rModel = "head_us_army_c";
			break;
			case 3: rModel = "head_us_army_d";
			break;
			case 4: rModel = "head_us_army_f";
			break;
		}
		break;
		case "mp_subbase": switch( randomInt(4) )
		{
			case 0: rModel = "head_seal_udt_a";
			break;
			case 1: rModel = "head_seal_udt_c";
			break;
			case 2: rModel = "head_seal_udt_d";
			break;
			case 3: rModel = "head_seal_udt_e";
			break;
		}
		break;
		case "mp_terminal": switch( randomInt(5) )
		{
			case 0: rModel = "head_us_army_a";
			break;
			case 1: rModel = "head_us_army_b";
			break;
			case 2: rModel = "head_us_army_c";
			break;
			case 3: rModel = "head_us_army_d";
			break;
			case 4: rModel = "head_us_army_f";
			break;
		}
		break;
		case "mp_strike": switch( randomInt(5) )
		{
			case 0: rModel = "head_us_army_a";
			break;
			case 1: rModel = "head_us_army_b";
			break;
			case 2: rModel = "head_us_army_c";
			break;
			case 3: rModel = "head_us_army_d";
			break;
			case 4: rModel = "head_us_army_f";
			break;
		}
		break;
		case "mp_brecourt": switch( randomInt(4) )
		{
			case 0: rModel = "head_tf141_forest_a";
			break;
			case 1: rModel = "head_tf141_forest_b";
			break;
			case 2: rModel = "head_tf141_forest_c";
			break;
			case 3: rModel = "head_tf141_forest_d";
			break;
		}
		break;
		case "mp_trailerpark": switch( randomInt(5) )
		{
			case 0: rModel = "head_us_army_a";
			break;
			case 1: rModel = "head_us_army_b";
			break;
			case 2: rModel = "head_us_army_c";
			break;
			case 3: rModel = "head_us_army_d";
			break;
			case 4: rModel = "head_us_army_f";
			break;
		}
		break;
		case "mp_complex": switch( randomInt(5) )
		{
			case 0: rModel = "head_us_army_a";
			break;
			case 1: rModel = "head_us_army_b";
			break;
			case 2: rModel = "head_us_army_c";
			break;
			case 3: rModel = "head_us_army_d";
			break;
			case 4: rModel = "head_us_army_f";
			break;
		}
		break;
		case "mp_abandon": switch( randomInt(5) )
		{
			case 0: rModel = "head_us_army_a";
			break;
			case 1: rModel = "head_us_army_b";
			break;
			case 2: rModel = "head_us_army_c";
			break;
			case 3: rModel = "head_us_army_d";
			break;
			case 4: rModel = "head_us_army_f";
			break;
		}
		break;
		case "mp_vacant": switch( randomInt(5) )
		{
			case 0: rModel = "head_us_army_a";
			break;
			case 1: rModel = "head_us_army_b";
			break;
			case 2: rModel = "head_us_army_c";
			break;
			case 3: rModel = "head_us_army_d";
			break;
			case 4: rModel = "head_us_army_f";
			break;
		}
		break;
		case "mp_compact": switch( randomInt(4) )
		{
			case 0: rModel = "head_tf141_arctic_a";
			break;
			case 1: rModel = "head_tf141_arctic_b";
			break;
			case 2: rModel = "head_tf141_arctic_c";
			break;
			case 3: rModel = "head_tf141_arctic_d";
			break;
		}
		break;
		case "mp_storm": switch( randomInt(4) )
		{
			case 0: rModel = "head_tf141_desert_a";
			break;
			case 1: rModel = "head_tf141_desert_b";
			break;
			case 2: rModel = "head_tf141_desert_c";
			break;
			case 3: rModel = "head_tf141_desert_d";
			break;
		}
		break;
		case "mp_underpass": switch( randomInt(4) )
		{
			case 0: rModel = "head_tf141_desert_a";
			break;
			case 1: rModel = "head_tf141_desert_b";
			break;
			case 2: rModel = "head_tf141_desert_c";
			break;
			case 3: rModel = "head_tf141_desert_d";
			break;
		}
		break;
		case "mp_fuel2": switch( randomInt(5) )
		{
			case 0: rModel = "head_us_army_a";
			break;
			case 1: rModel = "head_us_army_b";
			break;
			case 2: rModel = "head_us_army_c";
			break;
			case 3: rModel = "head_us_army_d";
			break;
			case 4: rModel = "head_us_army_f";
			break;
		}
		break;
		case "mp_overgrown": switch( randomInt(4) )
		{
			case 0: rModel = "head_tf141_forest_a";
			break;
			case 1: rModel = "head_tf141_forest_b";
			break;
			case 2: rModel = "head_tf141_forest_c";
			break;
			case 3: rModel = "head_tf141_forest_d";
			break;
		}
		break;
		case "mp_crash": switch( randomInt(4) )
		{
			case 0: rModel = "head_tf141_desert_a";
			break;
			case 1: rModel = "head_tf141_desert_b";
			break;
			case 2: rModel = "head_tf141_desert_c";
			break;
			case 3: rModel = "head_tf141_desert_d";
			break;
		}
		break;
	}
	return rModel;
}

SpawnWeapon(weapName, coords, angles)
{
	point = spawn("script_origin", coords);
	weap = SpawnWeap(weapName, point.origin);
	if(isDefined(angles))
	{
		weap.angles = angles;
	}
	weap linkto( point );
	return point;
}

SpawnWeap(weapName, coords)
{
	return spawn( "weapon_" + weapName, coords + (0,0,5) );
}