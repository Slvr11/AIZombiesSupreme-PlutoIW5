#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_multi;
#include AImod\animation;
#include AImod\_OtherFunctions;
#include AImod\_round_utility;
#include AImod\_weapon;
#include AImod\_text;
#using_animtree("multiplayer");

Init()
{
	/* Regular Animations */
	precacheMpAnim("pb_sprint_gundown");
	precacheMpAnim("pb_sprint_akimbo");
	precacheMpAnim("pb_sprint_mg");
	precacheMpAnim("pb_pistol_run_fast");
	precacheMpAnim("pb_sprint_pistol");
	precacheMpAnim("pb_combatrun_forward_loop_stickgrenade");
	precacheMpAnim("pb_sprint_shield");
	precacheMpAnim("pb_walk_forward_shield");
	precacheMpAnim("pb_combatwalk_forward_loop_pistol");
	precacheMpAnim("pb_walk_forward_mg");
	/* Bot Animations */
	precacheMpAnim("pb_stand_alert");
	precacheMpAnim("pb_stand_shoot_walk_forward");
	precacheMpAnim("pt_reload_stand_auto_mp40");
	precacheMpAnim("pt_stand_shoot_auto");
	precacheMpAnim("pb_stand_alert_mg");
	precacheMpAnim("pt_reload_stand_mg");
	precacheMpAnim("pt_stand_shoot_mg");
	/* Regular Death Anim */
	precacheMpAnim("pb_stand_death_leg_kickup");
	precacheMpAnim("pb_stand_death_shoulderback");
	precacheMpAnim("pb_death_run_stumble");
	if(getDvar("mapname") == "mp_afghan" || getDvar("mapname") == "mp_trailerpark" || getDvar("mapname") == "mp_estate")
	{
		precacheMpAnim("pb_shotgun_death_front");
		precacheMpAnim("pb_crouch_death_falltohands");
		precacheMpAnim("pb_crouchrun_death_drop");
		precacheMpAnim("pb_death_run_onfront");
		precacheMpAnim("pb_stand_death_head_straight_back");
		precacheMpAnim("pb_crouchrun_death_drop");
	}
	/* Pain Anim */
	precacheMpAnim("pb_stumble_forward");
	/* Crawling Animations */
	precacheMpAnim("pb_prone_crawl_akimbo");
	precacheMpAnim("pb_prone_death_quickdeath");
	/* Melee Animation */
	precacheMpAnim("pt_melee_pistol_1");

	level.bloodfx = loadfx("impacts/flesh_hit_body_fatal_exit");
	level.nukefx = loadfx("explosions/player_death_nuke");
	level.nuke2fx = loadfx("explosions/player_death_nuke_flash");
	level.empfx = loadfx("explosions/emp_flash_mp");
}

BonusDrops()
{
    self endon("disconnect");
	self endon("bonus_end");
	self endon("bot_is_dead");
	random = randomInt(45);
	randomequels = randomInt(45);
	randomequels2 = randomInt(45);
	self waittill("bot_death");
	if(level.Wave <= 5)
	{
		if(random == randomequels)
		{
			switch(randomInt(7))
			{
			    case 0:
				FreezerDrop(self.origin, self.angles);
				break;
			    case 1:
				NukeDrop(self.origin, self.angles);
				break;
				case 2:
				MoneyDrop(self.origin, self.angles);
				break;
				case 3:
				AdrenalineDrop(self.origin, self.angles);
				break;
				case 4:
				InfiniteAmmoDrop(self.origin, self.angles);
				break;
				case 5:
				DeathMachineDrop(self.origin, self.angles);
				break;
				case 6:
				AmmoDrop(self.origin, self.angles);
				break;
			}
		}
	}
	if(level.Wave >= 5)
	{
		if(random == randomequels == randomequels2)
		{
			switch(randomInt(7))
			{
			    case 0:
				FreezerDrop(self.origin, self.angles);
				break;
			    case 1:
				NukeDrop(self.origin, self.angles);
				break;
				case 2:
				MoneyDrop(self.origin, self.angles);
				break;
				case 3:
				AdrenalineDrop(self.origin, self.angles);
				break;
				case 4:
				InfiniteAmmoDrop(self.origin, self.angles);
				break;
				case 5:
				DeathMachineDrop(self.origin, self.angles);
				break;
				case 6:
				AmmoDrop(self.origin, self.angles);
				break;
			}
		}
	}
}

AmmoDrop(pos, angle)
{
	block = spawn("script_model", pos + (0, 0, 20) );
	block setModel("com_plasticcase_friendly");
	block.angles = angle;
	block notSolid();
	block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	block.headIcon = newHudElem();
	block.headIcon.x = block.origin[0];
	block.headIcon.y = block.origin[1];
	block.headIcon.z = block.origin[2] + 50;
	block.headIcon.alpha = 0.85;
	block.headIcon setShader( "waypoint_ammo_friendly", 10,10 );
	block.headIcon setWaypoint( true, true, false );
	trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
	trigger.angles = angle;
	trigger thread AmmoDropThink(pos);
	trigger thread AmmoDropDestroy();
	block thread AmmoDropDestroy();
	block thread BonusDropAmmoTimerDestroy();
	block thread rotateBonusDrop();
	wait 0.01;
}

rotateBonusDrop()
{
	for(;;)
	{
		self rotateyaw(-360,5);
		wait(5);
	}
}

BonusDropAmmoTimerDestroy()
{
	self endon("ammo_drop_take");
	{
		wait 20;
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		level notify("ammo_drop_take");
	}
}

AmmoDropDestroy()
{
    {
		level waittill("ammo_drop_take");
		self delete();
		self.headIcon destroy();
	}
}

AmmoDropThink(pos, angle)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
			player thread MaxAmmo();
			level notify("ammo_drop_take");
			level notify("random_drop_destroy");
			wait 0.1;
		}
		wait 0.01;
	}
}

NukeDrop(pos, angle)
{
	block = spawn("script_model", pos + (0, 0, 50) );
	block setModel("projectile_cbu97_clusterbomb");
	block.angles = angle-(90,0,0);
	block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	block setContents(0);
	block.headIcon = newHudElem();
	block.headIcon.x = block.origin[0];
	block.headIcon.y = block.origin[1];
	block.headIcon.z = block.origin[2] + 70;
	block.headIcon.alpha = 0.85;
	block.headIcon setShader( "dpad_killstreak_nuke", 10,10 );
	block.headIcon setWaypoint( true, true, false );
	block.headIcon thread NukeIconDestroy();
	trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
	trigger.angles = angle;
	trigger thread NukeDropThink(pos, angle, block);
	trigger thread NukeDropDestroy();
	block thread NukeDropDestroy();
	block thread BonusDropNukeTimerDestroy();
	block thread rotateBonusDrop();
	block thread MoveNukeIcon(block.headIcon);
	wait 0.01;
}

BonusDropNukeTimerDestroy()
{
	self endon("nuke_drop_take");
	{
		wait 20;
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		level notify("nuke_drop_take");
	}
}

NukeDropDestroy()
{
	level waittill("nuke_drop_take");
	self delete();
	self.headIcon destroy();
}

MoveNukeIcon(entity)
{
	self endon("nuke_icon_destroy");
	for(;;)
	{
		entity.x = self.origin[0];
		entity.y = self.origin[1];
		entity.z = self.origin[2] + 70;
		wait 0.05;
	}
}

NukeIconDestroy()
{
	level waittill("nuke_icon_destroy");
	self destroy();
}

NukeDropThink(pos, angle, block)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
		    block playSound( "veh_mig29_sonic_boom" );
		    block MoveTo(pos+(0,0,20000),6);
			wait 6;
			block hide();
			wait 3;
			level thread maps\mp\killstreaks\_nuke::nukeEffects();
			if(getDvarInt("z_dedicated") == 0)
				setDvar("timescale", 0.5);
			foreach(player in level.players)
			{
				player playlocalsound( "nuke_explosion" );
				player playlocalsound( "nuke_wave" );
			}
			level notify("nuke_drop_kill");
			level notify("nuke_drop_take");
			level notify("random_drop_destroy");
			level notify("nuke_icon_destroy");
			self thread NukeKill();
			foreach(player in level.players)
			{
				earthquake(1,1.5, player.origin + (0,0,40), 60);
			}
			wait 1.5;
			if(getDvarInt("z_dedicated") == 0)
				setDvar("timescale", 1);
			wait 3.5;
			level notify("nuke_drop_end");
			foreach(player in level.players)
			{
			    player.money += 400;
				player thread maps\mp\gametypes\_rank::giveRankXP("zombie_kill", 10);
				player.xpearned += 10;
				player thread AImod\_Mod::TextPopup("Nuke");
				player thread AImod\_text::BonusDropText("Nuke!", 0.85, (25.5,25.5,25.5),(0.9,0.9,0.1),0.60); 
				player thread AImod\_text::BonusDropIcon("dpad_killstreak_nuke");
				player notify("MONEY");
				player thread maps\mp\gametypes\_rank::scorePopup( 400, 0, (0,1,0), 1 );
			}
		}
		wait 0.1;
	}
}

NukeKill()
{
    level endon("nuke_drop_end");
    while(1)
	{
	    level notify("nuke_drop_kill");
		wait 0.1;
	}
}

FreezerDrop(pos, angle)
{
	block = spawn("script_model", pos + (0, 0, 50) );
	block setModel("projectile_cbu97_clusterbomb");
	block.angles = angle-(90,0,0);
	block setContents(0);
	block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	block.headIcon = newHudElem();
	block.headIcon.x = block.origin[0];
	block.headIcon.y = block.origin[1];
	block.headIcon.z = block.origin[2] + 70;
	block.headIcon.alpha = 0.85;
	block.headIcon setShader( "dpad_killstreak_emp", 10,10 );
	block.headIcon setWaypoint( true, true, false );
	block.headIcon.color = (0.1,0.9,0.9);
	block.headIcon thread FreezerIconDestroy();
	trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
	trigger.angles = angle;
	trigger thread FreezerDropThink(pos, angle, block, trigger);
	trigger thread FreezerDropDestroy();
	block thread MoveFreezerIcon(block.headIcon);
	block thread BonusDropFreezerTimerDestroy();
	block thread rotateFreezerBonusDrop();
	block thread FreezerDropDestroy();
	wait 0.01;
}

BonusDropFreezerTimerDestroy()
{
	level endon("freeze_drop_take");
	{
		wait 20;
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		level notify("freeze_drop_notake");
	}
}

rotateFreezerBonusDrop()
{
    level endon("freeze_drop_take");
	for(;;)
	{
		self rotateyaw(-360,5);
		wait(5);
	}
}

MoveFreezerIcon(entity)
{
	self endon("freeze_drop");
	for(;;)
	{
		entity.x = self.origin[0];
		entity.y = self.origin[1];
		entity.z = self.origin[2] + 70;
		wait 0.05;
	}
}

FreezerIconDestroy()
{
	level waittill("freeze_drop");
	self destroy();
}

FreezerDropDestroy()
{
	level waittill("freeze_drop_notake");
	self delete();
	self.headIcon destroy();
}

