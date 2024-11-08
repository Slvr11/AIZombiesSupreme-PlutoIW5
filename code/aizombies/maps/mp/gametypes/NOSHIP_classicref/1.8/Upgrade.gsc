#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;

giveUpgradedWeapon(pos, angle, gunup)
{
	self endon("disconnect");
	self endon("death");
	self endon("upgrade_weapon_take");
	if(gunup == "ump45_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("ump45_eotech_xmags_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("ump45_eotech_xmags_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "ump45_eotech_xmags_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "usp_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("usp_akimbo_xmags_mp"));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("usp_akimbo_xmags_mp");
		level.upgradeweapon2 = spawn("script_model", pos+(3,3,0));
		level.upgradeweapon2 setModel(GetWeaponModel("usp_akimbo_xmags_mp"));
		level.upgradeweapon2.angles = angle;
		level.upgradeweapon2 thread HideGunParts("usp_akimbo_xmags_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		level.upgradeweapon2 MoveTo(pos+(3,3,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "usp_akimbo_xmags_mp", level.upgradeweapon, level.upgradeweapon2);
		level.upgradeweapon MoveTo(pos+(0,0,10), 10);
		level.upgradeweapon2 MoveTo(pos+(3,3,10), 10);
		wait 10;
		level.upgradeweapon delete();
		level.upgradeweapon2 delete();
		self notify("upgrade_gone");
		self.weapons = 0;	
	}
	else if(gunup == "beretta_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("beretta_akimbo_xmags_mp"));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("beretta_akimbo_xmags_mp");
		level.upgradeweapon2 = spawn("script_model", pos+(3,3,0));
		level.upgradeweapon2 setModel(GetWeaponModel("beretta_akimbo_xmags_mp"));
		level.upgradeweapon2.angles = angle;
		level.upgradeweapon2 thread HideGunParts("beretta_akimbo_xmags_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		level.upgradeweapon2 MoveTo(pos+(3,3,40), 2);
		wait 2;
		self thread M9Upgraded();
		self thread WatchM9Ammo();
		self thread giveWeaponUpgrade(pos, "beretta_akimbo_xmags_mp", level.upgradeweapon, level.upgradeweapon2);
		level.upgradeweapon MoveTo(pos+(0,0,10), 10);
		level.upgradeweapon2 MoveTo(pos+(3,3,10), 10);
		wait 10;
		level.upgradeweapon delete();
		level.upgradeweapon2 delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "wa2000_acog_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("wa2000_acog_xmags_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("wa2000_acog_xmags_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "wa2000_acog_xmags_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "m16_reflex_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("m16_eotech_xmags_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("m16_eotech_xmags_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self setClientDvar( "player_burstFireCooldown", "0" );
		self thread giveWeaponUpgrade(pos, "m16_eotech_xmags_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "famas_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("famas_acog_fmj_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("famas_acog_fmj_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self setClientDvar( "player_burstFireCooldown", "0" );
		self thread giveWeaponUpgrade(pos, "famas_acog_fmj_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "beretta393_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("beretta393_akimbo_xmags_mp"));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("beretta393_akimbo_xmags_mp");
		level.upgradeweapon2 = spawn("script_model", pos+(3,3,0));
		level.upgradeweapon2 setModel(GetWeaponModel("beretta393_akimbo_xmags_mp"));
		level.upgradeweapon2.angles = angle;
		level.upgradeweapon2 thread HideGunParts("beretta393_akimbo_xmags_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		level.upgradeweapon2 MoveTo(pos+(3,3,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "beretta393_akimbo_xmags_mp", level.upgradeweapon, level.upgradeweapon2);
		self setClientDvar( "player_burstFireCooldown", "0" );
		level.upgradeweapon MoveTo(pos+(0,0,10), 10);
		level.upgradeweapon2 MoveTo(pos+(3,3,10), 10);
		wait 10;
		level.upgradeweapon delete();
		level.upgradeweapon2 delete();
		self notify("upgrade_gone");
		self.weapons = 0;	
	}
	else if(gunup == "ak47_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("ak47_fmj_xmags_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("ak47_fmj_xmags_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "ak47_fmj_xmags_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "aa12_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("aa12_grip_xmags_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("aa12_grip_xmags_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "aa12_grip_xmags_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "striker_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("striker_xmags_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("striker_xmags_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "striker_xmags_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "cheytac_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("cheytac_fmj_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("cheytac_fmj_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "cheytac_fmj_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "glock_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("glock_akimbo_xmags_mp"));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("glock_akimbo_xmags_mp");
		level.upgradeweapon2 = spawn("script_model", pos+(3,3,0));
		level.upgradeweapon2 setModel(GetWeaponModel("glock_akimbo_xmags_mp"));
		level.upgradeweapon2.angles = angle;
		level.upgradeweapon2 thread HideGunParts("glock_akimbo_xmags_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		level.upgradeweapon2 MoveTo(pos+(3,3,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "glock_akimbo_xmags_mp", level.upgradeweapon, level.upgradeweapon2);
		level.upgradeweapon MoveTo(pos+(0,0,10), 10);
		level.upgradeweapon2 MoveTo(pos+(3,3,10), 10);
		wait 10;
		level.upgradeweapon delete();
		level.upgradeweapon2 delete();
		self notify("upgrade_gone");
		self.weapons = 0;	
	}
	else if(gunup == "rpd_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("rpd_eotech_grip_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("rpd_eotech_grip_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "rpd_eotech_grip_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "onemanarmy_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("m240_fmj_xmags_mp"));
		level.upgradeweapon.angles = angle;
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "m240_fmj_xmags_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "coltanaconda_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("coltanaconda_akimbo_fmj_mp"));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon2 = spawn("script_model", pos+(3,3,0));
		level.upgradeweapon2 setModel(GetWeaponModel("coltanaconda_akimbo_fmj_mp"));
		level.upgradeweapon2.angles = angle;
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		level.upgradeweapon2 MoveTo(pos+(3,3,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "coltanaconda_akimbo_fmj_mp", level.upgradeweapon, level.upgradeweapon2);
		level.upgradeweapon MoveTo(pos+(0,0,10), 10);
		level.upgradeweapon2 MoveTo(pos+(3,3,10), 10);
		wait 10;
		level.upgradeweapon delete();
		level.upgradeweapon2 delete();
		self notify("upgrade_gone");
		self.weapons = 0;	
	}
	else if(gunup == "m4_reflex_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("m4_eotech_shotgun_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("m4_eotech_shotgun_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "m4_eotech_shotgun_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "mp5k_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("mp5k_fmj_xmags_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("mp5k_fmj_xmags_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "mp5k_fmj_xmags_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "at4_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("ak47_gl_thermal_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("ak47_gl_thermal_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "ak47_gl_thermal_mp", level.upgradeweapon);
		self thread NoRecoilAk47();
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "barrett_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("barrett_acog_xmags_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("barrett_acog_xmags_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread NoRecoilBarret();
		self thread giveWeaponUpgrade(pos, "barrett_acog_xmags_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "sa80_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("sa80_grip_xmags_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("sa80_grip_xmags_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "sa80_grip_xmags_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "m21_acog_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("m21_acog_xmags_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("m21_acog_xmags_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "m21_acog_xmags_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "spas12_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("spas12_grip_xmags_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("spas12_grip_xmags_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "spas12_grip_xmags_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "tmp_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("tmp_akimbo_xmags_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("tmp_akimbo_xmags_mp");
		level.upgradeweapon2 = spawn("script_model", pos+(3,3,0));
		level.upgradeweapon2 setModel(GetWeaponModel("tmp_akimbo_xmags_mp",8));
		level.upgradeweapon2.angles = angle;
		level.upgradeweapon2 thread HideGunParts("tmp_akimbo_xmags_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		level.upgradeweapon2 MoveTo(pos+(3,3,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "tmp_akimbo_xmags_mp", level.upgradeweapon, level.upgradeweapon2);
		level.upgradeweapon MoveTo(pos, 10);
		level.upgradeweapon2 MoveTo(pos+(3,3,10), 10);
		wait 10;
		level.upgradeweapon delete();
		level.upgradeweapon2 delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "mg4_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("mg4_eotech_xmags_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("mg4_eotech_xmags_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "mg4_eotech_xmags_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "pp2000_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("pp2000_fmj_reflex_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("pp2000_fmj_reflex_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "pp2000_fmj_reflex_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "aug_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("aug_eotech_xmags_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("aug_eotech_xmags_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "aug_eotech_xmags_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "m240_grip_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("m240_eotech_xmags_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("m240_eotech_xmags_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "m240_eotech_xmags_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "tavor_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("tavor_fmj_reflex_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("tavor_fmj_reflex_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "tavor_fmj_reflex_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "kriss_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("kriss_reflex_rof_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("kriss_reflex_rof_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "kriss_reflex_rof_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "scar_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("scar_eotech_xmags_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("scar_eotech_xmags_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "scar_eotech_xmags_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "ranger_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("ranger_akimbo_fmj_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("ranger_akimbo_fmj_mp");
		level.upgradeweapon2 = spawn("script_model", pos+(3,3,0));
		level.upgradeweapon2 setModel(GetWeaponModel("ranger_akimbo_fmj_mp"));
		level.upgradeweapon2.angles = angle;
		level.upgradeweapon2 thread HideGunParts("ranger_akimbo_fmj_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		level.upgradeweapon2 MoveTo(pos+(3,3,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "ranger_akimbo_fmj_mp", level.upgradeweapon, level.upgradeweapon2);
		level.upgradeweapon MoveTo(pos+(0,0,10), 10);
		level.upgradeweapon2 MoveTo(pos+(3,3,10), 10);
		wait 10;
		level.upgradeweapon delete();
		level.upgradeweapon2 delete();
		self notify("upgrade_gone");
		self.weapons = 0;	
	}
	else if(gunup == "p90_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("p90_akimbo_xmags_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("p90_akimbo_xmags_mp");
		level.upgradeweapon2 = spawn("script_model", pos+(3,3,0));
		level.upgradeweapon2 setModel(GetWeaponModel("p90_akimbo_xmags_mp",8));
		level.upgradeweapon2.angles = angle;
		level.upgradeweapon2 thread HideGunParts("p90_akimbo_xmags_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		level.upgradeweapon2 MoveTo(pos+(3,3,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "p90_akimbo_xmags_mp", level.upgradeweapon, level.upgradeweapon2);
		level.upgradeweapon MoveTo(pos+(0,0,10), 10);
		level.upgradeweapon2 MoveTo(pos+(3,3,10), 10);
		wait 10;
		level.upgradeweapon delete();
		level.upgradeweapon2 delete();
		self notify("upgrade_gone");
		self.weapons = 0;	
	}
	else if(gunup == "masada_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("masada_reflex_xmags_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("masada_reflex_xmags_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "masada_reflex_xmags_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "uzi_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("uzi_acog_silencer_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("uzi_acog_silencer_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "uzi_acog_silencer_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "model1887_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("model1887_akimbo_fmj_mp"));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon2 = spawn("script_model", pos+(3,3,0));
		level.upgradeweapon2 setModel(GetWeaponModel("model1887_akimbo_fmj_mp"));
		level.upgradeweapon2.angles = angle;
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		level.upgradeweapon2 MoveTo(pos+(3,3,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "model1887_akimbo_fmj_mp", level.upgradeweapon, level.upgradeweapon2);
		level.upgradeweapon MoveTo(pos+(0,0,10), 10);
		level.upgradeweapon2 MoveTo(pos+(3,3,10), 10);
		wait 10;
		level.upgradeweapon delete();
		level.upgradeweapon2 delete();
		self notify("upgrade_gone");
		self.weapons = 0;	
	}
	else if(gunup == "fn2000_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("fn2000_reflex_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("fn2000_reflex_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "fn2000_reflex_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "fal_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("fal_reflex_xmags_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("fal_reflex_xmags_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "fal_reflex_xmags_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "m1014_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("m1014_xmags_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("m1014_xmags_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "m1014_xmags_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "tmp_silencer_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("tmp_silencer_xmags_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("tmp_silencer_xmags_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "tmp_silencer_xmags_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "pp2000_eotech_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("pp2000_eotech_xmags_mp",6));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("pp2000_eotech_xmags_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "pp2000_eotech_xmags_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "coltanaconda_akimbo_mp" && getdvar("mapname") == "mp_underpass")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("coltanaconda_akimbo_fmj_mp"));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("coltanaconda_akimbo_fmj_mp");
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "coltanaconda_akimbo_fmj_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "deserteagle_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("deserteaglegold_mp"));
		level.upgradeweapon.angles = angle;
		self.upgrade = 1;
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "deserteaglegold_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "m4_silencer_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("m4_acog_silencer_mp",8));
		level.upgradeweapon.angles = angle;
		level.upgradeweapon thread HideGunParts("m4_acog_silencer_mp");
		self.upgrade = 1;
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread giveWeaponUpgrade(pos, "m4_acog_silencer_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "model1887_fmj_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("ranger_fmj_mp"));
		level.upgradeweapon.angles = angle;
		self.upgrade = 1;
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread RangereXtreme();
		self thread giveWeaponUpgrade(pos, "ranger_fmj_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else if(gunup == "javelin_mp")
	{
		level.upgradeweapon = spawn("script_model", pos);
		level.upgradeweapon setModel(GetWeaponModel("stinger_mp"));
		level.upgradeweapon.angles = angle;
		self.upgrade = 1;
		wait 0.4;
		level.upgradeweapon MoveTo(pos+(0,0,40), 2);
		wait 2;
		self thread JavelinPro();
		self thread giveWeaponUpgrade(pos, "stinger_mp", level.upgradeweapon);
		level.upgradeweapon MoveTo(pos, 10);
		wait 10;
		level.upgradeweapon delete();
		self notify("upgrade_gone");
		self.weapons = 0;
	}
	else
	{
	    self _giveWeapon(gunup, 8);
		self switchToWeapon(gunup);
		self.money += 5000;
		self notify("MONEY");
	}
}

giveWeaponUpgrade(pos, weap, upgradeweapon, upgradeweapon2)
{
	self endon("disconnect");
	self endon("upgrade_gone");
	while(1)
	{
	    self thread  maps\mp\gametypes\BoxText::TakeUpgradeWeaponText(weap);
		if(Distance(pos, self.origin) <= 75)
		{
			self setLowerMessage("upgradetrade", "Hold ^3[{+activate}]^7 to take ^2" + level.takeupgradetext );
		}
		else
		{
			if(Distance(pos, self.origin) >50) self ClearLowerMessage("upgradetrade", 1);
		}
		if(Distance(pos, self.origin) <= 75 && self useButtonPressed())
		{
			self ClearLowerMessage("upgradetrade", 1);
			self notify("newWeapon");
			wait 0.1;
			if(weap == "pp2000_eotech_xmags_mp")
				self _giveWeapon(weap, 6);
			else
				self _giveWeapon(weap, 8);
			self switchToWeapon(weap);
			self giveMaxAmmo(weap);
			upgradeweapon delete();
			upgradeweapon2 delete();
			self notify("upgrade_weapon_take");
			self notify("upgrade_gone");
			wait 0.01;
		}
		wait 0.01;
	}
}

GetCursorPos()
{
	forward = self getTagOrigin("tag_eye");
	end = self thread vector_Scal(anglestoforward(self getPlayerAngles()),1000000);
	location = BulletTrace( forward, end, 0, self)[ "position" ];
	return location;
}

M9Upgraded()
{
	self endon("death");
	for(;;)
	{
		self waittill( "weapon_fired", gun );
		if ( gun == "beretta_akimbo_xmags_mp" )
		{
			MagicBullet( "gl_mp", self getTagOrigin("tag_eye"), self GetCursorPos(), self );
		}
	}
}

WatchM9Ammo()
{
	self endon("death");
	while(1)
	{
		if(self getWeaponAmmoStock("beretta_akimbo_xmags_mp") > 50)
		{
			self setWeaponAmmoStock("beretta_akimbo_xmags_mp", 50);
		}
		wait 0.5;
	}
}

JavelinPro()
{
	self endon("death");
	for(;;)
	{
	    self setWeaponAmmoClip( "stinger_mp", 0 );
		self setWeaponAmmoStock( "stinger_mp", 0 );
		if(self AttackButtonPressed() && self getCurrentWeapon() == "stinger_mp")
		{
		    switch(randomInt(3))
			{
			    case 0:
				MagicBullet( "javelin_mp", self getTagOrigin("tag_eye"), self GetCursorPos(), self );
				break;
				case 1:
				MagicBullet( "rpg_mp", self getTagOrigin("tag_eye"), self GetCursorPos(), self );
				break;
				case 2:
				MagicBullet( "ac130_105mm_mp", self getTagOrigin("tag_eye"), self GetCursorPos(), self );
				break;
			}
			self iPrintlnBold("Reloading wait 5 seconds");
			wait 1;
			self iPrintlnBold("5 seconds");
			wait 1;
			self iPrintlnBold("4 seconds");
			wait 1;
			self iPrintlnBold("3 seconds");
			wait 1;
			self iPrintlnBold("2 seconds");
			wait 1;
			self iPrintlnBold("1 seconds");
			wait 1;
			self iPrintlnBold("Weapon Ready to Fire");
		}
		wait 0.01;
	}
}

Javlin()
{
	for(;;)
	{
	    self setWeaponAmmoClip( "javelin_mp", 0 );
		self setWeaponAmmoStock( "javelin_mp", 0 );
		if(self AttackButtonPressed() && self getCurrentWeapon() == "javelin_mp")
		{
			MagicBullet( "javelin_mp", self getTagOrigin("tag_eye"), self GetCursorPos(), self );
			self iPrintlnBold("Reloading wait 15 seconds");
			wait 1;
			self iPrintlnBold("14 seconds");
			wait 1;
			self iPrintlnBold("13 seconds");
			wait 1;
			self iPrintlnBold("12 seconds");
			wait 1;
			self iPrintlnBold("11 seconds");
			wait 1;
			self iPrintlnBold("10 seconds");
			wait 1;
			self iPrintlnBold("9 seconds");
			wait 1;
			self iPrintlnBold("8 seconds");
			wait 1;
			self iPrintlnBold("7 seconds");
			wait 1;
			self iPrintlnBold("6 seconds");
			wait 1;
			self iPrintlnBold("5 seconds");
			wait 1;
			self iPrintlnBold("4 seconds");
			wait 1;
			self iPrintlnBold("3 seconds");
			wait 1;
			self iPrintlnBold("2 seconds");
			wait 1;
			self iPrintlnBold("1 seconds");
			wait 1;
			self iPrintlnBold("Weapon Ready to Fire");
		}
		wait 0.01;
	}
}

RangereXtreme()
{
	self endon("death");
	for(;;)
	{
		self waittill( "weapon_fired" );
		if ( self getCurrentWeapon() == "ranger_fmj_mp" )
		{
			MagicBullet( "spas12_grip_mp", self getTagOrigin("tag_eye"), self GetCursorPos(), self );
			MagicBullet( "model1887_mp", self getTagOrigin("tag_eye"), self GetCursorPos(), self );
			MagicBullet( "cheytac_fmj_mp", self getTagOrigin("tag_eye"), self GetCursorPos(), self );
			switch(randomInt(30))
			{
			    case 1:
				MagicBullet( "rpg_mp", self getTagOrigin("tag_eye"), self GetCursorPos(), self );
				break;
				case 20:
				MagicBullet( "ac130_40mm_mp", self getTagOrigin("tag_eye"), self GetCursorPos(), self );
				break;
				case 10:
				MagicBullet( "m79_mp", self getTagOrigin("tag_eye"), self GetCursorPos(), self );
				break;
			}
		}
	}
}

vector_scal(vec, scale)
{
	vec = (vec[0] * scale, vec[1] * scale, vec[2] * scale);
	return vec;
}

NoRecoilAk47()
{
	while(1)
	{
		if(self getCurrentWeapon() == "ak47_gl_thermal_mp")
		{
			self player_recoilScaleOn(0);
		}
		if(self getCurrentWeapon() != "ak47_gl_thermal_mp")
		{
			self player_recoilScaleOn(100);
		}
		wait 0.1;
	}
}

NoRecoilBarret()
{
	while(1)
	{
		if(self getCurrentWeapon() == "barrett_acog_xmags_mp")
		{
			self player_recoilScaleOn(0);
		}
		if(self getCurrentWeapon() != "barrett_acog_xmags_mp")
		{
			self player_recoilScaleOn(100);
		}
		wait 0.1;
	}
}