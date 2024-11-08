#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

init()
{
	level.killcam = false;
}

killcam(
	attackerNum, // entity number of the attacker
	killcamentityindex, // entity number of the entity to view (grenade, airstrike, etc)
	killcamentitystarttime, // time at which the killcamentity came into being
	sWeapon, // killing weapon
	predelay, // time between player death and beginning of killcam
	offsetTime, // something to do with how far back in time the killer was seeing the world when he made the kill; latency related, sorta
	timeUntilRespawn, // will the player be allowed to respawn after the killcam?
	maxtime, // time remaining until map ends; the killcam will never last longer than this. undefined = no limit
	attacker, // entity object of attacker
	victim // entity object of the victim
)
{
}

waitDeathCopyCatButton( attacker )
{
}

cancelKillCamOnUse()
{
}