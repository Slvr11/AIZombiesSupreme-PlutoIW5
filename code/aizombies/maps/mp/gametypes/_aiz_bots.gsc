#include common_scripts\utility;
#include maps\mp\gametypes\_aiz;
#include maps\mp\gametypes\_aiz_bot_util;

spawnBot(spawnLoc, isCrawler)
{
    if ((!isCrawler && level.botPool.size == 0) || (isCrawler && level.crawlerPool.size == 0)) return true;//True so in case all 30 have spawned, don't error out
    bot = getNextAvailableBotFromPool(isCrawler, false);

    if (!isDefined(bot))
    {
        //printLn("Error spawning bot: undefined bot was found.");
        return true;
    }

    if (level.botSpawns.size == 0)
    {
        printLn("No bot spawns available! Please have at least one \"zombiespawn\" in your map definition.");
        Announcement("^1No bot spawns available! Check console for details");
        return false;
    }
    
    bot.isSpawned = true;
    bot.currentWaypoint = undefined;
    bot.lastWaypoint = undefined;
    bot.origin = level.botSpawns[spawnLoc] + (randomInt(20), randomInt(20), 0);
    bot.angles = level.botSpawnAngles[spawnLoc];

    bot show();
    bot showAllParts();

    if (isCrawler)
    {
        if (level.hasDogCrawlers) bot playAnimOnBot("dog_idle");
        else bot playAnimOnBot("crawlerAnim_idle");
    }
    else bot playAnimOnBot("z_idle");

    bot.state = "idle";
    if (!isCrawler && isDefined(bot.head))
    {
        botHead = bot.head;
        botHead show();
        //Remove helmet
        //botHead hidePart("j_head_end");
        //botHead hidePart("j_helmet");
        //botHead hidePart("j_collar_rear");
        bot.headHitbox setCanDamage(true);
        bot.headHitbox setModel("ims_scorpion_explosive1");
    }
    bot.isAlive = true;
    bot.isAttacking = false;
    if ((level.variedBotSpeed == 1 || (level.variedBotSpeed == 2 && array_contains(level.classicMaps, level._mapname))) && !isCrawler)
        bot.moveSpeed = randomFloatRange(50, level.botMaxMoveSpeed);
    else bot.moveSpeed = 100;
    bot updateBotLastActiveTime();
    level.spawnedBots++;
    botHitbox = bot.hitbox;
    if (isCrawler) botHitbox.currentHealth = level.crawlerHealth;
    else botHitbox.currentHealth = level.botHealth;
    if (!isDefined(botHitbox.currentHealth))
    {
        printLn("currentHealth was undefined for a bot, using default");
        botHitbox.currentHealth = 100;
    }
    botHitbox.damageTaken = 0;
    botHitbox setCanDamage(true);
    botHitbox setCanRadiusDamage(true);
    //botHitbox show();
    botHitbox setModel("com_plasticcase_dummy");

    level.botsInPlay[level.botsInPlay.size] = bot;
    /*
    if (isCrawler) level.crawlerPool = array_remove(level.crawlerPool, bot);
    else level.botPool = array_remove(level.botPool, bot);
    */

    level notify("bot_spawned");

    //Check for waypoints on spawn once
    foreach (v in level.waypoints)
    {
        if (!isDefined(v))
            continue;

        waypointTrace = sightTracePassed(bot getTagOrigin("j_head"), v.origin, false, bot);//Check for waypoints
        if (waypointTrace)
        {
            bot.currentWaypoint = v;//Set the first seen one as current
            bot.visibleWaypoints = v.visiblePoints;
            break;
        }
    }

    if (level._mapname == "so_deltacamp")
        bot.currentWaypoint = undefined;//Setting this to undefined so that it forces the bot to find the closest (entry) node rather than by sight in the list

    if (!isDefined(bot.currentWaypoint))
    {
        //If we haven't found a waypoint with the sightTrace, then find the closest waypoint and use that instead
        closestDist = 999999999;
        closestWaypoint = undefined;
        foreach (v in level.waypoints)
        {
            if (!isDefined(v))
                continue;
            
            heightDiff = abs(bot.origin[2] - v.origin[2]);
            if (distanceSquared(bot.origin, v.origin) < closestDist && heightDiff < 100)
            {
                closestDist = distanceSquared(bot.origin, v.origin);
                closestWaypoint = v;
            }
        }

        if (isDefined(closestWaypoint))
        {
            bot.currentWaypoint = closestWaypoint;
            bot.visibleWaypoints = closestWaypoint.visiblePoints;
        }
    }

    if (!isDefined(bot.currentWaypoint))
        printLn("bot could not find a waypoint at spawn");

    bot thread botAI(botHitbox, isCrawler, false);

    return true;
}
spawnBossBot(spawnLoc)
{
    if (level.bossPool.size == 0) return true;//True so in case max have spawned, don't error out
    bot = getNextAvailableBotFromPool(false, true);

    if (!isDefined(bot))
    {
        //printLn("Error spawning bot: undefined bot was found.");
        return true;
    }
    if (level.botSpawns.size == 0)
    {
        printLn("No bot spawns available! Please have at least one \"zombiespawn\" in your map definition.");
        Announcement("^1No bot spawns available! Check console for details");
        return false;
    }

    random = randomInt(20);
    bot.isSpawned = true;
    bot.currentWaypoint = undefined;
    bot.lastWaypoint = undefined;
    bot.origin = level.botSpawns[spawnLoc] + (random, random, 0);
    bot.angles = level.botSpawnAngles[spawnLoc];
    bot show();
    bot showAllParts();

    bot playAnimOnBot("z_idle");

    bot.state = "idle";
    bot.isAlive = true;
    bot.isAttacking = false;
    bot.moveSpeed = 170;
    bot updateBotLastActiveTime();
    level.spawnedBots++;
    botHitbox = bot.hitbox;
    botHitbox.currentHealth = level.bossHealth;
    botHitbox.damageTaken = 0;
    botHitbox setCanDamage(true);
    botHitbox setCanRadiusDamage(true);
    //botHitbox show();
    botHitbox setModel("com_plasticcase_dummy");

    level.botsInPlay[level.botsInPlay.size] = bot;
    //level.bossPool = array_remove(level.bossPool, bot);

    level notify("bot_spawned");

    bot thread botAI(botHitbox, false, true);

    maps\mp\gametypes\_aiz_round_system::checkForCompass();

    //Check for waypoints on spawn once
    foreach (v in level.waypoints)
    {
        waypointTrace = sightTracePassed(bot getTagOrigin("j_head"), v.origin, false, botHitbox);//Check for waypoints
        if (waypointTrace)
        {
            bot.currentWaypoint = v;//Set the first seen one as current
            bot.visibleWaypoints = v.visiblePoints;
            break;
        }
    }

    if (level._mapname == "so_deltacamp")
        bot.currentWaypoint = undefined;//Setting this to undefined so that it forces the bot to find the closest (entry) node rather than by sight in the list

    if (!isDefined(bot.currentWaypoint))
    {
        //If we haven't found a waypoint with the sightTrace, then find the closest waypoint and use that instead
        closestDist = 999999999;
        closestWaypoint = undefined;
        foreach (v in level.waypoints)
        {
            if (!isDefined(v))
                continue;
            
            heightDiff = abs(bot.origin[2] - v.origin[2]);
            if (distanceSquared(bot.origin, v.origin) < closestDist && heightDiff < 100)
            {
                closestDist = distanceSquared(bot.origin, v.origin);
                closestWaypoint = v;
            }
        }

        if (isDefined(closestWaypoint))
        {
            bot.currentWaypoint = closestWaypoint;
            bot.visibleWaypoints = closestWaypoint.visiblePoints;
        }
    }

    return true;
}

