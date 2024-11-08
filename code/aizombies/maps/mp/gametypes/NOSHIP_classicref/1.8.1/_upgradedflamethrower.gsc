
//////////////////////////////////////////
//////////////////////////////////////////
///////////Flamethrower///////////
/////////////////////////////////////////


Init()
{
	level.ftuWeapon = "tmp_silencer_xmags_mp";

	level.ftuFX["flame"] = loadFX( "props/barrel_fire" );
	level.ftuFX["impact"] = loadFX( "fire/fire_smoke_trail_L" );

	level.FX_count = 0;

	level thread onPlayerConnected();
}

onPlayerConnected()
{
	for( ;; )
	{
		level waittill( "connected", player );

		player thread doflamegunup();
	}
}

doflamegunup()
{
	for( ;; )
	{
		self waittill( "weapon_fired", weaponName );

		if( self getCurrentWeapon() != level.ftuWeapon )
			continue;


		start = self getTagOrigin( "tag_eye" );
		end = self getTagOrigin( "tag_eye" ) + vecscale( anglestoforward( self getPlayerAngles() ), 100000 );
		trace = bulletTrace( start, end, true, self );
 

		thread FlameFX( self getTagOrigin( "tag_flash" ), anglestoforward( self getPlayerAngles() ), trace["position"] );
	}	
}

FlameFX( startPos, direction, endPos )
{
	doDamage = 1;

	for( i = 1; ; i ++ ) 
	{
		pos = startPos + vecscale( direction, i * 150 ); 

		if( distance( startPos, pos ) > 10000 ) 
		{
			doDamage = 0;
			break;
		}

		trace = bulletTrace( startPos, pos, true, self );

		if( !bulletTracePassed( startPos, pos, true, self ) )
		{
			impactFX = spawnFX( level.ftuFX["impact"], bulletTrace( startPos, pos, true, self )["position"] );
			level.FX_count ++;
			triggerFX( impactFX );
			self playsound("explo_mine");

			wait( 0.2 );

			impactFX delete();
			level.FX_count --;
			
			break;
		}

		flameFX = spawnFX( level.ftuFX["flame"], pos ); 
		level.FX_count ++;
		triggerFX( flameFX );

		flameFX thread deleteAfterTime( 0.1 );

		if( level.FX_count < 200 ) 
		{
			for( j = 0; j < 3; j ++ )
			{
				flameFX = spawnFX( level.ftFX["flame"], pos - (randomInt( 50 ) / 3, randomInt( 50 ) / 3, randomInt( 50 ) / 2) - vecscale( direction, i * randomInt( 10 ) * 3 ) );
				level.FX_count ++;
				triggerFX( flameFX );

				flameFX thread deleteAfterTime( 1 + randomInt( 3 ) * 0.05 );
			}
		}

		wait( 0.05 );
	}

	if( doDamage )
		radiusDamage( endPos, 10, 140, 140, self );
}

deleteAfterTime( time )
{
	wait( time );

	self delete();
	level.FX_count --;
}

vecscale( vec, scalar )
{
	return ( vec[0] * scalar, vec[1] * scalar, vec[2] * scalar );
}
