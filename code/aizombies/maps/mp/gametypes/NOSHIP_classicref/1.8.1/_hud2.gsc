#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;
#include AImod\_Mod;

Money()
{
	self endon("disconnect");
	self endon("death");
	while(1)
	{
		self.SecondaryHud[0] destroy();
		self.SecondaryHud[0] = self createFontString("objective", 1.5);
		self.SecondaryHud[0] setPoint("TOPRIGHT", "TOPRIGHT", 0, 0);
		self.SecondaryHud[0].foreground = true;
		self.SecondaryHud[0].alpha = 1;
		self.SecondaryHud[0].HideWhenInMenu = true;
		self.SecondaryHud[0].label = &"Money $";
		if(self.money <= 500)
		{
			self.SecondaryHud[0] setValue(self.money);
			self.SecondaryHud[0].color = (1,1,1);
			self.SecondaryHud[0].glowColor = (0.9,0.3,0.3);
			self.SecondaryHud[0].glowAlpha = 0.85;
		}
		else if(self.money <= 1000)
		{
			self.SecondaryHud[0] setValue(self.money);
			self.SecondaryHud[0].color = (1,1,1);
			self.SecondaryHud[0].glowColor = (1,1,0.5);
			self.SecondaryHud[0].glowAlpha = 0.85;
		}
		else
		{
			self.SecondaryHud[0] setValue(self.money);
			self.SecondaryHud[0].color = (1,1,1);
			self.SecondaryHud[0].glowColor = (0.3,0.9,0.3);
			self.SecondaryHud[0].glowAlpha = 0.85;
		}
		self.SecondaryHud[0] ChangeFontScaleOverTime( 0.1 );
		self.SecondaryHud[0].fontScale = 1.65;
		wait 0.1;
		self.SecondaryHud[0] ChangeFontScaleOverTime( 0.1 );
		self.SecondaryHud[0].fontScale = 1.5;
		self waittill("MONEY");
	}
}

IntermissionHud()
{
	self endon("disconnect");
	self.intermissionTimer[0] = self createFontString( "objective", 1.3 );
	self.intermissionTimer[0] setPoint( "TOP", "TOP", 0, 0 );
	self.intermissionTimer[0].color = (1, 0, 0);
	self.intermissionTimer[0].alpha = 1;
	self.intermissionTimer[1] = self createFontString( "hudbig", 0.9 );
	self.intermissionTimer[1] setPoint( "TOP", "TOP", 0, 15 );
	self.intermissionTimer[1].color = (1, 1, 0);
	self.intermissionTimer[1].alpha = 1;
	while(1)
	{
		if(level.IntermissionTime > 0)
		{
			self.intermissionTimer[0] setText(game["strings"]["MP_HORDE_BEGINS_IN"]);
			self.intermissionTimer[0].alpha = 1;
			self.intermissionTimer[1] setValue(level.IntermissionTime);
			self.intermissionTimer[1].alpha = 1;
			self.intermissionTimer[1] ChangeFontScaleOverTime( 0.1 );
			self.intermissionTimer[1].fontScale = 1.2;
			wait 0.1;
			self.intermissionTimer[1] ChangeFontScaleOverTime( 0.1 );
			self.intermissionTimer[1].fontScale = 0.9;
		}
		else
		{
			self.intermissionTimer[1] fadeOverTime( 1.00 );
			self.intermissionTimer[1].alpha = 0;
			wait 1;
			self.intermissionTimer[0] fadeOverTime( 1.00 );
			self.intermissionTimer[0].alpha = 0;
			wait 1;
			self.intermissionTimer[0] setText("");
			self.intermissionTimer[1] setText("");
		}
		wait 0.9;
	}
}

BonusPoints()
{
    self endon("disconnect");
	self endon("death");
	while(1)
	{
	    self.SecondaryHud[1] destroy();
		self.SecondaryHud[1] = self createFontString("objective", 1.5);
		self.SecondaryHud[1] setPoint("TOPRIGHT", "TOPRIGHT", 0, 15);
		self.SecondaryHud[1].foreground = true;
		self.SecondaryHud[1].alpha = 1;	
		self.SecondaryHud[1].HideWhenInMenu = true;
		self.SecondaryHud[1].label = &"Bonus Points: ";
		self.SecondaryHud[1] setValue(self.bonus);
		self.SecondaryHud[1].color = (1,1,1);
		self.SecondaryHud[1].glowColor = (0,1,1);
		self.SecondaryHud[1].glowAlpha = 0.85;
		self.SecondaryHud[1] ChangeFontScaleOverTime( 0.1 );
	    self.SecondaryHud[1].fontScale = 1.65;	
		wait 0.1;
	    self.SecondaryHud[1] ChangeFontScaleOverTime( 0.1 );
	    self.SecondaryHud[1].fontScale = 1.5;
		self waittill("BONUS");
	}
}

