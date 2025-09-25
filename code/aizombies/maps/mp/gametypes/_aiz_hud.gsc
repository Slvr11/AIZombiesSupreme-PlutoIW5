#include maps\mp\gametypes\_aiz;
#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

init()
{
    level.EMPTime = 0;
    level.perkDescs = [];
    for (i = 102; i < 110; i++)
    {
        level.perkDescs[i - 102] = level.gameStrings[i];
    }
    level.powerBox = false;
    level.killHud = false;
    level.doubleHud = false;

    level.roundHud = undefined;
    level.zombieCounterHud = undefined;
    level.powerup1Hud = undefined;
    level.powerup2Hud = undefined;
    //level.infoHud = undefined;
    level.intermissionHud = undefined;
    level.roundStartHud = undefined;
    level.roundEndHud = undefined;
    level.powerHud = undefined;

    //Voting
    level.mapList = [];
    currentIndex = 0;
    level.mapList[currentIndex] = "mp_alpha";
	currentIndex++;
    level.mapList[currentIndex] = "mp_bootleg";
	currentIndex++;
    level.mapList[currentIndex] = "mp_bravo";
	currentIndex++;
    level.mapList[currentIndex] = "mp_carbon";
	currentIndex++;
    level.mapList[currentIndex] = "mp_dome";
	currentIndex++;
    level.mapList[currentIndex] = "mp_exchange";
	currentIndex++;
    level.mapList[currentIndex] = "mp_hardhat";
	currentIndex++;
    level.mapList[currentIndex] = "mp_interchange";
	currentIndex++;
    level.mapList[currentIndex] = "mp_lambeth";
	currentIndex++;
    level.mapList[currentIndex] = "mp_mogadishu";
	currentIndex++;
    level.mapList[currentIndex] = "mp_paris";
	currentIndex++;
    level.mapList[currentIndex] = "mp_plaza2";
	currentIndex++;
    level.mapList[currentIndex] = "mp_radar";
	currentIndex++;
    level.mapList[currentIndex] = "mp_seatown";
	currentIndex++;
    level.mapList[currentIndex] = "mp_underground";
	currentIndex++;
    level.mapList[currentIndex] = "mp_village";
	currentIndex++;
    level.mapList[currentIndex] = "mp_italy";
	currentIndex++;
    level.mapList[currentIndex] = "mp_park";
	currentIndex++;
    level.mapList[currentIndex] = "mp_morningwood";
	currentIndex++;
    level.mapList[currentIndex] = "mp_overwatch";
	currentIndex++;
    level.mapList[currentIndex] = "mp_aground_ss";
	currentIndex++;
    level.mapList[currentIndex] = "mp_courtyard_ss";
	currentIndex++;
    level.mapList[currentIndex] = "mp_cement";
	currentIndex++;
    level.mapList[currentIndex] = "mp_hillside_ss";
	currentIndex++;
    level.mapList[currentIndex] = "mp_meteora";
	currentIndex++;
    level.mapList[currentIndex] = "mp_qadeem";
	currentIndex++;
    level.mapList[currentIndex] = "mp_restrepo_ss";
	currentIndex++;
    level.mapList[currentIndex] = "mp_terminal_cls";
	currentIndex++;
    level.mapList[currentIndex] = "mp_crosswalk_ss";
	currentIndex++;
    level.mapList[currentIndex] = "mp_six_ss";
	currentIndex++;
    level.mapList[currentIndex] = "mp_burn_ss";
	currentIndex++;
    level.mapList[currentIndex] = "mp_shipbreaker";
	currentIndex++;
    level.mapList[currentIndex] = "mp_roughneck";
	currentIndex++;
    level.mapList[currentIndex] = "mp_nola";
	currentIndex++;
    level.mapList[currentIndex] = "mp_moab";
    currentIndex++;
    level.mapList[currentIndex] = "mp_boardwalk";
    //level.mapSelection = 0;
    level.mapVotes = [];
    for (i = 0; i < 3; i++)
    {
        level.mapVotes[i] = 0;
    }
    level.mapLists = [];
    for (i = 0; i < 3; i++)
    {
        level.mapLists[i] = 0;
    }
    level.votingFinished = false;

    //Classic maps
    level.classicMaps = [];
    level.classicMaps[level.classicMaps.size] = "mp_afghan";
    level.classicMaps[level.classicMaps.size] = "mp_boneyard";
    level.classicMaps[level.classicMaps.size] = "mp_brecourt";
    level.classicMaps[level.classicMaps.size] = "mp_checkpoint";
    level.classicMaps[level.classicMaps.size] = "mp_derail";
    level.classicMaps[level.classicMaps.size] = "mp_estate";
    level.classicMaps[level.classicMaps.size] = "mp_favela";
    level.classicMaps[level.classicMaps.size] = "mp_highrise";
    level.classicMaps[level.classicMaps.size] = "mp_invasion";
    level.classicMaps[level.classicMaps.size] = "mp_nightshift";
    level.classicMaps[level.classicMaps.size] = "mp_quarry";
    level.classicMaps[level.classicMaps.size] = "mp_rundown";
    level.classicMaps[level.classicMaps.size] = "mp_rust";
    level.classicMaps[level.classicMaps.size] = "mp_subbase";
    //level.classicMaps[level.classicMaps.size] = "mp_terminal";
    level.classicMaps[level.classicMaps.size] = "mp_underpass";
    level.classicMaps[level.classicMaps.size] = "mp_overgrown";
    level.classicMaps[level.classicMaps.size] = "mp_trailerpark";
    level.classicMaps[level.classicMaps.size] = "mp_compact";
    level.classicMaps[level.classicMaps.size] = "mp_strike_sh";//SH is the only current port of Strike
    level.classicMaps[level.classicMaps.size] = "mp_complex";
    level.classicMaps[level.classicMaps.size] = "mp_abandon";
    level.classicMaps[level.classicMaps.size] = "mp_vacant";
    level.classicMaps[level.classicMaps.size] = "mp_storm";
    level.classicMaps[level.classicMaps.size] = "mp_fuel2";
    level.classicMaps[level.classicMaps.size] = "mp_crash";
    level.classicMaps[level.classicMaps.size] = "mp_nuked";
    level.classicMaps[level.classicMaps.size] = "mp_cross_fire";

    level.classicMapNames = [];
    level.classicMapNames[level.classicMapNames.size] = &"Afghan";
    level.classicMapNames[level.classicMapNames.size] = &"Scrapyard";
    level.classicMapNames[level.classicMapNames.size] = &"Wasteland";
    level.classicMapNames[level.classicMapNames.size] = &"Karachi";
    level.classicMapNames[level.classicMapNames.size] = &"Derail";
    level.classicMapNames[level.classicMapNames.size] = &"Estate";
    level.classicMapNames[level.classicMapNames.size] = &"Favela";
    level.classicMapNames[level.classicMapNames.size] = &"Highrise";
    level.classicMapNames[level.classicMapNames.size] = &"Invasion";
    level.classicMapNames[level.classicMapNames.size] = &"Skidrow";
    level.classicMapNames[level.classicMapNames.size] = &"Quarry";
    level.classicMapNames[level.classicMapNames.size] = &"Rundown";
    level.classicMapNames[level.classicMapNames.size] = &"Rust";
    level.classicMapNames[level.classicMapNames.size] = &"Sub Base";
    //level.classicMapNames[level.classicMapNames.size] = &"Terminal (MW2)";
    level.classicMapNames[level.classicMapNames.size] = &"Underpass";
    level.classicMapNames[level.classicMapNames.size] = &"Overgrown";
    level.classicMapNames[level.classicMapNames.size] = &"Trailer Park";
    level.classicMapNames[level.classicMapNames.size] = &"Salvage";
    level.classicMapNames[level.classicMapNames.size] = &"Strike";
    level.classicMapNames[level.classicMapNames.size] = &"Bailout";
    level.classicMapNames[level.classicMapNames.size] = &"Carnival";
    level.classicMapNames[level.classicMapNames.size] = &"Vacant";
    level.classicMapNames[level.classicMapNames.size] = &"Storm";
    level.classicMapNames[level.classicMapNames.size] = &"Fuel";
    level.classicMapNames[level.classicMapNames.size] = &"Crash";
    level.classicMapNames[level.classicMapNames.size] = &"Nuketown";
    level.classicMapNames[level.classicMapNames.size] = &"Crossfire";

    level.wawMaps = [];
    level.wawMaps[level.wawMaps.size] = "mp_factory_sh";
    level.wawMaps[level.wawMaps.size] = "mp_base";

    level.wawMapNames = [];
    level.wawMapNames[level.wawMapNames.size] = &"Der Riese";
    level.wawMapNames[level.wawMapNames.size] = &"Nacht Der Untoten";
}

