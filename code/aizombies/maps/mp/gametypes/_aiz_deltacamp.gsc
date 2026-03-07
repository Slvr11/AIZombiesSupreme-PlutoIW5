#include common_scripts\utility;
#include maps\mp\gametypes\_aiz_map_edits;

initDeltaCamp()
{
    initSpawnZones();
    initPerks();
    initPap();
    initSpeakers();
    initTree();
    initFiringRange();
}
initSpawnZones()
{
    level.camp_zoneSpawns = [];
    level.camp_zoneSpawns[0] = [];
    level.camp_zoneSpawns[1] = [];
    level.camp_zoneSpawns[2] = [];

    level.camp_zoneSpawns[0][0] = [(411.804, -1679.12, 140.011), (0, 125.056, 0)];
    level.camp_zoneSpawns[0][1] = [(-989.783, -1457.12, 115.635), (0, -0.682739, 0)];
    level.camp_zoneSpawns[0][2] = [(-988.61, -1349.77, 106.851), (0, 1.70129, 0)];
    level.camp_zoneSpawns[0][3] = [(-972.067, -1224.23, 104.125), (0, 2.70654, 0)];
    level.camp_zoneSpawns[1][0] = [(521.893, 62.6252, 72.488), (0, 173.797, 0)];
    level.camp_zoneSpawns[1][1] = [(-378.829, 587.702, 0.124997), (0, -25, 0)];
    level.camp_zoneSpawns[2][0] = [(-1002.86, -821.625, 249.715), (0, 35, 0)];
    level.camp_zoneSpawns[2][1] = [(353.459, -806.071, 262.452), (0, 135, 0)];
    level.camp_zoneSpawns[2][2] = [(606.744, -1050.11, 255.989), (0, 50, 0)];

    thread watchSpawnZones();
}
watchSpawnZones()
{
    level endon("game_ended");

    level waittill("connected");

    for (;;)
    {
        activeSpawns = [];
        activeSpawnAngles = [];

        foreach (player in level.players)
        {
            if (!player.isAlive || player.sessionTeam != "allies") continue;

            if (player.origin[2] > 175)
            {
                foreach (spawn in level.camp_zoneSpawns[2])
                {
                    activeSpawns[activeSpawns.size] = spawn[0];
                    activeSpawnAngles[activeSpawnAngles.size] = spawn[1];
                }
            }
            else if (player.origin[1] > -900)
            {
                foreach (spawn in level.camp_zoneSpawns[1])
                {
                    activeSpawns[activeSpawns.size] = spawn[0];
                    activeSpawnAngles[activeSpawnAngles.size] = spawn[1];
                }
            }
            else
            {
                foreach (spawn in level.camp_zoneSpawns[0])
                {
                    activeSpawns[activeSpawns.size] = spawn[0];
                    activeSpawnAngles[activeSpawnAngles.size] = spawn[1];
                }
            }
        }

        level.botSpawns = activeSpawns;
        level.botSpawnAngles = activeSpawnAngles;
        wait(1);
    }
}
initPerks()
{
    perkRail1 = createPerkOnRails((-985, -32, 192), "com_plasticcase_friendly");
    perkRail2 = createPerkOnRails((-985, -223, 192), "com_plasticcase_enemy");
    perkRail3 = createPerkOnRails((-985, -415, 192), "com_plasticcase_friendly");

    perkRail1 thread runPerkOnRails(0);
    perkRail2 thread runPerkOnRails(1);
    perkRail3 thread runPerkOnRails(0);
}
initPap()
{
    crate = getEntByNum(38);
    if (!isDefined(crate))
    {
        maps\mp\gametypes\_aiz_map_edits::spawnMapEditObject("pap", (880.875, -561.992, 270), (0, -90, 0));
        return;
    }

    jammer = getEntByNum(36);
    if (isDefined(jammer))
        jammer delete();
    weaponStrap = getEntByNum(37);
    if (isDefined(weaponStrap))
        weaponStrap delete();
    weaponStrap2 = getEntByNum(39);
    if (isDefined(weaponStrap2))
        weaponStrap2 delete();

    curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();
    objective_add(curObjID, "invisible", (0, 0, 0));
    objective_position(curObjId, crate.origin);
    objective_team(curObjID, "allies");
    objective_state(curObjId, "active");
    objective_icon(curObjId, "cardicon_brassknuckles");
    crate.state = "idle";
    crate.weapon = "";
    crate.player = undefined;

    weapon = spawn("script_model", crate.origin + (0, 0, 10));
    weapon setModel("tag_origin");
    weapon hide();
    crate.weaponEnt = weapon;

    attachments = [];
    attachments[0] = spawn("script_model", weapon.origin);
    attachments[0] setModel("tag_origin");
    attachments[0] linkTo(weapon);
    attachments[0] hide();
    attachments[1] = spawn("script_model", weapon.origin);
    attachments[1] setModel("tag_origin");
    attachments[1] linkTo(weapon);
    attachments[1] hide();
    crate.attachments = attachments;

    crate addUsable("pap", 75);
}
initSpeakers()
{
    level.campSpeakers = [];
    level.campSpeakers[0] = getEntByNum(44);
    level.campSpeakers[1] = getEntByNum(45);
    level.campSpeakers[2] = getEntByNum(46);
    level.campSpeakers[3] = getEntByNum(47);
    level.campSpeakers[4] = getEntByNum(48);
    level.campSpeakers[5] = getEntByNum(49);

    level.campSpeakersLeft = level.campSpeakers.size;

    /*
    foreach (speaker in level.campSpeakers)
    {
        speaker setCanDamage(true);
        speaker setCanRadiusDamage(false);
        speaker thread watchSpeaker();
    }
    */
}
initTree()
{
    campTree = getEntByNum(112);
    if (!isDefined(campTree))
        return;

    campTree setCanDamage(true);
    campTree setCanRadiusDamage(true);

    campTree thread watchTree();
}
initFiringRange()
{
    rangeButton = spawn("script_model", (-700, -1160, 165));
    rangeButton setModel("tag_origin");
    rangeButton setCursorHint("HINT_NOICON");
    rangeButton setHintString(&"NULL_EMPTY");
    rangeButton makeUsable();
    rangeButton thread watchFiringRangeButton();

    level.camp_friendlyTargets = [];
    level.camp_friendlyTargets[0] = "training_target_civ1";
    level.camp_friendlyTargets[1] = "training_target_civ2";
    level.camp_friendlyTargets[2] = "training_target_civ3";
    level.camp_enemyTargets = [];
    level.camp_enemyTargets[0] = "training_target_opfor1";
    level.camp_enemyTargets[1] = "training_target_opfor2";
    level.camp_enemyTargets[2] = "training_target_opfor3";
    level.camp_enemyTargets[3] = "training_target_dog";

    level.camp_targets = [];

    level.camp_targets[0] = spawn("script_model", (-1088.81, -1279.57, 104.125));
    level.camp_targets[0].angles = (0, 90, -90);
    level.camp_targets[0] setModel(level.camp_friendlyTargets[0]);
    level.camp_targets[0] setCanDamage(true);
    level.camp_targets[0] setCanRadiusDamage(false);
    level.camp_targets[0].hit = false;
    level.camp_targets[0].complete = false;
    level.camp_targets[0].targetType = "";
    
    level.camp_targets[1] = spawn("script_model", (-1392.81, -1423.96, 104.125));
    level.camp_targets[1].angles = (0, 90, -90);
    level.camp_targets[1] setModel(level.camp_friendlyTargets[0]);
    level.camp_targets[1] setCanDamage(true);
    level.camp_targets[1] setCanRadiusDamage(false);
    level.camp_targets[1].hit = false;
    level.camp_targets[1].complete = false;
    level.camp_targets[1].targetType = "";

    level.camp_targets[2] = spawn("script_model", (-1696.81, -1304.13, 104.125));
    level.camp_targets[2].angles = (0, 90, -90);
    level.camp_targets[2] setModel(level.camp_friendlyTargets[0]);
    level.camp_targets[2] setCanDamage(true);
    level.camp_targets[2] setCanRadiusDamage(false);
    level.camp_targets[2].hit = false;
    level.camp_targets[2].complete = false;
    level.camp_targets[2].targetType = "";

    level.camp_targets[3] = spawn("script_model", (-1992.81, -1392.33, 104.125));
    level.camp_targets[3].angles = (0, 90, -90);
    level.camp_targets[3] setModel(level.camp_friendlyTargets[0]);
    level.camp_targets[3] setCanDamage(true);
    level.camp_targets[3] setCanRadiusDamage(false);
    level.camp_targets[3].hit = false;
    level.camp_targets[3].complete = false;
    level.camp_targets[3].targetType = "";

    level thread watchFiringRange();
}