FreezerDropThink(pos, angle, block, trigger)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
			trigger delete();
		    block playSound( "veh_mig29_sonic_boom" );
		    block MoveTo(pos+(0,0,4000),6);
			level notify("freeze_drop_take");
			level notify("random_drop_destroy");
			foreach(player in level.players)
			{
				player thread AImod\_text::BonusDropText("Freezer!", 0.85, (25.5,25.5,25.5),(0.1,0.9,0.9),0.60); 
				player thread AImod\_text::BonusDropIcon("dpad_killstreak_emp", (0.1,0.9,0.9));
			}
			wait 6;
			level notify("freeze_drop");
			block playSound( "emp_activate" );
			playFx(level.empfx,block.origin);
			level notify("freeze_drop_notake");
			level thread FreezeZombies();
			wait 10;
			level notify("freeze_over");
			level notify("freeze_model_gone");
			foreach(player in level.players)
			{
			    player.money += 200;
				player thread AImod\_Mod::TextPopup("Freezer");
				player notify("MONEY");
				player thread maps\mp\gametypes\_rank::scorePopup( 200, 0, (0,1,0), 1 );
			}
		}
		wait 0.1;
	}
}

FreezeZombies()
{
	for(i = 0; i < 15; i += 1)
	{
		foreach(zombie in level.bots)
		{
			if(zombie.pers["isAlive"] == "false")
				continue;
			
			zombie.freezed = 1;
			zombie.speed = 1;
		}
		wait 1;
	}
	foreach(zombie in level.bots)
	{
		if(zombie.pers["isAlive"] == "false")
			continue;
			
		zombie.freezed = 0;
		zombie.speed = zombie.speed2;
	}
}

InfiniteAmmoDrop(pos, angle)
{
	block = spawn("script_model", pos + (0, 0, 20) );
	block setModel("com_plasticcase_friendly");
	block.angles = angle;
	block notSolid();
	block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	block.headIcon = newHudElem();
	block.headIcon.x = block.origin[0];
	block.headIcon.y = block.origin[1];
	block.headIcon.z = block.origin[2] + 50;
	block.headIcon.alpha = 0.85;
	block.headIcon setShader( "dpad_killstreak_sentry_gun", 10,10 );
	block.headIcon setWaypoint( true, true, false );
	trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
	trigger.angles = angle;
	trigger thread InfiniteAmmoDropThink(pos);
	trigger thread InfiniteAmmoDropDestroy();
	block thread InfiniteAmmoDropDestroy();
	block thread BonusDropInfiniteAmmoTimerDestroy();
	block thread rotateBonusDrop();
	wait 0.01;
}

BonusDropInfiniteAmmoTimerDestroy()
{
	self endon("infinite_ammo_drop_take");
	{
		wait 20;
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		level notify("infinite_ammo_drop_take");
	}
}

InfiniteAmmoDropDestroy()
{
    {
		level waittill("infinite_ammo_drop_take");
		self delete();
		self.headIcon destroy();
	}
}
	
InfiniteAmmoDropThink(pos, angle)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
			foreach(player in level.players)
			{
				player thread InfiniteAmmo();
			}
			level notify("infinite_ammo_drop_take");
			level notify("random_drop_destroy");
			wait 0.1;
		}
		wait 0.1;
	}
}

AdrenalineDrop(pos, angle)
{
	block = spawn("script_model", pos + (0, 0, 20) );
	block setModel("com_plasticcase_friendly");
	block.angles = angle;
	block notSolid();
	block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	block.headIcon = newHudElem();
	block.headIcon.x = block.origin[0];
	block.headIcon.y = block.origin[1];
	block.headIcon.z = block.origin[2] + 50;
	block.headIcon.alpha = 0.85;
	block.headIcon setShader( "cardicon_doubletap", 10,10 );
	block.headIcon setWaypoint( true, true, false );
	trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
	trigger.angles = angle;
	trigger thread AdrenalineDropThink(pos);
	trigger thread AdrenalineDropDestroy();
	block thread AdrenalineDropDestroy();
	block thread BonusDropAdrenalineTimerDestroy();
	block thread rotateBonusDrop();
	wait 0.01;
}

BonusDropAdrenalineTimerDestroy()
{
	self endon("adrenaline_drop_take");
	{
		wait 20;
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		level notify("adrenaline_drop_take");
	}
}

AdrenalineDropDestroy()
{
    {
		level waittill("adrenaline_drop_take");
		self delete();
		self.headIcon destroy();
	}
}

AdrenalineDropThink(pos, angle)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
			foreach(player in level.players)
			{
				player thread Adrenaline();
			}
			level notify("adrenaline_drop_take");
			level notify("random_drop_destroy");
			wait 0.1;
		}
		wait 0.1;
	}
}

DeathMachineDrop(pos, angle)
{
	block = spawn("script_model", pos + (0, 0, 20) );
	block setModel("com_plasticcase_friendly");
	block.angles = angle;
	block notSolid();
	block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	block.headIcon = newHudElem();
	block.headIcon.x = block.origin[0];
	block.headIcon.y = block.origin[1];
	block.headIcon.z = block.origin[2] + 50;
	block.headIcon.alpha = 0.85;
	block.headIcon setShader( "cardicon_skull", 10,10 );
	block.headIcon setWaypoint( true, true, false );
	trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
	trigger.angles = angle;
	trigger thread DeathMachineDropThink(pos);
	trigger thread DeathMachineDropDestroy();
	block thread DeathMachineDropDestroy();
	block thread BonusDropDeathMachineTimerDestroy();
	block thread rotateBonusDrop();
	wait 0.01;
}

BonusDropDeathMachineTimerDestroy()
{
	self endon("deathmachine_drop_take");
	{
		wait 20;
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		level notify("deathmachine_drop_take");
	}
}

DeathMachineDropDestroy()
{
    {
		level waittill("deathmachine_drop_take");
		self delete();
		self.headIcon destroy();
	}
}

DeathMachineDropThink(pos, angle)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
			player thread DeathMachineStart();
			level notify("deathmachine_drop_take");
			level notify("random_drop_destroy");
		}
		wait 0.1;
	}
}

MoneyDrop(pos, angle)
{
	block = spawn("script_model", pos + (0, 0, 20) );
	block setModel("com_plasticcase_friendly");
	block.angles = angle;
	block notSolid();
	block CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
	block.headIcon = newHudElem();
	block.headIcon.x = block.origin[0];
	block.headIcon.y = block.origin[1];
	block.headIcon.z = block.origin[2] + 50;
	block.headIcon.alpha = 0.85;
	block.headIcon setShader( "cardicon_gold", 10,10 );
	block.headIcon setWaypoint( true, true, false );
    trigger = spawn( "trigger_radius", pos, 0, 75, 50 );
    trigger.angles = angle;
	trigger thread MoneyDropThink(pos);
	trigger thread MoneyDropDestroy();
	block thread MoneyDropDestroy();
	block thread BonusDropMoneyTimerDestroy();
	block thread rotateBonusDrop();
    wait 0.01;
}

BonusDropMoneyTimerDestroy()
{
	self endon("money_drop_take");
	{
		wait 20;
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		wait 0.5;
		self hide();
		wait 0.5;
		self show();
		level notify("money_drop_take");
	}
}

MoneyDropDestroy()
{
    {
		level waittill("money_drop_take");
		self delete();
		self.headIcon destroy();
	}
}

MoneyDropThink(pos, angle)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
			player thread ExtraMoney();
			level notify("money_drop_take");
			level notify("random_drop_destroy");
			wait 0.1;
		}
		wait 0.1;
	}
}

InfiniteAmmo()
{ 
    level endon("disconnect");
	self endon("take_infiniteammo");
	{
	    self thread AImod\_Mod::TextPopup( "Infinite Ammo!" );
	    self thread AImod\_text::BonusDropText("Infinite Ammo!", 0.85, (25.5,25.5,25.5),(0.3,0.3,0.9),0.60); 
		self thread AImod\_text::BonusDropIcon("dpad_killstreak_sentry_gun");
	    self thread InfiniteAmmoStart();
		wait 15;
		self thread AImod\_text::BonusDropText("^1No more Infinite Ammo!", 0.85, (25.5,25.5,25.5),(0.9,0.3,0.3),0.60); 
		self thread AImod\_text::BonusDropIcon("dpad_killstreak_sentry_gun");
		self notify("take_infiniteammo");
		self notify("bonus_end");
		level.nobonus = 0;
	}
	wait 0.1;
}

BonusDropHud( text, waitdestroy )
{
	if(self.bonusdrophud == 1)
	{
		self.bonusdrophud1 = NewClientHudElem( self );
		self.bonusdrophud1.alignX = "center";
		self.bonusdrophud1.alignY = "middle";
		self.bonusdrophud1.horzAlign = "center";
		self.bonusdrophud1.vertAlign = "middle";
		self.bonusdrophud1.x = -350;
		self.bonusdrophud1.y = 140;
		self.bonusdrophud1.foreground = true;
		self.bonusdrophud1.fontScale = 0.750;
		self.bonusdrophud1.font = "hudbig";
		self.bonusdrophud1.alpha = 1;
		self.bonusdrophud1.fontscale = 0.75;
		self.bonusdrophud1.alpha = 0.85;
		self.bonusdrophud1 setText(text);
		self.bonushudtimer += 1;
		self waittill(waitdestroy);
		self.bonusdrophud1 destroy();
	}
	else if(self.bonusdrophud == 2)
	{
		self.bonusdrophud2 = NewClientHudElem( self );
		self.bonusdrophud2.alignX = "center";
		self.bonusdrophud2.alignY = "middle";
		self.bonusdrophud2.horzAlign = "center";
		self.bonusdrophud2.vertAlign = "middle";
		self.bonusdrophud2.x = -350;
		self.bonusdrophud2.y = 110;
		self.bonusdrophud2.foreground = true;
		self.bonusdrophud2.fontScale = 0.750;
		self.bonusdrophud2.font = "hudbig";
		self.bonusdrophud2.alpha = 1;
		self.bonusdrophud2.fontscale = 0.75;
		self.bonusdrophud2.alpha = 0.85;
		self.bonusdrophud2 setText(text);
		self.bonushudtimer += 1;
		self waittill(waitdestroy);
		self.bonusdrophud2 destroy();
	}
	else if(self.bonusdrophud == 3)
	{
		self.bonusdrophud3 = NewClientHudElem( self );
		self.bonusdrophud3.alignX = "center";
		self.bonusdrophud3.alignY = "middle";
		self.bonusdrophud3.horzAlign = "center";
		self.bonusdrophud3.vertAlign = "middle";
		self.bonusdrophud3.x = -350;
		self.bonusdrophud3.y = 80;
		self.bonusdrophud3.foreground = true;
		self.bonusdrophud3.fontScale = 0.750;
		self.bonusdrophud3.font = "hudbig";
		self.bonusdrophud3.alpha = 1;
		self.bonusdrophud3.fontscale = 0.75;
		self.bonusdrophud3.alpha = 0.85;
		self.bonusdrophud3 setText(text);
		self.bonushudtimer += 1;
		self waittill(waitdestroy);
		self.bonusdrophud3 destroy();
	}
	else if(self.bonusdrophud == 4)
	{
		self.bonusdrophud4 = NewClientHudElem( self );
		self.bonusdrophud4.alignX = "center";
		self.bonusdrophud4.alignY = "middle";
		self.bonusdrophud4.horzAlign = "center";
		self.bonusdrophud4.vertAlign = "middle";
		self.bonusdrophud4.x = -350;
		self.bonusdrophud4.y = 50;
		self.bonusdrophud4.foreground = true;
		self.bonusdrophud4.fontScale = 0.750;
		self.bonusdrophud4.font = "hudbig";
		self.bonusdrophud4.alpha = 1;
		self.bonusdrophud4.fontscale = 0.75;
		self.bonusdrophud4.alpha = 0.85;
		self.bonusdrophud4 setText(text);
		self.bonushudtimer += 1;
		self waittill(waitdestroy);
		self.bonusdrophud4 destroy();
	}
}