GrenadeHud()
{
	self endon("disconnect");
	self endon("death");
	self.SecondaryHud[3] = NewClientHudElem( self );
	self.SecondaryHud[3].alignX = "RIGHT";
	self.SecondaryHud[3].alignY = "TOP";
	self.SecondaryHud[3].horzAlign = "RIGHT";
	self.SecondaryHud[3].vertAlign = "TOP";
	self.SecondaryHud[3].x = 60;
	self.SecondaryHud[3].y = 365;
	self.SecondaryHud[3].HideWhenInMenu = true;
	self.SecondaryHud[3].foreground = true;
	self.SecondaryHud[3] setIconShader( "equipment_frag" );
	self.SecondaryHud[3] setIconSize( 40, 40 );
	self.SecondaryHud[3].alpha = 1;
	while(1)
	{
		self.GrenadeClip = self getWeaponAmmoClip("frag_grenade_mp");
		if(self getWeaponAmmoClip("frag_grenade_mp") >= 1)
		{
			self.SecondaryHud[3] setIconShader("equipment_frag");
			self.SecondaryHud[3] setIconSize( 40, 40 );
			self.SecondaryHud[3].alpha = 1;
			wait 1;
		}
		else
		{
			self.SecondaryHud[3].alpha = 0;
			wait 0.001;
		}
		wait 0.1;
	}
}

AkimboWeapons()
{
    self.akimbo = undefined;
	switch(self getCurrentWeapon())
	{
		case "beretta_akimbo_xmags_mp":
		self.akimbogun = "true";
		break;
		case "coltanaconda_akimbo_fmj_mp":
		self.akimbogun = "true";
		break;
		case "p90_akimbo_xmags_mp":
		self.akimbogun = "true";
		break;
		case "model1887_akimbo_fmj_mp":
		self.akimbogun = "true";
		break;
		case "deserteagle_akimbo_mp":
		self.akimbogun = "true";
		break;
		case "usp_akimbo_xmags_mp":
		self.akimbogun = "true";
		break;
		case "beretta393_akimbo_xmags_mp":
		self.akimbogun = "true";
		break;
		case "glock_akimbo_xmags_mp":
		self.akimbogun = "true";
		break;
		case "tmp_akimbo_xmags_mp":
		self.akimbogun = "true";
		break;
		case "ranger_akimbo_fmj_mp":
		self.akimbogun = "true";
		break;
		default:
		self.akimbogun = "false";
		break;
	}
}

