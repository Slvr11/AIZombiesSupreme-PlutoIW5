#include maps\mp\gametypes\_aiz;
#include common_scripts\utility;
#include maps\mp\_utility;


init()
{
    level.botsInPlay = [];
    level.botPool = [];
    level.crawlerPool = [];
    level.bossPool = [];
    level.glowsticks = [];

    level.botsForWave = 0;
    //Set via dvars
    //level.botHealth = 100;
    //level.crawlerHealth = 110;
    //level.bossHealth = 2500;
    //level.botHealthScalar = 2;
    //level.botDmg = 49;
    level.spawnedBots = 0;
    level.useAltHeads = false;
    level.useAltBodies = false;
    level.maxActiveBots = 25;
    level.botInactiveTime = 120000;
    level.botMaxMoveSpeed = 170;
    if (level._mapname == "mp_factory_sh")
        level.botInactiveTime = 30000;

    level.botSpawns = [];
    level.botSpawnAngles = [];

    if (!isDefined(level.botAnims))
    {
        level.botAnims = [];
    }
    level.botAnims["z_lose"] = "pb_chicken_dance_crouch";
    level.botAnims["z_idle"] = "pb_stand_alert_pistol";
    level.botAnims["z_run"] = "pb_sprint_akimbo";
    level.botAnims["z_walk"] = "pb_stand_shoot_walk_forward_unarmed";
    level.botAnims["z_runHurt"] = "pb_stumble_pistol_forward";
    level.botAnims["z_walkHurt"] = "pb_stumble_pistol_walk_forward";
    level.botAnims["z_deaths"] = ["pb_stand_death_frontspin", "pb_stand_death_shoulderback"];//"pb_shotgun_death_legs", "pb_stand_death_leg_kickup", "pb_stand_death_tumbleback", "pb_stand_death_head_collapse", "pb_stand_death_nervedeath", "pb_stand_death_leg", "pb_stand_death_chest_spin" , "pb_stand_death_legs", "pb_stand_death_chest_blowback", "pb_stand_death_lowerback"
    level.botAnims["z_attack"] = "pt_melee_right2right_2";
    //level.botAnims["z_death_explode"] = ["pb_explosion_death_B1"/*, "pb_explosion_death_B2", "pb_explosion_death_B3", "pb_stand_death_kickup"*/];
    level.botAnims["z_death_nuke"] = "pb_stand_death_neckdeath";
    level.botAnims["crawlerAnim_idle"] = "pb_prone_hold";
    level.botAnims["crawlerAnim_death"] = "pb_prone_death_quickdeath";
    level.botAnims["crawlerAnim_attack"] = "pb_dive_front_impact";
    level.botAnims["crawlerAnim_walk"] = "pb_prone_crawl_akimbo";
    level.botAnims["dog_idle"] = "german_shepherd_idle";
    level.botAnims["dog_death"] = "german_shepherd_death_front";
    level.botAnims["dog_attack"] = "german_shepherd_attack_player";
    level.botAnims["dog_walk"] = "german_shepherd_walk";
    level.botAnims["dog_run"] = "german_shepherd_run";
    level.botAnims["dog_lose"] = "german_shepherd_attackidle_bark";
    level.botAnims["z_cripple"] = "pb_crouch2prone";

    level.botModel = getBotModelsForLevel(false);
    level.botHeadModel = getBotModelsForLevel(true);
    level.botCrawlerModel = getCrawlerModelForLevel();

    level.instaKillTime = 0;
    level.doublePointsTime = 0;
    level.instaKillTimerStarted = false;
    level.doublePointsTimerStarted = false;
    level.freezerActivated = false;
    level.perkDropsEnabled = true;
    level.nukeOffsetScalar = 1;
}

startBotSpawn()
{
    level endon("game_ended");

    while(true)
    {
        if (level.gameEnded) break;

        if (level.botSpawns.size == 0 || level.botsInPlay.size >= level.maxActiveBots)
        {
            wait(0.5);
            continue;
        }
        else if (level.spawnedBots == level.botsForWave)
            break;
        else
        {
            randomSpawn = randomInt(level.botSpawns.size);
            if (level.isBossWave) 
            {
                if (maps\mp\gametypes\_aiz_bots::spawnBossBot(randomSpawn))
                {
                    wait(0.5);
                    continue;
                }
                else break;
            }
            else if (level.isCrawlerWave) 
            {
                if (maps\mp\gametypes\_aiz_bots::spawnBot(randomSpawn, true))
                {
                    wait(0.5);
                    continue;
                }
                else break;
            }
            else if(maps\mp\gametypes\_aiz_bots::spawnBot(randomSpawn, false))
            {
                wait(0.5);
                continue;
            }
            else break;
        }
    }
}

