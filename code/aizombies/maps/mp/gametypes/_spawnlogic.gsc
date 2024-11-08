#include common_scripts\utility;
#include maps\mp\_utility;

findBoxCenter( mins, maxs )
{
	center = ( 0, 0, 0 );
	center = maxs - mins;
	center = ( center[0]/2, center[1]/2, center[2]/2 ) + mins;
	return center;
}

expandMins( mins, point )
{
	if ( mins[0] > point[0] )
		mins = ( point[0], mins[1], mins[2] );
	if ( mins[1] > point[1] )
		mins = ( mins[0], point[1], mins[2] );
	if ( mins[2] > point[2] )
		mins = ( mins[0], mins[1], point[2] );
	return mins;
}

expandMaxs( maxs, point )
{
	if ( maxs[0] < point[0] )
		maxs = ( point[0], maxs[1], maxs[2] );
	if ( maxs[1] < point[1] )
		maxs = ( maxs[0], point[1], maxs[2] );
	if ( maxs[2] < point[2] )
		maxs = ( maxs[0], maxs[1], point[2] );
	return maxs;
}


addSpawnPoints( team, spawnPointName, isSetOptional )
{
	if ( !isDefined( isSetOptional ) )
		isSetOptional = false;
	
	oldSpawnPoints = [];
	if ( level.teamSpawnPoints[team].size )
		oldSpawnPoints = level.teamSpawnPoints[team];
	
	level.teamSpawnPoints[team] = getSpawnpointArray( spawnPointName );
	
	if ( !level.teamSpawnPoints[team].size && !isSetOptional )
	{
		println( "^1Error: No " + spawnPointName + " spawnpoints found in level!" );
		maps\mp\gametypes\_callbacksetup::AbortLevel();
		wait 1; // so we don't try to abort more than once before the frame ends
		return;
	}
	
	if ( !isDefined( level.spawnpoints ) )
		level.spawnpoints = [];
	
	for ( index = 0; index < level.teamSpawnPoints[team].size; index++ )
	{
		spawnpoint = level.teamSpawnPoints[team][index];
		
		if ( !isdefined( spawnpoint.inited ) )
		{
			spawnpoint spawnPointInit();
			level.spawnpoints[ level.spawnpoints.size ] = spawnpoint;
		}
	}
	
	for ( index = 0; index < oldSpawnPoints.size; index++ )
	{
		origin = oldSpawnPoints[index].origin;
		
		// are these 2 lines necessary? we already did it in spawnPointInit
		level.spawnMins = expandMins( level.spawnMins, origin );
		level.spawnMaxs = expandMaxs( level.spawnMaxs, origin );
		
		level.teamSpawnPoints[team][ level.teamSpawnPoints[team].size ] = oldSpawnPoints[index];
	}
}

placeSpawnPoints( spawnPointName )
{
	spawnPoints = getSpawnpointArray( spawnPointName );
	
	/#
	if ( !isDefined( level.extraspawnpointsused ) )
		level.extraspawnpointsused = [];
	#/
	
	if ( !spawnPoints.size )
	{
		println( "^1Error: No " + spawnPointName + " spawnpoints found in level!" );
		maps\mp\gametypes\_callbacksetup::AbortLevel();
		wait 1; // so we don't try to abort more than once before the frame ends
		return;
	}
	
	if ( !isDefined( level.startSpawnPoints ) )
		level.startSpawnPoints = [];

	for( index = 0; index < spawnPoints.size; index++ )
	{
		spawnPoints[index] spawnPointInit();
		// don't add this spawnpoint to level.spawnpoints,
		// because it's an unimportant one that we don't want to do sight traces to
		
		// but we do want another array of spawnpoints for the uav in S&D
		level.startSpawnPoints[ level.startSpawnPoints.size ] = spawnPoints[index];

		/#
		spawnPoints[index].fakeclassname = spawnPointName;
		level.extraspawnpointsused[ level.extraspawnpointsused.size ] = spawnPoints[index];
		#/
	}
}

getSpawnpointArray( classname )
{
	spawnPoints = getEntArray( classname, "classname" );
	
	if ( !isdefined( level.extraspawnpoints ) || !isdefined( level.extraspawnpoints[classname] ) )
		return spawnPoints;
	
	for ( i = 0; i < level.extraspawnpoints[classname].size; i++ )
	{
		spawnPoints[ spawnPoints.size ] = level.extraspawnpoints[classname][i];
	}
	
	return spawnPoints;
}

expandSpawnpointBounds( classname )
{
	spawnPoints = getSpawnpointArray( classname );
	for( index = 0; index < spawnPoints.size; index++ )
	{
		level.spawnMins = expandMins( level.spawnMins, spawnPoints[index].origin );
		level.spawnMaxs = expandMaxs( level.spawnMaxs, spawnPoints[index].origin );
	}
}

setMapCenterForReflections()
{
	level.spawnMins = (0,0,0);
	level.spawnMaxs = (0,0,0);
	
	maps\mp\gametypes\_spawnlogic::expandSpawnpointBounds( "mp_tdm_spawn_allies_start" );
	maps\mp\gametypes\_spawnlogic::expandSpawnpointBounds( "mp_tdm_spawn_axis_start" );
	level.mapCenter = maps\mp\gametypes\_spawnlogic::findBoxCenter( level.spawnMins, level.spawnMaxs );
	setMapCenter( level.mapCenter );
}

