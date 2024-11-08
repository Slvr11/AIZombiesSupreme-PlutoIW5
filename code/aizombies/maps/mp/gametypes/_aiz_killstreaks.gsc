#include maps\mp\gametypes\_aiz;
#include maps\mp\gametypes\_aiz_hud;
#include maps\mp\gametypes\_aiz_bot_util;
#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

init()
{
    level.nukeInbound = false;
    level.empKills = 25;
    level.nukeTime = 10;
    level.mapStreakKills = undefined;
    level.mapStreakWeapon = "killstreak_double_uav_mp";
    level.mapStreakIcon = "white";
    level.mapStreakName = level.gameStrings[215];
    level.littlebirdOut = false;
    level.overwatchOut = false;
    level.airstrikeOut = false;
    level.mapStreakOut = false;
    level.heliSnipers = [];

    if (!isDefined(level.botAnims))
    {
        level.botAnims = [];
    }
    level.botAnims["idle"] = "pb_stand_alert";
    level.botAnims["idleRPG"] = "pb_stand_alert_RPG";
    level.botAnims["idleMG"] = "pb_stand_alert_mg";
    level.botAnims["idlePistol"] = "pb_stand_alert_pistol";
    level.botAnims["run"] = "pb_sprint_assault";
    level.botAnims["runSMG"] = "pb_sprint_smg";
    level.botAnims["runMG"] = "pb_sprint_lmg";
    level.botAnims["runPistol"] = "pb_pistol_run_fast";
    level.botAnims["runSniper"] = "pb_sprint_sniper";
    level.botAnims["runShotgun"] = "pb_sprint_shotgun";
    level.botAnims["runRPG"] = "pb_sprint_RPG";
    level.botAnims["shoot"] = "pt_stand_shoot";
    level.botAnims["shootRPG"] = "pt_stand_shoot_RPG";
    level.botAnims["shootMG"] = "pt_stand_shoot_mg";
    level.botAnims["shootPistol"] = "pt_stand_shoot_pistol";
    level.botAnims["reload"] = "pt_reload_stand_auto";
    level.botAnims["reloadRPG"] = "pt_reload_stand_RPG";
    level.botAnims["reloadPistol"] = "pt_reload_stand_pistol";
    level.botAnims["reloadMG"] = "pt_reload_stand_mg";
    level.botWeaponModel_subBot = "iw5_ump45_mp";
    level.botWeapon_subBot = "artillery_mp";
    level.botWeaponModel_LMGBot = "iw5_sa80_mp";
    level.botWeapon_LMGBot = "ugv_turret_mp";

    level.heliHeight = 1500;

    level.visionRestored = false;

    thread monitorAllHeliSnipers();

    if (level.classicKillstreaks == 1 || (level.classicKillstreaks == 2 && array_contains(level.classicMaps, level._mapname)))
        initMW2Airstrike();
}

checkKillstreak()
{
    streak = self.kills;
    if (streak == 50)
    {
        self playLocalSound("US_1mc_achieve_predator");
        self showHudSplash("predator_missile", 0, streak);
        self giveWeapon("killstreak_predator_missile_mp", 0, false);
        self setActionSlot(4, "weapon", "killstreak_predator_missile_mp");
        self.ownsPredator = true;
    }
    else if (streak == 100)
    {
        self playLocalSound("US_1mc_achieve_sentrygun");
        self showHudSplash("sentry", 0, streak);
        self giveWeapon("killstreak_sentry_mp", 0, false);
        self setActionSlot(5, "weapon", "killstreak_sentry_mp");
        self.ownsSentry = true;
    }
    else if (streak == 125 && (level.classicKillstreaks == 1 || (level.classicKillstreaks == 2 && array_contains(level.classicMaps, level._mapname))))
    {
        self playLocalSound("US_1mc_achieve_airstrike");
        self showHudSplash("airstrike_legacy", 0, streak);
        self giveWeapon("killstreak_airstrike_mp", 0, false);
        self setActionSlot(5, "weapon", "killstreak_airstrike_mp");
        self.ownsMW2Airstrike = true;
    }
    else if (streak == 150)
    {
        self playLocalSound("US_1mc_achieve_carepackage");
        self showHudSplash("airdrop_assault", 0, streak);
        self giveWeapon("airdrop_marker_mp", 0, false);
        self setActionSlot(5, "weapon", "airdrop_marker_mp");
        self.ownsAirdrop = true;
    }
    else if (streak == level.empKills)
    {
        self playLocalSound("US_1mc_achieve_emp");
        if (level.isHellMap)
            self showHudSplash("emp_2", 0, streak);
        else
            self showHudSplash("emp", 0, streak);
        self giveWeapon("killstreak_emp_mp", 0, false);
        self setActionSlot(6, "weapon", "killstreak_emp_mp");
        self.ownsEMP = true;
    }
    else if (streak == 200)
    {
        self playLocalSound("US_1mc_achieve_airstrike");
        self showHudSplash("airstrike", 0, streak);
        self giveWeapon("strike_marker_mp", 0, false);
        self setActionSlot(5, "weapon", "strike_marker_mp");
        self.ownsAirstrike = true;
    }
    else if (streak == 250)
    {
        self playLocalSound("US_1mc_achieve_turret");
        self showHudSplash("gl_turret", 0, streak);
        self giveWeapon("killstreak_remote_turret_mp", 0, false);
        self setActionSlot(5, "weapon", "killstreak_remote_turret_mp");
        self.ownsSentryGL = true;
    }
    else if (streak == 275 && (level.classicKillstreaks == 1 || (level.classicKillstreaks == 2 && array_contains(level.classicMaps, level._mapname))))
    {
        self playLocalSound("US_1mc_achieve_airstrike");
        self showHudSplash("super_airstrike", 0, streak);
        self giveWeapon("killstreak_super_airstrike_mp", 0, false);
        self setActionSlot(7, "weapon", "killstreak_super_airstrike_mp");
        self.ownsSuperAirstrike = true;
    }
    else if (streak == 300)
    {
        //self playLocalSound("US_1mc_");
        self showHudSplash("deployable_exp_ammo", 0, streak);
        self giveWeapon("deployable_vest_marker_mp", 0, false);
        self setActionSlot(6, "weapon", "deployable_vest_marker_mp");
        self.ownsExpAmmo = true;
    }
    else if (streak == 400)
    {
        self playLocalSound("US_1mc_achieve_emergairdrop");
        self showHudSplash("airdrop_mega", 0, streak);
        self giveWeapon("airdrop_mega_marker_mp", 0, false);
        self setActionSlot(7, "weapon", "airdrop_mega_marker_mp");
        self.ownsEmergencyAirdrop = true;
    }
    else if (streak == 450 && (level.classicKillstreaks == 1 || (level.classicKillstreaks == 2 && array_contains(level.classicMaps, level._mapname))))
    {
        self playLocalSound("US_1mc_achieve_littlebird");
        self showHudSplash("overwatch", 0, streak);
        self giveWeapon("killstreak_helicopter_flares_mp", 0, false);
        self setActionSlot(4, "weapon", "killstreak_helicopter_flares_mp");
        self.ownsOverwatch = true;
    }
    else if (streak == 500)
    {
        self playLocalSound("US_1mc_achieve_moab");
        self showHudSplash("nuke", 0, streak);
        self giveWeapon("killstreak_helicopter_mp", 0, false);
        self setActionSlot(7, "weapon", "killstreak_helicopter_mp");
        self.ownsNuke = true;
    }
    else if (streak == 750)
    {
        self playLocalSound("US_1mc_achieve_dragonfly");
        self showHudSplash("remote_uav", 0, streak);
        self giveWeapon("killstreak_uav_mp", 0, false);
        self setActionSlot(4, "weapon", "killstreak_uav_mp");
        self.ownsLittlebird = true;
    }
    else if (streak == 800)
    {
        self playLocalSound("US_1mc_achieve_heli_sniper");
        self showHudSplash("heli_sniper", 0, streak);
        self giveWeapon("killstreak_ims_mp", 0, false);
        self setActionSlot(4, "weapon", "killstreak_ims_mp");
        self.ownsHeliSniper = true;
    }
    /*
    else if (streak == 1000 && level._mapname != "mp_carbon" && level._mapname != "mp_cement" && level._mapname != "mp_underpass" && !self.ownsBot)
    {
        self.ownsBot = true;
        self iPrintLnBold(level.gameStrings[216]);
        self spawnBotForPlayer();
        wait(1);
        self iPrintLnBold(level.gameStrings[217]);
    }
    */
    else if (streak == 350/* && level._mapname != "mp_carbon" && level._mapname != "mp_cement" && level._mapname != "mp_underpass"*/ && !self.ownsSubBot)
    {
        //self iPrintLnBold(level.gameStrings[218], level.gameStrings[226]);
        self showHudSplash("bot_smg", 0, streak);
        self playLocalSound("mp_killstreak_juggernaut");
        self giveWeapon("killstreak_triple_uav_mp", 0, false);
        self setActionSlot(6, "weapon", "killstreak_triple_uav_mp");
        self.ownsSubBot = true;
    }
    else if (streak == 600/* && level._mapname != "mp_carbon" && level._mapname != "mp_cement" && level._mapname != "mp_underpass"*/ && !self.ownsLMGBot)
    {
        //self iPrintLnBold(level.gameStrings[218], level.gameStrings[227]);
        self showHudSplash("bot_lmg", 0, streak);
        self playLocalSound("mp_killstreak_juggernaut");
        self giveWeapon("killstreak_counter_uav_mp", 0, false);
        self setActionSlot(7, "weapon", "killstreak_counter_uav_mp");
        self.ownsLMGBot = true;
    }
    else if (isDefined(level.mapStreakKills) && streak == level.mapStreakKills)
    {
        self playLocalSound("counter_uav_activate");
        self giveWeapon(level.mapStreakWeapon, 0, false);
        self setActionSlot(7, "weapon", level.mapStreakWeapon);
        self showHudSplash(level.mapStreakName, 0, streak);
        self.ownsMapStreak = true;
    }
    self shuffleStreaks();//update HUD
}

giveKillstreak(streak)
{
    oldStreak = self.kills;
    switch (streak)
    {
        case 0:
            maps\mp\gametypes\_aiz_bonus_drops::spawnBonusDrop(3, self.origin);
            return;
        case 1:
            streak = 50;
            break;
        case 2:
            streak = 100;
            break;
        case 3:
            streak = level.empKills;
            break;
        case 4:
            streak = 300;
            break;
        case 5:
            streak = 500;
            break;
        case 6:
            streak = 750;
            break;
        case 7:
            streak = 800;
            break;
        case 8:
            streak = 200;
            break;
        case 9:
            streak = 250;
            break;
        case 10:
            streak = 150;
            break;
        case 11:
            streak = 400;
            break;
        case 12:
            streak = 125;
            break;
        case 13:
            streak = 275;
            break;
        case 14:
            streak = 450;
            break;
        default:
            return;
    }
    self.kills = streak;
    self checkKillstreak();
    self.kills = oldStreak;
}
getKillstreakCrateIcon(streak)
{
    switch (streak)
    {
        case 0:
            return "waypoint_ammo_friendly";
        case 1:
            return "specialty_predator_missile_crate";
        case 2:
            return "specialty_sentry_gun_crate";
        case 3:
            return "specialty_emp_crate";
        case 4:
            return "killstreak_deployable_exp_ammo_crate";
        case 5:
            return "specialty_nuke_crate";
        case 6:
            return "killstreak_dragonfly_drone_crate";
        case 7:
            return "killstreak_heli_sniper_crate";
        case 8:
            return "killstreak_airstrike_crate";
        case 9:
            return "killstreak_gl_turret_crate";
        case 10:
            return "specialty_carepackage";
        case 11:
            return "specialty_airdrop_emergency_crate";
        case 12:
            return "specialty_precision_airstrike_crate";
        case 13:
            return "specialty_ac130_crate";
        case 14:
            return "specialty_pave_low_crate";
    }

    return "white";
}

executeKillstreak(newWeap)
{
    if (!isDefined(self.isDown)) return;

    self maps\mp\gametypes\_aiz_hud::updateAmmoHud(false);
    //killstreaks
    if (newWeap != self getCurrentWeapon()) return;

    if (self.ownsPredator && newWeap == "killstreak_predator_missile_mp")
    {
        self thread launchMissile();
        self thread takeWeaponAfterWait(0.75, "killstreak_predator_missile_mp");
        self switchToWeapon(self.lastDroppableWeapon);
    }
    else if (self.ownsSentry && newWeap == "killstreak_sentry_mp")
    {
        self spawnSentry(false);
        //sentryModel = self spawnSentry();
        //if (isDefined(sentryModel))
        //self thread sentryHoldWatcher(sentryModel, true);
        self switchToWeapon(self.lastDroppableWeapon);
        //self disableWeapons();
    }
    else if (self.ownsSentryGL && newWeap == "killstreak_remote_turret_mp")
    {
        self spawnSentry(true);
        self switchToWeapon(self.lastDroppableWeapon);
    }
    else if (self.ownsLittlebird && newWeap == "killstreak_uav_mp")
    {
        if (!level.littlebirdOut)
        {
            littlebirdModel = self spawnLittlebird();
            if (isDefined(littlebirdModel))
                self thread holdLittlebird(littlebirdModel);
            else return;
        }
        else
        {
            self iPrintLnBold(level.gameStrings[220]);
            self switchToWeapon(self.lastDroppableWeapon);
            self enableWeapons();
            return;
        }
        self switchToWeapon(self.lastDroppableWeapon);
        self disableWeapons();
    }
    else if (self.ownsEMP && newWeap == "killstreak_emp_mp")
    {
        self thread visionRestore();
        self.ownsEMP = false;
        self thread takeWeaponAfterWait(1.25, "killstreak_emp_mp");
        self switchToWeapon(self.lastDroppableWeapon);
    }
    else if (self.ownsNuke && newWeap == "killstreak_helicopter_mp")
    {
        success = self nuke();

        if (!success)
        {
            self switchToWeapon(self.lastDroppableWeapon);
            return;
        }

        self.ownsNuke = false;
        self thread takeWeaponAfterWait(1.25, "killstreak_helicopter_mp");
        self switchToWeapon(self.lastDroppableWeapon);
    }
    else if (self.ownsHeliSniper && newWeap == "killstreak_ims_mp")
    {
        if (isDefined(self.isCurrentlyTeleported) && self.isCurrentlyTeleported)
        {
            self iPrintLnBold(level.gameStrings[221]);
            self switchToWeapon(self.lastDroppableWeapon);
            return;
        }
        origin = self getOrigin();
        pos = origin + (randomFloatRange(-100, 100), randomFloatRange(-100, 100), 0);
        if (canCallInHeliSniper(pos))
        {
            angles = self getPlayerAngles();
            self teamSplash("used_heli_sniper");
            self callHeliSniper(pos);
            self.ownsHeliSniper = false;
            self playSound("US_1mc_use_heli_sniper");
            self thread takeWeaponAfterWait(1.25, "killstreak_ims_mp");
            self switchToWeapon(self.lastDroppableWeapon);
        }
        else
        {
            self iPrintLnBold(level.gameStrings[222]);
            self switchToWeapon(self.lastDroppableWeapon);
        }
    }
    else if (self.ownsMapStreak && newWeap == level.mapStreakWeapon)
    {
        if (level._mapname == "mp_bravo" ||
            level._mapname == "mp_carbon" ||
            level._mapname == "mp_roughneck")//Mapstreaks without an instant call-in
            return;

        success = self tryUseMapStreak();
        lastWeapon = self.lastDroppableWeapon;

        if (!success)
        {
            self iPrintLnBold(level.gameStrings[223], getFriendlyMapStreakName());
            self switchToWeapon(lastWeapon);
            return;
        }

        self.ownsMapStreak = false;
        self shuffleStreaks();
        self thread takeWeaponAfterWait(0.75, level.mapStreakWeapon);
        self switchToWeapon(lastWeapon);
    }
    else if (self.ownsSubBot && newWeap == "killstreak_triple_uav_mp")
    {
        if (isDefined(self.bot))
        {
            self iPrintLnBold(level.gameStrings[219]);
            self switchToWeapon(self.lastDroppableWeapon);
            return;
        }

        self spawnBotForPlayer(level.botWeapon_subBot, 120);
        self switchToWeapon(self.lastDroppableWeapon);
        self thread takeWeaponAfterWait(1.25, "killstreak_triple_uav_mp");
    }
    else if (self.ownsLMGBot && newWeap == "killstreak_counter_uav_mp")
    {
        if (isDefined(self.bot))
        {
            self iPrintLnBold(level.gameStrings[219]);
            self switchToWeapon(self.lastDroppableWeapon);
            return;
        }

        self spawnBotForPlayer(level.botWeapon_LMGBot, 90);
        self switchToWeapon(self.lastDroppableWeapon);
        self thread takeWeaponAfterWait(1.25, "killstreak_counter_uav_mp");
    }
    else if (self.ownsMW2Airstrike && newWeap == "killstreak_airstrike_mp")
    {
        if (level.airstrikeOut)
        {
            self iPrintLnBold(level.gameStrings[220]);
            self switchToWeapon(self.lastDroppableWeapon);
            return;
        }

        self mw2AirStrike();
        self thread takeWeaponAfterWait(1.25, "killstreak_airstrike_mp");
        self switchToWeapon(self.lastDroppableWeapon);
    }
    else if (self.ownsSuperAirstrike && newWeap == "killstreak_super_airstrike_mp")
    {
        if (level.airstrikeOut)
        {
            self iPrintLnBold(level.gameStrings[220]);
            self switchToWeapon(self.lastDroppableWeapon);
            return;
        }

        self superAirStrike();
        self thread takeWeaponAfterWait(1.25, "killstreak_super_airstrike_mp");
        self switchToWeapon(self.lastDroppableWeapon);
    }
    else if (self.ownsOverwatch && newWeap == "killstreak_helicopter_flares_mp")
    {
        if (level.overwatchOut)
        {
            self iPrintLnBold(level.gameStrings[220]);
            self switchToWeapon(self.lastDroppableWeapon);
            return;
        }

        self callOverwatch();
        self.ownsOverwatch = false;
        self thread takeWeaponAfterWait(1.25, "killstreak_helicopter_flares_mp");
        self switchToWeapon(self.lastDroppableWeapon);
    }
}