createPerkOnRails(origin, model)
{
    perkBox = spawn("script_model", origin + (0, 0, 35));
    perkBox.angles = (90, 0, 0);
    perkBox setModel(model);
    perkRail1 = spawn("script_model", origin);
    perkRail1.angles = (0, 0, 0);
    perkRail1 setModel("bc_target_dummy_base");
    perkRail2 = spawn("script_model", origin);
    perkRail2.angles = (0, 180, 0);
    perkRail2 setModel("bc_target_dummy_base");

    perkRail1 linkTo(perkBox);
    perkRail2 linkTo(perkBox);

    curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();
    objective_add(curObjID, "invisible", (0, 0, 0));
    objective_onEntity(curObjID, perkBox);
    objective_team(curObjID, "allies");
    objective_icon(curObjId, "coop_player_location_rotated");
    perkBox.objID = curObjID;

    return perkBox;
}
clearPerkOnRails()
{
    if (!isDefined(self.trigger))
        return;

    self.trigger removeUsable();
    self.trigger = undefined;

    objective_icon(self.objID, "coop_player_location_rotated");
}
randomizePerkOnRails(railType)
{
    if (isDefined(self.trigger))
        self.trigger removeUsable();

    perkTrigger = spawn("script_model", self.origin);
    perkTrigger.angles = (0, 0, 0);
    perkTrigger setModel("tag_origin");
    self.trigger = perkTrigger;
    
    possiblePerks = [];
    if (railType == 1)
    {
        possiblePerks[0] = 1;
        possiblePerks[1] = 2;
        possiblePerks[2] = 5;
    }
    else
    {
        possiblePerks[0] = 3;
        possiblePerks[1] = 4;
        possiblePerks[2] = 6;
        possiblePerks[3] = 7;
    }

    perk = possiblePerks[randomInt(possiblePerks.size)];

    icon = "white";
    cost = 5000;
    switch (perk)
    {
        case 1:
            cost = 2500;
            icon = "specialty_light_armor";
            break;
        case 2:
            cost = 2000;
            icon = "specialty_longersprint_upgrade";
            break;
        case 3:
            cost = 3000;
            icon = "specialty_fastreload_upgrade";
            break;
        case 4:
            if (level.classicPerks == 1)
            {
                cost = 6500;
                icon = "cardicon_bullets_50cal";
            }
            else
            {
                cost = 4000;
                icon = "specialty_twoprimaries_upgrade";
            }
            break;
        case 5:
            if (level.classicPerks == 1)
            {
                cost = 2500;
                icon = "specialty_bulletdamage_upgrade";
            }
            else
            {
                cost = 2000;
                icon = "weapon_attachment_rof";
            }
            break;
        case 6:
            if (level.classicPerks == 1)
            {
                cost = 2000;
                icon = "specialty_steadyaim_upgrade";
            }
            else
            {
                cost = 1500;
                icon = "specialty_stalker_upgrade";
            }
            break;
        case 7:
            if (level.classicPerks == 1)
            {
                cost = 2500;
                icon = "specialty_pistoldeath_upgrade";
            }
            else
            {
                cost = 1500;
                icon = "waypoint_revive";
            }
            break;
        default:
            icon = "white";
            break;
    }

    objective_icon(self.objID, icon);

    perkTrigger.cost = cost;
    perkTrigger addUsable("perk" + perk, 75);
}
runPerkOnRails(startPos)
{
    railPos = [];
    railPos[0] = (-985, self.origin[1], self.origin[2]);
    railPos[1] = (-675, self.origin[1], self.origin[2]);
    currentPos = startPos;

    self.origin = railPos[currentPos];

    level waittill("power_activated");
    
    wait(5);

    objective_state(self.objID, "active");

    for (;;)
    {
        self clearPerkOnRails();

        currentPos++;
        if (currentPos >= railPos.size)
            currentPos = 0;

        self moveTo(railPos[currentPos], 3, 0, 0.5);
        self playLoopSound("ugv_engine_high");

        wait(3);

        self stopLoopSound();
        self randomizePerkOnRails(startPos);

        level waittill("round_changed");
    }
}