InfiniteAmmoStart()
{
	self endon("disconnect");
	self endon("take_infiniteammo");
	while(1)
	{
		currentWeapon = self getCurrentWeapon();
		if ( currentWeapon != "none" && self getCurrentWeapon() != "ac130_105mm_mp")
		{
			self setWeaponAmmoClip( currentWeapon, 9999, "right" );
			self setWeaponAmmoClip( currentWeapon, 9999, "left" );
		}
		currentoffhand = self GetCurrentOffhand() && self getCurrentWeapon() != "ac130_105mm_mp";
		if ( currentoffhand != "none" )
		{
			self setWeaponAmmoClip( currentoffhand, 9999, "right" );
			self setWeaponAmmoClip( currentoffhand, 9999, "left" );
		}
		self waittill( "weapon_fired" );
	}
}

MaxAmmo()
{ 
    level endon("disconnect");
    foreach(player in level.players)
	{
	    player thread AImod\_Mod::TextPopup( "Max Ammo!" );
	    player thread AImod\_text::BonusDropText("Max Ammo!", 0.85, (25.5,25.5,25.5),(0.7,0.7,0.3),0.60); 
		player thread AImod\_text::BonusDropIcon("waypoint_ammo_friendly");
		player playLocalSound("mp_level_up");
	    weaponList = self GetWeaponsListAll();
	
		foreach ( weaponName in weaponList )
		{
			if(weaponName == "beretta_akimbo_xmags_mp")
				continue;
		
			self giveMaxAmmo( weaponName );
		}	
		self notify("bonus_end");
		level.nobonus = 0;
	}
	wait 0.1;
}

ExtraMoney()
{ 
    level endon("disconnect");
    foreach(player in level.players)
	{
	    player thread AImod\_Mod::TextPopup( "Extra Cash!" );
		player playLocalSound("mp_level_up");
		player thread AImod\_text::BonusDropText("Extra Cash!", 0.85, (25.5,25.5,25.5),(0.3,0.9,0.3),0.60); 
		player thread AImod\_text::BonusDropIcon("cardicon_gold");
	    player.money += 1000;
		player notify("MONEY");
		self notify("bonus_end");
		level.nobonus = 0;
	}
	wait 0.1;
}

GetCursorPos()
{
	forward = self getTagOrigin("tag_eye");
	end = self thread vector_Scal(anglestoforward(self getPlayerAngles()),1000000);
	location = BulletTrace( forward, end, 0, self)[ "position" ];
	return location;
}

vector_scal(vec, scale) 
{
    vec = (vec[0] * scale, vec[1] * scale, vec[2] * scale);
    return vec;
}

DeathMachineStart()
{ 
    level endon("disconnect");
	self endon("no_deathmachine");
	{
	    self thread AImod\_Mod::TextPopup( "Death Machine!" );
		self thread AImod\_text::BonusDropText("Death Machine!", 0.85, (25.5,25.5,25.5),(0.3,0.3,0.9),0.60); 
		self thread AImod\_text::BonusDropIcon("hud_icon_m240");
		self playLocalSound("mp_level_up");
		self thread DeathMachine();
		self thread DeathMachineNoSwitch();
	    self giveWeapon( "m240_xmags_mp", 6, false);
		self switchToWeapon("m240_xmags_mp");
		self GiveMaxAmmo("m240_xmags_mp");
		self.bonusdrophud += 1;
		self.notusebox = 1;
		wait 30;
		self.notusebox = 0;
		self.bonusdrophud -= 1;
		self takeWeapon("m240_xmags_mp");
		wait 0.1;
		self switchtoRandomWeapon();
		self thread AImod\_text::BonusDropText("No more Death Machine!", 0.85, (25.5,25.5,25.5),(0.3,0.3,0.9),0.60); 
		self thread AImod\_text::BonusDropIcon("hud_icon_m240");
		self playLocalSound("mp_level_up");
		level notify("bonus_end");
		level.nobonus = 0;
		self notify("no_deathmachine");
	}
	wait 0.1;
}

DeathMachineAirdropStart()
{ 
    level endon("disconnect");
	self endon("no_deathmachine");
	{
	    self thread AImod\_Mod::TextPopup( "Death Machine!" );
	    self thread AImod\_text::BonusDropText("Death Machine!", 0.85, (25.5,25.5,25.5),(0.3,0.3,0.9),0.60); 
		self thread AImod\_text::BonusDropIcon("hud_icon_m240");
		self playLocalSound("mp_level_up");
		self thread DeathMachine();
		self thread DeathMachineNoSwitch();
	    self giveWeapon( "m240_xmags_mp", 6, false);
		self switchToWeapon("m240_xmags_mp");
		self GiveMaxAmmo("m240_xmags_mp");
		self.notusebox = 1;
		wait 60;
		self.notusebox = 0;
		self takeWeapon("m240_xmags_mp");
		wait 0.1;
		self switchtoRandomWeapon();
		self thread AImod\_text::BonusDropText("No more Death Machine!", 0.85, (25.5,25.5,25.5),(0.9,0.3,0.3),0.60); 
		self thread AImod\_text::BonusDropIcon("hud_icon_m240");
		self playLocalSound("mp_level_up");
		level notify("bonus_end");
		level.nobonus = 0;
		self notify("no_deathmachine");
	}
	wait 0.1;
}

DeamMachineAirDropThink(pos, angle)
{
	self endon("disconnect");
	while(1)
	{
		self waittill( "trigger", player );
		if(Distance(pos, Player.origin) <= 75)
		{
			foreach(player in level.players)
			{
				player thread DeathMachineAirdropStart();
			}
			level notify("random_drop_destroy");
			wait 0.1;
		}
		wait .8;
	}
}

DeathMachineNoSwitch()
{
    self endon("no_deathmachine");
    while(1)
	{
	    self switchToWeapon("m240_xmags_mp");
		wait 0.1;
	}
}

DeathMachine()
{
    self endon("death");
	self endon("no_deathmachine");
    for( ;; )
    {
        self waittill( "weapon_fired" );
        if ( self getCurrentWeapon() == "m240_xmags_mp" )
        {
			self GiveMaxAmmo("m240_xmags_mp");
			self setWeaponAmmoClip( "m240_xmags_mp", 200 );
        }
    }
}

Adrenaline()
{
	level endon("disconnect");
	if(self.speedreload == 1)
	{
		self thread AImod\_Mod::TextPopup( "Adrenaline!" );
		self thread AImod\_text::BonusDropText("Adrenaline!", 0.85, (25.5,25.5,25.5),(0.9,0.3,0.3),0.60); 
		self thread AImod\_text::BonusDropIcon("cardicon_doubletap");
		self playLocalSound("mp_level_up");
		if ( self _hasPerk( "specialty_lightweight" ) )
		{
			self.moveSpeedScaler = 1.25;
			self maps\mp\gametypes\_weapons::updateMoveSpeedScale( "primary" );
		}
		else
		{
			self.moveSpeedScaler = 1.2;
			self maps\mp\gametypes\_weapons::updateMoveSpeedScale( "primary" );
		}
		self.bonusdrophud += 1;
		wait 15;
		if ( self _hasPerk( "specialty_lightweight" ) )
		{
			self.moveSpeedScaler = 1.1;
			self maps\mp\gametypes\_weapons::updateMoveSpeedScale( "primary" );
		}
		else
		{
			self.moveSpeedScaler = 1.0;
			self maps\mp\gametypes\_weapons::updateMoveSpeedScale( "primary" );
		}
		self.bonusdrophud -= 1;
		self thread AImod\_text::BonusDropText("Adrenaline has ran out!", 0.85, (25.5,25.5,25.5),(0.9,0.3,0.3),0.60); 
		self thread AImod\_text::BonusDropIcon("cardicon_doubletap");
		self notify("adrenaline_out");
		level notify("bonus_end");
		level.nobonus = 0;
	}
	else if(self.speedreload == 0)
	{
		self thread AImod\_Mod::TextPopup( "Adrenaline!" );
		self thread AImod\_text::BonusDropText("Adrenaline!", 0.85, (25.5,25.5,25.5),(0.9,0.3,0.3),0.60); 
		self thread AImod\_text::BonusDropIcon("cardicon_doubletap");
		self playLocalSound("mp_level_up");
		self _setPerk("specialty_fastreload");
		self _setPerk("specialty_quickdraw");
		if ( self _hasPerk( "specialty_lightweight" ) )
		{
			self.moveSpeedScaler = 1.25;
			self maps\mp\gametypes\_weapons::updateMoveSpeedScale( "primary" );
		}
		else
		{
			self.moveSpeedScaler = 1.2;
			self maps\mp\gametypes\_weapons::updateMoveSpeedScale( "primary" );
		}
		wait 15;
		if ( self _hasPerk( "specialty_lightweight" ) )
		{
			self.moveSpeedScaler = 1.1;
			self maps\mp\gametypes\_weapons::updateMoveSpeedScale( "primary" );
		}
		else
		{
			self.moveSpeedScaler = 1.0;
			self maps\mp\gametypes\_weapons::updateMoveSpeedScale( "primary" );
		}
		self _unsetPerk("specialty_fastreload");
		self _unsetPerk("specialty_quickdraw");
		self thread AImod\_text::BonusDropText("Adrenaline has ran out!", 0.85, (25.5,25.5,25.5),(0.9,0.3,0.3),0.60); 
		self thread AImod\_text::BonusDropIcon("cardicon_doubletap");
		self notify("adrenaline_out");
		self notify("bonus_end");
		level.nobonus = 0;
	}
	wait 0.1;
}