shuffleStreaks()
{
    self updateKillstreakSlotBindText();

    slot1 = 4;
    slot2 = 5;
    slot3 = 6;
    slot4 = 7;

    //Clear current binds
    //for (i = 1; i < 8; i++)
        //self setActionSlot(i, "");

    if (self maps\mp\gametypes\_aiz_external_utils::isUsingGamepad())
    {
        slot1 = 1;
        slot2 = 3;
        slot3 = 4;
        slot4 = 2;
    }

    if (self.ownsLittlebird)
        self setActionSlot(slot1, "weapon", "killstreak_uav_mp");
    else if (self.ownsOverwatch)
        self setActionSlot(slot1, "weapon", "killstreak_helicopter_flares_mp");
    else if (self.ownsPredator)
        self setActionSlot(slot1, "weapon", "killstreak_predator_missile_mp");
    else if (self.ownsHeliSniper)
        self setActionSlot(slot1, "weapon", "killstreak_ims_mp");

    if (self.ownsAirstrike)
        self setActionSlot(slot2, "weapon", "strike_marker_mp");
    else if (self.ownsAirdrop)
    {
        self setActionSlot(slot2, "weapon", "airdrop_marker_mp");
        //Fix for no ammo on chaining crate streaks
        self setWeaponAmmoClip("airdrop_marker_mp", 1);
    }
    else if (self.ownsMW2Airstrike)
        self setActionSlot(slot2, "weapon", "killstreak_airstrike_mp");
    else if (self.ownsSentry)
        self setActionSlot(slot2, "weapon", "killstreak_sentry_mp");

    if (self.ownsSubBot)
        self setActionSlot(slot3, "weapon", "killstreak_triple_uav_mp");
    else if (self.ownsExpAmmo)
        self setActionSlot(slot3, "weapon", "deployable_vest_marker_mp");
    else if (self.ownsSentryGL)
        self setActionSlot(slot3, "weapon", "killstreak_remote_turret_mp");
    else if (self.ownsEMP)
        self setActionSlot(slot3, "weapon", "killstreak_emp_mp");

    if (self.ownsNuke)
        self setActionSlot(slot4, "weapon", "killstreak_helicopter_mp");
    else if (self.ownsSuperAirstrike)
        self setActionSlot(slot4, "weapon", "killstreak_super_airstrike_mp");
    else if (self.ownsEmergencyAirdrop)
    {
        self setActionSlot(slot4, "weapon", "airdrop_mega_marker_mp");
        //Fix for no ammo on chaining crate streaks
        self setWeaponAmmoClip("airdrop_mega_marker_mp", 1);
    }
    else if (self.ownsLMGBot)
        self setActionSlot(slot4, "weapon", "killstreak_counter_uav_mp");
    if (self.ownsMapStreak)
        self setActionSlot(slot4, "weapon", level.mapStreakWeapon);

    //Set the HUD for this
    streaks = [];
    streaks[0] = "";
    streaks[1] = "";
    streaks[2] = "";
    streaks[3] = "";
    if (self.ownsLittlebird)
        streaks[0] = "killstreak_dragonfly_drone";
    else if (self.ownsOverwatch)
        streaks[0] = "specialty_helicopter_flares";
    else if (self.ownsPredator)
        streaks[0] = "specialty_predator_missile";
    else if (self.ownsHeliSniper)
        streaks[0] = "killstreak_heli_sniper_crate";

    if (self.ownsAirstrike)
        streaks[1] = "killstreak_airstrike";
    else if (self.ownsAirdrop)
        streaks[1] = "specialty_carepackage";
    else if (self.ownsMW2Airstrike)
        streaks[1] = "specialty_precision_airstrike";
    else if (self.ownsSentry)
        streaks[1] = "specialty_airdrop_sentry_minigun";

    if (self.ownsSubBot)
        streaks[2] = "group_icon";
    else if (self.ownsExpAmmo)
        streaks[2] = "killstreak_deployable_exp_ammo";
    else if (self.ownsSentryGL)
        streaks[2] = "killstreak_gl_turret";
    else if (self.ownsEMP)
        streaks[2] = "specialty_emp";

    if (self.ownsNuke)
        streaks[3] = "dpad_killstreak_nuke_static";
    else if (self.ownsSuperAirstrike)
        streaks[3] = "specialty_ac130";
    else if (self.ownsEmergencyAirdrop)
        streaks[3] = "specialty_airdrop_emergency";
    else if (self.ownsLMGBot)
        streaks[3] = "group_icon";
    if (self.ownsMapStreak)
        streaks[3] = level.mapStreakIcon;

    if (!self.aizHud_created) return;

    list = self.hud_killstreakSlots;
    for (i = 0; i < 4; i++)
    {
        if (streaks[i] != "")
        {
            list[i] setShader(streaks[i]);
            list[i].alpha = 1;
        }
        else
            list[i].alpha = 0;
    }
}

spawnSentry(isGL)
{
    if (self.isCarryingSentry) return;

    if (isGL)
        weapon = "manned_gl_turret_mp";
    else weapon = "sentry_minigun_mp";
    if (isGL)
        model = "sentry_grenade_launcher";
    else model = "sentry_minigun";

    turret = spawnTurret("misc_turret", self.origin, weapon);
    turret.angles = (0, self getPlayerAngles()[1], 0);
    turret setModel(model);
    turret.baseModel = model;
    //turret.health = 1000;
    //turret setCanDamage(true);
    turret makeTurretInOperable();
    turret setRightArc(80);
    turret setLeftArc(80);
    turret setBottomArc(50);
    turret makeUnUsable();
    turret setDefaultDropPitch(-89.0);
    if (isGL) turret setConvergenceTime(1);
    turret setTurretModeChangeWait(true);
    turret setMode("sentry_offline");
    turret.owner = self;
    turret setTurretTeam("allies");
    turret setSentryOwner(self);
    turret.isSentry = true;
    turret.isSentryGL = isGL;
    if (isGL) turret.readyToFire = true;

    turret setTurretMinimapVisible(true);
    objID = maps\mp\gametypes\_gameobjects::getNextObjID();
    turret.objID = objID;

    turret.isBeingCarried = false;
    turret.canBePlaced = true;
    turret.timeLeft = 90;
    if (isGL) turret.timeLeft = 120;
    turret.target = turret;
    turret.sentryType = "sentry_minigun";
    turret.momentum = 0;
    trigger = spawn("script_origin", turret.origin);
    turret.trigger = trigger;
    trigger linkTo(turret, "tag_origin");
    trigger.turret = turret;
    trigger maps\mp\gametypes\_aiz_map_edits::addUsable("sentryPickup", 96);

    turret thread sentry_timer();
    turret thread sentry_targeting();
    self pickupSentry(turret, true);

    self thread watchPlayerDisconnect(turret);
}

watchPlayerDisconnect(sentry)
{
    sentry endon("sentyry_destroyed");

    self waittill_any("death", "disconnect");

    sentry thread destroySentry();
}
pickupSentry(sentry, canCancel)
{
    if (sentry.isBeingCarried || self.isCarryingSentry || self != sentry.owner) return;

    sentry clearTargetEntity();
    sentry setMode("sentry_offline");
    sentry.isBeingCarried = true;
    self.isCarryingSentry = true;
    self.isCarryingSentry_alt = true;//Used to fix a bug allowing players to 'faux-cancel' a placement causing a persistant sentry being held
    sentry.canBePlaced = true;
    self disableWeapons();
    //sentry setCanDamage(false);
    sentry setSentryCarrier(self);
    sentry setModel(sentry.baseModel + "_obj");

    self thread sentryHoldWatcher(sentry, canCancel);
}
sentryHoldWatcher(sentry, canCancel)
{
    level endon("game_ended");
    self endon("death");
    self endon("disconnect");

    sentry endon("death");

    lastCanBePlaced = sentry.canBePlaced;

    while (true)
    {
        wait(0.05);

        placement = self canPlayerPlaceSentry();
        sentry.canBePlaced = self isOnGround() && placement["result"];
        if (level._mapname == "mp_fuel2" && level.mapVariation == 0) sentry.canBePlaced = true;//Fix fuel not allowing placement
        sentry.origin = placement["origin"];
        sentry.angles = placement["angles"];

        if (sentry.canBePlaced != lastCanBePlaced)
        {
            if (sentry.canBePlaced)
            {
                sentry setModel(sentry.baseModel + "_obj");
            }
            else
            {
                sentry setModel(sentry.baseModel + "_obj_red");
            }

            lastCanBePlaced = sentry.canBePlaced;
        }

        if (sentry.canBePlaced && self.isCarryingSentry && self attackButtonPressed())
        {
            self enableWeapons();
            if (canCancel && sentry.isSentryGL)
            {
                self teamSplash("used_gl_turret");
                self takeWeapon("killstreak_remote_turret_mp");
                self switchToWeapon(self.lastDroppableWeapon);
                self.ownsSentryGL = false;
                self shuffleStreaks();
            }
            else if (canCancel)
            {
                self teamSplash("used_sentry");
                self takeWeapon("killstreak_sentry_mp");
                self switchToWeapon(self.lastDroppableWeapon);
                self.ownsSentry = false;
                self shuffleStreaks();
            }
            self.isCarryingSentry = false;
            self.isCarryingSentry_alt = undefined;
            sentry setSentryCarrier(undefined);
            sentry.isBeingCarried = false;
            sentry setModel(sentry.baseModel);
            sentry playSound("sentry_gun_plant");
            sentry setMode("sentry");
            return;
        }
    }
}

sentry_timer()
{
    level endon("game_ended");
    self endon("sentry_destroyed");

    while (true)
    {
        wait(1);

        if (level.gameEnded)
        {
            self thread destroySentry();
            break;
        }
        if (!self.isBeingCarried)
        {
            self.timeLeft--;
            if (self.timeLeft <= 0 || !isDefined(self.owner) || !self.owner.isAlive)
            {
                self thread destroySentry();
                break;
            }
        }
    }
}
sentry_targeting()
{
    level endon("game_ended");
    self endon("death");
    self endon("sentry_destroyed");

    while (true)
    {
        if (level.gameEnded) break;
        if (self.timeLeft > 0)
        {
            wait(0.1);

            if (!self.isBeingCarried)
            {
                self.targetEnt = undefined;
                foreach (b in level.botsInPlay)
                {
                    if (!b.isAlive) continue;

                    botHitbox = b.hitbox;

                    if (self.isSentryGL)
                        if (distanceSquared(botHitbox.origin, self.origin) > 2250000) continue;

                    tracePass = sightTracePassed(self getTagOrigin("tag_flash"), botHitbox.origin, false, botHitbox);
                    if (!tracePass)
                        continue;

                    yaw = vectorToAngles(botHitbox.origin - self.origin)[1];
                    clamp = yaw - self.angles[1];
                    if (clamp < 290 && clamp > 70)
                        continue;

                    self.targetEnt = botHitbox;
                    break;
                }

                if (isDefined(self.targetEnt))
                {
                    self setTargetEntity(self.targetEnt);
                    if (self.isSentryGL && self.readyToFire) self thread sentryGL_fireTurret();
                    else if (!self.isSentryGL)
                    {
                        self shootTurret();
                        /*
                        if (self.momentum == 0)
                        {
                            self thread maps\mp\killstreaks\_autosentry::sentry_spinUp();
                            self StartBarrelSpin();
                        }
                        */
                    }
                }
                else
                {
                    self clearTargetEntity();
                    //self maps\mp\killstreaks\_autosentry::sentry_spinDown();
                    //self StopBarrelSpin();
                }
            }
        }
        else break;
    }
}
sentryGL_fireTurret()
{
    self.readyToFire = false;

    wait(1);

    self shootTurret();
    self playSound("weap_m79_fire_npc");

    wait(3);

    self.readyToFire = true;
}

destroySentry()
{
    if (!isDefined(self.isSentry))
        return;

    self.timeLeft = 0;

    self notify("sentry_destroyed");

    trigger = self.trigger;
    if (isDefined(trigger))
        trigger maps\mp\gametypes\_aiz_map_edits::removeUsable();

    //fx = self.flashFx;
    //if (isDefined(fx))
        //fx delete();

    self clearTargetEntity();
    self setCanDamage(false);
    self setDefaultDropPitch(40);
    self setMode("sentry_offline");
    self.health = 0;
    self setModel(self.baseModel + "_destroyed");
    self playSound("sentry_explode");

    owner = self.owner;
    if (isDefined(owner) && owner.isAlive)
    {
        if (self.isSentryGL) owner playLocalSound("US_1mc_turret_destroyed");
        else owner playLocalSound("US_1mc_sentry_gone");
    }

    playFXOnTag(level.fx_sentryExplode, self, "tag_aim");
    wait(1.5);
    self playSound("sentry_explode_smoke");
    playFXOnTag(level.fx_sentrySmoke, self, "tag_aim");

    wait(5.5);

    playFX(level.fx_sentryDeath, self.origin + (0, 0, 20));
    //objID = self.objID;
    self.objID = undefined;
    self.owner = undefined;
    self.isSentry = undefined;
    self.isSentryGL = undefined;
    self delete();
}

launchMissile()
{
    self scoreMessage(level.gameStrings[302]);
    self.ownsPredator = false;
    //foreach (player in level.players) 
    self playSound("US_1mc_use_predator");
    self shuffleStreaks();

    if (level.botsInPlay.size != 0) randomTarget = randomInt(level.botsInPlay.size);
    else randomTarget = undefined;
    randomSpawn = randomInt(level.botSpawns.size);

    if (isDefined(randomTarget)) missile = spawn("script_model", level.botsInPlay[randomTarget].origin + (0, 0, 10000));
    else if (level.botSpawns.size > 0) missile = spawn("script_model", level.botSpawns[randomSpawn] + (0, 0, 10000));
    else missile = undefined;

    if (!isDefined(missile)) return;

    missile setModel("projectile_cbu97_clusterbomb");
    missile.angles = (90, 0, 0);
    missile moveTo(missile.origin - (0, 0, 9950), 4);
    missile playLoopSound("move_remotemissile_proj_flame");

    wait(4.05);

    physicsExplosionSphere(missile.origin, 400, 200, 7);
    fx = spawnFX(level.fx_explode, missile.origin);
    triggerFX(fx);
    //fx notify("death");
    //missile stopLoopSound();
    missile playSound("exp_suitcase_bomb_main");
    missile hide();
    radiusDamage(missile.origin, 1500, 100000, 100, self);

    wait(5);

    missile delete();
    fx delete();
}