watchSpeaker()
{
    self waittill("damage");

    self playSound("emt_airhorn_area_clear");
    
    level.campSpeakersLeft--;

    wait(1);

    if (level.campSpeakersLeft <= 0)
        destroyAllSpeakers();
}
destroyAllSpeakers()
{
    foreach (speaker in level.campSpeakers)
        speaker thread destroySpeaker();
}
destroySpeaker()
{
    playSoundAtPos(self.origin, "fx_electransformer_spark_long");

    wait(0.5);

    playFX(level.fx_sentryDeath, self.origin);
    self delete();
}
watchTree()
{
    for (;;)
    {
        self waittill("damage", damage, attacker, direction_vec, point, type, modelName, tagName, partName, iDFlags, weapon);

        if (type != "MOD_EXPLOSIVE" && type != "MOD_GRENADE" && type != "MOD_GRENADE_SPLASH")
            continue;

        self playSound("tree_collapse");
        self rotatePitch(70, 3, 2.75, 0.05);

        wait(3);

        self playSound("explo_tree");
        self delete();

        damagePoint = (300, 75, 0);

        playFX(level.fx_crateCollectSmoke, (400, 95, 100));
        playFX(level.fx_crateCollectSmoke, (375, 95, 85));
        playFX(level.fx_crateCollectSmoke, (350, 95, 70));
        playFX(level.fx_crateCollectSmoke, (325, 95, 55));
        playFX(level.fx_crateCollectSmoke, (300, 95, 40));
        playFX(level.fx_crateCollectSmoke, (275, 95, 25));
        playFX(level.fx_crateCollectSmoke, (250, 95, 10));
        playFX(level.fx_crateCollectSmoke, (225, 95, 0));

        earthquake(0.5, 1, damagePoint, 512);

        foreach (player in level.players)
        {
            if (!isAlive(player) || !player.isAlive)
                continue;
            if (player.isDown)
                continue;

            if (distanceSquared(player.origin, damagePoint) < 16384)
                player finishPlayerDamage(level, level, player.maxHealth, 0, "MOD_FALLING", "none", damagePoint, (0,0,0), "none", 0, 0);
        }
        foreach (bot in level.botsInPlay)
        {
            if (!bot.isAlive)
                continue;

            if (distanceSquared(bot.origin, damagePoint) < 16384)
                bot.hitbox notify("damage", 10000, attacker, (0, 0, 0), damagePoint, "MOD_PASSTHRU", "", "", "j_head", 0, "iw5_usp45_mp");
        }

        break;
    }
}
watchFiringRangeButton()
{
    for (;;)
    {
        self waittill("trigger", player);

        if (!player worldPointInReticle_Circle(self.origin, 100, 100))
            continue;

        self playSound("vending_machine_button_press");

        level notify("firing_range_triggered");
    }
}
randomizeFiringRangeTarget(type)
{
    if (!isDefined(type))
    {
        type = "enemy";
        if (cointoss())
            type = "friendly";
    }

    self.hit = false;
    self.complete = (type == "friendly");
    self.targetType = type;

    if (type == "friendly")
    {
        targetModel = level.camp_friendlyTargets[randomInt(level.camp_friendlyTargets.size)];
        self setModel(targetModel);
    }
    else
    {
        targetModel = level.camp_enemyTargets[randomInt(level.camp_enemyTargets.size)];
        self setModel(targetModel);
    }
}
watchFiringRange()
{
    for (;;)
    {
        level waittill("round_changed");

        level waittill("firing_range_triggered");

        foreach (target in level.camp_targets)
        {
            target rotateTo((0, 90, -90), 1);
        }

        wait(1);

        foreach (target in level.camp_targets)
        {
            target randomizeFiringRangeTarget();
            target rotateTo((0, 90, 0), 0.5);
            target playSound("target_up_metal");
            target thread watchFiringRangeTarget();
        }

        validateFiringRangeTargets();
    }
}
validateFiringRangeTargets()
{
    enemyTargets = 0;
    foreach (target in level.camp_targets)
    {
        if (target.targetType == "enemy")
            enemyTargets++;
    }

    if (enemyTargets == 0)
    {
        randomTarget = randomInt(4);
        level.camp_targets[randomTarget] randomizeFiringRangeTarget("enemy");
    }
}
watchFiringRangeTarget()
{
    self notify("watch_firing_range_target");

    self endon("watch_firing_range_target");
    self endon("round_changed");

    self waittill("damage");

    self.hit = true;
    if (self.targetType == "friendly")
    {
        self.complete = false;
        playSoundOverSpeakers("target_mistake_buzzer");
        resetAllFiringRangeTargets();
    }
    else if (self.targetType == "enemy")
    {
        self.complete = true;
    }

    self playSound("target_metal_hit");
    self rotateTo((0, 90, -90), 1);

    foreach (target in level.camp_targets)
    {
        if (!target.complete)
            return;
    }

    firingRangeReward();
}
firingRangeReward()
{
    resetAllFiringRangeTargets();

    playSoundOverSpeakers("emt_airhorn_area_clear");

    dropType = randomIntRange(1, 11);
    maps\mp\gametypes\_aiz_bonus_drops::spawnBonusDrop(dropType, (-602, -1212, 134));
    playSoundAtPos((-602, -1212, 134), "ammo_cookoff_pop");
}
resetAllFiringRangeTargets()
{
    foreach (target in level.camp_targets)
    {
        target rotateTo((0, 90, -90), 1);
        target playSound("target_up_wood");
        target.complete = false;
        target.hit = false;
        target.targetType = "";
    }
}
playSoundOverSpeakers(sound)
{
    foreach (speaker in level.campSpeakers)
    {
        speaker playSound(sound);
    }
}