createPlayerHud()
{
    if (isDefined(self.aizHud_created)) return;

    //Ammo counters
    ammoSlash = self createFontString("hudsmall", 1);
    ammoSlash setPoint("BOTTOM RIGHT", "BOTTOM RIGHT", -150, -28);
    ammoSlash.hideWhenInMenu = true;
    ammoSlash.hideWhenDead = true;
    ammoSlash.archived = true;
    ammoSlash.lowResBackground = true;
    ammoSlash.alignX = "left";
    ammoSlash.alpha = 1;
    ammoSlash setText(&"MP_SLASH");
    ammoSlash.sort = 0;

    ammoStock = self createFontString("hudsmall", 1);
    ammoStock setParent(ammoSlash);
    ammoStock setPoint("BOTTOM LEFT", "BOTTOM LEFT", 8, 0);
    ammoStock.hideWhenInMenu = true;
    ammoStock.hideWhenDead = true;
    ammoStock.archived = true;
    ammoStock setValue(0);
    ammoStock.sort = 0;

    ammoClip = self createFontString("hudbig", 1);
    ammoClip setParent(ammoSlash);
    ammoClip setPoint("RIGHT", "RIGHT", -5, -4);
    ammoClip.hideWhenInMenu = true;
    ammoClip.hideWhenDead = true;
    ammoClip.archived = true;
    ammoClip setValue(0);
    ammoClip.sort = 0;

    weaponName = self createFontString("hudsmall", 1);
    weaponName setPoint("BOTTOM RIGHT", "BOTTOM RIGHT", -140, -8);
    weaponName.hideWhenInMenu = true;
    weaponName.hideWhenDead = true;
    weaponName.archived = true;
    weaponName.alpha = 1;
    weaponName setText(&"NULL_EMPTY");
    weaponName.sort = 0;
    

    //Set player fields for ammo hud
    self.hud_ammoSlash = ammoSlash;
    self.hud_ammoStock = ammoStock;
    self.hud_ammoClip = ammoClip;
    self.hud_weaponName = weaponName;

    //Item divider
    divider = self createIcon("hud_iw5_divider", 200, 24);
    divider setPoint("BOTTOMRIGHT", "BOTTOMRIGHT", -67, -20);
    divider.hideWhenInMenu = true;
    divider.hideWhenDead = true;
    divider.alpha = 1;
    divider.archived = true;
    self.hud_divider = divider;
    divider.sort = 1;

    //grenade icon
    frag = self createIcon("hud_us_grenade", 16, 16);
    frag setPoint("BOTTOMRIGHT", "BOTTOMRIGHT", -70, -25);
    frag.hideWhenInMenu = true;
    frag.hideWhenDead = true;
    frag.alpha = 1;
    frag.archived = false;
    self.hud_frag = frag;
    frag.sort = 1;

    //lightstick icon
    lightstick = self createIcon("specialty_tacticalinsertion", 16, 16);
    lightstick setPoint("BOTTOMRIGHT", "BOTTOMRIGHT", -50, -25);
    lightstick.hideWhenInMenu = true;
    lightstick.hideWhenDead = true;
    lightstick.alpha = 1;
    lightstick.archived = false;
    self.hud_lightstick = lightstick;
    lightstick.sort = 1;

    //Hitmarker
    /*
    hitFeedback = newClientHudElem(self);
    hitFeedback.horzAlign = "center";
    hitFeedback.vertAlign = "middle";
    hitFeedback.X = -12;
    hitFeedback.Y = -12;
    hitFeedback.alpha = 0;
    hitFeedback.archived = true;
    hitFeedback.hideWhenDead = false;
    hitFeedback setShader("damage_feedback", 24, 48);
    hitFeedback.sort = 2;
    self.hud_damageFeedback = hitFeedback;
    */

    //Perk hud
    jugg = self createIcon("white", 30, 30);
    jugg setPoint("BOTTOM LEFT", "BOTTOM LEFT", 5, -54);
    jugg.hideWhenInMenu = true;
    jugg.hideWhenDead = true;
    jugg.foreground = true;
    jugg.archived = true;
    jugg.alpha = 0;
    jugg.sort = 3;

    stamina = self createIcon("white", 30, 30);
    stamina setParent(jugg);
    stamina setPoint("CENTER RIGHT", "CENTER RIGHT", 32, 0);
    stamina.hideWhenInMenu = true;
    stamina.hideWhenDead = true;
    stamina.foreground = true;
    stamina.archived = true;
    stamina.alpha = 0;
    stamina.sort = 4;

    speed = self createIcon("white", 30, 30);
    speed setParent(jugg);
    speed setPoint("CENTER RIGHT", "CENTER RIGHT", 64, 0);
    speed.hideWhenInMenu = true;
    speed.hideWhenDead = true;
    speed.foreground = true;
    speed.archived = true;
    speed.alpha = 0;
    speed.sort = 5;

    mulekick = self createIcon("white", 30, 30);
    mulekick setParent(jugg);
    mulekick setPoint("CENTER RIGHT", "CENTER RIGHT", 96, 0);
    mulekick.hideWhenInMenu = true;
    mulekick.hideWhenDead = true;
    mulekick.foreground = true;
    mulekick.archived = true;
    mulekick.alpha = 0;
    mulekick.sort = 6;

    dtap = self createIcon("white", 30, 30);
    dtap setParent(jugg);
    dtap setPoint("CENTER RIGHT", "CENTER RIGHT", 128, 0);
    dtap.hideWhenInMenu = true;
    dtap.hideWhenDead = true;
    dtap.foreground = true;
    dtap.archived = true;
    dtap.alpha = 0;
    dtap.sort = 7;

    stalker = self createIcon("white", 30, 30);
    stalker setParent(jugg);
    stalker setPoint("CENTER RIGHT", "CENTER RIGHT", 160, 0);
    stalker.hideWhenInMenu = true;
    stalker.hideWhenDead = true;
    stalker.foreground = true;
    stalker.archived = true;
    stalker.alpha = 0;
    stalker.sort = 8;

    perk7 = self createIcon("white", 40, 40);
    perk7 setPoint("BOTTOM MIDDLE", "BOTTOM MIDDLE", 400, -5);
    perk7.hideWhenInMenu = true;
    perk7.hideWhenDead = true;
    perk7.foreground = true;
    perk7.archived = true;
    perk7.alpha = 0;
    perk7.sort = 9;

    //Score hud
    scoreHud = self createFontString("hudsmall", 1);
    scoreHud setPoint("TOP LEFT", "TOP LEFT", 660, 10);
    scoreHud.hideWhenInMenu = true;
    scoreHud.foreground = true;
    scoreHud.archived = true;
    scoreHud.alpha = 1;
    scoreHud.color = (0, 0.9, 0);
    scoreHud.glowColor = (0, 0.9, 0);
    scoreHud.glowAlpha = 0.5;
    scoreHud.label = level.gameStrings[180];
    scoreHud setValue(self.cash);
    scoreHud.sort = 10;

    pointHud = self createFontString("hudsmall", 1);
    pointHud setPoint("TOP LEFT", "TOP LEFT", 660, 24);
    pointHud.hideWhenInMenu = true;
    pointHud.foreground = true;
    pointHud.archived = true;
    pointHud.alpha = 1;
    if (level._mapname == "mp_base")
        pointHud.alpha = 0;
    pointHud.color = (0, 0.85, 0.85);
    pointHud.glowColor = (0, 0.85, 0.85);
    pointHud.glowAlpha = 0.5;
    pointHud.label = level.gameStrings[181];
    pointHud setValue(self.points);

    //Score popups
    scorePop = self createFontString("hudsmall", 1.5);
    scorePop setPoint("BOTTOMCENTER", "BOTTOMCENTER", 0, -75);
    scorePop.hideWhenInMenu = true;
    scorePop.archived = true;
    scorePop.alpha = 1;
    scorePop.glowAlpha = 0.3;
    scorePop.addScore = 0;
    scorePop.sort = 15;

    scoreLine = self createIcon("line_horizontal", 192, 2);
    scoreLine setPoint("BOTTOMCENTER", "BOTTOMCENTER", 0, -76);
    scoreLine.hideWhenInMenu = true;
    scoreLine.archived = false;
    scoreLine.alpha = 0;
    scoreLine.sort = 15;

    scoreMessage = self createFontString("hudsmall", 1);
    //scoreMessage = GetHudElem(65538);
    scoreMessage setPoint("BOTTOMCENTER", "BOTTOMCENTER", 0, -60);
    scoreMessage.hideWhenInMenu = true;
    scoreMessage.archived = true;
    scoreMessage.alpha = 1;
    scoreMessage.glowColor = (0, 0.65, 1);
    scoreMessage.glowAlpha = 0.3;
    scoreMessage.sort = 15;

    //Streaklist
    killstreakSlots = [];
    killstreakSlots[0] = self createFontString("hudsmall", 1);
    killstreakSlots[0] setPoint("BOTTOM RIGHT", "BOTTOM RIGHT", -50, -150);
    killstreakSlots[0].alignX = "right";
    killstreakSlots[0].hideWhenInMenu = true;
    killstreakSlots[0].hideWhenDead = true;
    killstreakSlots[0].archived = true;
    killstreakSlots[0].alpha = 0;
    killstreakSlots[0].label = &"[{+actionslot 4}]  ";
    killstreakSlots[0].sort = 16;
    killstreakSlots[1] = self createFontString("hudsmall", 1);
    killstreakSlots[1] setPoint("BOTTOM RIGHT", "BOTTOM RIGHT", -50, -125);
    killstreakSlots[1].alignX = "right";
    killstreakSlots[1].hideWhenInMenu = true;
    killstreakSlots[1].hideWhenDead = true;
    killstreakSlots[1].archived = true;
    killstreakSlots[1].alpha = 0;
    killstreakSlots[1].label = &"[{+actionslot 5}]  ";
    killstreakSlots[1].sort = 16;
    killstreakSlots[2] = self createFontString("hudsmall", 1);
    killstreakSlots[2] setPoint("BOTTOM RIGHT", "BOTTOM RIGHT", -50, -100);
    killstreakSlots[2].alignX = "right";
    killstreakSlots[2].hideWhenInMenu = true;
    killstreakSlots[2].hideWhenDead = true;
    killstreakSlots[2].archived = true;
    killstreakSlots[2].alpha = 0;
    killstreakSlots[2].label = &"[{+actionslot 6}]  ";
    killstreakSlots[2].sort = 16;
    killstreakSlots[3] = self createFontString("hudsmall", 1);
    killstreakSlots[3] setPoint("BOTTOM RIGHT", "BOTTOM RIGHT", -50, -75);
    killstreakSlots[3].alignX = "right";
    killstreakSlots[3].hideWhenInMenu = true;
    killstreakSlots[3].hideWhenDead = true;
    killstreakSlots[3].archived = true;
    killstreakSlots[3].alpha = 0;
    killstreakSlots[3].label = &"[{+actionslot 7}]  ";
    killstreakSlots[3].sort = 16;

    //usables message
    //message = self createFontString("default", 1.6);
    //message setPoint("CENTER", "CENTER", 0, 110);
    //message.hideWhenInMenu = true;
    //message.hideWhenDead = true;
    //message.foreground = true;
    //message.alpha = 0;
    //message.archived = true;
    //message.sort = 20;
    //self.hud_message = message;
    self.hasMessageUp = false;

    //Finish out player fields
    self.hud_perks = [];
    self.hud_perks[0] = jugg;
    self.hud_perks[1] = stamina;
    self.hud_perks[2] = speed;
    self.hud_perks[3] = mulekick;
    self.hud_perks[4] = dtap;
    self.hud_perks[5] = stalker;
    self.hud_perks[6] = perk7;
    self.hud_scorePop = scorePop;
    self.hud_scoreLine = scoreLine;
    self.hud_score = scoreHud;
    self.hud_point = pointHud;
    self.hud_scoreMessage = scoreMessage;
    self.hud_killstreakSlots = killstreakSlots;
    //self.hud_zombieCounter = zombieCounter;
    //self.hud_round = round;
    self.aizHud_created = true;

    //Update our ammo counters
    //self updateAmmoHud(true);
}
updateKillstreakSlotBindText()
{
    if (!isDefined(self.aizHud_created))
        return;

    killstreakSlots = self.hud_killstreakSlots;

    if (self maps\mp\gametypes\_aiz_external_utils::isUsingGamepad())
    {
        killstreakSlots[0].label = &"[{+actionslot 1}]  ";
        killstreakSlots[1].label = &"[{+actionslot 3}]  ";
        killstreakSlots[2].label = &"[{+actionslot 4}]  ";
        killstreakSlots[3].label = &"[{+actionslot 2}]  ";
    }
    else
    {
        killstreakSlots[0].label = &"[{+actionslot 4}]  ";
        killstreakSlots[1].label = &"[{+actionslot 5}]  ";
        killstreakSlots[2].label = &"[{+actionslot 6}]  ";
        killstreakSlots[3].label = &"[{+actionslot 7}]  ";
    }
}

createServerHud()
{
    round = newHudElem();
    round.elemType = "font";
	round.font = "hudsmall";
	round.fontscale = 2;
	round.baseFontScale = 2;
	round.x = 5;
	round.y = 0;
	round.width = 0;
	round.height = 24;
	round.xOffset = 0;
	round.yOffset = 0;
	round.children = [];
	round.parent = level.uiParent;
	round.hidden = false;
    //round setPoint("BOTTOM LEFT", "BOTTOM LEFT", 10, -5);
    round.alignX = "left";
    round.alignY = "bottom";
    round.horzAlign = "left_adjustable";
    round.vertAlign = "bottom_adjustable";
    round.hideWhenInMenu = false;
    round.archived = true;
    //round setText("^1ERROR");
    round.glowAlpha = 0.9;
    round.glowColor = (0.5, 0, 0);
    round.color = (0.9, 0, 0);
    round setValue(level.wave);
    round.sort = 13;
    round.lowResBackground = false;
    level.roundHud = round;

    zombieCounter = newHudElem();
    zombieCounter.elemType = "font";
	zombieCounter.font = "hudsmall";
	zombieCounter.fontscale = 1.3;
	zombieCounter.baseFontScale = 1.3;
	zombieCounter.x = 50;
	zombieCounter.y = -5;
	zombieCounter.width = 0;
	zombieCounter.height = 16;
	zombieCounter.xOffset = 0;
	zombieCounter.yOffset = 0;
	zombieCounter.children = [];
	zombieCounter.parent = level.uiParent;
	zombieCounter.hidden = false;
    //zombieCounter setPoint("BOTTOM LEFT", "BOTTOM LEFT", 80, -15);
    zombieCounter.alignX = "left";
    zombieCounter.alignY = "bottom";
    zombieCounter.horzAlign = "left_adjustable";
    zombieCounter.vertAlign = "bottom_adjustable";
    zombieCounter.hideWhenInMenu = false;
    zombieCounter.archived = true;
    zombieCounter.color = (1, 0.5, 0);
    zombieCounter.alpha = 1;
    zombieCounter.label = level.gameStrings[182];
    zombieCounter setValue(0);
    zombieCounter.sort = 14;
    level.zombieCounterHud = zombieCounter;
    level thread watchZombieCounter();

    while (!isDefined(level.isHellMap))
    {
        wait(0.05);
    }

    if (!level.isHellMap)
    {
        powerHud = newHudElem();
        if (!isDefined(powerHud))
            return;
        powerHud.elemType = "font";
        powerHud.font = "hudsmall";
        powerHud.fontscale = 1;
        powerHud.baseFontScale = 1;
        powerHud.x = 0;
        powerHud.y = 40;
        powerHud.width = 0;
        powerHud.height = 12;
        powerHud.xOffset = 0;
        powerHud.yOffset = 0;
        powerHud.children = [];
        powerHud.parent = level.uiParent;
        powerHud.hidden = false;
        //powerHud setPoint("TOP RIGHT", "TOP RIGHT", 0, 30);
        powerHud.alignX = "right";
        powerHud.alignY = "top";
        powerHud.horzAlign = "right_adjustable";
        powerHud.vertAlign = "top_adjustable";
        powerHud.hideWhenInMenu = true;
        powerHud.foreground = true;
        powerHud.archived = true;
        powerHud.alpha = 1;
        powerHud.color = (0.9, 0, 0);
        powerHud.label = level.gameStrings[183];
        powerHud.sort = 12;
        level.powerHud = powerHud;
    }
}

watchZombieCounter()
{
    level endon("game_ended");

    while (true)
    {
        level waittill_any("bot_spawned", "bot_death");

        updateZombieCounter();
    }
}
updateZombieCounter()
{
    level.zombieCounterHud setValue(level.botsInPlay.size);
}

onRoundChange()
{
    level.roundHud fadeOverTime(1);
    level.roundHud.alpha = 0;
    foreach (player in level.players)
    {
        if (!player.isAlive || !isDefined(player.isDown)) continue;
        player.gamblerReady = 1;
        player giveMaxAmmo("frag_grenade_mp");
        if (player hasWeapon("lightstick_mp")) player giveMaxAmmo("lightstick_mp");
        player updateAmmoHud(false);
    }

    wait(1);

    level thread roundStartHud();
    level.roundHud setValue(level.wave);
    level.roundHud fadeOverTime(1);
    level.roundHud.alpha = 1;
}

destroyPlayerHud()
{
    if (!isDefined(self.aizHud_created)) return;
    aizHUDs = [];
    aizHUDs[aizHUDs.size] = self.hud_ammoSlash;
    aizHUDs[aizHUDs.size] = self.hud_ammoStock;
    aizHUDs[aizHUDs.size] = self.hud_ammoClip;
    aizHUDs[aizHUDs.size] = self.hud_perks[0];
    aizHUDs[aizHUDs.size] = self.hud_perks[1];
    aizHUDs[aizHUDs.size] = self.hud_perks[2];
    aizHUDs[aizHUDs.size] = self.hud_perks[3];
    aizHUDs[aizHUDs.size] = self.hud_perks[4];
    aizHUDs[aizHUDs.size] = self.hud_perks[5];
    aizHUDs[aizHUDs.size] = self.hud_perks[6];
    aizHUDs[aizHUDs.size] = self.hud_score;
    aizHUDs[aizHUDs.size] = self.hud_scorePop;
    aizHUDs[aizHUDs.size] = self.hud_scoreLine;
    aizHUDs[aizHUDs.size] = self.hud_scoreMessage;
    aizHUDs[aizHUDs.size] = self.hud_point;
    aizHUDs[aizHUDs.size] = self.hud_divider;
    aizHUDs[aizHUDs.size] = self.hud_weaponName;
    //aizHUDs[aizHUDs.size] = self.hud_damageFeedback;
    //aizHUDs[aizHUDs.size] = self.hud_message;
    aizHUDs[aizHUDs.size] = self.hud_frag;
    aizHUDs[aizHUDs.size] = self.hud_lightstick;
    aizHUDs[aizHUDs.size] = self.hud_killstreakSlots[0];
    aizHUDs[aizHUDs.size] = self.hud_killstreakSlots[1];
    aizHUDs[aizHUDs.size] = self.hud_killstreakSlots[2];
    aizHUDs[aizHUDs.size] = self.hud_killstreakSlots[3];

    foreach (hud in aizHUDs)
    {
        //hud reset();
        if (!isDefined(hud)) continue;
        hud destroy();
    }
    if (isDefined(self.hud_ammoClipAkimbo))
    {
        self.hud_ammoClipAkimbo destroy();
        self.hud_ammoClipAkimbo = undefined;
    }

    self.hud_ammoSlash = undefined;
    self.hud_ammoStock = undefined;
    self.hud_ammoClip = undefined;
    self.hud_perks = [];
    self.hud_perks[0] = undefined;
    self.hud_perks[1] = undefined;
    self.hud_perks[2] = undefined;
    self.hud_perks[3] = undefined;
    self.hud_perks[4] = undefined;
    self.hud_perks[5] = undefined;
    self.hud_perks[6] = undefined;
    self.hud_scorePop = undefined;
    self.hud_scoreLine = undefined;
    self.hud_scoreMessage  = undefined;
    self.hud_score = undefined;
    self.hud_point = undefined;
    self.hud_divider = undefined;
    self.hud_weaponName = undefined;
    //self.hud_damageFeedback = undefined;
    //self.hud_message = undefined;
    self.hud_frag = undefined;
    self.hud_lightstick = undefined;
    self.hud_killstreakSlots = undefined;
    self.aizHud_created = undefined;
}
destroyGameHud()
{
	// free up some hud elems so we have enough for other things.
	
	// perk icons
	if (isdefined(self.perkicon))
	{
		if (isdefined(self.perkicon[0]))
		{
			self.perkicon[0] destroyElem();
			self.perkname[0] destroyElem();
		}
		if (isdefined(self.perkicon[1]))
		{
			self.perkicon[1] destroyElem();
			self.perkname[1] destroyElem();
		}
		if (isdefined(self.perkicon[2]))
		{
			self.perkicon[2] destroyElem();
			self.perkname[2] destroyElem();
		}
	}
	self notify("perks_hidden"); // stop any threads that are waiting to hide the perk icons
	
	// progress bar
	if (isDefined(self.proxBar))
		self.proxBar destroyElem();
	if (isDefined(self.proxBarText))
		self.proxBarText destroyElem();
    //XP popups
    if (isDefined(self.hud_xpPointsPopup))
        self.hud_xpPointsPopup destroy();
    if (isDefined(self.hud_xpEventPopup))
        self.hud_xpEventPopup destroy();
}