BotMain()
{
	if(level.Wave == 9 && getdvar("mapname") == "mp_subbase" || level.Wave == 19 && getdvar("mapname") == "mp_subbase" || level.Wave == 29 && getdvar("mapname") == "mp_subbase" || level.Wave == 9 && getdvar("mapname") == "mp_estate" || level.Wave == 19 && getdvar("mapname") == "mp_estate" || level.Wave == 29 && getdvar("mapname") == "mp_estate" || level.Wave == 9 && getdvar("mapname") == "mp_overgrown" || level.Wave == 19 && getdvar("mapname") == "mp_overgrown" || level.Wave == 29 && getdvar("mapname") == "mp_overgrown" || level.Wave == 9 && getdvar("mapname") == "mp_crash" || level.Wave == 19 && getdvar("mapname") == "mp_crash" || level.Wave == 29 && getdvar("mapname") == "mp_crash")
	{
		CreateHellBossWave( );
	}
	else if(level.Wave == 4 && getdvar("mapname") == "mp_subbase" || level.Wave == 14 && getdvar("mapname") == "mp_subbase" || level.Wave == 24 && getdvar("mapname") == "mp_subbase" || level.Wave == 4 && getdvar("mapname") == "mp_estate" || level.Wave == 14 && getdvar("mapname") == "mp_estate" || level.Wave == 24 && getdvar("mapname") == "mp_estate" || level.Wave == 4 && getdvar("mapname") == "mp_overgrown" || level.Wave == 14 && getdvar("mapname") == "mp_overgrown" || level.Wave == 24 && getdvar("mapname") == "mp_overgrown" || level.Wave == 4 && getdvar("mapname") == "mp_crash" || level.Wave == 14 && getdvar("mapname") == "mp_crash" || level.Wave == 24 && getdvar("mapname") == "mp_crash")
	{
		CreateHellWave( );
	}
	else if(getdvar("mapname") == "mp_subbase" || getdvar("mapname") == "mp_estate" || getdvar("mapname") == "mp_overgrown" || getdvar("mapname") == "mp_crash")
	{
		CreateBotWaveHell( );
	}
	else if(level.Wave == 9 && getdvar("mapname") != "mp_subbase" || level.Wave == 19 && getdvar("mapname") || level.Wave == 29 && getdvar("mapname") != "mp_subbase" || level.Wave == 9 && getdvar("mapname") != "mp_estate" || level.Wave == 19 && getdvar("mapname") != "mp_estate" || level.Wave == 29 && getdvar("mapname") != "mp_estate" || level.Wave == 9 && getdvar("mapname") != "mp_overgrown" || level.Wave == 19 && getdvar("mapname") != "mp_overgrown" || level.Wave == 29 && getdvar("mapname") != "mp_overgrown" || level.Wave == 9 && getdvar("mapname") != "mp_crash" || level.Wave == 19 && getdvar("mapname") || level.Wave == 29 && getdvar("mapname") != "mp_crash")
	{
		CreateBossWave( );
	}
	else if(level.Wave == 4 && getdvar("mapname") != "mp_subbase" || level.Wave == 14 && getdvar("mapname") != "mp_subbase" || level.Wave == 24 && getdvar("mapname") != "mp_subbase" || level.Wave == 4 && getdvar("mapname") != "mp_estate" || level.Wave == 14 && getdvar("mapname") != "mp_estate" || level.Wave == 24 && getdvar("mapname") != "mp_estate" || level.Wave == 4 && getdvar("mapname") != "mp_overgrown" || level.Wave == 14 && getdvar("mapname") != "mp_overgrown" || level.Wave == 24 && getdvar("mapname") != "mp_overgrown" || level.Wave == 4 && getdvar("mapname") != "mp_crash" || level.Wave == 14 && getdvar("mapname") != "mp_crash" || level.Wave == 24 && getdvar("mapname") != "mp_crash")
	{
		CreateCrawlerWave( );
	}
	else if(getdvar("mapname") != "mp_subbase" || getdvar("mapname") != "mp_estate" || getdvar("mapname") != "mp_overgrown" || getdvar("mapname") != "mp_crash")
	{
		CreateBotWave( );
	}
}

FXFire()
{
	self endon("bot_death");
	while(1)
	{
		playFx(loadfx("props/barrel_fire"),self.origin+(0,0,53));
		wait 1;
	}
}

NukeZombies()
{ 
	self endon("bot_is_death");
	{
	    level waittill("nuke_drop_kill");
		self notify("bot_death");
		self.knife delete();
		self scriptModelPlayAnim("pb_death_run_stumble");
		self.crate1 thread DeleteZombie();
	    self.speed = 1;
		self HidePart("tag_head");
		playFx(level.bloodfx,self getTagOrigin("tag_head"));
		self.crate1 killEnt(self.crate1, 0);
		self moveTo(self.origin + (0,0,4000),7);
		wait 7;
		self thread DeleteZombie();
		playFx(loadFx("explosions/aerial_explosion"), self.origin);
		self notify("bonus_end");
		level.nobonus = 0;
		self notify("bot_is_dead");
	}
	wait 0.1;
}

CreateBotWave( )
{
	level endon("game_ended");
	level.Wave++;
	level.BotsForWave = (10 * level.Wave);
	level.RealSpawnedBots = 0;
	level.ZombieHealth += 15;
	level.zState = "playing";
	level notify("zombie_round_started_end");
	level SetNormalRound();
	level notify("crate_gone");
	level thread ZombieMarkers();
	foreach( player in level.players )
	{
		player thread RoundStartText("Wave " + level.Wave, 1, (1,1,1), (0.3,0.3,0.9), 0.85);
		player PlayLocalSound("flag_spawned");
	}
	for( i = 0;i < level.BotsForWave;i++ )
	{
		while(AImod\_botUtil::ZombieCount() >= 25)
		{
			wait 1;
		}
		if(level.RealSpawnedBots < level.BotsForWave)
		{
			level.RealSpawnedBots++;
		}
		level.bots[i] = spawn("script_model", AImod\_botUtil::GetMapSpawnPoint());
		level.bots[i] setModel(AImod\_botUtil::GetSpawnModel());
		level.bots[i].crate1 = spawn("script_model", level.bots[i] getTagOrigin( "j_spinelower" ) + (-5,0,-10)); 
		level.bots[i].crate1 setModel("com_plasticcase_beige_big");
		level.bots[i].crate1 CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
		level.bots[i].crate1.angles = (90,0,0);
		level.bots[i].crate1 Solid();
		level.bots[i].crate1 hide();
		level.bots[i].crate1.team = "axis";
		level.bots[i].crate1.name = "botCrate" + i;
		level.bots[i].crate1 setCanDamage(true);
		level.bots[i].crate1.maxhealth = level.ZombieHealth;
		level.bots[i].crate1.health = level.ZombieHealth;
		level.bots[i].crate1 linkto( level.bots[i], "j_spinelower" );
		
		level.bots[i].head = spawn("script_model", level.bots[i] getTagOrigin( "j_spine4" ));
		level.bots[i].head setModel(AImod\_botUtil::GetHeadSpawnModelZombie());
		level.bots[i].head.angles = (270,0,270);
		level.bots[i].head.team = "axis";
		level.bots[i].head linkto( level.bots[i], "j_spine4" );
		
		level.bots[i].hasMarker = false;
		level.bots[i].team = "axis";
		level.bots[i].name = "bot" + i;
		level.bots[i].targetname = "bot";
		level.bots[i].classname = "bot";
		level.bots[i].currentsurface = "default";
		level.bots[i].kills = 0;
		level.bots[i].pers["isAlive"] = "true";
		level.bots[i].type = "normal_zombie";
		level.bots[i] thread BonusDrops();
		level.bots[i] thread MonitorAttackPlayers( );
		level.bots[i] thread MonitorBotHealth();
		level.bots[i] thread KillIfUnderMap();
		level.bots[i] thread GetBestPlayerAndMoveTo();
		level.bots[i] thread NukeZombies();
		level.bots[i] thread MoniterPosition();
		level.bots[i] thread RegularAnim();
		wait 0.3;
	}
	level thread MonitorFinish();
}

CreateBotWaveHell( )
{
	level endon("game_ended");
	level.Wave++;
	level.BotsForWave = (25 * level.Wave);
	level.RealSpawnedBots = 0;
	level.ZombieHealth += 25;
	level.zState = "playing";
	level notify("zombie_round_started_end");
	if(level.BotsForWave >= 250)
	{
	    level.BotsForWave = 250;
	}
	if(level.Wave == 6)
	{
		level.BotsForWave = 40;
		level.ZombieHealth = 255;
	}
	else if(level.Wave == 11)
	{
		level.BotsForWave = 75;
		level.ZombieHealth = 300;
	}
	else if(level.Wave == 16)
	{
		level.BotsForWave = 100;
		level.ZombieHealth = 315;
	}
	else if(level.Wave == 21)
	{
		level.BotsForWave = 200;
		level.ZombieHealth = 435;
	}
	else if(level.Wave == 26)
	{
		level.BotsForWave = 260;
		level.ZombieHealth = 500;
	}
	level thread ZombieMarkers();
	level notify("crate_gone");
	foreach( player in level.players )
	{
		player thread RoundStartText("Hell Zombie Wave " + level.Wave, 1, (1,1,1), (0.3,0.3,0.9), 0.85);
		player PlayLocalSound("flag_spawned");
	}
	for( i = 0;i < level.BotsForWave;i++ )
	{
		while(AImod\_botUtil::ZombieCount() >= 25)
		{
			wait 1;
		}
		if(level.RealSpawnedBots < level.BotsForWave)
		{
			level.RealSpawnedBots++;
		}
		level.bots[i] = spawn("script_model", AImod\_botUtil::GetMapSpawnPoint());
		level.bots[i] setModel(AImod\_botUtil::GetSpawnModel());
		level.bots[i].crate1 = spawn("script_model", level.bots[i] getTagOrigin( "j_spinelower" ) + (-5,0,-10)); 
		level.bots[i].crate1 setModel("com_plasticcase_beige_big");
		level.bots[i].crate1 CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
		level.bots[i].crate1.angles = (90,0,0);
		level.bots[i].crate1 Solid();
		level.bots[i].crate1 hide();
		level.bots[i].crate1.team = "axis";
		level.bots[i].crate1.name = "botCrate" + i;
		level.bots[i].crate1 setCanDamage(true);
		level.bots[i].crate1.maxhealth = level.ZombieHealth;
		level.bots[i].crate1.health = level.ZombieHealth;
		level.bots[i].crate1 linkto( level.bots[i], "j_spinelower" );
		
		level.bots[i].head = spawn("script_model", level.bots[i] getTagOrigin( "j_spine4" ));
		level.bots[i].head setModel(AImod\_botUtil::GetHeadSpawnModelZombie());
		level.bots[i].head.angles = (270,0,270);
		level.bots[i].head.team = "axis";
		level.bots[i].head linkto( level.bots[i], "j_spine4" );
		
		level.bots[i].hasMarker = false;
		level.bots[i].team = "axis";
		level.bots[i].name = "bot" + i;
		level.bots[i].targetname = "bot";
		level.bots[i].classname = "bot";
		level.bots[i].currentsurface = "default";
		level.bots[i].kills = 0;
		level.bots[i].pers["isAlive"] = "true";
		level.bots[i].type = "hell_zombie";
		level.bots[i] thread BonusDrops();
		level.bots[i] thread MonitorAttackPlayers( );
		level.bots[i] thread MonitorBotHealth();
		level.bots[i] thread KillIfUnderMap();
		level.bots[i] thread GetBestPlayerAndMoveTo();
		level.bots[i] thread HellAnim();
		level.bots[i] thread NukeZombies();
		level.bots[i] thread MoniterPosition();
		wait 0.3;
	}
	level thread MonitorFinishHell();
}

