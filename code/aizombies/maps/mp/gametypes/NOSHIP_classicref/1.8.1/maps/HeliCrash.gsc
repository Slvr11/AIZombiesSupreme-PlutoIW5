#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

KillerHeli()
{
	wait 1;
	player = level.players[RandomInt(level.players.size)];
	level.heli = spawnHelicopter(player, SpawnHeli(), (0,0,0), "pavelow_mp", "vehicle_apache_mp");
	level.players[RandomInt(level.players.size)] sayAll("^1Oh Shit What is That");
	level.players[RandomInt(level.players.size)] playSound(maps\mp\gametypes\_teams::getTeamVoicePrefix( "allies" ) + "mp_stm_enemyspotted");
	level.heli Vehicle_SetSpeed(40,50);
    level.heli setvehgoalpos(MoveHeli(),1);
	level.heli waittillmatch("goal");
	level.heli playLoopSound("cobra_helicopter_dying_loop");
	level.heli thread PlayHeliFall();
	level.heli thread HeliSpin();
	level.heli playSound("cobra_helicopter_hit");
	level.players[RandomInt(level.players.size)] sayAll("^1Shit Get Down");
	playFxOnTag( loadFx("explosions/helicopter_explosion_secondary_small"), level.heli, "tag_engine_left" );
	level.heli Vehicle_SetSpeed(40,50);
    level.heli setvehgoalpos(MoveGround(),1);
	level.heli waittillmatch("goal");
	level.heli thread KillAllPlayersAndHelicoperExplode();
}

MoveIcon(icon)
{
	while(isDefined(self.headIcon))
	{
		icon.x = self.origin[0];
		icon.y = self.origin[1];
		icon.z = self.origin[2] + 100;
		wait 0.001;
	}
}

HeliSpin()
{
	self setyawspeed( 180, 180, 180 );
	while(isDefined(self))
	{
		self settargetyaw( self.angles[1]+(180*0.9) );
		wait 1;
	}
}

KillAllPlayersAndHelicoperExplode()
{
	self.headIcon destroy();
	self playSound("cobra_helicopter_crash");
	playFx( loadfx( "explosions/helicopter_explosion_mi28_flying" ), self getTagOrigin( "tag_deathfx" ), anglesToForward( self getTagAngles( "tag_deathfx" ) ), anglesToUp( self getTagAngles( "tag_deathfx" ) ) );
	self delete();
	foreach(player in level.players)
	{
		earthquake(1.3,1.1, player.origin, 3000);
		player setStance("prone");
		player.moveSpeedScaler = 0.35;
		player maps\mp\gametypes\_weapons::updateMoveSpeedScale( "primary" );
		player VisionSetNakedForPlayer("mpnuke_aftermath", 2);		
	}
	level.BotsForWave = 0;
	AmbientStop(1);
	wait 5;
	if(getDvarInt("z_dedicated") == 0)
	{
		foreach(player in level.players)
		{
			player playLocalSound("mp_killstreak_harrierstrike");
		}
	}
	foreach(player in level.players)
	{
		player thread maps\mp\gametypes\_rank::scorePopup(20000, 0, (1,1,0.5));
		player thread AImod\_Mod::TextPopup( "10000 Rank XP!" );
		player thread maps\mp\gametypes\_rank::giveRankXP("kill", 10000 );
		player.xpearned += 10000;
	}
	if(getDvarInt("z_dedicated") == 0)
		wait 80;
	thread maps\mp\gametypes\_gamelogic::endGame( "allies", level.zombieDeath[randomInt(level.zombieDeath.size)] );
}

PlayHeliFall()
{
	while(isDefined(self))
	{
		PlayFXOnTag( loadFx("smoke/smoke_trail_black_heli_emitter"), self, "tag_engine_left" );
		PlayFXOnTag( loadFx("fire/fire_smoke_trail_L_emitter"), self, "tag_engine_left" );
		wait 4;
	}
}

