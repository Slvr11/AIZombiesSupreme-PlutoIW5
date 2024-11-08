#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;

ZombieSpawnsHighrise2(progress)
{
	spawn = undefined;
	if(progress == 0)
	{
		spawn[spawn.size] = (2208,11342,3371);
		spawn[spawn.size] = (2208,10473,3371);
		spawn[spawn.size] = (3037,11690,3371);
		spawn[spawn.size] = (2208,11300,3371);
	}	
	else if(progress == 1)
	{
		spawn[spawn.size] = (2906,10116,4075);
		spawn[spawn.size] = (2896,10614,4075);
		spawn[spawn.size] = (2892,11239,4075);
		spawn[spawn.size] = (2903,11563,4075);
	}	
	else if(progress == 2)
	{
		spawn[spawn.size] = (3866,2155,2355);
		spawn[spawn.size] = (5016,1005,2355);
		spawn[spawn.size] = (6005,912,2355);
		spawn[spawn.size] = (6380,964,2355);
	}	
	return spawn[randomint(spawn.size)];	
}