visionRestore()
{
    if (level.isHellMap)
        self teamSplash("used_emp_2");
    else
        self teamSplash("used_emp");
        
    self.ownsEMP = false;
    self shuffleStreaks();
    if (level.isHellMap)
    {
        level.visionRestored = true;
        visionSetNaked(level.vision, 1);
        visionSetPain("near_death_mp");

        foreach (player in level.players)
        {
            if (!player.isAlive) continue;
            //player playLocalSound("US_1mc_use_emp");
            player playLocalSound("emp_activate");

            player visionSetNakedForPlayer("end_game2", 0.5);

            wait(0.8);
            if (!player.isDown && !level.isBossWave) player visionSetNakedForPlayer(level.vision);
            else if (!player.isDown && level.isBossWave) player visionSetNakedForPlayer(level.bossVision);
            else player visionSetNakedForPlayer("cheat_bw");
        }
    }
    else//Alt funtion for power maps which temporarily activate all power based items for a minute. Stackable
    {
        if (!level.powerBox)
        {
            level.powerActivated = true;
            level.EMPTime += 60;
            if (!level.tempPowerActivated)
                tempPowerHud();
            level.tempPowerActivated = true;
        }
        foreach (player in level.players)
        {
            if (!player.isAlive) continue;
            player playLocalSound("predator_drone_static");
            player setEMPJammed(true);
            player thread unJamPlayerAfterTime();
        }
    }
}
unJamPlayerAfterTime()
{
    wait(1);

    self setEMPJammed(false);
}

airStrike(pos)
{
    if (isDefined(self.owner)) owner = self.owner;
    else return;

    self delete();
    owner.ownsAirstrike = false;
    owner shuffleStreaks();
    owner playSound("US_1mc_use_airstrike");
    level thread doAirstrike(pos, owner);
}

doAirstrike(pos, owner)
{
    strikeOrigin = pos + (0, 0, 10000);

    wait(1);
    magicBullet("ac130_105mm_mp", strikeOrigin, pos + (randomFloat(100), randomFloat(100), 0), owner);
    wait(1);
    magicBullet("ac130_105mm_mp", strikeOrigin, pos + (randomFloat(100), randomFloat(100), 0), owner);
    wait(1);
    magicBullet("ac130_105mm_mp", strikeOrigin, pos + (randomFloat(100), randomFloat(100), 0), owner);
    wait(1);
    magicBullet("ac130_105mm_mp", strikeOrigin, pos + (randomFloat(100), randomFloat(100), 0), owner);
    wait(1);
    magicBullet("ac130_105mm_mp", strikeOrigin, pos + (randomFloat(100), randomFloat(100), 0), owner);
}

initMW2Airstrike()
{
    minimapOrigins = getEntArray("minimap_corner", "targetname");
	if (miniMapOrigins.size)
		uavOrigin = maps\mp\gametypes\_spawnlogic::findBoxCenter(miniMapOrigins[0].origin, miniMapOrigins[1].origin);
	else
		uavOrigin = (0,0,0);
	
	level.airstrikeRig = spawn("script_model", uavOrigin);
	level.airstrikeRig setModel("c130_zoomrig");
	level.airstrikeRig.angles = (0, 115, 0);
	level.airstrikeRig hide();

	level.airstrikeRig thread maps\mp\killstreaks\_uav::rotateUAVRig();
}
mw2AirStrike()
{
    self.ownsMW2Airstrike = false;
    self shuffleStreaks();
    self playSound("US_1mc_use_airstrike");
    self teamSplash("used_airstrike_legacy");
    self scoreMessage(level.gameStrings[315]);
    level thread doMW2Airstrike(self, false);
}
superAirStrike()
{
    self.ownsSuperAirstrike = false;
    self shuffleStreaks();
    self playSound("US_1mc_use_airstrike");
    self teamSplash("used_super_airstrike");
    self scoreMessage(level.gameStrings[339]);
    level thread doMW2Airstrike(self, true);
}
doMW2Airstrike(owner, isSuper)
{
    level.airstrikeOut = true;

    origin = level.airstrikeRig getTagOrigin("tag_origin");
    UAVModel = spawn("script_model", origin);
	UAVModel setModel("vehicle_ac130_low_mp");
    UAVModel playLoopSound("veh_ac130_ext_dist");

    angle = randomInt(360);
	radiusOffset = randomInt(2000) + 5000;

	xOffset = cos(angle) * radiusOffset;
	yOffset = sin(angle) * radiusOffset;
    zOffset = randomIntRange( 10000, 11000 );
    angleVector = vectorNormalize((xOffset,yOffset,zOffset));
	angleVector = angleVector * randomIntRange(6000, 7000);
    UAVModel linkTo(level.airstrikeRig, "tag_origin", angleVector, (0, angle - 90, 0));

    UAVModel thread mw2AirstrikeTargeting(owner, isSuper);
}
mw2AirstrikeTargeting(owner, isSuper)
{
    level endon("game_ended");
    self endon("death");

    if (isSuper)
    {
        for(i = 0; i < 11; i++)
        {
            wait(1);

            targetEnt = undefined;
            tmpDist = 999999999;
            foreach (b in level.botsInPlay)
            {
                if (!b.isAlive) continue;

                botHitbox = b.hitbox;
                botOrigin = botHitbox.origin;
                dist = distanceSquared(botOrigin, self.origin);
                if (dist > tmpDist)
                    continue;

                tmpDist = dist;
                targetEnt = botHitbox;
                break;
            }

            if (isDefined(targetEnt))
            {
				switch(randomInt(5))
				{
					case 0:
                        for(c = 0; c < 3; c++)
                        {
                            rocket = magicBullet("ac130_105mm_mp", self.origin - (0, 0, 30), targetEnt.origin, owner);
                            wait(0.5);
                        }
					break;
					case 1:
                        for(a = 0; a < 10; a++)
                        {
                            rocket = magicBullet("ac130_40mm_mp", self.origin - (0, 0, 30), targetEnt.origin, owner);
                            wait(0.5);
                        }
					break;
					case 2:
                        for(b = 0; b < 20; b++)
                        {
                            rocket = magicBullet("ac130_25mm_mp", self.origin - (0, 0, 30), targetEnt.origin, owner);
                            wait(0.02);
                        }
					break;
					case 3:
                        for(d = 0; d < 10; d++)
                        {
                            rocket = magicBullet("javelin_mp", self.origin - (0, 0, 30), targetEnt.origin, owner);
                            wait(0.15);
                        }
					break;
					case 4:
                        for(e = 0; e < 10; e++)
                        {
                            rocket = magicBullet("at4_mp", self.origin - (0, 0, 30), targetEnt.origin, owner);
                            wait(0.15);
                        }
					break;
				}
                wait(1);
            }
            else
            {
                i--;
                wait(1);
            }
        }
    }
    else
    {
        for(i = 0; i < 15; i++)
        {
            wait(1);

            targetEnt = undefined;
            tmpDist = 999999999;
            foreach (b in level.botsInPlay)
            {
                if (!b.isAlive) continue;

                botHitbox = b.hitbox;
                botOrigin = botHitbox.origin;
                dist = distanceSquared(botOrigin, self.origin);
                if (dist > tmpDist)
                    continue;

                tmpDist = dist;
                targetEnt = botHitbox;
                break;
            }

            if (isDefined(targetEnt))
            {
                switch(randomInt(3))
                {
                    case 0:
                        rocket = magicBullet("ac130_105mm_mp", self.origin - (0, 0, 30), targetEnt.origin, owner);
                        wait(1.2);
                    break;
                    case 1:
                        for(a = 0; a < 3; a++)
                        {
                            rocket = magicBullet("ac130_40mm_mp", self.origin - (0, 0, 30), targetEnt.origin, owner);
                            wait(0.5);
                        }
                    break;
                    case 2:
                        for(b = 0; b < 10; b++)
                        {
                            rocket = magicBullet("ac130_25mm_mp", self.origin - (0, 0, 30), targetEnt.origin, owner);
                            wait(0.1);
                        }
                    break;
                }
                wait(1);
            }
            else
            {
                i--;
                wait(1);
            }
        }
    }

    self unlink();
    
    forward = anglesToForward(self.angles);
    self moveTo(self.origin + (forward * 25000), 5, 1, 0.05);

    wait(5);

    level.airstrikeOut = false;
    self delete();
}
callOverwatch()
{
    self.ownsOverwatch = false;
    self shuffleStreaks();
    self playSound("US_1mc_use_littlebird");
    self teamSplash("used_overwatch");
    self scoreMessage(level.gameStrings[129]);
    level thread spawnOverwatchHeli(self);
}
spawnOverwatchHeli(player)
{
    level.overwatchOut = true;

    start = player.origin;
    if (level.heliHeight > start[2] && level.heliHeight - start[2] > 500)
        pathStart = (start[0] - 10000, start[1], level.heliHeight);
    else pathStart = start + (-10000, 0, 2000);

	overwatchHeli = spawnHelicopter(player, pathStart, (0, 0, 0), "pavelow_mp", "vehicle_little_bird_armed");
    overwatchHeli.owner = player;

	overwatchHeli.mgTurret = spawnTurret("misc_turret", overwatchHeli.origin, "pavelow_minigun_mp");
	overwatchHeli.mgTurret linkTo(overwatchHeli, "tag_minigun_attach_left", (0, 0, 0), (0, 0, 0));
	overwatchHeli.mgTurret setModel("weapon_minigun");
 	overwatchHeli.mgTurret makeTurretInoperable();
	overwatchHeli.mgTurret setMode("auto_nonai");
	overwatchHeli.mgTurret setDefaultDropPitch(0);
 	overwatchHeli.mgTurret.team = "allies";
	overwatchHeli.mgTurret setTurretTeam("allies");
	overwatchHeli.mgTurret.owner = player;

	overwatchHeli.mgTurret2 = spawnTurret("misc_turret", overwatchHeli.origin, "pavelow_minigun_mp");
	overwatchHeli.mgTurret2 linkTo(overwatchHeli, "tag_minigun_attach_right", (0, 0, 0), (0, 0, 0));
	overwatchHeli.mgTurret2 setModel("weapon_minigun");
 	overwatchHeli.mgTurret2 makeTurretInoperable();
	overwatchHeli.mgTurret2 setMode("auto_nonai");
	overwatchHeli.mgTurret2 setDefaultDropPitch(0);
 	overwatchHeli.mgTurret2.team = "allies";
	overwatchHeli.mgTurret2 setTurretTeam("allies");
	overwatchHeli.mgTurret2.owner = player;

	overwatchHeli vehicle_SetSpeed(50, 70);
    overwatchHeli setVehGoalPos(player.origin + (0, 0, 500), 1);

    overwatchHeli waittill("goal");

	overwatchHeli thread overwatch_fireTurrets();
	overwatchHeli thread overwatch_flyToTarget();
    overwatchHeli thread overwatch_flyToOwner();
	overwatchHeli thread overwatch_timer(player);
}
overwatch_timer(player)
{
	wait(90);

	self notify("heli_leaving");

	wait(1);
	self setYawSpeed(180, 180, 180);
	self thread overwatch_spin();
	self playLoopSound("cobra_helicopter_dying_loop");
	self vehicle_SetSpeed(30,35);
    self setVehGoalPos(self.origin + (randomIntRange(-2000, 2000), randomIntRange(-2000, 2000), randomIntRange(-500, 500)), 1);
	self playSound("cobra_helicopter_hit");

	playFxOnTag(level.fx_overwatchSmoke, self, "tag_minigun_attach_right");
	playFxOnTag(level.fx_overwatchSmoke, self, "tag_minigun_attach_left");
	playFxOnTag(level.fx_overwatchSecondaryExplosion, self, "tag_engine");

	wait(6);

	deathAngles = self getTagAngles("tag_deathfx");
	self playSound("cobra_helicopter_crash");
	playFx(level.fx_overwatchSecondaryExplosion, self getTagOrigin("tag_deathfx"), anglesToForward(deathAngles), anglesToUp(deathAngles));
	self stopLoopSound();
	self delete();
	self.mgTurret delete();
	self.mgTurret2 delete();

    level.overwatchOut = false;
}
overwatch_flyToTarget()
{
	self endon("heli_leaving");

	while(true)
	{
        if (level.botsInPlay.size == 0)
        {
            wait(1);
            continue;
        }

		tmpDist = 999999999;
		pTarget = undefined;
		helicopterToTarget = undefined;
        foreach(bot in level.botsInPlay)
        {
            dist = distanceSquared(self.origin, bot.origin);
            if(dist < tmpDist)
            {
                tmpDist = dist;
                pTarget = bot;
            }
        }

		helicopterToTarget = vectorToAngles(pTarget.origin - self.origin);
		self setYawSpeed(180, 180, 180);
		self setTargetYaw(helicopterToTarget[1]);
		wait(1);
	}
}
overwatch_flyToOwner()
{
	self endon("heli_leaving");

	while(true)
	{
        targetPos = self.owner.origin + (randomIntRange(-500, 500), randomIntRange(-500, 500), 500);
        if (sightTracePassed(self.origin, targetPos, false, self))
        {
            self vehicle_SetSpeed(50, 70);
            self setVehGoalPos(targetPos, 1);
        }
		wait(15);
	}
}
overwatch_fireTurrets()
{
	self endon("heli_leaving");
    
	while(true)
	{
		for(i = 0; i < 50; i++)
		{
			tmpDist = 999999999;
			targetBot = undefined;
			foreach(bot in level.botsInPlay)
			{
				if(!bulletTracePassed(self.origin - (0, 0, 80), bot.origin + (0, 0, 70), false, self))
					continue;
				
				if(!bot.isAlive)
					continue;
				
                dist = distanceSquared(self.origin, bot.origin);
                if(dist < tmpDist)
                {
                    tmpDist = dist;
                    targetBot = bot;
                }
			}
			if(isDefined(targetBot))
			{
				self.mgTurret setTargetEntity(targetBot.hitbox);
				self.mgTurret2 setTargetEntity(targetBot.hitbox);
				self.mgTurret shootTurret();
				self.mgTurret2 shootTurret();
				wait(0.1);
			}
			else
			{
				i--;
				wait(0.1);
			}
		}
		wait(4);
	}
}
overwatch_spin()
{
	while(isDefined(self))
	{
		self setTargetYaw(self.angles[1] + (180 * 0.9));
		wait(1);
	}
}

nuke()
{
    if (level.gameEnded) return false;

    if (level.nukeInbound)
    {
        self iPrintLnBold(level.gameStrings[224]);
        return false;
    }
    level.nukeInbound = true;
    level thread playNukeWhoosh();
    self thread detonateNukeAfterTime(11, true);
    //level thread nukeSloMo();

    self teamSplash("used_nuke");
    self.ownsNuke = false;
    self shuffleStreaks();

    nukeTimer = newTeamHudElem("allies");
    nukeTimer.x = 0;
    nukeTimer.y = 0;
    nukeTimer.alignX = "center";
    nukeTimer.alignY = "middle";
    nukeTimer.horzAlign = "center";
    nukeTimer.vertAlign = "middle";
    //nukeTimer setPoint("CENTER", "CENTER", 0, -75);
    nukeTimer.foreground = true;
    nukeTimer.alpha = 1;
    nukeTimer.hideWhenInMenu = true;
    nukeTimer.font = "hudbig";
    nukeTimer.fontScale = 1;
    nukeTimer.label = level.gameStrings[225];
    nukeTimer setValue(10);
    nukeTimer.color = (.7, 0, 0);
    nukeTimer.glowColor = (0, 0, .5);
    nukeTimer.glowAlpha = .4;

    level.nukeTime = 10;
    level thread nukeCountdown(nukeTimer);

    foreach (player in level.players)
        player thread nuke_restorePlayerVision();

    return true;
}
detonateNukeAfterTime(time, isStreak)
{
    if (!isDefined(time))
        time = 11;

    wait(time);

    self thread nukeDetonation(true);
}
playNukeWhoosh()
{
    wait(8);

    foreach (player in level.players)
    {
        player playLocalSound("slomo_whoosh");
    }
}
nukeSloMo()
{
    setSlowMotion(1, .35, .5);

    wait(.5f);

    wait(5);//Realtime wait, NOT slomo time

    setSlowMotion(.35f, 1, .1f);
}
nukeCountdown(nukeTimer)
{
    level endon("game_ended");

    while (true)
    {
        if (level.gameEnded)
        {
            nukeTimer destroy();
            break;
        }
        level thread nuke_fontPulse(nukeTimer);
        level.nukeTime--;
        playSoundAtPos((0, 0, 0), "mp_killstreak_nuclearstrike");

        wait(1);

        if (level.nukeTime > 0) continue;
        else
        {
            nukeTimer destroy();
            break;
        }
    }
}
nuke_fontPulse(nukeTimer)
{
    nukeTimer changeFontScaleOverTime(0.2);
    nukeTimer.fontScale = 1.25;
    wait(.2f);

    if (level.nukeTime > 0) nukeTimer setValue(level.nukeTime);
    nukeTimer changeFontScaleOverTime(0.2);
    nukeTimer.fontScale = 1;
}
nuke_restorePlayerVision()
{
    wait(9);

    if (level.gameEnded) return;
    self visionSetNakedForPlayer("mpnuke", 5);
    self playLocalSound("nuke_explosion");
    self playLocalSound("nuke_wave");
    wait(5);

    if (self.isAlive && self.isDown) self visionSetNakedForPlayer("cheat_bw", 1);
    else self visionSetNakedForPlayer(level.vision, 5);
}