SpawnHeli()
{
	rSpawn = undefined;
	switch(getDvar("mapname"))
	{
		case "mp_abandon":
		rSpawn = (-5684,8503,939);
		break;
		case "mp_estate":
		rSpawn = (-7669,-2787,-156);
		break;
		case "mp_derail":
		rSpawn = (-420,2083,773);
		break;
		case "mp_favela":
		rSpawn = (-3605,1028,1949);
		break;
		case "mp_underpass":
		rSpawn = (6952,4630,1375);
		break;
		case "mp_brecourt":
		rSpawn = (4147,3381,1862);
		break;
		case "mp_afghan":
		rSpawn = (-2259,-4580,2);
		break;
		case "mp_highrise":
		if(level.edit == 0)
			rSpawn = (5799,7047,3859);
		if(level.edit == 1)
			rSpawn = (-5350,10560,5990);
		break;
		case "mp_nightshift":
		if(level.edit == 0)
			rSpawn = (-1814,-3775,748);
		if(level.edit == 1)
			rSpawn = (4628,-1204,1234);
		if(level.edit == 2)
			rSpawn = (1902,-5880,840);
		break;
		case "mp_terminal":
		rSpawn = (-5862,2653,830);
		break;
		case "mp_strike":
		rSpawn = (-9493,1494,594);
		break;
		case "mp_subbase":
		rSpawn = (-86,-861,854);
		break;
		case "mp_boneyard":
		rSpawn = (1909,-5738,610);
		break;
		case "mp_invasion":
		rSpawn = (3064,1670,955);
		break;
		case "mp_checkpoint":
		rSpawn = (2104,324,508);
		break;
		case "mp_rust":
		rSpawn = (67,-141,513);
		break;
		case "mp_quarry":
		rSpawn = (-3023,5275,633);
		break;
		case "mp_compact":
		rSpawn = (2648,602,523);
		break;
		case "mp_complex":
		rSpawn = (895,4161,1180);
		break;
		case "mp_trailerpark":
		rSpawn = (1194,721,632);
		break;
		case "mp_rundown":
		rSpawn = (340,-846,1349);
		break;
		case "mp_vacant":
		rSpawn = (-9843,1186,632);
		break;
		case "mp_storm":
		rSpawn = (-6699,-2555,741);
		break;
		case "mp_fuel2":
		rSpawn = (23101,27505,9481);
		break;
		case "mp_overgrown":
		rSpawn = (-181,-9814,483);
		break;
		case "mp_crash":
		rSpawn = (-1085,-6916,1210);
		break;
	}
	return rSpawn;
}

MoveHeli()
{
	rMove = undefined;
	switch(getDvar("mapname"))
	{
		case "mp_abandon":
		rMove = (-3576,5414,791);
		break;
		case "mp_estate":
		rMove = (-4679,-1266,-196);
		break;
		case "mp_derail":
		rMove = (1395,1638,700);
		break;
		case "mp_favela":
		rMove = (236,1929,1082);
		break;
		case "mp_underpass":
		rMove = (4090,3206,935);
		break;
		case "mp_brecourt":
		rMove = (8288,5790,1332);
		break;
		case "mp_afghan":
		rMove = (-3650,-1148,-696);
		break;
		case "mp_highrise":
		if(level.edit == 0)
			rMove = (1006,9004,2853);
		if(level.edit == 1)
			rMove = (-95,10777,3907);
		break;
		case "mp_nightshift":
		if(level.edit == 0)
			rMove = (-1751,-1309,533);
		if(level.edit == 1)
			rMove = (2033,-1011,708);
		if(level.edit == 2)
			rMove = (1925,-1992,375);
		break;
		case "mp_terminal":
		rMove = (859,3444,693);
		break;
		case "mp_strike":
		rMove = (-3947,1422,414);
		break;
		case "mp_subbase":
		rMove = (-345,-3844,368);
		break;
		case "mp_boneyard":
		rMove = (820,-3232,450);
		break;
		case "mp_invasion":
		rMove = (3007,8854,543);
		break;
		case "mp_checkpoint":
		rMove = (2355,2210,318);
		break;
		case "mp_rust":
		rMove = (760,-3910,523);
		break;
		case "mp_quarry":
		rMove = (-3396,3564,566);
		break;
		case "mp_compact":
		rMove = (2257,2353,414);
		break;
		case "mp_complex":
		rMove = (629,1211,907);
		break;
		case "mp_trailerpark":
		rMove = (1095,-1611,501);
		break;
		case "mp_rundown":
		rMove = (607,2084,541);
		break;
		case "mp_vacant":
		rMove = (-2936,762,528);
		break;
		case "mp_storm":
		rMove = (4977,-1931,644);
		break;
		case "mp_fuel2":
		rMove = (22855,23347,8940);
		break;
		case "mp_overgrown":
		rMove = (-1379,-6723,291);
		break;
		case "mp_crash":
		rMove = (-1119,-4474,979);
		break;
	}
	return rMove;
}