updateAmmoHud(updateName, newWeapon)
{
    if (!isDefined(self.aizHud_created) || (isDefined(self.aizHud_created) && !self.aizHud_created))
        return;

    ammoStock = self.hud_ammoStock;
    ammoClip = self.hud_ammoClip;
    ammoSlash = self.hud_ammoSlash;
    weapon = self getCurrentWeapon();
    if (isDefined(newWeapon)) weapon = newWeapon;

    if (self getWeaponAmmoClip("frag_grenade_mp") > 0)
        self.hud_frag.alpha = 1;
    else self.hud_frag.alpha = 0;
    if (self getWeaponAmmoClip("lightstick_mp") > 0)
        self.hud_lightstick.alpha = 1;
    else self.hud_lightstick.alpha = 0;

    if (isSpecialWeapon(weapon) || isWeaponDeathMachine(weapon))
    {
        ammoStock.alpha = 0;
        ammoClip.alpha = 0;
        ammoSlash.alpha = 0;
        if (isDefined(self.hud_ammoClipAkimbo))
        {
            self.hud_ammoClipAkimbo destroy();
            self.hud_ammoClipAkimbo = undefined;
        }
    }
    else
    {
        /*
        if (weapon == "thundergun_mp")
        {
            ammoStock setValue(self getWeaponAmmoStock(weapon));
            ammoClip setValue(self.thundergun_clip);
        }
        else if (weapon == "thundergunupgraded_mp")
        {
            ammoStock setValue(self.zeus_stock);
            //ammoStock setValue(self getWeaponAmmoStock(weapon));
            ammoClip setValue(self.zeus_clip);
        }
        */
        ammoStock setValue(self getWeaponAmmoStock(weapon));
        ammoClip setValue(self getWeaponAmmoClip(weapon));

        ammoStock.alpha = 1;
        ammoClip.alpha = 1;
        ammoSlash.alpha = 1;

        if (weaponIsAkimbo(weapon))
        {
            leftAmmo = self getWeaponAmmoClip(weapon, "left");
            if (!isDefined(self.hud_ammoClipAkimbo))
            {
                ammoClipAkimbo = self createFontString("hudbig", 1);
                ammoClipAkimbo setParent(ammoSlash);
                ammoClipAkimbo setPoint("RIGHT", "RIGHT", -35, -4);
                ammoClipAkimbo.hideWhenInMenu = true;
                ammoClipAkimbo.hideWhenDead = true;
                ammoClipAkimbo.archived = false;
                ammoClipAkimbo.label = level.gameStrings[15];
                ammoClipAkimbo setValue(leftAmmo);
                ammoClipAkimbo.sort = 0;
                ammoClipAkimbo.alpha = 1;
                self.hud_ammoClipAkimbo = ammoClipAkimbo;
            }

            self.hud_ammoClipAkimbo setValue(leftAmmo);
        }
        else if (isDefined(self.hud_ammoClipAkimbo))
        {
            self.hud_ammoClipAkimbo destroy();
            self.hud_ammoClipAkimbo = undefined;
        }
    }

    if (updateName) self thread updateWeaponName(weapon);
}

updateWeaponName(weapon)
{
    self notify("update_weapon_name_hud");

    self endon("disconnect");
    self endon("update_weapon_name_hud");

    if (!isDefined(self.aizHud_created)) return;

    weaponName = self.hud_weaponName;
    weaponName.alpha = 1;
    weaponName setText(getWeaponName(weapon));
    weaponName.color = getWeaponNameColor(weapon);

    wait(1);

    weaponName fadeOverTime(1);
    weaponName.alpha = 0;
}