AmmoHud()
{
	self endon("disconnect");
	self endon("death");
	if(!isDefined(self.ammoBoard))
	{
		self.ammoBoard = self createFontString( "default", 2 );
		self.ammoBoard setPoint( "TOPRIGHT", "TOPRIGHT", -60, 450);
		self.ammoBoard.HideWhenInMenu = true;
	}
	if(!isDefined(self.stockBoard))
	{
		self.stockBoard = self createFontString( "default", 2 );
		self.stockBoard setPoint( "TOPRIGHT", "TOPRIGHT", -20, 450);
		self.stockBoard.HideWhenInMenu = true;
	}
	if(!isDefined(self.stockBoard2))
	{
		self.stockBoard2 = self createFontString( "default", 2 );
		self.stockBoard2 setPoint( "TOPRIGHT", "TOPRIGHT", -90, 450);
		self.stockBoard2.HideWhenInMenu = true;
	}
	if(!isDefined(self.slash))
	{
		self.slash = self createFontString( "default", 1.9 );
		self.slash setPoint( "TOPRIGHT", "TOPRIGHT", -84, 450);
		self.slash.HideWhenInMenu = true;
	}
	while(1)
	{
		self.Clip = self getWeaponAmmoClip(self getCurrentWeapon());
		self.Clip2 = self getWeaponAmmoClip(self getCurrentWeapon(), "left");
		self.Stock = self getWeaponAmmoStock(self getCurrentWeapon());
		self.ammoBoard setValue(self.Clip);
		self.stockBoard setValue(self.Stock);
		self thread AkimboWeapons();
		if(self.akimbogun == "true")
		{
			self.slash setText("|");
		}
		else
		{
			self.slash setText("");
		}
		if(self getWeaponAmmoClip(self getCurrentWeapon()) <= 5)
		{
			self.ammoBoard.color = (1,0,0);
			self.ammoBoard.fontScale = 2.0;
			self.ammoBoard.glowColor = (0.9,0.3,0.3);
			self.ammoBoard.glowAlpha = 0.85;
		}
		else if(self getWeaponAmmoClip(self getCurrentWeapon()) <= 10)
		{
			self.ammoBoard.color = (1,1,0);
			self.ammoBoard.fontScale = 2.0;
			self.ammoBoard.glowColor = (0.9,0.9,0.3);
			self.ammoBoard.glowAlpha = 0.85;
		}
		else
		{
			self.ammoBoard.color = (0,1,0);
			self.ammoBoard.fontScale = 2.0;
			self.ammoBoard.glowColor = (0.3,0.9,0.3);
			self.ammoBoard.glowAlpha = 0.85;
		}
		if(self getCurrentWeapon() == "onemanarmy_mp")
		{
			self.ammoBoard setText("");
		}
		else if(self getCurrentWeapon() == "riotshield_mp")
		{
			self.ammoBoard setText("");
		}
		else if(self getCurrentWeapon() == "defaultweapon_mp")
		{
			self.ammoBoard setText("");
		}
		else if(self getCurrentWeapon() == "m240_xmags_mp")
		{
			self.ammoBoard setText("");
		}
		if(self getWeaponAmmoStock(self getCurrentWeapon()) <= 5)
		{
			self.stockBoard.color = (1,0,0);
			self.stockBoard.fontScale = 1.7;
			self.stockBoard.glowColor = (0.9,0.3,0.3);
			self.stockBoard.glowAlpha = 0.85;
		}
		else if(self getWeaponAmmoStock(self getCurrentWeapon()) <= 10)
		{
			self.stockBoard.color = (1,1,0);
			self.stockBoard.fontScale = 1.7;
			self.stockBoard.glowColor = (0.9,0.9,0.3);
			self.stockBoard.glowAlpha = 0.85;
		}
		else
		{
			self.stockBoard.color = (0,1,0);
			self.stockBoard.fontScale = 1.7;
			self.stockBoard.glowColor = (0.3,0.9,0.3);
			self.stockBoard.glowAlpha = 0.85;
		}
		if(self.akimbogun == "true" && self getWeaponAmmoClip(self getCurrentWeapon(), "left") <= 5)
		{
		    self.stockBoard2.color = (1,0,0);
			self.stockBoard2.fontScale = 2;
			self.stockBoard2.glowColor = (0.9,0.3,0.3);
			self.stockBoard2.glowAlpha = 0.85;
			self.stockBoard2 setValue(self.Clip2);
		}
		else if(self.akimbogun == "true" && self getWeaponAmmoClip(self getCurrentWeapon(), "left") <= 10)
		{
		    self.stockBoard2.color = (1,1,0);
			self.stockBoard2.fontScale = 2;
			self.stockBoard2.glowColor = (0.9,0.9,0.3);
			self.stockBoard2.glowAlpha = 0.85;
			self.stockBoard2 setValue(self.Clip2);
		}
		else if(self.akimbogun == "true" && self getWeaponAmmoClip(self getCurrentWeapon(), "left") >= 10)
		{
			self.stockBoard2.color = (0,1,0);
			self.stockBoard2.fontScale = 2;
			self.stockBoard2.glowColor = (0.3,0.9,0.3);
			self.stockBoard2.glowAlpha = 0.85;
			self.stockBoard2 setValue(self.Clip2);
		}
		else
		{
			self.stockBoard2 setText("");
		}
		if(self getCurrentWeapon() == "onemanarmy_mp")
		{
			self.stockBoard setText("");
		}
		if(self getCurrentWeapon() == "riotshield_mp")
		{
			self.stockBoard setText("");
		}
		if(self getCurrentWeapon() == "defaultweapon_mp")
		{
			self.stockBoard setText("");
		}
		if(self getCurrentWeapon() == "m240_xmags_mp")
		{
			self.stockBoard setText("");
		}
		wait 0.1;
	}
}