killBotIfUnderMap()
{
    if (self.isAlive && self.origin[2] < level.mapHeight && (level._mapname != "mp_rust" && level.mapVariation == 1) && level._mapname != "mp_checkpoint" && level._mapname != "mp_invasion")
    {
        if (isDefined(self.isBoss))
            self thread killBotAndRespawn();
        else if (!isDefined(self.head))
            self thread killBotAndRespawn();
        else
            self thread killBotAndRespawn();
    }
}
//To kill off a bot but respawn them right after
killBotAndRespawn()
{
    self.isAlive = false;
    if (isDefined(self.isOnCompass) && self.isOnCompass)
    {
        _objective_delete(self.objID);
        self.isOnCompass = false;
    }
    hitbox = self.hitbox;
    hitbox setCanDamage(false);
    hitbox setCanRadiusDamage(false);
    hitbox setModel("tag_origin");//Change model to avoid the dead bot's hitbox blocking shots
    if (isDefined(self.headHitbox))
        self.headHitbox setModel("tag_origin");//Change head model as well
    self moveTo(self.origin, 0.05);

    isCrawler = !isDefined(self.head);
    isBoss = isDefined(self.isBoss);

    if (isCrawler || isDefined(self.hasBeenCrippled))
        self playAnimOnBot("crawlerAnim_death");
    else
        self playAnimOnBot("z_death_nuke");

    if (isDefined(self.hasBeenCrippled)) self.hasBeenCrippled = undefined;

    if (isCrawler && !isBoss) 
    {
        wait(0.5);
        self moveTo(self.origin + (0, 0, 2500), 5);
    }
    wait(5);
    self despawnBot(isCrawler, isBoss);
    level.botsInPlay = array_remove(level.botsInPlay, self);

    level notify("bot_death");
    self notify("zombie_death");

    //onBotUpdate();

    if (level.botsForWave == level.spawnedBots)
    {
        level.spawnedBots--;
        level thread startBotSpawn();//Restart spawns with less spawnedBots if at the end of the round. This will spawn a new bot correctly. Else, the loop will be running and automatically respawn a bot.
    }
    else level.spawnedBots--;

    wait(1.5);
    maps\mp\gametypes\_aiz_round_system::checkForCompass();//Re-apply compass if needed
}

despawnBot(isCrawler, isBoss)
{
    self hide();
    if (isDefined(self.head))
    {
        botHead = self.head;
        botHead hide();
    }
    self.origin = (0, 0, 0);
    self.isSpawned = false;
    /*
    if (isCrawler) level.crawlerPool[level.crawlerPool.size] = self;
    else if (isBoss) level.bossPool[level.bossPool.size] = self;
    else level.botPool[level.botPool.size] = self;
    */
}

getNextAvailableBotFromPool(isCrawler, isBoss)
{
    if (isCrawler) pool = level.crawlerPool;
    else if (isBoss) pool = level.bossPool;
    else pool = level.botPool;

    foreach (bot in pool)
    {
        if (!isDefined(bot) || !isDefined(bot.isSpawned) || bot.isSpawned)
            continue;

        return bot;
    }

    return undefined;
}

updateBotLastActiveTime()
{
    self.lastActiveTime = getTime();
}

