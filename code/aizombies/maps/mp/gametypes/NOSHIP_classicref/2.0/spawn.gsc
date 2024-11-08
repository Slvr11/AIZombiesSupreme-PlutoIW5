#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;

change_spawnsAfghan()
{
	self endon("disconnect");
	spawn = [];
	if(self.team == "allies")
	{
		if(getdvar("mapname") == "mp_afghan")
		{
            spawn[spawn.size] = (-2084,-708,-1439);
			spawn[spawn.size] = (-1941,-886,-1440);
			spawn[spawn.size] = (-2157,-371,-1440);
			spawn[spawn.size] = (-2347,-748,-1440);
			self setorigin(spawn[randomint(spawn.size)]);
			self setplayerangles(RandomIntRange(136,212));
		}	
	}
}

change_spawnsScrapyard()
{
	self endon("disconnect");
	spawn = [];
	if(self.team == "allies")
	{
		if(getdvar("mapname") == "mp_boneyard")
		{
            spawn[spawn.size] = (124,-810,-124);
			spawn[spawn.size] = (71,-810,-124);
			spawn[spawn.size] = (7,-813,-124);
			spawn[spawn.size] = (-42,-811,-123);
			self setorigin(spawn[randomint(spawn.size)]);
			self setplayerangles((0,270,0));
		}	
	}
}

change_spawnsRundown()
{
	self endon("disconnect");
	spawn = [];
	if(self.team == "allies")
	{
		if(getdvar("mapname") == "mp_rundown")
		{
            spawn[spawn.size] = (1432, 2922, 82);
			spawn[spawn.size] = (1238, 2876, 82);
			spawn[spawn.size] = (1327, 3112, 82);
			spawn[spawn.size] = (1425, 3098, 82);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
	}
}

change_spawnsSkidrow()
{
	self endon("disconnect");
	spawn = [];
	if(self.team == "allies")
	{
		if(getdvar("mapname") == "mp_nightshift" && level.edit == 0)
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
		}	
	}
}