getWeaponName(weapon)
{
    weapon = trimWeaponScope(weapon);

    switch (weapon)
    {
        case "iw5_usp45_mp":
        case "iw4_usp_mp":
            return &"WEAPON_USP";
        case "iw4_beretta_mp":
            return &"WEAPON_BERETTA";
        case "iw5_usp45_mp_akimbo_silencer02":
        case "iw4_berettaupgraded_mp":
            return &"WEAPON_MUSTANG_SALLY";
        case "iw5_p99_mp":
            return level.localizedWeaponNames[14];
        case "iw5_p99_mp_tactical_xmags":
            return &"WEAPON_P99_UPGRADE";
        case "iw5_fnfiveseven_mp":
            return level.localizedWeaponNames[15];
        case "iw5_fnfiveseven_mp_akimbo_xmags":
            return &"WEAPON_FIVESEVEN_UPGRADE";
        case "iw5_deserteagle_mp":
            return level.localizedWeaponNames[2];
        case "iw5_deserteagle_mp_silencer02_xmags":
            return &"WEAPON_DESERTEAGLE_UPGRADE";
        case "iw5_mp412_mp":
            return level.localizedWeaponNames[1];
        case "iw5_mp412jugg_mp_xmags":
            return &"WEAPON_MP412_UPGRADE";
        case "iw5_44magnum_mp":
            return level.localizedWeaponNames[16];
        case "iw5_44magnum_mp_akimbo_xmags":
            return &"WEAPON_ANACONDA_UPGRADE";
        case "iw5_fmg9_mp":
            return level.localizedWeaponNames[17];
        case "iw5_fmg9_mp_akimbo_xmags":
            return &"WEAPON_FMG9_UPGRADE";
        case "iw5_g18_mp":
            return level.localizedWeaponNames[18];
        case "iw5_g18_mp_akimbo_xmags":
            return &"WEAPON_GLOCK_18_UPGRADE";
        case "iw5_skorpion_mp":
            return level.localizedWeaponNames[12];
        case "iw5_skorpion_mp_akimbo_xmags":
            return &"WEAPON_SKORPION_UPGRADE";
        case "iw5_mp9_mp":
            return level.localizedWeaponNames[13];
        case "iw5_mp9_mp_reflexsmg_xmags":
            return &"WEAPON_MP9_UPGRADE";
        case "iw5_smaw_mp":
            return level.localizedWeaponNames[19];
        case "rpg_mp":
            return &"WEAPON_SMAW_UPGRADE";
        case "iw5_xm25_mp":
            return level.localizedWeaponNames[20];
        case "xm25_mp":
            return &"WEAPON_XM25_UPGRADE";
        case "iw5_m4_mp":
            return level.localizedWeaponNames[22];
        case "iw5_m4_mp_reflex_xmags_camo11":
            return &"WEAPON_M4_UPGRADE";
        case "iw5_m16_mp":
            return level.localizedWeaponNames[23];
        case "iw5_m16_mp_rof_xmags_camo11":
            return &"WEAPON_M16_UPGRADE";
        case "iw5_cm901_mp":
            return level.localizedWeaponNames[24];
        case "iw5_cm901_mp_acog_xmags_camo11":
            return &"WEAPON_CM901_UPGRADE";
        case "iw5_type95_mp":
            return level.localizedWeaponNames[25];
        case "iw5_type95_mp_reflex_xmags_camo11":
            return &"WEAPON_TYPE95_UPGRADE";
        case "iw5_acr_mp":
            return level.localizedWeaponNames[26];
        case "iw5_acr_mp_eotech_xmags_camo11":
            return &"WEAPON_ACR_UPGRADE";
        case "iw5_mk14_mp":
            return level.localizedWeaponNames[27];
        case "iw5_mk14_mp_reflex_xmags_camo11":
            return &"WEAPON_MK14_UPGRADE";
        case "iw5_ak47_mp":
            return level.localizedWeaponNames[3];
        case "iw5_ak47_mp_gp25_xmags_camo11":
            return &"WEAPON_AK47_UPGRADE";
        case "iw5_ak47_mp_xmags_camo01":
            return &"WEAPON_AK47_CLASSIC";
        case "iw5_g36c_mp":
            return level.localizedWeaponNames[28];
        case "iw5_g36c_mp_hybrid_xmags_camo11":
            return &"WEAPON_G36_UPGRADE";
        case "iw5_g36c_mp_akimbo_xmags":
            return &"WEAPON_G36_UPGRADE2";
        case "iw5_scar_mp":
            return level.localizedWeaponNames[4];
        case "iw5_scar_mp_eotech_xmags_camo11":
            return &"WEAPON_SCAR_UPGRADE";
        case "iw5_fad_mp":
            return level.localizedWeaponNames[29];
        case "iw5_fad_mp_m320_xmags_camo11":
            return &"WEAPON_FAD_UPGRADE";
        case "iw5_mp5_mp":
            return level.localizedWeaponNames[5];
        case "iw5_mp5_mp_reflexsmg_xmags_camo11":
            return &"WEAPON_MP5_UPGRADE";
        case "iw5_ump45_mp":
            return level.localizedWeaponNames[30];
        case "iw5_ump45_mp_eotechsmg_xmags_camo11":
            return &"WEAPON_UMP45_UPGRADE";
        case "iw5_pp90m1_mp":
            return level.localizedWeaponNames[31];
        case "iw5_pp90m1_mp_silencer_xmags_camo11":
            return &"WEAPON_PP90M1_UPGRADE";
        case "iw5_p90_mp":
            return level.localizedWeaponNames[6];
        case "iw5_p90_mp_rof_xmags_camo11":
            return &"WEAPON_P90_UPGRADE";
        case "iw5_m9_mp":
            return level.localizedWeaponNames[32];
        case "iw5_m9_mp_thermalsmg_xmags_camo11":
            return &"WEAPON_UZIM9_UPGRADE";
        case "iw5_mp7_mp":
            return level.localizedWeaponNames[33];
        case "iw5_mp7_mp_silencer_xmags_camo11":
            return &"WEAPON_MP7_UPGRADE";
        case "iw5_dragunov_mp_dragunovscope":
            return level.localizedWeaponNames[34];
        case "iw5_dragunov_mp_acog_xmags_camo11":
            return &"WEAPON_DRAGUNOV_UPGRADE";
        case "iw5_barrett_mp_barrettscope":
            return level.localizedWeaponNames[35];
        case "iw5_barrett_mp_acog_xmags_camo11":
            return &"WEAPON_BARRETT_UPGRADE";
        case "iw5_l96a1_mp_l96a1scope":
            return level.localizedWeaponNames[36];
        case "iw5_l96a1_mp_l96a1scopevz_xmags_camo11":
            return &"WEAPON_L96A1_UPGRADE";
        case "iw5_as50_mp_as50scope":
            return level.localizedWeaponNames[8];
        case "iw5_as50_mp_acog_xmags_camo11":
            return &"WEAPON_AS50_UPGRADE";
        case "iw5_rsass_mp_rsassscope":
            return level.localizedWeaponNames[37];
        case "iw5_rsass_mp_thermal_xmags_camo11":
        case "rsass_hybrid_mp":
            return &"WEAPON_RSASS_UPGRADE";
        case "alt_rsass_hybrid_mp":
            return &"WEAPON_RSASS_UPGRADE_REDDOT";
        case "iw5_msr_mp_msrscope":
            return level.localizedWeaponNames[9];
        case "iw5_msr_mp_msrscope_silencer03_xmags_camo11":
            return &"WEAPON_MSR_UPGRADE";
        case "iw5_sa80_mp":
            return level.localizedWeaponNames[38];
        case "iw5_sa80_mp_reflexlmg_xmags_camo11":
            return &"WEAPON_SA80_UPGRADE";
        case "iw5_mg36_mp":
            return level.localizedWeaponNames[39];
        case "iw5_mg36_mp_grip_xmags_camo11":
            return &"WEAPON_MG36_UPGRADE";
        case "iw5_pecheneg_mp":
            return level.localizedWeaponNames[40];
        case "iw5_pecheneg_mp_thermal_xmags_camo11":
            return &"WEAPON_PECHENEG_UPGRADE";
        case "iw5_mk46_mp":
            return level.localizedWeaponNames[41];
        case "iw5_mk46_mp_silencer_xmags_camo11":
            return &"WEAPON_MK46_UPGRADE";
        case "iw5_m60_mp":
            return level.localizedWeaponNames[7];
        case "iw5_m60_mp_reflexlmg_xmags_camo11":
            return &"WEAPON_M60_UPGRADE";
        case "iw5_m60jugg_mp_silencer_camo07":
        case "iw4_aug_mp":
            return &"WEAPON_AUG";
        case "iw4_augupgraded_mp":
            return &"WEAPON_AUG_UPGRADE2";
        case "iw5_m60jugg_mp_silencer_thermal_camo08":
        case "iw4_augupgraded2_mp":
            return &"WEAPON_AUG_UPGRADE";
        case "m320_mp":
            return level.localizedWeaponNames[21];
        case "iw5_usas12_mp":
            return level.localizedWeaponNames[42];
        case "iw5_usas12_mp_reflex_xmags_camo11":
            return &"WEAPON_USAS12_UPGRADE";
        case "iw5_ksg_mp":
            return level.localizedWeaponNames[43];
        case "iw5_ksg_mp_grip_xmags_camo11":
            return &"WEAPON_KSG_UPGRADE";
        case "iw5_spas12_mp":
            return level.localizedWeaponNames[44];
        case "iw5_spas12_mp_grip_xmags_camo11":
            return &"WEAPON_SPAS12_UPGRADE";
        case "iw5_striker_mp":
            return level.localizedWeaponNames[45];
        case "iw5_striker_mp_grip_xmags_camo11":
            return &"WEAPON_STRIKER_UPGRADE";
        case "iw5_aa12_mp":
            return level.localizedWeaponNames[10];
        case "iw5_aa12_mp_grip_xmags_camo11":
            return &"WEAPON_AA12_UPGRADE";
        case "iw5_1887_mp":
            return level.localizedWeaponNames[11];
        case "iw5_1887_mp_camo11":
            return &"WEAPON_MODEL1887_UPGRADE";
        case "riotshield_mp":
            return level.localizedWeaponNames[46];
        case "iw5_riotshield_mp":
            return &"WEAPON_RIOTSHIELD_UPGRADE";
        case "gl_mp":
            return &"WEAPON_GL_UPGRADE";
        case "t5_raygun_mp":
        case "iw4_raygun_mp":
        case "iw5_raygun_mp_eotechsmg":
            return &"WEAPON_RAYGUN";
        case "iw4_raygunupgraded_mp":
            return &"WEAPON_RAYGUN_UPGRADE_IW4";
        case "t5_raygunupgraded_mp":
        case "iw5_raygun_mp_eotechsmg_xmags":
            return &"WEAPON_RAYGUN_UPGRADE";
        case "thundergun_mp":
        case "t5_thundergun_mp":
            return &"WEAPON_THUNDERGUN";
        case "thundergunupgraded_mp":
        case "t5_thundergunupgraded_mp":
            return &"WEAPON_THUNDERGUN_UPGRADE";
        case "stinger_mp":
            return &"WEAPON_ZAPPER";
        case "uav_strike_marker_mp":
            return &"WEAPON_XM25_UPGRADE2";
        case "defaultweapon_mp":
            return &"WEAPON_HANDGUN";
        case "iw5_pp90m1_mp_silencer_xmags_camo10":
        case "iw4_tmpsilencer_mp":
            return &"WEAPON_FLAMETHROWER";
        case "iw4_tmpsilencerupgraded_mp":
            return &"WEAPON_FLAMETHROWER_UPGRADE";
        case "iw5_pecheneg_mp_rof_thermal":
        case "iw5_deathmachine_mp_thermal":
        case "iw4_deathmachine_mp":
            return &"WEAPON_DEATHMACHINE";
        case "airdrop_mega_marker_mp":
            return &"WEAPON_AIRDROP_MEGA_MARKER";
        case "airdrop_marker_mp":
            return &"WEAPON_AIRDROP_MARKER";
        case "strike_marker_mp":
            return &"WEAPON_STRIKE_MARKER";
        case "lightstick_mp":
            return &"WEAPON_GLOWSTICK";
        case "at4_mp":
            return &"WEAPON_AT4_LOCKAIR";
        case "iw5_mk12spr_mp_acog_xmags":
            return &"WEAPON_MK12SPR";
        case "deployable_vest_marker_mp":
            return &"WEAPON_DEPLOY_EXP_AMMO";
        case "claymore_mp":
            return &"WEAPON_DEPLOY_BARBED_WIRE";
        case "airdrop_juggernaut_def_mp":
            return &"WEAPON_OIL_CAN";
        case "none":
            return &"WEAPON_FREERUNNER";
        case "iw5_ak74u_mp":
            return level.localizedWeaponNames[48];
        case "iw5_cheytac_mp_cheytacscope":
            return level.localizedWeaponNames[49];
        case "iw5_ak74u_mp_reflexsmg_xmags_camo11":
            return &"WEAPON_AK74U_UPGRADE";
        case "iw5_cheytac_mp_acog_silencer03_camo11":
            return &"WEAPON_CHEYTAC_UPGRADE";
        case "iw5_pp90m1_mp_akimbo_silencer_xmags_camo11":
            return &"WEAPON_PP90M1_UPGRADE2";
        case "iw5_1887_mp_akimbo_camo11":
            return &"WEAPON_MODEL1887_UPGRADE2";
        case "iw5_ump45_mp_akimbo_xmags_camo11":
            return &"WEAPON_UMP45_UPGRADE2";
        case "iw4_fn2000_mp":
            return &"WEAPON_FN2000";
        case "iw4_fn2000upgraded_mp":
            return &"WEAPON_FN2000_UPGRADE";
        case "iw4_fn2000upgraded2_mp":
            return &"WEAPON_FN2000_UPGRADE2";
        case "iw4_pp2000_mp":
            return &"WEAPON_PP2000";
        case "iw4_pp2000upgraded_mp":
            return &"WEAPON_PP2000_UPGRADE";
        case "iw4_pp2000upgraded2_mp":
            return &"WEAPON_PP2000_UPGRADE2";
        case "iw4_m240_mp":
            return &"WEAPON_M240_GRIP";
        case "iw4_m240upgraded_mp":
            return &"WEAPON_M240_UPGRADE";
        case "iw4_kriss_mp":
            return &"WEAPON_KRISS";
        case "iw4_krissupgraded_mp":
            return &"WEAPON_KRISS_UPGRADE";
        case "iw4_krissupgraded2_mp":
            return &"WEAPON_KRISS_UPGRADE2";
        case "iw4_m1014_mp":
            return &"WEAPON_M1014";
        case "iw4_m1014upgraded_mp":
            return &"WEAPON_M1014_UPGRADE";
        case "iw4_m16_mp":
            return &"WEAPON_M16_REDDOT";
        case "iw4_m16upgraded_mp":
            return &"WEAPON_M16_UPGRADE_IW4";
        case "iw4_spas12_mp":
            return &"WEAPON_SPAS12";
        case "iw4_spas12upgraded_mp":
            return &"WEAPON_SPAS12_UPGRADE_IW4";
        case "iw4_ump45_mp":
            return &"WEAPON_UMP45";
        case "iw4_ump45upgraded_mp":
            return &"WEAPON_UMP45_UPGRADE_IW4";
        case "iw4_ump45upgraded2_mp":
            return &"WEAPON_UMP45_UPGRADE2_IW4";
        case "iw4_p90_mp":
            return &"WEAPON_P90";
        case "iw4_p90upgraded_mp":
            return &"WEAPON_P90_UPGRADE_IW4";
        case "iw4_dragunov_mp":
            return &"WEAPON_DRAGUNOV";
        case "iw4_dragunovupgraded_mp":
            return &"WEAPON_DRAGUNOV_UPGRADE_IW4";
        case "iw4_uzi_mp":
            return &"WEAPON_UZI";
        case "iw4_uziupgraded_mp":
            return &"WEAPON_UZI_UPGRADE";
        case "iw4_sa80_mp":
            return &"WEAPON_SA80";
        case "iw4_sa80upgraded_mp":
            return &"WEAPON_SA80_UPGRADE_IW4";
        case "iw4_sa80upgraded2_mp":
            return &"WEAPON_SA80_UPGRADE2_IW4";
        case "iw4_glock_mp":
            return &"WEAPON_GLOCK";
        case "iw4_glockupgraded_mp":
            return &"WEAPON_GLOCK_UPGRADE";
        case "iw4_rpd_mp":
            return &"WEAPON_RPD";
        case "iw4_rpdupgraded_mp":
            return &"WEAPON_RPD_UPGRADE";
        case "iw4_uspupgraded_mp":
            return &"WEAPON_USP_UPGRADE";
        case "m79_mp":
            return &"WEAPON_M79";
        case "iw4_aa12_mp":
            return &"WEAPON_AA12";
        case "iw4_aa12upgraded_mp":
            return &"WEAPON_AA12_UPGRADE_IW4";
        case "iw4_ak47_mp":
            return &"WEAPON_AK47";
        case "iw4_ak47upgraded_mp":
            return &"WEAPON_AK47_UPGRADE_IW4";
        case "iw4_barrett_mp":
            return &"WEAPON_BARRETT";
        case "iw4_barrettupgraded_mp":
            return &"WEAPON_BARRETT_UPGRADE_IW4";
        case "iw4_beretta393_mp":
            return &"WEAPON_BERETTA393";
        case "iw4_beretta393upgraded_mp":
            return &"WEAPON_BERETTA393_UPGRADE";
        case "iw4_coltanaconda_mp":
            return &"WEAPON_ANACONDA";
        case "iw4_coltanacondaupgraded_mp":
            return &"WEAPON_ANACONDA_UPGRADE_IW4";
        case "iw5_deserteagletactical_mp":
            return &"WEAPON_DESERTEAGLE";
        case "iw5_deserteagletactical_mp_akimbo_xmags":
            return &"WEAPON_MUSTANG_SALLY";
        case "iw5_deserteagletactical_mp_camo01":
            return &"WEAPON_DESERTEAGLE_UPGRADE_IW4";
        case "iw4_fal_mp":
            return &"WEAPON_FNFAL";
        case "iw4_falupgraded_mp":
            return &"WEAPON_FNFAL_UPGRADE";
        case "iw4_famas_mp":
            return &"WEAPON_FAMAS";
        case "iw4_famasupgraded_mp":
            return &"WEAPON_FAMAS_UPGRADE";
        case "iw4_m21_mp":
            return &"WEAPON_M14EBR_ACOG";
        case "iw4_m21upgraded_mp":
            return &"WEAPON_M14EBR_UPGRADE";
        case "iw4_m4reflex_mp":
            return &"WEAPON_M4_CARBINE_REDDOT";
        case "iw4_m4reflexupgraded_mp":
            return &"WEAPON_M4_CARBINE_REDDOT_UPGRADE";
        case "iw4_m4silencer_mp":
            return &"WEAPON_M4_CARBINE_SILENCER";
        case "iw4_m4silencerupgraded_mp":
            return &"WEAPON_M4_CARBINE_SILENCER_UPGRADE";
        case "iw4_masada_mp":
            return &"WEAPON_ACR_IW4";
        case "iw4_masadaupgraded_mp":
            return &"WEAPON_ACR_UPGRADE_IW4";
        case "iw4_mg4_mp":
            return &"WEAPON_MG4";
        case "iw4_mg4upgraded_mp":
            return &"WEAPON_MG4_UPGRADE";
        case "iw4_model1887_mp":
            return &"WEAPON_MODEL1887";
        case "iw4_model1887upgraded_mp":
            return &"WEAPON_MODEL1887_UPGRADE_IW4";
        case "iw4_model1887fmj_mp":
            return &"WEAPON_MODEL1887_FMJ";
        case "iw4_model1887fmjupgraded_mp":
            return &"WEAPON_MODEL1887_FMJ_UPGRADE";
        case "iw4_mp5k_mp":
            return &"WEAPON_MP5K";
        case "iw4_mp5kupgraded_mp":
            return &"WEAPON_MP5K_UPGRADE";
        case "iw4_ranger_mp":
            return &"WEAPON_RANGER";
        case "iw4_rangerupgraded_mp":
            return &"WEAPON_RANGER_UPGRADE";
        case "iw4_scar_mp":
            return &"WEAPON_SCAR";
        case "iw4_scarupgraded_mp":
            return &"WEAPON_SCAR_UPGRADE_IW4";
        case "iw4_striker_mp":
            return &"WEAPON_STRIKER";
        case "iw4_strikerupgraded_mp":
            return &"WEAPON_STRIKER_UPGRADE_IW4";
        case "iw4_tavor_mp":
            return &"WEAPON_TAVOR";
        case "iw4_tavorupgraded_mp":
            return &"WEAPON_TAVOR_UPGRADE";
        case "iw4_tmp_mp":
            return &"WEAPON_TMP";
        case "iw4_tmpupgraded_mp":
            return &"WEAPON_TMP_UPGRADE";
        case "iw4_wa2000_mp":
            return &"WEAPON_WA2000_ACOG";
        case "iw4_wa2000upgraded_mp":
            return &"WEAPON_WA2000_UPGRADE";
        case "iw4_javelin_mp":
            return &"WEAPON_JAVELIN";
        case "iw4_stinger_mp":
            return &"WEAPON_JAVELIN_PRO";
        case "iw4_rpg_mp":
            return &"WEAPON_RPG";
        case "iw4_rpgupgraded_mp":
            return &"WEAPON_RPG_UPGRADE";
        case "iw4_onemanarmy_mp":
            return &"WEAPON_OMA";
        case "iw4_onemanarmyupgraded_mp":
            return &"WEAPON_OMA_UPGRADE";
        case "iw5_cheytac_mp_cheytacscope2":
            return &"WEAPON_CHEYTAC_EXP_BULLETS";
        case "iw5_cheytac_mp_cheytacscope2_camo01":
            return &"WEAPON_CHEYTAC_EXP_BULLETS_UPGRADE";
        case "iw4_colt45_mp":
            return &"WEAPON_COLT45";
        case "iw4_colt45upgraded_mp":
            return &"WEAPON_MUSTANG_SALLY";
        case "iw4_ak47thermalupgraded_mp":
            return &"WEAPON_AK47_THERMAL_UPGRADE";
        case "alt_iw4_ak47thermalupgraded_mp":
            return &"WEAPON_AK47_THERMAL_UPGRADE_GL";
        default:
            return &"NULL_EMPTY";
    }
}
getWeaponNameColor(weapon)
{
    weapon = trimWeaponScope(weapon);

    switch (weapon)
    {
        case "iw4_beretta_mp":
        case "iw5_ak47_mp_xmags_camo01":
        case "iw5_m60jugg_mp_silencer_camo07":
        case "iw4_aug_mp":
        case "iw5_m60jugg_mp_silencer_thermal_camo08":
        case "iw4_augupgraded2_mp":
        case "t5_raygun_mp":
        case "iw4_raygun_mp":
        case "iw5_raygun_mp_eotechsmg":
        case "thundergun_mp":
        case "t5_thundergun_mp":
        case "stinger_mp":
        case "uav_strike_marker_mp":
        case "defaultweapon_mp":
        case "iw5_pp90m1_mp_silencer_xmags_camo10":
        case "iw4_tmpsilencer_mp":
        case "lightstick_mp":
        case "at4_mp":
        case "iw5_pp90m1_mp_akimbo_silencer_xmags_camo11":
        case "iw5_1887_mp_akimbo_camo11":
        case "iw5_ump45_mp_akimbo_xmags_camo11":
        case "iw4_fn2000_mp":
        case "iw4_pp2000_mp":
        case "iw4_m240_mp":
        case "iw4_kriss_mp":
        case "iw4_m1014_mp":
        case "iw4_m16_mp":
        case "iw4_spas12_mp":
        case "iw4_ump45_mp":
        case "iw4_p90_mp":
        case "iw4_dragunov_mp":
        case "iw4_uzi_mp":
        case "iw4_sa80_mp":
        case "iw4_glock_mp":
        case "iw4_rpd_mp":
        case "m79_mp":
        case "iw4_aa12_mp":
        case "iw4_ak47_mp":
        case "iw4_barrett_mp":
        case "iw4_beretta393_mp":
        case "iw4_coltanaconda_mp":
        case "iw5_deserteagletactical_mp":
        case "iw4_fal_mp":
        case "iw4_famas_mp":
        case "iw4_m21_mp":
        case "iw4_m4reflex_mp":
        case "iw4_m4silencer_mp":
        case "iw4_masada_mp":
        case "iw4_mg4_mp":
        case "iw4_model1887_mp":
        case "iw4_model1887fmj_mp":
        case "iw4_mp5k_mp":
        case "iw4_ranger_mp":
        case "iw4_scar_mp":
        case "iw4_striker_mp":
        case "iw4_tavor_mp":
        case "iw4_tmp_mp":
        case "iw4_wa2000_mp":
        case "iw4_javelin_mp":
        case "iw4_rpg_mp":
        case "iw4_onemanarmy_mp":
        case "iw5_cheytac_mp_cheytacscope2":
        case "iw4_colt45_mp":
            return (0, 1, 0);
        case "iw5_usp45_mp_akimbo_silencer02":
        case "iw4_berettaupgraded_mp":
        case "iw5_p99_mp_tactical_xmags":
        case "iw5_fnfiveseven_mp_akimbo_xmags":
        case "iw5_deserteagle_mp_silencer02_xmags":
        case "iw5_mp412jugg_mp_xmags":
        case "iw5_44magnum_mp_akimbo_xmags":
        case "iw5_fmg9_mp_akimbo_xmags":
        case "iw5_g18_mp_akimbo_xmags":
        case "iw5_skorpion_mp_akimbo_xmags":
        case "iw5_mp9_mp_reflexsmg_xmags":
        case "rpg_mp":
        case "xm25_mp":
        case "iw5_m4_mp_reflex_xmags_camo11":
        case "iw5_m16_mp_rof_xmags_camo11":
        case "iw5_cm901_mp_acog_xmags_camo11":
        case "iw5_type95_mp_reflex_xmags_camo11":
        case "iw5_acr_mp_eotech_xmags_camo11":
        case "iw5_mk14_mp_reflex_xmags_camo11":
        case "iw5_ak47_mp_gp25_xmags_camo11":
        case "iw5_g36c_mp_hybrid_xmags_camo11":
        case "iw5_g36c_mp_akimbo_xmags":
        case "iw5_scar_mp_eotech_xmags_camo11":
        case "iw5_fad_mp_m320_xmags_camo11":
        case "iw5_mp5_mp_reflexsmg_xmags_camo11":
        case "iw5_ump45_mp_eotechsmg_xmags_camo11":
        case "iw5_pp90m1_mp_silencer_xmags_camo11":
        case "iw5_p90_mp_rof_xmags_camo11":
        case "iw5_m9_mp_thermalsmg_xmags_camo11":
        case "iw5_mp7_mp_silencer_xmags_camo11":
        case "iw5_dragunov_mp_acog_xmags_camo11":
        case "iw5_barrett_mp_acog_xmags_camo11":
        case "iw5_l96a1_mp_l96a1scopevz_xmags_camo11":
        case "iw5_as50_mp_acog_xmags_camo11":
        case "iw5_rsass_mp_thermal_xmags_camo11":
        case "rsass_hybrid_mp":
        case "alt_rsass_hybrid_mp":
        case "iw5_msr_mp_msrscope_silencer03_xmags_camo11":
        case "iw5_sa80_mp_reflexlmg_xmags_camo11":
        case "iw5_mg36_mp_grip_xmags_camo11":
        case "iw5_pecheneg_mp_thermal_xmags_camo11":
        case "iw5_mk46_mp_silencer_xmags_camo11":
        case "iw5_m60_mp_reflexlmg_xmags_camo11":
        case "iw4_augupgraded_mp":
        case "iw5_usas12_mp_reflex_xmags_camo11":
        case "iw5_ksg_mp_grip_xmags_camo11":
        case "iw5_spas12_mp_grip_xmags_camo11":
        case "iw5_striker_mp_grip_xmags_camo11":
        case "iw5_aa12_mp_grip_xmags_camo11":
        case "iw5_1887_mp_camo11":
        case "iw5_riotshield_mp":
        case "gl_mp":
        case "iw4_raygunupgraded_mp":
        case "t5_raygunupgraded_mp":
        case "iw5_raygun_mp_eotechsmg_xmags":
        case "thundergunupgraded_mp":
        case "t5_thundergunupgraded_mp":
        case "iw5_mk12spr_mp_acog_xmags":
        case "iw5_ak74u_mp_reflexsmg_xmags_camo11":
        case "iw5_cheytac_mp_acog_silencer03_camo11":
        case "iw4_fn2000upgraded_mp":
        case "iw4_fn2000upgraded2_mp":
        case "iw4_pp2000upgraded_mp":
        case "iw4_pp2000upgraded2_mp":
        case "iw4_m240upgraded_mp":
        case "iw4_krissupgraded_mp":
        case "iw4_krissupgraded2_mp":
        case "iw4_m1014upgraded_mp":
        case "iw4_m16upgraded_mp":
        case "iw4_spas12upgraded_mp":
        case "iw4_ump45upgraded_mp":
        case "iw4_ump45upgraded2_mp":
        case "iw4_p90upgraded_mp":
        case "iw4_dragunovupgraded_mp":
        case "iw4_uziupgraded_mp":
        case "iw4_sa80upgraded_mp":
        case "iw4_sa80upgraded2_mp":
        case "iw4_glockupgraded_mp":
        case "iw4_rpdupgraded_mp":
        case "iw4_uspupgraded_mp":
        case "iw4_aa12upgraded_mp":
        case "iw4_ak47upgraded_mp":
        case "iw4_barrettupgraded_mp":
        case "iw4_beretta393upgraded_mp":
        case "iw4_coltanacondaupgraded_mp":
        case "iw5_deserteagletactical_mp_akimbo_xmags":
        case "iw4_falupgraded_mp":
        case "iw4_famasupgraded_mp":
        case "iw4_m21upgraded_mp":
        case "iw4_m4reflexupgraded_mp":
        case "iw4_m4silencerupgraded_mp":
        case "iw4_masadaupgraded_mp":
        case "iw4_mg4upgraded_mp":
        case "iw4_model1887upgraded_mp":
        case "iw4_model1887fmjupgraded_mp":
        case "iw4_mp5kupgraded_mp":
        case "iw4_rangerupgraded_mp":
        case "iw4_scarupgraded_mp":
        case "iw4_strikerupgraded_mp":
        case "iw4_tavorupgraded_mp":
        case "iw4_tmpupgraded_mp":
        case "iw4_wa2000upgraded_mp":
        case "iw4_stinger_mp":
        case "iw4_rpgupgraded_mp":
        case "iw4_onemanarmyupgraded_mp":
        case "iw5_cheytac_mp_cheytacscope2_camo01":
        case "iw4_colt45upgraded_mp":
        case "iw4_ak47thermalupgraded_mp":
        case "alt_iw4_ak47thermalupgraded_mp":
            return (1, 0, 0);
        case "iw4_tmpsilencerupgraded_mp":
        case "iw5_deserteagletactical_mp_camo01":
            return (1, 1, 0);
        case "iw5_usp45_mp":
        case "iw4_usp_mp":
        case "iw5_p99_mp":
        case "iw5_fnfiveseven_mp":
        case "iw5_deserteagle_mp":
        case "iw5_mp412_mp":
        case "iw5_44magnum_mp":
        case "iw5_fmg9_mp":
        case "iw5_g18_mp":
        case "iw5_skorpion_mp":
        case "iw5_mp9_mp":
        case "iw5_smaw_mp":
        case "iw5_xm25_mp":
        case "iw5_m4_mp":
        case "iw5_m16_mp":
        case "iw5_cm901_mp":
        case "iw5_type95_mp":
        case "iw5_acr_mp":
        case "iw5_mk14_mp":
        case "iw5_ak47_mp":
        case "iw5_g36c_mp":
        case "iw5_scar_mp":
        case "iw5_fad_mp":
        case "iw5_mp5_mp":
        case "iw5_ump45_mp":
        case "iw5_pp90m1_mp":
        case "iw5_p90_mp":
        case "iw5_m9_mp":
        case "iw5_mp7_mp":
        case "iw5_dragunov_mp_dragunovscope":
        case "iw5_barrett_mp_barrettscope":
        case "iw5_l96a1_mp_l96a1scope":
        case "iw5_as50_mp_as50scope":
        case "iw5_rsass_mp_rsassscope":
        case "iw5_msr_mp_msrscope":
        case "iw5_sa80_mp":
        case "iw5_mg36_mp":
        case "iw5_pecheneg_mp":
        case "iw5_mk46_mp":
        case "iw5_m60_mp":
        case "m320_mp":
        case "iw5_usas12_mp":
        case "iw5_ksg_mp":
        case "iw5_spas12_mp":
        case "iw5_striker_mp":
        case "iw5_aa12_mp":
        case "iw5_1887_mp":
        case "riotshield_mp":
        case "iw5_pecheneg_mp_rof_thermal":
        case "iw5_deathmachine_mp_thermal":
        case "iw4_deathmachine_mp":
        case "airdrop_mega_marker_mp":
        case "airdrop_marker_mp":
        case "strike_marker_mp":
        case "deployable_vest_marker_mp":
        case "claymore_mp":
        case "airdrop_juggernaut_def_mp":
        case "none":
        case "iw5_ak74u_mp":
        case "iw5_cheytac_mp_cheytacscope":
        default:
            return (1, 1, 1);
    }
}