createBot(isCrawler)
{
    bot = spawn("script_model", (0, 0, 0));
    bot.angles = (0, 0, 0);
    //bot enableLinkTo();
    if (isCrawler)
    {
        bot setModel(level.botCrawlerModel);
        if (array_contains(level.wawMaps, level._mapname))
        {
            bot setModel("german_sheperd_dog");
            bot playAnimOnBot("dog_idle");
        }
        else bot playAnimOnBot("crawlerAnim_idle");
    }
    else
    {
        if (level.useAltBodies)
            bot setModel("defaultactor");
        else
        {
            if (level.randomBotModels == 1 || (level.randomBotModels == 2 && array_contains(level.classicMaps, level._mapname)))
            {
                randomModel = randomInt(level.botModel.size);
                bot setModel(level.botModel[randomModel]);
            }
            else bot setModel(level.botModel[0]);
        }
        bothead = spawn("script_model", bot.origin);
        if (level.useAltHeads)
        {
            switch (level._mapname)
            {
                case "mp_bootleg":
                case "mp_seatown":
                case "mp_shipbreaker":
                case "mp_six_ss":
                    bothead setModel("chicken");
                    break;
                case "mp_overwatch":
                    bothead setModel("chicken_black_white");
                    break;
                default:
                    if (level.randomBotModels == 1 || (level.randomBotModels == 2 && array_contains(level.classicMaps, level._mapname)))
                    {
                        randomHead = randomInt(level.botHeadModel.size);
                        bothead setModel(level.botHeadModel[randomHead]);
                    }
                    else
                        bothead setModel(level.botHeadModel[0]);

                    break;
            }
            bothead linkTo(bot, "j_spine4", (0, 0, 0), (0, 70, 90));
        }
        else
        {
            if (level.randomBotModels == 1 || (level.randomBotModels == 2 && array_contains(level.classicMaps, level._mapname)))
            {
                randomHead = randomInt(level.botHeadModel.size);
                bothead setModel(level.botHeadModel[randomHead]);
            }
            else
                bothead setModel(level.botHeadModel[0]);

            bothead linkTo(bot, "j_spine4", (0, 0, 0), (0, 0, 0));
        }
        bot.head = bothead;
        bothead hide();
        bot playAnimOnBot("z_idle");
    }
    bot.isAlive = false;
    bot hide();

    if (isCrawler) level.crawlerPool[level.crawlerPool.size] = bot;
    else level.botPool[level.botPool.size] = bot;

    botHitbox = spawn("script_model", bot.origin + (0, 0, 30));
    botHitbox setModel("com_plasticcase_dummy");
    botHitbox.angles = (0, 0, 0);
    botHitbox hide();
    botHitbox setCanDamage(false);
    botHitbox setCanRadiusDamage(false);
    if (isCrawler) botHitbox.currentHealth = level.crawlerHealth;
    else botHitbox.currentHealth = level.botHealth;
    botHitbox.damageTaken = 0;
    if (isCrawler)
    {
        xAngleOffset = 90;
        xOffset = -30;
    }
    else
    {
        xAngleOffset = 0;
        xOffset = 0;
    }
    botHitbox linkTo(bot, "j_mainroot", (xOffset, 0, 0), (0, xAngleOffset, -90));
    botHitbox.parent = bot;
    bot.hitbox_linkOffset_y = 0;

    if (!isCrawler)
    {
        headOrigin = bot getTagOrigin("j_head");
        //headAngles = bot getTagAngles("j_head");
        headHitbox = Spawn("script_model", headOrigin);
        headHitbox setModel("ims_scorpion_explosive1");
        headHitbox.angles = (0, 0, 0);
        headHitbox hide();
        headHitbox setCanDamage(true);
        headHitbox setCanRadiusDamage(false);
        headHitbox linkTo(bot, "j_head", (0, 0, 0), (0, 0, 0));
        headHitbox.parent = bot;
        bot.headHitbox = headHitbox;

        headHitbox thread onBotDamage(isCrawler, false, true);
    }

    bot.hitbox = botHitbox;
    bot.state = "idle";
    bot.isAttacking = false;
    bot.currentWaypoint = undefined;
    bot.isOnCompass = false;
    bot.isSpawned = false;
    bot.primedForNuke = false;
    bot.moveSpeed = 100;
    botHitbox.canBeDamaged = true;

    botHitbox thread onBotDamage(isCrawler, false, false);
    bot thread killBotOnNuke(isCrawler, false);
}
createBot_boss()
{
    bot = Spawn("script_model", (0, 0, 0));
    bot.angles = (0, 0, 0);
    //bot enableLinkTo();
    bot setModel("mp_fullbody_opforce_juggernaut");
    bot playAnimOnBot("z_idle");
    bot.isAlive = false;
    bot hide();
    level.bossPool[level.bossPool.size] = bot;

    botHitbox = Spawn("script_model", bot.origin + (0, 0, 30));
    botHitbox setModel("com_plasticcase_dummy");
    botHitbox.angles = (90, bot.angles[1], 0);
    botHitbox setCanDamage(false);
    botHitbox setCanRadiusDamage(false);
    botHitbox linkTo(bot, "j_mainroot", (0, 0, 0), (0, 0, 0));
    botHitbox hide();
    botHitbox.currentHealth = level.bossHealth;
    botHitbox.damageTaken = 0;
    botHitbox.parent = bot;
    botHitbox.isBoss = true;
    bot.isBoss = true;
    bot.hitbox = botHitbox;
    bot.hitbox_linkOffset_y = 0;
    bot.state = "idle";
    bot.isAttacking = false;
    bot.currentWaypoint = undefined;
    bot.isOnCompass = false;
    bot.isSpawned = false;
    bot.primedForNuke = false;
    bot.moveSpeed = 170;
    botHitbox.canBeDamaged = true;

    bot thread killBotOnNuke(false, true);
    botHitbox thread onBotDamage(false, true, false);
}

