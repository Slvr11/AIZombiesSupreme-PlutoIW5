#include maps\mp\_utility;

init()
{
	precacheVehicle( "littlebird_mp" );
	precacheModel( "com_plasticcase_friendly" );
	precacheModel( "com_plasticcase_enemy");
	precacheModel( "com_plasticcase_trap_friendly" );
	precacheModel( "vehicle_little_bird_armed_mp" );
	precacheModel( "vehicle_ac130_low_mp" );
	precacheShader( "compassping_enemy" );
	precacheShader( "compass_objpoint_c130_friendly" );
}

deleteCrate()
{
	if ( isDefined( self.objIdFriendly ) )
		_objective_delete( self.objIdFriendly );

	if ( isDefined( self.objIdEnemy ) )
		_objective_delete( self.objIdEnemy );

	if ( isDefined( self.bomb ) && isDefined( self.bomb.killcamEnt ) )
		self.bomb.killcamEnt delete();

	if ( isDefined( self.bomb ) )
		self.bomb delete();

	if( IsDefined( self.killCamEnt ) )
		self.killCamEnt delete();

	self delete();
}

isAirdropMarker( weaponName )
{
	switch ( weaponName )
	{
		case "airdrop_marker_mp":
		case "airdrop_mega_marker_mp":
		case "airdrop_sentry_marker_mp":
		case "airdrop_juggernaut_mp":
		case "airdrop_juggernaut_def_mp":
			return true;
		default:
			return false;
	}
}

getFlyHeightOffset( dropSite )
{
	lbFlyHeight = 850;
	
	heightEnt = GetEnt( "airstrikeheight", "targetname" );
	
	if ( !isDefined( heightEnt ) )//old system 
	{
		/#
		println( "NO DEFINED AIRSTRIKE HEIGHT SCRIPT_ORIGIN IN LEVEL" );
		#/
		if ( isDefined( level.airstrikeHeightScale ) )
		{	
			if ( level.airstrikeHeightScale > 2 )
			{
				lbFlyHeight = 1500;
				return( lbFlyHeight * (level.airStrikeHeightScale ) );
			}
			
			return( lbFlyHeight * level.airStrikeHeightScale + 256 + dropSite[2] );
		}
		else
			return ( lbFlyHeight + dropsite[2] );	
	}
	else
	{
		return heightEnt.origin[2];
	}
	
}

beginAirdropViaMarker( lifeId, kID, dropType )
{	
	return false;
}

dropTheCrate( dropPoint, dropType, lbHeight, dropImmediately, crateOverride, startPos, dropImpulse, previousCrateTypes, tagName )
{
	return crateOverride;
}