CreateHellBossWave( )
{
	level endon("game_ended");
	level.Wave++;
	level.BotsForWave = 1;
	level.RealSpawnedBots = 0;
	level.ZombieHealth = 12500;
	level.zState = "playing";
	level notify("zombie_round_started_end");
	if(level.Wave == 10)
	{
		level.BotsForWave = 1;
		wait 0.05;
	}
	else if(level.Wave == 20)
	{
		level.BotsForWave = 3;
		wait 0.05;
	}
	else if(level.Wave == 30)
	{
		level.BotsForWave = 6;
		wait 0.05;
	}
	if(getDvarInt("z_dedicated") == 0)
	{
		foreach(player in level.players)
		{
			switch(randomInt(2))
			{
				case 0:
				player playLocalSound("mp_killstreak_pavelow");
				break;
				case 1:
				player playLocalSound("mp_killstreak_counteruav");
				break;
			}
		}
	}
	level thread ZombieMarkers();
	level notify("crate_gone");
	level.hellboss = 1;
	foreach( player in level.players )
	{
		player thread RoundStartText("Hell Boss Wave " + level.Wave, 1, (1,1,1), (0.9,0.3,0.3), 0.85);
		player thread RoundStartText("Boss Health " + level.ZombieHealth, 1, (1,1,1), (0.9,0.3,0.3), 0.85);
		player PlayLocalSound("flag_spawned");
		player VisionSetNakedForPlayer( "cobra_sunset3", 0 );
		VisionSetPain("cobra_sunset3");
	}
	wait 0.05;
	for( i = 0;i < level.BotsForWave;i++ )
	{
		if(level.RealSpawnedBots < level.BotsForWave)
		{
			level.RealSpawnedBots++;
		}
		level.bots[i] = spawn("script_model", AImod\_botUtil::GetMapSpawnPoint());
		level.bots[i] setModel(AImod\_botUtil::GetBossSpawnModel( ));
		level.bots[i].crate1 = spawn("script_model", level.bots[i] getTagOrigin( "j_spinelower" ) + (-5,0,-10)); 
		level.bots[i].crate1 setModel("com_plasticcase_beige_big");
		level.bots[i].crate1 CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
		level.bots[i].crate1.angles = (90,0,0);
		level.bots[i].crate1 Solid();
		level.bots[i].crate1 hide();
		level.bots[i].crate1.team = "axis";
		level.bots[i].crate1.name = "botCrate" + i;
		level.bots[i].crate1 setCanDamage(true);
		level.bots[i].crate1.maxhealth = level.ZombieHealth;
		level.bots[i].crate1.health = level.ZombieHealth;
		level.bots[i].crate1 linkto( level.bots[i], "j_spinelower" );
		
		level.bots[i].head = spawn("script_model", level.bots[i] getTagOrigin( "j_spine4" ));
		level.bots[i].head setModel(AImod\_botUtil::GetBossHeadSpawnModel());
		level.bots[i].head.angles = (270,0,270);
		level.bots[i].head.team = "axis";
		level.bots[i].head linkto( level.bots[i], "j_spine4" );
		
		level.bots[i].hasMarker = false;
		level.bots[i].team = "axis";
		level.bots[i].name = "bot" + i;
		level.bots[i].targetname = "bot";
		level.bots[i].classname = "bot";
		level.bots[i].currentsurface = "default";
		level.bots[i].kills = 0;
		level.bots[i].pers["isAlive"] = "true";
		level.bots[i].type = "hell_boss_zombie";
		level.bots[i] thread BonusDrops();
		level.bots[i] thread MonitorAttackPlayers( );
		level.bots[i] thread MonitorBotHealth();
		level.bots[i] thread KillIfUnderMap();
		level.bots[i] thread GetBestPlayerAndMoveTo();
		level.bots[i] thread BossAnim();
		level.bots[i] thread NukeZombies();
		level.bots[i] thread MoniterPosition();
		level.bots[i] thread FXFire();
		wait 0.3;
	}
	level thread MonitorFinishHellBoss();
}

CreateHellWave( )
{
	level endon("game_ended");
	level.Wave++;
	level.BotsForWave = 1;
	level.RealSpawnedBots = 0;
	level.ZombieHealth = 6500;
	level.zState = "playing";
	level notify("zombie_round_started_end");
	if(level.Wave == 5)
	{
		level.BotsForWave = 150;
		level.ZombieHealth = 200;
		wait 0.05;
	}
	else if(level.Wave == 15)
	{
		level.BotsForWave = 300;
		level.ZombieHealth = 400;
		wait 0.05;
	}
	else if(level.Wave == 25)
	{
		level.BotsForWave = 450;
		level.ZombieHealth = 600;
		wait 0.05;
	}
	if(getDvarInt("z_dedicated") == 0)
	{
		foreach(player in level.players)
		{
			switch(randomInt(2))
			{
				case 0:
				player playLocalSound("mp_killstreak_pavelow");
				break;
				case 1:
				player playLocalSound("mp_killstreak_counteruav");
				break;
			}
		}
	}
	level thread ZombieMarkers();
	level notify("crate_gone");
	level.hellzombie = 1;
	foreach( player in level.players)
	{
		player thread RoundStartText("Hell Zombie Wave " + level.Wave, 1, (1,1,1), (0.9,0.3,0.3), 0.85);
		player PlayLocalSound("flag_spawned");
		player VisionSetNakedForPlayer( "cobra_sunset2", 0 );
		VisionSetPain("cobra_sunset2");
		wait 0.05;
	}
	for( i = 0;i < level.BotsForWave;i++ )
	{
		while(AImod\_botUtil::ZombieCount() >= 25)
		{
			wait 1;
		}
		if(level.RealSpawnedBots < level.BotsForWave)
		{
			level.RealSpawnedBots++;
		}
		level.bots[i] = spawn("script_model", AImod\_botUtil::GetMapSpawnPoint());
		level.bots[i] setModel(AImod\_botUtil::GetSpawnModel());
		level.bots[i].crate1 = spawn("script_model", level.bots[i] getTagOrigin( "j_spinelower" ) + (-5,0,-10)); 
		level.bots[i].crate1 setModel("com_plasticcase_beige_big");
		level.bots[i].crate1 CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
		level.bots[i].crate1.angles = (90,0,0);
		level.bots[i].crate1 Solid();
		level.bots[i].crate1 hide();
		level.bots[i].crate1.team = "axis";
		level.bots[i].crate1.name = "botCrate" + i;
		level.bots[i].crate1 setCanDamage(true);
		level.bots[i].crate1.maxhealth = level.ZombieHealth;
		level.bots[i].crate1.health = level.ZombieHealth;
		level.bots[i].crate1 linkto( level.bots[i], "j_spinelower" );
		
		level.bots[i].head = spawn("script_model", level.bots[i] getTagOrigin( "j_spine4" ));
		level.bots[i].head setModel(AImod\_botUtil::GetHeadSpawnModelZombie());
		level.bots[i].head.angles = (270,0,270);
		level.bots[i].head.team = "axis";
		level.bots[i].head linkto( level.bots[i], "j_spine4" );
		
		level.bots[i].hasMarker = false;
		level.bots[i].team = "axis";
		level.bots[i].name = "bot" + i;
		level.bots[i].targetname = "bot";
		level.bots[i].classname = "bot";
		level.bots[i].currentsurface = "default";
		level.bots[i].kills = 0;
		level.bots[i].pers["isAlive"] = "true";
		level.bots[i].type = "normal_hell_zombie";
		level.bots[i] thread BonusDrops();
		level.bots[i] thread MonitorAttackPlayers( );
		level.bots[i] thread MonitorBotHealth();
		level.bots[i] thread KillIfUnderMap();
		level.bots[i] thread GetBestPlayerAndMoveTo();
		level.bots[i] thread NukeZombies();
		level.bots[i] thread MoniterPosition();
		level.bots[i] thread HellAnim();
		wait 0.3;
	}
	level thread MonitorFinishEvil();
}

CreateCrawlerWave( )
{
	level endon("game_ended");
	level.Wave++;
	level.BotsForWave = 1;
	level.RealSpawnedBots = 0;
	level.ZombieHealth = 6500;
	level.zState = "playing";
	level notify("zombie_round_started_end");
	if(level.Wave == 5)
	{
		level.BotsForWave = 50;
		level.ZombieHealth = 100;
		wait 0.05;
	}
	else if(level.Wave == 15)
	{
		level.BotsForWave = 100;
		level.ZombieHealth = 300;
		wait 0.05;
	}
	else if(level.Wave == 25)
	{
		level.BotsForWave = 200;
		level.ZombieHealth = 500;
		wait 0.05;
	}
	if(getDvarInt("z_dedicated") == 0)
	{
		foreach(player in level.players)
		{
			switch(randomInt(2))
			{
				case 0:
				player playLocalSound("mp_killstreak_pavelow");
				break;
				case 1:
				player playLocalSound("mp_killstreak_counteruav");
				break;
			}
		}
	}
	level thread ZombieMarkers();
	level notify("crate_gone");
	level.crawlers = 1;
	foreach( player in level.players)
	{
		player thread RoundStartText("Crawler Wave", 1, (1,1,1), (0.3,0.3,0.9), 0.85);
		player PlayLocalSound("flag_spawned");
		player VisionSetNakedForPlayer( "cobra_sunset3", 0 );
		VisionSetPain("cobra_sunset3");
		wait 0.05;
	}
	for( i = 0;i < level.BotsForWave;i++ )
	{
		while(AImod\_botUtil::ZombieCount() >= 20)
		{
			wait 1;
		}
		if(level.RealSpawnedBots < level.BotsForWave)
		{
			level.RealSpawnedBots++;
		}
		level.bots[i] = spawn("script_model", AImod\_botUtil::GetMapSpawnPoint());
		level.bots[i] setModel(AImod\_botUtil::GetCrawlerSpawnModel());
		level.bots[i].crate1 = spawn("script_model", level.bots[i] getTagOrigin( "j_spinelower" ) + (-5,0,-10)); 
		level.bots[i].crate1 setModel("com_plasticcase_beige_big");
		level.bots[i].crate1 CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
		level.bots[i].crate1.angles = (90,0,0);
		level.bots[i].crate1 Solid();
		level.bots[i].crate1 hide();
		level.bots[i].crate1.team = "axis";
		level.bots[i].crate1.name = "botCrate" + i;
		level.bots[i].crate1 setCanDamage(true);
		level.bots[i].crate1.maxhealth = level.ZombieHealth;
		level.bots[i].crate1.health = level.ZombieHealth;
		level.bots[i].crate1 linkto( level.bots[i], "j_spinelower" );
		
		level.bots[i].head = spawn("script_model", level.bots[i] getTagOrigin( "j_spine4" ));
		level.bots[i].head setModel(AImod\_botUtil::GetCrawlerHeadModel());
		level.bots[i].head.angles = (270,0,270);
		level.bots[i].head.team = "axis";
		level.bots[i].head linkto( level.bots[i], "j_spine4" );
		
		level.bots[i].hasMarker = false;
		level.bots[i].team = "axis";
		level.bots[i].name = "bot" + i;
		level.bots[i].targetname = "bot";
		level.bots[i].classname = "bot";
		level.bots[i].currentsurface = "default";
		level.bots[i].kills = 0;
		level.bots[i].pers["isAlive"] = "true";
		level.bots[i].type = "zombie_crawler";
		level.bots[i] thread BonusDrops();
		level.bots[i] thread MonitorAttackPlayers( );
		level.bots[i] thread MonitorBotHealth();
		level.bots[i] thread KillIfUnderMap();
		level.bots[i] thread GetBestPlayerAndMoveTo();
		level.bots[i] thread CrawlerAnim();
		level.bots[i] thread NukeZombies();
		level.bots[i] thread MoniterPosition();
		wait 0.3;
	}
	level thread MonitorFinishCrawler();
}

