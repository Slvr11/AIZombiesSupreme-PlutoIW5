#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;

change_spawns()
{
	self endon("disconnect");
	spawn = [];
	{
		if(getdvar("mapname") == "mp_afghan" && level.edit == 0)
		{
            spawn[spawn.size] = (-2084,-708,-1439);
			spawn[spawn.size] = (-1941,-886,-1440);
			spawn[spawn.size] = (-2157,-371,-1440);
			spawn[spawn.size] = (-2347,-748,-1440);
			self setorigin(spawn[randomint(spawn.size)]);
			self setplayerangles((0,180,0));
		}
		else if(getdvar("mapname") == "mp_afghan" && level.edit == 1)
		{
            spawn[spawn.size] = (9151,3098,117);
			spawn[spawn.size] = (9150,3174,123);
			spawn[spawn.size] = (9164,3282,131);
			self setorigin(spawn[randomint(spawn.size)]);
			self setplayerangles((0,-131,0));
		}	
		else if(getdvar("mapname") == "mp_boneyard")
		{
            spawn[spawn.size] = (124,-810,-124);
			spawn[spawn.size] = (71,-810,-124);
			spawn[spawn.size] = (7,-813,-124);
			spawn[spawn.size] = (-42,-811,-123);
			self setorigin(spawn[randomint(spawn.size)]);
			self setplayerangles((0,270,0));
		}	
		else if(getdvar("mapname") == "mp_rundown")
		{
            spawn[spawn.size] = (1432, 2922, 82);
			spawn[spawn.size] = (1238, 2876, 82);
			spawn[spawn.size] = (1327, 3112, 82);
			spawn[spawn.size] = (1425, 3098, 82);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
		else if(getdvar("mapname") == "mp_nightshift" && level.edit == 0)
		{
            spawn[spawn.size] = (-2387.2, -350.7, 144.1);
			spawn[spawn.size] = (-2349.1, -793.4, 144.1);
			spawn[spawn.size] = (-2215.3, 203.2, 32.1);
			spawn[spawn.size] = (-1596.6, -17.4, 8.1);
			spawn[spawn.size] = (-1728.4, -533.1, 8.1);
			spawn[spawn.size] = (-1202.0, -1668.5, 16.1);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
		else if(getdvar("mapname") == "mp_nightshift" && level.edit == 1)
		{
            spawn[spawn.size] = (793.4,-1855.6,192.1);
			spawn[spawn.size] = (887.7,-1855.2,192.1);
			spawn[spawn.size] = (1006.8,-1854.7,192.1);
			spawn[spawn.size] = (1068.2,-1851.8,192.1);
			spawn[spawn.size] = (1045,-2027.6,192.1);
			spawn[spawn.size] = (1029.6,-2112.3,192.1);
			self setorigin(spawn[randomint(spawn.size)]);
			self setPlayerAngles((0,90,0));
		}	
		else if(getdvar("mapname") == "mp_nightshift" && level.edit == 2)
		{
            spawn[spawn.size] = (1602,-847,16);
			spawn[spawn.size] = (1653,-851,16);
			spawn[spawn.size] = (1724,-855,16);
			spawn[spawn.size] = (1816,-861,16);
			spawn[spawn.size] = (1889,-862,16);
			spawn[spawn.size] = (1952,-862,16);
			self setorigin(spawn[randomint(spawn.size)]);
			self setPlayerAngles((0,270,0));
		}
		else if(getdvar("mapname") == "mp_underpass")
		{
            spawn[spawn.size] = (3949,1062,400);
			spawn[spawn.size] = (3843,1059,400);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
		else if(getdvar("mapname") == "mp_trailerpark")
		{
            spawn[spawn.size] = (1887.5, -2864.0, 24.1);
			spawn[spawn.size] = (1649.6, -2695.0, 24.1);
			spawn[spawn.size] = (1798.7, -2614.4, 24.1);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
		else if(getdvar("mapname") == "mp_quarry")
		{
            spawn[spawn.size] = (-3463, 677, -269);
			spawn[spawn.size] = (-3305,676,-269);
			spawn[spawn.size] = (-3744, 1200, -299.5);
			spawn[spawn.size] = (-3008, 296.7, -283.3);
			spawn[spawn.size] = (-2999, -536.5, -154.5);
			spawn[spawn.size] = (-3603, -430, -134.4);
			self setorigin(spawn[randomint(spawn.size)]);
			self setPlayerAngles((0,180,0));
		}	
		else if(getdvar("mapname") == "mp_rust" )
		{
            spawn[spawn.size] = (-115,268,-222);
			spawn[spawn.size] = (415,466,-228);
			spawn[spawn.size] = (88,29,-230);
			spawn[spawn.size] = (-159,671,-232);
			spawn[spawn.size] = (64,1143,-222);
			spawn[spawn.size] = (149,-172,-223);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
		else if(getdvar("mapname") == "mp_compact")
		{
            spawn[spawn.size] = (1870.9,2029.6,152.1);
			spawn[spawn.size] = (1876.9,2082.3,152.1);
			spawn[spawn.size] = (1833.3,2271.0,152.1);
			spawn[spawn.size] = (1791.4,2029.6,152.1);
			spawn[spawn.size] = (1718.6,2289.2,152.1);
			spawn[spawn.size] = (1863.5,2302.9,152.1);
			self setPlayerAngles((0,90,0));
			self setorigin(spawn[randomint(spawn.size)]);
		}	
		else if(getdvar("mapname") == "mp_subbase")
		{
            spawn[spawn.size] = (-254,-3903,16);
			spawn[spawn.size] = (-326,-3906,16);
			spawn[spawn.size] = (-408,-3905,16);
			self setorigin(spawn[randomint(spawn.size)]);
			self setplayerangles((0,270,0));
		}	
		else if(getdvar("mapname") == "mp_brecourt")
		{
			spawn[spawn.size] = (800,-1005,-32);
			spawn[spawn.size] = (1164,-1045,-51);
			spawn[spawn.size] = (1237,-860,-52);
			spawn[spawn.size] = (785,-443,-32);
			spawn[spawn.size] = (937,-551,-31);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
		else if(getdvar("mapname") == "mp_strike")
		{
			spawn[spawn.size] = (-1786,1574,24);
			spawn[spawn.size] = (-1743,1467,26);
			spawn[spawn.size] = (-1878,1487,17);
			self setorigin(spawn[randomint(spawn.size)]);
			self setplayerAngles((0,180,0));
		}	
		else if(getdvar("mapname") == "mp_terminal")
		{
            spawn[spawn.size] = (3179,4438,208);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
		else if(getdvar("mapname") == "mp_checkpoint")
		{
            spawn[spawn.size] = (2367,1941,47);
			spawn[spawn.size] = (2485,1943,47);
			spawn[spawn.size] = (2435,2052,21);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
		else if(getdvar("mapname") == "mp_favela" && level.edit == 0)
		{
            spawn[spawn.size] = (1505,2348,298);
			spawn[spawn.size] = (1492,2397,298);
			spawn[spawn.size] = (1474,2453,298);
			self setorigin(spawn[randomint(spawn.size)]);
		}
		else if(getdvar("mapname") == "mp_favela" && level.edit == 1)
		{
            spawn[spawn.size] = (-2655,2966,-801);
			spawn[spawn.size] = (-2674,3160,-808);
			spawn[spawn.size] = (-2753,2670,-798);
			spawn[spawn.size] = (-2801,2515,-797);
			self setplayerangles((0,176,0));
			self setorigin(spawn[randomint(spawn.size)]);
		}
		else if(getdvar("mapname") == "mp_favela" && level.edit == 2)
		{
            spawn[spawn.size] = (-3258,-9286,-820);
			self setplayerangles((0,-121,0));
			self setorigin(spawn[randomint(spawn.size)]);
		}
		else if(getdvar("mapname") == "mp_complex")
		{
            spawn[spawn.size] = (2237,-576,400);
			spawn[spawn.size] = (2252,-711,400);
			spawn[spawn.size] = (2265,-896,400);
			self setorigin(spawn[randomint(spawn.size)]);
			self setplayerangles((0,180,0));
		}	
		else if(getdvar("mapname") == "mp_derail"  && level.edit == 0)
		{
            spawn[spawn.size] = (1759,3281,158);
			spawn[spawn.size] = (1748,3223,158);
			spawn[spawn.size] = (1753,3150,158);
			spawn[spawn.size] = (1826,3156,158);
			spawn[spawn.size] = (1828,3198,158);
			spawn[spawn.size] = (1832,3249,158);
			spawn[spawn.size] = (1974,3267,158);
			spawn[spawn.size] = (1973,3137,158);
			self setPlayerAngles((0,90,0));
			self setorigin(spawn[randomint(spawn.size)]);
		}	
		else if(getdvar("mapname") == "mp_derail"  && level.edit == 1)
		{
            spawn[spawn.size] = (885,-5962,136);
			spawn[spawn.size] = (832,-5964,136);
			self setPlayerAngles((0,90,0));
			self setorigin(spawn[randomint(spawn.size)]);
		}	
		else if(getdvar("mapname") == "mp_highrise" && level.edit == 0)
		{
            spawn[spawn.size] = (-667,9679,2184);
			spawn[spawn.size] = (-793,9681,2184);
			spawn[spawn.size] = (-912,9683,2184);
			spawn[spawn.size] = (-1078,9684,2184);
			self setOrigin(spawn[randomint(spawn.size)]);
			self setPlayerAngles((0,90,0));
		}	
		else if(getdvar("mapname") == "mp_highrise" && level.edit == 1)
		{
            spawn[spawn.size] = (1278,10408,3376);
			spawn[spawn.size] = (1337,10648,3376);
			spawn[spawn.size] = (5144,2945,2360);
			spawn[spawn.size] = (5503,2899,2360);
			spawn[spawn.size] = (1320,11286,4080);
			spawn[spawn.size] = (1349,11041,4080);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
		else if(getdvar("mapname") == "mp_invasion")
		{
            spawn[spawn.size] = (-816,1393,264);
			spawn[spawn.size] = (-635,1419,264);
			self setorigin(spawn[randomint(spawn.size)]);
			self setPlayerAngles((0,280,0));
		}	
		else if(getdvar("mapname") == "mp_estate")
		{
            spawn[spawn.size] = (-2586,-243,-312);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
		else if(getdvar("mapname") == "mp_overgrown")
		{
            spawn[spawn.size] = (-1248,-5481,-153);
			spawn[spawn.size] = (-1317,-5473,-153);
			spawn[spawn.size] = (-1345,-5601,-151);
			spawn[spawn.size] = (-1381,-5589,-157);
			spawn[spawn.size] = (-1617,-5573,-145);
			spawn[spawn.size] = (-1682,-5583,-141);
			self setorigin(spawn[randomint(spawn.size)]);
			self setPlayerAngles((0,245,0));
		}	
		else if(getdvar("mapname") == "mp_fuel2")
		{
            spawn[spawn.size] = (-6144,1633,-125);
			spawn[spawn.size] = (-6009,1602,-125);
			spawn[spawn.size] = (-5886,1570,-125);
			self setorigin(spawn[randomint(spawn.size)]);
			self setPlayerangles((0,70,0));
		}
		else if(getdvar("mapname") == "mp_storm")
		{
            spawn[spawn.size] = (2598,-1279,-47);
			spawn[spawn.size] = (2607,-1148,-47);
			spawn[spawn.size] = (2612,-1023,-48);
			spawn[spawn.size] = (2787,-1132,-48);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
		else if(getdvar("mapname") == "mp_vacant")
		{
            spawn[spawn.size] = (-53,796,-31);
			spawn[spawn.size] = (-39,949,-31);
			spawn[spawn.size] = (-11,1186,-31);
			spawn[spawn.size] = (-135,1278,-31);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
		else if(getdvar("mapname") == "mp_abandon")
		{
            spawn[spawn.size] = (-2186,2961,3);
			self setorigin(spawn[randomint(spawn.size)]);
		}
		else if(getdvar("mapname") == "mp_crash")
		{
            spawn[spawn.size] = (-1055,-2488,107);
			spawn[spawn.size] = (-1117,-2495,105);
			spawn[spawn.size] = (-1116,-2925,88);
			spawn[spawn.size] = (-1047,-3181,83);
			spawn[spawn.size] = (-910,-3350,79);
			spawn[spawn.size] = (-1041,-2174,119);
			self setorigin(spawn[randomint(spawn.size)]);
			self setplayerangles((0,270,0));
		}
		else if(getdvar("mapname") == "estate")
		{
            spawn[spawn.size] = (399,-355,179);
			spawn[spawn.size] = (427,-250,179);
			self setorigin(spawn[randomint(spawn.size)]);
			self setplayerangles((0,166,0));
		}
		else if(getdvar("mapname") == "arcadia")
		{
            spawn[spawn.size] = (4041,-7475,2387);
			spawn[spawn.size] = (4000,-7550,2387);
			self setorigin(spawn[randomint(spawn.size)]);
			self setplayerangles((0,148,0));
		}
		else if(getdvar("mapname") == "airport")
		{
            spawn[spawn.size] = (-4477,3900,-84);
			spawn[spawn.size] = (-4610,4016,-84);
			self setorigin(spawn[randomint(spawn.size)]);
			self setplayerangles((0,229,0));
		}
		else if(getdvar("mapname") == "co_hunted")
		{
            spawn[spawn.size] = (3850,9986,218);
			spawn[spawn.size] = (3670,10112,218);
			self setorigin(spawn[randomint(spawn.size)]);
			self setplayerangles((0,229,0));
		}
		else if(getdvar("mapname") == "oilrig")
		{
            spawn[spawn.size] = (440,328,-1383);
			self setorigin(spawn[randomint(spawn.size)]);
			self setplayerangles((0,90,0));
		}
		else if(getdvar("mapname") == "mp_nuked")
		{
            spawn[spawn.size] = (-477,526,-45);
			spawn[spawn.size] = (-589,299,-45);
			spawn[spawn.size] = (-909,441,-45);
			spawn[spawn.size] = (-869,613,-45);
			spawn[spawn.size] = (826,361,90);
			spawn[spawn.size] = (1047,446,90);
			spawn[spawn.size] = (695,667,-45);
			spawn[spawn.size] = (996,504,-45);
			spawn[spawn.size] = (56,325,-25);
			spawn[spawn.size] = (165,356,-26);
			self setorigin(spawn[randomint(spawn.size)]);
			self setplayerangles((0,-20,0));
		}
		else if(getdvar("mapname") == "invasion")
		{
            spawn[spawn.size] = (1035,5242,2296);
			spawn[spawn.size] = (1042,5309,2296);
			spawn[spawn.size] = (1049,5437,2296);
			self setorigin(spawn[randomint(spawn.size)]);
			self setplayerangles((0,180,0));
		}
		else if(getdvar("mapname") == "mp_cross_fire")
		{
            spawn[spawn.size] = (3298,-2511,-17);
			spawn[spawn.size] = (2581,-3090,23);
			spawn[spawn.size] = (2204,-3974,-85);
			spawn[spawn.size] = (2907,-2829,-21);
			self setorigin(spawn[randomint(spawn.size)]);
			self setplayerangles((0,180,0));		
		}
		else if(getdvar("mapname") == "contingency")
		{
            spawn[spawn.size] = (-13420,2784,617);
			spawn[spawn.size] = (-13218,2717,627);
			spawn[spawn.size] = (-13195,2625,660);
			spawn[spawn.size] = (-13224,3034,636);
			self setorigin(spawn[randomint(spawn.size)]);
			self setplayerangles((0,180,0));		
		}
		else if(getdvar("mapname") == "af_caves")
		{
            spawn[spawn.size] = (3231.62, 12620.2, -1826.82);
			self setorigin(spawn[randomint(spawn.size)]);
			self setplayerangles((0, -165.425, 0));		
		}
		else if(getdvar("mapname") == "ending")
		{
            spawn[spawn.size] = (-17509, 23275.3, -16359.9);
			self setorigin(spawn[randomint(spawn.size)]);
			self setplayerangles((0, 0, 0));		
		}
		else if(getdvar("mapname") == "favela")
		{
			switch(level.edit)
			{
				case 0:
				spawn[spawn.size] = (-4383, 2106, 791);
				spawn[spawn.size] = (-4345, 2161, 791);
				spawn[spawn.size] = (-4239, 2393, 791);
				spawn[spawn.size] = (-4596, 1909, 791);
				self setorigin(spawn[randomint(spawn.size)]);
				self setplayerangles((0,145,0));		
				break;
				case 1:
				spawn[spawn.size] = (3234, -2666, 651);
				spawn[spawn.size] = (3440, -2591, 651);
				spawn[spawn.size] = (3178, -2332, 651);
				spawn[spawn.size] = (2903, -2339, 651);
				spawn[spawn.size] = (2591, -2323, 654);
				self setorigin(spawn[randomint(spawn.size)]);
				self setplayerangles((0,0,0));		
				break;
			}
		}
	}
}

GiveRandomModel()
{
	switch(randomInt(12))
	{
		case 0: self [[game["allies_model"]["SMG"]]]();
		break;
		case 1: self [[game["allies_model"]["SHOTGUN"]]]();
		break;
		case 2: self [[game["allies_model"]["ASSAULT"]]]();
		break;
		case 3: self [[game["allies_model"]["LMG"]]]();
		break;
		case 4: self [[game["allies_model"]["SNIPER"]]]();
		break;
		case 5: self [[game["allies_model"]["RIOT"]]]();
		break;
		case 6: self [[game["axis_model"]["SMG"]]]();
		switch(level.zombieModel)
		{
			case 0:
			self.voice = "arab";
			break;
			case 1:
			self.voice = "russian";
			break;
			case 2:
			self.voice = "russian";
			break;
			case 3:
			self.voice = "portuguese";
			break;
		}
		break;
		case 7: self [[game["axis_model"]["SHOTGUN"]]]();
		switch(level.zombieModel)
		{
			case 0:
			self.voice = "arab";
			break;
			case 1:
			self.voice = "russian";
			break;
			case 2:
			self.voice = "russian";
			break;
			case 3:
			self.voice = "portuguese";
			break;
		}
		break;
		case 8: self [[game["axis_model"]["ASSAULT"]]]();
		switch(level.zombieModel)
		{
			case 0:
			self.voice = "arab";
			break;
			case 1:
			self.voice = "russian";
			break;
			case 2:
			self.voice = "russian";
			break;
			case 3:
			self.voice = "portuguese";
			break;
		}
		break;
		case 9: self [[game["axis_model"]["LMG"]]]();
		switch(level.zombieModel)
		{
			case 0:
			self.voice = "arab";
			break;
			case 1:
			self.voice = "russian";
			break;
			case 2:
			self.voice = "russian";
			break;
			case 3:
			self.voice = "portuguese";
			break;
		}
		break;
		case 10: self [[game["axis_model"]["SNIPER"]]]();
		switch(level.zombieModel)
		{
			case 0:
			self.voice = "arab";
			break;
			case 1:
			self.voice = "russian";
			break;
			case 2:
			self.voice = "russian";
			break;
			case 3:
			self.voice = "portuguese";
			break;
		}
		break;
		case 11: self [[game["axis_model"]["RIOT"]]]();
		switch(level.zombieModel)
		{
			case 0:
			self.voice = "arab";
			break;
			case 1:
			self.voice = "russian";
			break;
			case 2:
			self.voice = "russian";
			break;
			case 3:
			self.voice = "portuguese";
			break;
		}
		break;
	}
}

StopBarriers()
{
	ents = getEntArray();
	for(i = 0;i < ents.size;i++)
		if(isSubStr(ents[i].classname,"trigger_hurt"))
			ents[i].origin = (0,0,9999999);
}

SpawnAngles()
{
	wait 0.01;
	spawnangles = undefined;
	switch(getDvar("mapname"))
	{
		case "mp_rust":
		spawnangles = VectorToAngles( (625,929,-180) - self.origin );
		break;
		case "mp_brecourt":
		spawnangles = VectorToAngles( (925,-824,-45) - self.origin );
		break;
	}
	self setplayerangles((0,spawnangles[1],0));
}