change_spawnsUnderpass()
{
	self endon("disconnect");
	spawn = [];
	if(self.team == "allies")
	{
		if(getdvar("mapname") == "mp_underpass")
		{
            spawn[spawn.size] = (3949,1062,400);
			spawn[spawn.size] = (3843,1059,400);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
	}
}

change_spawnsTrailerpark()
{
	self endon("disconnect");
	spawn = [];
	if(self.team == "allies")
	{
		if(getdvar("mapname") == "mp_trailerpark")
		{
            spawn[spawn.size] = (1887.5, -2864.0, 24.1);
			spawn[spawn.size] = (1762.5, -2953.4, 24.1);
			spawn[spawn.size] = (1649.6, -2695.0, 24.1);
			spawn[spawn.size] = (1798.7, -2614.4, 24.1);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
	}
}

change_spawnsQuarry()
{
	self endon("disconnect");
	spawn = [];
	if(self.team == "allies")
	{
		if(getdvar("mapname") == "mp_quarry")
		{
            spawn[spawn.size] = (-1711.1, 2146.8, 176.1);
			spawn[spawn.size] = (-1662.3, 2143.8, 176.1);
			spawn[spawn.size] = (-1621.4, 1213.7, 40.1);
			spawn[spawn.size] = (-1625.4, 1099.8, 40.1);
			spawn[spawn.size] = (-1620.0, 906.2, 40.1);
			spawn[spawn.size] = (-2564.1, 942.0, 40.1);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
	}
}

change_spawnsRust()
{
	self endon("disconnect");
	spawn = [];
	if(self.team == "allies")
	{
		if(getdvar("mapname") == "mp_rust" && level.edit == 0)
		{
            spawn[spawn.size] = (3024.5, -10978.9, -162.1);
			spawn[spawn.size] = (3028.6, -10879.9, -163.5);
			spawn[spawn.size] = (2658.2, -10886.8, -197.9);
			spawn[spawn.size] = (2551.0, -10848.2, -208.7);
			spawn[spawn.size] = (2408.1, -10792.0, -212.0);
			spawn[spawn.size] = (2683.5, -10662.4, -201.8);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
		if(getdvar("mapname") == "mp_rust" && level.edit == 1)
		{
            spawn[spawn.size] = (1444,-4791,-139);
			spawn[spawn.size] = (1595,-4899,-172);
			spawn[spawn.size] = (1239,-4898,-196);
			spawn[spawn.size] = (1479,-4565,-160);
			spawn[spawn.size] = (1712,-4699,-163);
			spawn[spawn.size] = (1279,-5597,-255);
			spawn[spawn.size] = (986,-5643,-255);
			spawn[spawn.size] = (1152,-5514,-255);
			spawn[spawn.size] = (1178,-5915,-255);
			spawn[spawn.size] = (1004,-6355,-255);
			spawn[spawn.size] = (998,-6475,-255);
			spawn[spawn.size] = (1154,-6598,-255);
			spawn[spawn.size] = (1195,-6393,-255);
			self setorigin(spawn[randomint(spawn.size)]);
			self setplayerangles((0,270,0));
		}	
	}
}

change_spawnsSalvage()
{
	self endon("disconnect");
	spawn = [];
	if(self.team == "allies")
	{
		if(getdvar("mapname") == "mp_compact")
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
	}
}

change_spawnsSubBase()
{
	self endon("disconnect");
	spawn = [];
	if(self.team == "allies")
	{
		if(getdvar("mapname") == "mp_subbase")
		{
            spawn[spawn.size] = (-254,-3903,16);
			spawn[spawn.size] = (-326,-3906,16);
			spawn[spawn.size] = (-408,-3905,16);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
	}
}

change_spawnsWasteland()
{
	self endon("disconnect");
	spawn = [];
	if(self.team == "allies")
	{
		if(getdvar("mapname") == "mp_brecourt")
		{
            spawn[spawn.size] = (10943,7200,1486);
			spawn[spawn.size] = (9958,7285,358);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
	}
}

change_spawnsStrike()
{
	self endon("disconnect");
	if(self.team == "allies")
	{
		if(getdvar("mapname") == "mp_strike")
		{
			switch(randomInt(3))
			{
			    case 0:
				self setorigin(-1786,1574,24);
				self.angles = (0,180,0);
				break;
				case 1:
				self setorigin((-1743,1467,26));
				self.angles = (0,180,0);
				break;
				case 2:
				self setorigin((-1878,1487,17));
				self.angles = (0,180,0);
				break;
			}
		}	
	}
}

change_spawnsTerminal()
{
	self endon("disconnect");
	spawn = [];
	if(self.team == "allies")
	{
		if(getdvar("mapname") == "mp_terminal")
		{
            spawn[spawn.size] = (1503,4095,184);
			spawn[spawn.size] = (1586,4094,184);
			spawn[spawn.size] = (1700,4084,184);
			spawn[spawn.size] = (1773,4079,184);
			spawn[spawn.size] = (1693,4231,184);
			spawn[spawn.size] = (1582,4237,184);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
	}
}

change_spawnsKarachi()
{
	self endon("disconnect");
	spawn = [];
	if(self.team == "allies")
	{
		if(getdvar("mapname") == "mp_checkpoint")
		{
            spawn[spawn.size] = (2367,1941,47);
			spawn[spawn.size] = (2485,1943,47);
			spawn[spawn.size] = (2435,2052,21);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
	}
}

change_spawnsFavela()
{
	self endon("disconnect");
	spawn = [];
	if(self.team == "allies")
	{
		if(getdvar("mapname") == "mp_favela")
		{
            spawn[spawn.size] = (1505,2348,298);
			spawn[spawn.size] = (1492,2397,298);
			spawn[spawn.size] = (1474,2453,298);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
	}
}

change_spawnsBailout()
{
	self endon("disconnect");
	spawn = [];
	if(self.team == "allies")
	{
		if(getdvar("mapname") == "mp_complex")
		{
            spawn[spawn.size] = (2864,-2001,1056);
			spawn[spawn.size] = (2974,-1992,1056);
			spawn[spawn.size] = (3068,-1981,1056);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
	}
}

change_spawnsDerail()
{
	self endon("disconnect");
	spawn = [];
	if(self.team == "allies")
	{
		if(getdvar("mapname") == "mp_derail")
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
	}
}

change_spawnsHighrise()
{
	self endon("disconnect");
	spawn = [];
	if(self.team == "allies")
	{
		if(getdvar("mapname") == "mp_highrise" && level.edit == 0)
		{
            spawn[spawn.size] = (-7981,5599,2331);
			spawn[spawn.size] = (-7976,5762,2331);
			spawn[spawn.size] = (-7977,5979,2331);
			spawn[spawn.size] = (-7980,6285,2331);
			spawn[spawn.size] = (-7950,6566,2331);
			spawn[spawn.size] = (-7962,6746,2331);
			spawn[spawn.size] = (-8206,5374,2331);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
		else if(getdvar("mapname") == "mp_highrise" && level.edit == 1)
		{
            spawn[spawn.size] = (-14749.7,3934,5439.1);
			spawn[spawn.size] = (-14530.5,3917,5439.1);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
	}
}

change_spawnsInvasion()
{
	self endon("disconnect");
	spawn = [];
	if(self.team == "allies")
	{
		if(getdvar("mapname") == "mp_invasion")
		{
            spawn[spawn.size] = (2411,12662,11);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
	}
}

change_spawnsEstate()
{
	self endon("disconnect");
	spawn = [];
	if(self.team == "allies")
	{
		if(getdvar("mapname") == "mp_estate")
		{
            spawn[spawn.size] = (-2586,-243,-312);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
	}
}

change_spawnsCarnival()
{
	self endon("disconnect");
	spawn = [];
	if(self.team == "allies")
	{
		if(getdvar("mapname") == "mp_abandon")
		{
            spawn[spawn.size] = (-2186,2961,3);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
	}
}

change_spawnsVacant()
{
	self endon("disconnect");
	spawn = [];
	if(self.team == "allies")
	{
		if(getdvar("mapname") == "mp_vacant")
		{
            spawn[spawn.size] = (-53,796,-31);
			spawn[spawn.size] = (-39,949,-31);
			spawn[spawn.size] = (-11,1186,-31);
			spawn[spawn.size] = (-135,1278,-31);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
	}
}

change_spawnsStorm()
{
	self endon("disconnect");
	spawn = [];
	if(self.team == "allies")
	{
		if(getdvar("mapname") == "mp_storm")
		{
            spawn[spawn.size] = (2598,-1279,-47);
			spawn[spawn.size] = (2607,-1148,-47);
			spawn[spawn.size] = (2612,-1023,-48);
			spawn[spawn.size] = (2787,-1132,-48);
			self setorigin(spawn[randomint(spawn.size)]);
		}	
	}
}

StopBarriers()
{
	ents = getEntArray();
		for(i = 0;i < ents.size;i++)
			if(isSubStr(ents[i].classname,"trigger_hurt"))
				ents[i].origin = (0,0,9999999);
}