CreateBossWave( )
{
	level endon("game_ended");
	level.Wave++;
	level.BotsForWave = 1;
	level.RealSpawnedBots = 0;
	level.ZombieHealth = 50;
	level.zState = "playing";
	level notify("zombie_round_started_end");
	if(level.Wave == 10)
	{
		level.BotsForWave = 5;
		level.ZombieHealth = 5000;
		if(getDvarInt("z_dedicated") == 0)
		{
			foreach(player in level.players)
			{
				switch(randomInt(2))
				{
					case 0:
					player playLocalSound("mp_killstreak_pavelow");
					break;
					case 1:
					player playLocalSound("mp_killstreak_counteruav");
					break;
				}
			}
		}
		wait 0.05;
	}
	else if(level.Wave == 20)
	{
		level.BotsForWave = 10;
		level.ZombieHealth = 7500;
		if(getDvarInt("z_dedicated") == 0)
		{
			foreach(player in level.players)
			{
				switch(randomInt(2))
				{
					case 0:
					player playLocalSound("mp_killstreak_pavelow");
					break;
					case 1:
					player playLocalSound("mp_killstreak_counteruav");
					break;
				}
			}
		}
		wait 0.05;
	}
	else if(level.Wave == 30)
	{
		level.BotsForWave = 20;
		level.ZombieHealth = 10000;
		if(getDvarInt("z_dedicated") == 0)
		{
			foreach(player in level.players)
			{
				player playLocalSound("mp_killstreak_pavelow");
			}
		}
		wait 0.05;
	}
	level thread ZombieMarkers();
	level notify("crate_gone");
	level.boss = 1;
	foreach( player in level.players )
	{
		player PlayLocalSound("flag_spawned");
		player thread RoundStartText("Boss Wave", 1, (1,1,1), (0.9,0.3,0.3), 0.85);
		player thread RoundStartText("^1Boss Health: "+ level.ZombieHealth, 1, (1,1,1), (0.9,0.3,0.3), 0.85);
		player VisionSetNakedForPlayer( "cobra_sunset1", 0 );
		VisionSetPain("cobra_sunset1");
	}
	wait 0.05;
	for( i = 0;i < level.BotsForWave;i++ )
	{
		if(level.RealSpawnedBots < level.BotsForWave)
		{
			level.RealSpawnedBots++;
		}
		level.bots[i] = spawn("script_model", AImod\_botUtil::GetMapSpawnPoint());
		level.bots[i] setModel(AImod\_botUtil::GetBossSpawnModel( ));
		level.bots[i].crate1 = spawn("script_model", level.bots[i] getTagOrigin( "j_spinelower" ) + (-5,0,-10)); 
		level.bots[i].crate1 setModel("com_plasticcase_beige_big");
		level.bots[i].crate1 CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
		level.bots[i].crate1.angles = (90,0,0);
		level.bots[i].crate1 Solid();
		level.bots[i].crate1 hide();
		level.bots[i].crate1.team = "axis";
		level.bots[i].crate1.name = "botCrate" + i;
		level.bots[i].crate1 setCanDamage(true);
		level.bots[i].crate1.maxhealth = level.ZombieHealth;
		level.bots[i].crate1.health = level.ZombieHealth;
		level.bots[i].crate1 linkto( level.bots[i], "j_spinelower" );
		
		level.bots[i].head = spawn("script_model", level.bots[i] getTagOrigin( "j_spine4" ));
		level.bots[i].head setModel(AImod\_botUtil::GetBossHeadSpawnModel());
		level.bots[i].head.angles = (270,0,270);
		level.bots[i].head.team = "axis";
		level.bots[i].head linkto( level.bots[i], "j_spine4" );
		
		level.bots[i].hasMarker = false;
		level.bots[i].team = "axis";
		level.bots[i].name = "bot" + i;
		level.bots[i].targetname = "bot";
		level.bots[i].classname = "bot";
		level.bots[i].currentsurface = "default";
		level.bots[i].kills = 0;
		level.bots[i].pers["isAlive"] = "true";
		level.bots[i].type = "zombie_boss";
		level.bots[i] thread BonusDrops();
		level.bots[i] thread MonitorAttackPlayers( );
		level.bots[i] thread MonitorBotHealth();
		level.bots[i] thread KillIfUnderMap();
		level.bots[i] thread GetBestPlayerAndMoveTo();
		level.bots[i] thread BossAnim2();
		level.bots[i] thread NukeZombies();
		level.bots[i] thread MoniterPosition();
		wait 0.3;
	}
	level thread MonitorFinishBoss();
}

MonitorFinishHell( )
{
	level endon("crate_gone");
	for(;;)
	{
		if(AImod\_botUtil::ZombieCount() <= 0 && level.Wave < level.MaxWaves)
		{
			level.zState = "intermission";
			wait 2;
			foreach( player in level.players ) if(isDefined( player.needsToSpawn ) && player.needsToSpawn)
			{
				player notify("respawn");
				player thread [[level.SpawnClient]]();
				player allowSpectateTeam( "freelook", false );
				player.pers["botKillstreak"] = 0;
				player.pers["lastKillstreak"] = "";
				player clearLowerMessage("spawn_info");
			}
			Announcement( "^2Bonus Cash $100" );
			foreach( player in level.players )
			{
				player.gambler = 0;
				player.money += 100;
				player thread maps\mp\gametypes\_rank::giveRankXP("round_survived", 2);
				player.xpearned += 2;
				player notify("MONEY");
				player maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
				player thread maps\mp\gametypes\_hud_message::SplashNotifyDelayed( "revenge", 100 );
			}
			level.AmmoDrop = undefined;
			level thread AImod\_airdrop::C130FlyBy();
			wait 2.5;
			foreach( player in level.players )
			{
				player thread RoundEndText("Hell Wave " + level.Wave + " Survived", 1, (1,1,1), (0.3,0.9,0.3), 0.85);
				player thread IntermissionText("20 Second Intermission", 1, (1,1,0.5), (1,1,0.5), 0);
			}
			wait 2.5;
			level notify("round_ended");
			level notify("zombie_round_started_end");
			break;
		}
		else if(AImod\_botUtil::ZombieCount() <= 0 && level.Wave >= level.MaxWaves)
		{
			level thread mp\maps\HeliCrash::KillerHeli();
			break;
		}
		wait 0.05;
	}
}

MonitorFinishHellBoss( )
{
	level endon("crate_gone");
	for(;;)
	{
		if(AImod\_botUtil::ZombieCount() <= 0 && level.Wave < level.MaxWaves)
		{
			level.zState = "intermission";
			level.hellboss = 0;
			wait 2;
			foreach( player in level.players ) if(isDefined( player.needsToSpawn ) && player.needsToSpawn)
			{
				player notify("respawn");
				player thread [[level.SpawnClient]]();
				player allowSpectateTeam( "freelook", false );
				player clearLowerMessage("spawn_info");
			}
			Announcement( "^2Max Ammo for All Players And $2000" );
			foreach( player in level.players )
			{
				player SetVision();
				player.gambler = 0;
				player.money += 2000;
				player thread maps\mp\gametypes\_rank::giveRankXP("round_survived", 100);
				player.xpearned += 100;
				player notify("MONEY");
				player thread maps\mp\gametypes\_hud_message::SplashNotifyDelayed( "execution", 2000 );
				player thread AImod\_text::TextWithIcon2("^3Max Ammo!", "^2$2000", "waypoint_ammo_friendly", "ammo_crate_use");
				player maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
				player maps\mp\killstreaks\_airdrop::refillAmmo();
			}
			level SetVisionPain();
			level.AmmoDrop = undefined;
			level thread AImod\_airdrop::C130FlyBy();
			wait 2.5;
			foreach( player in level.players )
			{
				player thread RoundEndText("Hell Boss Wave Survived", 1, (1,1,1), (0.3,0.9,0.3), 0.85);
				player thread IntermissionText("20 Second Intermission", 1, (1,1,0.5), (1,1,0.5), 0);
			}
			wait 2.5;
			level notify("round_ended");
			level notify("zombie_round_started_end");
			break;
		}
		else if(AImod\_botUtil::ZombieCount() <= 0 && level.Wave >= level.MaxWaves)
		{
			level thread mp\maps\HeliCrash::KillerHeli();
			break;
		}
		wait 0.05;
	}
}

MonitorFinishEvil( )
{
	level endon("crate_gone");
	for(;;)
	{
		if(AImod\_botUtil::ZombieCount() <= 0 && level.Wave < level.MaxWaves)
		{
			level.zState = "intermission";
			level.hellzombie = 0;
			wait 2;
			foreach( player in level.players ) if(isDefined( player.needsToSpawn ) && player.needsToSpawn)
			{
				player notify("respawn");
				player thread [[level.SpawnClient]]();
				player allowSpectateTeam( "freelook", false );
				player clearLowerMessage("spawn_info");
			}
			Announcement( "^2Max Ammo for All Players And $500" );
			foreach( player in level.players )
			{
				player SetVision();
				player.gambler = 0;
				player.money += 500;
				player thread maps\mp\gametypes\_rank::giveRankXP("round_survived", 10);
				player.xpearned += 10;
				player notify("MONEY");
				player thread maps\mp\gametypes\_hud_message::SplashNotifyDelayed( "comeback", 500 );
				player thread AImod\_text::TextWithIcon2("^3Max Ammo!", "^2$500", "waypoint_ammo_friendly", "ammo_crate_use");
				player maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
				player maps\mp\killstreaks\_airdrop::refillAmmo();
			}
			level SetVisionPain();
			level.AmmoDrop = undefined;
			level thread AImod\_airdrop::C130FlyBy();
			wait 2.5;
			foreach( player in level.players )
			{
				player thread RoundEndText("Hell Wave Survived", 1, (1,1,1), (0.3,0.9,0.3), 0.85);
				player thread IntermissionText("20 Second Intermission", 1, (1,1,0.5), (1,1,0.5), 0);
			}
			wait 2.5;
			level notify("round_ended");
			level notify("zombie_round_started_end");
			break;
		}
		else if(AImod\_botUtil::ZombieCount() <= 0 && level.Wave >= level.MaxWaves)
		{
			level thread mp\maps\HeliCrash::KillerHeli();
			break;
		}
		wait 0.05;
	}
}

MonitorFinish( )
{
	level endon("crate_gone");
	for(;;)
	{
		if(AImod\_botUtil::ZombieCount() <= 0 && level.Wave < level.MaxWaves)
		{
			level.zState = "intermission";
			wait 2;
			foreach( player in level.players ) if(isDefined( player.needsToSpawn ) && player.needsToSpawn)
			{
				player notify("respawn");
				player thread [[level.SpawnClient]]();
				player allowSpectateTeam( "freelook", false );
				player.pers["botKillstreak"] = 0;
				player.pers["lastKillstreak"] = "";
				player clearLowerMessage("spawn_info");
			}
			Announcement( "^2Bonus Cash $100" );
			foreach( player in level.players )
			{
				player.gambler = 0;
				player thread maps\mp\gametypes\_rank::scorePopup( 100, 0, (0,1,0), 1 );
				player thread maps\mp\gametypes\_rank::giveRankXP("round_survived", 2);
				player.xpearned += 2;
				player.money += 100;
				player notify("MONEY");
				player maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
				player thread maps\mp\gametypes\_hud_message::SplashNotifyDelayed( "revenge", 100 );
			}
			wait 2.5;
			foreach( player in level.players )
			{
				player thread RoundEndText("Wave " + level.Wave + " Survived", 1, (1,1,1), (0.3,0.9,0.3), 0.85);
				player thread IntermissionText("20 Second Intermission", 1, (1,1,0.5), (1,1,0.5), 0);
			}
			wait 2.5;
			level notify("round_ended");
			level notify("zombie_round_started_end");
			break;
		}
		else if(AImod\_botUtil::ZombieCount() <= 0 && level.Wave >= level.MaxWaves)
		{
			level thread mp\maps\HeliCrash::KillerHeli();
			break;
		}
		wait 0.05;
	}
}