spawnLittlebird()
{
    if (self.isCarryingSentry) return undefined;

    angleToForward = anglesToForward((0, self getPlayerAngles()[1], 0));
    //turret = spawn("script_model", self.origin + angleToForward * 50);
    turret = spawnTurret("misc_turret", self.origin + angleToForward * 50, "sentry_minigun_mp");
    turret.angles = (0, self getPlayerAngles()[1], 0);
    turret setModel("mp_trophy_system_folded");
    turret makeTurretInOperable();
    turret makeUsable();
    turret enablePlayerUse(self);
    turret setDefaultDropPitch(-89.0);
    turret setTurretModeChangeWait(true);
    turret setMode("sentry_offline");
    turret.owner = self;
    turret setSentryOwner(self);
    turret setTurretTeam("allies");
    //turret setTurretMinimapVisible(true);
    turret hideAllParts();
    turret.isBeingCarried = true;
    turret.canBePlaced = true;

    visual = spawn("script_model", turret.origin);
    visual setModel("test_vehicle_little_bird_toy_placement");
    //visual enableLinkTo();
    visual.angles = turret.angles;
    visual linkTo(turret, "tag_origin");
    turret.visual = visual;
    return turret;
}
holdLittlebird(bird)
{
    bird.isBeingCarried = true;
    self.isCarryingSentry = true;
    bird.canBePlaced = true;
    self disableWeapons();
    bird setSentryCarrier(self);
    bird setCanDamage(false);
    self thread littlebirdHoldWatcher(bird);
}
littlebirdHoldWatcher(bird)
{
    level endon("game_ended");

    while (true)
    {
        wait(0.1);

        if (level.gameEnded || !self.isAlive)
        {
            bird setSentryCarrier(undefined);
            bird.visual delete();
            bird delete();
            break;
        }

        birdVisual = bird.visual;
        anglesToForward = anglesToForward((0, self getPlayerAngles()[1], 0));
        traceOrigin = self.origin + (anglesToForward * 75);
        trace = sightTracePassed(traceOrigin + (0, 0, 25), traceOrigin + (0, 0, 500), false, birdVisual);

        if (trace && birdVisual.model == "test_vehicle_little_bird_toy_placement_failed")
        {
            birdVisual setModel("test_vehicle_little_bird_toy_placement");
            bird.canBePlaced = true;
        }
        else if (!trace && birdVisual.model == "test_vehicle_little_bird_toy_placement")
        {
            birdVisual setModel("test_vehicle_little_bird_toy_placement_failed");
            bird.canBePlaced = false;
        }

        if (self.isAlive && self attackButtonPressed() && bird.canBePlaced && self.isCarryingSentry)
        {
            self enableWeapons();
            self thread takeWeaponAfterWait(0.75, "killstreak_uav_mp");
            lastWeapon = self.lastDroppableWeapon;
            self switchToWeapon(lastWeapon);
            self.ownsLittlebird = false;
            self playSound("US_1mc_use_dragonfly");
            self shuffleStreaks();
            self.isCarryingSentry = false;
            bird setSentryCarrier(undefined);
            bird.isBeingCarried = false;
            bird playSound("sentry_gun_plant");
            self teamSplash("used_remote_uav");
            playerAngleY = self getPlayerAngles()[1];
            angleToForward = anglesToForward((0, playerAngleY, 0));
            sentryAngles = (0, playerAngleY, 0);
            origin = self.origin + angleToForward * 50;
            self spawnRemoteUAV(origin, sentryAngles);
            bird delete();
            birdVisual delete();
            break;
        }
    }
}

spawnRemoteUAV(pos, angles)
{
    uav = spawnHelicopter(self, pos + (0, 0, 50), angles, "remote_uav_mp", "vehicle_remote_uav");
    level.littlebirdOut = true;

    objID = maps\mp\gametypes\_gameobjects::getNextObjID();
    uav.objID = objID;

    uav.angles = angles;
    uav.owner = self;
    self.ownedLittlebird = uav;
    uav.isAlive = true;
    uav.timeLeft = 60;
    uav.targetDest = (pos[0], pos[1], getGroundPosition(pos, 2)[2] + 500);
    uav.targetEnt = undefined;
    uav setVehicleTeam("allies");
    uav setVehWeapon("remote_uav_weapon_mp");
    uav Vehicle_SetSpeed(50, 15, 15);
    uav setTurningAbility(.5);
    uav setYawSpeed(100, 50, 25);
    uav setHoverParams(10, 50, 25);
    uav setVehicleLookAtText(self.name, &"");
    uav setVehGoalPos(uav.targetDest, true);
    uav clearTargetYaw();
    uav clearGoalYaw();

    hint = self createFontString("hudsmall", 1);
    hint setPoint("CENTER", "CENTER", 0, 140);
    hint.label = level.gameStrings[228];
    hint thread destroyHud(4);

    uav thread dragonfly_timer();
    uav thread dragonfly_targeting();
    self thread dragonfly_watchUAVReroute(uav);
}
dragonfly_watchUAVReroute(uav)
{
    level endon("game_ended");
    self endon("disconnect");
    uav endon("death");
    
    while (true)
    {
        self waittill("uav_reroute");

        if (!isDefined(self.ownedLittlebird)) continue;
        self thread dragonfly_rerouteWatcher();
    }
}
dragonfly_timer()
{
    level endon("game_ended");
    self endon("death");

    while (true)
    {
        wait(1);

        if (!self.isAlive) break;
        self.timeLeft--;
        if (self.timeLeft > 0 && self.owner.isAlive) continue;
        else
        {
            self thread destroyLittlebird();
            break;
        }
    }
}
dragonfly_targeting()
{
    level endon("game_ended");
    self endon("death");

    while (true)
    {
        wait(0.1);

        if (level.gameEnded) return false;

        if (self.isAlive)
        {
            uavTargetDest = self.targetDest;
            if (distanceSquared(self.origin, uavTargetDest) > 2500)
            {
                self setVehGoalPos(uavTargetDest, true);
                targetYaw = vectorToAngles(self.origin - uavTargetDest);
                self setGoalYaw(targetYaw[1]);
            }
            self.targetEnt = undefined;
            foreach (b in level.botsInPlay)
            {
                if (!b.isAlive) continue;

                botHitbox = b.hitbox;
                flashTag = self getTagOrigin("tag_flash");
                botOrigin = botHitbox.origin;
                tracePass = sightTracePassed(flashTag, botOrigin, false, botHitbox);
                if (!tracePass)
                    continue;

                self.targetEnt = botHitbox;
                break;
            }
            if (isDefined(self.targetEnt))
            {
                forward = vectorToAngles(self.targetEnt.origin - self.origin);
                self setGoalYaw(forward[1]);
                //flashTag = self getTagOrigin("tag_flash");
                //owner = self.owner;
                //magicBullet("cobra_20mm_mp", flashTag, target.origin, owner);
                self setTurretTargetEnt(self.targetEnt);
                self fireWeapon("tag_flash", self.targetEnt);
                //self playUAVFireSounds();
            }
        }
    }
}

dragonfly_rerouteWatcher()
{
    if ((isDefined(self.ownedLittlebird) && !self.ownedLittlebird.isAlive)) return;
    if (isDefined(self.isCarryingSentry_alt)) return;//Used to fix a bug allowing players to 'faux-cancel' a placement causing a persistant sentry being held

    else if (self.isCarryingSentry)
    {
        self.isCarryingSentry = false;
        self enableWeapons();
        return;
    }
    self.canReroute = true;
    self.isCarryingSentry = true;//Setting this for a check and to keep from picking up sentrys
    self disableWeapons();

    marker = spawn("script_model", self.origin);
    marker.angles = (-90, 0, 0);
    marker setModel("tag_origin");
    marker.fxPlaying = false;

    wait(0.15);

    self dragonfly_initRerouteMarker(marker);
}
dragonfly_initRerouteMarker(marker)
{
    playFXOnTagForClients(level.fx_uavRoute, marker, "tag_origin", self);
    marker.passFXPlaying = true;
    marker.failFXPlaying = false;

    self thread dragonfly_moveRerouteMarker(marker);
}
dragonfly_moveRerouteMarker(marker)
{
    level endon("game_ended");
    self endon("death");
    self endon("disconnect");

    while (true)
    {
        wait(0.05);

        if (level.gameEnded)
        {
            marker delete();
            break;
        }

        if (!isDefined(self.ownedLittlebird))
        {
            self enableWeapons();
            self.isCarryingSentry = false;
            marker delete();
            break;
        }
        markerGround = getGroundPosition(marker.origin, 1)[2];
        if (markerGround == marker.origin[2]) markerGround = self.origin[2];
        playerOrigin = self.origin;
        angleToForward = anglesToForward(self getPlayerAngles());
        //position = physicsTrace(playerOrigin, playerOrigin + (angleToForward * 250));
        position = playerOrigin + (angleToForward * 250);
        marker moveTo((position[0], position[1], markerGround), 0.1);

        if (marker.origin[2] > (playerOrigin[2] + 500) || marker.origin[2] < (playerOrigin[2] - 500))
            marker.origin = position;

        //tracePass = sightTracePassed(marker.origin + (0, 0, 500), marker.origin + (0, 0, 10), false, self);
        littlebird = self.ownedLittlebird;
        tracePass = sightTracePassed(littlebird.origin, marker.origin + (0, 0, 500), false, littlebird);
        if (tracePass) self.canReroute = true;
        else self.canReroute = false;

        if (self.canReroute && !marker.passFXPlaying)
        {
            stopFXOnTag(level.fx_uavRouteFail, marker, "tag_origin");
            marker.failFXPlaying = false;
            marker.passFXPlaying = true;
            level thread playFXOnTagForClientsAfterFrame(level.fx_uavRoute, marker, "tag_origin", self);
        }
        else if (!self.canReroute && !marker.failFXPlaying)
        {
            stopFXOnTag(level.fx_uavRoute, marker, "tag_origin");
            marker.passFXPlaying = false;
            marker.failFXPlaying = true;
            level thread PlayFXOnTagForClientsAfterFrame(level.fx_uavRouteFail, marker, "tag_origin", self);
        }

        if (self attackButtonPressed() && isDefined(self.ownedLittlebird) && self.isCarryingSentry && self.canReroute)
        {
            if (littlebird.isAlive)
            {
                littlebird.targetDest = marker.origin + (0, 0, 500);
                self playLocalSound("recondrone_tag");
            }
            self enableWeapons();
            self.isCarryingSentry = false;
            marker delete();
            break;
        }
        else if (isDefined(self.ownedLittlebird) && self.isCarryingSentry) continue;
        else
        {
            self enableWeapons();
            self.isCarryingSentry = false;
            marker delete();
            break;
        }
    }
}
playFXOnTagForClientsAfterFrame(fx, origin, tag, client)
{
    wait(0.05);

    playFXOnTagForClients(fx, origin, tag, client);
}

destroyLittlebird()
{
    self.isAlive = false;
    fx = spawnFX(level.fx_sentryDeath, self.origin);
    triggerFX(fx);
    self hide();
    self vehicle_turnEngineOff();
    self playSound("recondrone_destroyed");
    self.owner.ownedLittlebird = undefined;
    wait(5);
    self freeHelicopter();
    level.littlebirdOut = false;

    objID = self.objID;
    self.objID = undefined;

    self delete();
    fx delete();
}