WeaponIcon() //New version of showing weapon
{
	self endon("disconnect");
	self endon("death");
	
	self.weaponicon destroy();
	self.weaponicon = NewClientHudElem( self );
	self.weaponicon.alignX = "12";
	self.weaponicon.alignY = "76";
	self.weaponicon.horzAlign = "right";
	self.weaponicon.vertAlign = "top";
	self.weaponicon.x = -30;
	self.weaponicon.y = 363;
	self.weaponicon.HideWhenInMenu = true;
	self.weaponicon.foreground = true;
	self.weaponicon.alpha = 1;
	while(1)
	{
		self.weaponicon scaleOverTime( 0.05, 0.1, 0.1 );
		self.weaponicon.color = (1,1,1);
		wait 0.05;
		switch( self getCurrentWeapon() )
		{
			case "usp_mp":
			self.weaponicon setIconShader("hud_icon_usp_45");
			self.weaponicon scaleOverTime( 0.05, 40, 40 );
			break;
			case "beretta_mp":
			self.weaponicon setIconShader("hud_icon_m9beretta");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "coltanaconda_mp":
			self.weaponicon setIconShader("hud_icon_colt_anaconda");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "deserteagle_mp":
			self.weaponicon setIconShader("hud_icon_desert_eagle");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "glock_mp":
			self.weaponicon setIconShader("hud_icon_glock");
			self.weaponicon scaleOverTime( 0.05, 40, 40 );
			break;
			case "beretta393_mp":
			self.weaponicon setIconShader("hud_icon_beretta393");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "mp5k_mp":
			self.weaponicon setIconShader("hud_icon_mp5k");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "pp2000_mp":
			self.weaponicon setIconShader("hud_icon_pp2000");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "pp2000_eotech_mp":
			self.weaponicon.color = (0.3,0.9,0.3);
			self.weaponicon setIconShader("hud_icon_pp2000");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "uzi_mp":
			self.weaponicon setIconShader("hud_icon_mini_uzi");
			self.weaponicon scaleOverTime( 0.05, 40, 40 );
			break;
			case "p90_mp":
			self.weaponicon setIconShader("hud_icon_p90");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "kriss_mp":
			self.weaponicon setIconShader("hud_icon_kriss");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "ump45_mp":
			self.weaponicon setIconShader("hud_icon_ump45");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "tmp_mp":
			self.weaponicon setIconShader("hud_icon_mp9");
			self.weaponicon scaleOverTime( 0.05, 40, 40 );
			break;
			case "ak47_mp":
			self.weaponicon setIconShader("hud_icon_ak47");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "m16_reflex_mp":
			self.weaponicon setIconShader("hud_icon_m16a4");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "m4_reflex_mp":
			self.weaponicon setIconShader("hud_icon_m4carbine");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "fn2000_mp":
			self.weaponicon setIconShader("hud_icon_fn2000");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "masada_mp":
			self.weaponicon setIconShader("hud_icon_masada");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "famas_mp":
			self.weaponicon setIconShader("hud_icon_famas");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "fal_mp":
			self.weaponicon setIconShader("hud_icon_fnfal");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "scar_mp":
			self.weaponicon setIconShader("hud_icon_scar_h");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "tavor_mp":
			self.weaponicon setIconShader("hud_icon_tavor");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "m79_mp":
			self.weaponicon setIconShader("hud_icon_m79");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "barrett_mp":
			self.weaponicon setIconShader("hud_icon_barrett50cal");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "rpg_mp":
			if(self.rpgup < 1)
			{
				self.weaponicon setIconShader("hud_icon_rpg");
				self.weaponicon scaleOverTime( 0.05, 80, 40 );
			}
			else if(self.rpgup == 1)
			{
				self.weaponicon setIconShader("hud_icon_rpg");
				self.weaponicon scaleOverTime( 1,0.5,0.3);
			}
			break;
			case "at4_mp":
			self.weaponicon setIconShader("hud_icon_at4");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "javelin_mp":
			self.weaponicon setIconShader("hud_icon_javelin");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "wa2000_acog_mp":
			self.weaponicon setIconShader("hud_icon_wa2000");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "m21_acog_mp":
			self.weaponicon setIconShader("hud_icon_m14ebr");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "cheytac_mp":
			self.weaponicon setIconShader("hud_icon_cheytac");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "ranger_mp":
			self.weaponicon setIconShader("hud_icon_sawed_off");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "model1887_mp":
			self.weaponicon setIconShader("hud_icon_model1887");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "model1887_fmj_mp":
			self.weaponicon setIconShader("hud_icon_model1887");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "striker_mp":
			self.weaponicon setIconShader("hud_icon_striker");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "aa12_mp":
			self.weaponicon setIconShader("hud_icon_aa12");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "m1014_mp":
			self.weaponicon setIconShader("hud_icon_benelli_m4");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "spas12_mp":
			self.weaponicon setIconShader("hud_icon_spas12");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "rpd_mp":
			self.weaponicon setIconShader("hud_icon_rpd");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "sa80_mp":
			self.weaponicon setIconShader("hud_icon_sa80");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "mg4_mp":
			self.weaponicon setIconShader("hud_icon_mg4");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "m240_grip_mp":
			self.weaponicon setIconShader("hud_icon_m240");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "m240_fmj_xmags_mp":
			self.weaponicon setIconShader("hud_icon_m240");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "aug_mp":
			self.weaponicon setIconShader("hud_icon_steyr");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "onemanarmy_mp":
			self.weaponicon setIconShader("hud_icon_m9beretta");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "defaultweapon_mp":
			self.weaponicon setIconShader("hud_icon_m240");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "m4_silencer_mp":
			self.weaponicon setIconShader("hud_icon_m4carbine");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "deserteaglegold_mp":
			self.weaponicon.color = (1,1,0.5);
			self.weaponicon setIconShader("hud_icon_desert_eagle");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "tmp_silencer_mp":
			self.weaponicon.color = (1,1,0.5);
			self.weaponicon setIconShader("hud_icon_mp9");
			self.weaponicon scaleOverTime( 0.05, 40, 40 );
			break;
			case "usp_akimbo_xmags_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_usp_45");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "ump45_eotech_xmags_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_ump45");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "beretta_akimbo_xmags_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_m9beretta");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "wa2000_acog_xmags_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_wa2000");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "m16_eotech_xmags_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_m16a4");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "famas_acog_fmj_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_famas");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "beretta393_akimbo_xmags_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_beretta393");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "ak47_fmj_xmags_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_ak47");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "aa12_grip_xmags_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_aa12");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "striker_xmags_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_striker");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "cheytac_fmj_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_cheytac");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "glock_akimbo_xmags_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_glock");
			self.weaponicon scaleOverTime( 0.05, 40, 40 );
			break;
			case "rpd_eotech_grip_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_rpd");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "ac130_25mm_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_m240");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "coltanaconda_akimbo_fmj_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_colt_anaconda");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "m4_eotech_shotgun_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_m4carbine");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "mp5k_fmj_xmags_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_mp5k");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "ak47_gl_thermal_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_ak47");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "gl_ak47_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_40mm_grenade");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "barrett_acog_xmags_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_barrett50cal");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "sa80_grip_xmags_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_sa80");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "m21_acog_xmags_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_m14ebr");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "spas12_grip_xmags_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_spas12");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "tmp_akimbo_xmags_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_mp9");
			self.weaponicon scaleOverTime( 0.05, 40, 40 );
			break;
			case "mg4_eotech_xmags_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_mg4");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "pp2000_fmj_reflex_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_pp2000");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "aug_eotech_xmags_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_steyr");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "m240_eotech_xmags_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_m240");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "m240_xmags_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_m240");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "tavor_fmj_reflex_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_tavor");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "kriss_reflex_rof_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_kriss");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "scar_eotech_xmags_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_scar_h");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "ranger_akimbo_fmj_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_sawed_off");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "p90_akimbo_xmags_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_p90");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "masada_reflex_xmags_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_masada");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "uzi_acog_silencer_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_mini_uzi");
			self.weaponicon scaleOverTime( 0.05, 40, 40 );
			break;
			case "model1887_akimbo_fmj_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_model1887");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "fn2000_reflex_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_fn2000");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "fal_reflex_xmags_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_fnfal");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "m1014_xmags_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_benelli_m4");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "tmp_silencer_xmags_mp":
			self.weaponicon.color = (1,1,0.5);
			self.weaponicon setIconShader("hud_icon_mp9");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "pp2000_eotech_xmags_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_pp2000");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "m4_acog_silencer_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_m4carbine");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "ranger_fmj_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_sawed_off");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
			case "stinger_mp":
			self.weaponicon.color = (0.9,0.3,0.3);
			self.weaponicon setIconShader("hud_icon_stinger");
			self.weaponicon scaleOverTime( 0.05, 60, 40 );
			break;
		}
		self waittill( "weapon_change" );
	}
}
	