MonitorFinishBoss( )
{
	level endon("crate_gone");
	for(;;)
	{
		if(AImod\_botUtil::ZombieCount() <= 0 && level.Wave < level.MaxWaves)
		{
			level.zState = "intermission";
			level.boss = 0;
			wait 2;
			foreach( player in level.players ) if(isDefined( player.needsToSpawn ) && player.needsToSpawn)
			{
				player notify("respawn");
				player thread [[level.SpawnClient]]();
				player allowSpectateTeam( "freelook", false );
				player clearLowerMessage("spawn_info");
			}
			Announcement( "^2Max Ammo for All Players And $2000" );
			foreach( player in level.players )
			{
				player SetVision();
				player.gambler = 0;
				player.money += 2000;
				player thread maps\mp\gametypes\_rank::giveRankXP("boss_round_survived", 100);
				player.xpearned += 100;
				player notify("MONEY");
				player thread AImod\_text::TextWithIcon2("^3Max Ammo!", "^2$2000", "waypoint_ammo_friendly", "ammo_crate_use");
				player thread AImod\_Mod::TextPopup( "Max Ammo!" );
				player thread maps\mp\gametypes\_rank::scorePopup( 2000, 0, (0,1,0), 1 );
				player maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
				player maps\mp\killstreaks\_airdrop::refillAmmo();
			}
			level SetVisionPain();
			level.AmmoDrop = undefined;
			level thread AImod\_airdrop::C130FlyBy();
			wait 2.5;
			foreach( player in level.players )
			{
				player thread RoundEndText("Boss Wave Survived", 1, (1,1,1), (0.3,0.9,0.3), 0.85);
				player thread IntermissionText("20 Second Intermission", 1, (1,1,0.5), (1,1,0.5), 0);
			}
			wait 2.5;
			level notify("round_ended");
			level notify("zombie_round_started_end");
			break;
		}
		else if(AImod\_botUtil::ZombieCount() <= 0 && level.Wave >= level.MaxWaves)
		{
			level thread mp\maps\HeliCrash::KillerHeli();
			break;
		}
		wait 0.05;
	}
}

MonitorFinishCrawler( )
{
	level endon("crate_gone");
	for(;;)
	{
		if(AImod\_botUtil::ZombieCount() <= 0 && level.Wave < level.MaxWaves)
		{
			level.zState = "intermission";
			level.crawlers = 0;
			wait 2;
			foreach( player in level.players ) if(isDefined( player.needsToSpawn ) && player.needsToSpawn)
			{
				player notify("respawn");
				player thread [[level.SpawnClient]]();
				player allowSpectateTeam( "freelook", false );
				player clearLowerMessage("spawn_info");
			}
			Announcement( "^2Max Ammo for All Players And $500" );
			foreach( player in level.players )
			{
				player SetVision();
				player.gambler = 0;
				player.money += 500;
				player thread maps\mp\gametypes\_rank::giveRankXP("crawler_round_survived", 20);
				player.xpearned += 20;
				player notify("MONEY");
				player thread AImod\_text::TextWithIcon2("^3Max Ammo!", "^2$500", "waypoint_ammo_friendly", "ammo_crate_use");
				player thread AImod\_Mod::TextPopup( "Max Ammo!" );
				player thread maps\mp\gametypes\_rank::scorePopup( 500, 0, (0,1,0), 1 );
				player maps\mp\perks\_perks::givePerk( "frag_grenade_mp" );
				player maps\mp\killstreaks\_airdrop::refillAmmo();
			}
			level SetVisionPain();
			level.AmmoDrop = undefined;
			level thread AImod\_airdrop::C130FlyBy();
			wait 2.5;
			foreach( player in level.players )
			{
				player thread RoundEndText("Crawler Wave Survived", 1, (1,1,1), (0.3,0.9,0.3), 0.85);
				player thread IntermissionText("20 Second Intermission", 1, (1,1,0.5), (1,1,0.5), 0);
			}
			wait 2.5;
			level notify("round_ended");
			level notify("zombie_round_started_end");
			break;
		}
		else if(AImod\_botUtil::ZombieCount() <= 0 && level.Wave >= level.MaxWaves)
		{
			level thread mp\maps\HeliCrash::KillerHeli();
			break;
		}
		wait 0.05;
	}
}

MonitorBotHealth( )
{
	self endon("bot_is_dead");
	level endon("round_ended");
	pTemp = "";
	for(;;)
	{
		self.crate1 waittill("damage", iDamage, attacker, iDFlags, vPoint, type, victim, vDir, sHitLoc, psOffsetTime, sWeapon);
			
		{
			attacker thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback(sHitLoc);
			{
				playFx(level.bloodfx,vPoint);
				self notify("hit");
				if(self.type != "zombie_crawler")
				{
					self thread HitPainAnim();
				}
				attacker.money += 5;
				attacker thread maps\mp\gametypes\_rank::scorePopup( 5, 0, (0,1,0), 1 );
				attacker notify("MONEY");
				attacker.score += 5;
				if(sWeapon == "pavelow_minigun_mp")
					self.crate1.health += 20;
				self thread IncreaseDamage(sWeapon,type);
			}
		}
		if( (self.crate1.health <= 0) && (self.name != pTemp) )
		{
		    self.crate1 thread DeleteZombie();
			self.speed = 1;
			self.pers["isAlive"] = "false";
			wait 0.1;
			self notify("bot_death");
			self.knife delete();
			playFx(level.bloodfx,vPoint);
			if(self.type == "zombie_crawler")
			{
				self moveTo(self.origin + (0,0,4000),7); // Crawler Death
				self scriptModelPlayAnim("pb_prone_death_quickdeath"); // Crawler Death
			}
			else
				self thread DeathReguler(); //Reguler Death Anim
			self thread DeathSound(); //Death Sound
			if(attacker.usingairstrike == "true")
			{
				attacker thread ZombieAirstrikeSound(sWeapon);
			}
			attacker thread multikill();
			if(IfCanBlowUp(sWeapon) == true)
				self blowBackGrenade(vPoint);
			if(IfCanSetOnFire(sWeapon) == true)
			{
				playFx(loadFx("props/barrelExp"), self.origin);
				self playSound("explo_mine");
				PhysicsExplosionSphere( self.origin, 230, 0, 3 );
				self thread DeleteZombie();
				self notify("bot_death");
			}
			if(attacker.extra <= 0 && attacker.ammomatic == 0)
			{
				attacker thread maps\mp\gametypes\_rank::scorePopup( 50, 0, (0,1,0), 1 );
				attacker.kills += 1;
				attacker.pers["kills"] = attacker.kills;
				attacker notify("zombie_killed");
				attacker.money += 50;
				attacker notify("MONEY");
				attacker.score += 50;
				attacker.bonus += 1;
				attacker notify("BONUS");
				attacker.pers["score"] = attacker.score;
				attacker.pers["botKillstreak"]++;
			}
			else if(attacker.extra >= 1 && attacker.ammomatic == 0)
			{
				attacker thread maps\mp\gametypes\_rank::scorePopup( 100, 0, (0,1,0), 1 );
				attacker.kills += 1;
				attacker.pers["kills"] = attacker.kills;
				attacker notify("zombie_killed");
				attacker.money += 100;
				attacker notify("MONEY");
				attacker.score += 100;
				attacker.bonus += 1;
				attacker notify("BONUS");
				attacker.pers["score"] = attacker.score;
				attacker.pers["botKillstreak"]++;
			}
			else if(attacker.extra <= 0 && attacker.ammomatic == 1)
			{
				currentWeapon = attacker getCurrentWeapon();
				stock = attacker getWeaponAmmoStock(currentWeapon);
				attacker thread maps\mp\gametypes\_rank::scorePopup( 50, 0, (0,1,0), 1 );
				attacker.kills += 1;
				attacker.pers["kills"] = attacker.kills;
				attacker notify("zombie_killed");
				attacker.money += 50;
				attacker notify("MONEY");
				attacker.score += 50;
				attacker.bonus += 1;
				attacker notify("BONUS");
				attacker.pers["score"] = attacker.score;
				attacker.pers["botKillstreak"]++;
				attacker setWeaponAmmoStock( currentWeapon, stock + AmmoMaticAdd(sWeapon) );
			}
			else if(attacker.extra >= 1 && attacker.ammomatic == 1)
			{
				currentWeapon = attacker getCurrentWeapon();
				stock = attacker getWeaponAmmoStock(currentWeapon);
				attacker thread maps\mp\gametypes\_rank::scorePopup( 100, 0, (0,1,0), 1 );
				attacker.kills += 1;
				attacker.pers["kills"] = attacker.kills;
				attacker notify("zombie_killed");
				attacker.money += 100;
				attacker notify("MONEY");
				attacker.score += 100;
				attacker.bonus += 1;
				attacker notify("BONUS");
				attacker.pers["score"] = attacker.score;
				attacker.pers["botKillstreak"]++;
				attacker setWeaponAmmoStock( currentWeapon, stock + AmmoMaticAdd(sWeapon) );
			}
			attacker thread maps\mp\gametypes\_rank::giveRankXP("zombie_kill", 25);
			if(isDefined(self.hasc4))
			{
				playFx(loadFx("props/barrelExp"), self.origin);
				RadiusDamage( self.origin, 150, 90, 10, attacker );
				PhysicsExplosionSphere( self.origin, 230, 0, 3 );
				self playSound("explo_mine");
				self.c4 delete();
			}
			wait 0.5;
			if(self.type != "zombie_crawler")
				self startRagDoll(1);
			wait 5;
			pTemp = self.name;
			if(self.type == "zombie_crawler")
				playFx(loadFx("props/barrelExp"), self.origin);
			self thread DeleteZombie();
			self notify("bot_is_dead");
		}
		wait 0.05;
	}
}

DeleteZombie()
{
	wait 0.001;
	self delete();
	self.head delete();
	self.c4 delete();
	self.knife delete();
	self.shield delete();
}

BotMoveWaypoints()
{
	if(self.automove == 1)
	{
		return;
	}
	self endon("stop_auto_move");
	self endon("bot_death");
	TmpDist = 0;
	pTarget = undefined;
	pWaypoint = undefined;
	movetoLoc = undefined;
	if(!isDefined(self.currentwaypoint))
	{
		self.currentwaypoint = level.botwaypoints[999999999999999];
	}
	if(isDefined(level.botwaypoints))
	{
		for(i = 0; i < level.botwaypoints.size; i++)
		{
			if(distance(self.origin, level.botwaypoints[i].origin) > TmpDist && self.currentwaypoint != level.botwaypoints[i] && bulletTracePassed( self.origin+(0,0,75), level.botwaypoints[i].origin, false, self ))
			{
				TmpDist = distance(self.origin, level.botwaypoints[i].origin);
				pWaypoint = level.botwaypoints[i];
			}
		}
	}
	if(isDefined(pWaypoint))
	{
		self.automove = 1;
		self.currentwaypoint = pWaypoint;
		movetoLoc = VectorToAngles( pWaypoint.origin - self.origin );
		self RotateTo((0,movetoLoc[1],0), 0.1);
		while(self.origin[0] != pWaypoint.origin[0])
		{
			trace = bulletTrace(self.origin + (0,0,50), self.origin + (0,0,-40), false, self);
			if(isdefined(trace["entity"]) && isDefined(trace["entity"].targetname) && trace["entity"].targetname == "bot")
				trace = bulletTrace(self.origin + (0,0,50), self.origin + (0,0,-40), false, trace["entity"]);
			self.origin = (trace["position"]);
			self.currentsurface = trace["surfacetype"];
			if(self.currentsurface == "none")
				self.currentsurface = "default";
			self MoveTo(pWaypoint.origin, (distance(self.origin, pWaypoint.origin) / self.speed));
			wait 0.2;
		}
		self.automove = 0;
	}
}