spawnBotForPlayer(weapon, time)
{
    if (weapon == level.botWeapon_subBot)
    {
        self.ownsSubBot = false;
        self teamSplash("used_bot_smg");
    }
    else if (weapon == level.botWeapon_LMGBot)
    {
        self.ownsLMGBot = false;
        self teamSplash("used_bot_lmg");
    }
    self shuffleStreaks();

    bot = spawn("script_model", self.origin);
    bot.angles = self.angles;
    //bot enableLinkTo();
    bot setModel(level.bodyModel);
    bot.isMoving = false;
    //bot.isShooting = false;//Moved to "state"
    bot.currentGun = "";

    weaponTag = bot getTagOrigin("tag_weapon_left");
    gun = spawn("script_model", weaponTag);
    gun setModel("defaultweapon");
    bot.gun = gun;

    minimapIcon = spawnPlane(self, "script_model", bot.origin, "compassping_friendly_party_mp", "compassping_friendly_party_mp");
    minimapIcon.angles = bot.angles;
    minimapIcon linkTo(bot);
    bot.icon = minimapIcon;

    bothead = spawn("script_model", bot.origin);
    bothead setModel(level.headModel);
    bothead linkTo(bot, "j_spine4", (0, 0, 0), (0, 0, 0));
    bot.head = bothead;
    bot.state = "idle";
    bot.animType = "ar";
    bot.shots = 0;
    self.bot = bot;
    bot.owner = self;
    bot.targetEnt = undefined;
    bot playAnimOnBot("idle");

    bot thread playerBotMovement();
    if (!isDefined(weapon) || weapon == "") bot updateBotGun();
    else bot updateBotGun(weapon);
    bot thread personalBotTargeting();

    if (isDefined(time) && time > 0)
        self thread killPlayerBot(time);
}
playerBotMovement()
{
    level endon("game_ended");
    self endon("death");

    while (true)
    {
        if (level.gameEnded) break;
        if (self.state == "dead") break;

        wait(1);

        if (self.state != "shooting")
        {
            target = self.owner.origin;
            if (distanceSquared(self.origin, target) >= 40000)
            {
                self.state = "running";
                if (!self.isMoving)
                {
                    switch (self.animType)
                    {
                        case "pistol":
                            self playAnimOnBot("runPistol");
                            break;
                        case "mg":
                            self playAnimOnBot("runMG");
                            break;
                        case "rocketlauncher":
                            self playAnimOnBot("runRPG");
                            break;
                        case "spread":
                            self playAnimOnBot("runShotgun");
                            break;
                        case "sniper":
                            self playAnimOnBot("runSniper");
                            break;
                        case "smg":
                            self playAnimOnBot("runSMG");
                            break;
                        default:
                            self playAnimOnBot("run");
                            break;
                    }
                    self.isMoving = true;
                }
                angle = vectorToAngles(target - self.origin)[1];
                self moveTo((target[0], target[1], self.owner.origin[2]), (distance(self.origin, target) / 150));
                self rotateTo((0, angle, 0), 0.2);
            }
            else if (distanceSquared(self.origin, target) < 40000 && self.isMoving)
            {
                self.origin = self.origin;
                self.state = "idle";
                switch (self.animType)
                {
                    case "pistol":
                        self playAnimOnBot("idlePistol");
                        break;
                    case "mg":
                        self playAnimOnBot("idleMG");
                        break;
                    case "rocketlauncher":
                        self playAnimOnBot("idleRPG");
                        break;
                    default:
                        self playAnimOnBot("idle");
                        break;
                }
                self.isMoving = false;
            }
        }
    }
}
updateBotGun(weapon)
{
    if (self.state == "dead") return;

    owner = self.owner;
    if (!isDefined(weapon) || weapon == "")
        newBotWeapon = owner getCurrentWeapon();
    else newBotWeapon = weapon;

    if ((self.currentGun != newBotWeapon && !isKillstreakWeapon(newBotWeapon) && !(isThunderGun(newBotWeapon) || isRayGun(newBotWeapon) || newBotWeapon == "stinger_mp")))
    {
        gun = self.gun;
        if (newBotWeapon == level.botWeapon_subBot)
            weaponModel = getWeaponModel(level.botWeaponModel_subBot);
        else if (newBotWeapon == level.botWeapon_LMGBot)
            weaponModel = getWeaponModel(level.botWeaponModel_LMGBot);
        else weaponModel = getWeaponModel(newBotWeapon);

        if (!isDefined(weaponModel) || weaponModel == "") weaponModel = "defaultweapon";
        gun setModel(weaponModel);
        self.currentGun = newBotWeapon;

        if (newBotWeapon == level.botWeapon_subBot)
            weaponClass = "smg";
        else if (newBotWeapon == level.botWeapon_LMGBot)
            weaponClass = "mg";
        else weaponClass = weaponClass(newBotWeapon);

        self.animType = weaponClass;
        clipCount = weaponClipSize(newBotWeapon);
        if (newBotWeapon == level.botWeapon_LMGBot)
            clipCount = 100;
        self.clipSize = clipCount;

        gun.angles = self getTagAngles("tag_weapon_left");
        switch (self.animType)
        {
            case "pistol":
            case "spread":
                gun linkTo(self, "tag_weapon_right", (0, 0, 0), (0, 0, 0));
                break;
            default:
                gun linkTo(self, "tag_weapon_left", (0, 0, 0), (0, 0, 0));
                break;
        }
        if (self.state != "running")
        {
            switch (self.animType)
            {
                case "pistol":
                    self playAnimOnBot("idlePistol");
                    break;
                case "mg":
                    self playAnimOnBot("idleMG");
                    break;
                case "rocketlauncher":
                    self playAnimOnBot("idleRPG");
                    break;
                default:
                    self playAnimOnBot("idle");
                    break;
            }
        }
        else
        {
            switch (self.animType)
            {
                case "pistol":
                    self playAnimOnBot("runPistol");
                    break;
                case "mg":
                    self playAnimOnBot("runMG");
                    break;
                case "rocketlauncher":
                    self playAnimOnBot("runRPG");
                    break;
                case "spread":
                    self playAnimOnBot("runShotgun");
                    break;
                case "sniper":
                    self playAnimOnBot("runSniper");
                    break;
                case "smg":
                    self playAnimOnBot("runSMG");
                    break;
                default:
                    self playAnimOnBot("run");
                    break;
            }
        }
    }
}
personalBotTargeting()
{
    level endon("game_ended");
    self endon("death");
    self endon("killed");

    while (true)
    {
        wait(0.1);

        if (level.gameEnded) break;
        if (self.state == "dead") break;
        if (self.currentGun == "none" || isSubStr(self.currentGun, "killstreak") || isSubStr(self.currentGun, "airdrop")) continue;
        if (isDefined(self.targetEnt)) continue;

        foreach (zombie in level.botsInPlay)
        {
            if (!zombie.isAlive) continue;

            tracePass = sightTracePassed(self.origin + (0, 0, 30), zombie.origin + (0, 0, 70), false, self);
            if (!tracePass) continue;

            self.targetEnt = zombie;
            break;
        }
        if (isDefined(self.targetEnt) && self.state != "shooting")
        {
            anglesY = vectorToAngles(self.targetEnt.origin - self.origin)[1];
            self rotateTo((0, anglesY, 0), 0.4);
            self.state = "shooting";
            self.origin = self.origin;
            switch (self.animType)
            {
                case "pistol":
                    waitForShot = 300;
                    break;
                case "smg":
                    waitForShot = 50;
                    break;
                case "rifle":
                    waitForShot = 100;
                    break;
                case "spread":
                    waitForShot = 1000;
                    break;
                case "mg":
                    waitForShot = 100;
                    break;
                case "sniper":
                    waitForShot = 1000;
                    break;
                case "rocketlauncher":
                    waitForShot = 2000;
                    break;
                default:
                    waitForShot = 100;
                    break;
            }
            if (isSubStr(self.currentGun, "dragunov_mp") || isSubStr(self.currentGun, "mk12spr_mp"))//Fixes the bug with the bot fast firing a sniper
                waitForShot = 1000;

            //self.shots = 0;
            self thread fireBotWeapon(waitForShot);
        }
    }
}
fireBotWeapon(waitForShot)
{
    self endon("death");
    self endon("killed");

    while (true)
    {
        if (level.gameEnded) break;
        if (!isDefined(self) || self.state == "dead") break;
        if (!self.targetEnt.isAlive || !isDefined(self.targetEnt))
        {
            switch (self.animType)
            {
                case "pistol":
                    self playAnimOnBot("idlePistol");
                    break;
                case "mg":
                    self playAnimOnBot("idleMG");
                    break;
                case "rocketlauncher":
                    self playAnimOnBot("idleRPG");
                    break;
                default:
                    self playAnimOnBot("idle");
                    break;
            }
            self.state = "idle";
            self.isMoving = false;
            self.targetEnt = undefined;
            break;
        }

        botGun = self.currentGun;
        fireTime = weaponFireTime(botGun);
        if (fireTime < 0.05) fireTime = 0.05;
        wait(fireTime);

        self rotateTo((0, vectorToYaw(self.targetEnt.origin - self.origin), 0), 0.4);

        switch (self.animType)
        {
            case "pistol":
                self playAnimOnBot("shootPistol");
                break;
            case "mg":
                self playAnimOnBot("shootMG");
                break;
            case "rocketlauncher":
                self playAnimOnBot("shootRPG");
                break;
            default:
                self playAnimOnBot("shoot");
                break;
        }
        botGunEnt = self.gun;
        flashTag = botGunEnt getTagOrigin("tag_flash");
        level.lastAttackingBot = self;
        //This unfortunately is internally bugged. magicBullet will only report the attacker's weapon regardless of the weapon passed to it. If no attacker is set, the weapon is undefined. This causes the bot here to be shooting the player's weapon, and there isn't a way to detect the weapon name if given no attacker. InfinityScript did it better, fuck GSC.
        magicBullet(botGun, flashTag, self.targetEnt.origin + (randomFloat(30), randomFloat(30), randomFloatRange(25, 55)));

        if (botGun == level.botWeapon_subBot) playSoundAtPos(flashTag, "weap_ump45_fire_npc");//Hack in firing sound

        self.shots++;
        ammo = self.clipSize;
        if (self.shots >= ammo)
        {
            /*
            clip = spawn("script_model", self.origin);
            clip setModel(level.getWeaponClipModel(botGun));
            clip linkTo(self, "tag_weapon_right", (0, 0, 0), (0, 0, 0));
            */
            botGunEnt hidePart("tag_clip");
            switch (self.animType)
            {
                case "pistol":
                    self playAnimOnBot("reloadPistol");
                    self playSound("weap_usp45_reload_npc");
                    self thread resetBotWeaponAnimAfterTime(botGun, "idlePistol", 1.5);
                    break;
                case "mg":
                    self playAnimOnBot("reloadMG");
                    self playSound("weap_m60_reload_npc");
                    self thread resetBotWeaponAnimAfterTime(botGun, "idleMG", 4);
                    break;
                case "rocketlauncher":
                    self playAnimOnBot("reloadRPG");
                    self playSound("weap_rpg_reload_npc");
                    self thread resetBotWeaponAnimAfterTime(botGun, "idleRPG", 2.5);
                    break;
                default:
                    self playAnimOnBot("reload");
                    self playSound("weap_ak47_reload_npc");
                    self thread resetBotWeaponAnimAfterTime(botGun, "idle", 2);
                    break;
            }
            break;
        }
    }
}
resetBotWeaponAnimAfterTime(botGun, animName, waitTime)
{
    wait(waitTime);

    self resetBotWeaponAnim(botGun, animName);
}
resetBotWeaponAnim(oldGun, animName)
{
    if (self.state == "dead") return;
    if (!isDefined(self.gun)) return;
    botGunEnt = self.gun;
    self playAnimOnBot(animName);
    if (oldGun == self.currentGun) botGunEnt showPart("tag_clip");//Avoid trying to show the tag if we switched guns
    self.shots = 0;
    self.state = "idle";
    self.isMoving = false;
    self.targetEnt = undefined;
}

killPlayerBot(time)
{
    self notify("kill_bot");
    self endon("kill_bot");

    if (isDefined(time))
        wait(time);

    bot = self.bot;
    bot notify("killed");
    bot.state = "dead";
    //self.ownsBot = false;
    self.bot = undefined;
    bot playSound("generic_death_american_1");

    botGun = bot.gun;
    botGun delete();
    bot.gun = undefined;

    minimapIcon = bot.icon;
    minimapIcon delete();
    bot.icon = undefined;

    bot startRagdoll();
    physicsExplosionSphere(bot.origin, 75, 75, randomIntRange(1, 3));

    wait(5);

    head = bot.head;
    head delete();
    bot.head = undefined;
    bot delete();
}

canCallInHeliSniper(pos)
{
    if (level.heliHeight > pos[2] && level.heliHeight - pos[2] > 500)
        endPos = (pos[0], pos[1], level.heliHeight);
    else endPos = pos + (0, 0, 2000);
    
    return sightTracePassed(pos + (0, 0, 15), endPos, false, undefined);
}

callHeliSniper(location)
{
    if (level.heliHeight > location[2] && level.heliHeight - location[2] > 500)
        pathStart = (location[0] - 10000, location[1], level.heliHeight);
    else pathStart = location + (-10000, 0, 2000);

    angles = vectorToAngles(location - pathStart);
    forward = anglesToForward(angles);
    lb = spawnHelicopter(self, pathStart, forward, "attack_littlebird_mp", "vehicle_little_bird_armed");

    //lb makeVehicleSolidSphere(128, 0);//Disabled to avoid trolling players

    lb.angles = (0, angles[1], 0);
    lb.owner = self;
    lb setVehicleTeam("allies");
    //lb enableLinkTo();
    lb vehicle_setSpeed(375, 225, 75);
    lb setHoverParams(5, 10, 5);
    lb setTurningAbility(.75);
    lb.hasPassenger = false;
    lb.doneService = false;
    lb.readyForEnter = false;
    lb.heliTime = 120;
    self.ownsHeliSniper = false;
    self shuffleStreaks();
    thread heliSniper_flyIn(self, lb, location);
    thread heliSniper_leaveOnPlayerDeath(self, lb);
}
heliSniper_flyIn(player, lb, loc)
{
    level endon("game_ended");
    player endon("death");

    if (level.heliHeight > loc[2] && level.heliHeight - loc[2] > 500)
        lb setVehGoalPos((loc[0], loc[1], level.heliHeight), true);
    else
        lb setVehGoalPos(loc + (0, 0, 2000), true);

    wait(5.5);

    if (lb.doneService) return;
    lb vehicle_setSpeed(150, 50, 25);
    lb setVehGoalPos(loc + (0, 0, 150), true);
    toPlayer = vectorToAngles(player.origin - lb.origin);
    lb setTargetYaw(toPlayer[1] - 90);
    //lb setLookAtEnt(self);

    wait(5);

    if (lb.doneService) return;
    lb.flying = false;
    lb heliSniper_setTimer();
    lb.readyForEnter = true;
    enterPos = spawn("script_model", lb.origin);
    enterPos setModel("tag_origin");
    enterPos linkTo(lb, "tag_player_attach_left", (0, 25, -10), (0, 0, 0));
    enterPos.heli = lb;
    enterPos.range = 80;
    enterPos.usabletype = "heliExtraction";
    lb.enterNode = enterPos;
    headIcon = newClientHudElem(player);
    headIcon.archived = false;
    headIcon.x = enterPos.origin[0];
    headIcon.y = enterPos.origin[1];
    headIcon.z = enterPos.origin[2] + 40;
    headIcon.alpha = .85f;
    headIcon setShader("headicon_heli_extract_point", 10, 10);
    headIcon setWaypoint(true, true, false);
    headIcon setTargetEnt(enterPos);
    enterPos.icon = headIcon;
    enterPos maps\mp\gametypes\_aiz_map_edits::addUsable("heliExtraction", 70);
}
heliSniper_setTimer()
{
    self.insertionTime = getTime();
    level.heliSnipers[level.heliSnipers.size] = self;
}
heliSniper_doBoarding(heli)
{
    //player hide();
    self.notTargetable = true;
    self.heliSniperLastInsertionPos = self.origin;
    heli.flying = true;
    self disableWeapons();
    self freezeControls(true);
    self giveWeapon("iw5_mk12spr_mp_acog_xmags");
    self giveMaxAmmo("iw5_mk12spr_mp_acog_xmags");
    //visual = player clonePlayer();
    //visual.origin = player.origin;
    //visual hide();

    wait(0.8);

    eye = self getEye();
    cam = spawn("script_model", eye);
    cam.angles = self getPlayerAngles();
    cam setModel("tag_origin");
    //cam enableLinkTo();
    self playerLinkToAbsolute(cam, "tag_origin");
    heli.hasPassenger = true;

    if (level.gameEnded) return;//Abort if game has ended

    self thread heliSniper_animateEnter(cam, heli);
}
heliSniper_animateEnter(cam, heli)
{
    level endon("game_ended");
    self endon("death");

    tag = heli getTagOrigin("tag_player_attach_left") + (0, 0, 30);
    tagAngles = heli getTagAngles("tag_player_attach_left");
    front = tag + anglesToForward(tagAngles + (0, 90, 0)) * 50;
    angleToHeli = vectorToAngles(tag - front);
    cam moveTo(front - (0, 0, 100), .5, .1, .1);
    cam rotateTo(angleToHeli, .5, .1, .1);

    //--Begin movement onto heli--
    wait(.55);
    cam rotatePitch(-60, 1, .1, .2);
    cam moveTo(front - (0, 0, 50), .5, .1, .1);
    wait(1.05);
    cam moveTo(front - (0, 0, 50), 1.3, .3, .3);
    cam rotatePitch(65, 2, 1, .5);
    wait(2.05);
    cam moveTo(tag - (0, 0, 30), 2.5, .5, .5);
    cam rotatePitch(35, 1.4, .3, .3);
    wait(1.5);
    cam rotatePitch(-40, 1, .4, .4);
    wait(1.05);
    cam moveTo(tag - (0, 0, 30), 1.5, .1, .1);
    cam rotateYaw(180, 1.5, .5, .5);
    wait(1.55);

    if (level.gameEnded) return;//Abort if game has ended, so we don't unlink them from endCam

    self unlink();
    self setPlayerAngles(cam.angles);
    self playerLinkTo(heli, "tag_player_attach_left", .5, 10, 170, 30, 150, false);
    self setStance("crouch");
    cam delete();
    self show();
    self allowJump(false);
    self allowSprint(false);
    self thread heliSniper_monitorStance();
    self freezeControls(false);
    self enableWeapons();
    self switchToWeapon("iw5_mk12spr_mp_acog_xmags");
    self disableWeaponSwitch();
    self setSpreadOverride(1);

    heli thread heliSniper_flyUp(self);

    wait(1);

    thread heliSniper_leaveOnAmmoDepleted(self, heli);

    wait(1);

    self player_RecoilScaleOn(0);
}
heliSniper_monitorStance()
{
    level endon("game_ended");
    self endon("death");
    self endon("disconnect");

    while (true)
    {
        if (!self.isAlive) break;

        if (self getStance() != "crouch") self setStance("crouch");

        if (!self.notTargetable) break;

        wait(0.05);
    }
}
heliSniper_flyUp(player)
{
    //self.flying = true;
    self setAcceleration(25);
    self setDeceleration(15);
    self vehicle_setSpeed(50);
    self setVehGoalPos(self.origin + (0, 0, 800), true);

    wait(2.5);

    self clearTargetYaw();
    self clearGoalYaw();
    self.flying = false;
    self setYawSpeed(100, 50, 50, .2);
    self setHoverParams(15, 10, 10);
    self thread heliSniper_watchViewClamp(player);
}
heliSniper_watchViewClamp(player)
{
    level endon("game_ended");
    self endon("death");
    self endon("heliSniper_leaving");
    player endon("disconnect");

    while (true)
    {
        yaw = player getPlayerAngles()[1];
        lbAngles = self.angles;
        clamp = lbAngles[1] - yaw;
        if (clamp > -175 && clamp < -130)
            self setGoalYaw(lbAngles[1] + 10);
        else if (clamp < 15 && clamp > -30)
            self setGoalYaw(lbAngles[1] - 10);

        if (self.doneService) break;

        wait(0.1);
    }
}
heliSniper_leaveOnAmmoDepleted(player, heli)
{
    level endon("game_ended");
    heli endon("death");
    player endon("disconnect");

    while (true)
    {
        if (player getAmmoCount("iw5_mk12spr_mp_acog_xmags") == 0)
        {
            heli thread heliSniper_leave();
            break;
        }

        wait(1);
    }
}
heliSniper_leaveOnPlayerDeath(player, lb)
{
    lb endon("death");

    player waittill_any("death", "disconnect");

    lb.hasPassenger = false;
    lb thread heliSniper_leave();
}
heliSniper_leave()
{
    if (self.doneService)
        return;

    self endon("death");
    owner = self.owner;
    owner endon("disconnect");

    self.flying = true;
    self.doneService = true;
    array_remove(level.heliSnipers, self);
    self notify("heliSniper_leaving");
    if (self.hasPassenger)
    {
        self vehicle_setSpeed(150, 50, 50);
        self setVehGoalPos(self.origin - (0, 0, 800), true);
        self clearGoalYaw();
        toInsertionPos = vectorToAngles(owner.heliSniperLastInsertionPos - self.origin);
        self setTargetYaw(toInsertionPos[1] - 90);

        wait(3.05);

        owner enableWeaponSwitch();
        owner switchToWeapon(owner.lastDroppableWeapon);
        owner disableWeaponSwitch();

        wait(.75);

        owner takeWeapon("iw5_mk12spr_mp_acog_xmags");
        owner unlink();
        owner enableWeaponSwitch();
        owner resetSpreadOverride();
        owner player_RecoilScaleOff();
        owner allowSprint(true);
        owner allowJump(true);
        owner thread heliSniper_checkForPlayerClipping();
        self.hasPassenger = false;
        self clearGoalYaw();
        self clearTargetYaw();
        self setVehGoalPos(self.origin + (0, 0, 1800), true);

        wait(5.05);

        self vehicle_setSpeed(350, 225, 75);
        self setVehGoalPos(self.origin + (-100000, 0, 0), false);

        wait(5);

        self freeHelicopter();
        self delete();
    }
    else
    {
        if (isDefined(self.enterNode))
        {
            node = self.enterNode;
            node.icon destroy();
            node maps\mp\gametypes\_aiz_map_edits::removeUsable();
        }
        self setVehGoalPos(self.origin + (0, 0, 800), true);
        angles = vectorToAngles(self.origin + (-10000, 0, 0) - self.origin);
        self setTargetYaw(angles[1]);

        wait(3.05);

        self vehicle_setSpeed(350, 225, 75);
        self setVehGoalPos(self.origin + (-10000, 0, 0), false);

        wait(5);

        self freeHelicopter();
        self delete();
    }
}

