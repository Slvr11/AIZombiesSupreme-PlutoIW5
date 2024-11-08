
//////////////////////////////////////////
//////////////////////////////////////////
///////////Flamethrower///////////
/////////////////////////////////////////


Init()
{
	level.ftWeapon = "tmp_silencer_mp";

	level.ftFX["flame"] = loadFX( "props/barrel_fire" );
	level.ftFX["impact"] = loadFX( "smoke/smoke_trail_black_heli" );

	level.FX_count = 0;

	level thread onPlayerConnected();
}

onPlayerConnected()
{
	for( ;; )
	{
		level waittill( "connected", player );

		player thread doflamegun();
	}
}

doflamegun()
{
	for( ;; )
	{
		self waittill( "weapon_fired", weaponName );

		if( self getCurrentWeapon() != level.ftWeapon )
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

		if( distance( startPos, pos ) > 1000 ) 
		{
			doDamage = 0;
			break;
		}

		trace = bulletTrace( startPos, pos, true, self );

		if( !bulletTracePassed( startPos, pos, true, self ) )
		{
			impactFX = spawnFX( level.ftFX["impact"], bulletTrace( startPos, pos, true, self )["position"] );
			level.FX_count ++;
			triggerFX( impactFX );

			wait( 0.2 );

			impactFX delete();
			level.FX_count --;
			
			break;
		}

		flameFX = spawnFX( level.ftFX["flame"], pos ); 
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
		self radiusDamage( endPos, 20, 40, 40, self );
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