// initspawnpoint()
spawnPointInit()
{
	spawnpoint = self;
	origin = spawnpoint.origin;
	
	level.spawnMins = expandMins( level.spawnMins, origin );
	level.spawnMaxs = expandMaxs( level.spawnMaxs, origin );
	
	spawnpoint placeSpawnpoint();
	spawnpoint.forward = anglesToForward( spawnpoint.angles );
	spawnpoint.sightTracePoint = spawnpoint.origin + (0,0,50);
	
	spawnpoint.lastspawnedplayer = spawnpoint; // just want this to be any entity for which isalive() returns false
	spawnpoint.lastspawntime = gettime();
	
	skyHeight = 1024;
	spawnpoint.outside = true;
	if ( !bullettracepassed( spawnpoint.sightTracePoint, spawnpoint.sightTracePoint + (0,0,skyHeight), false, undefined) )
	{
		startpoint = spawnpoint.sightTracePoint + spawnpoint.forward * 100;
		if ( !bullettracepassed( startpoint, startpoint + (0,0,skyHeight), false, undefined) )
			spawnpoint.outside = false;
	}
	
	right = anglesToRight( spawnpoint.angles );
	spawnpoint.alternates = [];
	AddAlternateSpawnpoint( spawnpoint, spawnpoint.origin + right * 45 );
	AddAlternateSpawnpoint( spawnpoint, spawnpoint.origin - right * 45 );
	//AddAlternateSpawnpoint( spawnpoint, spawnpoint.origin + spawnpoint.forward * 45 );
	
	/*
	spawnpoint.secondFloor = false;
	if ( isDefined( level.spawnSecondFloorTrig ) )
	{
		spawnpoint.secondFloor = (spawnpoint isTouching( level.spawnSecondFloorTrig ));
		
		spawnpoint.floorTransitionDistances = [];
		
		for ( pointIndex = 0; pointIndex < level.spawnFloorTransitions.size; pointIndex++ )
		{
			spawnpoint.floorTransitionDistances[ pointIndex ] = distance( level.spawnFloorTransitions[ pointIndex ], spawnpoint.origin );
		}
	}
	*/
	
	spawnPointUpdate( spawnpoint );
	
	spawnpoint.inited = true;
}

AddAlternateSpawnpoint( spawnpoint, alternatepos )
{
}


getTeamSpawnPoints( team )
{
	return level.teamSpawnPoints[team];
}

getSpawnpoint_Final( spawnpoints, useweights )
{
	return undefined;
}

finalizeSpawnpointChoice( spawnpoint )
{
}

maxSightTracedSpawnpoints = 3;

getBestWeightedSpawnpoint( spawnpoints )
{
	return undefined;
}

getSpawnpoint_Random(spawnpoints)
{
	return undefined;
}

getAllOtherPlayers()
{
	aliveplayers = [];

	// Make a list of fully connected, non-spectating, alive players
	for(i = 0; i < level.players.size; i++)
	{
		if ( !isdefined( level.players[i] ) )
			continue;
		player = level.players[i];
		
		if ( player.sessionstate != "playing" || player == self )
			continue;

		aliveplayers[aliveplayers.size] = player;
	}
	return aliveplayers;
}


// weight array manipulation code
initWeights(spawnpoints)
{
	for (i = 0; i < spawnpoints.size; i++)
		spawnpoints[i].weight = 0;
}

// ================================================


getSpawnpoint_NearTeam( spawnpoints, favoredspawnpoints )
{
	return undefined;
}


//Not In Use --- IW5 ---
getSpawnpoint_SafeSpawn( spawnpoints )
{
	return undefined;
}

/////////////////////////////////////////////////////////////////////////

getSpawnpoint_DM(spawnpoints)
{
	return undefined;
}

// =============================================

// called at the start of every spawn
Spawnlogic_Begin()
{
}

// called once at start of game
init()
{
	// start keeping track of deaths
	level.spawnlogic_deaths = [];
	// DEBUG
	level.spawnlogic_spawnkills = [];
	level.players = [];
	level.grenades = [];
	level.pipebombs = [];
	level.turrets = [];
	level.helis = [];
	level.tanks = [];
	level.scramblers = [];
	level.ims = [];
	level.ugvs = [];

	level.teamSpawnPoints["axis"] = [];
	level.teamSpawnPoints["allies"] = [];
	
	level.spawnMins = (0,0,0);
	level.spawnMaxs = (0,0,0);
	if ( isdefined( level.safespawns ) )
	{
		for( i = 0; i < level.safespawns.size; i++ )
		{
			level.safespawns[i] spawnPointInit();
		}
	}
}

sightCheckCost()
{
}

watchSpawnProfile()
{
}

spawnProfile()
{
}

spawnGraphCheck()
{
}

spawnGraph()
{
}

drawSpawnGraph( fakespawnpoints, w, h, weightscale )
{
}

setupSpawnGraphPoint( s1, weightscale )
{
}

spawnGraphLine( s1, s2, weightscale )
{
}

loopbotspawns()
{
}

trackGrenades()
{
}


trackMissiles()
{
}


// used by spawning; needs to be fast.
isPointVulnerable(playerorigin)
{
	return false;
}


avoidWeaponDamage(spawnpoints)
{
}

spawnPerFrameUpdate()
{
}

adjustSightValue( sightValue )
{
}

spawnPointUpdate( spawnpoint )
{
}

getLosPenalty()
{
	return 100000;
}

lastMinuteSightTraces( spawnpoint )
{
	return 0;
}


getRevengeSpawnPenalty()
{
	return 0;		
}


getRevengeSpawnDistanceSq()
{
	dist = getdvarfloat("scr_revengespawndist", 1200 );		
	return dist * dist;
}


avoidRevengeSpawn(spawnpoints, deathpos)
{
}

avoidRevengeSpawnStage2( spawnpoints, attackerPos )
{
}

avoidVisibleEnemies(spawnpoints, teambased)
{
}

avoidSpawnReuse(spawnpoints, teambased)
{
}

avoidSameSpawn()
{
}

SetupKillstreakSpawnShield()
{
}