onBotDamage(isCrawler, isBoss, isHeadshot)
{
    level endon("game_ended");

    while(true)
    {
        self waittill("damage", damage, attacker, direction_vec, point, type, modelName, tagName, partName, iDFlags, weapon);

        if (!self.parent.isAlive) continue;

        if (!isDefined(weapon))
            weapon = "";

        if ((weapon == "iw5_usp45_mp_akimbo_silencer02" || weapon == "iw4_javelin_mp" || weapon == "iw4_stinger_mp" || weapon == "iw4_berettaupgraded_mp" || weapon == "iw4_colt45upgraded_mp" || ((weapon == "iw4_tmpsilencer_mp" || weapon == "iw4_tmpsilencerupgraded_mp") && type != "MOD_FLAME") ||
        (weapon == "iw5_pp90m1_mp_silencer_xmags_camo10" && distanceSquared(attacker.origin, self.origin) > 65536) || (isRayGun(weapon) && weapon != "t5_raygun_mp" && weapon != "t5_raygunupgraded_mp") || isThunderGun(weapon)) && type != "MOD_MELEE")
            continue;

        currentBot = self.parent;
        botHitbox = self;
        if (!isDefined(botHitbox.damageTaken) || !isDefined(botHitbox.currentHealth))//This will be true if self is the head hitbox
        {
            botHitbox = self.parent.hitbox;
        }
        //if (!array_contains(level.botsInPlay, currentBot)) return;
        player = attacker;

        if (isHeadshot)
            type = "MOD_HEADSHOT";

        if (weapon == "remote_uav_weapon_mp" && isDefined(attacker.owner))//UAV tweaks
        {
            player = attacker.owner;
            type = "MOD_PASSTHRU";
            damage = 50;
        }
        else if (weapon == "sentry_minigun_mp" && isDefined(attacker.owner))//Sentry tweaks
        {
            player = attacker.owner;
            type = "MOD_PASSTHRU";
            damage = 10;
        }
        else if (weapon == "manned_gl_turret_mp" && isDefined(attacker.owner))//Sentry tweaks
        {
            player = attacker.owner;
            type = "MOD_PASSTHRU";
            damage = 300;
        }
        else if ((weapon == "remote_tank_projectile_mp" || isThunderGun(weapon)) && isDefined(attacker.owner))
        {
            player = attacker.owner;
            type = "MOD_PASSTHRU";
        }
        else if (weapon == "cobra_20mm_mp")//A10 tweaks
        {
            player = attacker.owner;
            type = "MOD_PASSTHRU";
            damage = 15;
        }
        else if (isDefined(level.lastAttackingBot) && (weapon == level.botWeapon_subBot || weapon == level.botWeapon_LMGBot || weapon == "") && !isDefined(attacker.name))//Killstreak bot weapons. In GSC these report as empty strings
        {
            player = level.lastAttackingBot.owner;
            type = "MOD_PASSTHRU";
            if (level.isHellMap) damage = 15;//Hellmap damage
            else damage = 35 / (1 + (level.wave / 2));//Base damage
        }
        else if (weapon == "pavelow_minigun_mp" && isDefined(attacker.owner))//Overwatch tweaks
        {
            player = attacker.owner;
            type = "MOD_PASSTHRU";
            damage = 15;
        }

        if (type == "MOD_BLEEDOUT")
        {
            org = currentBot getTagOrigin("j_head");
            playFX(level.fx_headshotBlood, org);
            doBotDamage(int(damage), player, weapon, botHitbox, type, point, true);
        }
        else
        {
            if (weapon != "sentry_minigun_mp" && weapon != "manned_gl_turret_mp" && weapon != "remote_uav_weapon_mp" && type != "MOD_EXPLOSIVE_BULLET") playFX(level.fx_blood, point);//Only play FX if the weapon isn't a script weapon
            doBotDamage(int(damage), player, weapon, botHitbox, type, point);
        }
        botState = currentBot.state;
        if (botState != "hurt" && botState != "attacking" && type != "MOD_BLEEDOUT")
        {
            if (!isCrawler && !isBoss)
            {
                currentBot playAnimOnBot(botHitbox getHurtAnim());
            }
            else if (isBoss)
            {
                currentBot playAnimOnBot("z_runHurt");
            }
            currentBot.state = "hurt";

            currentBot thread postHurt();
        }

        if (!isBoss) currentBot updateBotLastActiveTime();

        if (botHitbox.damageTaken >= botHitbox.currentHealth)
        {
            currentBot.isAlive = false;
            if (isDefined(currentBot.isOnCompass) && currentBot.isOnCompass)
            {
                _objective_delete(currentBot.objID);
                currentBot.isOnCompass = false;
            }
            botHitbox setCanDamage(false);
            botHitbox setCanRadiusDamage(false);
            botHitbox setModel("tag_origin");//Change model to avoid the dead bot's hitbox blocking shots
            if (isDefined(currentBot.headHitbox))
                currentBot.headHitbox setModel("tag_origin");//Change head model as well
            //if (isBoss) botHitbox delete();
            if (isDefined(currentBot.primedForNuke) && !currentBot.primedForNuke)
            {
                pointGain = 50;
                if (type == "MOD_HEADSHOT") pointGain = 100;
                if (type == "MOD_MELEE") pointGain = 130;

                if (level.doublePointsTime > 0) pointGain = pointGain * 2;

                if (isDefined(player) && type != "MOD_PASSTHRU")
                {
                    player.cash += pointGain;
                    player maps\mp\gametypes\_aiz_hud::scorePopup(pointGain);
                }
                player thread maps\mp\gametypes\_rank::giveRankXP( "kill", pointGain, weapon, type);

                if ((level.botDeathVoice == 1 || (level.botDeathVoice == 2 && array_contains(level.classicMaps, level._mapname))) && !isCrawler && type != "MOD_BLEEDOUT" && type != "MOD_HEADSHOT" && level.instaKillTime == 0)
                    currentBot playSound("generic_death_russian_" + randomIntRange(1, 9));
                else if (isCrawler && array_contains(level.wawMaps, level._mapname))
                    currentBot playSound("anml_dog_die_front");
            }
            player.kills++;
            if (isDefined(player.aizHud_created))
            {
                player.points += 1;
                pointNumber = player.hud_point;
                pointNumber setValue(player.points);
            }

            if (player.ammoMatic)
            {
                currentWeapon = player getCurrentWeapon();
                stock = player getWeaponAmmoStock(currentWeapon);
                player setWeaponAmmoStock(currentWeapon, stock + getWeaponAmmoMaticValue(weapon));
                player maps\mp\gametypes\_aiz_hud::updateAmmoHud(false);
            }

            player maps\mp\gametypes\_aiz_killstreaks::checkKillstreak();
            currentBot moveTo(currentBot.origin, 0.05);

            if (isFlameWeapon(weapon) && type != "MOD_MELEE")
            {
                playFx(level.fx_flamethrowerDeathFX, botHitbox.origin);
				self playSound("explo_mine");
				physicsExplosionSphere(botHitbox.origin, 230, 0, 3);
            }

            if (isCrawler || isDefined(currentBot.hasBeenCrippled))
            {
                if (array_contains(level.wawMaps, level._mapname) && !isDefined(currentBot.hasBeenCrippled)) currentBot playAnimOnBot("dog_death");
                else currentBot playAnimOnBot("crawlerAnim_death");
            }
            else
            {
                //logPrint(type);
                /*
                if (type == "MOD_EXPLOSIVE" || type == "MOD_GRENADE_SPLASH")
                {
                    currentBot.angles = vectorToAngles(point - currentBot.origin);
                    randomAnim = randomInt(level.botAnims["z_death_explode"].size);
                    bot currentplayAnimOnBot(level.botAnims["z_death_explode"][randomAnim]);
                }
                else
                */
                //{
                    randomAnim = randomInt(level.botAnims["z_deaths"].size);
                    currentBot playAnimOnBot("z_deaths", randomAnim);
                //}
            }

            if (isDefined(currentBot.hasBeenCrippled)) currentBot.hasBeenCrippled = undefined;

            if (isCrawler && !array_contains(level.wawMaps, level._mapname))
            {
                wait(0.5);
                currentBot moveTo(currentBot.origin + (0, 0, 2500), 5);
            }

            level.botsInPlay = array_remove(level.botsInPlay, currentBot);
            level notify("bot_death");
            currentBot notify("zombie_death");

            //onBotUpdate();
            maps\mp\gametypes\_aiz_round_system::checkForEndRound();
            if (isCrawler && level.isCrawlerWave && (level.botsInPlay.size == 0 && level.botsForWave == level.spawnedBots) && level.perkDropsEnabled && level.isHellMap) 
            {
                maps\mp\gametypes\_aiz_bonus_drops::spawnBonusDrop(9, currentBot.origin); 
            }
            else if (!isBoss)
            {
                bonusType = maps\mp\gametypes\_aiz_bonus_drops::checkForBonusDrop();
                if (bonusType != 0)
                    maps\mp\gametypes\_aiz_bonus_drops::spawnBonusDrop(bonusType, currentBot.origin);
            }

            wait(5);
            if (isCrawler && !array_contains(level.wawMaps, level._mapname))
                playFX(level.fx_flamethrowerDeathFX, currentBot.origin);
            currentBot despawnBot(isCrawler, isBoss);
        }
    }
}