heliSniper_checkForPlayerClipping()
{
    level endon("game_ended");
    self endon("death");
    self endon("disconnect");

    while (!self isOnGround())
    {
        //Push the player towards their last insertion position, likely in a legal space instead of outside of the maps
        toInsertionPos = self.heliSniperLastInsertionPos - self.origin;
        toInsertionPos = vectorNormalize(toInsertionPos);
        targetOffset = (toInsertionPos[0], toInsertionPos[1], -1);
        self setOrigin(self.origin + targetOffset);

        wait(0.05);
    }

    self.notTargetable = false;
}
monitorAllHeliSnipers()
{
    level endon("game_ended");

    for (;;)
    {
        wait(1);

        currentTime = getTime();
        foreach (heli in level.heliSnipers)
        {
            if (!isDefined(heli.insertionTime) || (isDefined(heli.doneService) && heli.doneService))
                continue;

            if (currentTime >= heli.insertionTime + 120000)
                heli thread heliSniper_leave();
        }
    }
}

callAirdrop(marker, location)
{
    if (isDefined(marker.owner)) owner = marker.owner;
    else return;

    pathStart = location + (-10000, 0, 1800);
    angles = vectorToAngles(location - pathStart);
    forward = anglesToForward(angles);
    lb = spawnHelicopter(owner, pathStart, forward, "littlebird_mp", "vehicle_little_bird_armed");

    lb.owner = owner;
    lb setVehicleTeam(owner.sessionTeam);
    //lb enableLinkTo();
    lb vehicle_setSpeed(375, 225, 75);
    lb setTurningAbility(.3);
    marker delete();
    owner.ownsAirdrop = false;
    owner shuffleStreaks();
    owner playSound("US_1mc_use_carepackage");
    lb airdropFly(owner, location);
}
airdropFly(owner, dropLocation)
{
    self setVehGoalPos(dropLocation + (0, 0, 1800), true);
    crateTag = self getTagOrigin("tag_ground");
    crate = spawn("script_model", crateTag);
    crate setModel("com_plasticcase_friendly");
    crate.angles = (0, randomFloat(360), 0);
    crate linkTo(self, "tag_ground");
    wait(5.2);

    crate unlink();
    crate cloneBrushModelToScriptModel(level.airDropCrateCollision);
    crate setContents(1);
    crate thread dropTheCrate(owner, true);

    wait(1);

    self setVehGoalPos(dropLocation + (50000, 0, 1800), true);

    wait(7);

    self freeHelicopter();
    self delete();
}

callEmergencyAirdrop(marker, location)
{
    if (isDefined(marker.owner)) owner = marker.owner;
    else return;

    yaw = vectorToAngles(location - owner.origin);
    direction = (0, yaw[1], 0);
    forward = anglesToForward(direction);
    start = location + (forward * -15000);
    pathStart = (start[0], start[1], location[2] + 1800);
    c130 = spawnplane(owner, "script_model", pathStart, "compass_objpoint_c130_friendly", "compass_objpoint_c130_friendly");
    c130 setModel("vehicle_ac130_low_mp");

	if (!isDefined(c130))
		return;

    c130.angles = direction;
    marker delete();
    owner.ownsEmergencyAirdrop = false;
    owner shuffleStreaks();
    owner playSound("US_1mc_use_airdrop");
    c130 thread emergencyAirdropFly(owner, location, forward);
}
emergencyAirdropFly(owner, location, forward)
{
    dropLocation = (location[0], location[1], location[2] + 1800);
    self playLoopSound("veh_ac130_dist_loop");
    self moveTo(dropLocation, 7.5);
    crates = [];
    crates[0] = spawn("script_model", dropLocation + (forward * 100));
    crates[0].crateIndex = 0;
    crates[1] = spawn("script_model", dropLocation + (forward * 200));
    crates[1].crateIndex = 1;
    crates[2] = spawn("script_model", dropLocation + (forward * 300));
    crates[2].crateIndex = 2;
    crates[3] = spawn("script_model", dropLocation);
    crates[3].crateIndex = 3;
    foreach (crate in crates)
    {
        crate setModel("com_plasticcase_friendly");
        crate hide();
    }

    wait(7.5);

    foreach (crate in crates)
        crate thread dropTheCrate(owner);

    self moveTo(dropLocation + (forward * 15000), 7.5);

    wait(7.5f);

    self delete();
}
dropTheCrate(owner, isNormalAirdrop)
{
    if (!isDefined(isNormalAirdrop))
        isNormalAirdrop = false;

    if (!isNormalAirdrop)
        self.angles = (0, randomFloat(360), 0);
        
    if (!isNormalAirdrop)
    {
        self cloneBrushModelToScriptModel(level.airDropCrateCollision);
    
        crateIndex = self.crateIndex;
        switch (crateIndex)
        {
            case 0:
                self thread startCratePhysics(.15);
                break;
            case 1:
                self thread startCratePhysics(.3);
                break;
            case 2:
                self thread startCratePhysics(.45);
                break;
            default:
                self thread startCratePhysics(0);
                break;
        }
    }
    else
    {
        self thread startCratePhysics(0);
    }

    wait(5);

    curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();
    Objective_Add(curObjID, "active", self.origin, "compass_objpoint_ammo_friendly");
    //Objective_OnEntity(curObjID, self);
    self.objID = curObjID;
    self.range = 75;
    self.usabletype = "carePackage";
    self.user = undefined;
    self.streak = randomInt(10);
    if ((level.classicKillstreaks == 1 || (level.classicKillstreaks == 2 && array_contains(level.classicMaps, level._mapname))) && coinToss())
        self.streak = randomIntRange(12, 15);
    self.owner = owner;
    self maps\mp\gametypes\_aiz_map_edits::addUsable("carePackage", 75);
    self thread watchCrateUsage();

    iconName = getKillstreakCrateIcon(self.streak);
    iconEnt = spawn("script_origin", self.origin + (0, 0, 30));
    icon = iconEnt createCarePackageIcon(iconName);
    self.icon = icon;
    self.pieces = [iconEnt];//Set to allow removeUsable to delete
}

startCratePhysics(delay)
{
    wait(delay);

    dropImpulse = (randomFloat(5), randomFloat(5), randomFloat(5));
    self physicsLaunchServer((0, 0, 0), dropImpulse);
    self show();
}

watchCrateUsage()
{
    wait(90);

    if (array_contains(level.usables, self))
        self maps\mp\gametypes\_aiz_map_edits::removeUsable();
}

deployableExpAmmo(marker, pos)
{
    if (isDefined(marker.owner)) owner = marker.owner;
    else
    {
        marker delete();
        return;
    }

    owner teamSplash("used_deployable_exp_ammo");
    box = spawn("script_model", pos);
    box.angles = (0, 0, 90);
    box.owner = owner;
    box.range = 75;
    box.usabletype = "expAmmo";
    box setModel("weapon_oma_pack");
    box playSoundToTeam("mp_vest_deployed_ui", "allies");
    box playSound("exp_ammo_box");
    marker delete();
    owner.ownsExpAmmo = false;
    owner shuffleStreaks();
    box maps\mp\gametypes\_aiz_map_edits::addUsable("expAmmo", 75);
    curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();
    Objective_Add(curObjID, "active", box.origin, "compass_objpoint_deploy_friendly");
    box.objID = curObjID;

    icon = newTeamHudElem("allies");
    icon setShader("killstreak_deployable_exp_ammo_crate", 8, 8);
    icon.alpha = .85;
    icon.x = box.origin[0];
    icon.y = box.origin[1];
    icon.z = box.origin[2] + 20;
    icon.archived = false;
    icon setWaypoint(true, false);
    box.icon = icon;

    box thread destroyDeployableAmmo();
}
destroyDeployableAmmo()
{
    wait(60);

    playFX(level.fx_vestFire, self.origin);
    self maps\mp\gametypes\_aiz_map_edits::removeUsable();
    foreach (player in level.players)
    {
        if (!player.isAlive) continue;
        if (!isDefined(player.hasExpAmmoPerk) || !player.hasExpAmmoPerk) continue;

        player _unSetPerk("specialty_explosivebullets");
        player iPrintLnBold("Explosive Bullets gone");
        player.hasExpAmmoPerk = false;
    }
}
//-START MAP STREAKS-//
resetMapStreakAfterTime(time)
{
    wait(time);

    level.mapStreakOut = false;
}
initMapKillstreak()
{
    switch (level._mapname)
    {
        case "mp_alpha":
            level.mapStreakIcon = "objpoint_default";
            level.mapStreakName = "defcon_trigger";//Each use lowers defcon number, Defcon 1 triggers multiple package drops
            level.mapStreakKills = 175;
            level.defcon = 6;
            break;
        case "mp_bootleg":
            level.mapStreakIcon = "ac130_overlay_grain";
            level.mapStreakName = "acid_rain";
            level.mapStreakKills = 475;
            break;
        case "mp_bravo":
            level.mapStreakIcon = "viper_locked_box";
            level.mapStreakName = "barbed_wire";
            level.mapStreakKills = 175;
            level.mapStreakWeapon = "claymore_mp";
            break;
        case "mp_carbon":
        case "mp_roughneck":
            level.mapStreakIcon = "specialty_c4death";
            level.mapStreakName = "oil_spill";
            level.mapStreakKills = 175;
            level.mapStreakWeapon = "airdrop_juggernaut_def_mp";

            loadFX("smoke/jet_contrail");
            break;
        case "mp_dome":
            level.mapStreakName = "tank";
            level.mapStreakIcon = "killstreak_tank";
            level.mapStreakKills = 650;

            level.fx_tankExplode = loadFX("explosions/helicopter_explosion_pavelow");
            break;
        case "mp_paris":
            level.mapStreakName = "poison_gas";//Poison Gas Attack
            level.mapStreakIcon = "death_moab";
            level.mapStreakKills = 325;

            loadFX("smoke/airdrop_flare_mp_effect_now");
            break;
        case "mp_plaza2":
            level.mapStreakName = "mobile_mortar";//Mortar Team
            level.mapStreakIcon = "killstreak_mobile_mortar";
            level.mapStreakKills = 325;

            loadFX("smoke/smoke_geotrail_m203");
            loadFX("explosions/artilleryexp_dirt_brown");
            break;
        case "mp_radar":
            level.mapStreakName = "blizzard";//Blizzard
            level.mapStreakIcon = "ac130_overlay_grain";
            level.mapStreakKills = 425;
            break;
        case "mp_courtyard_ss":
            level.mapStreakName = "volcano_eruption";//Volcanic Eruption
            level.mapStreakIcon = "death_nuke";
            level.mapStreakKills = 1000;
            break;
        case "mp_hillside_ss":
            level.mapStreakName = "assault_boats";//Assault Boats
            level.mapStreakIcon = "objective_friendly";
            level.mapStreakKills = 550;

            //loadFX("treadfx/heli_water");
            break;
        case "mp_burn_ss":
            level.mapStreakIcon = "killstreak_a10_support";
            level.mapStreakName = "a10_support";
            level.mapStreakKills = 850;

            loadFX("fire/jet_afterburner_harrier");
            loadFX("smoke/jet_contrail");
            loadFX("misc/aircraft_light_red_blink");
            level.fx_rayGun = loadFx("misc/aircraft_light_wingtip_green");
            break;
        default:
            return;//Return so we dont precache extra assets
    }

    preCacheShader(level.mapStreakIcon);
}
getFriendlyMapStreakName()
{
    switch (level.mapStreakName)
    {
        case "defcon_trigger":
            return level.gameStrings[231];
        case "acid_rain":
            return level.gameStrings[234];
        case "barbed_wire":
            return "Barbed Wire";
        case "oil_spill":
            return "Oil Spill";
        case "tank":
            return level.gameStrings[230];
        case "poison_gas":
            return "Poison Gas Attack";
        case "mobile_mortar":
            return "Mortar Team";
        case "blizzard":
            return "Blizzard";
        case "volcano_eruption":
            return "Volcano Eruption";
        case "assault_boats":
            return "Assault Boats";
        case "a10_support":
            return level.gameStrings[232];
    }

    return level.mapStreakName;
}
tryUseMapStreak()
{
    if (level._mapname == "mp_alpha")
    {
        self decrementDefconLevel();
    }
    else if (level._mapname == "mp_bootleg")
    {
        if (!level.mapStreakOut) self startAcidRain();
        else return false;
    }
    //else if (level._mapname == "mp_bravo")
        //self spawnBarbWire();
    //else if (level._mapname == "mp_carbon")
        //spawnOilSpill();
    else if (level._mapname == "mp_dome")
    {
        if (!level.mapStreakOut) self spawnTanks();
        else return false;
    }
    else if (level._mapname == "mp_paris")
    {
        if (!level.mapStreakOut) self startPoisonGas();
        else return false;
    }
    else if (level._mapname == "mp_plaza2")
    {
        if (!level.mapStreakOut) self startMortarTeam();
        else return false;
    }
    else if (level._mapname == "mp_radar")
    {
        if (!level.mapStreakOut) self startBlizzard();
        else return false;
    }
    else if (level._mapname == "mp_courtyard_ss")
    {
        if (!level.mapStreakOut) self startVolcanoEruption();
        else
        {
            self iPrintLnBold(level.gameStrings[340]);
            self.cash += 10000;
            self scorePopup(10000);
            return true;
        }
    }
    else if (level._mapname == "mp_hillside_ss")
    {
        if (!level.mapStreakOut) self spawnAssaultBoats();
        else return false;
    }
    else if (level._mapname == "mp_burn_ss")
    {
        if (!level.mapStreakOut) self spawnA10();
        else return false;
    }
    else
    {
        return false;
    }

    self shuffleStreaks();
    return true;
}

decrementDefconLevel()
{
    level.defcon--;
    announcement(level.gameStrings[236], level.defcon);

    if (level.defcon == 3)
    {
        playSoundAtPos((0, 0, 0), "mp_defcon_down");
        self teamSplash("two_from_defcon");
    }
    else if (level.defcon == 2)
    {
        playSoundAtPos((0, 0, 0), "mp_defcon_down");
        self teamSplash("one_from_defcon");
    }
    else if (level.defcon == 1)
    {
        playSoundAtPos((0, 0, 0), "mp_defcon_one");
        level.defcon = 5;
        self thread doDefconDrop();
    }
    else
    {
        playSoundAtPos((0, 0, 0), "mp_defcon_down");
        self teamSplash("changed_defcon");
    }
}
doDefconDrop()
{
    marker = spawn("script_model", (0, 0, 0));
    marker setModel("tag_origin");
    marker hide();
    marker.owner = self;

    //Call two Emergency airdrops
    location = getGroundPosition(self.origin + (randomFloat(10), randomFloat(10), 0), 40);
    callEmergencyAirdrop(marker, location);

    wait(3);

    self teamSplash("callout_earned_carepackage");

    marker = spawn("script_model", (0, 0, 0));
    marker setModel("tag_origin");
    marker hide();
    marker.owner = self;

    location = getGroundPosition(self.origin + (randomFloat(10), randomFloat(10), 0), 40);
    callEmergencyAirdrop(marker, location);
}

startAcidRain()
{
    self teamSplash("used_acid_rain");
    level.mapStreakOut = true;

    foreach (player in level.players)
    {
        player visionSetNakedForPlayer("tulsa", 2);
    }

    self thread runAcidRain();
    level thread resetMapStreakAfterTime(90);
}
runAcidRain()
{
    rainFX = loadFX("weather/rain_mp_bootleg");
    rain = [];
    for (i = 0; i < 10; i++)
    {
        rain[i] = spawnFX(rainFX, self.origin);
        triggerFX(rain[i]);

        wait(1);
    }

    while (level.mapStreakOut)
    {
        wait(randomFloatRange(.1, 1));

        if (level.botsInPlay.size > 0)
        {
            randomBot = randomInt(level.botsInPlay.size);
            bot = level.botsInPlay[randomBot];

            if (!bot.isAlive)
                continue;

            botHitbox = bot.hitbox;
            isCrawler = !isDefined(bot.head) && !isDefined(bot.isBoss);

            botHitbox notify("damage", 50, self, (0, 0, 0), (0, 0, 0), "MOD_PASSTHRU", "", "", "", 0, "bombsite_mp");
        }
    }

    wait(1);

    foreach (player in level.players)
    {
        if (!player.isDown && !level.isBossWave) player visionSetNakedForPlayer(level.vision, 4);
        else if (!player.isDown && level.isBossWave) player visionSetNakedForPlayer(level.bossVision, 4);
        else player visionSetNakedForPlayer("cheat_bw");
    }

    foreach (fx in rain)
        fx delete();
}