scorePopup(amount)
{
    if (isDefined(level.isBlackFriday) && amount < 0)
    {
        amount /= 2;
        self.cash += abs(amount);//Yeah I know it's lazy but who gives a fuck =P
    }

    if (!isDefined(self.aizHud_created)) return;

    score = self.hud_scorePop;
    scoreLine = self.hud_scoreLine;
    //addScore = score.addScore;
    scoreLine.alpha = 1;
    score.addScore = score.addScore + amount;
    //addScore = score.addScore;
    scoreAdd = score.addScore;
    oldScore = scoreAdd - amount;
    if (scoreAdd > 0)
    {
        score.color = (0, 0.8, 0);
        score.glowColor = (0, 0.8, 0);
        scoreLine.color = (0, 0.8, 0);
    }
    else if (scoreAdd < 0)
    {
        score.color = (0.8, 0, 0);
        score.glowColor = (0.8, 0, 0);
        scoreLine.color = (0.8, 0, 0);
    }
    scoreCountHud = self.hud_score;
    scoreCountHud setValue(self.cash);
    self.score = int(self.cash);
    score setValue(int(scoreAdd));
    score setPulseFX(80, 1600, 600);
    
    self notify("score_chain");
    self thread checkForScoreChainEnd(score, scoreLine);
}
checkForScoreChainEnd(score, scoreLine)
{
    self endon("score_chain");
    self endon("disconnect");

    wait(2);

    score.addScore = 0;
    scoreLine fadeOverTime(0.6);
    scoreLine.alpha = 0;
}

scoreMessage(message, param)
{
    if (!isDefined(self.aizHud_created)) return;

    messageHud = self.hud_scoreMessage;
    messageHud.label = message;
    messageHud setText(&"NULL_EMPTY");
    if (isDefined(param))
    {
        if (isPlayer(param))
            messageHud setPlayerNameString(param);
        else
            messageHud setText(param);
    }

    messageHud setPulseFX(80, 3000, 600);
}

updatePerksHud(reset, instant)
{
    if (!isDefined(self.aizHud_created)) return;

    perk = self.lastBoughtPerk;

    //_hasPerk7 = self.autoRevive;

    if (reset)
    {
        for (i = 0; i < 7; i++)
        {
            self.hud_perks[i].alpha = 0;
            self.perkHudsDone[i] = false;
        }
        return;
    }

    if (self.isAlive)
    {
        if (perk == "waypoint_revive" || perk == "specialty_pistoldeath_upgrade")//Check for autoRevive first
        {
            if (isDefined(instant) && instant)
                self setPerkHudSlot(6, perk);
            else
                self thread updatePerkHudSlotAfterWait(9, 6, perk);
            self.perkHudsDone[6] = true;
            self.lastBoughtPerk = "";
            return;
        }

        for (i = 0; i < 6; i++)
        {
            if (!self.perkHudsDone[i])
            {
                //These are timed to the popup animation when given.
                if (instant)
                    self setPerkHudSlot(i, perk);
                else
                    self thread updatePerkHudSlotAfterWait(9, i, perk);
                self.perkHudsDone[i] = true;
                break;
            }
        }
        self.lastBoughtPerk = "";

    }
}
updatePerkHudSlotAfterWait(waitTime, slot, perk)
{
    self endon("disconnect");

    wait(waitTime);

    self setPerkHudSlot(slot, perk);
}
setPerkHudSlot(slot, perk)
{
    if (!self.isAlive) return;
    perkIcon = self.hud_perks[slot];
    perkIcon setShader(perk, 30, 30);
    perkIcon.alpha = 1;
}

showBoughtPerk(name, imageName, index)
{
    desc = self createFontString("hudsmall", 1.5);
    desc.label = level.perkDescs[index];
    if (array_contains(level.classicMaps, level._mapname))
    {
        if (index == 3)
            desc.label = level.gameStrings[330];
        else if (index == 4)
            desc.label = level.gameStrings[334];
        else if (index == 5)
            desc.label = level.gameStrings[332];
    }
    desc setPoint("CENTER", "CENTER", 0, -100);
    desc.color = (1, 1, 0.8);
    desc.hideWhenInMenu = true;
    desc.archived = false;
    desc.alpha = 0;
    perkName = self createFontString("hudsmall", 1.7);
    perkName setText(name);
    perkName setPoint("CENTER", "CENTER", 0, -170);
    perkName.color = (1, 1, 0.8);
    perkName.hideWhenInMenu = true;
    perkName.archived = false;
    perkName.alpha = 0;
    image = newClientHudElem(self);
    image setShader(imageName, 50, 50);
    image.X = 0;
    image.Y = -130;
    image.alignX = "center";
    image.alignY = "middle";
    image.horzAlign = "center";
    image.vertAlign = "middle";
    image.hideWhenInMenu = true;
    image.archived = true;
    image.alpha = 0;

    huds = [];
    huds[0] = desc;
    huds[1] = perkName;

    imageX = 0;
    if (index == 6) imageX = self getPerkPath(true);
    else imageX = self getPerkPath(false);

    wait(1);

    desc fadeOverTime(0.6);
    perkName fadeOverTime(0.6);
    image fadeOverTime(0.6);
    desc.alpha = 1;
    perkName.alpha = 1;
    image.alpha = 1;

    wait(5);

    desc fadeOverTime(0.6);
    desc.alpha = 0;
    perkName fadeOverTime(0.6);
    perkName.alpha = 0;
    if (index == 6) image scaleOverTime(3, 40, 40);
    else image scaleOverTime(3, 30, 30);
    image moveOverTime(2.9);
    image.X = imageX;
    if (index == 6) image.y = 211;
    else image.y = 170;

    wait(0.6);

    desc destroy();
    perkName destroy();

    wait(2.3);

    image destroy();
}