postHurt()
{
    wait(0.5);

    self.state = "idle";
    if (level.freezerActivated)
        self.state = "idle_frozen";//Set to allow the stand-still code to properly transition the bot animation
}

killBotOnNuke(isCrawler, boss)
{
    while (true)
    {
        level waittill("zombie_nuke");

        self.primedForNuke = true;

        wait(randomFloatRange(0, 4) * level.nukeOffsetScalar);

        self.primedForNuke = false;
        if (!self.isAlive || !array_contains(level.botsInPlay, self)) continue;
        self.isAlive = false;
        botHitbox = self.hitbox;
        if (self.isOnCompass)
        {
            _objective_delete(self.objID);
            self.isOnCompass = false;
        }
        botHitbox setCanDamage(false);
        botHitbox setCanRadiusDamage(false);
        self moveTo(self.origin, 0.05f);
        deathAnim = undefined;
        if (isCrawler || isDefined(self.hasBeenCrippled))
        {
            if (array_contains(level.wawMaps, level._mapname) && !isDefined(self.hasBeenCrippled)) deathAnim = "dog_death";
            else deathAnim = "crawlerAnim_death";
        }
        else deathAnim = "z_death_nuke";
        self playAnimOnBot(deathAnim);

        if (!isCrawler && !boss)
        {
            head = self.head;
            head hide();
            self.headHitbox setCanDamage(false);
            if (level.nukeOffsetScalar != 0) playFX(level.fx_headshotBlood, head.origin);
            head playSound("melee_knife_hit_watermelon");

            if (isDefined(self.hasBeenCrippled)) self.hasBeenCrippled = undefined;
        }

        if (isCrawler && !array_contains(level.wawMaps, level._mapname))
        {
            wait(0.5);
            self moveTo(self.origin + (0, 0, 2500), 5);
        }
        /*
        else if (boss)
        {
            wait(1);
            self startRagdoll();
        }
        */
        level.botsInPlay = array_remove(level.botsInPlay, self);

        level notify("bot_death");
        self notify("zombie_death");

        //onBotUpdate();
        if (isCrawler && level.isCrawlerWave && (level.botsInPlay.size == 0 && level.botsForWave == level.spawnedBots) && level.perkDropsEnabled && level.isHellMap) maps\mp\gametypes\_aiz_bonus_drops::spawnBonusDrop(9, self.origin);
        maps\mp\gametypes\_aiz_round_system::checkForEndRound();

        wait(5);

        self despawnBot(isCrawler, boss);
    }
}