spawnBarbWire(marker, position)
{
    if (isDefined(marker.owner)) owner = marker.owner;
    else return;

    marker delete();

    owner.ownsMapStreak = false;
    owner shuffleStreaks();

    angles = owner.angles;
    forward = anglesToForward(angles) * 40;
    wire = spawn("script_model", (position - (0, 0, 10)) + forward);
    wire.angles = owner.angles - (0, 90, 0);
    wire setModel("mil_barbedwire4");
    triggerOrigin = wire getTagOrigin("barbed_wire_04");
    trigger = spawn("trigger_radius", triggerOrigin, 0, 48, 16);
    //trigger linkTo(wire, "barbed_wire_04", (0, 0, 0), (0, 0, 0));
    wire.trigger = trigger;
    wire.owner = owner;
    owner.barbed_wire = wire;

    wire playSound("detpack_plant");

    wire thread watchBarbedWire(owner);
    wire thread barbedWireLifetime();
}
barbedWireLifetime()
{
    level endon("game_ended");
    self endon("death");

    wait(90);

    level.mapStreakOut = false;
    self destroyBarbedWire();
}
watchBarbedWire(owner)
{
    level endon("game_ended");
    self endon("death");

    while (true)
    {
        wait(.25);

        if (level.botsInPlay.size > 0)
        {
            for (i = 0; i < level.botsInPlay.size; i++)
            {
                bot = level.botsInPlay[i];
                if (!bot.isAlive)
                    continue;

                if (bot isTouching(self.trigger))
                {
                    self playSound("shell_eject_pistol_metalthin");

                    bot.inBarbedWire = true;
                    isCrawler = !isDefined(bot.head) && !isDefined(bot.isBoss);
                    bot.hitbox notify("damage", 15, owner, (0, 0, 0), (0, 0, 0), "MOD_PASSTHRU", "", "", "", 0, "claymore_mp");
                }
                else if (isDefined(bot.inBarbedWire)) bot.inBarbedWire = undefined;
            }
        }

        foreach (player in level.players)
        {
            if (!player.isAlive) continue;

            if (player isTouching(self.trigger))
            {
                movement = player getNormalizedMovement();
                if (movement[0] > 0 || movement[1] > 0)
                    self playSound("shell_eject_pistol_metalthin");
            }
        }
    }
}
destroyBarbedWire()
{
    //self.trigger unlink();
    self.trigger delete();
    self.trigger = undefined;
    self.owner.barbed_wire = undefined;
    self.owner = undefined;

    playFX(level.fx_sentryDeath, self.origin);
    self playSound("shell_eject_pistol_metalthick");

    self delete();
}

spawnOilSpill(marker, pos)
{
    if (isDefined(marker.owner)) owner = marker.owner;
    else return;

    marker delete();

    owner.ownsMapStreak = false;
    owner shuffleStreaks();

    if (level._mapname == "mp_carbon") oilFire = loadFX("fire/flame_refinery_small_far_3");
    else if (level._mapname == "mp_roughneck") oilFire = loadFX("maps/mp_roughneck/mp_rn_rigpipefire");
    else return;

    fireSound = spawn("script_origin", pos);
    fire = spawnFX(oilFire, pos);
    triggerFX(fire);

    fire playSound("flashbang_explode_default");
    fireSound playLoopSound("medfire");

    fire thread runOilSpill(fireSound, owner);
}
runOilSpill(fireSound, owner)
{
    level endon("game_ended");
    self endon("death");

    damageCount = 0;
    while (damageCount < 30)
    {
        radiusDamage(self.origin, 128, 100, 50, owner);
        damageCount++;

        wait(.5);
    }

    fireSound stopSounds();

    wait(0.05);

    fireSound delete();
    self delete();
}

startPoisonGas()
{
    self teamSplash("used_poison_gas");
    level.mapStreakOut = true;

    self thread runPoisonGas();
    level thread resetMapStreakAfterTime(60);
}
runPoisonGas()
{
    level endon("game_ended");

    gasFX = loadFX("smoke/airdrop_flare_mp_effect_now");
    gas = [];

    for (i = 0; i < level.botSpawns.size; i++)
    {
        gas[i] = spawnFX(gasFX, level.botSpawns[i]);
        triggerFX(gas[i]);

        wait(.1);
    }

    while (level.mapStreakOut)
    {
        if (level.botsInPlay.size > 0)
        {
            for (i = 0; i < level.botsInPlay.size; i++)
            {
                bot = level.botsInPlay[i];

                if (!bot.isAlive)
                    continue;

                foreach (gasPoint in gas)
                {
                    if (distanceSquared(bot.origin, gasPoint.origin) < 90000)
                    {
                        botHitbox = bot.hitbox;
                        isCrawler = !isDefined(bot.head) && !isDefined(bot.isBoss);

                        botHitbox notify("damage", 50, self, (0, 0, 0), (0, 0, 0), "MOD_PASSTHRU", "", "", "", 0, "bombsite_mp");

                        break;
                    }
                }
            }
        }

        wait(randomFloatRange(.1, 1));
    }

    wait(1);

    foreach (fx in gas)
        fx delete();
}

spawnTanks()
{
    self teamSplash("used_tank");
    level.mapStreakOut = true;

    tank1 = spawnVehicle("vehicle_m1a1_abrams_dmg", "vehicle_tank", "remote_ugv_mp", (-3113, 524, -152), (3, 8, 7), self);
    tank1.health = 1000;
    tank1.maxHealth = 1000;
    tank1 setCanDamage(false);
    //tank1 enableLinkTo();
    tank1 vehicle_setSpeed(20, 10, 5);
    tank1.departPos = (-3332, 434, -148);
    tank1.perchPos = (-1136, 760, -214);
    tank1.eyePos = (-968, 895, -182);
    tank1.destroyed = false;
    tank1.isEngaging = false;
    tank1.weapon = "remote_tank_projectile_mp";
    tank1.owner = self;
    //tank1 setVehicleLookAtText(&"The Knockout", &"");
    tank1 setVehWeapon("sam_mp");
    tank1 setVehicleTeam("allies");
    //Hide turret
    tank1 hidePart("turret_animate_jnt");
    tank1 hidePart("barrel_animate_jnt");
    tank1 hidePart("hatch_l_open_jnt");
    tank1 hidePart("hatch_r_open_jnt");
    //Spawn a script turret
    tank1Turret = spawnTurret("misc_turret", tank1.origin, "sam_mp");
    tank1Turret.angles = tank1.angles;
    tank1Turret setModel(tank1.model);
    tank1Turret setCanDamage(false);
    tank1Turret makeUnUsable();
    tank1Turret setDefaultDropPitch(0);
    //tank1Turret setSentryOwner(self);
    tank1Turret hidePart("body_animate_jnt");
    tank1Turret hidePart("left_wheel_09_jnt");
    tank1Turret hidePart("right_wheel_09_jnt");
    tank1Turret linkTo(tank1, "body_animate_jnt", (0, 0, -44), (0, 0, 0));
    tank1Turret.currentYaw = tank1Turret.angles[1];
    tank1Turret.targetYaw = tank1Turret.currentYaw;
    tank1.turret = tank1Turret;
    tank1TurretHelper = spawn("script_model", tank1Turret.origin);
    tank1TurretHelper.angles = tank1Turret.angles;
    tank1TurretHelper setModel("tag_origin");
    tank1TurretHelper linkTo(tank1, "body_animate_jnt", (0, 0, -44), (0, 0, 0));
    tank1.turretHelper = tank1TurretHelper;

    tank2 = spawnVehicle("vehicle_m1a1_abrams_dmg", "vehicle_tank", "remote_ugv_mp", (3327, -2066, -575), (-10, 140, -14), self);
    tank2.health = 1000;
    tank2.maxHealth = 1000;
    tank2 setCanDamage(false);
    //tank2 enableLinkTo();
    tank2 vehicle_setSpeed(20, 10, 5);
    tank2.departPos = (3282, -2057, -585);
    tank2.perchPos = (2488, -1335, -352);
    tank2.eyePos = (1511, -620, -119);
    tank2.destroyed = false;
    tank2.isEngaging = false;
    tank2.weapon = "uav_strike_projectile_mp";
    tank2.owner = self;
    //tank2 setVehicleLookAtText(&"The Pounder", &"");
    tank2 setVehWeapon("sam_mp");
    tank2 setVehicleTeam("allies");
    //Hide turret
    tank2 hidePart("turret_animate_jnt");
    tank2 hidePart("barrel_animate_jnt");
    tank2 hidePart("hatch_l_open_jnt");
    tank2 hidePart("hatch_r_open_jnt");
    //Spawn a script turret
    tank2Turret = spawnTurret("misc_turret", tank2.origin, "sam_mp");
    tank2Turret.angles = tank2.angles;
    tank2Turret setModel(tank2.model);
    tank2Turret setCanDamage(false);
    tank2Turret makeUnUsable();
    tank2Turret setDefaultDropPitch(0);
    //tank2Turret setSentryOwner(self);
    tank2Turret hidePart("body_animate_jnt");
    tank2Turret hidePart("left_wheel_09_jnt");
    tank2Turret hidePart("right_wheel_09_jnt");
    tank2Turret linkTo(tank2, "body_animate_jnt", (0, 0, -44), (0, 0, 0));
    tank2Turret.currentYaw = tank2Turret.angles[1];
    tank2Turret.targetYaw = tank2Turret.currentYaw;
    tank2.turret = tank2Turret;
    tank2TurretHelper = spawn("script_model", tank2Turret.origin);
    tank2TurretHelper.angles = tank2Turret.angles;
    tank2TurretHelper setModel("tag_origin");
    tank2TurretHelper linkTo(tank2, "body_animate_jnt", (0, 0, -44), (0, 0, 0));
    tank2.turretHelper = tank2TurretHelper;

    tank3 = spawnVehicle("vehicle_m1a1_abrams_dmg", "vehicle_tank", "remote_ugv_mp", (5440, 3933, 686), (0, -144, 0), self);
    tank3.health = 1000;
    tank3.maxHealth = 1000;
    tank3 setCanDamage(false);
    //tank3 enableLinkTo();
    tank3 vehicle_setSpeed(20, 10, 5);
    tank3.departPos = (5440, 3933, 686);
    tank3.perchPos = (4212, 3164, 587);
    tank3.eyePos = (2257, 1655, 519);
    tank3.destroyed = false;
    tank3.isEngaging = false;
    tank3.weapon = "remote_tank_projectile_mp";
    tank3.owner = self;
    //tank3 setVehicleLookAtText(&"Kenshin13", &"");
    tank3 setVehWeapon("sam_mp");
    tank3 setVehicleTeam("allies");
    //Hide turret
    tank3 hidePart("turret_animate_jnt");
    tank3 hidePart("barrel_animate_jnt");
    tank3 hidePart("hatch_l_open_jnt");
    tank3 hidePart("hatch_r_open_jnt");
    //Spawn a script turret
    tank3Turret = spawnTurret("misc_turret", tank3.origin, "sam_mp");
    tank3Turret.angles = tank3.angles;
    tank3Turret setModel(tank3.model);
    tank3Turret setCanDamage(false);
    tank3Turret makeUnUsable();
    tank3Turret setDefaultDropPitch(0);
    //tank3Turret setSentryOwner(self);
    tank3Turret hidePart("body_animate_jnt");
    tank3Turret hidePart("left_wheel_09_jnt");
    tank3Turret hidePart("right_wheel_09_jnt");
    tank3Turret linkTo(tank3, "body_animate_jnt", (0, 0, -44), (0, 0, 0));
    tank3Turret.currentYaw = tank3Turret.angles[1];
    tank3Turret.targetYaw = tank3Turret.currentYaw;
    tank3.turret = tank3Turret;
    tank3TurretHelper = spawn("script_model", tank3Turret.origin);
    tank3TurretHelper.angles = tank3Turret.angles;
    tank3TurretHelper setModel("tag_origin");
    tank3TurretHelper linkTo(tank3, "body_animate_jnt", (0, 0, -44), (0, 0, 0));
    tank3.turretHelper = tank3TurretHelper;

    //Drive the tanks to their designated perch
    tank1Mover = spawn("script_model", tank1.departPos);
    tank1Mover setModel("tag_origin");
    tank1Mover moveTo(tank1.perchPos, 8, 0.5, 0.5);
    tank1 thread tank_followMover(tank1Mover);
    tank2Mover = spawn("script_model", tank2.departPos);
    tank2Mover setModel("tag_origin");
    tank2Mover moveTo(tank2.perchPos, 10, 0.5, 0.5);
    tank2 thread tank_followMover(tank2Mover);
    tank3Mover = spawn("script_model", tank3.departPos);
    tank3Mover setModel("tag_origin");
    tank3Mover moveTo(tank3.perchPos, 6, 0.5, 0.5);
    tank3 thread tank_followMover(tank3Mover);

    tank1 thread tank_waitToArriveAtPerch(8.05, tank1Turret, tank1Mover);
    tank2 thread tank_waitToArriveAtPerch(10.05, tank2Turret, tank2Mover);
    tank3 thread tank_waitToArriveAtPerch(6.05, tank3Turret, tank3Mover);
}
tank_followMover(mover)//This teleports the tank to its mover every server frame to get around the lack of vehicle goals
{
    self endon("arrived");

    while (isDefined(mover))
    {
        self Vehicle_Teleport(mover.origin, self.angles);
        waitframe();
    }
}
tank_waitToArriveAtPerch(time, turret, mover)
{
    wait(time);

    mover delete();
    self tank_arriveAtPerch(turret);
}
tank_arriveAtPerch(tankTurret)
{
    self notify("arrived");
    //tankTurret unlink();
    //tankTurret.origin = self.perchPos;
    self Vehicle_Teleport(self.perchPos, self.angles);

    self thread tank_searchForTargets();
    self thread tank_timer();
}
tank_timer()
{
    wait(60 + randomFloat(5));

    if (self.isEngaging)
    {
        self thread tank_waitForFlee();
    }
    else
    {
        self.destroyed = true;
        self tank_flee();
    }
}
tank_waitForFlee()
{
    level endon("game_ended");
    self endon("death");

    while (self.isEngaging)
    {
        wait(0.5);
    }

    self.destroyed = true;
    self tank_flee();
}
tank_searchForTargets()
{
    level endon("game_ended");
    self endon("death");

    while (true)
    {
        wait(10);

        if (self.destroyed) break;

        foreach (bot in level.botsInPlay)
        {
            if (!bot.isAlive) continue;

            eye = self.eyePos;
            botHitbox = bot.hitbox;

            trace = sightTracePassed(eye, botHitbox.origin + (0, 0, 30), false, self);
            if (!trace) continue;

            self thread tank_engageTarget(botHitbox);
            break;
        }
    }
}
tank_rotateTurret(target)
{
    self endon("death");

    tankTurret = self.turret;
    tankTurretHelper = self.turretHelper;
    tankTurretHelper unlink();
    tankTurret unlink();
    tankTurret.origin = self.perchPos;
    tankTurretHelper.origin = tankTurret.origin;
    yaw = vectorToYaw(target.origin - tankTurret.origin);
    localYaw = self.angles[1];
    currentYaw = tankTurret.currentYaw;
    tankTurretHelper addYaw(yaw - currentYaw);
    targetAngles = tankTurretHelper.angles;
    tankTurret.currentYaw = yaw;
    tankTurretHelper addYaw(-(yaw - currentYaw));
    tankTurretHelper rotateTo(targetAngles, 2);
    tankTurret.targetYaw = yaw - localYaw;

    while (self.isEngaging)
    {
        tankTurret.angles = tankTurretHelper.angles;
        waitframe();
    }
}
tank_engageTarget(target)
{
    self.isEngaging = true;
    self thread tank_rotateTurret(target);

    wait(2.05);

    self.turret linkTo(self, "body_animate_jnt", (0, 0, -44), (0, self.turret.targetYaw, 0));
    self fireWeapon("origin_animate_jnt", self, (0, 0, 0));
    self.turret.angles = self.turretHelper.angles;
    start = self.turret getTagOrigin("tag_flash");
    angles = anglesToForward(self.turret.angles);
    missile = magicBullet(self.weapon, start, self.turret.origin + angles * 7000, self.owner);
    missile Missile_SetTargetEnt(target);
    missile Missile_SetFlightmodeTop();
    self.isEngaging = false;
}
tank_flee()
{
    missile = MagicBullet("remote_mortar_missile_mp", self.perchPos + (0, 0, 5000), self.perchPos);
    missile thread tank_waitForMissileImpact(self);
}
tank_waitForMissileImpact(tank)
{
    self waittill("explode", m, pos);

    if (isDefined(tank))
        tank tank_destroyTank(pos);
}
tank_destroyTank(pos)
{
    //self playSound("");
    playFX(level.fx_tankExplode, self.origin);
    self.turret delete();
    self.turret = undefined;
    self.turretHelper delete();
    self freeVehicle();
    self delete();

    level.mapStreakOut = false;
}