botAI(botHitbox, isCrawler, isBoss)
{
    self endon("death");
    self endon("zombie_death");
    level endon("game_ended");

    while(self.isAlive)
    {
        wait(0.1);

        if (!self.isAlive || !array_contains(level.botsInPlay, self) || botHitbox.currentHealth <= botHitbox.damageTaken) return;
        self killBotIfUnderMap();
        if (!self.isAlive)
            return;//Do another check after height check

        //check time inactivity
        if (getTime() > self.lastActiveTime + level.botInactiveTime && !isBoss && !level.freezerActivated)
        {
            self thread killBotAndRespawn();
            return;
        }

        target = undefined;
        botOrigin = self.origin;
        botHeadTag = self.origin + (0, 0, 60);

        //-START TARGETING-//
        if (level.glowsticks.size != 0)//Find a glowstick first
        {
            foreach (g in level.glowsticks)
            {
                if (!isDefined(g))
                    continue;

                if (level.freezerActivated) break;
                if (isDefined(self.currentWaypoint) && self.currentWaypoint isGlowstick()) 
                {
                     target = self.currentWaypoint; 
                     break; 
                }
                if (distanceSquared(botOrigin, g.origin) > 250000) continue;
                if (sightTracePassed(botHeadTag, g.origin, false, botHitbox))
                {
                    target = g;
                    self.currentWaypoint = g;
                    self.visibleWaypoints = undefined;
                    break;
                }
            }
        }
        if (!isDefined(target) && !level.freezerActivated)//If we haven't found a glowstick, find a real target. This has been modified slighty for PlutoIW5 to optimize game performance
        {
            targetDistance = 360000;
            if (level._mapname == "mp_radar" && level.mapStreakOut) targetDistance = 40000;
            else if (array_contains(level.classicMaps, level._mapname)) targetDistance = 25000000;

            closestDist = 999999999;
            secondClosestDist = 999999999;
            closestPlayer = undefined;
            secondClosestPlayer = undefined;
            foreach (p in level.players)//Find a player
            {
                if (!isDefined(p) || p.sessionTeam != "allies" || !p.isAlive || p.isDown) continue;
                if (p.notTargetable) continue;

                playerOrigin = p.origin;

                targetDistance = 360000;
                if (level._mapname == "mp_radar" && level.mapStreakOut) targetDistance = 40000;
                else if (array_contains(level.classicMaps, level._mapname)) targetDistance = 25000000;
                currentDist = distanceSquared(playerOrigin, botOrigin);
                if (currentDist > targetDistance) continue;

                //Attacking players
                if (distanceSquared(botHitbox.origin, playerOrigin) <= 2500 && !self.isAttacking)
                    self thread ai_attackPlayer(p, isCrawler, isBoss);
                //End attacking
                
                isClosest = currentDist < closestDist;
                isSecondClosest = currentDist < secondClosestDist;
                if (isClosest)
                {
                    secondClosestPlayer = closestPlayer;
                    secondClosestDist = closestDist;
                    closestDist = currentDist;
                    closestPlayer = p;
                }
                else if (isSecondClosest && currentDist > closestDist)
                {
                    secondClosestDist = currentDist;
                    secondClosestPlayer = p;
                }
            }

            if (isDefined(closestPlayer))
            {
                playerHeadTag = closestPlayer getTagOrigin("j_head");
                trace = undefined;
                if (array_contains(level.wawMaps, level._mapname))
                {
                    trace = bulletTracePassed(botHeadTag + (0, 0, 10), playerHeadTag, false, botHitbox);
                }
                else
                {
                    if (!isCrawler && !isBoss)
                        trace = sightTracePassed(botHeadTag, playerHeadTag, false, self, self.head);
                    else trace = sightTracePassed(botHeadTag, playerHeadTag, false, self);
                }

                if (trace)
                {
                    target = closestPlayer;
                    self.currentWaypoint = undefined;
                    self.visibleWaypoints = undefined;
                }
                else if (isDefined(secondClosestPlayer))
                {
                    playerHeadTag = secondClosestPlayer getTagOrigin("j_head");
                    if (array_contains(level.wawMaps, level._mapname))
                    {
                        trace = bulletTracePassed(botHeadTag + (0, 0, 10), playerHeadTag, false, botHitbox);
                    }
                    else
                    {
                        if (!isCrawler && !isBoss)
                            trace = sightTracePassed(botHeadTag, playerHeadTag, false, self, self.head);
                        else trace = sightTracePassed(botHeadTag, playerHeadTag, false, self);
                    }

                    if (trace)
                    {
                        target = secondClosestPlayer;
                        self.currentWaypoint = undefined;
                        self.visibleWaypoints = undefined;
                    }
                }
            }

            if (!isDefined(target))//No players, find a waypoint
            {
                if (isDefined(self.currentWaypoint))
                {
                    if (distanceSquared(botOrigin, self.currentWaypoint.origin) < 2500)
                    {
                        self.visibleWaypoints = self.currentWaypoint.visiblePoints;
                        
                        lastWaypoint = self.currentWaypoint;
                        self.currentWaypoint = self getNextWaypoint();
                        self.lastWaypoint = lastWaypoint;
                    }

                    target = self.currentWaypoint;
                }
                else
                {
                    self.currentWaypoint = self getNextWaypoint();
                    self.lastWaypoint = self.currentWaypoint;

                    target = self.currentWaypoint;
                }
            }
        }
        //-END TARGETING-//
        //Now we are done targeting, do the action for the target

        //-START MOTION-//
        if (self.isAttacking) continue;//Stop moving to attack.
        
        if (!level.freezerActivated && isDefined(target) && isPlayer(target))
        {
            hasCollidedWithOtherBot = false;
            foreach (bot in level.botsInPlay)//Prevent bots from combining into each other
            {
                if (self == bot) continue;
                closeOrigin = bot.origin;
                if (distanceSquared(botOrigin, closeOrigin) < 256)//Move away from the bot and recalc
                {
                    dir = vectorToAngles(botOrigin - closeOrigin);
                    if (botOrigin == closeOrigin)
                        dir = (randomFloat(1), randomFloat(1), 0);
                    forward = anglesToForward((0, dir[1], 0));
                    awayPos = botOrigin + (forward * 50);
                    self moveTo(awayPos, distance(botOrigin, awayPos) / 120);
                    self rotateTo((0, dir[1], 0), 0.3, 0.1, 0.1);
                    hasCollidedWithOtherBot = true;
                    break;
                }
            }
            if (hasCollidedWithOtherBot)
                continue;
        }

        ground = getGroundPosition(botOrigin, 12)[2];

        if (isDefined(target))//Move to our target if there are no glowsticks
        {
            targetOrigin = target.origin;
            angleY = vectorToAngles(targetOrigin - botOrigin)[1];
            self rotateTo((0, angleY, 0), 0.3, 0.1, 0.1);

            if (distance2D(botOrigin, targetOrigin) < 100 || ground == botOrigin[2]) ground = targetOrigin[2];
            if ((level._mapname == "mp_checkpoint" && level.mapVariation == 0) || (level._mapname == "mp_fuel2" && level.mapVariation == 0) || level._mapname == "mp_rust" || level._mapname == "mp_invasion")//Quick fix for maps that have no floor
            {
                if (level._mapname != "mp_rust" && level._mapname != "mp_checkpoint" && level._mapname != "mp_invasion")
                    ground = targetOrigin[2];
                else if (level._mapname == "mp_rust" && ground < -300)
                    ground = -300;
                else if (level._mapname == "mp_checkpoint" && ground < -25)
                    ground = -25;
                else if (level._mapname == "mp_invasion" && ground < -50)
                    ground = -50;
            }

            speed = self.moveSpeed;
            distance = distance(botOrigin, targetOrigin);

            if (((botHitbox isInPeril() && !isDefined(self.hasBeenCrippled)) && !isDefined(self.hasBeenCrippled)) || isBoss || (level.hasDogCrawlers && isCrawler && isPlayer(target)))
                speed = 170;
            else if (isDefined(self.hasBeenCrippled))
                speed = 30;
            else if (isDefined(self.inBarbedWire) || (level._mapname == "mp_radar" && level.mapStreakOut))
                speed = 50;
            groundDist = ground - botOrigin[2];
            groundDist *= 8;//Overcompensate to move faster and track along ground in a better way
            if (ground == targetOrigin[2]) groundDist = 0;//Fix 'jumping bots'

            if (target isGlowstick())
            {
                if (distanceSquared(botOrigin, targetOrigin) > 2500)
                {
                    self moveTo((targetOrigin[0], targetOrigin[1], Ground + groundDist), distance / speed);

                    if (self.state == "idle")
                    {
                        if (isCrawler || isDefined(self.hasBeenCrippled))
                        {
                            if (level.hasDogCrawlers && !isDefined(self.hasBeenCrippled) && isPlayer(target)) self playAnimOnBot("dog_run");
                            else if (level.hasDogCrawlers && !isDefined(self.hasBeenCrippled)) self playAnimOnBot("dog_walk");
                            else self playAnimOnBot("crawlerAnim_walk");
                        }
                        else if (isBoss) self playAnimOnBot("z_run");
                        else
                        {
                            if (speed > 120) self playAnimOnBot("z_run");
                            else self playAnimOnBot("z_walk");
                        }
                        self.state = "moving";
                    }
                }
                else if (self.state != "dancing")
                {
                    self.origin = botOrigin;
                    if (level.hasDogCrawlers && isCrawler) self playAnimOnBot("dog_lose");
                    else self playAnimOnBot("z_lose");
                    self.state = "dancing";
                }
                
                continue;
            }

            self moveTo((targetOrigin[0], targetOrigin[1], ground + groundDist), distance / speed);

            if ((self.state == "idle" || self.state == "dancing") && self.state != "hurt" && self.state != "attacking")
            {
                if (isCrawler || isDefined(self.hasBeenCrippled))
                {
                    if (level.hasDogCrawlers && !isDefined(self.hasBeenCrippled) && isPlayer(target)) self playAnimOnBot("dog_run");
                    else if (level.hasDogCrawlers && !isDefined(self.hasBeenCrippled)) self playAnimOnBot("dog_walk");
                    else self playAnimOnBot("crawlerAnim_walk");
                }
                else if (isBoss) self playAnimOnBot("z_run");
                else
                {
                    if (speed > 120) self playAnimOnBot("z_run");
                    else self playAnimOnBot("z_walk");
                }
                self.state = "moving";
            }
        }
        else//failsafe, just stand still if there is no other options
        {
            self moveTo((botOrigin[0], botOrigin[1], ground), 1);
            if (self.state != "idle" && self.state != "hurt" && self.state != "attacking")
            {
                if (isCrawler || isDefined(self.hasBeenCrippled))
                {
                    if (level.hasDogCrawlers && !isDefined(self.hasBeenCrippled)) self playAnimOnBot("dog_idle");
                    else self playAnimOnBot("crawlerAnim_idle");
                }
                else self playAnimOnBot("z_idle");
                self.state = "idle";
            }
        }
        //-END MOTION-//

        //resetTimeout();
    }
}