roundStartHud()
{
    level.roundStartHud = createServerFontString("hudbig", 1.5);
    level.roundStartHud setPoint("TOPCENTER", "TOPCENTER", 0, 5);
    level.roundStartHud.glowAlpha = 0.7f;
    level.roundStartHud.glowColor = (0, 0, 1);
    level.roundStartHud.alpha = 0;
    level.roundStartHud.archived = false;
    level.roundStartHud.label = level.gameStrings[188];
    level.roundStartHud setValue(level.wave);
    level.roundStartHud fadeOverTime(1);
    level.roundStartHud.alpha = 1;

    wait(5);

    level.roundStartHud fadeOverTime(1);
    level.roundStartHud.alpha = 0;

    wait(1);

    level.roundStartHud destroy();
    level.roundStartHud = undefined;
}

roundEndHud()
{
    level.roundEndHud = createServerFontString("hudbig", 1.5);
    level.roundEndHud setPoint("TOPCENTER", "TOPCENTER", 0, 5);
    level.roundEndHud.glowAlpha = 0.7;
    level.roundEndHud.glowColor = (0, 0, 1);
    level.roundEndHud.archived = false;
    level.roundEndHud.alpha = 0;
    if (level.isBossWave)
    {
        level.roundEndHud.label = level.gameStrings[184];
        foreach (player in level.players)
        {
            if (!player.isAlive) continue;
            player.cash += 1000;
            player scorePopup(1000);
            player scoreMessage(level.gameStrings[185]);
            player z_giveMaxAmmo();
        }
    }
    else if (level.isCrawlerWave)
    {
        level.roundEndHud.label = level.gameStrings[186];
        foreach (player in level.players)
        {
            if (!player.isAlive) continue;
            player z_giveMaxAmmo();
            player scoreMessage(level.gameStrings[187]);
        }
    }
    else
    {
        level.roundEndHud.label = level.gameStrings[189];
        level.roundEndHud setValue(level.wave);
    }
    level.roundEndHud fadeOverTime(1);
    level.roundEndHud.alpha = 1;

    roundEndHudSubtitle = createServerFontString("hudbig", 1.5);
    roundEndHudSubtitle setPoint("TOPCENTER", "TOPCENTER", 0, 35);
    roundEndHudSubtitle.glowAlpha = 0.7;
    roundEndHudSubtitle.glowColor = (0, 0, 1);
    roundEndHudSubtitle.archived = false;
    roundEndHudSubtitle.alpha = 0;
    roundEndHudSubtitle.label = level.gameStrings[14];
    roundEndHudSubtitle fadeOverTime(1);
    roundEndHudSubtitle.alpha = 1;

    wait(5);

    level.roundEndHud fadeOverTime(1);
    level.roundEndHud.alpha = 0;
    roundEndHudSubtitle fadeOverTime(1);
    roundEndHudSubtitle.alpha = 0;

    wait(1);

    level.roundEndHud destroy();
    level.roundEndHud = undefined;
    roundEndHudSubtitle destroy();
}

powerBoughtHud()
{
    if (level.isHellMap) return;
    powerMessage = createServerFontString("hudbig", 1);
    powerMessage setPoint("CENTER", "CENTER", 1000, -150);
    powerMessage.hideWhenInMenu = true;
    powerMessage.foreground = true;
    powerMessage.archived = false;
    powerMessage.color = (0, 0.85, 0.9);
    powerMessage.label = level.gameStrings[190];
    powerName = createServerFontString("hudbig", 1);
    powerName setPoint("CENTER", "CENTER", -700, -130);
    powerName.hideWhenInMenu = true;
    powerName.foreground = true;
    powerName.archived = false;
    powerName.color = (0, 0.85, 0.9);
    powerName setPlayerNameString(self);
    powerMessage setPoint("CENTER", "CENTER", 0, -150, 3);
    powerName setPoint("CENTER", "CENTER", 0, -130, 3);

    wait(7);

    powerMessage fadeOverTime(1);
    powerMessage.alpha = 0;
    powerName fadeOverTime(1);
    powerName.alpha = 0;

    wait(1);

    powerMessage destroy();
    powerName destroy();
}
tempPowerHud()
{
    if (level.powerBox) return;

    level.powerHud.color = (0.9, 0.9, 0);
    level.powerHud.label = level.gameStrings[191];
    level.powerHud setValue(level.EMPTime);
    if (!level.tempPowerActivated)
        level thread runTempPowerTimer();
}
runTempPowerTimer()
{
    level endon ("game_ended");
    level endon("power_activated");

    while (true)
    {
        if (level.gameEnded) return;
        if (level.powerBox) return;

        level.EMPTime--;
        level.powerHud.label = level.gameStrings[191];
        level.powerHud setValue(level.EMPTime);
        if (level.EMPTime == 0 && !level.powerBox)
        {
            level.powerActivated = false;
            level.tempPowerActivated = false;
            level.powerHud.color = (0.9, 0, 0);
            level.powerHud.label = level.gameStrings[183];
            level.powerHud setText(&"NULL_EMPTY");
            return;
        }

        wait(1);
    }
}

endGame(win)
{
    if (level.gameEnded) return;
    level.gameEndTime = getTime();
    level.gameEnded = true;
    makeDvarServerInfo("scr_gameended", "1");
    //Currently we hack in the losing code and piggy back off the win code

    wait(1);

    setTeamRadar("allies", false);
    bestPlayer = getPlayerWithMostKills();
    globalCam = spawn("script_model", bestPlayer.origin + (0, 100, 100));
    if (!win)
    {
        globalCam setModel("tag_origin");
        angles = vectorToAngles(bestPlayer.origin - globalCam.origin);
        globalCam.angles = angles;
        //globalCam notSolid();
        //globalCam enableLinkTo();
        globalCam moveTo(globalCam.origin + (0, 0, 2000), 25);
        level notify("game_ended", "axis");
        //level notify("game_win", "axis");
    }
    else
    {
        level notify("game_ended", "allies");
        //level notify("game_win", "allies");
    }
    levelFlagSet("game_over");
    levelFlagSet("block_notifies");
    waitframe();

    if (!level.isHellMap) level.powerHud.alpha = 0;
    level.zombieCounterHud.alpha = 0;
    level.roundHud.alpha = 0;

    foreach (player in level.players)
    {
        if (player.isDown)
            player autoRevive_revivePlayer(undefined);

        player.isDown = true;

        if (isDefined(player.bot)) player thread maps\mp\gametypes\_aiz_killstreaks::killPlayerBot();

        player.sessionTeam = "allies";
        player.sessionState = "spectating";
        player setClientDvar("g_scriptMainMenu", "endgameupdate");

        //if (win) player playLocalSound("victory_music");

        player freezeControls(true);
        //player notSolid();
        player destroyPlayerHud();
        camPos = player getEye();
        cam = spawn("script_model", camPos);
        if (win)
        {
            cam setModel("tag_origin");
            moveToAngles = vectorToAngles(bestPlayer.origin - (bestPlayer.origin + (200, 200, 200)));
            angle = player getPlayerAngles();
            cam.angles = angle;
            cam notSolid();
            //cam enableLinkTo();
            cam moveTo(bestPlayer.origin + (200, 200, 200), 5, 1, 1);
            //player setPlayerAngles(moveToLoc);
            cam rotateTo(moveToAngles, 5, 1, 1);

            if (player != bestPlayer)
                player playerHide();
            else 
                player endGame_createTopPlayerClone();

            player takeAllWeapons();
            player.health = player.maxhealth;
            player playerLinkToAbsolute(cam);//player cameraLinkTo(cam, "tag_origin");

            cam thread endGame_moveCameraUpwards();
        }
        else
        {
            //player playLocalSound("mp_killstreak_carepackage");
            //player playLocalSound("defeat_music");
            player setPlayerAngles(globalCam.angles);
            player cameraLinkTo(globalCam, "tag_origin", (0, 0, 0), (0, 0, 0));
        }
        //player playerLinkedSetViewZNear(0.01);

        player thread doOutro(win);
    }

    level.freezer = true;
    //Add the lose animation to the endgame
    foreach (bot in level.botsInPlay)
    {
        bot maps\mp\gametypes\_aiz_bot_util::playAnimOnBot("z_lose");
        bot moveTo(bot.origin, 0.05);
    }

    wait(5);

    foreach (player in level.players)
    {
        player playLocalSound("nuke_explosion");
        player playLocalSound("nuke_wave");
        player thread endGameVision();
    }

    if (!win)
        thread endGame_hideAllBots();

    wait(2);

    endGameScreen = [];
    if (win)
    {
        setWinningTeam("allies");
        setMatchData("victor", "allies");

        randomMessage = randomInt(level.zombieDeath.size);
        endGameScreen = createEndGameScreen(win, level.zombieDeath[randomMessage]);
        PlaySoundAtPos((0, 0, 0), "us_victory_music");
    }
    else
    {
        setWinningTeam("axis");
        setMatchData("victor", "axis");
        endGameScreen = createEndGameScreen(win, level.gameStrings[193]);
        PlaySoundAtPos((0, 0, 0), "us_defeat_music");
    }

    wait(18);

    //setGameEndTime(0);

    if (getDvarInt("xblive_privatematch") == 1)
    {
        level notify("exitLevel_called");
        exitLevel(false);
        return;
    }

    if (level.voting)
    {
        if (isDefined(endGameScreen) && endGameScreen.size > 0)
        {
            foreach (h in endGameScreen)
                h destroy();
        }

        initVoting();
    }
    else
    {
        if (level.classicMapsEnabled && (level.classicMapsOnly || randomInt(100) > 75))
        {
            classicMapCount = level.classicMaps.size;
            if (!level.dlcEnabled) classicMapCount = 14;

            maps\mp\gametypes\_aiz_external_utils::map(level.classicMaps[randomInt(classicMapCount)]);
            return;
        }
        else if (level.wawMapsEnabled && randomInt(100) > 90)
        {
            wawMapsCount = level.wawMaps.size;

            maps\mp\gametypes\_aiz_external_utils::map(level.wawMaps[randomInt(wawMapsCount)]);
            return;
        }

        maxMapsCount = 36;
        if (!level.dlcEnabled) maxMapsCount = 16;
        //map(level.mapList[randomInt(0, maxMapsCount)]);
        //exitLevel(false);
        //cmdexec("map " + level.mapList[randomInt(maxMapsCount)]);
        maps\mp\gametypes\_aiz_external_utils::map(level.mapList[randomInt(maxMapsCount)]);
    }
}

endGame_hideAllBots()
{
    wait(2);

    foreach (bot in level.botsInPlay)
    {
        bot hideAllParts();
        if (isDefined(bot.head)) bot.head hide();
    }
}

endGame_createTopPlayerClone()
{
    clone = spawn("script_model", self.origin);
    clone setModel(self.model);
    clone.angles = self.angles;
    head = spawn("script_model", clone.origin);
    //headModel = self getAttachModelName(0);
    head setModel(self.headModel);
    head linkTo(clone, "j_spine4", (0, 0, 0), (0, 0, 0));
    clone scriptModelPlayAnim(level.botAnims["idle"]);

    self playerHide();
}

endGame_moveCameraUpwards()
{
    wait(5);

    self moveTo(self.origin + (0, 0, 1900), 25, 1, 1);
}

endGameVision()
{
    self endon("disconnect");

    self visionSetNakedForPlayer("end_game2", 2.5);
    wait(3);
    self visionSetNakedForPlayer("mpnuke_aftermath");
}

doOutro(win)
{
    endGameText = self createEndGameSequenceForPlayer(win);
    endGameText[0].alpha = 1;
    self playLocalSound("weap_barrett_fire_aki");
    earthquake(.25, .3, self.origin, 5000);
    wait(.9);
    endGameText[1].alpha = 1;
    self playLocalSound("weap_barrett_fire_aki");
    earthquake(.25, .3, self.origin, 5000);
    wait(.9);
    endGameText[2].alpha = 1;
    self playLocalSound("weap_barrett_fire_aki");
    earthquake(.25, .3, self.origin, 5000);
    wait(.9);
    endGameText[3].alpha = 1;
    self playLocalSound("weap_barrett_fire_aki");
    earthquake(.25, .3, self.origin, 5000);
    wait(.9);
    endGameText[4].alpha = 1;
    self playLocalSound("weap_barrett_fire_aki");
    earthquake(.25, .3, self.origin, 5000);

    wait(3);

    foreach (h in endGameText)
    {
        h fadeOverTime(0.5);
        h.alpha = 0;

        h thread endGame_destroyTextAfterTime(0.5);
    }
}
endGame_destroyTextAfterTime(time)
{
    wait(time);

    self destroy();
}