doBotDamage(damage, player, weapon, botHitbox, MOD, point, skipFeedback)
{
    if (!isDefined(botHitbox.canBeDamaged) || !botHitbox.canBeDamaged)
    {
        printLn("a bot was damaged when it wasn't allowed to be.");
        //return;
    }

    hitDamage = 0;
    if (weaponIsUpgrade(weapon)) hitDamage = damage / 2;//Base upgraded damage
    else if (level.isHellMap) hitDamage = damage / 4;//Hellmap damage
    else hitDamage = damage / (1 + (level.wave / 2));//Base damage

    if (array_contains(level.classicMaps, level._mapname) && player.perksBought[4]) hitDamage *= 1.4;

    if (MOD == "MOD_MELEE") hitDamage = damage / ((level.wave + 1) / 2);//Melee damage
    if (weapon == "iw5_p99_mp_tactical_xmags" && MOD == "MOD_MELEE") hitDamage = 350;//P99 Upgraded damage
    if (weapon == "iw5_riotshield_mp") hitDamage = damage * 2;//Upgraded shield
    if (isWeaponDeathMachine(weapon)) hitDamage = damage * 4;

    if (MOD != "MOD_MELEE")
    {
        if (isSubStr(weapon, "iw5_deserteagle_mp") || isSubStr(weapon, "iw5_deserteagletactical_mp") || weapon == "at4_mp" || isSubStr(weapon, "iw5_44magnum_mp") || isSubStr(weapon, "iw4_coltanaconda") || isSubStr(weapon, "iw5_mp412")) hitDamage = damage;//Specials damage
        //Weapon tweaks
        if (isSniper(weapon) || isSubStr(weapon, "iw5_dragunov_mp"))//Sniper damage
        {
            mult = 4;
            if (weaponIsUpgrade(weapon))
                mult = 2;
            hitDamage = int(hitDamage * mult);
        }
        if (isShotgun(weapon))
        {
            hitDamage = (hitDamage * 8);//Shotgun multiplier
            botHitbox thread bot_setCanDamage();//Shotgun pellet delay. This fixes the bug where shotgun hits count every pellet for score
        }

        if (weapon == "gl_mp" || weapon == "iw4_ak47thermalupgraded_gl_mp") hitDamage = 10000;//GL
        else if (weapon == "iw5_xm25_mp" || weapon == "iw4_m21_mp" || weapon == "javelin_mp" || weapon == "t5_raygun_mp" || weapon == "t5_raygunupgraded_mp") hitDamage = damage;
        else if (weapon == "m320_mp" || weapon == "m79_mp") hitDamage = max(damage - (level.wave * 3), 15);
        else if (weapon == "xm25_mp") hitDamage = damage * 2;
        else if (weapon == "iw5_mk14_mp" || weapon == "iw4_fal_mp") hitDamage *= 2;
        else if (isSubStr(weapon, "iw5_mk14_mp_reflex_xmags_camo11") || weapon == "iw4_falupgraded_mp" || weapon == "iw5_deserteagletactical_mp_camo01") hitDamage *= 3;
        else if (weapon == "iw5_1887_mp_camo11") hitDamage = 200;
        else if (weapon == "iw5_1887_mp_akimbo_camo11" || weapon == "iw4_model1887upgraded_mp") hitDamage = 150;
        else if (weapon == "iw5_mk12spr_mp_acog_xmags") hitDamage = 500;//Heli Sniper damage
        else if (weapon == "iw5_ak47_mp_xmags_camo01") hitdamage = int(hitDamage * 1.5);

        //if (isThunderGun(weapon)) hitDamage = damage;//Thundergun
    }

    //printLn(hitDamage);

    if (MOD == "MOD_HEADSHOT") hitDamage *= 3;

    else if (MOD == "MOD_PASSTHRU" || MOD == "MOD_BLEEDOUT") hitDamage = damage;//Script usage

    else if ((MOD == "MOD_EXPLOSIVE" || MOD == "MOD_GRENADE_SPLASH") && botHitbox.damageTaken >= botHitbox.currentHealth * 0.7 && isDefined(botHitbox.parent.head))
        botHitbox botToCrawler();

    if (level.instaKillTime > 0 && !isDefined(botHitbox.isBoss)) botHitbox.damageTaken = botHitbox.currentHealth;
    else
        botHitbox.damageTaken += int(hitDamage);

    if (botHitbox.damageTaken >= botHitbox.currentHealth * 0.85 && MOD == "MOD_HEADSHOT" && isDefined(botHitbox.parent.head) || (level.instaKillTime > 0 && isDefined(botHitbox.parent.head)))
    {
        head = botHitbox.parent.head;
        head hide();
        botHitbox.parent.headHitbox setCanDamage(false);
        PlayFX(level.fx_headshotBlood, head.origin);
        if (level.instaKillTime == 0) botHitbox thread runBotBleedout(player);
    }

    if (!botHitbox.parent.primedForNuke)
    {
        pointGain = 5;
        if (level.isHellMap) pointGain = 10;
        if (level.doublePointsTime > 0) pointGain *= 2;

        if (MOD != "MOD_PASSTHRU")
        {
            player.cash += pointGain;
            player maps\mp\gametypes\_aiz_hud::scorePopup(pointGain);
        }
        player thread maps\mp\gametypes\_rank::giveRankXP( "kill", pointGain, weapon, MOD);
    }

    if (weapon == "claymore_mp")
    {
        /*
        wireFeedback = player.hud_damageFeedback;
        wireFeedback.Alpha = 1;
        player playLocalSound("melee_knife_hit_other");
        wireFeedback fadeOverTime(1);
        wireFeedback.Alpha = 0;
        */
        player maps\mp\gametypes\_damagefeedback::updateDamageFeedback("");
        player playLocalSound("melee_knife_hit_other");
        return;
    }

    if ((isDefined(skipFeedback) && skipFeedback)) return;

    /*
    combatHighFeedback = player.hud_damageFeedback;
    combatHighFeedback.Alpha = 1;
    player playLocalSound("MP_hit_alert");
    combatHighFeedback fadeOverTime(1);
    combatHighFeedback.Alpha = 0;
    */
    player maps\mp\gametypes\_damagefeedback::updateDamageFeedback("");
}

