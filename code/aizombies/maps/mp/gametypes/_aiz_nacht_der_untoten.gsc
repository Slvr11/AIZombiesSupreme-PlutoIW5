#include common_scripts\utility;
#include maps\mp\gametypes\_aiz_map_edits;

initNachtMapEnts()
{
    level.crawlerCount = 10;

    initPerks();
    initMysteryBox();
    initSpawnZones();
    initBuyableDoors();
    initWallBuys();
    initRadio();
}
initPerks()
{
    perkCrate((603.125, -921.075, 138), (90, 0, 0), 4);
}
initMysteryBox()
{
    box = randomWeaponCrate((-630.537, -919.46, 100), (0, 135, 0), 0, 0);
    boxBase = spawnModel((-630.537, -919.46, 108.975), (0, 45, 0), "zombie_treasure_box");
    boxLid = spawnModel((-622.5, -927.5, 127), (0, 45, 0), "zombie_treasure_box_lid");
    box.boxBase = boxBase;
    box.boxLid = boxLid;
}
initSpawnZones()
{
    level.nacht_zoneSpawns = [];
    level.nacht_zoneSpawns[0] = [];
    level.nacht_zoneSpawns[1] = [];
    level.nacht_zoneSpawns[2] = [];

    level.nacht_zoneSpawns[0][0] = [(-444.46, -1074.1, 106.449), (0, 90, 0)];
    level.nacht_zoneSpawns[0][1] = [(214.863, -1085.17, 111.625), (0, 90, 0)];
    level.nacht_zoneSpawns[0][2] = [(866.042, -1062.44, 105.625), (0, 90, 0)];
    level.nacht_zoneSpawns[0][3] = [(1036.43, -588.881, 107.769), (0, -180, 0)];
    level.nacht_zoneSpawns[0][3] = [(339.979, -479.361, 112.6), (0, -90, 0)];
    level.nacht_zoneSpawns[1][0] = [(-878.778, 225.975, 106.496), (0, -90, 0)];
    level.nacht_zoneSpawns[1][1] = [(-514.339, -163.522, 106.086), (0, 180, 0)];
    level.nacht_zoneSpawns[2][0] = [(-1130.05, -585.759, 238.192), (0, 0, 0)];
    level.nacht_zoneSpawns[2][1] = [(-520.245, -390.782, 244.625), (0, -180, 0)];
    level.nacht_zoneSpawns[2][2] = [(-229.174, -394.625, 244.625), (0, -90, 0)];

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

            if (player.origin[2] > 215)
            {
                foreach (spawn in level.nacht_zoneSpawns[2])
                {
                    activeSpawns[activeSpawns.size] = spawn[0];
                    activeSpawnAngles[activeSpawnAngles.size] = spawn[1];
                }
            }
            else if (player.origin[0] > -555)
            {
                foreach (spawn in level.nacht_zoneSpawns[0])
                {
                    activeSpawns[activeSpawns.size] = spawn[0];
                    activeSpawnAngles[activeSpawnAngles.size] = spawn[1];
                }
            }
            else
            {
                foreach (spawn in level.nacht_zoneSpawns[1])
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
initBuyableDoors()
{
    createDoor((-556.227, -562.629, 1000), (-556.227, -562.629, 125), (90, 0, 0), 2, 2, 75, 1000);
    createDoor((-1043.99, -894.166, 1000), (-1043.99, -894.166, 261), (90, 90, 0), 2, 2, 75, 1000);
    createDoor((-112.29, -578.81, 1000), (-112.29, -578.81, 261), (90, 0, 0), 4, 2, 100, 1000);
}
initWallBuys()
{
    spawnMapEditObject("wallweapon", (464.78, -863, 168), (0, 180, 0), "iw5_mk14_mp", 600);
    spawnMapEditObject("wallweapon", (12.6913, -1007, 168), (0, 180, 0), "iw5_msr_mp_msrscope", 200);
    spawnMapEditObject("wallweapon", (-444.219, -433, 308), (0, 0, 0), "iw4_ranger_mp", 1200);
    spawnMapEditObject("wallweapon", (121, -931.273, 304), (0, 90, 0), "frag_grenade_mp", 250);
    spawnMapEditObject("wallweapon", (-1045, -1007, 304), (0, 180, 0), "iw4_scar_mp", 1800);
    spawnMapEditObject("wallweapon", (-995, -103.721, 317), (0, 90, 0), "iw5_spas12_mp", 1500);
    spawnMapEditObject("wallweapon", (-850, -227, 295), (-90, 180, 0), "iw5_l96a1_mp_l96a1scope", 1500);
    spawnMapEditObject("wallweapon", (-722.246, 163, 168), (0, 0, 0), "iw4_ranger_mp", 1200);
    spawnMapEditObject("wallweapon", (-995, 88.3882, 168), (0, 90, 0), "iw5_mp5_mp", 1200);
}
initRadio()
{
    radio = spawn("script_model", (-866.504, -985.714, 145));
    radio.angles = (0, 55, 0);
    radio setModel("static_berlin_ger_radio_d");
    radio setCanDamage(true);
    radio setCanRadiusDamage(false);

    level.radioSongs = [];
    level.radioSongs[0] = "aiz_radio_music_00";
    level.radioSongs[1] = "aiz_radio_music_01";
    level.radioSongs[2] = "aiz_radio_music_02";
    level.radioSongs[3] = "aiz_radio_music_03";
    level.radioSongs[4] = "aiz_radio_music_04";
    level.radioSongs[5] = "aiz_radio_music_05";
    level.radioSongs[6] = "aiz_radio_music_06";
    level.radioSongs[7] = "aiz_radio_music_07";
    level.radioSongs[8] = "aiz_radio_music_08";
    level.radioSongs[9] = "aiz_radio_music_09";
    level.radioSongs[10] = "aiz_radio_music_10";
    level.radioSongs[11] = "aiz_radio_music_11";
    level.radioSongs[12] = "aiz_radio_music_12";

    radio thread watchRadioUsage();
}
watchRadioUsage()
{
    level endon("game_ended");

    while (true)
    {
        self waittill("damage");

        //self stopSounds();
        foreach (player in level.players)
        {
            player stopLocalSound(level.radioSongs[level.radioSong]);
        }

        if (!isDefined(level.radioSong) || level.radioSong > 12)
            level.radioSong = 0;
        else
            level.radioSong++;

        wait(1);

        //self playSound(level.radioSongs[level.radioSong]);
        foreach (player in level.players)
        {
            player playLocalSound(level.radioSongs[level.radioSong]);
        }
    }
}