WeaponText() //Old version of showing weapons
{
	self endon("disconnect");
	self endon("death");
	self.weapontext destroy();
	self.weapontext = self createFontString( "default", 2 );
	self.weapontext setPoint( "TOPRIGHT", "TOPRIGHT", -24, 430);
	self.weapontext.HideWhenInMenu = true;
	for(;;)
	{
		switch( self getCurrentWeapon() )
		{
			case "usp_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("USP.45");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "ump45_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("UMP-45");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "onemanarmy_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("OMA");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "beretta_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("M9");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "wa2000_acog_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("WA-2000 Acog Scope");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "m16_reflex_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("M16A4 Red Dot Sight");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "famas_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Famas");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "beretta393_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("M93 Raffica");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "ak47_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("AK-47");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "aa12_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("AA-12");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "striker_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Striker");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "cheytac_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Intervention Explosive Bullets");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "glock_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Glock-18");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "rpd_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("RPD");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "coltanaconda_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText(".44 Magnum");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "m4_reflex_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("M4A1 Red Dot Sight");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "mp5k_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("MP5K");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "at4_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("AT4-HS");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "barrett_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Barrett M82");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "sa80_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("L86");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "m21_acog_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("M14 EBR Acog Scope");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "spas12_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Spas-12");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "tmp_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("TMP");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "mg4_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("MG-4");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "pp2000_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("PP2000");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "aug_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("AUG LMG");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "m240_grip_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("M240 Grip");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "m240_fmj_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("M240 Grip+FMJ+Damage");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 0.9, 0.3,0.3 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "tavor_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("TAR-21");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "kriss_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Vector");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "scar_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("SCAR-L");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "ranger_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Double Barrel Shotgun");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "p90_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("P-90");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "masada_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Assault Combat Rifle");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "uzi_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Uzi");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "model1887_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Model 1887");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "fn2000_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("F2000");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "fal_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("FN-FAL");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "m1014_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("M1014");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "tmp_silencer_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("^3M2A1-7 Flamethrower");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (2,1,0);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "pp2000_eotech_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("^2Raygun");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0,1,0);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "deserteagle_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Desert Eagle");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "m4_silencer_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("M4A1 Silencer");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "ump45_eotech_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("UMPE-100 Holographic Sight");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.9,0.3,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "usp_akimbo_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("USP.50 Akimbo");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,0.9,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "deserteagle_akimbo_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("^2Mustang & Sally");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0,1,0);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "wa2000_acog_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("WAZOO 65");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0,1,0);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "m16_eotech_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("M16A10 Fully Auto Holo Sight");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,0.9,0.9);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "famas_acog_fmj_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Famas Fully Auto Acog Sight");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,0.9,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "beretta393_akimbo_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("FM93 Super Raffica Akimbo");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,0.9,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "ak47_fmj_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("AK-47 Extended Mags+FMJ");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (1,1,0.5);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "aa12_grip_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("AAA121 Grip Xmags");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,0.9,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "striker_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Killer Extended Mags");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.9,0.3,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "cheytac_fmj_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Intervention Super Bullets");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,0.9,0.5);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "glock_akimbo_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Noob 18 Akimbo");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (1,1,0.5);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "rpd_eotech_grip_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("RPDK Holographic Sight");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.9,0.3,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "coltanaconda_akimbo_fmj_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Python Akimbo");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,1,1);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "m4_eotech_shotgun_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("M4A4 Holographic With Shotgun");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,0.9,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "mp5k_fmj_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("MP5K Extreme Bullets");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,0.9,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "gl_ak47_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Grenade Launcher AK-84");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.9,0.3,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "barrett_acog_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Barrett M92 Extreme");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.9,0.3,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "sa80_grip_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("The Grappler");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.9,0.3,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "m21_acog_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("M14 Jakmle");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,0.9,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "spas12_grip_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Titanic Shotgun");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,1,1);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "tmp_akimbo_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("KMP Akimbo Extended Mags");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,0.9,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "mg4_eotech_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("MG-8 Holographic Sight");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.9,0.3,0.9);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "pp2000_fmj_reflex_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("PP4000");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.9,0.3,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "aug_eotech_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("ASG LMG Holographic Sight");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,0.9,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "m240_eotech_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Makarov");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,0.9,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "tavor_fmj_reflex_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("TAR-21 Mars Sight");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,0.9,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "kriss_reflex_rof_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Hector");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,0.9,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "scar_eotech_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("SCAR-BBQ Hologrpahic Sight");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.9,0.3,0.9);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "ranger_akimbo_fmj_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Double Barrel Shotgun Akimbo");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.9,0.3,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "p90_akimbo_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Akimbo Madness");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,0.9,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "masada_reflex_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("GaYCR");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.9,0.3,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "uzi_acog_silencer_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Super UZI ACOG");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,0.9,0.9);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "model1887_akimbo_fmj_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Arnold PW?NS");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.9,0.3,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "fn2000_reflex_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("F4000");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,0.9,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "fal_reflex_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Ep!c Win");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,0.9,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "m1014_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("M2028");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,0.9,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "tmp_silencer_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Flamethrower");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (1,1,0.5);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "pp2000_eotech_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Porters X2 Raygun");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.9,0.3,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "deserteaglegold_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Golden Ownage");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (1,1,0.5);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "m4_acog_silencer_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("M4A6 ACOG Silencer");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.9,0.9,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "ac130_105mm_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("^1AC-130 105MM");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (1,0,0);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "rpg_mp": 
			if(self.rpgup < 1)
			{
				self.weapontext.alpha = 1.0;
				self.weapontext setText("RPG-7");
				self.weapontext.fontScale = 1.650;
				self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
				self.weapontext.glowAlpha = 1;
				self.weapontext ChangeFontScaleOverTime( 0.1 );
				self.weapontext.fontScale = 1.900;
				wait 0.1;
				self.weapontext ChangeFontScaleOverTime( 0.1 );
				self.weapontext.fontScale = 1.650;
				self.weapontext fadeOverTime( 3.00 );
				self.weapontext.alpha = 0;
			}
			if(self.rpgup == 1) 
			{
				self.weapontext.alpha = 1.0;
				self.weapontext setText("RPG-27");
				self.weapontext.fontScale = 1.650;
				self.weapontext.glowColor = (0.3,0.9,0.3);
				self.weapontext.glowAlpha = 1;
				self.weapontext ChangeFontScaleOverTime( 0.1 );
				self.weapontext.fontScale = 1.900;
				wait 0.1;
				self.weapontext ChangeFontScaleOverTime( 0.1 );
				self.weapontext.fontScale = 1.650;
				self.weapontext fadeOverTime( 3.00 );
				self.weapontext.alpha = 0;
			}
			break;
			case "m79_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Thumper");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = ( 25.5, 25.5, 3.6 );
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "ranger_fmj_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Spaz+Model+Ranger");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.9,0.9,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "ak47_gl_thermal_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("AK-47 Thermal No Recoil");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,0.9,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "riotshield_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("RiotShield");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,0.9,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "defaultweapon_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Hand Gun");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (1,1,1);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "m240_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Death Machine");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,0.3,0.9);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "ac130_25mm_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("^1Machine Gun");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (1,0,0);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "wa2000_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("WA2000 ACOG");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,0.9,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "airdrop_marker_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("^2Airdrop Marker");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0,1,0);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "airdrop_mega_marker_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("^2Large Airdrop Marker");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0,1,0);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "model1887_fmj_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Model 1887 FMJ");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.9,0.3,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "beretta_akimbo_xmags_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Mustang & Sally");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,0.3,0.9);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "killstreak_uav_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Morter Team");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,0.9,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "killstreak_ac130_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("^2AC-130");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0,1,0);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "killstreak_predator_missile_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Predator Missile");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.3,0.9,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "killstreak_nuke_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Tactical Nuke");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (1,1,0.5);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "killstreak_counter_uav_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Morter Team");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.9,0.3,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "killstreak_emp_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("EMP");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (1,1,0.5);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "javelin_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Javelin");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (1,1,1);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
			case "stinger_mp": self.weapontext.alpha = 1.0;
			self.weapontext setText("Javlin Pro");
			self.weapontext.fontScale = 1.650;
			self.weapontext.glowColor = (0.9,0.3,0.3);
			self.weapontext.glowAlpha = 1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.900;
			wait 0.1;
			self.weapontext ChangeFontScaleOverTime( 0.1 );
			self.weapontext.fontScale = 1.650;
			self.weapontext fadeOverTime( 3.00 );
			self.weapontext.alpha = 0;
			break;
		}
		self waittill( "weapon_change" );
	}
}