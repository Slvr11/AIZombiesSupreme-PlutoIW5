#include maps\mp\gametypes\_aiz;
#include maps\mp\gametypes\_aiz_hud;
#include maps\mp\_utility;
#include common_scripts\utility;

#define DROPTYPE_NONE 0
#define DROPTYPE_INSTAKILL 1
#define DROPTYPE_DOUBLEPOINTS 2
#define DROPTYPE_AMMO 3
#define DROPTYPE_NUKE 4
#define DROPTYPE_GUN 5
#define DROPTYPE_CASH 6
#define DROPTYPE_POINTS 7
#define DROPTYPE_SALE 8
#define DROPTYPE_PERK 9
#define DROPTYPE_FREEZE 10

checkForBonusDrop()
{
            randomInt = 0;
            if (level.wave <= 5) randomInt = randomInt(100);
            else if (level.wave <= 10) randomInt = randomInt(200);
            else randomInt = randomInt(300);

            if (randomInt == 5)
                return 1;//DROPTYPE_INSTAKILL;
            else if (randomInt == 10)
                return 2;//DROPTYPE_DOUBLEPOINTS;
            else if (randomInt == 15)
                return 3;//DROPTYPE_AMMO;
            else if (randomInt == 20)
                return 4;//DROPTYPE_NUKE;
            else if (randomInt == 25 && !array_contains(level.wawMaps, level._mapname))
                return 5;//DROPTYPE_GUN;
            else if (randomInt == 30)
                return 6;//DROPTYPE_CASH;
            else if (randomInt == 35 && level._mapname != "mp_base")
                return 7;//DROPTYPE_POINTS;
            else if (randomInt == 40 && !level.freezerActivated)
                return 10;//DROPTYPE_FREEZE;
            else if (randomInt == 45 && !level.sale && level.wave > 10)
                return 8;//DROPTYPE_SALE;
            else return 0;//DROPTYPE_NONE;
}

activateBonusDrop(bonus)
{
    if (!isDefined(bonus.type))
    {
        printLn("Error activating a bonus drop: missing type field");
        return;
    }

    switch (bonus.type)
    {
        case 1:
            level.instaKillTime += 30;
            maps\mp\gametypes\_aiz_bot_util::startInstakill();
            if (array_contains(level.wawMaps, level._mapname)) bonus playSound("aiz_powerup_grab");
            else if (!isDefined(level.musicPlaying)) bonus playSound("mp_level_up");
            break;
        case 2:
            level.doublePointsTime += 30;
            maps\mp\gametypes\_aiz_bot_util::startDoublePoints();
            if (array_contains(level.wawMaps, level._mapname)) bonus playSound("aiz_powerup_grab");
            else if (!isDefined(level.musicPlaying)) bonus playSound("mp_level_up");
            break;
        case 3:
            foreach (players in level.players)
                if (players.isAlive) players z_giveMaxAmmo();
            break;
        case 4:
            level thread doNuke(bonus);
            break;
        case 6:
            if (array_contains(level.wawMaps, level._mapname)) bonus playSound("aiz_powerup_grab");
            else if (!isDefined(level.musicPlaying)) bonus playSound("mp_level_up");
            foreach (players in level.players)
            {
                if (players.isAlive && players.aizHud_created)
                {
                    players.cash += 1000;
                    players scorePopup(1000);
                    players scoreMessage(level.gameStrings[97]);
                }
            }
            break;
        case 7:
            if (array_contains(level.wawMaps, level._mapname)) bonus playSound("aiz_powerup_grab");
            else if (!isDefined(level.musicPlaying)) bonus playSound("mp_level_up");
            foreach (players in level.players)
            {
                if (players.isAlive && players.aizHud_created)
                {
                    players.points += 10;
                    players scoreMessage(level.gameStrings[98]);
                    pointNumber = players.hud_point;
                    pointNumber setValue(players.points);
                }
            }
            break;
        case 10:
            level thread doFreezer(bonus);
            break;
        case 8:
            maps\mp\gametypes\_aiz_map_edits::startSale();
            break;
        case 9:
            giveRandomPerkToAll();
            break;
        case 5:
            if (array_contains(level.wawMaps, level._mapname)) self playLocalSound("aiz_powerup_grab");
            else if (!isDefined(level.musicPlaying)) self playLocalSound("mp_level_up");
            self thread giveDeathMachine();
            break;
        default:
            break;
    }
    self showPowerUpHud(bonus.type);
}
giveDeathMachine()
{
    currentWeapon = self getCurrentWeapon();
    weaponName = "iw5_deathmachine_mp_thermal";
    if (array_contains(level.classicMaps, level._mapname))
        weaponName = "iw4_deathmachine_mp";
    self giveWeapon(weaponName);
    self thread switchToWeapon_delay(weaponName, 0.2);
    self disableWeaponSwitch();
    if (!array_contains(level.classicMaps, level._mapname))
    {
        self allowAds(false);
        //self givePerk("specialty_rof", false);
        //self givePerk("specialty_extendedmags", false);
        //self setClientDvar("perk_weapRateMultiplier", "0.5");
        //self.hasAlteredROF = true;
        self setSpreadOverride(1);
    }

    wait(30);

    if (isDefined(self) && self.isAlive)
    {
        //if (!self.perksBought[4]) self _unSetPerk("specialty_rof");
        //self _unSetPerk("specialty_extendedmags");
        self takeWeapon(weaponName);
        self switchToWeapon(currentWeapon);
        self enableWeaponSwitch();
        self allowAds(true);
        self resetSpreadOverride();
    }
}

