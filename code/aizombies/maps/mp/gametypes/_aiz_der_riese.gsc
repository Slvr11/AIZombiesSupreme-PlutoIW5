#include common_scripts\utility;
#include maps\mp\gametypes\_aiz_map_edits;

initDerRieseMapEnts()
{
    level.crawlerCount = 10;

    initPerks();
    initAmmoCaches();
    initMysteryBox();
    initPackAPunch();
    initSpawnZones();
    initPower();
    initBridge();
    initBuyableDoors();
    initTeleporters();
    initWallBuys();
    initLaptops();
    thread initFaceIDs();
    initTraps();
    cleanHeliEnts();
    initNewAdditions();
}
initPerks()
{
    juggMachine = getEnt("vending_jugg", "targetname");
    speedMachine = getEnt("vending_sleight", "targetname");
    dtapMachine = getEnt("vending_doubletap", "targetname");
    reviveMachine = getEnt("vending_revive", "targetname");

    perkTriggers = getEntArray("zombie_vending", "targetname");
    foreach (trigger in perkTriggers)
        trigger delete();

    jugg = spawn("script_origin", juggMachine.origin);
    curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();
    icon = "specialty_light_armor";
    cost = 2500;
    objective_add(curObjID, "invisible", (0, 0, 0));
    objective_position(curObjId, jugg.origin);
    objective_team(curObjID, "allies");
    objective_state(curObjId, "active");
    objective_icon(curObjId, icon);
    jugg.cost = cost;
    jugg addUsable("perk1", 75);

    speed = spawn("script_origin", speedMachine.origin);
    curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();
    icon = "specialty_fastreload_upgrade";
    cost = 3000;
    objective_add(curObjID, "invisible", (0, 0, 0));
    objective_position(curObjId, speed.origin);
    objective_team(curObjID, "allies");
    objective_state(curObjId, "active");
    objective_icon(curObjId, icon);
    speed.cost = cost;
    speed addUsable("perk3", 75);

    dtap = spawn("script_origin", dtapMachine.origin);
    curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();
    icon = "weapon_attachment_rof";
    cost = 2000;
    objective_add(curObjID, "invisible", (0, 0, 0));
    objective_position(curObjId, dtap.origin);
    objective_team(curObjID, "allies");
    objective_state(curObjId, "active");
    objective_icon(curObjId, icon);
    dtap.cost = cost;
    dtap addUsable("perk5", 75);

    revive = spawn("script_origin", reviveMachine.origin);
    curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();
    icon = "waypoint_revive";
    cost = 1500;
    objective_add(curObjID, "invisible", (0, 0, 0));
    objective_position(curObjId, revive.origin);
    objective_team(curObjID, "allies");
    objective_state(curObjId, "active");
    objective_icon(curObjId, icon);
    revive.cost = cost;
    revive addUsable("perk7", 75);

    muleKick = spawn("script_model", (-1091.88, -1313.1, 67.125));
    muleKick.angles = (0, 90, 0);
    muleKick setModel("zombie_vending_mulekick_on");
    clip = getEnt("vending_revive_clip", "targetname");
    if (isDefined(clip))
    {
        machineClip = spawn("script_model", muleKick.origin + (0, 0, 35));
        machineClip setModel("tag_origin");
        machineClip cloneBrushModelToScriptModel(clip);
        machineClip willNeverChange();
    }
    curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();
    icon = "specialty_twoprimaries_upgrade";
    cost = 4000;
    objective_add(curObjID, "invisible", (0, 0, 0));
    objective_position(curObjId, muleKick.origin);
    objective_team(curObjID, "allies");
    objective_state(curObjId, "active");
    objective_icon(curObjId, icon);
    muleKick.cost = cost;
    muleKick addUsable("perk4", 75);
    muleKick thread play_perk_jingle("mule_song");
    mule_fx = loadfx("zombie/zm_perk_speed_fx");
    fx = spawnFX(mule_fx, muleKick.origin, anglestoforward(muleKick.angles));
    triggerFX(fx);
}
play_perk_jingle(alias)
{
	while(isDefined(self))
    {
		wait randomIntRange(30, 45);
		self playSound(alias);
	}
}
initAmmoCaches()
{
    ammoCaches = getEntArray("ammo_cache", "targetname");
    foreach (cache in ammoCaches)
    {
        ammo = spawn("script_origin", cache.origin);
        ammo.used = false;
        ammo addUsable("ammo", 75);
    }
}
initMysteryBox()
{
    //Clear current box locations
    for (i = 0; i < 6; i++)
    {
        boxBase = getEnt("magic_box_base_" + i, "targetname");
        boxLid = getEnt("magic_box_lid_" + i, "targetname");
        boxBase hide();
        boxLid hide();
        boxLid.spawnAngles = boxLid.angles;
    }

    boxSpawns = [];
    for (i = 0; i < 6; i++)
    {
        boxSpawn = getEnt("magic_box_weapon_spawn_" + i, "targetname");
        if (!isDefined(boxSpawn))
        {
            printLn("Missing a zombie mystery box spawn with index " + i);
            continue;
        }

        boxSpawns[boxSpawns.size] = [boxSpawn.origin, boxSpawn.angles];
    }

    level.boxLocations = boxSpawns;
    randomWeaponCrate(boxSpawns[0][0], boxSpawns[0][1], 0, 0);
}
initPackAPunch()
{
    papTrigger = getEnt("zombie_vending_upgrade", "targetname");
    if (!isDefined(papTrigger))
    {
        printLn("Missing Pack a Punch trigger 'zombie_vending_upgrade'!");
        return;
    }
    machineModel = getEnt(papTrigger.target, "targetname");
    papMachine = spawn("script_origin", machineModel.origin - (0, 12, 25));

    curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();
    objective_add(curObjID, "invisible", (0, 0, 0));
    objective_position(curObjId, papMachine.origin);
    objective_team(curObjID, "allies");
    objective_state(curObjId, "active");
    objective_icon(curObjId, "cardicon_brassknuckles");

    papMachine.state = "idle";
    papMachine.weapon = "";
    papMachine.player = undefined;

    weapon = spawn("script_model", papMachine.origin);
    weapon setModel("tag_origin");
    weapon hide();
    //weapon enableLinkTo();
    papMachine.weaponEnt = weapon;

    attachments = [];
    attachments[0] = spawn("script_model", weapon.origin);
    attachments[0] setModel("tag_origin");
    attachments[0] linkTo(weapon);
    attachments[0] hide();
    attachments[1] = spawn("script_model", weapon.origin);
    attachments[1] setModel("tag_origin");
    attachments[1] linkTo(weapon);
    attachments[1] hide();
    papMachine.attachments = attachments;

    papMachine addUsable("pap", 75);

    hintTrigger = getEnt("weapon_upgrade_hint", "targetname");
    if (isDefined(hintTrigger))
    {
        useTrigger = getEnt(hintTrigger.target, "targetname");
        if (isDefined(useTrigger))
        {
            useTrigger delete();
            hintTrigger delete();
        }
    }
}
initSpawnZones()
{
    level.derRiese_zones = getEntArray("info_volume", "classname");

    level.derRiese_zoneSpawns = [];

    level.derRiese_zoneSpawns["receiver_zone"] = [];
    level.derRiese_zoneSpawns["receiver_zone"][0] = (-165.047, -734.432, -142.875);
    level.derRiese_zoneSpawns["receiver_zone"][1] = (-384.607, 740.246, -3.875);
    level.derRiese_zoneSpawns["receiver_zone"][2] = (223.361, 739.376, -3.59611);
    level.derRiese_zoneSpawns["receiver_zone"][3] = (-808.453, 153.338, 7.4185);

    level.derRiese_zoneSpawns["outside_west_zone"] = [];
    level.derRiese_zoneSpawns["outside_west_zone"][0] = (-709.2, 23.7254, 69.125);
    level.derRiese_zoneSpawns["outside_west_zone"][1] = (-818.938, 32.42, 65.0122);
    
    level.derRiese_zoneSpawns["warehouse_bottom_zone"] = [];
    level.derRiese_zoneSpawns["warehouse_bottom_zone"][0] = (-1180.08, -863.622, 67.0841);
    level.derRiese_zoneSpawns["warehouse_bottom_zone"][1] = (-324.476, -1172.66, 67.125);

    level.derRiese_zoneSpawns["warehouse_top_zone"] = [];
    level.derRiese_zoneSpawns["warehouse_top_zone"][0] = (-660.544, -1544.64, 191.125);

    level.derRiese_zoneSpawns["tp_west_zone"] = [];
    level.derRiese_zoneSpawns["tp_west_zone"][0] = (-1532.56, -1545.8, 191.125);
    level.derRiese_zoneSpawns["tp_west_zone"][1] = (-1214.71, -367.416, 199.125);

    level.derRiese_zoneSpawns["bridge_zone"] = [];
    level.derRiese_zoneSpawns["bridge_zone"][0] = (-303.988, -878.498, 199.125);
    level.derRiese_zoneSpawns["bridge_zone"][1] = (-240.486, -1545.09, 191.125);

    level.derRiese_zoneSpawns["wnuen_bridge_zone"] = [];
    level.derRiese_zoneSpawns["wnuen_bridge_zone"][0] = (1549.07, -1418.47, 134.125);
    level.derRiese_zoneSpawns["wnuen_bridge_zone"][1] = (747.854, -1284.71, 135.125);

    level.derRiese_zoneSpawns["wnuen_zone"] = [];
    level.derRiese_zoneSpawns["wnuen_zone"][0] = (537.028, -681.658, 64.125);
    level.derRiese_zoneSpawns["wnuen_zone"][1] = (1072.44, -654.324, 64.125);
    level.derRiese_zoneSpawns["wnuen_zone"][2] = (1143.46, 0.00788382, 64.125);

    level.derRiese_zoneSpawns["tp_east_zone"] = [];
    level.derRiese_zoneSpawns["tp_east_zone"][0] = (1663.38, 826.417, 167.016);
    level.derRiese_zoneSpawns["tp_east_zone"][1] = (816.05, 1201.71, 168.125);

    level.derRiese_zoneSpawns["outside_east_zone"] = [];
    level.derRiese_zoneSpawns["outside_east_zone"][0] = (789.386, 753.55, 51.125);
    level.derRiese_zoneSpawns["outside_east_zone"][1] = (433.752, -103.228, 64.125);

    level.derRiese_zoneSpawns["outside_south_zone"] = [];
    level.derRiese_zoneSpawns["outside_south_zone"][0] = (429.391, -633.46, 64.125);
    level.derRiese_zoneSpawns["outside_south_zone"][1] = (81.2365, -1143.75, 69.4453);
    level.derRiese_zoneSpawns["outside_south_zone"][2] = (76.7427, -1396.68, 67.125);

    level.derRiese_zoneSpawns["tp_south_zone"] = [];
    level.derRiese_zoneSpawns["tp_south_zone"][0] = (-546.134, -2202.14, 156.125);
    level.derRiese_zoneSpawns["tp_south_zone"][1] = (-205.395, -2518.54, 38.0616);
    level.derRiese_zoneSpawns["tp_south_zone"][2] = (654.613, -2227.44, 277.125);

    thread watchSpawnZones();
}
watchSpawnZones()
{
    level endon("game_ended");

    level waittill("connected");

    for (;;)
    {
        activeSpawns = [];

        for (i = 0; i < level.derRiese_zones.size; i++)
        {
            foreach (player in level.players)
            {
                if (!player.isAlive || player.sessionTeam != "allies") continue;

                if (player isTouching(level.derRiese_zones[i]))
                {
                    //printLn("Touching zone " + level.derRiese_zones[i].targetname);
                    foreach (spawn in level.derRiese_zoneSpawns[level.derRiese_zones[i].targetname])
                    {
                        activeSpawns[activeSpawns.size] = spawn;
                    }
                    break;
                }
            }
        }

        level.botSpawns = activeSpawns;
        level.botSpawnAngles = [];
        for (i = 0; i < level.botSpawns.size; i++)
        {
            level.botSpawnAngles[i] = (0, 0, 0);
        }
        wait(1);
    }
}
initPower()
{
    powerPanel = getEnt("elec_body", "targetname");
    powerLever = getEnt("elec_switch", "targetname");

    power = spawn("script_origin", powerLever.origin);
    curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();
    objective_add(curObjID, "invisible", (0, 0, 0));
    objective_position(curObjId, power.origin);
    objective_team(curObjID, "allies");
    objective_state(curObjId, "active");
    objective_icon(curObjId, "cardicon_bulb");
    power.objID = curObjID;

    power.bought = false;
    power.lever = powerLever;
    power addUsable("power", 100);

    bridgeTrigger = getEnt("bridge_trigger", "targetname");
    if (isDefined(bridgeTrigger))
        bridgeTrigger delete();
}
initBridge()
{
    warehouseBridge = getEnt("warehouse_bridge", "targetname");
    wnuenBridge = getEnt("wnuen_bridge", "targetname");

    warehouseBridge rotatePitch(-60, 1);
    wnuenBridge rotatePitch(60, 1);

    thread waitForBridgePower(warehouseBridge, wnuenBridge);
}
waitForBridgePower(warehouseBridge, wnuenBridge)
{
    level waittill("power_activated");

    warehouseBridge rotatePitch(60, 4, 1, 1);
    warehouseBridge playSound("elm_metal_rattle");
    wnuenBridge rotatePitch(-60, 4, 1, 1);
    wnuenBridge playSound("elm_metal_rattle");
}
initBuyableDoors()
{
    createDoor((-423.271, -1028.56, 400), (-423.271, -1028.56, 200.625), (90, 90, 0), 2, 2, 75, 1000);//Door to warehouse_top
    createDoor((1047, -1014.61, 400), (1047, -1014.61, 162.125), (90, 0, 0), 3, 2, 75, 1000);//Door to wnuen_bridge

    outsideWestDoor = getEnt("outside_west_door", "targetname");
    warehouseDoors = getEntArray("warehouse_garage_door", "targetname");
    outsideEastDoor = getEnt("outside_east_door", "targetname");
    wnuenOutsideDoors = getEntArray("wnuen_outside_door", "targetname");
    tpEastDoor = getEnt("tp_east_door", "targetname");
    southCourtyardDoors = getEntArray("south_courtyard_door", "targetname");
    outsideSouthEastDoor = getEnt("outside_south_east_door", "targetname");
    outsideSouthWestDoor = getEnt("outside_south_west_door", "targetname");

    outsideWestDoor.origin -= (0, 88, 0);
    createFauxDoor(outsideWestDoor, undefined, 88, 750, true);
    outsideEastDoor.origin -= (0, 140, 0);
    createFauxDoor(outsideEastDoor, undefined, 140, 750, true);

    outsideSouthEastDoor.origin += (0, 0, 80);
    outsideSouthEastDoor thread watchPowerDoor();
    outsideSouthWestDoor.origin += (0, 0, 80);
    outsideSouthWestDoor thread watchPowerDoor();

    if (warehouseDoors[0].origin[0] < warehouseDoors[1].origin[0])
    {
        warehouseDoors[0].origin += (75, 0, 0);
        warehouseDoors[1].origin -= (75, 0, 0);
        createFauxDoor(warehouseDoors[1], warehouseDoors[0], 75, 750, undefined);
    }
    else
    {
        warehouseDoors[0].origin -= (75, 0, 0);
        warehouseDoors[1].origin += (75, 0, 0);
        createFauxDoor(warehouseDoors[0], warehouseDoors[1], 75, 750, undefined);
    }

    if (wnuenOutsideDoors[0].origin[0] < wnuenOutsideDoors[1].origin[0])
    {
        wnuenOutsideDoors[0].origin += (59, 0, 0);
        wnuenOutsideDoors[1].origin -= (59, 0, 0);
        createFauxDoor(wnuenOutsideDoors[1], wnuenOutsideDoors[0], 59, 750, undefined);
    }
    else
    {
        wnuenOutsideDoors[0].origin -= (59, 0, 0);
        wnuenOutsideDoors[1].origin += (59, 0, 0);
        createFauxDoor(wnuenOutsideDoors[0], wnuenOutsideDoors[1], 59, 750, undefined);
    }
    if (southCourtyardDoors[0].origin[0] < southCourtyardDoors[1].origin[0])
    {
        southCourtyardDoors[0].origin += (110, 0, 0);
        southCourtyardDoors[1].origin -= (110, 0, 0);
        createFauxDoor(southCourtyardDoors[1], southCourtyardDoors[0], 110, 1250, undefined, (262.233, -1980.79, 92.3884));
    }
    else
    {
        southCourtyardDoors[0].origin -= (110, 0, 0);
        southCourtyardDoors[1].origin += (110, 0, 0);
        createFauxDoor(southCourtyardDoors[0], southCourtyardDoors[1], 110, 1250, undefined, (262.233, -1980.79, 92.3884));
    }

    tpEastDoor.origin -= (120, 0, 0);
    createFauxDoor(tpEastDoor, undefined, 120, 1250, undefined);
}
watchPowerDoor()
{
    level waittill("power_activated");

    self playLoopSound("sentry_gun_hydraulics");
    self moveTo(self.origin - (0, 0, 80), 1);

    wait(1);

    self stopLoopSound();
}
createFauxDoor(doorModel, doorModel2, doorModelOffset, cost, altAxis, origin)
{
    if (!isDefined(origin))
        origin = doorModel.origin;
    fauxDoor = createDoor(origin, origin, (0, 0, 0), 0, 0, 150, cost);
    thread watchFauxDoor(fauxDoor, doorModel, doorModel2, doorModelOffset, altAxis);
}
watchFauxDoor(fauxDoor, doorModel, doorModel2, doorModelOffset, altAxis)
{
    level endon("game_ended");

    while(isDefined(fauxDoor))
    {
        wait(0.05);
    }

    if (isDefined(altAxis))
        doorModel moveTo(doorModel.origin + (0, doorModelOffset, 0), 1);
    else doorModel moveTo(doorModel.origin + (doorModelOffset, 0, 0), 1);
    doorModel playLoopSound("aiz_upgrade_loop");
    if (isDefined(doorModel2))
    {
        if (isDefined(altAxis))
            doorModel2 moveTo(doorModel2.origin - (0, doorModelOffset, 0), 1);
        else doorModel2 moveTo(doorModel2.origin - (doorModelOffset, 0, 0), 1);
        doorModel2 playLoopSound("aiz_upgrade_loop");
    }

    wait(1);

    doorModel stopLoopSound();
    if (isDefined(doorModel2)) doorModel2 stopLoopSound();
    doorModel playSound("aiz_upgrade_end");
    if (isDefined(doorModel2)) doorModel2 playSound("aiz_upgrade_end");
}
initTeleporters()
{
    level.teleportersAvailable = [];
    level.teleportersAvailable[0] = true;
    level.teleportersAvailable[1] = true;
    level.teleportersAvailable[2] = true;

    teleporter_1 = getEnt("trigger_teleport_pad_0", "targetname");
	teleporter_2 = getEnt("trigger_teleport_pad_1", "targetname");
	teleporter_3 = getEnt("trigger_teleport_pad_2", "targetname");

    if (isDefined(teleporter_1))
    {
        teleporter_1.isLinked = true;
        teleporter_1.state = 1;
        teleporter_1 addUsable("teleporter", 100);
        teleporter_1 thread teleporterThink();
    }
    if (isDefined(teleporter_2))
    {
        teleporter_2.isLinked = true;
        teleporter_2.state = 1;
        teleporter_2 addUsable("teleporter", 100);
        teleporter_2 thread teleporterThink();
    }
    if (isDefined(teleporter_3))
    {
        teleporter_3.isLinked = true;
        teleporter_3.state = 1;
        teleporter_3 addUsable("teleporter", 100);
        teleporter_3 thread teleporterThink();
    }
}
teleporterThink()
{
	self.is_cooldown = true;
	self playloopsound("emi_portal_lp_01");

	self thread cooldownHandler();

	while(true)
    {
		self waittill("trigger", user);

        if (distanceSquared(user.origin, self.origin) > 10000)
            continue;

        if (!level.powerActivated || self.is_cooldown)
            continue;

		foreach (player in level.players)
        {
            if (!player.isAlive) continue;
            if (player.sessionTeam != "allies") continue;
            if (distanceSquared(player.origin, self.origin) < 10000 && self.isAlive) player thread teleportPlayerDirect(self);
        }
	}
}
cooldownHandler()
{
	time = 30;

	while(isdefined(self))
    {
		if(isdefined(self.is_cooldown) && self.is_cooldown)
        {
            wait(time);

			self.is_cooldown = false;
			self.state = 0;
		}

		wait(0.05);
	}
}
teleportPlayerDirect(tele)
{
    tele.is_cooldown = true;
    tele.state = 1;

	self hide();
	self disableWeapons();

    selectedTeleporterIndex = 0;
    for (i = 0; i < 3; i++)
    {
        if (!level.teleportersAvailable[i])
            continue;

        selectedTeleporterIndex = i;
        break;
    }

    level.teleportersAvailable[selectedTeleporterIndex] = false;
	teleportRoom = getEnt("teleport_room_" + selectedTeleporterIndex, "targetname");
	self setOrigin(teleportRoom.origin);
	self setPlayerAngles(teleportRoom.angles);
	self freezeControls(true);
	self playLocalSound("teleport_2d");

	wait(3);
	
    if (isDefined(self))
    {
        baseTeleporter = getEnt("origin_teleport_player_" + selectedTeleporterIndex, "targetname");

        self show();
        self enableWeapons();
        self setOrigin(baseTeleporter.origin);
        self setPlayerAngles(baseTeleporter.angles);
        self freezeControls(false);
        self playSound("teleport_out");
    }

    level.teleportersAvailable[selectedTeleporterIndex] = true;
}
initWallBuys()
{
    spawnMapEditObject("wallweapon", (60, 542.75, 48), (0, 90, 0), "iw5_mk14_mp", 600);
    spawnMapEditObject("wallweapon", (-102.875, -526.65, 57), (0, 90, 0), "iw5_msr_mp_msrscope", 200);
    spawnMapEditObject("wallweapon", (-943.875, -172.121, 117.125), (0, 90, 0), "iw4_ranger_mp", 1200);
    spawnMapEditObject("wallweapon", (-760.916, -1023.87, 126.625), (0, 180, 0), "iw5_mp5_mp", 1200);
    spawnMapEditObject("wallweapon", (-1381.86, -752.125, 249.625), (0, 0, 0), "iw5_pp90m1_mp", 1000);
    spawnMapEditObject("wallweapon", (483.622, 30.125, 110.9997), (0, 0, 0), "iw4_m21_mp", 600);
    spawnMapEditObject("wallweapon", (717.625, 1036.51, 218.125), (0, 90, 0), "iw5_ump45_mp", 1000);
    spawnMapEditObject("wallweapon", (1056.88, -175.325, 114.125), (0, 90, 0), "iw5_spas12_mp", 1500);
    spawnMapEditObject("wallweapon", (-53.7097, -935.875, 114.125), (0, 180, 0), "iw5_fad_mp", 1500);
    spawnMapEditObject("wallweapon", (600.875, -3006.03, 206.125), (0, -90, 0), "iw5_ak47_mp", 1200);
    spawnMapEditObject("wallweapon", (1600.88, 977.874, 218.125), (0, 90, 0), "frag_grenade_mp", 250);
    spawnMapEditObject("wallweapon", (-27.125, -2435.64, 96.125), (0, 90, 0), "frag_grenade_mp", 250);
    spawnMapEditObject("wallweapon", (-1426.83, -509.401, 249.125), (0, 270, 0), "frag_grenade_mp", 250);
}
initLaptops()
{
    //TODO: add an EE here
    level.laptops = [];
    for (i = 18; i < 2000; i++)
    {
        ent = getEntByNum(i);
        if (!isDefined(ent)) continue;

        entModel = ent.model;
        if (!isDefined(entModel))
            continue;

        if (entModel == "intel_item_laptop")
            level.laptops[level.laptops.size] = ent;
    }

    foreach (laptop in level.laptops)
    {
        laptop thread watchLaptop();
    }
}
watchLaptop()
{
    self setCursorHint("HINT_NOICON");
    self setHintString(&"NULL_EMPTY");
    self makeUsable();

    self waittill("trigger");

    self playSound("intelligence_pickup");
    self hide();
    level.laptops = array_remove(level.laptops, self);
    if (level.laptops.size == 0)
    {
        playSoundAtPos((0, 0, 0), "aiz_bo_music_boa");
        level.musicPlaying = true;
    }

    wait(5);

    self delete();

    wait(280);

    level.musicPlaying = undefined;
}
initFaceIDs()
{
    level.fx_lightBlink = loadFX("misc/aircraft_light_red_blink");

    level.faceIDs = [];
    for (i = 18; i < 2000; i++)
    {
        ent = getEntByNum(i);
        if (!isDefined(ent)) continue;

        entModel = ent.model;
        if (!isDefined(entModel))
            continue;

        if (entModel == "codo_face_identification_machine_off")
        {
            level.faceIDs[level.faceIDs.size] = ent;
            ent.activated = false;
        }
    }

    level waittill("connected");

    first = randomInt(level.faceIDs.size);
    level.faceIDs[first] thread activateFaceID();
}
activateFaceID()
{
    light = spawn("script_model", self.origin);
    light setModel("tag_origin");
    light setCursorHint("HINT_NOICON");
    light setHintString(&"NULL_EMPTY");
    light makeUsable();

    wait(1);

    playFXOnTag(level.fx_lightBlink, light, "tag_origin");

    light waittill("trigger");

    self playSound("scrambler_pullout_lift_npc");

    level.faceIDs = array_remove(level.faceIDs, self);

    stopFXOnTag(level.fx_lightBlink, light, "tag_origin");

    light delete();

    if (level.faceIDs.size == 0)
    {
        foreach (player in level.players)
            player easterEgg_awardAllPerks();

        level.allPerks = true;

        return;
    }

    next = randomInt(level.faceIDs.size);
    level.faceIDs[next] thread activateFaceID();
}
initTraps()
{
    //TODO: make these functional?
    traps = getEntArray("zombie_trap", "targetname");
    foreach (trap in traps)
    {
        trapParts = getEntArray(trap.target, "targetname");
        foreach (trapPart in trapParts)
            trapPart delete();

        trap delete();
    }
}
cleanHeliEnts()
{
    escortChopper = getEnt("escort_chopper1_loop_start", "targetname");
    target = escortChopper.target;
    while (isDefined(target))
    {
        targetEnt = getEnt(target, "targetname");
        if (!isDefined(targetEnt))
            break;

        newTarget = targetEnt.target;
        targetEnt delete();
        target = newTarget;
    }

    escortChopper2 = getEnt("escort_chopper2_loop_start", "targetname");
    target = escortChopper2.target;
    while (isDefined(target))
    {
        targetEnt = getEnt(target, "targetname");
        if (!isDefined(targetEnt))
            break;

        newTarget = targetEnt.target;
        targetEnt delete();
        target = newTarget;
    }

    heliLoop = getEnt("heli_loop_start", "targetname");
    target = heliLoop.target;
    while (isDefined(target))
    {
        targetEnt = getEnt(target, "targetname");
        if (!isDefined(targetEnt))
            break;

        newTarget = targetEnt.target;
        targetEnt delete();
        target = newTarget;
    }

    heliStarts = getEntArray("heli_start", "targetname");
    foreach (heliStart in heliStarts)
    {
        target = heliStart.target;
        while (isDefined(target))
        {
            targetEnt = getEnt(target, "targetname");
            if (!isDefined(targetEnt))
                break;
                
            newTarget = targetEnt.target;
            targetEnt delete();
            target = newTarget;
        }
    }

    heliDest = getEnt("heli_dest", "targetname");
    target = heliDest.target;
    while (isDefined(target))
    {
        targetEnt = getEnt(target, "targetname");
        if (!isDefined(targetEnt))
            break;

        newTarget = targetEnt.target;
        targetEnt delete();
        target = newTarget;
    }
}
initNewAdditions()
{
    bank = spawn("script_origin", (1259.08, 808.125, 176.125));
    bank addUsable("bank", 75);

    killstreak = spawn("script_origin", (-798.884, -1440.03, 200.462));
    curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();
    objective_add(curObjID, "invisible", (0, 0, 0));
    objective_position(curObjId, killstreak.origin);
    objective_team(curObjID, "allies");
    objective_state(curObjId, "active");
    objective_icon(curObjId, "cardicon_aircraft_01");
    killstreak addUsable("killstreak", 100);

    gambler = spawn("script_origin", (-304.596, -2322.97, 170));
    curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();
    objective_add(curObjID, "invisible", (0, 0, 0));
    objective_position(curObjId, gambler.origin);
    objective_team(curObjID, "allies");
    objective_state(curObjId, "active");
    objective_icon(curObjId, "cardicon_8ball");
    laptop = spawn("script_model", gambler.origin + (0, 0, 22));
    laptop.angles = (0, 90, 0);
    laptop setModel("com_laptop_2_open");
    gambler.laptop = laptop;
    gambler.gamblerInUse = false;
    laptop thread rotateEntity();
    gambler addUsable("gambler", 75);
}