runBotBleedout(player)
{
    level endon("game_ended");

    bot = self.parent;
    if (!isDefined(bot.isAlive) || !bot.isAlive) return;//Check before we register the hit

    bleedoutDamage = 5;//(self.currentHealth - self.damageTaken) / randomIntRange(4, 11);

    while (bot.isAlive)
    {
        self notify("damage", bleedoutDamage, player, (0, 0, 0), (0, 0, 0), "MOD_BLEEDOUT", "", "head", "j_head", 0, "", false, false);

        wait(1);
    }
}

botToCrawler()
{
    bot = self.parent;
    if (!isDefined(bot.isAlive) || !bot.isAlive) return;

    bot hidePart("j_knee_le");
    PlayFX(level.fx_bodyPartExplode, bot getTagOrigin("j_knee_le"));
    bot hidePart("j_knee_ri");
    PlayFX(level.fx_bodyPartExplode, bot getTagOrigin("j_knee_ri"));
    bot.hasBeenCrippled = true;//...with depression
}

nukeDetonation(isStreak)
{
    level.nukeOffsetScalar = 1;//Reset the scalar
    if (isStreak && isDefined(self) && isPlayer(self))
    {
        total = level.botsInPlay.size;
        self.cash += (100 * total);
        self maps\mp\gametypes\_aiz_hud::scorePopup(100 * total);
        self maps\mp\gametypes\_aiz_hud::scoreMessage(level.gameStrings[208]);
    }
    if (isStreak)
    {
        level.nukeOffsetScalar = 0;
    }
    //bonusDrops.onNuke();
    level notify("zombie_nuke");

    wait(5);

    level.nukeInbound = false;
}