spawnBonusDrop(type, loc)
{
    bonus = spawn("script_model", loc + (0, 0, 30));
    bonus.angles = (0, 0, 0);
    if (type == DROPTYPE_DOUBLEPOINTS)
    {
        if (level.legacyPowerupModels)
        {
            bonus setModel("com_plasticcase_friendly");
            powerupFx = spawnFX(level.fx_greenSmoke, bonus.origin);
            triggerFX(powerupFx);
            bonus.attachedFX = powerupFx;
        }
        else
        {
            bonus setModel("zombie_x2_icon");
            angles = (90, 0, 0);
            powerupFx = spawnFX(level.fx_powerup, bonus.origin);
            triggerFX(powerupFx);
            bonus.attachedFX = powerupFx;
        }
    }
    else if (type == DROPTYPE_AMMO)
    {
        if (level.legacyPowerupModels)
            bonus setModel("com_plasticcase_friendly");
        else
            bonus setModel("zombie_ammocan");
    }
    else if (type == DROPTYPE_INSTAKILL)
    {
        if (level.legacyPowerupModels)
        {
            bonus setModel("com_plasticcase_trap_friendly");
            powerupFx = spawnFX(level.fx_smallFire, bonus.origin);
            triggerFX(powerupFx);
            bonus.attachedFX = powerupFx;
        }
        else
            bonus setModel("zombie_skull");
    }
    else if (type == DROPTYPE_NUKE)
    {
        if (array_contains(level.wawMaps, level._mapname))
        {
            bonus setModel("zombie_bomb");
            powerupFx = spawnFX(level.fx_powerup, bonus.origin);
            triggerFX(powerupFx);
            bonus.attachedFX = powerupFx;
        }
        else
        {
            bonus.origin = bonus.origin + (0, 0, 15);
            bonus setModel("projectile_cbu97_clusterbomb");
            bonus.angles = (-90, 0, 0);
        }
    }
    else if (type == DROPTYPE_FREEZE)
    {
        bonus.origin += (0, 0, 15);
        bonus setModel("mp_trophy_system_folded");
        bonus.angles = (-90, 0, 0);
    }
    else if (type == DROPTYPE_GUN)
    {
        if (level.legacyPowerupModels)
        {
            if (array_contains(level.classicMaps, level._mapname))
                bonus setModel("weapon_m240");
            else
                bonus setModel("weapon_pecheneg_iw5");
        }
        else
            bonus setModel("zombie_pickup_minigun");
    }
    else if (type == DROPTYPE_CASH)
    {
        if (level.legacyPowerupModels)
        {
            bonus setModel("fx_cash01");
            powerupFx = spawnFX(level.fx_greenSmoke, bonus.origin);
            triggerFX(powerupFx);
            bonus.attachedFX = powerupFx;
        }
        else
            bonus setModel("zombie_z_money_icon");
    }
    else if (type == DROPTYPE_POINTS)
    {
        bonus setModel("prop_dogtags_foe");
    }
    else if (type == DROPTYPE_SALE)
    {
        if (level.legacyPowerupModels)
        {
            bonus setModel("com_plasticcase_dummy");
            powerupFx = spawnFX(level.fx_smallFire, bonus.origin);
            triggerFX(powerupFx);
            bonus.attachedFX = powerupFx;
        }
        else
            bonus setModel("zombie_firesale");
    }
    else if (type == DROPTYPE_PERK)
    {
        if (level.legacyPowerupModels)
        {
            bonus setModel("ims_scorpion_explosive1");
            powerupFx = spawnFX(level.fx_greenSmoke, bonus.origin);
            triggerFX(powerupFx);
            bonus.attachedFX = powerupFx;
        }
        else
            bonus setModel("zombie_pickup_perk_bottle");
    }

    if (type != DROPTYPE_NUKE && type != DROPTYPE_FREEZE && type != DROPTYPE_DOUBLEPOINTS)
    {
        angles = (90, 0, 0);
        powerupFx = spawnFX(level.fx_powerup, bonus.origin);
        triggerFX(powerupFx);
        bonus.attachedFX = powerupFx;
    }
    bonus.type = type;
    bonus.isPowerupDrop = true;

    bonus thread startBonusFlash();

    level thread checkForPowerupCollection(bonus);
    bonus thread rotatePowerup();

    if (array_contains(level.wawMaps, level._mapname)) bonus playSound("aiz_powerup_spawn");
}
rotatePowerup()
{
    self endon ("death");
    while (isDefined(self))
    {
        self rotateYaw(360, 4);
        wait(4);
    }
}
checkForPowerupCollection(bonus)
{
    level endon("game_ended");
    bonus endon("collected");
    bonus endon("death");

    while (true)
    {
        if (!isDefined(bonus) || !isDefined(bonus.type)) break;

        foreach (player in level.players)
        {
            if (!player.isAlive || distanceSquared(player.origin, bonus.origin) > 4225 || player.sessionTeam != "allies") continue;
            if (bonus.type == DROPTYPE_GUN && (player.isDown || isWeaponDeathMachine(player getCurrentWeapon()))) continue;

            player thread activateBonusDrop(bonus);
            if (isDefined(bonus.attachedFX))
            {
                fx = bonus.attachedFX;
                fx delete();
            }
            if (bonus.type != DROPTYPE_NUKE && bonus.type != DROPTYPE_FREEZE)
            {
                playFX(level.fx_powerupCollect, bonus.origin);
                bonus.isPowerupDrop = undefined;
                bonus delete();
            }

            bonus notify("collected");
            break;
        }

        wait(0.1);
    }
}
startBonusFlash()
{
    self endon("collected");

    wait(20);

    if (!isDefined(self)) return;

    self thread bonusFlash();

    wait(10);

    if (!isDefined(self)) return;
    if (isDefined(self.attachedFX))
    {
        self.attachedFX delete();
    }
    self.isPowerupDrop = undefined;
    self delete();
}
bonusFlash()
{
    self endon("collected");
    
    if (!isDefined(self)) return;

    while(isDefined(self.isPowerupDrop) && isDefined(self))
    {
        self hide();

        wait(1);

        if (!isDefined(self.isPowerupDrop))
            break;

        self show();

        wait(1);
    }
}