GetBestPlayerAndMoveTo( )
{
	self endon("bot_death");
	self endon("stop_bot");

	for(;;)
	{
		TmpDist = 999999999;
		pTarget = undefined;
		pAngles = undefined;
		movetoLoc = undefined;

		while(self.freezed == 1 || getDvarInt("z_find") == 0)
		{
			//Clamp to the ground has been moved into one function
			trace = bulletTrace(self.origin + (0,0,50), self.origin + (0,0,-40), false, self);
			if(isdefined(trace["entity"]) && isDefined(trace["entity"].targetname) && trace["entity"].targetname == "bot")
				trace = bulletTrace(self.origin + (0,0,50), self.origin + (0,0,-40), false, trace["entity"]);
			self.origin = (trace["position"]);
			self.currentsurface = trace["surfacetype"];
			if(self.currentsurface == "none")
				self.currentsurface = "default";
				
			if(self.idleanimation == 0)
			{
				self scriptModelPlayAnim("pb_stand_alert");
				self.idleanimation = 1;
			}
			
			wait 0.1;
		}
			
		foreach( player in level.players )
		{				
			if(!isAlive(player))
                continue;
				
			if(level.teamBased && self.team == player.pers["team"])
                continue;
				
			if( !bulletTracePassed( self.origin+(0,0,75), player.origin+(0,0,65), false, self ) )
                continue;
				
			if(player.sessionstate != "playing")
				continue;
				
			if(player.inLastStand == true)
				continue;
				
			if(distancesquared(self.origin, player.origin) < TmpDist)
			{
				TmpDist = distancesquared(self.origin, player.origin);
				pTarget = player;
				pAngles = "player";
			}
		}
		if(pAngles == "player")
		{
			movetoLoc = VectorToAngles( pTarget.origin - self.origin );
		}
		if(!isDefined(pTarget))
		{
			if(!isDefined(level.botwaypoints[0]))
			{
				if(self.idleanimation == 0)
				{
					self scriptModelPlayAnim("pb_stand_alert");
					self.idleanimation = 1;
					//Clamp to the ground has been moved into one function
					trace = bulletTrace(self.origin + (0,0,50), self.origin + (0,0,-40), false, self);
					if(isdefined(trace["entity"]) && isDefined(trace["entity"].targetname) && trace["entity"].targetname == "bot")
						trace = bulletTrace(self.origin + (0,0,50), self.origin + (0,0,-40), false, trace["entity"]);
					self.origin = (trace["position"]);
					self.currentsurface = trace["surfacetype"];
					if(self.currentsurface == "none")
						self.currentsurface = "default";
				}
			}
			else
			{
				self thread BotMoveWaypoints();
			}
		}
		if(isDefined(pTarget))
		{
			if(self.idleanimation == 1)
			{
				self scriptModelPlayAnim(self.animation);
				self.idleanimation = 0;
			}
			//Clamp to the ground has been moved into one function
			trace = bulletTrace(self.origin + (0,0,50), self.origin + (0,0,-40), false, self);
			if(isdefined(trace["entity"]) && isDefined(trace["entity"].targetname) && trace["entity"].targetname == "bot")
				trace = bulletTrace(self.origin + (0,0,50), self.origin + (0,0,-40), false, trace["entity"]);
			self.origin = (trace["position"]);
			self.currentsurface = trace["surfacetype"];
			if(self.currentsurface == "none")
				self.currentsurface = "default";
			self notify("stop_auto_move");
			self.automove = 0;
		}
		movetoLoc = VectorToAngles( pTarget getTagOrigin("j_head") - self getTagOrigin( "j_head" ) );
		self RotateTo((0,movetoLoc[1],0), 0.1);
		self MoveTo(pTarget.origin, (distance(self.origin, pTarget.origin) / self.speed));
		
	wait 0.1;
	}
}

MonitorAttackPlayers( )
{
	self endon("bot_death");
	while(isDefined(self))
	{
		foreach( player in level.players )
		{
			pTarget = player;
			if(distancesquared(player.origin, self.origin) <= 729 && player.inLastStand != true && player.inFinalStand != true && player.pers["team"] == "allies")
			{
				self.knife = spawn("script_model", self getTagOrigin("tag_inhand"));
				self.knife setModel("weapon_parabolic_knife");
				self.knife.angles = (0,0,0);
				self.knife linkto( self, "tag_inhand" );
				self scriptModelPlayAnim("pt_melee_pistol_1");
				wait 0.15;
				self playSound("melee_knife_stab");
				playFx(level.bloodfx,self.origin+(0,0,30));
				player thread maps\mp\gametypes\_damage::finishPlayerDamageWrapper( self, self, 50, 0, "MOD_MELEE", "none", player.origin, player.origin, "none", 0, 0 );
				wait 1;
				self.knife delete();
				self scriptModelPlayAnim(self.animation);
			}
		}
		wait 0.07;
	}
}

ZombieMarkers()
{
	self endon("bot_is_dead");
	level endon("round_ended");
	wait 5;
	for(;;)
	{
		if(AImod\_botUtil::ZombieCount() <= level.BotsForIcons && level.RealSpawnedBots > level.BotsForIcons) for(i = 0;i < level.BotsForWave;i++)
		{
			if((isDefined(level.bots[i])) && (isDefined(level.bots[i].crate1.health)) && (level.bots[i].crate1.health > 0) && (!level.bots[i].hasMarker))
			{
				if ( isdefined( self.lastDeathIcon ) )
				{
					level.bots[i].lastDeathIcon destroy();
				}
				newdeathicon = newHudElem();
				newdeathicon.x = level.bots[i].origin[0];
				newdeathicon.y = level.bots[i].origin[1];
				newdeathicon.z = level.bots[i].origin[2] + 54;
				newdeathicon.alpha = .61;
				newdeathicon.archived = true;
				newdeathicon setShader("cardicon_skull", 10, 10);
				newdeathicon setwaypoint( true, false );
				level.bots[i].lastDeathIcon = newdeathicon;
				level.bots[i].hasMarker = true;
				level.bots[i] thread MoveIcon(level.bots[i].lastDeathIcon);
				level.bots[i] thread BotDestroyOnDeath(level.bots[i].lastDeathIcon);
			}
		}
		else if(AImod\_botUtil::ZombieCount() > level.BotsForIcons) for(i = 0;i < level.BotsForWave;i++)
		{
			if((isDefined(level.bots[i])) && (isDefined(level.bots[i].crate1.health)) && (level.bots[i].crate1.health > 0) && (level.bots[i].hasMarker))
			{
				if ( isdefined( self.lastDeathIcon ) )
				{
					level.bots[i].lastDeathIcon destroy();
				}
				level.bots[i].hasMarker = false;
				level.bots[i] notify("noicon");
			}
		}
		wait 0.1;
	}
}

MoveIcon(icon)
{
	self endon("bot_is_dead");
	self endon("noicon");
	for(;;)
	{
		icon.x = self.origin[0];
		icon.y = self.origin[1];
		icon.z = self.origin[2] + 54;
		wait 0.05;
	}
}

KillIfUnderMap()
{
	self endon("bot_is_dead");
	for(;;)
	{
		if(self.origin[2] <= -1585 && getDvar("mapname") == "mp_afghan")
		{
			self notify("bot_death");
			self.crate1 delete();
			self.crate1 notify("bot_death");
			if(self.type == "crawler")
				self scriptModelPlayAnim("pb_prone_death_quickdeath"); // Crawler Death
			else
				self thread DeathReguler(); //Reguler Death Anim
			self thread DeathSound();
			wait 1;
			self startRagDoll(1);
			wait 5;
			self thread DeleteZombie();
			self notify("bot_is_dead");
			break;
		}	
		if(self.origin[2] <= -350 && getDvar("mapname") == "mp_vacant")
		{
			self notify("bot_death");
			self.crate1 delete();
			self.crate1 notify("bot_death");
			if(self.type == "crawler")
				self scriptModelPlayAnim("pb_prone_death_quickdeath"); // Crawler Death
			else
				self thread DeathReguler(); //Reguler Death Anim
			self thread DeathSound();
			wait 1;
			self startRagDoll(1);
			wait 5;
			self thread DeleteZombie();
			self notify("bot_is_dead");
			break;
		}	
		if(self.origin[2] <= -100 && getDvar("mapname") == "mp_storm")
		{
			self notify("bot_death");
			self.crate1 delete();
			self.crate1 notify("bot_death");
			if(self.type == "crawler")
				self scriptModelPlayAnim("pb_prone_death_quickdeath"); // Crawler Death
			else
				self thread DeathReguler(); //Reguler Death Anim
			self thread DeathSound();
			wait 1;
			self startRagDoll(1);
			wait 5;
			self thread DeleteZombie();
			self notify("bot_is_dead");
			break;
		}	
		if(self.origin[2] <= -333 && getDvar("mapname") == "mp_rust")
		{
			self notify("bot_death");
			self.crate1 delete();
			self.crate1 notify("bot_death");
			if(self.type == "crawler")
				self scriptModelPlayAnim("pb_prone_death_quickdeath"); // Crawler Death
			else
				self thread DeathReguler(); //Reguler Death Anim
			self thread DeathSound();
			wait 1;
			self startRagDoll(1);
			wait 5;
			self thread DeleteZombie();
			self notify("bot_is_dead");
			break;
		}	
		if(self.origin[2] <= -782 && getDvar("mapname") == "mp_estate")
		{
			self notify("bot_death");
			self.crate1 delete();
			self.crate1 notify("bot_death");
			if(self.type == "crawler")
				self scriptModelPlayAnim("pb_prone_death_quickdeath"); // Crawler Death
			else
				self thread DeathReguler(); //Reguler Death Anim
			self thread DeathSound();
			wait 1;
			self startRagDoll(1);
			wait 5;
			self thread DeleteZombie();
			self notify("bot_is_dead");
			break;
		}	
		if(self.origin[2] <= 1674 && getDvar("mapname") == "mp_highrise" && level.edit == 0)
		{
			self notify("bot_death");
			self.crate1 delete();
			self.crate1 notify("bot_death");
			if(self.type == "crawler")
				self scriptModelPlayAnim("pb_prone_death_quickdeath"); // Crawler Death
			else
				self thread DeathReguler(); //Reguler Death Anim
			self thread DeathSound();
			wait 1;
			self startRagDoll(1);
			wait 5;
			self thread DeleteZombie();
			self notify("bot_is_dead");
			break;
		}	
		if(self.origin[2] <= -113 && getDvar("mapname") == "mp_trailerpark")
		{
			self notify("bot_death");
			self.crate1 delete();
			self.crate1 notify("bot_death");
			if(self.type == "crawler")
				self scriptModelPlayAnim("pb_prone_death_quickdeath"); // Crawler Death
			else
				self thread DeathReguler(); //Reguler Death Anim
			self thread DeathSound();
			wait 1;
			self startRagDoll(1);
			wait 5;
			self thread DeleteZombie();
			self notify("bot_is_dead");
			break;
		}	
		if(self.origin[2] <= 32 && getDvar("mapname") == "mp_crash")
		{
			self notify("bot_death");
			self.crate1 delete();
			self.crate1 notify("bot_death");
			if(self.type == "crawler")
				self scriptModelPlayAnim("pb_prone_death_quickdeath"); // Crawler Death
			else
				self thread DeathReguler(); //Reguler Death Anim
			self thread DeathSound();
			wait 1;
			self startRagDoll(1);
			wait 5;
			self thread DeleteZombie();
			self notify("bot_is_dead");
			break;
		}	
		if(self.origin[2] <= -108 && getDvar("mapname") == "mp_highrise" && level.edit == 1)
		{
			self notify("bot_death");
			self.crate1 delete();
			self.crate1 notify("bot_death");
			if(self.type == "crawler")
				self scriptModelPlayAnim("pb_prone_death_quickdeath"); // Crawler Death
			else
				self thread DeathReguler(); //Reguler Death Anim
			self thread DeathSound();
			wait 1;
			self startRagDoll(1);
			wait 5;
			self thread DeleteZombie();
			self notify("bot_is_dead");
			break;
		}	
		wait 1;
	}
}