ai_attackPlayer(target, isCrawler, isBoss)
{
    level endon("game_ended");
    self endon("death");
    self endon("zombie_death");

    self.isAttacking = true;

    self moveTo(self.origin, 0.05);//Stop movement

    if (!isBoss) self updateBotLastActiveTime();

    if (self.primedForNuke)
    {
        self playAnimOnBot("z_lose");
        return;
    }
    else if (isCrawler || isDefined(self.hasBeenCrippled))
    {
        if (level.hasDogCrawlers && !isDefined(self.hasBeenCrippled))
        {
            self playAnimOnBot("dog_attack");
            self playSound("anml_dog_attack_npc_idle");
        }
        else self playAnimOnBot("crawlerAnim_attack");
    }
    else self playAnimOnBot("z_attack");

    wait(0.2);

    if (target.isAlive)
    {
        time = getTime();
        hitRange = randomFloatRange(2500, 5000);
        if (distanceSquared(self.hitbox.origin, target.origin) <= hitRange && time > target.lastDamageTime + level.damageGracePeriod)//Only connect the attack if the player is close enough to the bot at this point and after a grace period.
        {
            target.lastDamageTime = time;
            playFX(level.fx_blood, target.origin + (0, 0, 30));

            dir = vectorToAngles(self.origin - target.origin);
            dir = vectorNormalize(dir);
            hitDir = dir[1] - target getPlayerAngles()[1];

            targetCurrentWeapon = target getCurrentWeapon();
            if ((target hasWeapon("riotshield_mp") || target hasWeapon("iw5_riotshield_mp")) && ((targetCurrentWeapon != "riotshield_mp" && targetCurrentWeapon != "iw5_riotshield_mp" && hitDir > -80 && hitDir < 80) || (targetCurrentWeapon == "riotshield_mp" || targetCurrentWeapon == "iw5_riotshield_mp")))
            {
                target playSound("melee_hit");
                target finishPlayerDamage(level, level, int(level.botDmg / 2), 0, "MOD_FALLING", "none", target.origin, dir, "none", 0, 0);

                target.lastDamageTime = time;
                target thread onPlayerDamage(time);
            }
            else
            {
                target playSound("melee_punch_other");
                target finishPlayerDamage(level, level, level.botDmg, 0, "MOD_FALLING", "none", target.origin, dir, "none", 0, 0);
                
                target.lastDamageTime = time;
                target thread onPlayerDamage(time);
            }
        }

        wait(0.5);
    }

    if ((isCrawler || isDefined(self.hasBeenCrippled)) && self.isAlive)
    {
        if (level.hasDogCrawlers && !isDefined(self.hasBeenCrippled)) self playAnimOnBot("dog_run");
        else self playAnimOnBot("crawlerAnim_walk");
    }
    else if (isBoss && self.isAlive)
        self playAnimOnBot("z_run");
    else
    {
        if (self.isAlive)
        {
            if (self.hitbox isInPeril()) self playAnimOnBot("z_run");
            else self playAnimOnBot("z_walk");
        }
    }
    if (self.isAlive) self.isAttacking = false;
}