createEndGameScreen(win, endText)
{
    outcomeTitle = newHudElem();
    outcomeTitle.elemType = "font";
    outcomeTitle.font = "hudbig";
    outcomeTitle.fontScale = 1.5;
    outcomeTitle.children = [];
    outcomeTitle.parent = level.uiParent;
    outcomeTitle setPoint("center", "center", 0, -134);
    outcomeTitle.foreground = true;
    outcomeTitle.glowAlpha = 1;
    outcomeTitle.hideWhenInMenu = false;
    outcomeTitle.archived = false;

    outcomeText = newHudElem();
    outcomeText.elemType = "font";
    outcomeText.font = "hudbig";
    outcomeText.fontScale = 1;
    outcomeText.parent = outcomeTitle;
    outcomeText.children = [];
    outcomeText.foreground = true;
    outcomeText setPoint("center", "center", 0, 28);
    outcomeText.glowAlpha = 1;
    outcomeText.hideWhenInMenu = false;
    outcomeText.archived = false;

    outcomeTitle.glowColor = (0, 0, 0);
    if (win)
    {
        outcomeTitle.label = level.gameStrings[194];
        outcomeTitle.color = (.3, .7, .2);
    }
    else
    {
        outcomeTitle.label = level.gameStrings[195];
        outcomeTitle.color = (.7, .3, .2);
    }
    outcomeText.glowColor = (.2, .3, .7);
    outcomeText.label = endText;
    outcomeTitle setPulseFX(100, 60000, 1000);
    outcomeText setPulseFX(100, 60000, 1000);

    leftIcon = newHudElem();
    leftIcon.children = [];
    leftIcon setShader("iw5_cardicon_soap", 70, 70);
    leftIcon.parent = outcomeText;
    leftIcon setPoint("top", "bottom", -60, 60);
    //leftIcon setShader("cardicon_soap", 70, 70);
    leftIcon.foreground = true;
    leftIcon.hideWhenInMenu = false;
    leftIcon.archived = false;
    leftIcon.alpha = 0;
    leftIcon fadeOverTime(0.5);
    leftIcon.alpha = 1;

    rightIcon = newHudElem();
    rightIcon.children = [];
    rightIcon setShader("iw5_cardicon_nuke", 70, 70);
    rightIcon.parent = outcomeText;
    rightIcon setPoint("top", "bottom", 60, 60);
    //rightIcon setShader("cardicon_nuke", 70, 70);
    rightIcon.foreground = true;
    rightIcon.hideWhenInMenu = false;
    rightIcon.archived = false;
    rightIcon.alpha = 0;
    rightIcon fadeOverTime(0.5);
    rightIcon.alpha = 1;

    leftScore = newHudElem();
    leftScore.elemType = "font";
    leftScore.font = "hudbig";
    leftScore.fontScale = 1.25;
    leftScore.children = [];
    leftScore.parent = leftIcon;
    leftScore setPoint("top", "bottom", 0, 50);
    if (win)
    {
        leftScore.glowColor = (.2, .8, .2);
        leftScore.label = level.gameStrings[196];
    }
    else
    {
        leftScore.glowColor = (.8, .2, .2);
        leftScore.label = level.gameStrings[197];
    }
    leftScore.glowAlpha = 1;
    leftScore.foreground = true;
    leftScore.hideWhenInMenu = false;
    leftScore.archived = false;
    leftScore setPulseFX(100, 60000, 1000);

    rightScore = newHudElem();
    rightScore.elemType = "font";
    rightScore.font = "hudbig";
    rightScore.fontScale = 1.5;
    rightScore.children = [];
    rightScore.parent = rightIcon;
    rightScore setPoint("top", "bottom", 0, 50);
    rightScore.glowAlpha = 1;
    if (!win)
    {
        rightScore.glowColor = (.2, .8, .2);
        rightScore.label = level.gameStrings[196];
    }
    else
    {
        rightScore.glowColor = (.8, .2, .2);
        rightScore.label = level.gameStrings[197];
    }
    rightScore.foreground = true;
    rightScore.hideWhenInMenu = false;
    rightScore.archived = false;
    rightScore setPulseFX(100, 60000, 1000);

    ret = [];
    ret[0] = outcomeTitle;
    ret[1] = outcomeText;
    ret[2] = rightScore;
    ret[3] = leftScore;
    ret[4] = rightIcon;
    ret[5] = leftIcon;

    return ret;
}

createEndGameSequenceForPlayer(win)
{
    endGameText = [];

    endGameText[0] = self createFontString("hudbig", .85);
    endGameText[0].children = [];
    endGameText[0] setPoint("TOPMIDDLE", "TOPMIDDLE", 0, 60);
    endGameText[0].color = (1, 0, 0);
    endGameText[0].label = level.gameStrings[198];
    endGameText[0].alpha = 0;

    endGameText[1] = self createFontString("hudbig", .85);
    endGameText[1].children = [];
    endGameText[1] setPoint("TOPMIDDLE", "TOPMIDDLE", 0, 75);
    endGameText[1].color = (1, .5, .3);
    endGameText[1].label = level.gameStrings[199];
    endGametext[1] setValue(level.timePlayedMinutes);
    endGameText[1].alpha = 0;

    endGameText[2] = self createFontString("hudbig", .85);
    endGameText[2].children = [];
    endGameText[2] setPoint("TOPMIDDLE", "TOPMIDDLE", 0, 90);
    endGameText[2].color = (1, 1, 0);
    endGameText[2].label = level.gameStrings[200];
    endGametext[2] setValue(level.timePlayed);
    endGameText[2].alpha = 0;

    endGameText[3] = self createFontString("hudbig", .85);
    endGameText[3].children = [];
    endGameText[3] setPoint("TOPMIDDLE", "TOPMIDDLE", 0, 105);
    endGameText[3].color = (1, 0, 0);
    endGameText[3].label = level.gameStrings[201];
    if (win) endGameText[3] setValue(level.totalWaves);
    else endGameText[3] setValue(level.wave);
    endGameText[3].alpha = 0;

    endGameText[4] = self createFontString("hudbig", .85);
    endGameText[4].children = [];
    endGameText[4] setPoint("TOPMIDDLE", "TOPMIDDLE", 0, 120);
    endGameText[4].color = (1, .5, .3);
    if (win) endGameText[4].label = level.gameStrings[202];
    else endGameText[4].label = level.gameStrings[203];
    endGameText[4].alpha = 0;

    return endGameText;
}

showPowerUpHud(type)
{
    if (!isDefined(type))
    {
        printLn("Error showing powerup hud: missing type parameter");
        return;
    }

    if (type == 5)
    {
        personalInfo = self createFontString("hudsmall", 1);
        personalInfo setPoint("center", "center");
        personalInfo.label = level.gameStrings[204];
        personalInfo.hideWhenInMenu = true;
        personalInfo.alpha = 1;
        personalInfo fadeOverTime(2);
        personalInfo.alpha = 0;
        personalInfo changeFontScaleOverTime(2);
        personalInfo.fontScale = .8;
        personalInfo destroyHudAfterWait(2);

        if (self.deathHud) return;
        self.deathHud = true;
        icon = newClientHudElem(self);//createServerFontString("hudbig", 1.5);
        icon.archived = false;
        icon.foreground = true;
        icon.hideWhenInMenu = true;
        icon.horzAlign = "center_adjustable";
        icon.vertAlign = "bottom";
        icon.alignX = "center";
        icon.alignY = "middle";
        icon.X = 75;
        icon.Y = 0;
        icon.alpha = 1;
        icon setShader("specialty_bulletpenetration", 48, 48);
        self thread startDeathMachineHudFlash(icon);
        return;
    }

    info = createPowerupHintText();
    //info setPoint("center", "center", 1, -50, 2);
    info changeFontScaleOverTime(2);
    info.fontScale = 0.8;
    info thread destroyHudAfterWait(2);

    if (type == 1)
    {
        info.label = level.gameStrings[205];
        if (level.killHud) return;
        level.powerup1 = createPowerupHud(0);
        level.powerup1 setShader("cardicon_skull_black", 48, 48);
        level.killHud = true;
        level thread watchInstakillFlash();
    }
    else if (type == 2)
    {
        info.label = level.gameStrings[206];
        if (level.doubleHud) return;
        level.powerup2 = createPowerupHud(1);
        level.powerup2 setShader("specialty_bling", 48, 48);
        level.doubleHud = true;
        level thread watchDoubleFlash();
    }
    else if (type == 3)
        info.label = level.gameStrings[207];
    else if (type == 4)
        info.label = level.gameStrings[208];
    else if (type == 8)
        info.label = level.gameStrings[209];
    else if (type == 10)
        info.label = level.gameStrings[210];
}
destroyHudAfterWait(waitTime)
{
    wait(waitTime);

    self destroy();
}
startDeathMachineHudFlash(icon)
{
    level endon("game_ended");
    self endon("disconnect");

    wait(20);

    flashCount = 0;

    while (true)
    {
        flashCount++;
        if (flashCount >= 10)
        {
            self.deathHud = false;
            break;
        }
        self deathMachineHudFlash(icon);
        wait(1);
    }
}
deathMachineHudFlash(icon)
{
    if (level.gameEnded) return;
    if (!self.deathHud)
    {
        icon destroy();
        return;
    }

    icon fadeOverTime(.5);
    icon.alpha = 1;
    icon thread fadeOutIcon(.5, .5);
}
watchInstakillFlash()
{
    while (true)
    {
        if (level.gameEnded)
        {
            level.powerup1 destroy();
            break;
        }
        if (level.instaKillTime < 10)
        {
            if (level.instaKillTime == 0)
            {
                level.powerup1 destroy();
                level.powerup1 = undefined;
                level.killHud = false;
                break;
            }

            level.powerup1 fadeOverTime(.5);
            level.powerup1.alpha = 1;
            level.powerup1 thread fadeOutIcon(.5, .5);
        }
        else level.powerup1.alpha = 1;

        wait(1);
    }
}
watchDoubleFlash()
{
    while (true)
    {
        if (level.gameEnded)
        {
            level.powerup2 destroy();
            break;
        }
        if (level.doublePointsTime < 10)
        {
            if (level.doublePointsTime == 0)
            {
                level.powerup2 destroy();
                level.powerup2 = undefined;
                level.doubleHud = false;
                break;
            }

            level.powerup2 fadeOverTime(.5);
            level.powerup2.alpha = 1;
            level.powerup2 thread fadeOutIcon(.5, .5);
        }
        else level.powerup2.alpha = 1;

        wait(1);
    }
}

initVoting()
{
    //Huds draw from left to right
    currentMapNames = [];
    currentMapDescs = [];
    currentMapVotes = [];

    for (i = 0; i < 3; i++)
    {
        currentMapNames[i] = newHudElem();
        currentMapNames[i].elemType = "font";
        currentMapNames[i].font = "hudbig";
        currentMapNames[i].fontScale = 0.75;
        currentMapNames[i].children = [];
        currentMapNames[i].parent = level.uiParent;
        currentMapNames[i].alpha = 1;
        currentMapNames[i].hideWhenDead = false;
        currentMapNames[i].hideWhenInDemo = true;
        currentMapNames[i].hideWhenInMenu = false;
        currentMapNames[i].sort = i;
        currentMapNames[i].color = (0, 1, 1);

        if (i == 0)
            currentMapNames[i] setPoint("center", "center", -200, 0);
        else if (i == 1)
            currentMapNames[i] setPoint("center", "center", 200, 0);
        else if (i == 2)
        {
            currentMapNames[i] setPoint("center", "center", 0, 150);
            currentMapNames[i].fontScale = 1;
            currentMapNames[i].label = level.gameStrings[211];
        }

        currentMapDescs[i] = newHudElem();
        currentMapDescs[i].elemType = "font";
        currentMapDescs[i].font = "hudbig";
        currentMapDescs[i].fontScale = 0.75;
        currentMapDescs[i].children = [];
        currentMapDescs[i].parent = currentMapNames[i];
        currentMapDescs[i].alpha = 1;
        currentMapDescs[i].hideWhenDead = false;
        currentMapDescs[i].hideWhenInDemo = true;
        currentMapDescs[i].hideWhenInMenu = false;
        currentMapDescs[i].sort = i;
        currentMapDescs[i] setPoint("center", "center", 0, 20);

        currentMapVotes[i] = newHudElem();
        currentMapVotes[i].elemType = "font";
        currentMapVotes[i].font = "objective";
        currentMapVotes[i].fontScale = 1;
        currentMapVotes[i].children = [];
        currentMapVotes[i].parent = currentMapDescs[i];
        currentMapVotes[i].alignX = "center";
        currentMapVotes[i].alignY = "bottom";
        currentMapVotes[i].color = (1, 1, 0);
        currentMapVotes[i].alpha = 1;
        currentMapVotes[i].glowAlpha = .5;
        currentMapVotes[i].glowColor = (0, 1, 0);
        currentMapVotes[i].hideWhenDead = false;
        currentMapVotes[i].hideWhenInDemo = true;
        currentMapVotes[i].hideWhenInMenu = false;
        currentMapVotes[i].horzAlign = "center_adjustable";
        currentMapVotes[i].vertAlign = "center_adjustable";
        currentMapVotes[i].sort = i;
        currentMapVotes[i] setPoint("bottom", "bottom", 0, 60);
        currentMapVotes[i] setValue(0);

        if (i == 2)
            currentMapVotes[i] setPoint("bottom", "bottom", 0, 30);
    }

    timer = newHudElem();
    timer.elemType = "timer";
    timer.font = "objective";
    timer.fontScale = 1;
    timer.children = [];
    timer.parent = level.uiParent;
    timer.alignX = "center";
    timer.alignY = "top";
    timer.alpha = 1;
    timer.hideWhenDead = false;
    timer.hideWhenInDemo = true;
    timer.hideWhenInMenu = false;
    timer.horzAlign = "center_adjustable";
    timer.sort = 4;
    timer.vertAlign = "top_adjustable";
    timer setTimer(20);

    title = newHudElem();
    title.elemType = "font";
    title.font = "hudbig";
    title.fontScale = 1.2;
    title.children = [];
    title.parent = level.uiParent;
    title.alpha = 1;
    title.color = (0, 1, 0);
    title.glowColor = (0, 1, 0);
    title.glowAlpha = .8;
    title.hideWhenDead = false;
    title.hideWhenInDemo = true;
    title.hideWhenInMenu = false;
    title.alignX = "center";
    title.alignY = "top";
    title.horzAlign = "center_adjustable";
    title.sort = 4;
    title.vertAlign = "top_adjustable";
    title.x = 0;
    title.y = 100;
    title.label = level.gameStrings[213];

    //Determine maps
    maxMapsCount = level.mapList.size;
    if (!level.dlcEnabled) maxMapsCount = 16;

    level.mapLists[0] = randomInt(maxMapsCount);

    level.mapLists[1] = randomInt(maxMapsCount);
    if (level.mapLists[1] == level.mapLists[0])//If we rolled the same map then retry
        level.mapLists[1] = randomInt(maxMapsCount);

    level.mapLists[2] = randomInt(maxMapsCount);

    if (level.classicMapsEnabled || level.classicMapsOnly)
    {
        classicMapCount = level.classicMaps.size;
        if (!level.dlcEnabled) classicMapCount = 14;

        for (i = 0; i < 3; i++)
        {
            if (randomInt(100) > 25 && !level.classicMapsOnly)
                continue;
            level.mapLists[i] = randomInt(classicMapCount) + 100;
        }
    }
    if (level.wawMapsEnabled)
    {
        wawMapCount = level.wawMaps.size;

        for (i = 0; i < 3; i++)
        {
            if (randomInt(100) > 90)
            {
                level.mapLists[i] = randomInt(wawMapCount) + 200;
                break;
            }
        }
    }
    //End determining

    for (i = 0; i < 2; i++)
    {
        if (level.mapLists[i] >= 100 && level.mapLists[i] < 200)//Classic map
        {
            currentMapNames[i].label = level.classicMapNames[level.mapLists[i] - 100];
            currentMapDescs[i] setText(&"NULL_EMPTY");
            continue;
        }
        else if (level.mapLists[i] >= 200)//WaW map
        {
            currentMapNames[i].label = level.wawMapNames[level.mapLists[i] - 200];
            currentMapDescs[i] setText(&"NULL_EMPTY");
            continue;
        }
        currentMapNames[i].label = level.mapNames[level.mapLists[i]];
        currentMapDescs[i] setText(level.mapDesc[level.mapLists[i]]);
    }

    //Init player commands
    foreach (player in level.players)
    {
        if (!isDefined(player.isDown)) continue;//Joining players cannot vote

        controls = newClientHudElem(player);
        controls.elemType = "font";
        controls.font = "bold";
        controls.fontScale = 1.4;
        controls.children = [];
        controls.parent = level.uiParent;
        controls.alignX = "center";
        controls.alignY = "bottom";
        controls.alpha = 1;
        //controls.color = (0, 0, 1);
        controls.hideWhenDead = false;
        controls.hideWhenInDemo = true;
        controls.hideWhenInMenu = true;
        controls.horzAlign = "center_adjustable";
        controls.sort = 4;
        controls.vertAlign = "bottom_adjustable";
        controls.label = level.gameStrings[212];
        controlsText = "[{+actionslot 4}], [{+actionslot 5}], and [{+actionslot 6}]";
        
        if (player maps\mp\gametypes\_aiz_external_utils::isUsingGamepad())
        {
            controlsText = "[{+actionslot 3}], [{+actionslot 4}], and [{+actionslot 2}]";
            //Actionslot 3, 4, and 2 for votes 1, 2, and 3
            player notifyOnPlayerCommand("vote1", "+actionslot 3");
            player notifyOnPlayerCommand("vote2", "+actionslot 4");
            player notifyOnPlayerCommand("vote3", "+actionslot 2");
        }
        else
        {
            //Actionslot 4, 5, and 6 for votes 1, 2, and 3
            player notifyOnPlayerCommand("vote1", "+actionslot 4");
            player notifyOnPlayerCommand("vote2", "+actionslot 5");
            player notifyOnPlayerCommand("vote3", "+actionslot 6");
        }
        controls setText(controlsText);

        player visionSetNakedForPlayer("black_bw", 0.8);

        player.currentMapVote = -1;

        player thread watchPlayerVotes(currentMapVotes);
    }

    thread watchVotesTimer(currentMapNames, currentMapDescs, currentMapVotes, timer, title);
}

