init()
{
    level.wave = 0;
    level.bossCount = 1;
    level.crawlerCount = 25;
    level.totalWaves = 30;

    level.isCrawlerWave = false;
    level.isBossWave = false;
}

startNextRound()
{
    checkForEndGame();//Before we start, make sure there are players to start
    level.wave++;
    level.spawnedBots = 0;
    level.isCrawlerWave = level.wave % 5 == 0 && !level.isBossWave;
    level.isBossWave = level.wave % 10 == 0;
    if (level._mapname == "mp_base")
    {
        level.isCrawlerWave = false;
        level.isBossWave = false;
    }
    if (level.isBossWave)
    {
        level.botsForWave = level.bossCount;
        if (level.bossCount == 1) level.bossCount = 5;
        else level.bossCount += 5;
        foreach (players in level.players) if (isDefined(players.isDown) && !players.isDown) players visionSetNakedForPlayer(level.bossVision);
    }
    else if (level.isCrawlerWave)
    {
        level.botsForWave = level.crawlerCount;
        level.crawlerCount += 25;
        if (level.wave != 5) level.crawlerHealth += 250;
    }
    else//isNormalWave
    {
        level.botsForWave = 10 * level.wave;
        hellMapScalar = 1;
        if (level.isHellMap)//Multiplicated scalar for hell maps
            hellMapScalar = 5;

        if (level.wave != 1) level.botHealth += level.botHealthScalar * hellMapScalar;
    }
    
    checkForHellMapVision();
    level thread maps\mp\gametypes\_aiz_bot_util::startBotSpawn();
    level.zState = "ingame";
    if (!isDefined(level.musicPlaying))
    {
        foreach (players in level.players)
        {
            if (maps\mp\gametypes\_aiz::array_contains(level.wawMaps, level._mapname)) players playLocalSound("aiz_bo_round_start");
            else
            {
                players playLocalSound("mp_bonus_end");
                randomStart = randomInt(8);
                sound = "";
                switch (randomStart)
                {
                    case 0:
                        sound = "US_1mc_fightback";
                        break;
                    case 1:
                        sound = "US_1mc_goodtogo";
                        break;
                    case 2:
                        sound = "US_1mc_holddown";
                        break;
                    case 3:
                        sound = "US_1mc_keepfighting";
                        break;
                    case 4:
                        sound = "US_1mc_pushforward";
                        break;
                    case 5:
                        sound = "US_1mc_readytomove";
                        break;
                    case 6:
                        sound = "US_1mc_positions_lock";
                        break;
                    case 7:
                        sound = "US_1mc_security_complete";
                        break;
                }
                players playLocalSound(sound);
            }
        }
    }
    level thread maps\mp\gametypes\_aiz_hud::onRoundChange();
    level notify("round_changed");
}

checkForEndRound()
{
    if (level.botsInPlay.size == 0 && level.botsForWave == level.spawnedBots)
    {
        if (level.wave == level.totalWaves)
        {
            level.zState = "ended";
            thread maps\mp\gametypes\_aiz_hud::endGame(true);
            return;
        }
        thread maps\mp\gametypes\_aiz::startIntermission();
        foreach (players in level.players)
        {
            if (!players.isDown && (!level.isHellMap || (level.isHellMap && level.visionRestored)))
            {
                if (((level._mapname == "mp_bootleg" || level._mapname == "mp_courtyard_ss") && !level.mapStreakOut))
                    players visionSetNakedForPlayer(level.vision);
                else if (level._mapname != "mp_bootleg")
                    players visionSetNakedForPlayer(level.vision);
            }

            if (!isDefined(level.musicPlaying))
            {
                if (maps\mp\gametypes\_aiz::array_contains(level.wawMaps, level._mapname)) players playLocalSound("aiz_bo_round_end");
                else
                {
                    players playLocalSound("mp_bonus_start");
                    players playLocalSound("US_1mc_encourage_win");
                }
            }

            if (level.isCrawlerWave || level.isBossWave) players maps\mp\gametypes\_aiz::z_giveMaxAmmo();
        }
    }
    checkForCompass();
}

checkForHellMapVision()
{
    if (level.isHellMap)
    {
        foreach (player in level.players)
        {
            if (!player.isDown && !level.visionRestored)
            {
                player visionSetNakedForPlayer(level.hellVision);
            }
        }
    }
}

checkForCompass()
{
    if (level.botsInPlay.size < 11 && level.spawnedBots == level.botsForWave)
    {
        for (i = 0; i < level.botsInPlay.size; i++)
        {
            bot = level.botsInPlay[i];
            if (bot.isOnCompass || !bot.isAlive) continue;
            curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();
            bot.isOnCompass = true;
            bot.objID = curObjID;
            Objective_Add(curObjID, "active", bot.origin, "compassping_enemy");
            //Objective_Icon(curObjID, "compassping_enemy");
            Objective_Team(curObjID, "allies");
            Objective_OnEntity(curObjID, bot);
        }
    }
}

checkForEndGame()
{
    wait(0.5);

    playersAlive = 0;
    foreach (player in level.players)
    {
        if (player.isAlive)
            playersAlive++;
    }

    if (playersAlive == 1 && level.zState == "ingame")
    {
        foreach (player in level.players)
        {
            if (player.isAlive)
            {
                player playLocalSound("US_1mc_lastalive");
                break;
            }
        }
    }
    else if (playersAlive == 0)
        thread maps\mp\gametypes\_aiz_hud::endGame(false);
}

updateMaxBotCount()
{
    if (level.players.size > 4)
        level.maxActiveBots = getDvarInt("aiz_maxZombiesUnderLoad");
    else
        level.maxActiveBots = getDvarInt("aiz_maxZombies");
}