startMortarTeam()
{
    self teamSplash("used_mobile_mortar");
    
    level.mapStreakOut = true;

    self thread runMortarTeam();

    level thread resetMapStreakAfterTime(15);
}
runMortarTeam()
{
    while (true)
    {
        wait(1.75);

        if (!level.mapStreakOut)
            break;

        if (level.botsInPlay.size == 0)
            continue;

        self thread launchMortar();
    }
}
launchMortar()
{
    targetBot = level.botsInPlay[randomInt(level.botsInPlay.size)];
    endPos = targetBot.origin;
    mortar = spawn("script_model", endPos + (0, 0, 5000));
    mortar setModel("projectile_at4");
    mortar.angles = (90, 0, 0);
    mortar playSound("bmp_fire");

    wait(0.05);

    trailFX = loadFX("smoke/smoke_geotrail_m203");
    playFXOnTag(trailFX, mortar, "tag_fx");
    explodeFX = loadFX("explosions/artilleryexp_dirt_brown");

    mortar moveTo(endPos, 2);

    wait(2);

    radiusDamage(endPos, 512, 500, 100, self);
    playFX(explodeFX, endPos);
    mortar playSound("detpack_explo_layer");
    mortar delete();
}

startBlizzard()
{
    self teamSplash("used_blizzard");
    level.mapStreakOut = true;

    self thread runBlizzard();

    level thread resetMapStreakAfterTime(45);
}
runBlizzard()
{
    snowFX = loadFX("snow/snow_blizzard_radar");
    snow = [];
    for (i = 0; i < 6; i++)
    {
        snow[i] = spawnFX(snowFX, self.origin);
        triggerFX(snow[i]);

        wait(1);
    }

    while (level.mapStreakOut)
    {
        if (level.botsInPlay.size > 0)
        {
            randomBot = randomInt(level.botsInPlay.size);
            bot = level.botsInPlay[randomBot];

            if (!bot.isAlive)
                continue;

            botHitbox = bot.hitbox;

            botHitbox notify("damage", 20, self, (0, 0, 0), (0, 0, 0), "MOD_PASSTHRU", "", "", "", 0, "bombsite_mp");
        }

        wait(randomFloatRange(.5, 1.5));
    }

    wait(1);

    foreach (fx in snow)
        fx delete();
}

startVolcanoEruption()
{
    self teamSplash("used_volcano_eruption");
    playSoundAtPos((0, 0, 0), "mp_lose_flag");
    level.mapStreakOut = true;

    self thread doVolcanoEruption();
}
doVolcanoEruption()
{
    fx_explosion = loadFX("explosions/javelin_explosion");
    fx_volcano = loadFX("maps/mp_courtyard_ss/mp_ct_volcano");
    volcano = (584, 18103, 5665);

    rumbleSound = spawn("script_origin", (-498, 1516, 503));
    rumbleSound playLoopSound("elm_explosions_dist");

    wait(10);

    earthquake(.5, 10, rumbleSound.origin, 999999);
    playFX(fx_explosion, volcano);

    wait(3);

    PlaySoundAtPos(rumbleSound.origin, "nuke_explosion_dist_sub");
    for (i = 0; i < 5; i++)
    {
        smoke = spawnFX(fx_volcano, volcano);
        triggerFX(smoke);
    }

    level.vision = "dcemp_emp";
    foreach (player in level.players)
    {
        player visionSetNakedForPlayer("dcemp_emp", 3);
    }

    mapFX = [];

    mapFX[0] = spawnFX(fx_volcano, (-585, -641, 11));
    mapFX[1] = spawnFX(fx_volcano, (-502, -1536, 15));
    mapFX[2] = spawnFX(fx_volcano, (383, -1518, 15));
    mapFX[3] = spawnFX(fx_volcano, (438, -646, 12));

    wait(1);

    foreach (fx in mapFX)
        triggerFX(fx);

    self thread nukeDetonation(true);
    level.spawnedBots = level.botsForWave;
    playSoundAtPos(rumbleSound.origin, "nuke_wave");

    wait(7);

    rumbleSound stopLoopSound();
    rumbleSound delete();

    level.vision = "dcburning_trenches";//Replace the vision for the match
    setSunLight(0, 0, 0);//Remove sunlight
    foreach (player in level.players)
    {
        if (!player.isDown && !level.isBossWave) player visionSetNakedForPlayer(level.vision, 4);
        else if (!player.isDown && level.isBossWave) player visionSetNakedForPlayer(level.bossVision, 4);
        else player visionSetNakedForPlayer("cheat_bw");
    }

    wait(15);

    for (i = 0; i < mapFX.size; i++)
        mapFX[i] delete();
}

spawnAssaultBoats()
{
    level.mapStreakOut = true;
    self teamSplash("used_assault_boats");

    level thread resetMapStreakAfterTime(70);

    boats = [];

    boats[0] = spawn("script_model", (27999, -18866, 2140));
    boats[0].startPos = (27999, -18866, 2140);
    boats[0].endPos = (3700, -1000, 2140);
    boats[1] = spawn("script_model", (34606, 26639, 2140));
    boats[1].startPos = (34606, 26639, 2140);
    boats[1].endPos = (3700, 1250, 2140);

    foreach (boat in boats)
    {
        boat setModel("yacht_modern_periph");
        angles = vectorToAngles(boat.endPos - boat.startPos);
        boat.angles = angles;
        boat scriptModelPlayAnim("yacht_modern_periph_idle1");
        boat.owner = self;
        boat playLoopSound("veh_ac130_ext_close");
        turret = spawnTurret("script_turret", boat.origin + (anglesToForward(boat.angles) * 550) + (anglesToUp(boat.angles) * 170), "sentry_minigun_mp");
        turret setModel("mp_remote_turret");
        turret.angles = boat.angles;
        turret makeTurretInOperable();
        turret setRightArc(80);
        turret setLeftArc(80);
        turret setBottomArc(80);
        turret makeUnUsable();
        turret setDefaultDropPitch(-89.0);
        turret setTurretModeChangeWait(true);
        turret setMode("sentry");
        turret.owner = self;
        turret setTurretTeam("allies");
        turret setSentryOwner(self);
        turret linkTo(boat, "tag_origin");
        turret.isBeingCarried = true;//This controls turret availability
        turret.timeLeft = 1;
        turret.isSentryGL = false;
        turret thread sentry_targeting();
        turret thread assaultBoats_runSentry();
        boat.turret = turret;
        boat thread assaultBoats_rideIn();

        //boat assaultBoat_runBoatFX();
    }
}
assaultBoats_runSentry()
{
    level endon("game_ended");
    self endon("death");

    while (true)
    {
        self.isBeingCarried = !self.isBeingCarried;
        if (!self.isBeingCarried)
            self playSound("talon_reload");

        if (self.timeLeft < 1)
            break;

        wait(5);
    }
}
assaultBoats_rideIn()
{
    self moveTo(self.endPos, 10, 0, 7.5);

    wait(10);

    self stopLoopSound();
    self playSound("veh_ac130_ext_close_fade");

    wait(1);

    self thread assaultBoat_attack();
}
assaultBoat_attack()
{
    level endon("game_ended");
    self endon("death");

    while (true)
    {
        wait(randomFloatRange(5, 10));

        if (!level.mapStreakOut)
        {
            self thread assaultBoat_leave();
            break;
        }

        foreach (bot in level.botsInPlay)
        {
            if (!bot.isAlive) continue;

            eye = (2272, -488, 3906);
            botHitbox = bot.hitbox;

            trace = sightTracePassed(eye, botHitbox.origin + (0, 0, 30), false, self);
            if (!trace) continue;

            missile = magicBullet("javelin_mp", self.origin + (0, 0, 100), bot.origin, self.owner);
            missile Missile_SetTargetEnt(bot);
            missile Missile_SetFlightModeTop();

            break;
        }
    }
}
assaultBoat_leave()
{
    self playLoopSound("veh_ac130_ext_close");
    turret = self.turret;
    turret.isBeingCarried = true;
    turret.timeLeft = 0;

    target = self.startPos;
    targetYaw = vectorToYaw(target - self.origin);

    self moveTo(self.endPos - (250, 0, 0), 2, .5, .5);
    self rotateTo((0, targetYaw, 0), 7, 2, 2);

    wait(3);

    self moveTo(target, 10, 5);

    wait(10);

    turret delete();
    self stopLoopSound();
    self delete();
}

spawnA10()
{
    //Sanity check
    if (level._mapname != "mp_burn_ss") return;

    level.mapStreakOut = true;

    a10 = spawnHelicopter(self, (-25000, 0, level.heliHeight), (0, 0, 0), "harrier_mp", "vehicle_a10_warthog");//spawnPlane(self, "script_model", (-15000, 0, level.heliHeight), "compass_objpoint_reaper_friendly", "compass_objpoint_reaper_enemy");

    a10.owner = self;
    a10 setVehicleTeam("allies");
    a10.mapCenter = (-800, -30, level.heliHeight);
    a10.state = "strafing";
    a10.hasFired = false;
    a10.timeLeft = 90;
    a10 Vehicle_SetSpeed(300, 50, 50);
    //a10 vehicle_setSpeedImmediate(300);
    a10 setCanDamage(false);
    a10 setMaxPitchRoll(0, 75);
    a10 setYawSpeed(50, 25, 20, .5);
    a10 setVehWeapon("ac130_25mm_mp");
    //self playSound("US_1mc_use_a10");
    self playSound("US_1mc_use_strafe");
    self teamSplash("used_a10_support");

    a10Sound = [];
    for (i = 0; i < 5; i++)
    {
        a10Sound[i] = spawn("script_origin", a10.origin);
        a10Sound[i] linkTo(a10);
    }
    a10.sound = a10Sound;

    a10Brr = [];
    for (i = 0; i < 5; i++)
    {
        a10Brr[i] = spawn("script_origin", a10.origin);
        a10Brr[i] linkTo(a10);
    }
    a10.brrSound = a10Brr;

    a10 thread doA10FlyBy();
    a10 thread playA10FX();
    a10 thread a10_targeting();
    a10 thread a10_monitorGoalPos();
    a10 thread a10_timer();
    self thread playA10Radio();
}
playA10Radio()
{
    self endon("death");
    self endon("disconnect");

    wait(2);
    
    self playLocalSound("US_1mc_KS_hqr_a10");
}
doA10FlyBy()
{
    wait(0.05);
    self setVehGoalPos(self.mapCenter, false);
}
a10_targeting()
{
    level endon("game_ended");
    self endon("death");

    while (true)
    {
        wait(.1);

        if (self.state != "strafing") continue;
        if (isDefined(self.targetEnt)) continue;

        gunTag = self getTagOrigin("tag_gun");
        foreach (bot in level.botsInPlay)
        {
            if (!bot.isAlive) continue;

            botHitbox = bot.hitbox;
            if (distance2D(self.origin, botHitbox.origin) > 6000) continue;

            trace = sightTracePassed(gunTag, botHitbox.origin, false, botHitbox, self);
            if (!trace) continue;

            self.targetEnt = bot;
            self setTurretTargetEnt(botHitbox);
            self thread a10_fireWeapon(botHitbox);
            self playLoopSound("pavelow_mg_loop");//Start our firing sound here
            a10Sound = self.sound;
            foreach (sound in a10Sound)
                sound playLoopSound("veh_ac130_ext_close");
            break;//Found a target, leave this loop to target that bot only
        }

        if (!isDefined(self.owner)) break;
    }
}
a10_monitorGoalPos()
{
    level endon("game_ended");
    self endon("death");

    while (true)
    {
        wait(.1);

        if (!isDefined(self.owner)) break;
        if (self.state != "strafing") continue;

        if (distance2D(self.origin, self.mapCenter) < 256)
            self thread a10_uturn();
    }
}
a10_uturn()
{
    self endon("death");

    right = anglesToRight(self.angles);
    right[2] = 0;
    if (cointoss()) right = vecscale(right, -1);
    turnDirector = self.mapCenter + (right * 14000);

    self setVehGoalPos(turnDirector, false);

    wait(1);

    foreach (sound in self.sound)
        sound stopLoopSound();

    wait(.5);

    if (self.hasFired) self thread a10_playBrr();

    if (!isDefined(self.owner)) return;//In case it left during this part of the uturn

    self.state = "uturn";
    turnDirector[1] = turnDirector[1] - (right[1] * 4000);
    self setVehGoalPos(turnDirector, false);

    wait(3);

    //self vehicle_setSpeedImmediate(300);
    self setVehGoalPos(self.mapCenter, false);
    self.state = "strafing";
}
vecscale(vec, scalar)
{
	return (vec[0]*scalar, vec[1]*scalar, vec[2]*scalar);
}
a10_leave()
{
    level endon("game_ended");

    while (self.state != "strafing")
        wait(.5);

    self.owner = undefined;

    forward = anglesToForward(self.angles);
    self setVehGoalPos(self.origin + (forward * 50000), false);

    wait(7);

    self.state = undefined;
    self.mapCenter = undefined;
    self.timeLeft = undefined;
    a10Sound = self.sound;
    foreach (sound in a10Sound)
        sound delete();
    brrSound = self.brrSound;
    foreach (sound in brrSound)
        sound delete();
    self freeHelicopter();
    self delete();
    level.mapStreakOut = false;
}
a10_fireWeapon(target)
{
    level endon("game_ended");
    self endon("death");

    while (true)
    {
        wait(.1);

        if (!isDefined(self.owner)) break;
        if (!isDefined(self.targetEnt)) break;

        if (!target.parent.isAlive)
        {
            self.targetEnt = undefined;//Target mysteriously died
            self clearTurretTarget();
            self stopLoopSound();//Stop our fire sound
            break;
        }

        self.hasFired = true;

        gunTag = self getTagOrigin("tag_gun");
        magicBullet("ac130_25mm_mp", gunTag, target.origin, self.owner);
        //self fireWeapon("tag_gun", target);

        trace = sightTracePassed(gunTag, target.origin, false, target, self);
        if (!trace)
        {
            self.targetEnt = undefined;//Lost sight of the target
            self clearTurretTarget();
            self stopLoopSound();//Stop our fire sound
            break;
        }
    }
}
a10_timer()
{
    level endon("game_ended");
    self endon("death");

    while (true)
    {
        if (!isDefined(self.owner)) break;
        self.timeLeft--;
        if (self.timeLeft <= 0 || !self.owner.isAlive)
        {
            self thread a10_leave();
            break;
        }

        wait(1);
    }
}
a10_playBrr()
{
    self.hasFired = false;
    brrSound = self.brrSound;
    foreach (brr in brrSound)
    {
        brr playLoopSound("ac130_40mm_fire_npc");
    }

    wait(1);

    foreach (brr in brrSound)
    {
        brr stopLoopSound();
    }
}
playA10FX()
{
    wait(.2);

    fx_afterburner = loadFX("fire/jet_afterburner_harrier");
    fx_contrail = loadFX("smoke/jet_contrail");
    fx_tail = loadFX("misc/aircraft_light_red_blink");

    if (isDefined(fx_contrail))
    {
        playFXOnTag(fx_contrail, self, "tag_right_wingtip");
        playFXOnTag(fx_contrail, self, "tag_left_wingtip");
    }

    wait(.2);

    if (isDefined(fx_afterburner))
    {
        playFXOnTag(fx_afterburner, self, "tag_engine_right");
        playFXOnTag(fx_afterburner, self, "tag_engine_left");
    }

    wait(.2);
    playFXOnTag(level.fx_rayGun, self, "tag_left_wingtip");
    wait(.2);
    playFXOnTag(level.fx_rayGunUpgrade, self, "tag_right_wingtip");

    if (!isDefined(fx_tail)) return;

    wait(.2);
    playFXOnTag(fx_tail, self, "tag_left_tail");
    wait(.2);
    playFXOnTag(fx_tail, self, "tag_right_tail");
}
//-END MAP STREAKS-//