MoveGround()
{
	rMove = undefined;
	switch(getDvar("mapname"))
	{
		case "mp_abandon":
		switch(randomInt(2))
		{
			case 0:
			rMove = (-2017,1769,150);
			break;
			case 1:
			rMove = (-440,4724,150);
			break;
		}
		break;
		case "mp_estate":
		switch(randomInt(2))
		{
			case 0:
			rMove = (-2546,-1719,-470);
			break;
			case 1:
			rMove = (-2487,-433,-139);
			break;
		}
		break;
		case "mp_derail":
		switch(randomInt(2))
		{
			case 0:
			rMove = (2538,1697,311);
			break;
			case 1:
			rMove = (2634,1310,366);
			break;
		}
		break;
		case "mp_favela":
		switch(randomInt(2))
		{
			case 0:
			rMove = (1319,2378,616);
			break;
			case 1:
			rMove = (1984,2641,489);
			break;
		}
		break;
		case "mp_underpass":
		switch(randomInt(2))
		{
			case 0:
			rMove = (3305,3091,594);
			break;
			case 1:
			rMove = (3851,2178,559);
			break;
		}
		break;
		case "mp_brecourt":
		switch(randomInt(2))
		{
			case 0:
			rMove = (10712,6558,610);
			break;
			case 1:
			rMove = (9774,8120,553);
			break;
		}
		break;
		case "mp_afghan":
		switch(randomInt(2))
		{
			case 0:
			rMove = (-3985,443,-1200);
			break;
			case 1:
			rMove = (-2399,-689,-1174);
			break;
		}
		break;
		case "mp_highrise":
		if(level.edit == 0)
		{
			switch(randomInt(2))
			{
				case 0:
				rMove = (-829,9656,2374);
				break;
				case 1:
				rMove = (-895,11245,2306);
				break;
			}
		}
		if(level.edit == 1)
		{
			switch(randomInt(2))
			{
				case 0:
				rMove = (1563,11359,3479);
				break;
				case 1:
				rMove = (1690,10481,3497);
				break;
			}
		}
		break;
		case "mp_nightshift":
		if(level.edit == 0)
		{
			switch(randomInt(2))
			{
				case 0:
				rMove = (-1255,-584,150);
				break;
				case 1:
				rMove = (-1732,-506,139);
				break;
			}
		}
		if(level.edit == 1)
		{
			switch(randomInt(2))
			{
				case 0:
				rMove = (824,-1328,149);
				break;
				case 1:
				rMove = (871,-1038,126);
				break;
			}
		}
		if(level.edit == 2)
		{
			switch(randomInt(2))
			{
				case 0:
				rMove = (1935,-1020,141);
				break;
				case 1:
				rMove = (1740,-1411,115);
				break;
			}
		}
		break;
		case "mp_terminal":
		switch(randomInt(2))
		{
			case 0:
			rMove = (1889,2971,287);
			break;
			case 1:
			rMove = (1535,4026,586);
			break;
		}
		break;
		case "mp_strike":
		switch(randomInt(2))
		{
			case 0:
			rMove = (-2425,1349,113);
			break;
			case 1:
			rMove = (-2907,1486,112);
			break;
		}
		break;
		case "mp_subbase":
		switch(randomInt(2))
		{
			case 0:
			rMove = (-428,-4978,93);
			break;
			case 1:
			rMove = (-275,-5067,81);
			break;
		}
		break;
		case "mp_boneyard":
		switch(randomInt(2))
		{
			case 0:
			rMove = (731,-1752,27);
			break;
			case 1:
			rMove = (-443,-1863,46);
			break;
		}
		break;
		case "mp_invasion":
		switch(randomInt(2))
		{
			case 0:
			rMove = (4507,11332,103);
			break;
			case 1:
			rMove = (2926,12053,62);
			break;
		}
		break;
		case "mp_checkpoint":
		switch(randomInt(2))
		{
			case 0:
			rMove = (2418,3331,87);
			break;
			case 1:
			rMove = (1507,3083,48);
			break;
		}
		break;
		case "mp_rust":
		switch(randomInt(2))
		{
			case 0:
			rMove = (168,-9587,-20);
			break;
			case 1:
			rMove = (2028,-9862,-47);
			break;
		}
		break;
		case "mp_quarry":
		switch(randomInt(2))
		{
			case 0:
			rMove = (-3269,2260,140);
			break;
			case 1:
			rMove = (-3138,2910,115);
			break;
		}
		break;
		case "mp_compact":
		switch(randomInt(2))
		{
			case 0:
			rMove = (2320,3011,138);
			break;
			case 1:
			rMove = (1789,2975,161);
			break;
		}
		break;
		case "mp_complex":
		switch(randomInt(2))
		{
			case 0:
			rMove = (1487,-137,521);
			break;
			case 1:
			rMove = (-701,-260,450);
			break;
		}
		break;
		case "mp_trailerpark":
		switch(randomInt(2))
		{
			case 0:
			rMove = (1823,-2807,278);
			break;
			case 1:
			rMove = (533,-2391,73);
			break;
		}
		break;
		case "mp_rundown":
		switch(randomInt(2))
		{
			case 0:
			rMove = (411,2902,164);
			break;
			case 1:
			rMove = (962,2588,168);
			break;
		}
		break;
		case "mp_vacant":
		switch(randomInt(2))
		{
			case 0:
			rMove = (-260,1045,133);
			break;
			case 1:
			rMove = (-993,-105,76);
			break;
		}
		break;
		case "mp_storm":
		switch(randomInt(2))
		{
			case 0:
			rMove = (2947,-1911,255);
			break;
			case 1:
			rMove = (4930,-622,158);
			break;
		}
		break;
		case "mp_fuel2":
		switch(randomInt(1))
		{
			case 0:
			rMove = (-1403,-5867,-89);
			break;
			case 1:
			rMove = (-2219,-6130,-107);
			break;
		}
		break;
		case "mp_overgrown":
		switch(randomInt(2))
		{
			case 0:
			rMove = (0,21352,6931);
			break;
			case 1:
			rMove = (4930,-622,158);
			break;
		}
		break;
		case "mp_crash":
		switch(randomInt(2))
		{
			case 0:
			rMove = (-1035,-2408,124);
			break;
			case 1:
			rMove = (-1002,-2852,202);
			break;
		}
		break;
	}
	return rMove;
}