watchPlayerVotes(currentMapVotes)
{
    self endon("disconnect");

    while (true)
    {
        voteCast = self waittill_any_return("vote1", "vote2", "vote3");

        if (voteCast == "vote1")
        {
            if (level.votingFinished) return;
            if (self.currentMapVote == 0)
                continue;
            else if (self.currentMapVote == 1)
                level.mapVotes[1]--;
            else if (self.currentMapVote == 2)
                level.mapVotes[2]--;

            self.currentMapVote = 0;
            level.mapVotes[0]++;
            for (i = 0; i < 3; i++)
            {
                currentMapVotes[i] setValue(level.mapVotes[i]);
            }
        }
        else if (voteCast == "vote2")
        {
            if (level.votingFinished) return;
            if (self.currentMapVote == 1)
                continue;
            else if (self.currentMapVote == 0)
                level.mapVotes[0]--;
            else if (self.currentMapVote == 2)
                level.mapVotes[2]--;

            self.currentMapVote = 1;
            level.mapVotes[1]++;
            for (i = 0; i < 3; i++)
            {
                currentMapVotes[i] setValue(level.mapVotes[i]);
            }
        }
        else if (voteCast == "vote3")
        {
            if (level.votingFinished) return;
            if (self.currentMapVote == 2)
                continue;
            else if (self.currentMapVote == 0)
                level.mapVotes[0]--;
            else if (self.currentMapVote == 1)
                level.mapVotes[1]--;

            self.currentMapVote = 2;
            level.mapVotes[2]++;
            for (i = 0; i < 3; i++)
            {
                currentMapVotes[i] setValue(level.mapVotes[i]);
            }
        }
    }
}

watchVotesTimer(currentMapNames, currentMapDescs, currentMapVotes, timer, title)
{
    wait(20);

    timer fadeOverTime(1);
    timer.alpha = 0;
    title fadeOverTime(1);
    title.alpha = 0;

    level.votingFinished = true;

    //Determine winner
    if (level.mapVotes[0] > level.mapVotes[1] && level.mapVotes[0] >= level.mapVotes[2]) winner = 0;
    else if (level.mapVotes[1] > level.mapVotes[0] && level.mapVotes[1] >= level.mapVotes[2]) winner = 1;
    else winner = 2;

    for (i = 0; i < 3; i++)
    {
        if (i == winner) continue;
        currentMapDescs[i] fadeOverTime(1);
        currentMapDescs[i].alpha = 0;
        currentMapVotes[i] fadeOverTime(1);
        currentMapVotes[i].alpha = 0;
        currentMapNames[i] fadeOverTime(1);
        currentMapNames[i].alpha = 0;
    }

    currentMapVotes[winner] destroy();
    currentMapDescs[winner] destroy();
    //currentMapDescs[winner] moveOverTime(2);
    currentMapNames[winner] setPoint("center", "center", 0, 0, 2);
    currentMapNames[winner] changeFontScaleOverTime(2);
    currentMapNames[winner].fontScale = 1.25;

    wait(7);

    //map(level.mapList[level.mapLists[winner]]);
    //cmdexec("map " + level.mapList[level.mapLists[winner]]);
    if (level.mapLists[winner] >= 100 && level.mapLists[winner] < 200)//Classic map
        maps\mp\gametypes\_aiz_external_utils::map(level.classicMaps[level.mapLists[winner] - 100]);
    else if (level.mapLists[winner] >= 200)//Classic map
        maps\mp\gametypes\_aiz_external_utils::map(level.wawMaps[level.mapLists[winner] - 200]);
    else
        maps\mp\gametypes\_aiz_external_utils::map(level.mapList[level.mapLists[winner]]);
}

//-START MOON-//
/*
moon_doWarningMessage(text)
{
    info = self createFontString("bold", 3);
    info setPoint("LEFT", "CENTER", 800, -170);
    info.archived = false;
    info.foreground = true;
    info.hideWhenInMenu = true;
    //info.horzAlign = "center_adjustable";
    //info.vertAlign = "top";
    //info.alignX = "left";
    //info.alignY = "middle";
    //info.x = 0;
    //info.y = 25;
    //info.font = "bold";
    //info.fontScale = 3;
    info.color = (1, 0, 0);
    info setText(text);
    info.alpha = 1;
    duration = text.size * 200;
    info setPulseFX(125, duration, 200);
    //info setPoint("LEFT", "RIGHT", -1000, -170, (text.size / 2));
    info moveOverTime((text.size / 2));
    info.x -= 4000;

    wait (duration + 1);
    info destroy();
}
moon_doInfoMessageForPlayer(text)
{
    if (isDefined(self)) self iPrintLnBold("^5" + text[0]);
    else iPrintLnBold("^5" + text[0]);
    if (text.size < 2) return;
    time = 3;//text[1].size * 100;
    for (i = 1; i < text.size; i++)
    {
        wait(time);

        if (isDefined(self)) self iPrintLnBold("^5" + text[i]);
        else iPrintLnBold("^5" + text[i]);
    }
}
moon_doInfoMessage(text)
{
    iPrintLnBold("^5" + text[0]);
    if (text.size < 2) return;
    time = 3;//text[1].size * 100;
    for (i = 1; i < text.size; i++)
    {
        wait(time);
        iPrintLnBold("^5" + text[i]);
    }
}
*/
//-END MOON-//

createPowerupHud(slot)
{
    powerup = newHudElem();//createServerFontString("hudbig", 1.5);
    x = 0;
    if (slot == 1) x = -75;
    powerup.archived = false;
    powerup.foreground = true;
    powerup.hideWhenInMenu = true;
    powerup.horzAlign = "center_adjustable";
    powerup.vertAlign = "bottom";
    powerup.alignX = "center";
    powerup.alignY = "middle";
    powerup.x = x;
    powerup.y = 0;
    powerup.alpha = 1;
    return powerup;
}

createPowerupHintText()
{
    info = newHudElem();
    info.font = "hudsmall";
    info.fontScale = 1;
    info.x = 0;
    info.y = 0;
    info.vertAlign = "middle";
    info.horzAlign = "center_adjustable";
    info.hideIn3rdPerson = false;
    info.hideWhenInMenu = true;
    info.foreground = true;
    info.archived = false;
    info.alignY = "middle";
    info.alignX = "center";
    info.alpha = 1;
    info fadeOverTime(2);
    info.alpha = 0;
    return info;
}

getPerkPath(revive)
{
    if (revive)
        return 400;

    perkSlots = self getPerkHudSlotsOpen();

    if (!perkSlots[0])
        return -410;
    else if (!perkSlots[1])
        return -378;
    else if (!perkSlots[2])
        return -346;
    else if (!perkSlots[3])
        return -314;
    else if (!perkSlots[4])
        return -282;
    else if (!perkSlots[5])
        return -250;
    else if (!perkSlots[6])
        return -186;
    else return -186;//Error
}

getPerkHudSlotsOpen()
{
    ret = [];
    for (i = 0; i < 7; i++)
        ret[i] = self.perkHudsDone[i];
    return ret;
}

fadeOutIcon(fadeTime, delay)
{
    if (!isDefined(delay))
        delay = 1;

    wait(delay);

    self fadeOverTime(fadeTime);
    self.alpha = 0;
}
destroyHud(time)
{
    if (!isDefined(time))
    {
        self destroy();
        return;
    }

    wait(time);

    self destroy();
}

createIntermissionTimer()
{
    if (isDefined(level.intermissionHud))
    {
        level.intermissionHud destroy();
        level.intermissionHud = undefined;
    }
    intermission = newTeamHudElem("allies");
    intermission.x = 5;
    intermission.y = 120;
    intermission.alignX = "left";
    intermission.alignY = "top";
    intermission.horzAlign = "left_adjustable";
    intermission.vertAlign = "top_adjustable";
    intermission.foreground = true;
    intermission.alpha = 0;
    intermission.archived = false;
    intermission.hideWhenInMenu = true;
    intermission.color = (0, .85, .85);
    intermission.glowColor = (0, .85, .85);
    intermission.glowAlpha = .5;
    intermission.font = "hudbig";
    intermission.fontScale = .7;
    intermission.label = level.gameStrings[21];
    intermission setValue(0);
    return intermission;
}

createReviveHeadIcon()
{
    icon = newTeamHudElem("allies");
    icon setShader("waypoint_revive", 8, 8);
    icon.alpha = .85;
    icon.archived = false;
    icon setWaypoint(true, true);
    icon setTargetEnt(self);
    return icon;
}
createCarePackageIcon(iconName)
{
    icon = newTeamHudElem("allies");
    icon setShader(iconName, 8, 8);
    icon.alpha = .85;
    icon.archived = false;
    icon setWaypoint(true, false);
    icon setTargetEnt(self);
    return icon;
}

createReviveOverlayIcon()
{
    icon = newClientHudElem(self);
    if (isDefined(self.hud_perks[6])) perk = self.hud_perks[6];
    else perk = level.roundHud;//Fallback just in-case. Should never happen
    icon.x = perk.x;
    icon.y = perk.y;
    icon.alignX = perk.alignX;
    icon.alignY = perk.alignY;
    icon.vertAlign = perk.vertAlign;
    icon.horzAlign = perk.horzAlign;
    shaderName = "waypoint_revive";
    if ((level.classicPerks == 1 && !array_contains(level.wawMaps, level._mapname)) || (level.classicPerks == 2 && array_contains(level.classicMaps, level._mapname)))
        shaderName = "specialty_pistoldeath_upgrade";
    icon setShader(shaderName, perk.width, perk.height);
    icon.hideWhenInMenu = true;
    icon.foreground = true;
    icon.archived = false;
    icon.alpha = 0;
    return icon;
}

createReviveOverlay()
{
    icon = newClientHudElem(self);
    //icon setPoint("center", "middle");
    icon.x = 0;
    icon.y = 0;
    icon.alignX = "left";
    icon.alignY = "top";
    icon.horzAlign = "fullscreen";
    icon.vertAlign = "fullscreen";
    icon setShader("combathigh_overlay", 640, 480);
    icon.sort = -10;
    icon.archived = false;
    icon.hideWhenInMenu = false;
    icon.hideIn3rdPerson = true;
    icon.foreground = true;
    icon.alpha = 1;
    return icon;
}

createPrimaryProgressBar(xOffset, yOffset)
{
    progressBar = self createIcon("progress_bar_fill", 0, 9);//NewClientHudElem(self);
    progressBar.frac = 0;
    progressBar.isScaling = false;
    progressBar.archived = false;
    progressBar.color = (1, 1, 1);
    progressBar.sort = -2;
    progressBar setShader("progress_bar_fill", 1, 9);
    progressBar.alpha = 1;
    progressBar setPoint("center", "", 0, -61);
    progressBar.alignX = "left";
    progressBar.X = -60;

    progressBarBG = self createIcon("progress_bar_bg", 124, 13);//NewClientHudElem(self);
    progressBarBG setPoint("center", "", 0, -61);
    progressBarBG.bar = progressBar;
    progressBarBG.sort = -3;
    progressBarBG.archived = false;
    progressBarBG.color = (0, 0, 0);
    progressBarBG.alpha = .5;
    //progressBarBG.parent = progressBar;
    //progressBarBG setShader("progress_bar_bg", 124, 13);
    //progressBarBG.hidden = false;
    progressBar.bg = progressBarBG;

    self.progressBar = progressBar;

    return progressBarBG;
}

updateBar(barFrac, rateOfChange)
{
    //int barWidth = (barBG.width * barFrac + .5f);

    //if (barWidth == null)
    //barWidth = 1;

    self.frac = barFrac;
    //self setShader("progress_bar_fill", barWidth, barBG.height);

    if (rateOfChange > 0)
        self scaleOverTime(rateOfChange, barFrac, self.height);
    else if (rateOfChange < 0)
        self scaleOverTime(-1 * rateOfChange, barFrac, self.height);

    //self.rateOfChange = rateOfChange;
    //time = getTime();
    //self.lastUpdateTime = time;
}