startInstakill()
{
    if (level.instaKillTime < 1) return;
    if (level.instaKillTimerStarted) return;
    level.instaKillTimerStarted = true;
    maps\mp\gametypes\_aiz_hud::showPowerUpHud(1);
    level thread runInstakillTimer();
}

runInstakillTimer()
{
    level endon ("game_ended");
    level endon ("instakill_ended");

    while (true)
    {
        level.instaKillTime--;
        if (level.instaKillTime == 0)
        {
            level.instaKillTimerStarted = false;
            level notify("instakill_ended");
        }

        wait(1);
    }
}
runDoublePointsTimer()
{
    level endon ("game_ended");
    level endon ("doublepoints_ended");

    while (true)
    {
        level.doublePointsTime--;
        if (level.doublePointsTime == 0)
        {
            level.doublePointsTimerStarted = false;
            level notify("doublepoints_ended");
        }

        wait(1);
    }
}

startDoublePoints()
{
    if (level.doublePointsTime < 1) return;
    if (level.doublePointsTimerStarted) return;
    level.doublePointsTimerStarted = true;
    maps\mp\gametypes\_aiz_hud::showPowerUpHud(2);
    level thread runDoublePointsTimer();
}

getHurtAnim()
{
    if (self isInPeril() || self.parent.moveSpeed > 120)
        return "z_runHurt";
    else return "z_walkHurt";
}

isInPeril()
{
    if (level.wave > 30)
        return true;

    thresholdDamage = self.currentHealth * 0.8;
    if (self.damageTaken >= thresholdDamage)
        return true;
    else return false;
}
playAnimOnBot(animName, animIndex)
{
    animName = level.botAnims[animName];

    assert(isDefined(animName));

    if (isDefined(animIndex))
    {
        animName = animName[animIndex];
    }

    self scriptModelPlayAnim(animName);

    if (animName == "z_walk" && isDefined(self.hitbox) && (isDefined(self.hitbox_linkOffset_y) && self.hitbox_linkOffset_y == 0))
    {
        isCrawler = !isDefined(self.head) && !isDefined(self.isBoss);
        if (isCrawler)
        {
            xAngleOffset = 90;
            xOffset = -30;
        }
        else
        {
            xAngleOffset = 0;
            xOffset = 0;
        }
        botHitbox = self.hitbox;
        botHitbox linkTo(self, "j_mainroot", (xOffset, -10, 0), (0, xAngleOffset, -90));
        self.hitbox_linkOffset_y = -10;
    }
    else if (isDefined(self.hitbox) && (isDefined(self.hitbox_linkOffset_y) && self.hitbox_linkOffset_y == -10))
    {
        isCrawler = !isDefined(self.head) && !isDefined(self.isBoss);
        if (isCrawler)
        {
            xAngleOffset = 90;
            xOffset = -30;
        }
        else
        {
            xAngleOffset = 0;
            xOffset = 0;
        }
        botHitbox = self.hitbox;
        botHitbox linkTo(self, "j_mainroot", (xOffset, 0, 0), (0, xAngleOffset, -90));
        self.hitbox_linkOffset_y = 0;
    }
    /*
    if (isDefined(self.head))
    {
        self.head scriptModelPlayAnim(animName);
    }
    */
}

dropGlowstick(position)
{
    posGround = GetGroundPosition(position, 1)[2] + 3;
    if (posGround == position[2] + 3) posGround -= 55;
    glowstick = Spawn("script_model", (position[0], position[1], posGround));
    glowstick.isGlowstick = true;
    glowstick setModel("viewmodel_light_stick");

    effect = SpawnFX(level.fx_glowStickGlow, glowstick.origin);
    glowstick.effect = effect;
    TriggerFX(effect);

    level.glowsticks[level.glowsticks.size] = glowstick;
    glowstick thread removeGlowstickAfterTime();
}
removeGlowstickAfterTime()
{
    self endon("death");

    wait(15);

    self removeGlowstick();
}
removeGlowstick()
{
    level.glowsticks = array_remove(level.glowsticks, self);
    self.isGlowstick = undefined;
    foreach (bot in level.botsInPlay)
    {
        if (!bot.isAlive) continue;

        if (isDefined(bot.currentWaypoint) && bot.currentWaypoint == self) bot.currentWaypoint = undefined;
    }
    if (isDefined(self.effect))
    {
        effect = self.effect;
        effect delete();
        self.effect = undefined;
    }
    self delete();
}

bot_setCanDamage(delay)
{
    self.canBeDamaged = false;

    if (isDefined(delay))
        wait(delay);
    else
        wait(0.05);

    self.canBeDamaged = true;
}