doNuke(bonus)
{
    physicsExplosionSphere(bonus.origin, 5000000, 5000000, 10);
    fx = SpawnFX(level.fx_nuke, bonus.origin);
    triggerFX(fx);
    fx playSound("exp_suitcase_bomb_main");
    level thread maps\mp\gametypes\_aiz_bot_util::nukeDetonation(false);
    if (isDefined(bonus.attachedFX))
    {
        bonus.attachedFX delete();
    }
    bonus delete();
    //Testing
    setSlowMotion(1, 0.5, 0.4);

    wait(2.5);

    foreach (player in level.players)
    {
        if (!player.isAlive || !isDefined(player.cash)) continue;
        if (level.doublePointsTime > 0)
        {
            player.cash += 800;
            player maps\mp\gametypes\_aiz_hud::scorePopup(800);
        }
        else
        {
            player.cash += 400;
            player maps\mp\gametypes\_aiz_hud::scorePopup(400);
        }
        player maps\mp\gametypes\_aiz_hud::scoreMessage(level.gameStrings[208]);
    }

    setSlowMotion(0.5, 1, 1);

    wait(1.5);

    fx delete();
}
doFreezer(bonus)
{
    bonus moveTo(bonus.origin + (0, 0, 3000), 5);
    wait(5);
    playSoundAtPos(bonus.origin, "exp_airstrike_bomb_layer");
    playFX(level.fx_freezer, bonus.origin);
    level.freezerActivated = true;
    bonus delete();
    wait(17);
    level.freezerActivated = false;
}
giveRandomPerk(perk)
{
    ownedPerks = self getOwnedPerks();
    if (!array_contains(ownedPerks, false)) return;//Owns all perks, give up on life...

    if (!isDefined(perk))
    {
        perk = randomInt(7);
    }

    if (ownedPerks[perk])
    {
        //re-roll
        randomPerk = randomInt(7);
        randomPerk++;
        self thread giveRandomPerk(randomPerk);
        return;
    }

    self maps\mp\gametypes\_aiz_hud::scoreMessage(level.gameStrings[99]);

    switch (perk)
    {
        case 0:
            self.maxHealth = 250;
            self.health = self.maxHealth;
            self.lastBoughtPerk = "specialty_light_armor";
            break;
        case 1:
            self givePerk("specialty_lightweight", false);
            //self givePerk("specialty_marathon", false);
            self givePerk("specialty_longersprint", false);
            self.lastBoughtPerk = "specialty_longersprint_upgrade";
            break;
        case 2:
            self givePerk("specialty_fastreload", false);
            //self givePerk("specialty_quickswap", false);
            self givePerk("specialty_quickdraw", false);
            self.lastBoughtPerk = "specialty_fastreload_upgrade";
            break;
        case 3:
            self.newGunReady = true;
            self.lastBoughtPerk = "specialty_twoprimaries_upgrade";
            break;
        case 4:
            self givePerk("specialty_rof", false);
            self.lastBoughtPerk = "weapon_attachment_rof";
            break;
        case 5:
            self givePerk("specialty_stalker", false);
            self.lastBoughtPerk = "specialty_stalker_upgrade";
            break;
        case 6:
            self.autoRevive = true;
            self.lastBoughtPerk = "waypoint_revive";
            break;
        case 7:
            self givePerk("specialty_scavenger", false);
            self.lastBoughtPerk = "specialty_scavenger_upgrade";
            break;
    }

    if (perk != 6) self.perksBought[perk] = true;
    else self.perksBought[perk] += 1;

    perkIcon = NewClientHudElem(self);
    perkIcon[0] = 0 * perk;
    perkIcon[1] = -54;
    perkIcon.alignX = "left";
    perkIcon.alignY = "bottom";
    perkIcon.vertAlign = "bottom_adjustable";
    perkIcon.horzAlign = "left";
    perkIcon setShader(self.lastBoughtPerk, 128, 128);
    perkIcon.foreground = true;
    perkIcon.hideWhenInMenu = true;
    perkIcon.alpha = 1;
    perkIcon scaleOverTime(1, 30, 30);

    self playLocalSound("earn_perk");

    wait(1);

    perkIcon destroy();
    self maps\mp\gametypes\_aiz_hud::updatePerksHud(false, true);
}
giveAllPerks()
{
    ownedPerks = self getOwnedPerks();
    if (!array_contains(ownedPerks, false)) return;//Owns all perks, give up on life...

    if (!ownedPerks[0])
    {
        self.maxHealth = 250;
        self.health = self.maxHealth;
        self.lastBoughtPerk = "specialty_light_armor";
        self.perksBought[0] = true;
        self maps\mp\gametypes\_aiz_hud::updatePerksHud(false, true);
    }
    if (!ownedPerks[1])
    {
        self givePerk("specialty_lightweight", false);
        //self givePerk("specialty_marathon", false);
        self givePerk("specialty_longersprint", false);
        self.lastBoughtPerk = "specialty_longersprint_upgrade";
        self.perksBought[1] = true;
        self maps\mp\gametypes\_aiz_hud::updatePerksHud(false, true);
    }
    if (!ownedPerks[2])
    {
        self givePerk("specialty_fastreload", false);
        //self givePerk("specialty_quickswap", false);
        self givePerk("specialty_quickdraw", false);
        self.lastBoughtPerk = "specialty_fastreload_upgrade";
        self.perksBought[2] = true;
        self maps\mp\gametypes\_aiz_hud::updatePerksHud(false, true);
    }
    if (!ownedPerks[3])
    {
        self.newGunReady = true;
        self.lastBoughtPerk = "specialty_twoprimaries_upgrade";
        self.perksBought[3] = true;
        self maps\mp\gametypes\_aiz_hud::updatePerksHud(false, true);
    }
    if (!ownedPerks[4])
    {
        self givePerk("specialty_rof", false);
        self.lastBoughtPerk = "weapon_attachment_rof";
        self.perksBought[4] = true;
        self maps\mp\gametypes\_aiz_hud::updatePerksHud(false, true);
    }
    if (!ownedPerks[5])
    {
        self givePerk("specialty_stalker", false);
        self.lastBoughtPerk = "specialty_stalker_upgrade";
        self.perksBought[5] = true;
        self maps\mp\gametypes\_aiz_hud::updatePerksHud(false, true);
    }
    if (!ownedPerks[6])
    {
        self.autoRevive = true;
        self.lastBoughtPerk = "waypoint_revive";
        self.perksBought[6] += 1;
        self maps\mp\gametypes\_aiz_hud::updatePerksHud(false, true);
    }

    perkIcon = newClientHudElem(self);
    perkIcon[0] = 0;
    perkIcon[1] = 0;
    perkIcon.alignX = "center";
    perkIcon.alignY = "middle";
    perkIcon.vertAlign = "middle";
    perkIcon.horzAlign = "center_adjustable";
    perkIcon setShader("specialty_perks_all", 128, 128);
    perkIcon.foreground = true;
    perkIcon.hideWhenInMenu = true;
    perkIcon.alpha = 1;
    perkIcon scaleOverTime(1, 512, 512);
    perkIcon fadeOverTime(1);
    perkIcon.alpha = 0;

    self playLocalSound("earn_superbonus");

    wait(1);

    perkIcon destroy();
}
giveRandomPerkToAll()
{
    foreach (player in level.players)
    {
        if (!player.isAlive || !isDefined(player.isDown)) continue;
        perk = randomInt(7);
        player thread giveRandomPerk(perk);
    }
}
