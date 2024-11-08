#include maps\mp\gametypes\_aiz_map_edits;

setRandomMapVariation()
{
    if (isDefined(level.mapVariation))
        return;

    setDvarIfUninitialized("aiz_forceMapVariation", -1);

    if (getDvarInt("aiz_forceMapVariation") != -1)
    {
        level.mapVariation = getDvarInt("aiz_forceMapVariation");
        setDvar("aiz_forceMapVariation", -1);
        return;
    }

    variations = 0;

    currentMap = maps\mp\gametypes\_aiz::getMapname();
    switch (currentMap)
    {
        case "mp_aground_ss":
            variations = 1;
        break;
        case "mp_alpha":
            variations = 2;
        break;
        case "mp_boardwalk":
            variations = 1;
        break;
        case "mp_bootleg":
            variations = 2;
        break;
        case "mp_bravo":
            variations = 3;
        break;
        case "mp_burn_ss":
            variations = 2;
        break;
        case "mp_carbon":
            variations = 2;
        break;
        case "mp_cement":
            variations = 1;
        break;
        case "mp_courtyard_ss":
            variations = 1;
        break;
        case "mp_crosswalk_ss":
            variations = 2;
        break;
        case "mp_dome":
            variations = 4;
        break;
        case "mp_exchange":
            variations = 2;
        break;
        case "mp_hardhat":
            variations = 2;
        break;
        case "mp_hillside_ss":
            variations = 2;
        break;
        case "mp_interchange":
            variations = 1;
        break;
        case "mp_italy":
            variations = 2;
        break;
        case "mp_lambeth":
            variations = 2;
        break;
        case "mp_meteora":
            variations = 3;
        break;
        case "mp_moab":
            variations = 1;
        break;
        case "mp_mogadishu":
            variations = 2;
        break;
        case "mp_morningwood":
            variations = 2;
        break;
        case "mp_nola":
            variations = 2;
        break;
        case "mp_overwatch":
            variations = 2;
        break;
        case "mp_paris":
            variations = 2;
        break;
        case "mp_park":
            variations = 3;
        break;
        case "mp_plaza2":
            variations = 3;
        break;
        case "mp_qadeem":
            variations = 2;
        break;
        case "mp_radar":
            variations = 2;
        break;
        case "mp_restrepo_ss":
            variations = 1;
        break;
        case "mp_roughneck":
            variations = 1;
        break;
        case "mp_seatown":
            variations = 2;
        break;
        case "mp_shipbreaker":
            variations = 3;
        break;
        case "mp_six_ss":
            variations = 3;
        break;
        case "mp_terminal_cls":
            variations = 3;
        break;
        case "mp_underground":
            variations = 2;
        break;
        case "mp_village":
            variations = 2;
        break;
        case "mp_afghan":
            variations = 1;
        break;
        case "mp_boneyard":
            variations = 1;
        break;
        case "mp_brecourt":
            variations = 1;
        break;
        case "mp_checkpoint":
            variations = 1;
        break;
        case "mp_derail":
            variations = 1;
        break;
        case "mp_estate":
            variations = 1;
        break;
        case "mp_favela":
        case "mp_fav_tropical":
            variations = 1;
        break;
        case "mp_highrise":
            variations = 4;
        break;
        case "mp_invasion":
            variations = 1;
        break;
        case "mp_nightshift":
            variations = 3;
        break;
        case "mp_quarry":
            variations = 1;
        break;
        case "mp_rundown":
            variations = 1;
        break;
        case "mp_rust":
            variations = 2;
        break;
        case "mp_subbase":
            variations = 1;
        break;
        case "mp_terminal":
            variations = 1;
        break;
        case "mp_underpass":
            variations = 1;
        break;
        case "mp_overgrown":
            variations = 1;
        break;
        case "mp_trailerpark":
            variations = 1;
        break;
        case "mp_compact":
            variations = 1;
        break;
        case "mp_strike":
        case "mp_strike_sh":
            variations = 1;
        break;
        case "mp_complex":
            variations = 2;
        break;
        case "mp_abandon":
            variations = 1;
        break;
        case "mp_vacant":
            variations = 1;
        break;
        case "mp_storm":
            variations = 1;
        break;
        case "mp_fuel2":
            variations = 2;
        break;
        case "mp_crash":
            variations = 1;
        break;
        case "mp_nuked":
            variations = 1;
        break;
        case "mp_crossfire":
        case "mp_cross_fire":
            variations = 1;
        break;
        case "mp_factory_sh":
            variations = 1;
        break;
    }

    if (!isDefined(variations) || variations == 0)
    {
        level.mapVariation = 0;
        return;
    }

    level.mapVariation = randomInt(variations);
}
loadMapEdits()
{
    currentMap = maps\mp\gametypes\_aiz::getMapname();

    switch (currentMap)
    {
        case "mp_aground_ss":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("randombox", (341.1407, 576.8909, 284.9333), (0, 162.1107, 0), (-17.50956, -709.1782, 350.3681), (0, -7.062256, 0), (-574.7835, -1134.847, 369.4264), (0, -91.99706, 0));
                spawnMapEditObject("gambler", (469.1854, -348.1917, 174.3127), (0, -95.96313, 0));
                spawnMapEditObject("bank", (1068.856, 89.21447, 47.52819), (90, 56.98854, 0));
                spawnMapEditObject("ammo", (-270.3638, 500.5797, 228.4288), (0, 55.18678, 0));
                spawnMapEditObject("killstreak", (36.67386, -488.019, 182.7489), (0, 172.4164, 0));
                spawnMapEditObject("pap", (367.883, 565.0043, 414.8687), (0, 163.4021, 0));
                spawnMapEditObject("power", (273.7923, 76.36286, 302.3199), (0, -158.36, 0));
                spawnMapEditObject("perk1", (783.6359, 1702.27, 522.4825), (90, -115.4309, 0));
                spawnMapEditObject("perk2", (216.7466, 1394.825, 451.1817), (90, 85.84962, 0));
                spawnMapEditObject("perk3", (-106.3734, 684.2304, 310.5125), (90, 77.1869, 0));
                spawnMapEditObject("perk4", (154.875, -1308.793, 348.154), (90, 131.2891, 0));
                spawnMapEditObject("perk5", (778.4287, -541.6369, 201.5777), (90, -2.178337, 0));
                spawnMapEditObject("perk6", (-168.0649, 32.47624, 157.6616), (90, 86.92628, 0));
                spawnMapEditObject("perk7", (469.4084, -9.142142, 78.01875), (90, 81.50452, 0));
                spawnMapEditObject("zombiespawn", (-958.7206, 817.3451, 302.6606), (0, -6.864006, 0));
                spawnMapEditObject("zombiespawn", (209.114, 1636.704, 455.5318), (0, -61.69677, 0));
                spawnMapEditObject("zombiespawn", (1335.445, 849.6512, 280.6962), (0, -174.6033, 0));
                spawnMapEditObject("zombiespawn", (1677.333, -340.9425, 25.84279), (0, 157.6178, 0));
                spawnMapEditObject("zombiespawn", (254.8445, -1335.041, 302.9737), (0, 43.99171, 0));
                spawnMapEditObject("zombiespawn", (-564.0526, -163.1858, 360.6947), (0, 16.57533, 0));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Shipwrecked");
            }
        break;
        case "mp_alpha":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("gambler", (-1197.116, 743.9009, 15), (0, -0.1916504, 0));
                spawnMapEditObject("ammo", (-2116.949, 1279.289, 15), (0, 179.7552, 0));
                spawnMapEditObject("killstreak", (-1514.181, 1514.102, 41.86679), (0, -75.23377, 0));
                spawnMapEditObject("pap", (-2130.557, 1334.265, 151), (0, -181.6663, 0));
                spawnMapEditObject("bank", (-1315.13, 1150.447, 46.125), (0, -90, 0));
                spawnMapEditObject("bank", (-1315.13, 1268.171, 46.125), (0, -90, 0));
                spawnMapEditObject("power", (-1523.41, 1213.641, 6.999997), (0, -89.1998, 0));
                spawnMapEditObject("perk2", (-1931.709, 273.1333, 30), (90, -269.859, 0));
                spawnMapEditObject("perk3", (-1732.951, 1618.766, 30), (90, -88.71093, 0));
                spawnMapEditObject("perk7", (-2273.438, 848.6833, 38.125), (90, -0.4797363, 0));
                spawnMapEditObject("perk1", (-975.8814, 1534.19, 24.83136), (90, -180.639, 0));
                spawnMapEditObject("perk4", (-971.2021, 526.6331, 31.3789), (90, -219.9811, 0));
                spawnMapEditObject("perk5", (-1610.61, 203.2794, 32.55821), (90, -224.6887, 0));
                spawnMapEditObject("perk6", (-1506.494, 1008.492, 30), (90, -180.4358, 0));
                spawnMapEditObject("spawn", (-2166.601, 1029.015, 8.124998), (0, -51.91222, 0));
                spawnMapEditObject("spawn", (-1915.466, 973.0109, 8.125), (0, -176.3928, 0));
                spawnMapEditObject("spawn", (-1947.199, 563.8745, 8.125002), (0, 137.6184, 0));
                spawnMapEditObject("spawn", (-2221.319, 541.465, 8.125146), (0, 33.72623, 0));
                spawnMapEditObject("spawn", (-2226.563, 704.6058, 8.125001), (0, -4.379876, 0));
                spawnMapEditObject("spawn", (-1971.393, 839.0378, 8.125), (0, 175.3504, 0));
                //spawnMapEditObject("zombiespawn", (-939.3597, 1976.819, -1.700775), (0, -179.9249, 0));
                //spawnMapEditObject("zombiespawn", (-1570.073, 1997.044, 0.1241395), (0, -89.49645, 0));
                //spawnMapEditObject("zombiespawn", (-1566.863, -68.84322, 2.301201E-07), (0, 178.4711, 0));
                //spawnMapEditObject("zombiespawn", (-715.0025, 799.1139, 1.53741E-07), (0, -90.65002, 0));
                spawnMapEditObject("zombiespawn", (-2396.853, 634.0237, 16.15733), (0, 1.477829, 0));
                spawnMapEditObject("wall", (-941.215, 700.9441, -7.618019), (-940.1479, 569.125, 103.1347));
                spawnMapEditObject("invisiblewall", (-1558.513, 490.6158, 4.124996), (-1493.076, 486.742, 87.82573));
                spawnMapEditObject("invisiblewall", (-1664, 175.7095, -7.536827), (-1792, 174.6878, 102.0943));
                spawnMapEditObject("invisiblewall", (-1139.115, 1750.354, 0), (-1032.78, 1745.09, 102.2118));
                spawnMapEditObject("wall", (-1765.614, 1744.37, 0), (-1370.471, 1743.133, 105.0327));
                spawnMapEditObject("invisiblewall", (-2197.842, 1301.875, 139.637), (-2048.077, 1301.875, 282.3616));
                spawnMapEditObject("invisiblewall", (-2048, 1314.723, 133.1399), (-2050.875, 1712.949, 226.8385));
                spawnMapEditObject("invisiblewall", (-2041.289, 1725.527, 134.4933), (-1030.125, 1718.61, 264.3337));
                spawnMapEditObject("wall", (-945.918, 1600, -7.988579), (-946.4444, 1472.125, 127.6115));
                spawnMapEditObject("wall", (-2045.36, 1548.358, 15.7622), (-1927.031, 1554.761, 142.491));
                spawnMapEditObject("wall", (-1938.08, 1559.308, 23.10029), (-1928.748, 1706.934, 146.2535));
                spawnMapEditObject("timedTeleporter", (-1680.255, 1318.541, -8.000004), (0, 88.7879, 0), (-1170.572, 1833, 136.125), (0, 180.0726, 0), (-2178.533, 1135.875, 36.30004), (90, 274.9591, 0), 45);
                spawnMapEditObject("doorandspawn", (-2355.317, 443.4815, -64.12499), (-2208.793, 441.8744, 0.6677701), (90, 270, 0), 2, 2, 100, 1000, (-1547.362, -61.36381, 8.134858), (0, 177.5173, 0));
                spawnMapEditObject("doorandspawn", (-1991.242, 1164.743, -192.0937), (-1996.477, 1162.125, 7.456046), (90, 270, 0), 2, 2, 100, 1000, (-944.9256, 1986.861, 6.252026), (0, -169.8595, 0));
                spawnMapEditObject("model", "mil_sandbag_desert_short", (-1695.349, 174.7109, -15.360437), (0, 91.98676, 0));
                spawnMapEditObject("model", "mil_sandbag_desert_short", (-1756.702, 175.6447, -15.195924), (0, 90.95929, 0));
                //spawnMapEditObject("model", "mil_sandbag_desert_short", (-947.0297, 660.2387, -4.843279), (0, 182.2211, 0));
                //spawnMapEditObject("model", "mil_sandbag_desert_end_right", (-944.6318, 600.1844, -5.658981), (0, 181.1391, 0));
                spawnMapEditObject("model", "mil_sandbag_desert_short", (-1091.135, 1744.769, -15), (0, 268.7991, 0));
                spawnMapEditObject("model", "vehicle_v22_osprey_rear_door_mp", (-1527.896, 498.7471, 7.13233), (90, 88.87321, 0));
                spawnMapEditObject("wall", (-1012.097, 1788.053, 136.125), (-1010.861, 1855.793, 243.0331));
                spawnMapEditObject("wall", (-1956.52, 1914.862, 136.1431), (-1844.558, 1916.279, 334.0298));
                spawnMapEditObject("mapname", "Storefront");
                spawnMapEditObject("hellMap", false);
                spawnMapEditObject("randombox", (-1898.557, 755.5709, 37.125), (0, -88.14142, 0), (-2368.492, 1232.984, 15.125), (0, -268.0536, 0), (-1760.397, 828.8702, 7.000003), (0, -2.277771, 0));
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("bank", (1333.462, 3950.249, 22.84509), (90, 137.3387, 0));
                spawnMapEditObject("ammo", (42.22259, 4290.291, 6.700933), (0, 81.60503, 0));
                spawnMapEditObject("killstreak", (887.6296, 4733.386, 29.20708), (0, -0.468338, 0));
                spawnMapEditObject("gambler", (130.0968, 4695.85, 23.30808), (0, 71.71733, 0));
                spawnMapEditObject("pap", (594.9877, 3935.281, 6.999997), (0, -179.4466, 0));
                spawnMapEditObject("power", (94.3338, 4193.598, 7), (0, 55.0291, 0));
                spawnMapEditObject("perk1", (821.2165, 3933.643, 22), (90, 89.09772, 0));
                spawnMapEditObject("perk2", (1333.93, 4745.456, 47.95876), (90, 214.254, 0));
                spawnMapEditObject("perk3", (967.8165, 3954.571, 22), (90, 89.77887, 0));
                spawnMapEditObject("perk4", (595.9818, 4748.57, 42.6791), (90, 270.4655, 0));
                spawnMapEditObject("perk5", (111.3661, 3997.256, 22), (90, 91.86078, 0));
                spawnMapEditObject("perk6", (83.22473, 4580.447, 22.07697), (90, 351.2535, 0));
                spawnMapEditObject("perk7", (360.0338, 3926.047, 22), (90, 90.34467, 0));
                spawnMapEditObject("spawn", (1138.824, 4097.467, -5.933173), (0, 140.7829, 0));
                spawnMapEditObject("spawn", (1183.379, 4561.989, -1.090564), (0, -157.6497, 0));
                spawnMapEditObject("spawn", (1000.01, 4357.769, -3.244367), (0, 177.9332, 0));
                spawnMapEditObject("zombiespawn", (-100.126, 4483.524, -17.04814), (0, -7.56001, 0));
                spawnMapEditObject("zombiespawn", (-100.1245, 4113.86, -16.35352), (0, -1.632886, 0));
                spawnMapEditObject("zombiespawn", (17.60597, 3942.226, 1), (0, 58.82488, 0));
                spawnMapEditObject("zombiespawn", (434.1639, 5060.077, 5.217858), (0, -98.18622, 0));
                spawnMapEditObject("randombox", (1327.435, 4389.836, 12.20284), (0, -89.83662, 0), (815.5609, 4326.822, 10.78018), (0, -90.38594, 0), (432.8777, 4753.117, 26.41632), (0, -7.318314, 0));
                spawnMapEditObject("invisiblewall", (1358.481, 3955.125, 64.125), (1348.231, 4773.314, 150.125));
                spawnMapEditObject("invisiblewall", (1328.875, 4776.919, 19.15702), (582.0444, 4775.895, 150.98228));
                spawnMapEditObject("invisiblewall", (582.0444, 4775.895, 11.98228), (231.2685, 4776.785, 150.678935));
                spawnMapEditObject("invisiblewall", (50.14779, 4558.172, -8.364677), (22.48543, 4358.265, 100.40899));
                spawnMapEditObject("invisiblewall", (3.065675, 4220.339, -10.01857), (-28.06731, 4021.001, 100.1249973));
                spawnMapEditObject("invisiblewall", (-18.35583, 3969.47, 0.1249973), (132.875, 4003.261, 100.875));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Tunnels of Death");
                spawnMapEditObject("invisiblewall", (1183.51, 3919.875, 0.1862972), (982.7047, 3919.875, 67.09972));

                spawnMapEditObject("model", "mil_sandbag_desert_short", (550, 4775, 12), (0, 90, 0));
                spawnMapEditObject("model", "mil_sandbag_desert_short", (475, 4775, 12), (0, 90, 0));
                spawnMapEditObject("model", "mil_sandbag_desert_short", (400, 4775, 12), (0, 90, 0));
                spawnMapEditObject("model", "mil_sandbag_desert_short", (325, 4775, 12), (0, 90, 0));
                spawnMapEditObject("model", "mil_sandbag_desert_short", (250, 4775, 12), (0, 90, 0));

                spawnMapEditObject("model", "mil_sandbag_desert_short", (50, 4535, -7),(0, -10, 0));
                spawnMapEditObject("model", "mil_sandbag_desert_short", (40, 4460, -7),(0, -10, 0));
                spawnMapEditObject("model", "mil_sandbag_desert_short", (30, 4385, -7),(0, -10, 0));

                spawnMapEditObject("model", "mil_sandbag_desert_short", (0, 4200, -7), (0, -10, 0));
                spawnMapEditObject("model", "mil_sandbag_desert_short", (-10, 4125, -7), (0, -10, 0));
                spawnMapEditObject("model", "mil_sandbag_desert_short", (-20, 4050, -7), (0, -10, 0));
            }

            deleteBarrels();
        break;
        case "mp_boardwalk":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("bank", (-460.8416, 426.0996, 158), (90, 180.6299, 0));
                spawnMapEditObject("ammo", (-738.5969, 2504.24, 148.1872), (0, 24.03077, 0));
                spawnMapEditObject("killstreak", (-457.125, 2681.16, 145.213), (0, -91.05102, 0));
                spawnMapEditObject("pap", (604.171, -1160.682, 738.125), (0, 0.9320374, 0));
                spawnMapEditObject("power", (-862.65, 528.3214, 143), (0, -47.27048, 0));
                spawnMapEditObject("perk1", (-1068.507, 820.7234, 158), (90, 359.8773, 0));
                spawnMapEditObject("perk2", (-427.9544, 1936.533, 158.125), (90, 176.7829, 0));
                spawnMapEditObject("perk3", (-786.2184, 2869.951, 158.125), (90, 269.6064, 0));
                spawnMapEditObject("perk4", (-438.8819, 2243.186, 158.125), (90, 177.5025, 0));
                spawnMapEditObject("perk5", (-927.1591, 1420.883, 158.125), (90, 43.88672, 0));
                spawnMapEditObject("perk6", (-1126.504, 2696.601, 158.125), (90, 43.67798, 0));
                spawnMapEditObject("perk7", (-448.1255, 676.7341, 165.3643), (90, 180.3754, 0));
                spawnMapEditObject("spawn", (-584.4022, 523.4749, 128), (0, 93.62733, 0));
                spawnMapEditObject("spawn", (-841.783, 813.1806, 128), (0, -0.2233744, 0));
                spawnMapEditObject("spawn", (-822.2852, 1490.509, 128.125), (0, 43.73842, 0));
                spawnMapEditObject("spawn", (-608.4197, 2702.521, 128.125), (0, -94.06859, 0));
                spawnMapEditObject("zombiespawn", (-1159.323, 2875.755, 128), (0, -47.36021, 0));
                spawnMapEditObject("zombiespawn", (-1068.025, 2955.825, 128), (0, -43.33922, 0));
                spawnMapEditObject("zombiespawn", (-123.6232, 1341.038, 104.5657), (0, 178.8263, 0));
                spawnMapEditObject("zombiespawn", (-341.4359, 961.319, 111.1075), (0, 179.5789, 0));
                spawnMapEditObject("zombiespawn", (-692.7685, 284.1996, 128), (0, 74.56057, 0));
                spawnMapEditObject("zombiespawn", (-1029.623, 317.9945, 128.125), (0, 88.21108, 0));
                spawnMapEditObject("zombiespawn", (-1129.391, 1875.214, 103.5842), (0, 0, 0));
                spawnMapEditObject("gambler", (-444.6065, 1581.704, 143.125), (0, -87.96568, 0));
                spawnMapEditObject("randombox", (-290.1267, 1151.899, 162.1966), (0, -90.60789, 0), (-723.4194, 1677.118, 143.125), (0, -92.99193, 0), (-822.3966, 2243.32, 143), (0, -269.5258, 0), (-789.1017, 617.105, 143), (0, -233.6005, 0));
                spawnMapEditObject("invisiblewall", (-1162.648, 2767.125, 128.125), (-949.4772, 2977.471, 266.1281));
                spawnMapEditObject("invisiblewall", (-715.8701, 2898.409, 136.1334), (-507.1511, 2831.701, 255.5515));
                spawnMapEditObject("invisiblewall", (-429.4053, 2558.082, 136.125), (-433.6916, 2447.125, 231.103));
                spawnMapEditObject("invisiblewall", (-993.9177, 1936.137, 136.1259), (-866.6492, 1936.125, 223.0973));
                spawnMapEditObject("invisiblewall", (-1101.975, 1911.866, 128.1301), (-1088.598, 1823.527, 263.1381));
                spawnMapEditObject("invisiblewall", (-246.3367, 1399.875, 60.125), (-244.1841, 915.4606, 262.3385));
                spawnMapEditObject("invisiblewall", (-1101.767, 880.875, 170.125), (-1095.382, 762.1615, 297.6872));
                spawnMapEditObject("invisiblewall", (-1078.03, 358.375, 128.125), (-582.125, 370.0515, 262.0704));
                spawnMapEditObject("invisiblewall", (-1094.266, 545.5129, 173.5022), (-1090.013, 375.1617, 262.0704));
                spawnMapEditObject("timedTeleporter", (-556.2935, 1152.016, 128.125), (0, 0, 0), (605.1708, -1766.547, 723.125), (3.609009, 88.96363, 0), (-597.211, 2074.191, 85.1395), (0, 0, 0), 45);
                spawnMapEditObject("model", "bw_musichall_railings_01", (-1151.616, 2760.134, 128.005), (0, 131, 0));
                spawnMapEditObject("model", "bw_musichall_railings_01", (-943.1472, 2984.205, 128.1409), (0, -45.718, 0));
                spawnMapEditObject("model", "bw_musichall_railings_01", (-516.8497, 2839.566, 128.126), (0, -105.7049, 0));
                spawnMapEditObject("model", "bw_musichall_railings_01", (-436.375, 2585.891, 128.1416), (0, -3.475327, 0));
                spawnMapEditObject("model", "bw_vehicle_luxurysedan_white", (-190.2799, 971.8802, 30.997642), (-20.20386, -175.1587, 0));
                spawnMapEditObject("model", "bw_barrier_pedestrian_01", (-239.88, 1344.788, 130.1267), (0, 90, 0));
                spawnMapEditObject("model", "bw_musichall_railings_01", (-1080.291, 367.8721, 128.1259), (0, 85.66225, 0));
                spawnMapEditObject("model", "bw_musichall_railings_01", (-924.8392, 364.2642, 128.1267), (0, 91.41359, 0));
                spawnMapEditObject("model", "bw_musichall_railings_01", (-750.5847, 366.2008, 128.0063), (0, 90.43847, 0));
                spawnMapEditObject("model", "bw_barrier_pedestrian_01", (-1082.198, 1871.382, 128.125), (0, -90.03661, 0));
                spawnMapEditObject("model", "bw_barrier_pedestrian_01", (-923.9429, 1928.616, 125.127), (0, 0, 0));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "The Pier");
            }
        break;
        case "mp_bootleg":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("wall", (2691.865, -761.1094, -77.64759), (2360.378, -408.5709, 24.125));
                spawnMapEditObject("randombox", (1328.286, -1070.231, -56.53188), (0, 89.74357, 0), (2684.875, -1155.314, -56.875), (0, -89.54784, 0), (1213.263, -2051.585, -50.875), (0, 180, 0), (2451.001, -1799.484, -64.875), (0, 180, 0), (2519.708, -625.7852, -64.875), (0, -49.96033, 0), (2507.584, -609.121, -79.875), (0, -49.71863, 0));
                spawnMapEditObject("gambler", (1463.134, -836.9544, -56.875), (0, -178.8262, 0));
                spawnMapEditObject("bank", (2714.23, -842.3275, -9.875), (90, -179.9029, 0));
                spawnMapEditObject("ammo", (2153.392, -426.8525, -56.875), (0, 179.4672, 0));
                spawnMapEditObject("killstreak", (1855.115, -725.5793, -56.875), (0, -89.62646, 0));
                spawnMapEditObject("pap", (864.3459, -1507.125, -50.875), (0, -179.1723, 0));
                spawnMapEditObject("power", (2084.549, -1033.707, 3.32788), (0, 151.6151, 0));
                spawnMapEditObject("perk1", (2722.462, -1343.421, -29.86471), (90, 178.3905, 0));
                spawnMapEditObject("perk2", (1132.727, -1428.063, -35.875), (90, -90.83496, 0));
                spawnMapEditObject("perk3", (2722.65, -1660.658, -29.86467), (90, 178.3905, 0));
                spawnMapEditObject("perk4", (1257.359, -1281.316, -43.1142), (90, 4.079704, 0));
                spawnMapEditObject("perk5", (747.0739, -1991.355, -35.875), (90, -1.693633, 0));
                spawnMapEditObject("perk6", (1720.625, -884.1638, -41.875), (90, -88.991, 0));
                spawnMapEditObject("perk7", (2202.072, -1597.993, -38.58672), (90, 1.1903, 0));
                spawnMapEditObject("spawn", (1657.649, -1177.215, -80.18114), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (1155.297, -1118.281, -70.66986), (0, 0.4652023, 0));
                spawnMapEditObject("zombiespawn", (2343.306, -443.9353, -71.875), (0, -110.6505, 0));
                spawnMapEditObject("zombiespawn", (2214.492, -1784.344, -65.73041), (0, 61.76891, 0));
                spawnMapEditObject("zombiespawn", (1385.36, -2041.626, -65.875), (0, 133.1965, 0));
                spawnMapEditObject("door", (1387.136, -1501.972, -167.9973), (1382.13, -1510.842, -65.875), (90, 89.2804, 0), 2, 2, 75, 1000);
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Stormy Outbreak");
                spawnMapEditObject("invisiblewall", (2727.125, -1422.38, -67.875), (2727.125, -1257.735, 0));
                spawnMapEditObject("invisiblewall", (2723.413, -1583.655, -67.26445), (2724.674, -1743.355, 0));
                spawnMapEditObject("invisiblewall", (2727.125, -1211.125, -67.875), (2721.644, -1316.551, 50.2602923));
                spawnMapEditObject("bank", (2710.875, -1050.837, -3.875), (90, -179.0647, 0));
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("spawn", (-3389.225, 186.4263, -104.5), (0, -48.11462, 0));
                spawnMapEditObject("spawn", (-2610.494, 189.158, -104.5), (0, -121.4319, 0));
                spawnMapEditObject("spawn", (-3019.359, 129.5372, -104.5), (0, -92.29614, 0));
                spawnMapEditObject("spawn", (-3001.847, -1091.329, -104.5), (0, 90.81848, 0));
                spawnMapEditObject("spawn", (-2896.626, -2744.24, -104.5), (0, 93.34534, 0));
                spawnMapEditObject("spawn", (-2707.601, -3437.488, -104.5), (0, 107.7814, 0));
                spawnMapEditObject("zombiespawn", (-2698.419, -3820.603, -104.5), (0, 94.05945, 0));
                spawnMapEditObject("zombiespawn", (-2983.163, -3833.395, -104.5), (0, 90.34058, 0));
                spawnMapEditObject("zombiespawn", (-3331.321, -3890.198, -104.5), (0, 60.95764, 0));
                spawnMapEditObject("zombiespawn", (-3417.505, 666.9776, -104.5), (0, -76.40442, 0));
                spawnMapEditObject("zombiespawn", (-2989.99, 646.6419, -104.5), (0, -90.41748, 0));
                spawnMapEditObject("zombiespawn", (-2663.099, 661.1052, -104.5), (0, -115.675, 0));
                spawnMapEditObject("bank", (-2538.394, -3631.106, -74.5), (90, 140.0482, 0));
                spawnMapEditObject("ammo", (-3509.389, -1649.262, -89.5), (0, -268.4399, 0));
                spawnMapEditObject("killstreak", (-3509.458, -1136.001, -89.5), (0, -267.8741, 0));
                spawnMapEditObject("pap", (-3505.713, -3392.7, -56.875), (0, -269.0387, 0));
                spawnMapEditObject("power", (-2970.9, -1682.702, -89.5), (0, 5.218506, 0));
                spawnMapEditObject("perk1", (-2528.743, -2938.597, -74.5), (90, 180.368, 0));
                spawnMapEditObject("perk2", (-2520.125, -197.7135, -72.8253), (90, 181.5216, 0));
                spawnMapEditObject("perk3", (-2536.341, -2400.124, -74.5), (90, 180.7471, 0));
                spawnMapEditObject("perk4", (-2542.919, -635.6421, -74.5), (90, 178.8959, 0));
                spawnMapEditObject("perk5", (-2524.725, -1902.863, -74.5), (90, 181.8018, 0));
                spawnMapEditObject("perk6", (-2537.401, -1199.651, -74.5), (90, 182.4939, 0));
                spawnMapEditObject("perk7", (-3500.648, -3066.742, -74.5), (90, 0.3460693, 0));
                spawnMapEditObject("randombox", (-3509.557, -2115.095, -56.87499), (0, 89.58801, 0), (-3268.878, -2651.331, -89.5), (0, -264.5892, 0), (-3022.657, -55.76895, -89.5), (0, 2.263184, 0));
                spawnMapEditObject("gambler", (-3496.395, -295.3313, -89.375), (0, 86.3031, 0));
                spawnMapEditObject("invisiblewall", (-3502.961, -3671.979, -104.375), (-2524.609, -3677.916, 58.5785));
                spawnMapEditObject("invisiblewall", (-2528.125, 393.7729, -96.36382), (-3511.875, 392.125, -16.00009));
                spawnMapEditObject("invisiblefloor", (-3533.21, -2427.316, 40.125), (-3304.92, -2889.163, 40.125));
                spawnMapEditObject("model", "cs_handrail_256_single_short", (-3063, -3659.252, -105.47548), (0, 89.9938, 0));
                spawnMapEditObject("model", "cs_handrail_256_single_short", (-2810, -3659.252, -105.47548), (0, 89.9938, 0));
                spawnMapEditObject("model", "cs_handrail_256_single_short", (-2577, -3659.252, -105.47548), (0, 89.9938, 0));
                spawnMapEditObject("model", "cs_handrail_256_single_short", (-2655.512, 387.9506, -105.36521), (0, -89.58247, 0));
                spawnMapEditObject("model", "cs_handrail_256_single_short", (-2903.512, 387.9506, -105.36521), (0, -89.58247, 0));
                spawnMapEditObject("model", "cs_handrail_256_single_short", (-3156.512, 387.9506, -105.36521), (0, -89.58247, 0));
                spawnMapEditObject("model", "cs_handrail_256_single_short", (-3409.512, 387.9506, -105.36521), (0, -89.58247, 0));
                spawnMapEditObject("mapname", "River of Blood");
                spawnMapEditObject("maxWave", 30);
            }

            deleteDestructables("india_vehicle_rksw");
        break;
        case "mp_bravo":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("wall", (-770.2695, -2328.355, 1122.132), (-141.0002, -2345.118, 1205.128));
                spawnMapEditObject("wall", (-131.5078, -2341.972, 1122.402), (161.3716, -2647.633, 1202.917));
                spawnMapEditObject("wall", (183.6852, -2662.12, 1122.135), (377.2848, -2306.432, 1244.825));
                spawnMapEditObject("wall", (466.6313, -1988.625, 1113.869), (467.383, -2042.363, 1201.994));
                spawnMapEditObject("wall", (927.8615, -1668.127, 1102.497), (712.9033, -1849.969, 1165.888));
                spawnMapEditObject("wall", (-39.29714, -1707.823, 1124.462), (-337.2409, -1822.489, 1208.04));
                spawnMapEditObject("wall", (250.3085, -1551.608, 1067.29), (118.7982, -1768.126, 1215.065));
                spawnMapEditObject("wall", (570.1251, -1500.231, 1037.975), (507.8301, -1502.129, 1053.779));
                spawnMapEditObject("wall", (-750.7681, -2046.664, 1124.125), (-799.1096, -2059.11, 1179.093));
                //spawnMapEditObject("wall", (231.7581, -1160.375, 979.3713), (230.3672, -1114.406, 1094.85));
                spawnMapEditObject("randombox", (-862.1409, -2137.925, 1129.125), (0, 68.26085, 0), (-205.4091, -1807.743, 1129.125), (0, 18.84434, 0), (518.588, -1459.932, 1027.981), (0, 179.3601, 0), (458.1564, -2179.575, 1128.861), (0, -97.33058, 0));
                spawnMapEditObject("gambler", (212.593, -1683.853, 1091.306), (0, 54.18187, 0));
                spawnMapEditObject("bank", (-23.28344, -1978.255, 1148.845), (90, 140.7542, 0));
                spawnMapEditObject("ammo", (-101.6882, -2007.088, 1130.68), (0, -29.51748, 0));
                spawnMapEditObject("killstreak", (233.151, -2140.866, 1127.727), (0, -89.0359, 0));
                spawnMapEditObject("pap", (-476.2795, -1874.391, 1129.125), (0, 2.941631, 0));
                spawnMapEditObject("power", (645.5797, -1446.867, 1045.188), (0, 88.43175, 0));
                spawnMapEditObject("perk1", (173.8295, -2605.448, 1144.125), (90, 95.28722, 0));
                spawnMapEditObject("perk2", (-61, -1748, 1144), (90, -136, 0));
                spawnMapEditObject("perk3", (898.1193, -1463.015, 1085.078), (90, 178.2505, 0));
                spawnMapEditObject("perk4", (748.8512, -1192.582, 1046.726), (90, -178.8656, 0));
                spawnMapEditObject("perk5", (432.7163, -2013.889, 1141.919), (90, 164.8966, 0));
                spawnMapEditObject("perk6", (-454.813, -2306.612, 1144.125), (90, 90.22801, 0));
                spawnMapEditObject("perk7", (303.2016, -1438.756, 1009.5359), (90, 88.0692, 0));
                spawnMapEditObject("spawn", (-624.6323, -2174.801, 1113.732), (0, -4.644428, 0));
                spawnMapEditObject("zombiespawn", (373.0444, -1092.875, 970.0383), (0, -78.94496, 0));
                spawnMapEditObject("zombiespawn", (659.0114, -1865.021, 1106.983), (0, 78.68687, 0));
                spawnMapEditObject("zombiespawn", (-756.4673, -2298.585, 1114.125), (4.195557, 38.28465, 0));
                spawnMapEditObject("spawn", (309.2785, -1789.669, 1065.593), (0, -104.5541, 0));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Rundown Village");
                spawnMapEditObject("floor", (386.828, -1566.051, 1047.494), (600.8749, -1464.875, 1065.1));

                //Add a wall under the North wall
                spawnMapEditObject("wall", (720, -1845, 1068), (927, -1675, 1050));
                //Add a death trigger by the west shack roof to avoid getting on top
                spawnMapEditObject("deathwall", (351, -1351, 1135), (358, -1448, 1170));
                //Add a wall by the clubhouse
                spawnMapEditObject("invisiblewall", (228, -1154, 971), (228, -1120, 1025));
                spawnMapEditObject("model", "ch_washer_01", (230, -1145, 971), (0, 90, 0));
                //Easter egg =P
                egg = spawnMapEditObject("wallweapon", (230, -1145, 965), (90, 0, 0), "stinger_mp", 100000);
                egg.script_noteworthy = "bravo_easter_egg";
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("bank", (-152.1335, -320.9995, 1277.125), (90, 92.05444, 0));
                spawnMapEditObject("ammo", (-310.2183, 397.416, 1255.125), (0, -90.4193, 0));
                spawnMapEditObject("killstreak", (283.8186, -181.0234, 1230.895), (0, -90.12816, 0));
                spawnMapEditObject("pap", (16.45718, 2.366876, 1232.908), (0, 0.426651, 0));
                spawnMapEditObject("gambler", (167.125, 157.3564, 1231.125), (0, 87.08131, 0));
                spawnMapEditObject("perk1", (-2.108717, 304.05, 1243.41), (90, 91.22316, 0));
                spawnMapEditObject("perk7", (890.9663, -212.8054, 1128.19), (90, 91.06935, 0));
                spawnMapEditObject("spawn", (31.63648, -157.0538, 1221.729), (0, 31.33669, 0));
                spawnMapEditObject("spawn", (-179.3089, -157.0214, 1216.321), (0, 132.5592, 0));
                spawnMapEditObject("spawn", (-558.3565, 405.4885, 1212), (0, 1.563736, 0));
                spawnMapEditObject("spawn", (923.5397, 453.2903, 1179.955), (0, -139.4843, 0));
                spawnMapEditObject("spawn", (935.6453, -60.21248, 1140.337), (0, 130.0049, 0));
                spawnMapEditObject("spawn", (271.2893, 198.2177, 1209.552), (0, -88.67247, 0));
                spawnMapEditObject("zombiespawn", (-812.4183, 413.8555, 1213.364), (0, -2.155136, 0));
                spawnMapEditObject("zombiespawn", (1095.109, 267.5748, 1169.399), (0, -178.0902, 0));
                spawnMapEditObject("zombiespawn", (1040.04, -165.0674, 1128.175), (0, 173.8184, 0));
                spawnMapEditObject("zombiespawn", (819.6342, -264.6196, 1068.542), (0, 88.63588, 0));
                spawnMapEditObject("randombox", (809.9569, 166.8261, 1222.125), (0, 89.54773, 0), (517.1615, 301.875, 1224.856), (0, -172.4597, 0), (-170.3391, 397.1707, 1225.351), (0, 88.00964, 0), (883.3558, 585.3385, 1198.246), (0, -1.468491, 0));
                spawnMapEditObject("invisiblewall", (327.8736, -332.125, 1159.711), (-398.4784, -334.9166, 1447.295));
                spawnMapEditObject("invisiblewall", (-737.1249, 310.8546, 1211.002), (-723.6417, 511.1626, 1356.752));
                spawnMapEditObject("invisiblewall", (1020.558, 224.1253, 1182.774), (1049.586, 306.2988, 1299.009));
                spawnMapEditObject("invisiblewall", (1010.604, -112.1631, 1145.825), (895.1249, -224.875, 1285.369));
                spawnMapEditObject("invisiblewall", (864.1089, -243.1599, 1272.756), (754.6143, -241.6115, 1087.279));
                spawnMapEditObject("model", "ch_woodfence02", (-709.6678, 445.1129, 1211.906), (4.558105, -90.682818, 0));
                spawnMapEditObject("model", "ch_woodfence02", (-712.3167, 377.1024, 1211.994), (0.2124023, -90.77849, 0));
                spawnMapEditObject("model", "ch_woodfence02", (1029.34, 265.5826, 1180.243), (-3.118916, -112.7325, 0));
                spawnMapEditObject("model", "ch_woodfence02", (956.3441, -152.1291, 1130.283), (7.733765, -133.7714, 0));
                spawnMapEditObject("model", "ch_woodfence02", (823.453, -235.1194, 1085.707), (-1.21521, -0.84227, 0));
                spawnMapEditObject("mapname", "Abandoned Church of Hell");
                spawnMapEditObject("hellMap", true);
                spawnMapEditObject("maxWave", 20);
            }
            else if (level.mapVariation == 2)
            {
                spawnMapEditObject("bank", (1683.136, -355.9769, 1229.525), (90, 89.84437, 0));
                spawnMapEditObject("ammo", (2109.696, -95.71666, 1119.25), (0, 3.502838, 0));
                spawnMapEditObject("killstreak", (1366.88, -431.3851, 1184), (0, 89.94324, 0));
                spawnMapEditObject("gambler", (2058.77, -328.9239, 1184), (0, 0.1245422, 0));
                spawnMapEditObject("pap", (1811.491, -826.626, 1184), (0, -178.6945, 0));
                spawnMapEditObject("power", (1344.691, -810.696, 1215.124), (0, -179.2603, 0));
                spawnMapEditObject("perk1", (1478.054, -809.1699, 1199), (90, 88.74024, 0));
                spawnMapEditObject("perk2", (1598.576, -298.6917, 1146.415), (90, 91.33851, 0));
                spawnMapEditObject("perk3", (1974.549, -54.67498, 1137.449), (90, 269.0424, 0));
                spawnMapEditObject("perk4", (1347.264, 119.5553, 1171.342), (90, 1.261627, 0));
                spawnMapEditObject("perk5", (1333.182, -429.5812, 1134.897), (90, 174.9719, 0));
                spawnMapEditObject("perk6", (2021.997, -828.5245, 1199), (90, 89.79493, 0));
                spawnMapEditObject("perk7", (1266.211, -1107.976, 1117.81), (90, 89.38294, 0));
                spawnMapEditObject("spawn", (1960.185, -585.7234, 1169), (0, 179.5917, 0));
                spawnMapEditObject("spawn", (1528.531, -609.5671, 1169), (0, 3.975248, 0));
                spawnMapEditObject("spawn", (1849.082, -174.7547, 1101.948), (0, 173.8678, 0));
                spawnMapEditObject("spawn", (1572.065, -164.3234, 1112.431), (0, -0.5621266, 0));
                spawnMapEditObject("spawn", (1453.547, 135.5523, 1141.284), (0, -98.17565, 0));
                spawnMapEditObject("spawn", (1270.76, -783.7657, 1090.746), (0, 89.69058, 0));
                spawnMapEditObject("zombiespawn", (1087.083, -925.6336, 1072.219), (0, 8.677397, 0));
                spawnMapEditObject("zombiespawn", (1422.374, 448.6563, 1193.574), (0, -89.02404, 0));
                spawnMapEditObject("zombiespawn", (1121.115, -153.7252, 1130.147), (0, -8.406364, 0));
                spawnMapEditObject("randombox", (1845.31, 132.5251, 1167.386), (0, -0.6335144, 0), (2127.602, -200.3465, 1115.953), (0, -90.7434, 0), (2099.264, -603.5198, 1184), (0, -91.10046, 0));
                spawnMapEditObject("invisiblewall", (1380.826, 332.639, 1179.446), (1480.898, 355.238, 1250.185));
                spawnMapEditObject("invisiblewall", (1348.093, 295.2274, 1170.502), (1318.683, 231.125, 1250.391));
                spawnMapEditObject("invisiblewall", (1192.066, -208.875, 1125.063), (1192.061, -119.1256, 1300.578));
                spawnMapEditObject("invisiblewall", (1194.363, -1108.875, 1086.396), (1188.889, -571.1249, 1320.919));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Rundown Church");
                spawnMapEditObject("model", "ch_woodfence02", (1200, -500, 1087), (0, 90, 0));
                spawnMapEditObject("model", "ch_woodfence02", (1200, -575, 1087), (0, 90, 0));
                spawnMapEditObject("model", "ch_woodfence02", (1200, -650, 1087), (0, 90, 0));
                spawnMapEditObject("model", "ch_woodfence02", (1200, -725, 1087), (0, 90, 0));
                spawnMapEditObject("model", "ch_woodfence02", (1200, -800, 1087), (0, 90, 0));
                spawnMapEditObject("model", "ch_woodfence02", (1200, -875, 1087), (0, 90, 0));
                spawnMapEditObject("model", "ch_woodfence02", (1200, -950, 1087), (0, 90, 0));
                spawnMapEditObject("model", "ch_woodfence02", (1200, -1025, 1087), (0, 90, 0));
                spawnMapEditObject("model", "ch_woodfence02", (1200, -1100, 1087), (0, 90, 0));
                spawnMapEditObject("model", "ch_woodfence02", (1200, -125, 1125), (0, 90, 0));
                spawnMapEditObject("model", "ch_woodfence02", (1200, -200, 1125), (0, 90, 0));
                spawnMapEditObject("model", "ch_woodfence02", (1350, 265, 1160), (0, 75, 0));
                spawnMapEditObject("model", "ch_woodfence02", (1432, 340, 1175), (0, 10, 0));
            }
        break;
        case "mp_burn_ss":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("bank", (-735.2396, 144.262, 20.33632), (90, 3.700562, 0));
                spawnMapEditObject("ammo", (-691.5839, 454.9291, -29.89503), (0, -89.88098, 0));
                spawnMapEditObject("killstreak", (-697.177, -167.929, -25.36185), (0, -84.60205, 0));
                spawnMapEditObject("gambler", (-884.5652, -485.111, -29.55206), (0, -264.1077, 0));
                spawnMapEditObject("pap", (-831.2606, 144.6747, 16.14492), (0, -90.05127, 0));
                spawnMapEditObject("perk1", (-907.977, 590.7829, -3.147518), (90, 35.03357, 0));
                spawnMapEditObject("perk7", (-671.7068, -665.7536, -5.078579), (90, 201.5149, 0));
                spawnMapEditObject("spawn", (-787.8166, -842.6994, -25.37172), (0, 89.12476, 0));
                spawnMapEditObject("spawn", (-784.4083, 798.5833, -21.51034), (0, -91.7871, 0));
                spawnMapEditObject("zombiespawn", (-1044.786, 781.1536, 3), (0, 3.876343, 0));
                spawnMapEditObject("zombiespawn", (-553.2466, 778.2497, -2.462217), (0, 179.4049, 0));
                spawnMapEditObject("zombiespawn", (-539.1583, -832.8982, -1), (0, -179.0295, 0));
                spawnMapEditObject("zombiespawn", (-1028.317, -852.8845, -2.153985), (0, 0.03662109, 0));
                spawnMapEditObject("randombox", (-771.9486, 938.0078, 5.751894), (0, -0.6610107, 0), (-800.1982, -1000.264, 11.64045), (0, -176.8268, 0));
                spawnMapEditObject("invisiblewall", (-955.1249, -711.8702, -11.67329), (-950.1786, -1013.353, 133));
                spawnMapEditObject("invisiblewall", (-620.8751, -717.4592, -10.94221), (-612.3034, -1008.237, 133));
                spawnMapEditObject("invisiblewall", (-955.1249, 645.3553, -10.9422), (-959.6349, 942.6385, 133));
                spawnMapEditObject("invisiblewall", (-620.8751, 643.9806, -11.50152), (-616.8752, 946.7717, 133));
                spawnMapEditObject("invisiblefloor", (-708.577, 63.50367, 64.125), (-879.0874, 235.6419, 66.26411));
                spawnMapEditObject("hellMap", true);
                spawnMapEditObject("maxWave", 20);
                spawnMapEditObject("mapname", "Hideout Of Hell");
                spawnMapEditObject("model", "junk_scrap_pile_01", (-590, -800, -30), (0, 270, 0));
                spawnMapEditObject("model", "junk_scrap_pile_01", (-575, -950, -25), (0, 270, 0));
                spawnMapEditObject("model", "junk_scrap_pile_01", (-975, -800, -30), (0, 90, 0));
                spawnMapEditObject("model", "junk_scrap_pile_01", (-975, -950, -25), (0, 90, 0));
                spawnMapEditObject("model", "junk_scrap_pile_01", (-590, 700, -30), (0, 270, 0));
                spawnMapEditObject("model", "junk_scrap_pile_01", (-575, 850, -25), (0, 270, 0));
                spawnMapEditObject("model", "junk_scrap_pile_01", (-975, 700, -30), (0, 90, 0));
                spawnMapEditObject("model", "junk_scrap_pile_01", (-975, 850, -25), (0, 90, 0));
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("gambler", (887.1559, -145.3552, 79), (0, 45.54382, 0));
                spawnMapEditObject("bank", (726.9144, -481.4971, 140.3255), (90, -353.3698, 0));
                spawnMapEditObject("ammo", (1516.159, -183.4867, 79), (0, -108.9294, 0));
                spawnMapEditObject("killstreak", (1209.914, -66.538, 83.36443), (0, -0.8129883, 0));
                spawnMapEditObject("pap", (1698.67, -527.5768, 121.125), (0, -181.8237, 0));
                spawnMapEditObject("power", (1338.189, -832.9613, 5.872458), (0, -90.17578, 0));
                spawnMapEditObject("perk1", (667.1063, -755.3026, 36.00212), (90, -9.73938, 0));
                spawnMapEditObject("perk2", (893.6008, -1013.461, 33.34481), (90, -270.6812, 0));
                spawnMapEditObject("perk3", (1719.154, -646.1578, 52.29939), (90, -177.6544, 0));
                spawnMapEditObject("perk4", (1426.38, -55.39871, 99.53697), (90, -87.20398, 0));
                spawnMapEditObject("perk5", (887.6667, -547.9784, 91.02951), (90, -127.2327, 0));
                spawnMapEditObject("perk6", (1536.58, -1015.144, 28.97404), (90, -270.1154, 0));
                spawnMapEditObject("perk7", (645.9259, -996.0443, 30), (90, -319.455, 0));
                spawnMapEditObject("spawn", (1033.052, -919.9263, 0.125001), (0, 25.43335, 0));
                spawnMapEditObject("spawn", (1040.946, -800.4338, 0.125003), (0, -7.789307, 0));
                //spawnMapEditObject("spawn", (1085.163, -632.8234, 30.3022), (0, -15.44128, 0));
                spawnMapEditObject("spawn", (1071.866, -121.5415, 64.125), (0, -12.91992, 0));
                spawnMapEditObject("spawn", (1108.705, -287.4729, 64.125), (0, 4.394531, 0));
                spawnMapEditObject("spawn", (1111.39, -453.5952, 64.125), (0, 21.38489, 0));
                spawnMapEditObject("zombiespawn", (1889.968, -200.3752, 64), (0, 178.9893, 0));
                spawnMapEditObject("zombiespawn", (1885.095, -394.3391, 64), (0, 179.2584, 0));
                spawnMapEditObject("zombiespawn", (1852.546, -773.1504, -6.29589), (0, 177.9071, 0));
                spawnMapEditObject("zombiespawn", (1807.048, -948.3333, -9.45771), (0, 171.7383, 0));
                spawnMapEditObject("wall", (955.2197, -19.29483, 70.58832), (1740.408, -25.05984, 232.6227));
                spawnMapEditObject("invisiblewall", (1742.13, -507.791, 64), (1754.972, -43.77222, 212.2306));
                spawnMapEditObject("invisiblewall", (1745.479, -539.8193, 63.62962), (1730.35, -1085.78, 195.4224));
                spawnMapEditObject("invisiblewall", (1729.593, -1088.301, 0), (1746.081, -662.7444, 58.18152));
                spawnMapEditObject("invisiblewall", (653.1095, -1032.579, 0), (766.2963, -1018.017, 117.037));
                spawnMapEditObject("invisiblewall", (772.8625, -1019.465, 1.186367), (895.488, -1039.919, 120.2356));
                spawnMapEditObject("invisiblewall", (914.5338, -1038.244, 3.497589), (1021.031, -1026.628, 138.2569));
                spawnMapEditObject("invisiblewall", (1040.668, -1023.719, 2.011509), (1278.975, -1027.126, 116.1281));
                spawnMapEditObject("invisiblewall", (1273.922, -1028.077, 0), (1408.458, -1041.53, 138.4703));
                spawnMapEditObject("invisiblewall", (1416.622, -1044.165, 0), (1540.531, -1039.525, 112.5494));
                spawnMapEditObject("invisiblewall", (1708.702, -1065.952, 0), (1552.675, -1042.056, 105.9388));
                spawnMapEditObject("invisiblefloor", (1540.778, -243.8613, 64.98938), (1705.14, -122.8047, 64.98938));
                spawnMapEditObject("mapname", "Freeway Escape");
                spawnMapEditObject("hellMap", false);
                spawnMapEditObject("randombox", (1005.282, -376.8354, 79), (0, 51.84998, 0), (945.873, -670.2155, 29.86664), (0, 3.944092, 0), (1177.19, -993.4594, 15), (0, -178.6432, 0));
                spawnMapEditObject("invisiblewall", (992.3681, -507.6734, 48.76154), (1657.465, -522.6901, -14.14964));
                spawnMapEditObject("ramp", (1424.124, -635.0936, 27.17059), (1421.649, -532.125, 85.4774));
                spawnMapEditObject("ramp", (1100.46, -637.6795, 27.16196), (1102.328, -532.1251, 85.54246));
                spawnMapEditObject("model", "junk_scrap_pile_01", (1800, -250, 50), (0, 270, 0));
                spawnMapEditObject("model", "junk_scrap_pile_01", (1800, -400, 50), (0, 270, 0));
                spawnMapEditObject("model", "me_streetlight", (1775, -648, 80), (-43, -7, 94));
                spawnMapEditObject("model", "junk_scrap_pile_01", (1800, -750, -25), (0, 270, 0));
                spawnMapEditObject("model", "junk_scrap_pile_01", (1800, -950, -35), (0, 270, 0));
            }

            deleteDestructables();
        break;
        case "mp_carbon":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("bank", (-3107.876, -3331.301, 3614.796), (90, 181.4332, 0));
                spawnMapEditObject("ammo", (-3148.236, -3878, 3586.242), (0, 0.9772263, 0));
                spawnMapEditObject("killstreak", (-3366.089, -3735.932, 3584.834), (0, -4.807068, 0));
                spawnMapEditObject("pap", (-3768.479, -3241.094, 3769.125), (0, 89.24136, 0));
                spawnMapEditObject("power", (-3592.145, -3336.621, 3584.373), (0, -2.34613, 0));
                spawnMapEditObject("gambler", (-2746.068, -4329.384, 3581.976), (0, -114.3573, 0));
                spawnMapEditObject("perk1", (-2710.584, -4101.035, 3630.125), (90, 179.0985, 0));
                spawnMapEditObject("perk2", (-3305.988, -3103.742, 3599.997), (90, 269.7248, 0));
                spawnMapEditObject("perk3", (-2814.256, -4504.883, 3597.518), (90, 160.235, 0));
                spawnMapEditObject("perk4", (-3373.682, -4177.64, 3601.385), (90, 245.7032, 0));
                spawnMapEditObject("perk5", (-3642.918, -4438.863, 3602), (90, 89.72476, 0));
                spawnMapEditObject("perk6", (-3750.267, -4021.331, 3608.393), (90, 359.0161, 0));
                spawnMapEditObject("perk7", (-4051.877, -3190.732, 3656.417), (90, 359.3732, 0));
                spawnMapEditObject("spawn", (-3758.917, -3674.195, 3568.802), (0, -29.44943, 0));
                spawnMapEditObject("spawn", (-3025.31, -4477.495, 3566.604), (0, 114.9933, 0));
                spawnMapEditObject("spawn", (-3258.351, -3338.232, 3570.204), (0, -136.0498, 0));
                spawnMapEditObject("spawn", (-3676.094, -4170.656, 3574.065), (0, 30.55792, 0));
                spawnMapEditObject("zombiespawn", (-2917.815, -4888.474, 3598.358), (0, 90.55425, 0));
                spawnMapEditObject("zombiespawn", (-3073.711, -4891.946, 3587.961), (0, 95.91009, 0));
                spawnMapEditObject("zombiespawn", (-4019.918, -3893.848, 3584.494), (0, 3.218436, 0));
                spawnMapEditObject("randombox", (-3955.561, -3674.569, 3587.72), (0, -268.7701, 0), (-3903.483, -3476.122, 3633.125), (0, -179.0777, 0), (-3845.412, -4421.422, 3612.085), (0, -180.4565, 0), (-3476.537, -4006.606, 3598.202), (0, -140.675, 0));
                spawnMapEditObject("timedTeleporter", (-3010.463, -4375.93, 3566.739), (0, -90, 0), (-3580.654, -3033.789, 3618.125), (0, -91.25851, 0), (-3023.965, -4051, 3570.666), (90, -90, 0), 45);
                spawnMapEditObject("invisiblewall", (-2840.925, -4791.896, 3598.927), (-3159.875, -4785.125, 3692.708));
                spawnMapEditObject("invisiblewall", (-4063.875, -3293.875, 3626.125), (-3890.946, -3293.849, 3728.856));
                spawnMapEditObject("invisiblewall", (-3771.875, -3293.875, 3626.125), (-3699.024, -3293.869, 3716.236));
                spawnMapEditObject("invisiblewall", (-3464.128, -3238.324, 3626.125), (-3464.163, -3156.188, 3729.869));
                spawnMapEditObject("invisiblewall", (-3439.875, -3062.648, 3760.125), (-3439.875, -2996.492, 3849.638));
                spawnMapEditObject("invisiblewall", (-3063.875, -3568.487, 3616.125), (-3063.875, -3504.185, 3705.078));
                spawnMapEditObject("invisiblewall", (-3215.855, -3662.719, 3616.125), (-3215.86, -3792.327, 3706.667));
                spawnMapEditObject("invisiblewall", (-2924.946, -4031.875, 3616.125), (-2862.368, -4031.874, 3707.049));
                spawnMapEditObject("invisiblewall", (-3184.125, -4570.217, 3584.125), (-3184.125, -4502.701, 3674.92));
                spawnMapEditObject("invisiblewall", (-3518.476, -4464.125, 3584.125), (-3586.231, -4464.125, 3675.96));
                spawnMapEditObject("model", "vehicle_v22_osprey_rear_door_mp", (-3174.983, -4537.641, 3584.125), (90, 0, 0));
                spawnMapEditObject("model", "vehicle_v22_osprey_rear_door_mp", (-3552.165, -4453.205, 3584.125), (90, 90.46084, 0));
                spawnMapEditObject("model", "vehicle_v22_osprey_rear_door_mp", (-3735.702, -3304.748, 3627.125), (90, -89.51171, 0));
                spawnMapEditObject("model", "vehicle_v22_osprey_rear_door_mp", (-3936.975, -3306.894, 3629.125), (90, -90, 0));
                spawnMapEditObject("model", "vehicle_v22_osprey_rear_door_mp", (-4005.176, -3306.894, 3629.125), (90, -90, 0));
                spawnMapEditObject("model", "vehicle_v22_osprey_rear_door_mp", (-3451.02, -3028.039, 3763.125), (90, -179.3195, 0));
                spawnMapEditObject("model", "fence_tarp_162x64", (-2905.085, -4784.33, 3580.166), (0, 0, 0));
                spawnMapEditObject("model", "fence_tarp_162x64", (-3065.998, -4784.33, 3580.166), (0, 0, 0));
                spawnMapEditObject("model", "vehicle_v22_osprey_rear_door_mp", (-2894, -4035, 3615), (90, 90, 0));
                spawnMapEditObject("model", "vehicle_v22_osprey_rear_door_mp", (-3225, -3760, 3615), (90, 0, 0));
                spawnMapEditObject("model", "vehicle_v22_osprey_rear_door_mp", (-3225, -3700, 3615), (90, 0, 0));
                spawnMapEditObject("model", "vehicle_v22_osprey_rear_door_mp", (-3075, -3540, 3615), (90, 0, 0));
                spawnMapEditObject("mapname", "Zaring Industries");
                spawnMapEditObject("maxWave", 30);
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("bank", (-1807.465, -5188.294, 3790.125), (90, 207.9821, 0));
                spawnMapEditObject("ammo", (-2066.383, -5882.367, 3783.503), (0, -38.33138, 0));
                spawnMapEditObject("killstreak", (-2372.043, -5893.241, 3831.356), (-32.65137, -10.95891, 0));
                spawnMapEditObject("pap", (-2844.824, -5615.573, 3681.765), (0, -170.4035, 0));
                spawnMapEditObject("power", (-2411.426, -5453.287, 3685.721), (0, -256.7176, 0));
                spawnMapEditObject("gambler", (-2277.002, -5870.612, 3769.8), (0, 6.866379, 0));
                spawnMapEditObject("perk1", (-1762.666, -5937.084, 3778.599), (90, 254.8772, 0));
                spawnMapEditObject("perk2", (-1674.109, -5659.844, 3780.934), (90, 70.21906, 0));
                spawnMapEditObject("perk3", (-1550.789, -5231.621, 3806.22), (90, -131.424, 0));
                spawnMapEditObject("perk4", (-2808.791, -5984.693, 3745.54), (90, 358.2202, 0));
                spawnMapEditObject("perk5", (-2163.34, -5000.447, 3746.024), (90, 293.7249, 0));
                spawnMapEditObject("perk6", (-2680.543, -5128.77, 3666.34), (90, 327.5573, 0));
                spawnMapEditObject("perk7", (-2887.878, -5149.511, 3660.112), (90, 271.2853, 0));
                spawnMapEditObject("spawn", (-2085.834, -5144.517, 3724.62), (0, -103.1947, 0));
                spawnMapEditObject("spawn", (-1829.355, -5382.206, 3760.125), (0, -119.2676, 0));
                spawnMapEditObject("spawn", (-1882.943, -6137.852, 3753.753), (0, 116.3946, 0));
                spawnMapEditObject("spawn", (-2630.624, -6012.026, 3737.015), (0, 5.723801, 0));
                spawnMapEditObject("spawn", (-2076.085, -5628.349, 3751.457), (0, 13.99101, 0));
                spawnMapEditObject("spawn", (-2498.505, -5241.497, 3649.71), (0, 13.30986, 0));
                spawnMapEditObject("zombiespawn", (-2511.636, -5030.105, 3643.384), (0, -79.78829, 0));
                spawnMapEditObject("zombiespawn", (-2294.521, -4998.109, 3688.984), (0, -72.81197, 0));
                spawnMapEditObject("zombiespawn", (-2435.881, -5522.778, 3796.063), (0, 11.17302, 0));
                spawnMapEditObject("randombox", (-2042.484, -6216.279, 3769.744), (0, -195.4853, 0), (-2231.626, -5678.861, 3769.902), (0, -258.6841, 0), (-2421.61, -6099.556, 3761.239), (0, -195.694, 0), (-1959.153, -5745.188, 3763.11), (0, -222.6984, 0));
                spawnMapEditObject("invisiblewall", (-2413.105, -5536.115, 3791.057), (-2445.172, -5365.147, 3892.403));
                spawnMapEditObject("invisiblewall", (-2965.507, -5154.543, 3688.625), (-2914.072, -5640.518, 3789.623));
                spawnMapEditObject("invisiblefloor", (-2250.416, -5856.169, 3906.393), (-2418.056, -5976.566, 3906.393));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Oil Refinery");
            }

            deleteDestructables("vehicle_uk_utility_truck_destructible");
            deleteBarrels();
        break;
        case "mp_cement":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("bank", (-5267.251, -661.1862, 326.125), (90, 89.84986, 0));
                spawnMapEditObject("ammo", (-4631.661, -48.34731, 319), (0, -180.8478, 0));
                spawnMapEditObject("killstreak", (-4623.126, -103.6743, 319), (0, -0.6005554, 0));
                spawnMapEditObject("pap", (-6934.67, 279.9449, 311.125), (0, -268.8039, 0));
                spawnMapEditObject("power", (-6025.02, 138.3018, 311.1245), (0, -98.85635, 0));
                spawnMapEditObject("perk1", (-6098.54, 2119.476, 326.125), (90, 211.5349, 0));
                spawnMapEditObject("perk2", (-4351.348, -528.4923, 326), (90, 89.01535, 0));
                spawnMapEditObject("perk3", (-4357.146, 254.1559, 326), (90, 270.537, 0));
                spawnMapEditObject("perk4", (-5061.871, 352.9869, 326.125), (90, 177.1971, 0));
                spawnMapEditObject("perk5", (-5561.436, 1250.088, 326.125), (90, 211.7491, 0));
                spawnMapEditObject("perk6", (-6512.824, 682.3871, 326.125), (90, 353.0827, 0));
                spawnMapEditObject("perk7", (-6732.858, -624.6751, 326.125), (90, 89.1362, 0));
                spawnMapEditObject("spawn", (-4616.231, -303.527, 296), (0, 160.9703, 0));
                spawnMapEditObject("spawn", (-4613.902, 96.76591, 296), (0, -172.8383, 0));
                spawnMapEditObject("spawn", (-5445.438, 737.3643, 296.125), (0, -133.5786, 0));
                spawnMapEditObject("spawn", (-6175.932, -362.0105, 296.1235), (0, 51.47507, 0));
                spawnMapEditObject("spawn", (-6556.698, 291.8223, 296.1236), (0, -13.44864, 0));
                spawnMapEditObject("zombiespawn", (-7030.905, 1426.661, 300.8623), (0, -6.087799, 0));
                spawnMapEditObject("zombiespawn", (-7026.979, 1685.835, 300.0182), (0, -25.62149, 0));
                spawnMapEditObject("zombiespawn", (-7007.712, 2088.73, 298.7065), (0, -34.17435, 0));
                spawnMapEditObject("zombiespawn", (-6264.31, -1070.995, 296.125), (0, -0.006866455, 0));
                spawnMapEditObject("zombiespawn", (-5965.309, -1087.991, 296.125), (0, 164.865, 0));
                spawnMapEditObject("gambler", (-5658.766, -692.0334, 311.125), (0, -181.3472, 0));
                spawnMapEditObject("randombox", (-4288.718, -266.9008, 311), (0, -90.06729, 0), (-6275.761, -593.209, 311.125), (0, -185.5385, 0), (-5323.002, -319.2338, 311.125), (0, -109.1121, 0), (-4958.775, -76.22783, 311), (0, -90.10574, 0), (-5821.469, 1634.964, 311.125), (0, -58.95401, 0), (-5278.735, 757.0753, 311.125), (0, -59.31107, 0));
                spawnMapEditObject("invisiblewall", (-4490.307, -573.0836, 296.125), (-5079.541, -723.3958, 400));
                spawnMapEditObject("invisiblewall", (-5079.541, -723.3958, 296), (-5741.558, -734.0601, 400));
                spawnMapEditObject("invisiblewall", (-5739.389, -748.6523, 304.1261), (-5785.025, -888.0642, 350));
                spawnMapEditObject("invisiblewall", (-5993.447, -883.252, 304.125), (-6087.278, -791.2391, 350));
                spawnMapEditObject("invisiblewall", (-6629.983, -648.5513, 304.125), (-6408.643, -633.4182, 400));
                spawnMapEditObject("invisiblewall", (-6838.273, -648.584, 304.1251), (-6935.857, -652.097, 370));
                spawnMapEditObject("invisiblewall", (-6536.979, -298.0614, 296.125), (-6815.547, -265.2101, 350));
                spawnMapEditObject("invisiblewall", (-6527.025, -255.976, 296.125), (-6801.064, -214.3147, 350));
                spawnMapEditObject("invisiblewall", (-6535.2, 666.9626, 296.125), (-6814.474, 698.6323, 350));
                spawnMapEditObject("invisiblewall", (-6528.85, 701.6434, 296.125), (-6804.616, 747.915, 350));
                spawnMapEditObject("invisiblewall", (-6571.32, 864.3829, 296.125), (-6846.896, 901.1519, 350));
                spawnMapEditObject("invisiblewall", (-6567.74, 901.1876, 296.125), (-6838.982, 941.3973, 350));
                spawnMapEditObject("invisiblewall", (-5289.173, -354.9876, 296.125), (-5044.579, -443.4278, 350));
                spawnMapEditObject("invisiblewall", (-5280.456, -318.6487, 296.125), (-5024.507, -412.4382, 350));
                spawnMapEditObject("invisiblewall", (-6966.214, 1109.125, 297.3915), (-6214.943, 2302.875, 350));
                spawnMapEditObject("invisiblewall", (-4436.234, 237.2427, 296.125), (-4280.125, 252.7166, 390));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Silla Cement");
                spawnMapEditObject("invisiblefloor", (-5460.643, -708.5566, 392.4583), (-5742.381, -635.7538, 392.4583));
                spawnMapEditObject("deathwall", (-5213.606, -712.2898, 392.4583), (-5320.064, -718.6457, 415));
                spawnMapEditObject("model", "machinery_railing_single_long01", (-6950, 1109, 296), (0, 60, 0));
                spawnMapEditObject("model", "machinery_railing_single_long02", (-6890, 1209, 296), (0, 60, 0));
                spawnMapEditObject("model", "machinery_railing_single_long01", (-6830, 1309, 296), (0, 60, 0));
                spawnMapEditObject("model", "machinery_railing_single_long02", (-6770, 1409, 296), (0, 60, 0));
                spawnMapEditObject("model", "machinery_railing_single_long01", (-6710, 1509, 296), (0, 60, 0));
                spawnMapEditObject("model", "machinery_railing_single_long02", (-6650, 1609, 296), (0, 60, 0));
                spawnMapEditObject("model", "machinery_railing_single_long01", (-6590, 1709, 296), (0, 60, 0));
                spawnMapEditObject("model", "machinery_railing_single_long02", (-6530, 1809, 296), (0, 60, 0));
                spawnMapEditObject("model", "machinery_railing_single_long01", (-6470, 1909, 296), (0, 60, 0));
                spawnMapEditObject("model", "machinery_railing_single_long02", (-6410, 2009, 296), (0, 60, 0));
                spawnMapEditObject("model", "machinery_railing_single_long01", (-6350, 2109, 296), (0, 60, 0));
                spawnMapEditObject("model", "machinery_railing_single_long02", (-6290, 2209, 296), (0, 60, 0));
                spawnMapEditObject("model", "machinery_railing_single_long01", (-6000, -860, 296), (0, 135, 0));
                spawnMapEditObject("model", "cement_fence_construction_02", (-6500, -630, 296), (0, 0, 0));
                spawnMapEditObject("model", "cement_fence_construction_02", (-6615, -630, 296), (0, 0, 0));
                spawnMapEditObject("model", "cement_fence_construction_02", (-6925, -630, 296), (0, 0, 0));
                spawnMapEditObject("model", "cement_fence_construction_02", (-4485, -560, 296), (0, 195, 0));
                spawnMapEditObject("model", "cement_fence_construction_02", (-4580, -585, 296), (0, 195, 0));
                spawnMapEditObject("model", "cement_fence_construction_02", (-4675, -610, 296), (0, 195, 0));
                spawnMapEditObject("model", "cement_fence_construction_02", (-4770, -635, 296), (0, 195, 0));
                spawnMapEditObject("model", "cement_fence_construction_02", (-4865, -660, 296), (0, 195, 0));
                spawnMapEditObject("model", "cement_fence_construction_02", (-4960, -685, 296), (0, 195, 0));
            }

            deleteBarrels();
            deleteDestructables();
            for (i = 18; i < 2000; i++)
            {
                ent = getEntByNum(i);
                if (!isDefined(ent)) continue;
                targetname = ent.targetname;
                if (!isDefined(targetname) || targetname == "") continue;

                isDestructible = (targetname == "industrial_curtain" || targetname == "animated_model" || targetname == "com_wall_fan_blade_rotate");

                if (isDestructible)
                {
                    if (isDefined(ent.target))
                    {
                        col = getEnt(ent.target, "targetname");
                        if (isDefined(col)) col delete();
                    }
                    ent delete();
                }
            }
        break;
        case "mp_courtyard_ss":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("bank", (-774.3862, -208.1267, 38.54275), (90, 273.2904, 0));
                spawnMapEditObject("gambler", (266.316, -1759.885, 30.93991), (0, -88.92517, 0));
                spawnMapEditObject("killstreak", (533.0722, 165.0571, 22.04507), (0, -2.243042, 0));
                spawnMapEditObject("pap", (-25.26222, -963.2926, 311.125), (0, -89.17786, 0));
                spawnMapEditObject("power", (-605.8003, -612.4081, 15.53453), (0, -16.29639, 0));
                spawnMapEditObject("perk1", (-942.3634, -1360.136, 47.27071), (90, 315.2545, 0));
                spawnMapEditObject("perk2", (78.84014, -1264.604, 51.27237), (90, 316.4191, 0));
                spawnMapEditObject("perk3", (92.54365, -543.4934, 30.5), (90, 316.3202, 0));
                spawnMapEditObject("perk4", (-810.4744, -938.2986, 65.82666), (90, 43.79335, 0));
                spawnMapEditObject("perk5", (-936.0306, -1764.212, 55.33812), (90, 50.70924, 0));
                spawnMapEditObject("perk6", (619.9868, -1673.082, 59.7459), (90, 137.9956, 0));
                spawnMapEditObject("perk7", (681.9017, -539.8406, 43.15352), (90, 179.4635, 0));
                spawnMapEditObject("spawn", (523.5272, -237.1829, -1.3888), (0, -93.07433, 0));
                spawnMapEditObject("spawn", (340.716, -646.36, 0.5000029), (0, -173.3404, 0));
                spawnMapEditObject("spawn", (536.7637, -1511.472, 18.45737), (0, -161.239, 0));
                spawnMapEditObject("spawn", (156.2951, -1759.726, 1.557883), (0, 83.00354, 0));
                spawnMapEditObject("spawn", (-791.4854, -1738.364, 6.312252), (0, 34.83948, 0));
                spawnMapEditObject("spawn", (-320.416, -1330.313, -5.079162), (0, -140.1947, 0));
                spawnMapEditObject("spawn", (-812.8627, -365.1616, 1.200481), (0, -52.1228, 0));
                spawnMapEditObject("spawn", (-307.749, -816.9398, 0.1564388), (0, 146.5869, 0));
                spawnMapEditObject("ammo", (366.673, -784.6226, 15.3074), (0, -183.1238, 0));
                spawnMapEditObject("randombox", (-927.1382, -545.4525, 15.89444), (0, -268.7201, 0), (-484.5564, -1563.299, 24.64538), (0, 74.32251, 0), (550.1578, -1263.808, 51.64566), (0, -2.27417, 0), (811.7006, -764.7999, 38.49203), (0, -90.54382, 0));
                spawnMapEditObject("door", (-61.00964, -820.4036, -100), (-61.00964, -820.4036, -3.371505), (90, 178.1946, 0), 4, 2, 100, 2000);
                spawnMapEditObject("door", (-71.15846, -674.1568, -100), (-71.15846, -674.1568, -3.107605), (90, 178.4695, 0), 4, 2, 100, 2000);
                spawnMapEditObject("door", (217.9402, -1100.869, -100), (217.9402, -1100.869, -6.897864), (90, -92.70628, 0), 4, 2, 100, 4000);
                spawnMapEditObject("door", (-57.09017, -1448.247, -100), (-57.09017, -1448.247, -8.63398), (90, 178.2001, 0), 4, 2, 100, 2000);
                spawnMapEditObject("door", (-49.41019, -1594.095, -100), (-49.41019, -1594.095, -0.01030046), (90, 179.6393, 0), 4, 2, 100, 2000);
                spawnMapEditObject("door", (-38.90532, -1745.664, -100), (-38.90532, -1745.664, 4.372612), (90, 178.9252, 0), 4, 2, 100, 2000);
                spawnMapEditObject("door", (-513.9961, -1090.11, -100), (-513.9961, -1090.11, 16.01619), (90, -92.6953, 0), 6, 2, 125, 4000);
                spawnMapEditObject("invisiblewall", (-944.8749, -967.7316, 128.125), (-610.8251, -964.3151, 200));
                spawnMapEditObject("invisiblewall", (-622.6249, -36.40783, 30), (-460.125, -35.75521, 150));
                spawnMapEditObject("invisiblewall", (-304.875, -360.7483, 128.125), (-207.125, -370.9566, 175));
                spawnMapEditObject("invisiblewall", (-189.6671, -531.1339, 162.125), (-189.4165, -560.8751, 200));
                spawnMapEditObject("invisiblewall", (256.875, -512.3158, 18.96746), (164.5529, -506.7122, 75));
                spawnMapEditObject("invisiblefloor", (614.2838, -496.0269, 130.3996), (710.4426, -667.3325, 129.125));
                spawnMapEditObject("invisiblewall", (256.875, 105.0446, 128.125), (256.8632, 192.8187, 200));
                spawnMapEditObject("invisiblewall", (256.8632, 192.8187, 128.125), (780.6754, 208.8756, 200));
                spawnMapEditObject("invisiblewall", (780.6754, 208.8756, 128.125), (785.4471, 51.65125, 200));
                spawnMapEditObject("invisiblewall", (785.4471, 51.65125, 164.3896), (661.9918, 51.15977, 225));
                spawnMapEditObject("invisiblewall", (651.1808, -1427.125, 47.96519), (651.1022, -1522.866, 100));
                spawnMapEditObject("invisiblewall", (-961.8932, -1231.125, 128.125), (-962.6732, -1546.639, 175));
                spawnMapEditObject("invisiblewall", (707.762, -819.2767, 128.125), (706.9829, -972.2046, 200));
                spawnMapEditObject("floor", (-147.3537, -1171.655, 271), (87.87182, -936.125, 271));
                spawnMapEditObject("timedTeleporter", (-543.2681, -228.573, 18.08796), (0, -89.94322, 0), (61.51882, -1077.228, 296.125), (0, -93.19518, 0), (553.5599, -975.3749, 73.625), (90, 90.13597, 0), 45);
                spawnMapEditObject("invisiblewall", (109.0561, -1050.125, 320.625), (108.5016, -1100.875, 380));
                spawnMapEditObject("invisiblewall", (-40.12503, -1260.95, 320.625), (-90.87499, -1258.93, 380));
                spawnMapEditObject("invisiblewall", (-233.7979, -1100.875, 320.625), (-235.576, -1050.125, 380));
                spawnMapEditObject("invisiblewall", (-72.87499, -915.4618, 320.625), (-27.12506, -915.5582, 380));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Dead Aqueduct");
                spawnMapEditObject("model", "aq_debris_pile", (675, -1490, 75), (-45, 0, 0));
                spawnMapEditObject("model", "jeepride_shrubgroup_01", (-494, -25, 25), (0, -90, 0));
                spawnMapEditObject("model", "intro_alleyway_gate_01", (-260, -360, 125), (0, 0, 0));
                spawnMapEditObject("model", "intro_alleyway_gate_01", (-250, -360, 125), (0, 180, 0));
                spawnMapEditObject("model", "aq_column_01", (-975, -1275, 130), (0, 0, 0));
                spawnMapEditObject("model", "aq_column_01", (-975, -1310, 130), (0, 0, 0));
                spawnMapEditObject("model", "aq_column_01", (-975, -1240, 130), (0, 0, 0));
                spawnMapEditObject("model", "aq_column_01", (-975, -1260, 155), (0, 0, 0));
                spawnMapEditObject("model", "aq_column_01", (-975, -1305, 155), (0, 0, 0));
                spawnMapEditObject("model", "aq_column_01", (-890, -975, 125), (0, 0, 0));
                spawnMapEditObject("model", "aq_column_01", (-850, -975, 125), (0, 0, 0));
                spawnMapEditObject("model", "aq_column_01", (-930, -975, 125), (0, 0, 0));
                spawnMapEditObject("model", "aq_column_01", (-870, -975, 150), (0, 0, 0));
                spawnMapEditObject("model", "aq_column_01", (-910, -975, 150), (0, 0, 0));
                spawnMapEditObject("model", "aq_crate01", (790, 140, 125), (0, 0, 0));
                spawnMapEditObject("model", "aq_crate01", (790, 100, 150), (0, 0, 90));
                spawnMapEditObject("model", "aq_crate01", (260, 125, 125), (0, 0, 0));
                spawnMapEditObject("model", "aq_crate01", (260, 185, 150), (0, 0, 90));

                erosion_createProgressArea((-552, -1534, 30), 448, 256, 0);
                erosion_createProgressArea((-608, -627, 0), 448, 256, 1);
                erosion_createProgressArea((531, -651, 0), 512, 256, 2);
                erosion_createProgressArea((351, -1556, 0), 384, 256, 3);
            }
        break;
        case "mp_crosswalk_ss":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("bank", (4074.604, -1408.349, 3002.125), (90, 275.3229, 0));
                spawnMapEditObject("ammo", (2615.418, -3156.376, 2987.125), (0, -147.8265, 0));
                spawnMapEditObject("killstreak", (3723.412, -2409.567, 2987.125), (0, -145.2228, 0));
                spawnMapEditObject("pap", (520.1777, -4201.985, 2987.125), (0, -235.9698, 0));
                spawnMapEditObject("power", (2769.054, -2700.47, 2987.125), (0, -56.50269, 0));
                spawnMapEditObject("perk1", (3171.517, -2789.282, 3002.125), (90, 123.6621, 0));
                spawnMapEditObject("perk2", (3546.358, -1805.221, 3002.125), (90, 302.8107, 0));
                spawnMapEditObject("perk3", (4101.932, -2131.634, 3002.125), (90, 125.2716, 0));
                spawnMapEditObject("perk4", (2255.805, -3398.813, 3002.125), (90, 122.3657, 0));
                spawnMapEditObject("perk5", (1273.519, -4071.476, 3002.125), (90, 123.3051, 0));
                spawnMapEditObject("perk6", (365.7629, -3947.188, 3002.125), (90, 343.916, 0));
                spawnMapEditObject("perk7", (1111.378, -3457.563, 3002.125), (90, 303.0139, 0));
                spawnMapEditObject("spawn", (797.1773, -4180.244, 2972.125), (0, 46.56555, 0));
                spawnMapEditObject("spawn", (740.5967, -4056.942, 2972.125), (0, 33.65662, 0));
                spawnMapEditObject("spawn", (679.1299, -3912.917, 2972.125), (0, 17.0343, 0));
                spawnMapEditObject("spawn", (1975.868, -3219.674, 2972.125), (0, 35.74951, 0));
                spawnMapEditObject("spawn", (3155.797, -2437.377, 2972.124), (0, -147.4036, 0));
                spawnMapEditObject("spawn", (3955.776, -1636.995, 2972.125), (0, -120.8771, 0));
                spawnMapEditObject("spawn", (4057.407, -1816.027, 2972.126), (0, -146.3379, 0));
                spawnMapEditObject("spawn", (4125.037, -1970.189, 2972.124), (0, -172.6062, 0));
                spawnMapEditObject("zombiespawn", (4331.577, -1378.758, 2972.125), (0, -146.6235, 0));
                spawnMapEditObject("zombiespawn", (4410.192, -1571.128, 2972.125), (0, -147.1344, 0));
                spawnMapEditObject("zombiespawn", (4535.253, -1758.907, 2972.124), (0, -158.4613, 0));
                spawnMapEditObject("zombiespawn", (245.652, -4171.125, 2972.125), (0, 32.69531, 0));
                spawnMapEditObject("zombiespawn", (342.1285, -4321.874, 2972.125), (0, 34.77722, 0));
                spawnMapEditObject("zombiespawn", (457.9912, -4474.103, 2972.125), (0, 33.09631, 0));
                spawnMapEditObject("gambler", (1718.727, -3751.939, 2987.125), (0, -144.6899, 0));
                spawnMapEditObject("randombox", (1977.571, -2831.992, 2987.125), (0, 32.90405, 0), (1459.238, -3190.813, 2987.125), (0, 31.79443, 0), (2811.781, -2267.722, 2987.125), (0, 35.97473, 0), (2551.595, -2844.218, 2987.125), (0, -234.2065, 0));
                spawnMapEditObject("invisiblewall", (4079.225, -1377.663, 2972.125), (4468.098, -1965.316, 3025));
                spawnMapEditObject("invisiblewall", (314.3286, -3927.915, 2972.125), (701.0994, -4503.249, 3050));
                spawnMapEditObject("fallLimit", 2755);
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Pandemic Bridge");
                spawnMapEditObject("model", "ny_barrier_pedestrian_01_ns", (4125, -1450, 2972), (0, 120, 0));
                spawnMapEditObject("model", "ny_barrier_pedestrian_01_ns", (4200, -1570, 2972), (0, 120, 0));
                spawnMapEditObject("model", "ny_barrier_pedestrian_01_ns", (4275, -1690, 2972), (0, 120, 0));
                spawnMapEditObject("model", "ny_barrier_pedestrian_01_ns", (4350, -1810, 2972), (0, 120, 0));
                spawnMapEditObject("model", "ny_barrier_pedestrian_01_ns", (4415, -1920, 2972), (0, 120, 0));
                spawnMapEditObject("model", "ny_barrier_pedestrian_01_ns", (350, -3985, 2972), (0, 120, 0));
                spawnMapEditObject("model", "ny_barrier_pedestrian_01_ns", (425, -4105, 2972), (0, 120, 0));
                spawnMapEditObject("model", "ny_barrier_pedestrian_01_ns", (500, -4225, 2972), (0, 120, 0));
                spawnMapEditObject("model", "ny_barrier_pedestrian_01_ns", (575, -4345, 2972), (0, 120, 0));
                spawnMapEditObject("model", "ny_barrier_pedestrian_01_ns", (640, -4455, 2972), (0, 120, 0));
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("gambler", (337.3369, 842.8126, 843.125), (0, -1.240234, 0));
                spawnMapEditObject("bank", (48.40902, 510.3041, 858.125), (90, -270.6689, 0));
                spawnMapEditObject("ammo", (58.31538, 727.892, 843.125), (0, 0.9726177, 0));
                spawnMapEditObject("killstreak", (142.2973, 845.311, 843.125), (0, 1.099846, 0));
                spawnMapEditObject("pap", (755.875, 509.3536, 845.4788), (0, -89.65821, 0));
                spawnMapEditObject("perk1", (664.0447, 670.9572, 858.125), (90, -180.7843, 0));
                spawnMapEditObject("perk1", (660.0728, 615.7908, 858.125), (90, -176.4612, 0));
                spawnMapEditObject("perk7", (240.184, 729.0833, 858.125), (90, -87.73011, 0));
                spawnMapEditObject("spawn", (584.2089, 494.382, 828.125), (0, 134.3695, 0));
                spawnMapEditObject("spawn", (553.6766, 645.756, 828.125), (0, -149.5447, 0));
                spawnMapEditObject("spawn", (587.9778, 567.6371, 828.125), (0, -177.3236, 0));
                spawnMapEditObject("zombiespawn", (-80.44938, 424.563, 828.125), (0, 89.2157, 0));
                spawnMapEditObject("zombiespawn", (-94.49701, 781.6564, 828.125), (0, -89.8175, 0));
                spawnMapEditObject("invisiblewall", (447.459, 505.2085, 828.125), (191.2567, 503.758, 864.5333));
                spawnMapEditObject("invisiblewall", (476.0937, 725.0869, 828.125), (596.9324, 725.0071, 867.6372));
                spawnMapEditObject("fallLimit", 678);
                spawnMapEditObject("mapname", "Theater of Death");
                spawnMapEditObject("hellMap", true);
                spawnMapEditObject("randombox", (523.3465, 730.6307, 843.125), (0, 0.7867355, 0), (442.9019, 507.983, 843.125), (0, -180.2954, 0), (228.4116, 507.7495, 843.125), (0, -180.6525, 0), (570.0311, 316.5594, 843.125), (0, -180.8337, 0));
                spawnMapEditObject("maxWave", 20);
            }

            deleteDestructables();
        break;
        case "mp_dome":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("invisiblewall", (-356.1974, -102.2384, -392.0464), (-400.5564, -126.4487, -143.8011));
                spawnMapEditObject("invisiblewall", (467.0097, 130.1131, -387.7624), (425.2253, 110.4209, -148.3367));
                spawnMapEditObject("randombox", (379.6824, 1213.964, -293.4713), (0, -5, 0),  (-1018.929, 137.4539, -396.7436), (0, 115.41786, 0), (66.19673, -357.997, -375.375), (0,203.1375, 0), (-258.3705, 1289.006, -275.875), (0, 240.2538, 0));
                spawnMapEditObject("pap", (1998.867, 1520.875, -175.5018), (0, -5, 0));
                spawnMapEditObject("perk1", (1035.039, 2021.086, -225.875), (90, -5, 180));
                spawnMapEditObject("perk2", (1471.526, -1046.704, -307.879), (90, -5, -135));
                spawnMapEditObject("perk3", (-1332.147, 793.8214, -421.875), (90, -5, -22));
                spawnMapEditObject("perk4", (-730.7762, 74.01582, -383.1929), (90, -5, -22));
                spawnMapEditObject("perk5", (1155.852, 655.7971, -300.1157), (-90, -5, -92));
                spawnMapEditObject("perk6", (1753.933, 563.8858, -285.6868), (90, 0, 20));
                spawnMapEditObject("door", (684.9173, 522.8765, -566.0311), (661.8373, 505.9779, -375.4572), (90, 45, -34), 14, 2, 100, 1000);
                spawnMapEditObject("perk7", (1092.138, 182.8832, -360.9137), (90, -105, 0));
                spawnMapEditObject("gambler", (824.5215, 1176.865, -247.875), (0, -5, 0));
                spawnMapEditObject("wall", (849.7073, 2549.09, -254.875), (924.6985, 2832.995, -63.1737));
                spawnMapEditObject("invisiblewall", (1723.93, 915.4915, -293.323), (1727.448, 847.5991, -199.3135));
                spawnMapEditObject("power", (612.3591, 828.6477, -297.9524), (0, -7, 0));
                spawnMapEditObject("ammo", (-92.52773, 1195.496, -273.9637), (0, 55, 0));
                //spawnMapEditObject("spawn", (78.1686, 1067.854, -300.6575), (0, -8.783312, 0));
                spawnMapEditObject("zombiespawn", (1177.834, 2428.448, -254.875), (0, -141.5366, 0));
                spawnMapEditObject("zombiespawn", (911.6275, -596.9681, -383.2052), (0, 107.1444, 0));
                spawnMapEditObject("zombiespawn", (-757.5242, -197.3448, -408.4955), (0, 64.31972, 0));
                spawnMapEditObject("zombiespawn", (-815.6216, 1462.184, -247.1191), (0, -35.96349, 0));
                spawnMapEditObject("killstreak", (1429.588, 661.9382, -303.2302), (0, -9, 0));
                //spawnMapEditObject("bank", (1172.833, 1423.236, -228.8413), (90, 0, 0));
                spawnMapEditObject("timedTeleporter", (689.1306, 728.9147, -378.4062), (0, -10, 0), (477.4431, -1271.998, -355.7211), (0, 55.05823, 0), (650.3278, 1576.241, -254.875), (90, 85, 0), 60);
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Desert Outpost");
                spawnMapEditObject("invisiblewall", (538.8015, 1609.781, -126.875), (557.2396, 1858.755, -100.8524));
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("bank", (1299.236, 1990.276, -224.875), (90, 357.001, 0));
                spawnMapEditObject("ammo", (368.1488, 1681.462, -239.875), (0, 88.07767, 0));
                spawnMapEditObject("killstreak", (1101.017, 1554.439, -239.875), (0, -185.3501, 0));
                spawnMapEditObject("gambler", (1399.431, 1626.626, -239.875), (0, -95.18529, 0));
                spawnMapEditObject("pap", (1780.224, 1289.389, -239.875), (0, -96.31688, 0));
                spawnMapEditObject("spawn", (559.2998, 2040.623, -252.1427), (0, -6.80028, 0));
                spawnMapEditObject("spawn", (704.2441, 2311.46, -254.875), (0, -95.45445, 0));
                spawnMapEditObject("spawn", (649.8371, 1735.917, -245.5824), (0, 89.50038, 0));
                spawnMapEditObject("spawn", (1134.956, 2018.833, -254.875), (0, 174.7488, 0));
                spawnMapEditObject("zombiespawn", (303.9301, 2079.357, -254.8748), (0, -4.174547, 0));
                spawnMapEditObject("zombiespawn", (1203.346, 2447.66, -254.875), (0, -149.8807, 0));
                spawnMapEditObject("zombiespawn", (1542.944, 1129.838, -254.875), (0, 87.74257, 0));
                spawnMapEditObject("randombox", (777.6398, 1593.69, -239.875), (0, -182.6474, 0), (844.8588, 2474.473, -229.875), (0, -2.422226, 0), (430.8436, 2462.794, -239.875), (0, 86.15506, 0), (1174.082, 1443.956, -239.875), (0, 89.12137, 0));
                spawnMapEditObject("perk1", (1035.039, 2021.086, -225.875), (90, -5, 180));
                spawnMapEditObject("perk7", (1451.792, 2252.38, -224.875), (90, 176.6275, 0));
                spawnMapEditObject("hellMap", true);
                spawnMapEditObject("mapname", "Abandoned Outpost of Hell");
                spawnMapEditObject("model", "fence_tarp_130x56", (363.83, 2065.223, -234.875), (0, 85.16078, 0));
                spawnMapEditObject("model", "fence_tarp_130x56", (1545.572, 1139.712, -246.875), (0, -3.92184, 0));
                spawnMapEditObject("invisiblewall", (1487.841, 1141.341, -246.875), (1599.424, 1134.924, -167.1251));
                spawnMapEditObject("invisiblewall", (349.7903, 2012.198, -246.875), (357.9987, 2122.852, -144.7739));
                spawnMapEditObject("maxWave", 20);
                spawnMapEditObject("invisiblewall", (538.8015, 1609.781, -126.875), (557.2396, 1858.755, -100.8524));

                //Taken from specialLevelFunctions
                for (i = 18; i < 1000; i++)
                {
                    ent = getEntByNum(i);
                    if (!isDefined(ent)) continue;

                    if (isDefined(ent.model) && ent.model == "vehicle_hummer_destructible")
                        ent delete();
                    if (!isDefined(ent.targetname)) continue;
                    else if (ent.targetname == "explodable_barrel")
                    {
                        col = getEnt(ent.target, "targetname");
                        if (isDefined(col)) col delete();
                        ent delete();
                    }
                }
            }
            else if (level.mapVariation == 2)
            {
                spawnMapEditObject("gambler", (-1338.217, 792.5063, -436.875), (0, -245.4712, 0));
                spawnMapEditObject("bank", (-1058.095, 581.2712, -421.875), (90, -333.6804, 0));
                spawnMapEditObject("ammo", (-1321.372, 1507.817, -428.912), (0, 22.63374, 0));
                spawnMapEditObject("killstreak", (-1182.748, 753.8653, -436.875), (0, -161.0742, 0));
                spawnMapEditObject("pap", (1228.65, 2644.799, -239.875), (0, -96.33175, 0));
                spawnMapEditObject("power", (53.39105, 291.4141, -371.4969), (0, -158.0035, 0));
                spawnMapEditObject("perk1", (-88.38508, -286.4836, -360.375), (90, -334.9164, 0));
                spawnMapEditObject("perk2", (327.818, 138.5444, -360.375), (90, -156.9927, 0));
                spawnMapEditObject("perk3", (-380.4873, -98.64292, -371.8688), (90, -246.5533, 0));
                spawnMapEditObject("perk4", (-734.9441, 72.39034, -381.3191), (90, -332.9168, 0));
                spawnMapEditObject("perk5", (104.1069, 473.7391, -337.1899), (90, -154.8669, 0));
                spawnMapEditObject("perk6", (-961.6998, 1233.472, -397.875), (90, -157.7728, 0));
                spawnMapEditObject("perk7", (-564.4634, 428.1444, -380.7717), (90, -202.2619, 0));
                spawnMapEditObject("spawn", (-1173.558, 1506.736, -427.875), (0, -103.1213, 0));
                spawnMapEditObject("spawn", (-1526.289, 1341.554, -427.875), (0, -29.05148, 0));
                spawnMapEditObject("spawn", (-935.7061, 982.3708, -428.3867), (0, 146.9495, 0));
                spawnMapEditObject("spawn", (-1270.377, 793.123, -451.875), (0, 67.50189, 0));
                spawnMapEditObject("spawn", (-976.8829, 681.5697, -451.875), (0, 125.2021, 0));
                spawnMapEditObject("spawn", (-1340.642, 1439.3, -451.875), (0, -66.48739, 0));
                spawnMapEditObject("zombiespawn", (-682.4459, 1114.396, -346.0159), (0, -159.7998, 0));
                //spawnMapEditObject("zombiespawn", (-773.1876, -233.1776, -408.8056), (0, 63.67865, 0));
                //spawnMapEditObject("zombiespawn", (47.39138, 772.6921, -319.6512), (0, -135.8716, 0));
                spawnMapEditObject("wall", (396.0384, -210.5701, -390.3748), (453.0594, -70.09396, -267.4632));
                spawnMapEditObject("invisiblewall", (-194.6784, 625.2678, -358.6866), (45.33696, 625.2322, -231.3654));
                spawnMapEditObject("invisiblewall", (-420.0981, -136.2973, -307.1866), (-335.124, -95.77793, -247.8032));
                spawnMapEditObject("invisiblewall", (-830.4742, 1000.868, -392.6192), (-879.6372, 1126.339, -277.1331));
                spawnMapEditObject("wall", (-1069.433, 1484.22, -427.875), (-1117.512, 1593.607, -317.9408));
                spawnMapEditObject("timedTeleporter", (306.8003, -111.2391, -390.375), (0, -19.88888, 0), (607.8035, 2691.167, -254.875), (0, -19.88888, 0), (-1442.836, 962.7347, -414.5015), (90, 24.30893, 0), 45);
                spawnMapEditObject("doorandspawn", (-742.1133, 236.407, -587.1916), (-796.4813, 352.0954, -411.875), (90, 113.425, 0), 9, 2, 100, 3000, (47.39138, 772.6921, -319.6512), (0, -135.8716, 0));
                spawnMapEditObject("doorandspawn", (-136.6682, 39.63727, -567.1849), (-193.8422, 133.6362, -390.3742), (90, 113.3533, 0), 5, 2, 100, 2500, (-773.1876, -233.1776, -408.8056), (0, 63.67865, 0));
                spawnMapEditObject("model", "com_barrel_blue_rust", (-860.8406, 1069.707, -398.4136), (85, 292.2986, 0));
                spawnMapEditObject("model", "com_barrel_blue_rust", (-861.4392, 1074.664, -399.311), (85, 112.3096, 0));
                spawnMapEditObject("model", "com_barrel_white_rust", (-167.7895, 625.0925, -359.6358), (0, 119.3296, 0));
                spawnMapEditObject("model", "com_barrel_white_rust", (-24.03579, 624.1446, -347.3172), (52.89248, 358.3045, 0));
                spawnMapEditObject("model", "com_barrel_white_rust", (-83.2682, 626.5635, -359.6985), (85, 359.3811, 0));
                spawnMapEditObject("model", "com_barrel_white_rust", (-139.6418, 626.5163, -359.9491), (85, 359.3866, 0));
                spawnMapEditObject("mapname", "Demolished Bunker");
                spawnMapEditObject("randombox", (-1015.458, 123.1267, -397.4359), (0, -249.7314, 0), (-1476.719, 1084.184, -409.1665), (0, -241.5137, 0), (123.1045, 279.1746, -375.375), (0, 26.10779, 0), (64.92873, -366.3803, -375.375), (0, -157.9956, 0));
            }
            else if (level.mapVariation == 3)
            {
                spawnMapEditObject("spawn", (632.2452, 1701.703, -249.2899), (0, 39.22175, 0));
                spawnMapEditObject("spawn", (668.1104, 2396.741, -254.8765), (0, -55.73309, 0));
                spawnMapEditObject("spawn", (1181.507, 2329.399, -254.875), (0, -149.8584, 0));
                spawnMapEditObject("spawn", (1113.804, 1683.854, -254.875), (0, 119.367, 0));
                spawnMapEditObject("zombiespawn", (491.3356, 2469.378, -254.875), (0, -55.34307, 0));
                spawnMapEditObject("zombiespawn", (430.0474, 1675.788, -254.875), (0, 46.7309, 0));
                spawnMapEditObject("zombiespawn", (1775.487, 1372.21, -254.875), (0, -148.0402, 0));
                spawnMapEditObject("invisiblewall", (-866.9617, 1120.1, -396.0302), (-826.9012, 1029.794, -292.8647));
                spawnMapEditObject("wall", (-1113.079, 1589.892, -427.875), (-1070.27, 1490.585, -320.8673));
                spawnMapEditObject("wall", (1487.397, 1065.244, -249.0302), (1471.543, 1134.704, -150.4548));
                spawnMapEditObject("wall", (1275.211, 639.1779, -315.1865), (1366.461, 690.7182, -200.1536));
                spawnMapEditObject("wall", (1057.919, 675.8795, -330.887), (1030.438, 908.0643, -150.3003));
                spawnMapEditObject("doorandspawn", (366.9815, 2053.176, -413.8123), (347.4989, 2054.374, -224.875), (90, 355.4975, 0), 3, 2, 100, 750, (138.423, 1499.721, -290.875), (0, -136.7408, 0));
                spawnMapEditObject("doorandspawn", (1385.696, 1128.663, -254.875), (1546.496, 1127.761, -254.875), (90, 84.69759, 0), 4, 2, 100, 2000, (911.3596, -656.494, -378.8517), (0, 106.2439, 0));
                spawnMapEditObject("door", (361.3868, 880.639, -291.5155), (369.7766, 1135.023, -285.2497), (90, 353.289, 0), 6, 2, 100, 1000);
                spawnMapEditObject("doorandspawn", (1105.693, 380.4529, -300.2286), (953.1855, 407.3777, -330.7532), (90, 71.97678, 0), 3, 2, 100, 1500, (671.4808, 504.7421, -386.3689), (0, -80.60059, 0));
                spawnMapEditObject("wall", (1212.16, 331.4024, -379.5027), (1232.079, 268.7224, -200.1817));
                spawnMapEditObject("wall", (1017.455, 331.1891, -387.2496), (1003.182, 375.6566, -200.2847));
                spawnMapEditObject("ramp", (465.0139, 116.9015, -395.6058), (460.3327, 126.7362, -197.8893));
                spawnMapEditObject("ramp", (-382.2609, -103.7619, -402.1753), (-376.6896, -115.4452, -203.3479));
                spawnMapEditObject("door", (433.5137, -161.6546, -526.7429), (405.4377, -144.2913, -390.375), (90, 158.5827, 0), 4, 2, 100, 1250);
                spawnMapEditObject("door", (-213.4464, 188.9246, -522.5474), (-192.0394, 141.6985, -390.3751), (90, 115.4888, 0), 4, 2, 100, 1000);
                spawnMapEditObject("doorandspawn", (327.5397, 679.9393, -249.2094), (123.132, 766.2297, -290.4374), (90, 41.67175, 0), 5, 2, 100, 1000, (156.2109, 366.7585, -364.7201), (0, 160.7526, 0));
                spawnMapEditObject("doorandspawn", (-1078.887, 436.0511, -415.7742), (-875.2072, 526.4289, -451.875), (90, 294.5652, 0), 4, 2, 100, 1500, (-1037.094, 598.8502, -451.875), (0, 19.44086, 0));
                spawnMapEditObject("wall", (-165.2846, 1411.932, -290.875), (-223.4664, 1875.292, -130.4565));
                spawnMapEditObject("wall", (-213.984, 1054.999, -286.0658), (-220.9818, 866.1086, -130.4212));
                spawnMapEditObject("model", "com_pallet_stack", (-821.7418, 1119.23, -385.867), (25.47607, 200.6399, 0));
                spawnMapEditObject("model", "com_pallet_stack", (-801.0389, 1060.557, -388.2697), (24.03687, 191.2631, 0));
                spawnMapEditObject("gambler", (-90.27251, 1205.669, -274.3737), (0, 54.20862, 0));
                spawnMapEditObject("bank", (-965.0656, 1231.582, -397.875), (90, -157.454, 0));
                spawnMapEditObject("ammo", (-854.0137, 16.31278, -386.7514), (0, -68.35486, 0));
                spawnMapEditObject("ammo", (697.6054, 693.8707, -363.2184), (0, -187.974, 0));
                spawnMapEditObject("killstreak", (824.2391, 1176.348, -247.875), (0, -5.578979, 0));
                spawnMapEditObject("pap", (1047.915, 2016.38, -239.875), (0, -93.84863, 0));
                spawnMapEditObject("power", (-1360.591, 1490.682, -436.6259), (0, 25.87489, 0));
                spawnMapEditObject("perk1", (1433.82, 1902.908, -224.875), (90, -183.8541, 0));
                spawnMapEditObject("perk2", (1582.746, 471.1904, -294.5771), (90, -248.5801, 0));
                spawnMapEditObject("perk3", (536.8345, -496.2405, -360.4276), (90, -329.0659, 0));
                spawnMapEditObject("perk4", (155.1618, 286.1923, -360.375), (90, -115.6235, 0));
                spawnMapEditObject("perk5", (-687.1786, 525.0526, -361.7628), (90, -25.61255, 0));
                spawnMapEditObject("perk6", (-188.2142, 865.6393, -251.6082), (90, -317.4149, 0));
                spawnMapEditObject("perk7", (-177.7512, 2213.235, -260.875), (90, -48.16199, 0));
                spawnMapEditObject("fallLimit", -657);
                spawnMapEditObject("mapname", "Deserted Dome");
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("hellMap", false);
                spawnMapEditObject("randombox", (613.9325, 829.2654, -298.0932), (0, -190.0614, 0), (666.4457, 501.0504, -371.5158), (0, -5.930542, 0), (1075.66, -294.3403, -380.8689), (0, -85.93848, 0), (73.48521, -354.5471, -375.375), (0, -154.8337, 0), (-1474.048, 1086.222, -409.1908), (0, -243.3121, 0));
                level.boxLocations[level.boxLocations.size] = [(1183.275, 1420.877, -239.875), (0, 86.48645, 0)];//Box locations are too plentiful, manually adding the ones out of range.
                level.boxLocations[level.boxLocations.size] = [(1431.815, 669.8068, -302.8645), (0, -10.91284, 0)];
                spawnMapEditObject("invisiblewall", (585.8087, 2498.484, -254.875), (567.0826, 2249.437, -150.875));
                spawnMapEditObject("invisiblewall", (529.2239, 2218.188, -254.875), (405.2332, 2227.511, -150.875));
                spawnMapEditObject("invisiblewall", (380.9204, 1904.163, -254.875), (506.3188, 1894.769, -150.6472));
                spawnMapEditObject("invisiblewall", (538.7637, 1860.105, -221.9535), (519.0962, 1611.239, -75.875));

                spawnMapEditObject("model", "ap_table_piece_big_destroyed", (546, 1733, -250), (83, 184, 0));
                spawnMapEditObject("model", "ap_table_destroyed_01", (556, 2378, -254), (67, 355, 0));
                spawnMapEditObject("model", "ap_table_destroyed_01", (467, 2238, -255), (56, 269, 0));
                spawnMapEditObject("model", "metal_hanging_strips_med_01", (442, 1899, -191), (10, 168, 0));

                /*
                if (randomInt(100) > 50)//Moon variant
                {
                    spawnMapEditObject("mapname", "Moonbase");
                    spawnMapEditObject("spacehelmet", (563.909, 2194.27, -253.7606), (0, 264.3212, 0));
                    spawnMapEditObject("spacehelmet", (545.0822, 1920.188, -243.3936), (0, 86.3431, 0));
                    spawnMapEditObject("spacehelmet", (1443.034, 1166.74, -254.1329), (0, 83.2894, 0));
                    spawnMapEditObject("spacehelmet", (399.8792, -31.77756, -386.0158), (0, 182, 0));
                    spawnMapEditObject("spacehelmet", (-233.4409, 39.72492, -385.3513), (0, 23, 0));

                    //spawnMapEditObject("excavator", (-1303.499, -171.8676, 87.10009), (90, 352.4004, 0));//Omicron

                    maps\mp\gametypes\_aiz_map_edits::initMoon();
                }
                */
            }
        break;
        case "mp_exchange":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("wall", (-93.62519, -1149.875, -167.8595), (-93.63361, -1036.125, -52.81086));
                spawnMapEditObject("wall", (855.6351, -1039.638, -160.7184), (855.6302, -1149.359, -62.97659));
                spawnMapEditObject("wall", (928.155, 1466.272, -167.8748), (927.8749, 1358.133, -64.12507));
                spawnMapEditObject("wall", (1374.125, 1360.125, -167.8595), (1372.125, 1464.874, -66.125));
                spawnMapEditObject("invisiblewall", (547.7617, 723.7889, -25.63288), (784.3196, 804.1988, 88.76237));
                spawnMapEditObject("invisiblewall", (514.2615, 626.5571, 65.61904), (585.2873, 532.9446, 99.51373));
                spawnMapEditObject("invisiblewall", (709.7853, -462.4826, -34.20794), (917.4709, -180.3949, 59.62843));
                spawnMapEditObject("randombox", (1157.475, 1578.875, -156.6727), (0, -2.628784, 0), (239.4527, -1319.875, -149.7639), (0, 179.53, 0));
                spawnMapEditObject("gambler", (27.60464, -1255.875, -151.298), (0, 179.53, 0));
                spawnMapEditObject("bank", (1088.922, 300.0937, -78.63433), (17.18689, -154.4983, 0));
                spawnMapEditObject("ammo", (527.1178, -119.274, -90.11869), (0, -170.0394, 0));
                spawnMapEditObject("killstreak", (1340.875, 640.6664, -108.4388), (0, -92.40299, 0));
                spawnMapEditObject("pap", (174.6774, 3044.495, 1605.125), (0, -178.6237, 0));
                spawnMapEditObject("power", (651.9835, 727.348, -65.17551), (0, -158.7769, 0));
                spawnMapEditObject("timedTeleporter", (826.7444, 180.8098, -144.2684), (0, 87.93211, 0), (302.9051, 3419.968, 1590.125), (4.099121, -87.01415, 0), (553.8746, -707.4227, -136.8692), (90, 179.212, 0), 50);
                spawnMapEditObject("perk1", (-226.8854, 3879.654, 1620.125), (90, -1.14505, 0));
                spawnMapEditObject("perk2", (-53.85005, -1093.034, -145.9352), (90, -0.4199524, 0));
                spawnMapEditObject("perk3", (155.1254, -686.5199, -131.4214), (90, 2.106903, 0));
                spawnMapEditObject("perk4", (1340.873, 1196.429, -145.875), (90, -179.7058, 0));
                spawnMapEditObject("perk5", (963.5592, 1407.068, -145.875), (90, -0.0683899, 0));
                spawnMapEditObject("perk6", (1334.728, 1410.617, -145.8805), (90, 179.5691, 0));
                spawnMapEditObject("perk7", (807.7738, -1095.978, -144.1743), (90, 179.9371, 0));
                spawnMapEditObject("spawn", (721.5983, 578.7566, -113.9939), (5.640259, -37.5867, 0));
                spawnMapEditObject("spawn", (331.3459, -1080.06, -166.2193), (0.223999, 85.77879, 0));
                spawnMapEditObject("zombiespawn", (536.6957, 903.7166, -5.286807), (0, -63.18484, 0));
                spawnMapEditObject("zombiespawn", (837.3541, -467.4045, -7.82499), (0, 114.6454, 0));
                //spawnMapEditObject("zombiespawn", (900.1251, 1067.346, -175.875), (0, 0.2996521, 0));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Abandoned Subway");
                spawnMapEditObject("model", "concrete_pillarchunk_lrg_01", (550, 725, -25), (0, 120, 90));
                spawnMapEditObject("model", "concrete_pillarchunk_lrg_01", (825, -375, -25), (0, 130, 90));
            }
            if (level.mapVariation == 1)
            {
                spawnMapEditObject("gambler", (4457.659, 2334.678, 937.125), (0, -89.92509, 0));
                spawnMapEditObject("bank", (4460.269, 3752.016, 952.125), (90, -131.6072, 0));
                spawnMapEditObject("ammo", (4176.703, 2339.244, 937.125), (0, -269.8922, 0));
                spawnMapEditObject("killstreak", (4595.235, 2523.784, 1013.125), (0, -88.83745, 0));
                spawnMapEditObject("pap", (4554.757, 3760.743, 1013.125), (0, -3.764816, 0));
                spawnMapEditObject("power", (4315.052, 3281.64, 937.125), (0, -0.9138641, 0));
                spawnMapEditObject("perk1", (4341.062, 1665.224, 1028.125), (90, -268.1783, 0));
                spawnMapEditObject("perk2", (4603.961, 3239.944, 1028.125), (90, -182.6003, 0));
                spawnMapEditObject("perk3", (4469.687, 2661.777, 952.125), (90, -181.2325, 0));
                spawnMapEditObject("perk4", (4173.624, 3288.609, 952.125), (90, -1.638962, 0));
                spawnMapEditObject("perk5", (4465.416, 3421.728, 952.125), (90, -180.392, 0));
                spawnMapEditObject("perk6", (4184.123, 1913.666, 1028.125), (90, -359.5186, 0));
                spawnMapEditObject("perk7", (4464.047, 2105.208, 952.125), (90, -229.2537, 0));
                spawnMapEditObject("spawn", (4242.553, 2290.249, 922.125), (0, 59.33516, 0));
                spawnMapEditObject("spawn", (4411.125, 2277.621, 922.125), (0, 112.7617, 0));
                spawnMapEditObject("spawn", (4417.428, 2504.011, 922.1251), (0, 121.8474, 0));
                spawnMapEditObject("spawn", (4235.783, 2526.882, 922.1253), (0, 52.52364, 0));
                spawnMapEditObject("spawn", (4433.71, 2835.526, 922.125), (0, 178.7126, 0));
                spawnMapEditObject("spawn", (4231.229, 2835.359, 922.125), (0, -2.693649, 0));
                spawnMapEditObject("spawn", (4219.138, 3101.291, 922.125), (0, -54.67547, 0));
                spawnMapEditObject("spawn", (4399.051, 3088.041, 922.1245), (0, -136.628, 0));
                spawnMapEditObject("spawn", (4381.414, 3494.913, 922.125), (0, -126.1415, 0));
                spawnMapEditObject("spawn", (4213.9, 3510.036, 922.1259), (0, -65.07951, 0));
                spawnMapEditObject("zombiespawn", (4304.269, 3744.383, 922.125), (0, -90.37554, 0));
                spawnMapEditObject("zombiespawn", (4740.49, 3652.611, 998.125), (0, -179.2055, 0));
                spawnMapEditObject("invisiblewall", (4746.792, 1819.423, 998.125), (4749.97, 1671.636, 1189.128));
                spawnMapEditObject("invisiblewall", (4623.682, 3577.753, 998.125), (4627.216, 3761.983, 1102.674));
                spawnMapEditObject("ramp", (4321.691, 2264.917, 922.125), (4322.394, 2063.518, 996.5317));
                spawnMapEditObject("model", "cs_handrail_128_double", (4609.649, 3651.097, 998.125), (0, 358.8065, 0));
                spawnMapEditObject("fallLimit", 841);
                spawnMapEditObject("mapname", "Demolished Rooftop");
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("randombox", (4646.032, 1950.481, 1013.125), (0, -90.6447, 0), (4728.724, 1737.94, 1013.125), (0, -90.54033, 0), (4449.721, 2940.112, 937.125), (0, -88.91985, 0), (4184.376, 2614.464, 937.125), (0, 89.94856, 0));
            }

            deleteDeathTriggers();
        break;
        case "mp_hardhat":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("wall", (-1129.13, 451.4354, 552.125), (-1532.777, 447.4414, 663.4726));
                spawnMapEditObject("pap", (-1192.605, -1744.717, 415.125), (0, 179.8132, 0));
                spawnMapEditObject("randombox", (-1183.125, -8.191057, 559.9466), (0, -92.18079, 0), (-1452.767, -1412.646, 444.3597), (0, 115.2301, 0));
                spawnMapEditObject("gambler", (-1421.732, -312.6249, 561.6991), (0, -1.642456, 0));
                spawnMapEditObject("bank", (-1169.898, 171.4211, 582.286), (90, -176.5887, 0));
                spawnMapEditObject("ammo", (-1432.941, 56.95132, 561.0596), (0, -178.396, 0));
                spawnMapEditObject("killstreak", (-1509.706, -577.3942, 561.8393), (0, 88.89038, 0));
                spawnMapEditObject("perk1", (-1183.125, -640.7513, 574.379), (90, -179.1266, 0));
                spawnMapEditObject("perk7", (-1280.172, 421.0371, 575.7615), (90, -90.03296, 0));
                spawnMapEditObject("spawn", (-1284.616, -15.18871, 545.1468), (4.558125, -89.31335, 0));
                spawnMapEditObject("zombiespawn", (-1055.827, -1468.671, 424.1431), (0, -172.2821, 0));
                spawnMapEditObject("zombiespawn", (-1540.836, 308.9024, 660.3281), (0, 2.669678, 0));
                spawnMapEditObject("zombiespawn", (-1509.875, -1330.867, 544.125), (0, 57.8595, 0));
                spawnMapEditObject("hellMap", true);
                spawnMapEditObject("maxWave", 20);
                spawnMapEditObject("mapname", "Construction Site Of Hell");

                //Add a wall by the restaurant to keep players from getting on it
                spawnMapEditObject("invisiblewall", (-1507, 474, 651), (-1510, 41, 682));
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("invisiblewall", (2831.125, -2636.979, 384.125), (2819.309, -2030.976, 518.1855));
                spawnMapEditObject("model", "plastic_fence_528x88", (2808.073, -2290.218, 350.1335), (0, 91, 0));
                spawnMapEditObject("model", "me_corrugated_metal2x8", (2817.462, -2615.874, 392.1317), (90, 93.55486, 0));
                spawnMapEditObject("invisiblewall", (1356.618, -3080.131, 392.125), (1425.733, -3119.879, 497.3529));
                spawnMapEditObject("invisiblewall", (698.3738, -3080.128, 392.125), (1033.437, -3134.24, 504.0702));
                spawnMapEditObject("invisiblewall", (-136.1317, -2526.888, 392.125), (-247.8552, -2525.063, 521.7809));
                spawnMapEditObject("invisiblewall", (-1032.13, -2506.539, 392.125), (-1323.064, -1775.559, 534.4915));
                spawnMapEditObject("invisiblewall", (1885.262, -1799.125, 416.125), (1949.662, -1800.716, 554.4936));
                spawnMapEditObject("model", "plastic_fence_400x88", (869.5694, -3099.362, 350.1336), (0, 165, 0));
                spawnMapEditObject("model", "pb_pallet_bags", (1394.856, -3106.673, 392.1405), (0, -120.5474, 0));
                spawnMapEditObject("model", "plastic_fence_400x88", (-1090.621, -2333.234, 340.1288), (0, -67.43954, 0));
                spawnMapEditObject("model", "plastic_fence_528x88", (-1254.497, -1943.257, 340.1348), (0, -67.43408, 0));
                spawnMapEditObject("model", "plastic_fence_232x88", (-188.6292, -2515.854, 345.125), (0, 180, 0));
                spawnMapEditObject("randombox", (877.5043, -1807.125, 399.125), (0, -1.779785, 0), (764.8751, -2175.365, 399.125), (0, -90.41748, 0), (1856.875, -1890.856, 399.125), (0, -91.14258, 0));
                spawnMapEditObject("killstreak", (2506.273, -2512.875, 415.125), (0, 179.4012, 0));
                spawnMapEditObject("bank", (2746.936, -2565.544, 404.125), (90, 45.71962, 0));
                spawnMapEditObject("ammo", (1534.476, -2512.875, 415.125), (0, 178.7201, 0));
                spawnMapEditObject("gambler", (1024.404, -2176.776, 399.125), (0, 89.54408, 0));
                spawnMapEditObject("pap", (2032.875, -2001.69, 430.125), (0, 85.96253, 0));
                spawnMapEditObject("power", (296.5465, -2512.875, 415.125), (0, 178.7256, 0));
                spawnMapEditObject("perk1", (-96.68378, -2488.874, 422.125), (90, 90.813, 0));
                spawnMapEditObject("perk2", (1044.188, -2555.514, 414.1625), (90, 145.2722, 0));
                spawnMapEditObject("perk3", (322.6169, -1824.87, 414.1251), (90, -74.41039, 0));
                spawnMapEditObject("perk4", (-354.114, -2488.875, 414.125), (90, 91.47767, 0));
                spawnMapEditObject("perk5", (2573.52, -2057.092, 414.125), (90, -89.4397, 0));
                spawnMapEditObject("perk6", (-541.5652, -1815.125, 414.125), (90, -90.87891, 0));
                spawnMapEditObject("perk7", (719.1259, -2883.789, 414.125), (90, 0.3790283, 0));
                spawnMapEditObject("spawn", (-250.6988, -2168.347, 384.125), (-1.445904, 1.466683, 0));
                spawnMapEditObject("spawn", (447.8929, -2024.409, 384.125), (-2.528057, -38.93554, 0));
                spawnMapEditObject("spawn", (2184.402, -2245.717, 384.125), (-6.137066, 175.6879, 0));
                spawnMapEditObject("zombiespawn", (3142.976, -2250.859, 384.125), (0, -178.1763, 0));
                spawnMapEditObject("zombiespawn", (1332.979, -3266.54, 384.125), (0, 116.5375, 0));
                spawnMapEditObject("zombiespawn", (863.3317, -3351.234, 384.125), (0, 75.41016, 0));
                spawnMapEditObject("zombiespawn", (709.7143, -3172.875, 384.125), (0, 50.88319, 0));
                spawnMapEditObject("zombiespawn", (-1553.684, -2248.036, 384.125), (0, 1.09864, 0));
                spawnMapEditObject("mapname", "Infected Suburb");
                spawnMapEditObject("hellMap", false);
                spawnMapEditObject("maxWave", 30);

                //Add block under building
                spawnMapEditObject("invisiblewall", (2231, -1829, 395), (1856, -1975, 395));
            }
        break;
        case "mp_hillside_ss":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("bank", (2025.352, 901.1164, 2198.914), (90, 192.2565, 0));
                spawnMapEditObject("ammo", (2049.15, 813.4775, 2183.179), (0, 12.33887, 0));
                spawnMapEditObject("killstreak", (2455.646, 222.4238, 2189.125), (0, -232.7442, 0));
                spawnMapEditObject("pap", (1698.749, -347.1846, 2349.125), (0, -90.23985, 0));
                spawnMapEditObject("power", (2716.956, 95.11575, 2190.125), (0, -87.46581, 0));
                spawnMapEditObject("gambler", (2561.375, 48.37498, 2159.125), (0, -4.074705, 0));
                spawnMapEditObject("perk1", (1557.366, -632.4263, 2227.49), (90, 2.132553, 0));
                spawnMapEditObject("perk2", (1549.744, 272.5197, 2233.56), (90, 358.6938, 0));
                spawnMapEditObject("perk3", (2552.395, -143.1912, 2174), (90, 181.435, 0));
                spawnMapEditObject("perk4", (2534.943, -663.9711, 2174), (90, 170.7288, 0));
                spawnMapEditObject("perk5", (2465.621, 594.4978, 2174), (90, 185.0605, 0));
                spawnMapEditObject("perk6", (1555.533, -112.1249, 2232.878), (90, 0.7153168, 0));
                spawnMapEditObject("perk7", (1159.481, 875.8967, 2219.772), (90, 0.1055756, 0));
                spawnMapEditObject("spawn", (1829.767, 547.9259, 2181.308), (0, -74.33777, 0));
                spawnMapEditObject("spawn", (2219.631, 592.4663, 2159.371), (0, -116.5253, 0));
                spawnMapEditObject("spawn", (1974.666, 566.0645, 2173.397), (0, -93.08594, 0));
                spawnMapEditObject("spawn", (1785.601, 283.025, 2183.906), (0, -15.43457, 0));
                spawnMapEditObject("spawn", (1784.218, -25.5944, 2183.987), (0, 8.103662, 0));
                spawnMapEditObject("spawn", (1808.46, -338.806, 2182.561), (0, 37.70632, 0));
                spawnMapEditObject("spawn", (1776.104, -591.0076, 2182.339), (0, 41.67788, 0));
                spawnMapEditObject("spawn", (2020.325, -640.4142, 2167.819), (0, 79.52576, 0));
                spawnMapEditObject("spawn", (2326.923, -611.3828, 2147.839), (0, 117.1375, 0));
                spawnMapEditObject("zombiespawn", (1984.965, -894.5266, 2166.675), (0, 90.42419, 0));
                spawnMapEditObject("zombiespawn", (1743.495, 1007.327, 2184.439), (0, -77.22168, 0));
                //spawnMapEditObject("zombiespawn", (4178.158, -273.5235, 2175.125), (0, 124.2456, 0));
                //spawnMapEditObject("zombiespawn", (3538.493, -155.0178, 2152.196), (0, -177.9498, 0));
                //spawnMapEditObject("zombiespawn", (3415.583, 427.3982, 2145.101), (0, -172.8961, 0));
                spawnMapEditObject("randombox", (1674.546, -49.24984, 2205.438), (0, -268.5315, 0), (1395.543, 666.9186, 2236.701), (0, -268.5205, 0));
                spawnMapEditObject("invisiblewall", (1552.125, -704.125, 2150.693), (2763.152, -700.6957, 2275));
                spawnMapEditObject("invisiblewall", (2762.115, 1012.448, 2155.07), (1152.117, 937.1249, 2300));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Oceanside Attack");
                spawnMapEditObject("invisiblewall", (2776.048, 120, 2175.125), (2969.576, 120, 2275));
                spawnMapEditObject("invisiblewall", (2776.048, 75, 2175.125), (2969.576, 75, 2275));
                spawnMapEditObject("model", "fence_glass", (2760.79, 67.08125, 2170.125), (0, 0, 0));
                spawnMapEditObject("timedTeleporter", (1664.717, 736.5838, 2191.017), (0, -173.5327, 0), (1318.963, 452.0053, 2264.125), (0, 0.3240967, 0), (1721.682, -365.5461, 2194.291), (90, 271.6769, 0), 45);
                spawnMapEditObject("invisiblewall", (1966.635, 888.4343, 2172.464), (2056.696, 908.8528, 2206.906));
                spawnMapEditObject("invisiblewall", (1542.24, -678.7916, 2316.125), (1543.206, -457.4462, 2395.323));
                spawnMapEditObject("invisiblewall", (1537.029, -298.0982, 2320.115), (1531.194, -54.1375, 2386.427));
                spawnMapEditObject("invisiblewall", (1305.429, 545.4346, 2264), (1175.882, 547.4677, 2364.609));
                spawnMapEditObject("model", "prk_river_rock_03", (2600, -825, 2050), (0, 245, 0));
                spawnMapEditObject("model", "prk_river_rock_03", (2400, -825, 2060), (0, 245, 0));
                spawnMapEditObject("model", "prk_river_rock_03", (2200, -825, 2070), (0, 245, 0));
                spawnMapEditObject("model", "prk_river_rock_03", (2000, -825, 2080), (0, 245, 0));
                spawnMapEditObject("model", "prk_river_rock_03", (1800, -825, 2090), (0, 245, 0));
                spawnMapEditObject("model", "prk_river_rock_03", (1600, -825, 2100), (0, 245, 0));
                spawnMapEditObject("model", "prk_river_rock_03", (1220, 1075, 2150), (0, 65, 0));
                spawnMapEditObject("model", "prk_river_rock_03", (1420, 1075, 2125), (0, 65, 0));
                spawnMapEditObject("model", "prk_river_rock_03", (1620, 1075, 2100), (0, 65, 0));
                spawnMapEditObject("model", "prk_river_rock_03", (1820, 1075, 2090), (0, 65, 0));
                spawnMapEditObject("model", "prk_river_rock_03", (2020, 1100, 2080), (0, 65, 0));
                spawnMapEditObject("model", "prk_river_rock_03", (2220, 1100, 2070), (0, 65, 0));
                spawnMapEditObject("model", "prk_river_rock_03", (2420, 1125, 2060), (0, 65, 0));
                spawnMapEditObject("model", "prk_river_rock_03", (2620, 1150, 2050), (0, 65, 0));
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("gambler", (-1763.547, -1846.979, 2492.125), (0, 89.85658, 0));
                spawnMapEditObject("bank", (-2117.22, -1593.838, 2491.125), (90, -49.55444, 0));
                spawnMapEditObject("ammo", (-2075.018, -2300.346, 2476.125), (0, -182.0331, 0));
                spawnMapEditObject("killstreak", (-1765.004, -2200.064, 2492.125), (0, 87.4341, 0));
                spawnMapEditObject("power", (-2115.968, -2022.371, 2476.125), (0, 89.53798, 0));
                spawnMapEditObject("perk1", (-2346.414, -2307.061, 2491.125), (90, -316.7969, 0));
                spawnMapEditObject("perk2", (-942.8006, -2446.472, 2261.453), (90, -224, 0));
                spawnMapEditObject("perk3", (-1530.046, -1722.517, 2425.125), (90, 90.38525, 0));
                spawnMapEditObject("perk4", (-1477.321, -2315.374, 2491.125), (90, -224.9347, 0));
                spawnMapEditObject("perk5", (-1770.453, -1647.484, 2444.125), (90, -0.6432953, 0));
                spawnMapEditObject("perk6", (-950.64, -1357.169, 2239.604), (90, 216.2604, 0));
                spawnMapEditObject("spawn", (-1235.744, -2354.831, 2271.731), (0, 54.37074, 0));
                spawnMapEditObject("spawn", (-1296.958, -1464.758, 2259.662), (0, -49.25781, 0));
                spawnMapEditObject("spawn", (-1303.749, -1939.349, 2267.402), (0, -1.719961, 0));
                spawnMapEditObject("spawn", (-1462.859, -1419.289, 2283.272), (0, -129.7052, 0));
                spawnMapEditObject("spawn", (-1304.276, -2392.862, 2281.43), (0, 148.7817, 0));
                spawnMapEditObject("spawn", (-1306.167, -2102.496, 2271.136), (0, -1.615591, 0));
                spawnMapEditObject("spawn", (-1345.179, -1690.274, 2268.618), (0, -7.432852, 0));
                spawnMapEditObject("zombiespawn", (-1937.1, -1450.545, 2342.877), (0, -0.7861233, 0));
                spawnMapEditObject("zombiespawn", (-1863.806, -2388.158, 2349.327), (0, -4.384146, 0));
                spawnMapEditObject("pap", (-1842.266, -1637.773, 2476.125), (0, -90.44555, 0));
                spawnMapEditObject("perk7", (-2347.689, -1749.87, 2491.317), (90, -39.4635, 0));
                spawnMapEditObject("invisiblewall", (-1700.892, -1324.634, 2348.192), (-1320.148, -1326.488, 2467.381));
                spawnMapEditObject("invisiblewall", (-1821.192, -2332.469, 2341.529), (-1820.592, -2456.597, 2617.181));
                spawnMapEditObject("invisiblewall", (-1796.195, -2470.804, 2346.096), (-1200.069, -2468.616, 2558.107));
                spawnMapEditObject("invisiblewall", (-1802.375, -1581.787, 2464.949), (-1802.375, -1708.186, 2610.482));
                spawnMapEditObject("wall", (-1680.887, -2307.39, 2321.803), (-1595.692, -2307.886, 2441.812));
                spawnMapEditObject("ramp", (-1641.284, -1475.385, 2298.918), (-1639.918, -1618.344, 2354.783));
                spawnMapEditObject("door", (-1638.205, -1803.295, 2321.427), (-1680.526, -1584.362, 2395.125), (90, 98.26862, 0), 8, 2, 100, 1500);
                spawnMapEditObject("doorandspawn", (-1842.086, -2058.31, 2868.875), (-1826.989, -2038.551, 2461.125), (90, 0.2938843, 0), 7, 2, 100, 3000, (-1859.929, -1765.237, 2461.125), (0, -132.6487, 0));
                spawnMapEditObject("model", "fence_glass", (-1798.383, -1574.525, 2325.208), (0, 358.8577, 0));
                spawnMapEditObject("model", "fence_glass", (-1796.964, -1497.172, 2325.332), (0, 359.126, 0));
                spawnMapEditObject("model", "fence_glass", (-1794.132, -1419.616, 2325.282), (0, 356.6046, 0));
                spawnMapEditObject("model", "fence_glass", (-1806.878, -2446.506, 2344.869), (0, 359.4939, 0));
                spawnMapEditObject("model", "fence_glass", (-1807.509, -2391.805, 2341.826), (0, 0.5085275, 0));
                spawnMapEditObject("invisiblewall", (-1805.049, -1349.896, 2326.905), (-1815.486, -1572.728, 2542.014));
                spawnMapEditObject("invisiblewall", (-2143.627, -1567.374, 2462.467), (-1826.125, -1569.719, 2602.322));
                spawnMapEditObject("fallLimit", 2015);
                spawnMapEditObject("mapname", "Vacation Home");
                spawnMapEditObject("hellMap", false);
                spawnMapEditObject("randombox", (-937.4906, -1926.505, 2236.514), (0, -86.17736, 0), (-1452.372, -2016.352, 2301.972), (0, -268.1824, 0), (-2336.187, -2100.962, 2476.125), (0, -269.0668, 0), (-1585.788, -1935.891, 2476.125), (0, -88.25927, 0));
                spawnMapEditObject("invisiblewall", (-1909.75, -1600.998, 2461.125), (-2057.541, -1599.231, 2491.429));
            }

            deleteDestructables();
        break;
        case "mp_interchange":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("gambler", (302.4659, -742.567, 193.2659), (16.35987, 140.4354, 15));
                //spawnMapEditObject("invisiblewall", (252.9183, 245.578, 129.062), (-342.982, -219.8566, 269.606));
                spawnMapEditObject("invisiblewall", (-338.2819, 626.4651, 73.70599), (-219.0838, 702.4321, 183.252));
                //spawnMapEditObject("invisiblewall", (-675.1926, -785.8134, 88.86117), (-747.7887, -1056.995, 210.0398));
                spawnMapEditObject("invisiblewall", (418.3714, 221.105, 68.67916), (558.2631, 95.83538, 259.0489));
                spawnMapEditObject("model", "vehicle_hummer_destroyed", (1168.36, -563.1882, 116.883), (-12.13318, 136.707, 0));
                spawnMapEditObject("invisiblewall", (1109.83, -544.0734, 120.6722), (1165.205, -616.8113, 263.3184));
                spawnMapEditObject("model", "concrete_pillarchunk_med_01", (706.152, -1035.669, 140.9151), (-75.516602, -143.0708, 0));
                spawnMapEditObject("invisiblewall", (760.2136, -973.7336, 139.7749), (678.1195, -1062.746, 262.0305));
                spawnMapEditObject("model", "vehicle_jeep_destroyed", (500.6515, 170.3745, 58.86796), (2.554321, 141.8911, 0));
                //spawnMapEditObject("model", "vehicle_coupe_green_destroyed", (-652.7211, -873.3147, 85.91428), (0, 132.70895, 0));
                spawnMapEditObject("model", "vehicle_firetruck_dsty", (-677.6506, -1107.458, 99.3662), (0.5865479, 53.88506, 0));
                spawnMapEditObject("invisiblewall", (-582.8846, -914.1038, 93.59777), (-735.3584, -1096.588, 230.1166));
                //spawnMapEditObject("invisiblewall", (-706.2498, -799.6808, 82.21781), (-584.2515, -901.1704, 198.5711));
                spawnMapEditObject("model", "berlin_concrete_barrier_damaged_1", (-242.1073, 680.9369, 61.74945), (4.906616, -151.713, 0));
                spawnMapEditObject("model", "berlin_concrete_barrier_damaged_1", (-307.4793, 641.1712, 62.96167), (-8.39954, -154.9595, 0));
                spawnMapEditObject("invisiblewall", (-860.8391, 348.5775, 15.15137), (-800.389, 277.8031, 102.8749));
                spawnMapEditObject("model", "vehicle_v22_osprey_rear_door_mp", (-821.3124, 286.3359, 18.125), (90, -138.4305, 0));
                spawnMapEditObject("randombox", (-117.4225, 41.86551, 110.8952), (0, -144.1764, 0), (-1119.231, 188.7015, 31.07608), (0, -144.907, 0), (942.0205, -811.5462, 134.1292), (0, -135.1511, 0));
                spawnMapEditObject("bank", (-1732.878, -433.7073, 82.11061), (90, 1.167212, 0));
                spawnMapEditObject("ammo", (-1390.338, -35.82436, 47.56235), (0, 43.76665, 0));
                spawnMapEditObject("killstreak", (-1320.731, -429.8317, 90.90768), (0, -119.9901, 0));
                spawnMapEditObject("pap", (1599.91, -1333.716, -18.6487), (0, 48.91924, 0));
                spawnMapEditObject("power", (-397.119, 508.7451, 84.32733), (0, 39.75115, 0));
                //spawnMapEditObject("perk1", (-5.148089, 491.3311, 129.86768), (90, -138.7932, 0));
                spawnMapEditObject("perk2", (-657.5698, -168.7822, 62.47587), (-74.17847, 151.9435, 0));
                spawnMapEditObject("perk3", (-343.7397, 201.8322, 117.0382), (-75.26062, -152.5041, 0));
                spawnMapEditObject("perk4", (226.47, 270.7224, 154.5042), (90, 177.9207, 0));
                spawnMapEditObject("perk5", (-756.3116, -488.0951, 153.6253), (90, 166.017, 0));
                spawnMapEditObject("perk6", (-1441.828, -695.8463, 112.51321), (90, 79.80181, 0));
                spawnMapEditObject("perk7", (702.7989, -164.9949, 194.5222), (90, -90.78285, 0));
                spawnMapEditObject("timedTeleporter", (-596.8337, 50.14891, 13.07782), (0, 133.3382, 0), (2068.385, -1733.641, -14.87473), (0, 139.8201, 0), (-672.8073, 310.0295, 30.13301), (90, -50.62234, 0), 40);
                spawnMapEditObject("spawn", (-176.0889, 355.3905, 76.47733), (0, -143.7974, 0));
                //spawnMapEditObject("spawn", (634.8268, -505.0929, 82.84875), (0.9490967, 158.1179, 0));
                spawnMapEditObject("spawn", (-723.1426, -938.9678, 92.66363), (-0.4956055, 49.90257, 0));
                spawnMapEditObject("zombiespawn", (-269.8449, 770.5819, 55.80474), (0, -90.05227, 0));
                spawnMapEditObject("zombiespawn", (-837.9976, -1053.759, 113.999), (0, 74.43504, 0));
                spawnMapEditObject("zombiespawn", (573.8087, 258.1128, 69.46384), (0, -130.4545, 0));
                spawnMapEditObject("zombiespawn", (664.2542, -1036.121, 151.2429), (0, 89.57969, 0));
                spawnMapEditObject("perk1Interchange", 0);
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Demolished Underpass");
            }
        break;
        case "mp_italy":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("invisiblewall", (117.9921, -816.8741, 832.125), (181.6808, -641.1833, 960.935));
                spawnMapEditObject("model", "intro_props_front_gate", (123.6199, -1120.74, 785.0873), (1.311646, -1.346276, 0));
                spawnMapEditObject("invisiblewall", (115.1575, -1087.125, 784.125), (113.9058, -1163.871, 924.5259));
                spawnMapEditObject("model", "vehicle_van_sas_dark_destructable", (19.46583, -744.7377, 840.9611), (-4.818707, 161.3338, 0));
                spawnMapEditObject("invisiblewall", (1824.874, -948.8542, 882.6085), (1736.132, -946.3831, 976.6853));
                spawnMapEditObject("invisiblewall", (1336.411, -207.622, 816.7856), (1344.292, -311.8671, 943.8711));
                spawnMapEditObject("model", "paris_fence_sacre_coeur_gate", (1331.381, -311.8688, 808.125), (0, 92.18934, 0));
                spawnMapEditObject("model", "paris_fence_sacre_coeur_gate", (1331.842, -200.1258, 808.1482), (0, -89.97497, 0));
                spawnMapEditObject("model", "paris_fence_sacre_coeur_gate", (1736.125, -958.5125, 880.1327), (0, -1.595451, 0));
                spawnMapEditObject("model", "paris_fence_sacre_coeur_gate", (1831.874, -958.3879, 880.164), (0, 176.2347, 0));
                spawnMapEditObject("randombox", (1115.122, -1328.368, 719.125), (0, 0, 0), (1024.921, -207.125, 815.125), (0, -179.55, 0));
                spawnMapEditObject("gambler", (699.7719, -727.5125, 719.125), (0, -170.5247, 0));
                spawnMapEditObject("bank", (1313.514, -207.1251, 831.5208), (90, -132.6439, 0));
                spawnMapEditObject("ammo", (954.3887, -475.1256, 751.125), (0, 179.3678, 0));
                spawnMapEditObject("killstreak", (779.3346, -1056.874, 719.125), (0, 2.971373, 0));
                spawnMapEditObject("pap", (143.2084, -951.0588, 803.125), (0, -86.84188, 0));
                spawnMapEditObject("power", (1119.537, -962.3939, 767.1288), (-1.21521, 0, 0));
                spawnMapEditObject("perk1", (1824.875, -1022.579, 894.125), (90, -179.539, 0));
                spawnMapEditObject("perk2", (1475.875, -829.7231, 750.1444), (90, 179.7414, 0));
                spawnMapEditObject("perk3", (456.1265, -520.125, 804.5958), (90, -48.60397, 0));
                spawnMapEditObject("perk4", (292.9595, -675.1249, 830.3875), (90, -42.82513, 0));
                spawnMapEditObject("perk5", (138.5887, -1119.079, 814.125), (90, -1.719811, 0));
                spawnMapEditObject("perk6", (757.2369, -248.1564, 830.125), (90, -46.43966, 0));
                spawnMapEditObject("perk7", (1584.874, -610.0604, 766.125), (90, -179.539, 0));
                spawnMapEditObject("spawn", (1325.039, -1058.883, 704.125), (-12.3938, 153.7642, 0));
                spawnMapEditObject("spawn", (738.0016, -913.4737, 704.125), (-6.983033, -6.037438, 0));
                spawnMapEditObject("zombiespawn", (1370.093, -253.5341, 839.24), (0, -177.2186, 0));
                spawnMapEditObject("zombiespawn", (135.3986, -680.4229, 868.2565), (0, -22.47069, 0));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "El Brote");
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("gambler", (-40.43818, -1237.698, 107.3837), (0, -1.953369, 0));
                spawnMapEditObject("bank", (1408.761, -1291.608, 125.6201), (90, -73.38099, 0));
                spawnMapEditObject("ammo", (18.03665, -1663.28, 86.1331), (0, -91.33267, 0));
                spawnMapEditObject("ammo", (1148.524, -1707.525, 95.9434), (0, 58.47142, 0));
                spawnMapEditObject("killstreak", (-696.373, -1365.044, 143.3272), (0, 25.51244, 0));
                spawnMapEditObject("pap", (-1121.977, -1018.331, 527.125), (0, 297.3314, 0));
                spawnMapEditObject("power", (-445.2878, -1909.209, 79), (0, -178.3664, 0));
                spawnMapEditObject("perk1", (1315.209, -1565.188, 125.2017), (90, 85.21159, 0));
                spawnMapEditObject("perk2", (1037.414, -1516.297, 120.8297), (90, -278.1606, 0));
                spawnMapEditObject("perk3", (-57.06463, -1520.758, 105.122), (90, -269.8495, 0));
                spawnMapEditObject("perk4", (-654.4461, -1558.274, 101.792), (90, -273.063, 0));
                spawnMapEditObject("perk5", (-1491.356, -1787.647, 121.2444), (90, -268.5092, 0));
                spawnMapEditObject("perk6", (487.886, -1599.265, 114.7031), (90, -260.0992, 0));
                spawnMapEditObject("perk7", (-1663.874, -1119.972, 292.3015), (90, -45.95363, 0));
                spawnMapEditObject("spawn", (323.3572, -1401.3, 92.09378), (0, -96.95767, 0));
                spawnMapEditObject("spawn", (161.2353, -1420.53, 96.125), (0, -85.45499, 0));
                spawnMapEditObject("spawn", (-291.9958, -1468.421, 77.42532), (0, -96.82034, 0));
                spawnMapEditObject("spawn", (-463.8592, -1475.351, 86.30396), (0, -89.65726, 0));
                spawnMapEditObject("spawn", (-837.3341, -1580.789, 90.41057), (0, -86.85574, 0));
                spawnMapEditObject("spawn", (-1036.138, -1606.679, 80.14325), (0, -82.10965, 0));
                spawnMapEditObject("spawn", (-1261.365, -1612.341, 87.79654), (0, -57.79691, 0));
                spawnMapEditObject("spawn", (548.3262, -1454.552, 96.125), (0, -86.58658, 0));
                spawnMapEditObject("spawn", (806.7341, -1480.989, 95.63156), (0, -93.38712, 0));
                spawnMapEditObject("spawn", (1184.946, -1511.95, 92.36091), (0, -96.51822, 0));
                spawnMapEditObject("zombiespawn", (865.1622, -2077, 64), (0, 87.35449, 0));
                spawnMapEditObject("zombiespawn", (132.1052, -2073.548, 64), (0, 85.23413, 0));
                spawnMapEditObject("zombiespawn", (-838.0524, -2081.315, 64), (0, 91.90282, 0));
                spawnMapEditObject("zombiespawn", (-353.8233, -2059.856, 64), (0, 88.21143, 0));
                spawnMapEditObject("zombiespawn", (-1561.622, -2178.478, 78.82732), (0, 96.05016, 0));
                spawnMapEditObject("invisiblecrate", (-591.9422, -1599.622, 82.49772), (0, 277.8155, 0));
                spawnMapEditObject("invisiblecrate", (-182.3381, -1593.354, 89.98954), (0, 270.9797, 0));
                spawnMapEditObject("invisiblecrate", (89.98373, -1646.179, 88.09376), (0, 249.3363, 0));
                spawnMapEditObject("invisiblecrate", (502.3287, -1703.598, 91.99625), (0, 247.1723, 0));
                spawnMapEditObject("invisiblecrate", (523.1098, -1764.484, 88.98016), (0, 46.23266, 0));
                spawnMapEditObject("invisiblecrate", (580.5289, -1801.429, 87.74248), (0, 66.01354, 0));
                spawnMapEditObject("invisiblecrate", (692.2335, -1830.678, 88.49069), (0, 88.89258, 0));
                spawnMapEditObject("invisiblecrate", (791.8092, -1782.11, 90.64059), (0, 83.40491, 0));
                spawnMapEditObject("invisiblecrate", (924.5876, -1786.189, 91.70829), (0, 92.85863, 0));
                spawnMapEditObject("invisiblecrate", (993.6157, -1793.078, 91.62931), (0, 89.86487, 0));
                spawnMapEditObject("invisiblecrate", (1065.608, -1745.098, 93.86519), (0, 102.3508, 0));
                spawnMapEditObject("invisiblecrate", (824.6727, -1579.794, 105.4271), (0, 84.84412, 0));
                spawnMapEditObject("invisiblecrate", (-1262.294, -1805.385, 96.58745), (0, 94.58898, 0));
                spawnMapEditObject("door", (-1880.958, -1280.355, 139.6261), (-1603.39, -1323.385, 168.125), (90, 275.7377, 0), 4, 2, 100, 2000);
                spawnMapEditObject("model", "iron_door_green_01", (-1194.115, -998.8194, 512.125), (0, 334.8519, 0));
                spawnMapEditObject("model", "iron_door_green_01", (-1209.078, -1028.411, 512.125), (0, 330.8716, 0));
                spawnMapEditObject("invisiblewall", (-1212.347, -1000.46, 518.6082), (-1241.303, -1054.908, 653.5945));
                spawnMapEditObject("invisiblewall", (-1262.408, -1038.656, 539.14), (-1326.617, -1012.554, 660.5105));
                spawnMapEditObject("fallLimit", -104);
                spawnMapEditObject("mapname", "Zombies a la Playa");
                spawnMapEditObject("hellMap", false);
                spawnMapEditObject("randombox", (653.7252, -1310.474, 108.4483), (0, -4.546143, 0), (1491.077, -1306.176, 107.0347), (0, 1.853386, 0), (-1146.395, -1398.822, 111.5082), (0, 10.1206, 0));
                spawnMapEditObject("invisiblecrate", (-1128.115, -984.3214, 514.7236), (0, 157.211, 0));
                spawnMapEditObject("model", "afr_bg_boulder_03", (-1725, -1500, 102), (0, 90, 0));
                spawnMapEditObject("model", "afr_bg_boulder_03", (-1725, -1700, 102), (0, -90, 0));
                spawnMapEditObject("model", "afr_bg_boulder_03", (-1725, -1900, 102), (0, 90, 0));
                spawnMapEditObject("model", "afr_bg_boulder_03", (1990, -1400, 95), (0, 90, 0));
                spawnMapEditObject("model", "afr_bg_boulder_03", (1990, -1600, 75), (0, -90, 0));
                spawnMapEditObject("model", "afr_bg_boulder_03", (1990, -1800, 50), (0, 90, 0));

                deleteDeathTriggers();
            }
        break;
        case "mp_lambeth":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("invisiblewall", (4269.146, 2187.59, -242.5658), (4363.624, 1862.395, -150.8358));
                spawnMapEditObject("invisiblewall", (2849.641, 1429.824, -230.2752), (3029.266, 1666.899, -141.8628));
                spawnMapEditObject("invisiblewall", (3029.266, 1666.899, -226.1554), (3194.848, 1800.204, -160.2593));
                spawnMapEditObject("invisiblewall", (3186.11, 1151.529, -183.875), (3282.761, 1325.295, -118.0419));
                spawnMapEditObject("invisiblewall", (3225.354, 1810.012, -229.3295), (3521.935, 1938.188, -164.9558));
                spawnMapEditObject("randombox", (2987.619, 1376.673, -293.8804), (0, 135.8636, 0), (4059.03, 1750.14, -251.5345), (0, -166.4307, 0));
                spawnMapEditObject("gambler", (3213.895, 1251.6, -300.4725), (0, -126.7481, 0));
                spawnMapEditObject("bank", (4253.126, 2166.353, -223.8557), (90, -143.3539, 0));
                spawnMapEditObject("ammo", (3314.12, 1821.756, -294.8848), (0, 22.58362, 0));
                spawnMapEditObject("killstreak", (3036.935, 1619.827, -288.2551), (0, 51.07666, 0));
                spawnMapEditObject("pap", (4296.523, 1985.375, -258.399), (0, -72.65137, 0));
                spawnMapEditObject("perk1", (3780.778, 2000.69, -245.7383), (90, -69.04785, 0));
                spawnMapEditObject("perk7", (3602.893, 1567.284, -269.3082), (90, 117.8021, 0));
                spawnMapEditObject("spawn", (3178.185, 1471.507, -322.1756), (3.118896, 33.40515, 0));
                spawnMapEditObject("zombiespawn", (4467.764, 2114.027, -263.3145), (0, -157.0538, 0));
                spawnMapEditObject("zombiespawn", (4491.071, 1965.483, -263.2054), (0, -166.0736, 0));
                spawnMapEditObject("model", "railing_old_span64b_white", (4344.139, 1862.309, -256.8635), (10.906373, 96.3071, 0));
                spawnMapEditObject("model", "railing_old_span64b_white", (4281.138, 2110.467, -257.6712), (10.85828, -75.89783, 0));
                spawnMapEditObject("hellMap", true);
                spawnMapEditObject("maxWave", 20);
                spawnMapEditObject("mapname", "Abandoned Road Of Hell");
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("invisiblewall", (-1916.4, -3776.87, -238.875), (-1918.832, -2990.398, -116.1916));
                spawnMapEditObject("invisiblewall", (-1351.055, -2706.166, -253.7378), (-232.4773, -2762.692, -122.4239));
                spawnMapEditObject("invisiblewall", (-232.4773, -2762.692, -219.7183), (-237.578, -4590.561, -75.05795));
                spawnMapEditObject("invisiblewall", (-237.5082, -4590.587, -273.9148), (-1023.321, -4595.961, -122.9627));
                spawnMapEditObject("invisiblewall", (-1056.686, -4860.125, -246.875), (-1057.471, -5273.013, -127.418));
                spawnMapEditObject("invisiblewall", (-1363.625, -5269.28, -263.1326), (-2084.559, -5195.505, -75.06364));
                spawnMapEditObject("invisiblewall", (-2116.738, -4636.875, -255.8332), (-1948.146, -4642.275, -145.6078));
                spawnMapEditObject("invisiblewall", (-1910.678, -4168.129, -246.875), (-1910.896, -4281.174, -157.1509));
                spawnMapEditObject("invisiblewall", (-270.6558, -2982.067, -262.8221), (-270.2297, -2802.951, -188.1716));
                spawnMapEditObject("invisiblewall", (-311.0065, -2799.409, -266.2939), (-259.7392, -2798.799, -186.1927));
                spawnMapEditObject("model", "com_pipe_4x256_metal_rusted",(-1225.616, -2732.498, -232.8213), (0, 176.9638, 0));
                spawnMapEditObject("model", "com_pipe_4_coupling_metal_rusted",(-1097.204, -2738.962, -232.1982), (0, 176.2054, 0));
                spawnMapEditObject("model", "com_pipe_4x256_metal_rusted",(-968.5174, -2743.746, -231.5067), (0, 177.6556, 0));
                spawnMapEditObject("model", "com_pipe_4_coupling_metal_rusted",(-840.204, -2748.962, -232.1982), (0, 176.2054, 0));
                spawnMapEditObject("model", "com_pipe_4x256_metal_rusted",(-711.5174, -2753.746, -231.5067), (0, 177.6556, 0));
                spawnMapEditObject("model", "com_pipe_4_coupling_metal_rusted",(-583.204, -2758.962, -232.1982), (0, 176.2054, 0));
                spawnMapEditObject("model", "com_pipe_4x128_metal_rusted",(-519.5174, -2763.746, -231.5067), (0, 177.6556, 0));
                spawnMapEditObject("model", "com_pipe_4x256_metal_rusted",(-1922.793, -3670.622, -213.779), (0, -89.63625, 0));
                spawnMapEditObject("model", "junk_crushedcars_1",(-1974.479, -3428.991, -239.7708), (-2.393803, 84.24441, 0));
                spawnMapEditObject("model", "com_pipe_4x256_metal_rusted", (-1931.583, -3105.955, -225.2655), (0, 88.79417, 0));
                spawnMapEditObject("model", "com_airduct_02",(-1938.881, -3250.895, -243.4372), (0, 87.1118, 0));
                spawnMapEditObject("model", "com_pipe_4x256_metal_rusted", (-1925.444, -4220.396, -174.9395), (0, -94.14613, 0));
                spawnMapEditObject("model", "vehicle_80s_wagon1_green_destroyed", (-2054.522, -4608.665, -255.0793), (-7.164307, 5.774521, 0));
                spawnMapEditObject("model", "com_pipe_4x256_metal_rusted", (-1061.838, -5160.549, -213.6916), (0, 88.38072, 0));
                spawnMapEditObject("model", "com_pipe_4x256_metal_rusted", (-1054.838, -4904.549, -213.6916), (0, 88.38072, 0));
                spawnMapEditObject("model", "com_powerpole1", (-224.6216, -3960.908, -265.7312), (0, 0, 83));
                spawnMapEditObject("model", "junk_crushedcars_3", (-201.8211, -4458.919, -273.6906), (-2.036744, 90.3583, 0));
                spawnMapEditObject("randombox", (-1524.28, -3034.458, -245.841), (0, -5.59079, 0), (-1218.729, -5264.908, -249.625), (0, 179.4574, 0), (-2034.954, -4669.661, -240.4113), (0, 0.8911438, 0));
                spawnMapEditObject("gambler", (-785.5621, -3130.274, -244.5819), (0, -90.69092, 0));
                spawnMapEditObject("bank", (-1000.875, -4565.664, -216.875), (90, 50.34609, 0));
                spawnMapEditObject("ammo", (-304.8316, -3914.125, -253.0914), (0, -2.316892, 0));
                spawnMapEditObject("killstreak", (-264.455, -3426.535, -247.7858), (0, -92.84973, 0));
                spawnMapEditObject("pap", (-1880.658, -4222.854, -231.875), (0, 87.15578, 0));
                spawnMapEditObject("power", (-1047.51, -3645.424, -228.872), (0, -26.47583, 0));
                spawnMapEditObject("perk1", (-1329.721, -2874.262, -230.6924), (90, -5.563352, 0));
                spawnMapEditObject("perk2", (-1070.126, -4710.219, -216.875), (90, -179.7901, 0));
                spawnMapEditObject("perk3", (-311.1255, -2864.876, -232.6428), (90, -179.0869, 0));
                spawnMapEditObject("perk4", (-1095.125, -4058.027, -216.875), (90, 179.8199, 0));
                spawnMapEditObject("perk5", (-1882.875, -3543.976, -216.875), (90, 0.182519, 0));
                spawnMapEditObject("perk6", (-785.1251, -3574.627, -230.4193), (90, -178.0048, 0));
                spawnMapEditObject("perk7", (-521.9413, -4582.158, -239.1079), (90, 88.92458, 0));
                spawnMapEditObject("spawn", (-1482.323, -4823.629, -246.875), (-6.002808, 90.00674, 0));
                spawnMapEditObject("spawn", (-1511.931, -3220.276, -259.8349), (-3.838501, -64.0271, 0));
                spawnMapEditObject("spawn", (-548.8184, -4250.107, -266.7046), (-12.49573, 151.3159, 0));
                spawnMapEditObject("spawn", (-456.0331, -3105.053, -261.9022), (-8.83728, -140.1404, 0));
                spawnMapEditObject("zombiespawn", (-767.1214, -2602.852, -260.2904), (0, -92.11596, 0));
                spawnMapEditObject("zombiespawn", (-10.93642, -4322.559, -275.9852), (0, 165.3894, 0));
                spawnMapEditObject("zombiespawn", (-1016.026, -5042.426, -265.8686), (0, 159.2646, 0));
                spawnMapEditObject("zombiespawn", (-1730.879, -5347.253, -259.6106), (0, 75.57619, 0));
                //spawnMapEditObject("radiation", (-1064.355, -2628.215, -257.3649), 128, 100);
                spawnMapEditObject("hellMap", false);
                spawnMapEditObject("mapname", "Wastelands");
                spawnMapEditObject("maxWave", 30);

                //Patch out of bounds
                spawnMapEditObject("invisiblewall", (-234, -4560, -271), (-232, -3598, -240));
            }

            deleteDestructables();
        break;
        case "mp_meteora":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("bank", (-2045.686, 2289.286, 1582), (90, 317.1149, 0));
                spawnMapEditObject("ammo", (-1171.897, 2333.015, 1599.125), (0, 1.724854, 0));
                spawnMapEditObject("killstreak", (-1174.064, 1761.042, 1599.125), (0, -178.0499, 0));
                spawnMapEditObject("gambler", (-1323.623, 2049.006, 1567), (0, -90.36255, 0));
                spawnMapEditObject("pap", (-2479.771, 2047.656, 1575.125), (0, -268.9014, 0));
                spawnMapEditObject("perk1", (-2330.124, 2207.417, 1582), (90, 0.1867676, 0));
                spawnMapEditObject("perk7", (-2333.075, 1892.111, 1582), (90, 356.4624, 0));
                spawnMapEditObject("zombiespawn", (-1392.784, 2361.085, 1552.125), (0, -90.61523, 0));
                spawnMapEditObject("zombiespawn", (-1390.319, 1733.581, 1552.125), (0, 92.07092, 0));
                spawnMapEditObject("zombiespawn", (-2015.115, 1734.832, 1552.125), (0, 89.53308, 0));
                spawnMapEditObject("zombiespawn", (-991.0186, 2049.999, 1568.125), (0, -179.5441, 0));
                spawnMapEditObject("spawn", (-1443.693, 1905.894, 1552), (0, 162.2186, 0));
                spawnMapEditObject("spawn", (-1446.081, 2191.921, 1552), (0, -153.5834, 0));
                spawnMapEditObject("spawn", (-2210.712, 2163.226, 1552), (0, -50.3009, 0));
                spawnMapEditObject("spawn", (-2218.466, 1928.941, 1552), (0, 43.28613, 0));
                spawnMapEditObject("spawn", (-1214.795, 2240.359, 1584.125), (0, -158.4778, 0));
                spawnMapEditObject("spawn", (-1229.347, 1852.178, 1584.125), (0, 147.4146, 0));
                spawnMapEditObject("spawn", (-1599.314, 2056.04, 1552), (0, 178.9178, 0));
                spawnMapEditObject("spawn", (-2006.635, 2046.249, 1552), (0, -0.2581787, 0));
                spawnMapEditObject("randombox", (-2314.201, 2047.913, 1567), (0, -269.2694, 0), (-1247.091, 2047.559, 1608), (0, -266.77, 0));
                spawnMapEditObject("timedTeleporter", (-1475.396, 2045.432, 1552.125), (0, 177.6654, 0), (-2395.745, 2049.931, 1560.125), (0, -178.3575, 0), (-1896.289, 2314.875, 1608.125), (-90, 90, 0), 30);
                spawnMapEditObject("invisiblewall", (-1373.125, 2326.501, 1552.125), (-1410.875, 2326.469, 1600));
                spawnMapEditObject("invisiblewall", (-1373.125, 1770.212, 1552.125), (-1410.875, 1772.195, 1600));
                spawnMapEditObject("invisiblewall", (-1997.125, 1770.834, 1552.125), (-2034.875, 1770.913, 1600));
                spawnMapEditObject("invisiblewall", (-1031.071, 2066.875, 1584.125), (-1031.137, 2029.125, 1630));
                spawnMapEditObject("invisiblewall", (-1580.875, 1781.189, 1594.125), (-1550.125, 1781.157, 1700));
                spawnMapEditObject("invisiblewall", (-1830.875, 1777.525, 1594.125), (-1800.125, 1777.8, 1700));
                spawnMapEditObject("hellMap", true);
                spawnMapEditObject("maxWave", 20);
                spawnMapEditObject("mapname", "Sanctuary Of Hell");
                spawnMapEditObject("model", "me_iron_gate", (-1393, 1775, 1425), (0, 90, 0));
                spawnMapEditObject("model", "me_iron_gate", (-2015, 1775, 1425), (0, 90, 0));
                spawnMapEditObject("model", "me_iron_gate", (-1393, 2325, 1425), (0, 90, 0));
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("gambler", (-195.6198, -320.9729, 1656.645), (0, 1.71936, 0));
                spawnMapEditObject("bank", (650.022, -524.6699, 1628.222), (90, -219.8474, 0));
                spawnMapEditObject("ammo", (51.5686, -307.7792, 1656.583), (0, -2.823486, 0));
                spawnMapEditObject("killstreak", (-313.184, -521.9118, 1644.745), (0, -180.3186, 0));
                spawnMapEditObject("pap", (315.2613, -522.088, 1628.336), (0, -182.2797, 0));
                spawnMapEditObject("power", (42.26177, -414.9095, 1657.019), (0, -184.5264, 0));
                spawnMapEditObject("perk1", (-538.9467, -310.6267, 1627.87), (90, -93.41125, 0));
                spawnMapEditObject("perk2", (523.9601, -530.9901, 1624.059), (90, -269.6539, 0));
                spawnMapEditObject("perk3", (374.9793, -306.7878, 1629.691), (90, -89.96704, 0));
                spawnMapEditObject("perk4", (-505.8179, -518.6463, 1629.62), (90, -267.8302, 0));
                spawnMapEditObject("perk5", (119.5466, -531.3863, 1667.225), (90, -270.4614, 0));
                spawnMapEditObject("perk6", (-378.4619, -309.6717, 1651.692), (90, -88.01147, 0));
                spawnMapEditObject("perk7", (-698.4534, -527.6, 1628.229), (90, -268.5663, 0));
                spawnMapEditObject("spawn", (-101.4989, -479.8438, 1644.961), (0, 164.1083, 0));
                spawnMapEditObject("spawn", (-121.3809, -371.2713, 1644.339), (0, -166.6187, 0));
                spawnMapEditObject("spawn", (136.8532, -463.5955, 1635.247), (0, 24.40613, 0));
                spawnMapEditObject("spawn", (127.8308, -361.3726, 1636.184), (0, -31.39893, 0));
                spawnMapEditObject("zombiespawn", (-899.7807, -503.3151, 1602.593), (0, 0.7086182, 0));
                spawnMapEditObject("zombiespawn", (-893.2862, -337.0861, 1600), (0, -10.11841, 0));
                spawnMapEditObject("zombiespawn", (735.6039, -482.6273, 1599.893), (0, 173.8477, 0));
                spawnMapEditObject("zombiespawn", (757.4135, -328.3733, 1600.837), (0, -154.7644, 0));
                spawnMapEditObject("invisiblewall", (-806.8252, -538.4196, 1600), (-798.8405, -291.6866, 1754.746));
                spawnMapEditObject("invisiblewall", (-800.2277, -570.0742, 1634.625), (-738.9992, -642.124, 1726.344));
                spawnMapEditObject("invisiblewall", (-799.243, -271.7974, 1639.912), (-609.0502, -263.1422, 1753.719));
                spawnMapEditObject("invisiblewall", (683.936, -292.2686, 1600.305), (680.227, -537.2279, 1760.721));
                spawnMapEditObject("invisiblewall", (672.2364, -561.1589, 1644.922), (589.8318, -641.9408, 1716.601));
                spawnMapEditObject("invisiblewall", (670.2171, -264.7598, 1633.194), (612.7061, -222.4344, 1733.598));
                spawnMapEditObject("model", "church_pew", (-800.2854, -357.2677, 1600), (0, 88.04826, 0));
                spawnMapEditObject("model", "church_pew", (-804.1942, -479.3014, 1600), (0, 88.67165, 0));
                spawnMapEditObject("model", "church_pew", (680.3191, -362.3185, 1600), (0, 268.9835, 0));
                spawnMapEditObject("model", "church_pew", (678.5281, -478.3621, 1600), (0, 269.0478, 0));
                spawnMapEditObject("fallLimit", 1459);
                spawnMapEditObject("mapname", "Un-Holy Bridge");
                spawnMapEditObject("hellMap", false);
                spawnMapEditObject("randombox", (-65.08035, -524.8056, 1662.567), (0, -180.9009, 0), (576.837, -315.6917, 1611.024), (0, 0.637207, 0), (-702.2114, -316.915, 1613), (0, 1.63147, 0));
            }
            else if (level.mapVariation == 2)
            {
                spawnMapEditObject("gambler", (-1477.269, 903.7065, 1568.893), (0, -269.7083, 0));
                spawnMapEditObject("bank", (-1920.161, 163.1279, 1582.136), (90, 1.511672, 0));
                spawnMapEditObject("ammo", (-2049.972, 470.8219, 1582.626), (0, -181.6529, 0));
                spawnMapEditObject("killstreak", (-1929.61, 1509.186, 1567.003), (0, -1.933037, 0));
                spawnMapEditObject("pap", (-1611.388, -44.98746, 1613), (0, -268.3405, 0));
                spawnMapEditObject("power", (-1844.047, 1106.271, 1605.125), (0, -121.8708, 0));
                spawnMapEditObject("perk1", (-1513.625, 554.9684, 1606), (90, -260.8314, 0));
                spawnMapEditObject("perk2", (-1866.406, 352.9163, 1581.957), (90, -270.2027, 0));
                spawnMapEditObject("perk3", (-2026.637, 805.2734, 1578.45), (90, -358.6372, 0));
                spawnMapEditObject("perk4", (-2087.098, 1379.874, 1584.782), (90, -90.08184, 0));
                spawnMapEditObject("perk5", (-1330.126, 1483.485, 1600.625), (90, -178.0933, 0));
                spawnMapEditObject("perk6", (-1489.052, 224.8507, 1575.827), (90, -239.8475, 0));
                spawnMapEditObject("perk7", (-1257.535, 1247.874, 1587.643), (90, -88.07684, 0));
                spawnMapEditObject("spawn", (-1963.671, 616.2162, 1532.864), (0, 62.04585, 0));
                spawnMapEditObject("spawn", (-1713.536, 516.1262, 1536.398), (0, -102.2437, 0));
                spawnMapEditObject("spawn", (-1390.425, 726.5396, 1534.796), (0, 13.54121, 0));
                spawnMapEditObject("spawn", (-1405.288, 1092.695, 1541.818), (0, -152.0448, 0));
                spawnMapEditObject("spawn", (-1529.327, 1411.398, 1537.904), (0, 102.113, 0));
                spawnMapEditObject("spawn", (-1727.843, 1304.582, 1538.68), (0, -90.60369, 0));
                spawnMapEditObject("spawn", (-1999.443, 1268.376, 1538.351), (0, -51.08587, 0));
                spawnMapEditObject("spawn", (-1899.418, 870.4903, 1537.083), (0, 76.53681, 0));
                spawnMapEditObject("zombiespawn", (-1342.997, 1597.953, 1552.125), (0, 178.7426, 0));
                spawnMapEditObject("zombiespawn", (-1848.858, -193.7607, 1598), (0, 2.615304, 0));
                spawnMapEditObject("zombiespawn", (-1076.036, 766.8839, 1536.125), (0, -177.9505, 0));
                spawnMapEditObject("invisiblewall", (-1469.303, 1555.126, 1553.276), (-1647.526, 1543.965, 1643.74));
                spawnMapEditObject("invisiblewall", (-2165.125, 1367.639, 1596.115), (-2163.354, 898.125, 1703.5));
                spawnMapEditObject("invisiblewall", (-2174.22, 558.5536, 1568.125), (-2169.793, 712, 1679.838));
                spawnMapEditObject("invisiblewall", (-1668.923, 92.35418, 1546.137), (-1801.824, 96.58765, 1668.547));
                spawnMapEditObject("invisiblewall", (-1216.243, -165.8585, 1600.465), (-1634.763, -147.125, 1722.166));
                spawnMapEditObject("invisiblewall", (-1196.052, 831.874, 1539.341), (-1199.989, 704.125, 1655.203));
                spawnMapEditObject("doorandspawn", (-1290.06, 379.7989, 1419.379), (-1268.517, 326.0438, 1598), (90, 128.6992, 0), 2, 2, 100, 2500, (-1283.737, -239.5949, 1598.125), (0, 89.54462, 0));
                spawnMapEditObject("model", "com_stone_bench_b", (-1730.197, 98.62283, 1542.76), (0, 178.4286, 0));
                spawnMapEditObject("model", "com_stone_bench_b", (-1555.663, 1548.141, 1555.125), (0, 6.366155, 0));
                spawnMapEditObject("model", "com_stone_bench_b", (-2185.614, 1152.423, 1568.125), (0, 269.7765, 0));
                spawnMapEditObject("model", "com_stone_bench_b", (-2168.045, 628.0878, 1568), (0, 88.00002, 0));
                spawnMapEditObject("model", "church_pew", (-1279.899, -162.3857, 1598), (0, 177.2019, 0));
                spawnMapEditObject("model", "church_pew", (-1434.137, -155.0665, 1598), (0, 177.1487, 0));
                spawnMapEditObject("model", "bench1", (-1204.456, 770.1985, 1540.125), (0, 178.7835, 0));
                spawnMapEditObject("model", "com_stone_bench_b", (-1583.78, -145.0747, 1598), (0, 177.1284, 0));
                spawnMapEditObject("fallLimit", 1456);
                spawnMapEditObject("mapname", "Cemetery of the Dead");
                spawnMapEditObject("hellMap", false);
                spawnMapEditObject("randombox", (-1612.725, 925.6885, 1568.713), (0, -89.13702, 0), (-2137.413, 1152.55, 1567.761), (0, 89.55559, 0), (-1262.897, 903.8464, 1605.625), (0, -89.7138, 0), (-1252.298, 626.5032, 1599.625), (0, 0.7091751, 0), (-1441.851, 180.3915, 1613), (0, 33.65717, 0), (-1720.167, 1401.413, 1562.675), (0, 0.08844757, 0), (-1773.545, 620.8287, 1560.842), (0, 0.6212845, 0));
            }
        break;
        case "mp_moab":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("bank", (1443.125, 1202.428, 472.5024), (90, 68.77661, 0));
                spawnMapEditObject("ammo", (1166.536, 2711.682, 396.3579), (0, -245.3281, 0));
                spawnMapEditObject("killstreak", (1325.888, 2229.284, 407.4725), (0, 60.6082, 0));
                spawnMapEditObject("gambler", (1383.321, 2525.372, 403.7509), (0, 97.25858, 0));
                spawnMapEditObject("pap", (1427.514, 1917.092, 395.6922), (0, -255.8585, 0));
                spawnMapEditObject("power", (1541.007, 2448.929, 404), (0, -45.03635, 0));
                spawnMapEditObject("perk1", (1382.884, 3316.279, 441.4024), (90, 249.3203, 0));
                spawnMapEditObject("perk2", (1947.115, 2236.68, 536.5633), (90, 181.8258, 0));
                spawnMapEditObject("perk3", (1648.441, 1300.497, 518.2894), (90, 118.4402, 0));
                spawnMapEditObject("perk4", (1693.88, 2182.127, 442.4083), (90, -78.03918, 0));
                spawnMapEditObject("perk5", (1502.081, 2888.272, 408.8233), (90, 34.38382, 0));
                spawnMapEditObject("perk6", (1606.873, 1709.339, 448.3914), (90, 144.0548, 0));
                spawnMapEditObject("perk7", (1245.829, 2142.935, 423.8695), (90, 4.539459, 0));
                spawnMapEditObject("spawn", (1712.311, 1855.874, 445.8971), (0, 117.1658, 0));
                spawnMapEditObject("spawn", (1706.362, 2390.16, 402.9384), (0, -155.037, 0));
                spawnMapEditObject("spawn", (1472.833, 2213.369, 401.8429), (0, 40.7449, 0));
                spawnMapEditObject("spawn", (1173.779, 2852.517, 373.9092), (0, -34.70371, 0));
                spawnMapEditObject("spawn", (1097.641, 3078.5, 369.3828), (0, -25.89268, 0));
                spawnMapEditObject("spawn", (1323.318, 3164.181, 369.6391), (0, -95.30429, 0));
                spawnMapEditObject("zombiespawn", (1993.725, 1686.378, 749.2567), (0, 142.742, 0));
                spawnMapEditObject("zombiespawn", (1857.203, 2960.665, 731.978), (0, -149.8349, 0));
                spawnMapEditObject("zombiespawn", (1089.534, 3544.335, 726.6291), (0, -65.63023, 0));
                spawnMapEditObject("randombox", (963.4426, 3037.576, 413.0233), (0, -247.9538, 0), (1242.788, 2464.1, 454.236), (0, -250.629, 0));
                spawnMapEditObject("invisiblefloor", (1204.809, 2605.892, 410), (1385.325, 2309.156, 410));
                spawnMapEditObject("invisiblewall", (1317.859, 2283.343, 388.6636), (1199.59, 2118.436, 575));
                spawnMapEditObject("invisiblewall", (1443.125, 1168.624, 445.9331), (1711.139, 1305.064, 625));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Trapped Canyon");
                spawnMapEditObject("deathwall", (2047.07, 1772.227, 766.7625), (1928.991, 1569.972, 800));
            }
        break;
        case "mp_mogadishu":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("randombox", (1833.126, -701.3662, -30.875), (0, 86.98607, 0), (1942.958, -20.48659, 2.875), (0, -1.387955, 0), (3727.304, -407.4694, -30.875), (0, -92.28883, 0), (2052.556, -217.8244, 2.875), (0, -90.48158, 0));
                spawnMapEditObject("gambler", (1979.111, -1120.874, -30.875), (0, -179.9432, 0));
                spawnMapEditObject("bank", (1831.125, -1272.875, 20.875), (90, 47.666, 0));
                spawnMapEditObject("ammo", (1834.095, -274.8547, 2.875), (0, 87.71117, 0));
                spawnMapEditObject("killstreak", (2041.226, -349.4469, 2.875), (0, 0.4192963, 0));
                spawnMapEditObject("pap", (3696.258, -1203.282, -30.875), (0, -89.76198, 0));
                spawnMapEditObject("power", (2054.164, -798.4212, -30.875), (0, -91.21217, 0));
                spawnMapEditObject("perk1", (3378.101, -361.3282, -15.875), (90, 19.88707, 0));
                spawnMapEditObject("perk2", (3345.338, -1159.311, -15.875), (90, 22.40843, 0));
                spawnMapEditObject("perk3", (2875.416, -426.8624, -15.96366), (90, 176.7993, 0));
                spawnMapEditObject("perk4", (2843.418, -1225.594, -15.87459), (90, 179.3207, 0));
                spawnMapEditObject("perk5", (2495.917, -458.7574, -15.875), (90, 1.842026, 0));
                spawnMapEditObject("perk6", (2385.72, -1272.875, -15.58804), (90, 89.1339, 0));
                spawnMapEditObject("perk7", (2996.656, -1237.874, -15.87316), (90, 1.490463, 0));
                spawnMapEditObject("spawn", (1937.164, -711.4365, -45.875), (6.722413, 1.853012, 0));
                spawnMapEditObject("zombiespawn", (4237.07, -402.5172, -65.68642), (0, -177.4274, 0));
                spawnMapEditObject("zombiespawn", (4237.308, -1196.023, -70.71957), (0, -178.5095, 0));
                spawnMapEditObject("zombiespawn", (4091.421, -753.3492, -81.14504), (0, -176.3452, 0));
                spawnMapEditObject("invisiblewall", (1953.776, -449.4437, 91.61481), (1882.685, -416.4198, -13.875));
                spawnMapEditObject("invisiblewall", (1941.318, -1186.112, 91.32938), (2014.964, -1211.441, -13.875));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Docked Death");
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("gambler", (-1761.624, -1825.813, -38.875), (0, -179.0936, 0));
                spawnMapEditObject("bank", (-1455.964, -1762.403, -16), (90, 180.7163, 0));
                spawnMapEditObject("ammo", (-1659.787, -1823.789, -38.875), (0, -179.632, 0));
                spawnMapEditObject("killstreak", (-1462.773, -2046.733, -31), (0, -90.62073, 0));
                spawnMapEditObject("pap", (-1711.251, -1692.497, -38.8), (0, 89.34631, 0));
                spawnMapEditObject("power", (-1706.179, -1568.43, -38.875), (0, -1.582031, 0));
                spawnMapEditObject("perk1", (-1570.426, -1230.761, -16), (90, -359.6704, 0));
                spawnMapEditObject("perk7", (-1452.702, -1288.282, -16), (90, -180.2747, 0));
                spawnMapEditObject("spawn", (-1484.18, -958.3365, -25.89637), (0, -93.72986, 0));
                spawnMapEditObject("spawn", (-1502.044, -1148.146, -43.98494), (0, -94.72412, 0));
                spawnMapEditObject("spawn", (-1527.757, -965.8484, -27.68853), (0, -69.16992, 0));
                spawnMapEditObject("zombiespawn", (-3706.322, -1541.792, -78.875), (0, -0.802002, 0));
                spawnMapEditObject("zombiespawn", (69.90697, -2461.235, -78.875), (0, 174.798, 0));
                spawnMapEditObject("zombiespawn", (-1547.783, -4433.959, -78), (0, 89.01123, 0));
                spawnMapEditObject("mapname", "Nostalgic Attack");
                spawnMapEditObject("hellMap", false);
                spawnMapEditObject("randombox", (-1805.879, -1687.854, -38.875), (0, -269.6045, 0), (-1510.211, -2527.849, -31), (0, -181.1646, 0), (-1559.515, -1057.574, -26.04133), (0, -265.8527, 0));
                spawnMapEditObject("invisiblewall", (-1577.875, -862.7215, 10.12512), (-1302.396, -858.4338, 75.61593));
            }
        break;
        case "mp_morningwood":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("bank", (-1265.584, 1774.791, 1191.625), (90, 199.1509, 0));
                spawnMapEditObject("ammo", (-1714.921, 1608.434, 1176.625), (0, -28.38146, 0));
                spawnMapEditObject("killstreak", (-1603.622, 1604.528, 1305.625), (0, -210.0843, 0));
                spawnMapEditObject("pap", (-1467.149, 1650.577, 1441.358), (5, -118.1233, 0));
                spawnMapEditObject("power", (-1426.108, 1439.981, 1180.659), (0, 60.51442, 0));
                spawnMapEditObject("perk1", (-1441.462, 1519.311, 1191.625), (90, 106.278, 0));
                spawnMapEditObject("perk2", (-1579.718, 1155.921, 1191.5), (90, 15.22879, 0));
                spawnMapEditObject("perk3", (-1666.249, 2424.083, 1191.625), (90, 331.646, 0));
                spawnMapEditObject("perk4", (-1113.849, 1802.094, 1319.625), (90, 195.0035, 0));
                spawnMapEditObject("perk5", (-1566.406, 1398.11, 1320.625), (90, 284.6959, 0));
                spawnMapEditObject("perk6", (-1571.624, 1890.434, 1320.625), (90, 279.7026, 0));
                spawnMapEditObject("perk7", (-1971.06, 1436.358, 1236.516), (90, 12.05374, 0));
                spawnMapEditObject("spawn", (-1504.546, 1770.119, 1161.626), (0, -41.72985, 0));
                spawnMapEditObject("spawn", (-1756.927, 1469.092, 1161.625), (0, -25.47009, 0));
                spawnMapEditObject("spawn", (-1414.715, 1218.612, 1161.5), (0, 52.88441, 0));
                spawnMapEditObject("spawn", (-1226.655, 1572.614, 1161.626), (0, -111.092, 0));
                spawnMapEditObject("spawn", (-1498.223, 1726.359, 1291.625), (0, -31.24889, 0));
                spawnMapEditObject("spawn", (-1188.973, 1495.857, 1291.625), (0, -155.29, 0));
                spawnMapEditObject("spawn", (-1428.595, 1200.218, 1291.625), (0, 88.75477, 0));
                spawnMapEditObject("spawn", (-1543.87, 2296.625, 1161.625), (0, -101.6328, 0));
                spawnMapEditObject("spawn", (-1905.997, 1865.934, 1161.625), (0, 13.74012, 0));
                spawnMapEditObject("zombiespawn", (-1736.115, 1272.548, 1151.618), (0, 61.36585, 0));
                spawnMapEditObject("zombiespawn", (-1058.432, 1580.857, 1142.901), (0, -156.4491, 0));
                spawnMapEditObject("zombiespawn", (-1396.862, 2017.14, 1153.625), (0, -118.8648, 0));
                spawnMapEditObject("zombiespawn", (-1919.153, 2088.42, 1153.5), (0, -28.1123, 0));
                spawnMapEditObject("zombiespawn", (-1458.89, 2394.629, 1159.424), (0, -114.4319, 0));
                spawnMapEditObject("zombiespawn", (-1446.124, 1553.946, 1290.625), (0, -118.2166, 0));
                spawnMapEditObject("gambler", (-1547.751, 1147.078, 1305.624), (0, -209.3208, 0));
                spawnMapEditObject("randombox", (-1124.229, 1284.489, 1305.625), (0, -121.573, 0), (-1121.536, 1284.328, 1176.5), (0, -126.0499, 0), (-1987.941, 1756.103, 1176.625), (0, -207.9035, 0));
                spawnMapEditObject("timedTeleporter", (-1303.553, 1385.397, 1161.625), (0, 150.2947, 0), (-1776.077, 1978.443, 1437.853), (0, -42.32311, 0), (-1658, 1629, 1150), (90, 62, 0), 45);
                spawnMapEditObject("invisiblewall", (-1049.542, 1483.241, 1150.086), (-1116.758, 1654.207, 1450));
                spawnMapEditObject("invisiblewall", (-1392.079, 1076.756, 1163.125), (-1501.098, 1093.99, 1250));
                spawnMapEditObject("invisiblewall", (-1424.35, 2014.308, 1163.625), (-1377.395, 1989.349, 1250));
                spawnMapEditObject("invisiblewall", (-1707.356, 1259.797, 1160.567), (-1883.951, 1356.307, 1250));
                spawnMapEditObject("invisiblewall", (-1920.093, 2058.156, 1153.625), (-1892.794, 2107.67, 1250));
                spawnMapEditObject("invisiblewall", (-1394.767, 2344.263, 1161.625), (-1578.08, 2447.708, 1250));
                spawnMapEditObject("invisiblewall", (-1239.193, 1109.408, 1283.84), (-1291.203, 1088.323, 1450));
                spawnMapEditObject("invisiblewall", (-1042.159, 1404.257, 1139.308), (-1045.108, 1471.113, 1275));
                spawnMapEditObject("invisiblewall", (-1043.053, 1459.808, 1297.565), (-1058.767, 1328.094, 1450));
                spawnMapEditObject("invisiblewall", (-1058.767, 1328.094, 1295.563), (-1115.369, 1215.259, 1450));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Under Construction");
                spawnMapEditObject("model", "md_iron_gate", (-1360, 2305, 1161), (0, 60, 0));
                spawnMapEditObject("model", "md_iron_gate", (-1600, 2450, 1161), (0, 240, 0));
                spawnMapEditObject("model", "md_wood_stack_01", (-1975, 2050, 1150), (0, 60, 0));
                spawnMapEditObject("model", "md_wood_stack_01", (-1350, 1960, 1150), (0, 150, 0));
                spawnMapEditObject("model", "md_wood_stack_01", (-1715, 1215, 1152), (0, 150, -10));
                spawnMapEditObject("model", "md_wood_stack_01", (-1715, 1200, 1125), (0, 150, 0));
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("gambler", (-3023.398, -5657.058, 271.125), (0, -87.77304, 0));
                spawnMapEditObject("bank", (-2636.812, -5073.581, 286.125), (90, -89.51437, 0));
                spawnMapEditObject("ammo", (-2866.962, -4960.997, 271.125), (0, 1.183258, 0));
                spawnMapEditObject("killstreak", (-3165.84, -5167.563, 271.125), (0, 88.68936, 0));
                spawnMapEditObject("pap", (-2310.24, -5975.073, 271.125), (0, -91.53036, 0));
                spawnMapEditObject("power", (-2954.308, -5126.598, 271.1251), (0, -87.86642, 0));
                spawnMapEditObject("perk1", (-3181.017, -6007.729, 286.125), (90, -359.1299, 0));
                spawnMapEditObject("perk2", (-3057.398, -4951.921, 286.125), (90, -88.90463, 0));
                spawnMapEditObject("perk3", (-3017.338, -5386.42, 286.125), (90, -177.2732, 0));
                spawnMapEditObject("perk4", (-2900.184, -5898.549, 286.125), (90, -88.67392, 0));
                spawnMapEditObject("perk5", (-2779.696, -5239.034, 286.125), (90, -271.4974, 0));
                spawnMapEditObject("perk7", (-2594.84, -6071.962, 286.125), (90, -268.2784, 0));
                spawnMapEditObject("perk6", (-3183.227, -5783.218, 286.125), (90, -359.5309, 0));
                spawnMapEditObject("spawn", (-3013.069, -5237.345, 256.1252), (0, 20.45328, 0));
                spawnMapEditObject("spawn", (-3033.034, -5025.478, 256.1268), (0, -24.1677, 0));
                spawnMapEditObject("spawn", (-2760.478, -4996.958, 256.125), (0, -87.69064, 0));
                spawnMapEditObject("spawn", (-3077.826, -5134.382, 256.125), (0, 6.63797, 0));
                spawnMapEditObject("zombiespawn", (-2490.032, -5218.697, 258.5475), (0, 178.0027, 0));
                spawnMapEditObject("zombiespawn", (-2479.837, -5085.705, 250.6488), (0, -164.8476, 0));
                spawnMapEditObject("zombiespawn", (-2352.19, -5786.623, 256.125), (0, -92.50816, 0));
                spawnMapEditObject("invisiblewall", (-2427.555, -5872.629, 256.125), (-2280.696, -5866.576, 386.2474));
                spawnMapEditObject("invisiblewall", (-2280.923, -5879.363, 256.125), (-2282.438, -6078.402, 373.3321));
                spawnMapEditObject("invisiblewall", (-2295.317, -6078.876, 256.125), (-3182.856, -6079.531, 382.2358));
                spawnMapEditObject("invisiblewall", (-3200.125, -6066.523, 269.9243), (-3200.125, -4942.212, 388.9347));
                spawnMapEditObject("invisiblewall", (-3179.473, -4927.875, 268.1362), (-2703.65, -4927.875, 421.9723));
                spawnMapEditObject("invisiblewall", (-2552.493, -5249.02, 256.125), (-2547.521, -5053.327, 354.6518));
                spawnMapEditObject("door", (-3285.465, -5501.319, 299.5835), (-3132.281, -5518.746, 256.125), (90, 87.93957, 0), 2, 2, 100, 2000);
                spawnMapEditObject("fallLimit", 5);
                spawnMapEditObject("mapname", "Glass Palace");
                spawnMapEditObject("hellMap", false);
                spawnMapEditObject("randombox", (-2906.898, -5297.735, 271.125), (0, -180.256, 0), (-2965.084, -5792.386, 271.125), (0, -88.17404, 0), (-2734.589, -5897.725, 271.125), (0, -0.6294861, 0));
                spawnMapEditObject("model", "md_iron_gate", (-2550, -5225, 256), (0, 0, 0));
            }
        break;
        case "mp_nola":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("bank", (-2443.292, -583.5455, 46), (90, 92.07682, 0));
                spawnMapEditObject("ammo", (-2817.17, 99.15104, 25), (0, -64.37401, 0));
                spawnMapEditObject("killstreak", (-3902.692, 322.2424, 31.6068), (0, 0.566185, 0));
                spawnMapEditObject("pap", (-4096.402, 79.9538, 25), (0, -268.7747, 0));
                spawnMapEditObject("power", (-3464.695, 76.90984, 25), (0, -238.9138, 0));
                spawnMapEditObject("perk1", (-3524.396, -367.2318, 46), (90, 27.28493, 0));
                spawnMapEditObject("perk2", (-2455.347, -179.4883, 46), (90, 230.2958, 0));
                spawnMapEditObject("perk3", (-2892.037, 255.2865, 47), (90, 181.9559, 0));
                spawnMapEditObject("perk4", (-3651.499, 297.622, 47), (90, 267.4076, 0));
                spawnMapEditObject("perk5", (-3049.487, -415.8754, 45.68748), (90, 89.40714, 0));
                spawnMapEditObject("perk6", (-3859.063, -243.3515, 46), (90, 46.68678, 0));
                spawnMapEditObject("perk7", (-2804.158, 5.983245, 55.08251), (90, 216.7442, 0));
                spawnMapEditObject("spawn", (-3088.188, -26.07302, 9.999995), (0, 161.3017, 0));
                spawnMapEditObject("spawn", (-3741.641, 136.9251, 10), (0, -19.69261, 0));
                spawnMapEditObject("spawn", (-3738.623, -108.6926, 16), (0, 38.85353, 0));
                spawnMapEditObject("spawn", (-3151.233, 150.8678, 9.999999), (0, -145.5025, 0));
                spawnMapEditObject("spawn", (-2775.847, -203.6578, 16), (0, 151.0899, 0));
                spawnMapEditObject("zombiespawn", (-4242.668, 244.7742, 8.124999), (0, -22, 0));
                spawnMapEditObject("zombiespawn", (-4241.975, -121.782, 8.124999), (0, 10, 0));
                spawnMapEditObject("zombiespawn", (-3333.415, 363.7046, 9.124999), (0, -88.99984, 0));
                spawnMapEditObject("zombiespawn", (-2654.882, -7.082233, 9.999997), (0, -120.0912, 0));
                spawnMapEditObject("gambler", (-3071.974, 322.6115, 32), (0, -0.5654068, 0));
                spawnMapEditObject("randombox", (-3323.052, -79.0987, 31), (0, -179.4173, 0), (-2952.651, 95.84866, 25), (0, -62.58873, 0), (-3663.385, -244.5885, 31), (0, -180.3951, 0));
                spawnMapEditObject("invisiblewall", (-2394.79, -278.4995, 16.125), (-2390.032, -562.8751, 90));
                spawnMapEditObject("invisiblewall", (-3288.125, 337.6707, 16.12619), (-3388.735, 340.4738, 110));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Death Avenue");
                spawnMapEditObject("model", "mp_cw_construction_barrier", (-4285, 250, 12), (0, 90, 0));
                spawnMapEditObject("model", "mp_cw_construction_barrier", (-4285, 175, 8), (0, 90, 0));
                spawnMapEditObject("model", "mp_cw_construction_barrier", (-4285, 100, 8), (0, 90, 0));
                spawnMapEditObject("model", "mp_cw_construction_barrier", (-4285, 25, 8), (0, 90, 0));
                spawnMapEditObject("model", "mp_cw_construction_barrier", (-4285, -50, 12), (3, 90, 0));
                spawnMapEditObject("model", "mp_cw_construction_barrier", (-4285, -125, 12), (0, 90, 0));
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("gambler", (927.7962, -472.7041, 27.125), (0, -179.2624, 0));
                spawnMapEditObject("bank", (1185.535, -496.7692, 42.125), (90, -269.7019, 0));
                spawnMapEditObject("ammo", (1638.047, -471.1741, 27.125), (0, -182.5144, 0));
                spawnMapEditObject("killstreak", (1039.792, 310.2192, 31), (0, -2.201302, 0));
                spawnMapEditObject("pap", (1988.03, -180.3914, 23.125), (0, -90.28966, 0));
                spawnMapEditObject("power", (1229.761, -155.469, 23.125), (0, 73.04405, 0));
                spawnMapEditObject("perk1", (248.9597, -496.8972, 72.17902), (90, -341.4316, 0));
                spawnMapEditObject("perk2", (1354.897, 299.3395, 46), (90, -88.21326, 0));
                spawnMapEditObject("perk3", (1745.842, 305.4034, 46), (90, -89.48768, 0));
                spawnMapEditObject("perk4", (1835.719, -511.8738, 42.31422), (90, -269.8887, 0));
                spawnMapEditObject("perk5", (1445.036, -510.5885, 42.125), (90, -269.5042, 0));
                spawnMapEditObject("perk6", (744.3464, -507.8593, 42.125), (90, -267.1696, 0));
                spawnMapEditObject("perk7", (847.6202, 311.2504, 46), (90, -92.47047, 0));
                spawnMapEditObject("spawn", (901.3486, 76.67709, 8.124139), (0, -19.51024, 0));
                spawnMapEditObject("spawn", (892.619, -73.01316, 8.126287), (0, -3.882186, 0));
                spawnMapEditObject("spawn", (896.5831, -217.0423, 8.124629), (0, 3.099604, 0));
                spawnMapEditObject("spawn", (894.6617, -365.3156, 8.125131), (0, 12.83349, 0));
                spawnMapEditObject("spawn", (1570.912, -375.4585, 8.125001), (0, 145.7845, 0));
                spawnMapEditObject("spawn", (1680.688, -150.101, 8.124996), (0, -175.604, 0));
                spawnMapEditObject("spawn", (1638.923, -7.795566, 8.123428), (0, -149.506, 0));
                spawnMapEditObject("spawn", (1495.08, 119.0199, 8.125), (0, -142.244, 0));
                spawnMapEditObject("zombiespawn", (1986.77, 254.114, 16.125), (0, -157.927, 0));
                spawnMapEditObject("zombiespawn", (1989.398, -15.20058, 8.125001), (0, -174.1758, 0));
                spawnMapEditObject("zombiespawn", (1991.714, -390.1089, 8.124998), (0, 161.44, 0));
                spawnMapEditObject("zombiespawn", (760.5956, 402.6044, 16.125), (0, -90.9763, 0));
                spawnMapEditObject("invisiblewall", (823.8752, 333.949, 16.97525), (658.931, 329.376, 151.6583));
                spawnMapEditObject("invisiblewall", (2016.124, 329.7086, 20.46107), (2007.038, -523.3954, 162.5913));
                spawnMapEditObject("invisiblefloor", (1064.091, -287.4255, 8.125), (1407.876, 5.817749, 8.125));
                spawnMapEditObject("invisiblefloor", (1078.277, -239.6952, 20), (1341.625, -44.25997, 20));
                spawnMapEditObject("fallLimit", -127);
                spawnMapEditObject("mapname", "Parkside Invasion");
                spawnMapEditObject("hellMap", false);
                spawnMapEditObject("randombox", (421.7861, -230.8778, 121.0337), (0, 66.31493, 0), (332.2918, -264.4764, 58.24538), (0, 79.65782, 0));
                spawnMapEditObject("model", "mp_cw_construction_barrier", (2015, -450, 12), (0, 90, 0));
                spawnMapEditObject("model", "mp_cw_construction_barrier", (2015, -375, 8), (0, 90, 0));
                spawnMapEditObject("model", "mp_cw_construction_barrier", (2015, -292, 8), (0, 90, 0));
                spawnMapEditObject("model", "mp_cw_construction_barrier", (2015, -210, 8), (0, 90, 0));
                spawnMapEditObject("model", "mp_cw_construction_barrier", (2015, -120, 8), (0, 90, 0));
                spawnMapEditObject("model", "mp_cw_construction_barrier", (2015, -45, 8), (0, 90, 0));
                spawnMapEditObject("model", "mp_cw_construction_barrier", (2015, 30, 8), (0, 90, 0));
                spawnMapEditObject("model", "mp_cw_construction_barrier", (2015, 200, 8), (0, 90, 0));
                spawnMapEditObject("model", "mp_cw_construction_barrier", (2015, 275, 8), (0, 90, 0));
                spawnMapEditObject("model", "mp_cw_construction_barrier", (700, 325, 16), (0, 0, 0));
                spawnMapEditObject("model", "mp_cw_construction_barrier", (780, 325, 16), (0, 0, 0));
            }
        break;
        case "mp_overwatch":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("bank", (513.0189, 373.4621, 12894), (90, 78.60353, 0));
                spawnMapEditObject("ammo", (-449.0181, 898.4472, 12879.13), (0, 60.91553, 0));
                spawnMapEditObject("killstreak", (289.0944, 437.6683, 12879.13), (0, -125.5224, 0));
                spawnMapEditObject("gambler", (-276.5319, 432.9886, 12879.13), (0, -235.21, 0));
                spawnMapEditObject("pap", (-4.157091, -421.6386, 12905.63), (0, -0.6902847, 0));
                spawnMapEditObject("power", (-0.5627749, 548.4125, 12879.13), (0, -0.5859146, 0));
                spawnMapEditObject("perk1", (-365.9619, 1264.521, 12898.13), (90, 179.6942, 0));
                spawnMapEditObject("perk2", (-508.6946, 381.627, 12894), (90, 91.43007, 0));
                spawnMapEditObject("perk3", (322.7433, 664.889, 12922.56), (90, 129.3494, 0));
                spawnMapEditObject("perk4", (695.2772, 734.6989, 12894), (90, 174.1406, 0));
                spawnMapEditObject("perk5", (362.867, 1052.885, 12894.13), (90, 52.83141, 0));
                spawnMapEditObject("perk6", (-385.309, 1506.862, 12894.13), (90, 143.7268, 0));
                spawnMapEditObject("perk7", (165.5033, 1035.177, 12894.13), (90, 270.8386, 0));
                spawnMapEditObject("spawn", (-500.7327, 515.9106, 12864.36), (0, 39.20836, 0));
                spawnMapEditObject("spawn", (-553.3391, 789.9374, 12864), (0, 11.38548, 0));
                spawnMapEditObject("spawn", (-495.8133, 1065.635, 12864.13), (0, -42.72768, 0));
                spawnMapEditObject("spawn", (-527.3297, 1512.258, 12864.13), (0, -87.62881, 0));
                spawnMapEditObject("spawn", (198.5359, 1140.193, 12865.13), (0, 178.4985, 0));
                spawnMapEditObject("spawn", (-273.5744, 1148.686, 12865.16), (0, 0.9319925, 0));
                spawnMapEditObject("spawn", (365.1921, 1358.641, 12868.13), (0, -65.80446, 0));
                spawnMapEditObject("spawn", (538.6841, 888.3238, 12864.13), (0, -175.1404, 0));
                spawnMapEditObject("spawn", (545.2775, 482.0584, 12864), (0, 140.6231, 0));
                spawnMapEditObject("spawn", (252.8195, 566.7191, 12864.13), (0, -152.5855, 0));
                spawnMapEditObject("spawn", (-201.6111, 541.6462, 12864.13), (0, -36.81154, 0));
                spawnMapEditObject("zombiespawn", (-676.7399, 630.4256, 12844.75), (0, 44.17967, 0));
                spawnMapEditObject("zombiespawn", (-322.1324, 1688.11, 12864.13), (0, -147.3999, 0));
                spawnMapEditObject("zombiespawn", (302.9399, 1605.148, 12864.13), (0, -66.11757, 0));
                spawnMapEditObject("zombiespawn", (570.0986, 307.7261, 12864), (0, 26.41478, 0));
                spawnMapEditObject("randombox", (-63.60151, 1034.281, 12879.13), (0, 0.6115875, 0), (-2.470144, 376.1477, 12879.13), (0, -178.4198, 0), (-541.5571, 1733.553, 12880.13), (0, -0.1941299, 0), (352.8091, 1469.591, 12883.13), (0, 1.470299, 0));
                spawnMapEditObject("invisiblewall", (-599.9409, 351.1457, 12864.12), (-687.7048, 419.5017, 12950));
                spawnMapEditObject("invisiblewall", (-708.8762, 434.6653, 12912.11), (-574.7501, 586.3336, 13000));
                spawnMapEditObject("invisiblewall", (-587.7842, 606.4439, 12850.78), (-708.29, 725.5311, 13000));
                spawnMapEditObject("invisiblewall", (-708.29, 725.5311, 12908.74), (-688.9233, 794.875, 13000));
                spawnMapEditObject("invisiblewall", (-690.0869, 861.125, 12916.12), (-689.5714, 930.8747, 13000));
                spawnMapEditObject("invisiblewall", (-690.4537, 997.1251, 12916.12), (-690.4627, 1170.875, 13000));
                spawnMapEditObject("invisiblewall", (-426.875, 1746.265, 12864.13), (-359.9528, 1539.125, 12925));
                spawnMapEditObject("invisiblewall", (254.1251, 1502.74, 12866.13), (464.8749, 1502.683, 12925));
                spawnMapEditObject("invisiblewall", (691.3264, 1135.875, 12916.07), (689.6331, 997.125, 13000));
                spawnMapEditObject("invisiblewall", (689.6069, 930.8749, 12916.13), (689.1002, 861.1252, 13000));
                spawnMapEditObject("invisiblewall", (686.7565, 794.875, 12916.13), (709.8591, 752.1251, 13000));
                spawnMapEditObject("invisiblewall", (703.5675, 719.8749, 12916.13), (680.126, 688.5439, 13000));
                spawnMapEditObject("invisiblewall", (597.0095, 341.7773, 12864.13), (688.8076, 407.0265, 12950));
                spawnMapEditObject("invisiblewall", (173.8749, 340.1177, 12897.13), (-33.87499, 344.662, 13000));
                spawnMapEditObject("timedTeleporter", (-27.866, 1147.7, 12865.14), (0, 1.012588, 0), (13.56868, -778.5177, 12864.13), (0, 89.38113, 0), (223.125, 1242.125, 12826.13), (0, -137.8766, 0), 45);
                spawnMapEditObject("invisiblewall", (356.5791, -793.875, 12864.13), (356.3378, -746.1254, 12925));
                spawnMapEditObject("invisiblewall", (-299.8962, -746.125, 12864.13), (-299.7585, -792.375, 12925));
                spawnMapEditObject("invisiblewall", (127.8479, -471.375, 12890.63), (127.8377, -396.3768, 12950));
                spawnMapEditObject("invisiblewall", (127.8377, -396.3768, 12892.63), (-122.5457, -398.3148, 12950));
                spawnMapEditObject("invisiblewall", (-122.5457, -398.3148, 12892.63), (-122.5065, -495.8749, 12950));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("fallLimit", 12675);
                spawnMapEditObject("mapname", "Death In Progress");
                spawnMapEditObject("model", "prop_bm21_crte_clsed", (315, 1500, 12868), (0, 90, 0));
                spawnMapEditObject("model", "prop_bm21_crte_clsed", (410, 1500, 12875), (0, 90, 7));
                spawnMapEditObject("model", "prop_bm21_crte_clsed", (630, 375, 12864), (0, 125, 0));
                spawnMapEditObject("model", "ow_construction_woodplankpile_01_ns", (-650, 640, 12842), (0, 130, 0));
                spawnMapEditObject("model", "prop_bm21_crte_clsed", (-650, 385, 12864), (0, 55, 0));
                spawnMapEditObject("model", "prop_bm21_crte_clsed", (-400, 1641, 12864), (0, 20, 0));
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("gambler", (-5286.287, 13133.36, 13375.13), (0, -268.4867, 0));
                spawnMapEditObject("bank", (-5289.026, 11647.78, 13390.13), (90, -311.7673, 0));
                spawnMapEditObject("ammo", (-4940.785, 11657.03, 13375.13), (0, -180.64, 0));
                spawnMapEditObject("killstreak", (-5286.148, 12125.35, 13375.13), (0, 89.79945, 0));
                spawnMapEditObject("pap", (-4547.162, 12603.21, 13375.13), (0, -92.27148, 0));
                spawnMapEditObject("power", (-4941.018, 12608.03, 13375.13), (0, -93.2163, 0));
                spawnMapEditObject("perk1", (-5294.585, 13395.31, 13390.13), (90, -359.6183, 0));
                spawnMapEditObject("perk2", (-5299.191, 11881.09, 13390.13), (90, -357.399, 0));
                spawnMapEditObject("perk3", (-4615.966, 12361.16, 13390.13), (90, -179.9149, 0));
                spawnMapEditObject("perk4", (-5291.557, 12393.13, 13390.13), (90, -359.7611, 0));
                spawnMapEditObject("perk5", (-5300.062, 12867.84, 13390.13), (90, -356.6959, 0));
                spawnMapEditObject("perk6", (-4969.346, 13643.04, 13390.13), (90, -89.42052, 0));
                spawnMapEditObject("perk7", (-4614.474, 12873.05, 13390.13), (90, -177.6627, 0));
                spawnMapEditObject("spawn", (-5129.69, 11780.03, 13360.13), (0, 14.08717, 0));
                spawnMapEditObject("spawn", (-5127.841, 11986.63, 13360.13), (0, 7.561288, 0));
                spawnMapEditObject("spawn", (-5122.863, 12195.65, 13360.13), (0, 12.54908, 0));
                spawnMapEditObject("spawn", (-5100.773, 12424.8, 13360.13), (0, 9.533334, 0));
                spawnMapEditObject("spawn", (-5102.586, 12853.69, 13360.12), (0, -12.97215, 0));
                spawnMapEditObject("spawn", (-5088.147, 13033.52, 13360.13), (0, -19.37718, 0));
                spawnMapEditObject("spawn", (-5082.016, 13268.98, 13360.13), (0, -18.44883, 0));
                spawnMapEditObject("spawn", (-5110.712, 13500.69, 13360.13), (0, -23.22789, 0));
                spawnMapEditObject("zombiespawn", (-4496.798, 13523.86, 13372.2), (0, 181.9921, 0));
                spawnMapEditObject("zombiespawn", (-4492.917, 13098.18, 13372.2), (0, 178.9574, 0));
                spawnMapEditObject("zombiespawn", (-4486.414, 12093.25, 13367.58), (0, 185.0643, 0));
                spawnMapEditObject("zombiespawn", (-4487.21, 11738.11, 13366.03), (0, 177.1394, 0));
                spawnMapEditObject("invisiblefloor", (-4535.875, 13651.51, 13353.29), (-4452.521, 11646.52, 13353.29));
                spawnMapEditObject("model", "hind_arena_rbeam_long", (-4503.875, 13117.39, 13353.78), (0, 89.57449, 0));
                spawnMapEditObject("model", "hind_arena_rbeam_long", (-4503.875, 12099.65, 13354.54), (0, 91.21193, 0));
                spawnMapEditObject("fallLimit", 12846);
                spawnMapEditObject("mapname", "Skyline Fight");
                spawnMapEditObject("hellMap", false);
                spawnMapEditObject("randombox", (-5285.719, 12611.44, 13375.13), (0, -269.5304, 0), (-4620.987, 13383.75, 13375.13), (0, -89.10741, 0), (-4617.606, 11849.19, 13375.13), (0, -86.50365, 0));
            }
        break;
        case "mp_paris":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("invisiblewall", (-3350.875, 1705.388, 260.2084), (-3147.798, 1704.426, 352.2603));
                spawnMapEditObject("ramp", (-1019.528, 2266.889, 238.4321), (-1025.176, 2368.159, 268.125));
                spawnMapEditObject("ramp", (-2987.835, 1838.19, 240.8447), (-3120.25, 1833.718, 267.125));
                spawnMapEditObject("randombox", (-2002.668, 1992.875, 253.1606), (0, -5.00277, 0), (-1058.629, 3012.866, 246.125), (0, -1.036706, 0), (-1221.278, 2103.125, 243.5093), (0, 174.6347, 0));
                spawnMapEditObject("gambler", (-2667.33, 1735.125, 256.762), (0, 178.9633, 0));
                spawnMapEditObject("bank", (-3600.874, 2240.874, 283.9402), (90, -38.56051, 0));
                spawnMapEditObject("ammo", (-2783.258, 1992.875, 253.9407), (0, -1.410241, 0));
                spawnMapEditObject("killstreak", (-1365.693, 1895.698, 251.379), (0, -129.8184, 0));
                spawnMapEditObject("pap", (-938.1249, 2188.125, 248.986), (0, -93.75033, 0));
                spawnMapEditObject("power", (-2343.795, 2039.125, 245.0441), (0, 177.8647, 0));
                spawnMapEditObject("perk1", (-2240.044, 2238.874, 264.625), (90, -90.15231, 0));
                spawnMapEditObject("perk2", (-1216.875, 2690.525, 263.125), (90, 0.3860235, 0));
                spawnMapEditObject("perk3", (-1900.72, 2585.545, 262.125), (90, -43.62521, 0));
                spawnMapEditObject("perk4", (-3013.266, 2275.875, 263.125), (90, -91.60799, 0));
                spawnMapEditObject("perk5", (-1711.126, 2039.126, 260.861), (90, 138.5336, 0));
                spawnMapEditObject("perk6", (-943.1252, 2401.133, 261.125), (90, 136.7209, 0));
                spawnMapEditObject("perk7", (-3600.863, 1768.196, 298.4206), (90, 33.56474, 0));
                spawnMapEditObject("spawn", (-1090.039, 2742.904, 222.7423), (-0.1330376, -91.61349, 0));
                spawnMapEditObject("spawn", (-3363.23, 2092.376, 236.3367), (2.031269, 0.3750372, 0));
                spawnMapEditObject("zombiespawn", (-3259.959, 1614.59, 255.7731), (0, 90.19376, 0));
                //spawnMapEditObject("zombiespawn", (-2428.133, 2273.875, 231.125), (0, -145.3531, 0));
                spawnMapEditObject("zombiespawn", (-1621.186, 1771.911, 248.2712), (0, 108.9584, 0));
                spawnMapEditObject("model", "mil_barbedwire4", (-3204.605, 1713.078, 266.1056), (-4.818726, 0, 0));
                spawnMapEditObject("model", "com_bollard_metal_01", (-3260.561, 1710.18, 243.2267), (0, 0, 0));
                spawnMapEditObject("model", "mil_barbedwire4", (-3315.605, 1713.078, 266.1056), (4.818726, 0, 0));
                spawnMapEditObject("invisiblewall", (-2139.875, 2264.884, 292.1257), (-2002.127, 2262.144, 335.875));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Death Alley");
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("bank", (3410.914, 448.5945, 38.12507), (90, 88.77228, 0));
                spawnMapEditObject("ammo", (3572.713, 1967.189, 10.86918), (0, 0, 0));
                spawnMapEditObject("killstreak", (2504.401, 1971.455, -12.53239), (0, 0, 0));
                spawnMapEditObject("power", (2629.636, 890.1583, -9.99999), (0, -134.8434, 0));
                spawnMapEditObject("pap", (2071.625, 1837.88, -9.39637), (0, -268.0362, 0));
                spawnMapEditObject("gambler", (3009.572, 1973.326, -14.05025), (0, 0, 0));
                spawnMapEditObject("perk1", (3465.469, 1008.445, -4), (90, 236.824, 0));
                spawnMapEditObject("perk2", (2320.817, 1157.435, 4.624411), (90, 312.0694, 0));
                spawnMapEditObject("perk3", (2973.371, 1125.136, 8.00001), (90, 268.4702, 0));
                spawnMapEditObject("perk4", (3775.302, 1529.728, -19.97006), (90, 174.9051, 0));
                spawnMapEditObject("perk5", (3760.056, 849.5995, -8), (90, 166.7862, 0));
                spawnMapEditObject("perk6", (2979.283, 1681.816, -5.437119), (90, 90.89264, 0));
                spawnMapEditObject("perk7", (2604.087, 606.1758, -0.8581791), (90, 1.897888, 0));
                spawnMapEditObject("spawn", (2239.875, 627.1887, -10.960658), (0, 23.28278, 0));
                spawnMapEditObject("spawn", (3189.014, 1030.304, -28.20652), (0, -167.9013, 0));
                spawnMapEditObject("spawn", (2379.254, 1052.778, -21.35691), (0, -43.53607, 0));
                spawnMapEditObject("spawn", (3474.579, 600.3935, -40.3258), (0, 124.4943, 0));
                spawnMapEditObject("spawn", (3634.463, 1814.9, -45.49834), (0, -138.4579, 0));
                spawnMapEditObject("spawn", (3031.427, 649.5813, -24), (0, 162.3587, 0));
                spawnMapEditObject("zombiespawn", (2528.533, 353.9541, -17.15843), (0, 87.48138, 0));
                spawnMapEditObject("zombiespawn", (2385.352, 362.4542, -23.83285), (0, 93.67767, 0));
                spawnMapEditObject("zombiespawn", (2000.762, 1880.198, -23.26192), (0, 1.128845, 0));
                spawnMapEditObject("zombiespawn", (2011.731, 1791.244, -22.05976), (0, -5.704651, 0));
                spawnMapEditObject("randombox", (2943.868, 853.6411, -5.474079), (0, 1.39801, 0), (3288.141, 1396.073, -23.0607), (0, 89.7995, 0), (2191.73, 691.7205, -1), (0, 89.82697, 0));
                spawnMapEditObject("invisiblewall", (3330.082, 531.701, -38.84182), (2598.003, 529.1332, 13.08956));
                spawnMapEditObject("invisiblewall", (2628.875, 471.8666, -16.53477), (2312.162, 475.385, 116.3864));
                spawnMapEditObject("model", "paris_fence_construction_02", (2639.875, 485.3871, -15.671537), (0, 177.6791, 0));
                spawnMapEditObject("model", "paris_fence_construction_02", (2538.335, 486.1753, -17.681417), (3, -176.2839, 0));
                spawnMapEditObject("model", "paris_fence_construction_02", (2425.803, 479.9401, -23.19151), (-2, 177.1683, 0));
                spawnMapEditObject("mapname", "Storefront");
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("invisiblewall", (2669.089, 1923.488, -25.86365), (2733.068, 1857.292, -55.875));
            }
        break;
        case "mp_park":
            //Remove the turrets
            turrets = getEntArray("misc_turret", "classname");
            foreach (turret in turrets)
                turret delete();

            if (level.mapVariation == 0)
            {
                spawnMapEditObject("bank", (1485.538, -802.2441, -9), (90, 66.55264, 0));
                spawnMapEditObject("ammo", (1049.144, -414.4488, -32.875), (0, -26.40269, 0));
                spawnMapEditObject("killstreak", (1223.076, -603.3143, -31.66248), (0, -207.7375, 0));
                spawnMapEditObject("gambler", (1339.962, -143.8419, -19.35043), (0, 60.25197, 0));
                spawnMapEditObject("pap", (2227.292, -902.8754, 215.125), (0, -116.5016, 0));
                spawnMapEditObject("power", (765.5406, -338.8055, -31.95295), (0, -205.6721, 0));
                spawnMapEditObject("perk1", (880.5063, -26.88954, -10.428131), (90, 336.4867, 0));
                spawnMapEditObject("perk2", (1680.163, -445.0569, -16.18084), (90, 196.6143, 0));
                spawnMapEditObject("perk3", (1275.849, -337.549, -4.164219), (90, 18.85548, 0));
                spawnMapEditObject("perk4", (1192.702, -417.1376, -18.1725), (90, 241.1419, 0));
                spawnMapEditObject("perk5", (1691.711, -243.2942, -1.17901), (90, 199.0697, 0));
                spawnMapEditObject("perk6", (1351.428, -722.8201, -17.76708), (90, 19.8058, 0));
                spawnMapEditObject("perk7", (2013.222, -981.554, 269.125), (90, 19.16859, 0));
                spawnMapEditObject("spawn", (2139.752, -944.1285, 200.125), (0, 89.69533, 0));
                spawnMapEditObject("spawn", (1525.623, -268.1391, -49.31893), (0, -118.8471, 0));
                spawnMapEditObject("spawn", (1484.716, -659.1584, -33.76276), (0, 115.4857, 0));
                spawnMapEditObject("spawn", (829.1856, -300.2628, -47.875), (0, 14.62025, 0));
                spawnMapEditObject("spawn", (962.7856, -38.08689, -47.875), (0, -78.18676, 0));
                spawnMapEditObject("zombiespawn", (1601.571, -18.72996, 21.23417), (0, -114.3922, 0));
                spawnMapEditObject("zombiespawn", (540.6617, -1.68022, 156.1264), (0, -24.27685, 0));
                spawnMapEditObject("zombiespawn", (2322.331, -851.4418, 200), (0, 153.8884, 0));
                spawnMapEditObject("randombox", (1469.509, -492.1167, -32.22821), (0, 68.96962, 0), (1178.299, -109.4745, -32.875), (0, -25.64464, 0));
                spawnMapEditObject("invisiblewall", (1474.879, -88.96387, 5.757061), (1647.001, -179.2534, 75));
                spawnMapEditObject("invisiblewall", (517.112, -26.12056, 157.2567), (553.8224, 36.30897, 225));
                spawnMapEditObject("invisiblewall", (2320.333, -827.5541, 200.125), (2299.614, -863.8113, 325));
                spawnMapEditObject("invisiblewall", (2212.302, -1039.35, 246.125), (2234.847, -994.522, 325));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Wartorn");
                spawnMapEditObject("model", "mil_sandbag_desert_short", (2310, -850, 200), (0, -25, 0));
                spawnMapEditObject("model", "mil_barbedwire4", (1500, -115, -10), (-10, 150, 0));
                spawnMapEditObject("model", "mil_barbedwire4", (1615, -165, -10), (10, 150, 0));
                spawnMapEditObject("model", "mil_sandbag_desert_short", (550, -6, 152), (0, -25, 0));
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("bank", (241.8096, -2819.949, 238.125), (90, 326.588, 0));
                spawnMapEditObject("ammo", (-764.9703, -2260.962, 239.125), (0, -106.9984, 0));
                spawnMapEditObject("killstreak", (-434.0333, -2670.327, 223), (0, -242.4488, 0));
                spawnMapEditObject("gambler", (-797.6218, -2132.338, 239.125), (0, -107.6576, 0));
                spawnMapEditObject("pap", (-729.2896, -2804.952, 229.17), (0, -196.7622, 0));
                spawnMapEditObject("power", (25.00114, -2057.343, 240.2995), (0, 72.74341, 0));
                spawnMapEditObject("perk1", (-232.3867, -2297.458, 254.125), (90, 296.2163, 0));
                spawnMapEditObject("perk2", (214.6191, -3067.271, 247.6266), (90, 73.52345, 0));
                spawnMapEditObject("perk3", (131.2977, -2504.922, 254.125), (90, 304.3132, 0));
                spawnMapEditObject("perk4", (-1178.442, -2450.36, 242), (90, 14.91139, 0));
                spawnMapEditObject("perk5", (-2076.912, -1892.546, 254.125), (90, 340.3539, 0));
                spawnMapEditObject("perk6", (-29.8095, -2229.087, 256.8596), (90, 342.8862, 0));
                spawnMapEditObject("perk7", (-1225.128, -1961.222, 254.125), (90, 163.3257, 0));
                spawnMapEditObject("spawn", (-1920.078, -1932.274, 224), (0, 30.57787, 0));
                spawnMapEditObject("spawn", (-1854.627, -1663.918, 224), (0, -38.47118, 0));
                spawnMapEditObject("spawn", (-1148.231, -2397.729, 208.125), (0, -8.577383, 0));
                spawnMapEditObject("spawn", (177.9113, -2945.271, 208.1269), (0, 133.756, 0));
                spawnMapEditObject("spawn", (187.0799, -2615.719, 224.124), (0, 169.6538, 0));
                spawnMapEditObject("spawn", (-174.3801, -2384.851, 224.125), (0, -62.10826, 0));
                spawnMapEditObject("spawn", (-840.6344, -2659.489, 208), (0, 36.01061, 0));
                spawnMapEditObject("zombiespawn", (-768.3783, -1728.658, 172.0045), (0, -116.3423, 0));
                spawnMapEditObject("zombiespawn", (-1334.178, -1338.277, 176.5238), (0, -118.6879, 0));
                spawnMapEditObject("zombiespawn", (-1485.021, -1254.833, 171.8243), (0, -113.1617, 0));
                spawnMapEditObject("zombiespawn", (-2117.47, -1536.642, 221.1103), (0, -30.12707, 0));
                spawnMapEditObject("zombiespawn", (140.2745, -1940.642, 215.666), (0, -106.3832, 0));
                spawnMapEditObject("zombiespawn", (482.4926, -2959.011, 202.3058), (0, 164.6605, 0));
                spawnMapEditObject("zombiespawn", (420.482, -2562.078, 224), (0, -158.0134, 0));
                spawnMapEditObject("randombox", (-571.0114, -2304.368, 239.125), (0, -18.65182, 0), (-1183.405, -2112.265, 239.125), (0, 74.69348, 0), (-1766.807, -2058.401, 239.125), (0, -196.7952, 0), (-245.4952, -2742.641, 223), (0, -198.7782, 0));
                spawnMapEditObject("invisiblewall", (-2018.723, -1642.022, 224.125), (-1978.261, -1533.273, 275));
                spawnMapEditObject("invisiblewall", (-1479.305, -1655.56, 224.125), (-1757.276, -1560.882, 350));
                spawnMapEditObject("invisiblewall", (-768.5059, -1875.255, 234.3208), (-882.4213, -1834.567, 325));
                spawnMapEditObject("invisiblewall", (161.5925, -2013.278, 236.5462), (87.88797, -1987.881, 300));
                spawnMapEditObject("invisiblewall", (347.5524, -2703.548, 233.125), (306.8164, -2526.125, 300));
                spawnMapEditObject("invisiblewall", (434.9194, -2876.557, 222.3443), (387.1068, -3018.934, 300));
                spawnMapEditObject("model", "vehicle_hummer_destroyed", (342.1561, -2595.926, 224.125), (0, -73.03967, 0));
                spawnMapEditObject("model", "prk_bench", (130.298, -1999.904, 227.7021), (0, -17.38293, 0));
                spawnMapEditObject("model", "prk_bench", (-783.1026, -1857.601, 239.4728), (-10, -14.13647, 0));
                spawnMapEditObject("model", "prk_bench", (431.3932, -2913.237, 217.4017), (5, -111.5468, 0));
                spawnMapEditObject("model", "prk_bench", (403.2469, -3004.598, 216.7033), (-10, -111.739, 0));
                spawnMapEditObject("model", "prk_bench", (-871.3481, -1836.55, 239.0427), (10, -15.60314, 0));
                spawnMapEditObject("model", "prk_sandbags_short", (-1580.355, -1630.246, 228.1263), (0, -107.9378, 0));
                spawnMapEditObject("model", "prk_sandbags_short", (-1507.07, -1650.078, 228.1373), (0, -104.3288, 0));
                spawnMapEditObject("model", "prk_sandbags_short", (-1747.327, -1572.998, 230.125), (0, -109.734, 0));
                spawnMapEditObject("model", "prk_sandbags_short", (-2001.368, -1616.162, 228.127), (0, -18.82215, 0));
                spawnMapEditObject("model", "prk_sandbags_short", (-1985.258, -1564.374, 228.127), (0, -17.0149, 0));
                spawnMapEditObject("mapname", "Library");
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("invisiblefloor", (-1305.836, -1196.784, 160.61), (-1784.008, -1667.184, 160.61));
            }
            else if (level.mapVariation == 2)
            {
                spawnMapEditObject("gambler", (-3558.891, 659.192, 367.125), (0, -101.0728, 0));
                spawnMapEditObject("bank", (-3492.333, 935.442, 382.125), (90, -189.5403, 0));
                spawnMapEditObject("ammo", (-3620.681, 366.1673, 376.1233), (0, 14.71756, 0));
                spawnMapEditObject("killstreak", (-3719.397, -237.2178, 367.125), (0, -101.2981, 0));
                spawnMapEditObject("pap", (-3098.685, 134.0327, 243.1869), (0, -133.1804, 0));
                spawnMapEditObject("power", (-3860.977, 278.8672, 367.125), (0, 77.64175, 0));
                spawnMapEditObject("perk1", (-3303.758, 350.5455, 246.125), (90, -99.59518, 0));
                spawnMapEditObject("perk2", (-3663.767, 14.62315, 382.125), (90, -190.139, 0));
                spawnMapEditObject("perk3", (-3793.629, 65.56362, 382.125), (90, -108.4941, 0));
                spawnMapEditObject("perk4", (-3574.031, 498.1888, 382.125), (90, -235.941, 0));
                spawnMapEditObject("perk5", (-3370.985, -16.73993, 246.125), (90, -282.1715, 0));
                spawnMapEditObject("perk6", (-3768.429, 765.1043, 382.125), (90, -9.282074, 0));
                spawnMapEditObject("perk7", (-3942.864, -235.5678, 382.125), (90, -7.057343, 0));
                spawnMapEditObject("spawn", (-3361.75, 52.22622, 216.1255), (0, 144.7792, 0));
                spawnMapEditObject("spawn", (-3351.141, 177.4812, 216.1242), (0, 171.6408, 0));
                spawnMapEditObject("spawn", (-3327.591, 277.6154, 216.1253), (0, -172.3521, 0));
                spawnMapEditObject("spawn", (-3819.111, -336.886, 352.1234), (0, 118.044, 0));
                spawnMapEditObject("spawn", (-3614.088, 875.2269, 352.1241), (0, -141.2334, 0));
                spawnMapEditObject("spawn", (-3681.44, 534.3242, 352.1251), (0, 176.4967, 0));
                spawnMapEditObject("spawn", (-3718.819, 277.6407, 352.1264), (0, 161.0555, 0));
                spawnMapEditObject("zombiespawn", (-4184.957, 522.3932, 339.9282), (0, -12.52304, 0));
                spawnMapEditObject("zombiespawn", (-4260.804, 197.2358, 335.3051), (0, -6.667328, 0));
                spawnMapEditObject("invisiblewall", (-3764.53, -531.8734, 346.2211), (-4003.721, -489.0595, 446.354));
                spawnMapEditObject("invisiblewall", (-4001.002, -475.5532, 349.7078), (-3743.629, 1010.387, 500.3273));
                spawnMapEditObject("invisiblewall", (-3748.381, -542.8284, 457.125), (-3643.558, 70.80611, 525.5165));
                spawnMapEditObject("invisiblewall", (-3476.962, 981.0195, 457.125), (-3589.91, 367.5342, 516.9312));
                spawnMapEditObject("invisiblewall", (-3608.297, 52.70948, 400.125), (-3285.395, -4.930891, 530.601));
                spawnMapEditObject("invisiblewall", (-3548.299, 380.4299, 400.125), (-3274.823, 331.5845, 507.5998));
                spawnMapEditObject("invisiblewall", (-3497.043, 980.4199, 352.125), (-3722.275, 1021.953, 494.3638));
                spawnMapEditObject("fallLimit", 105);
                spawnMapEditObject("mapname", "Autumn Attack");
                spawnMapEditObject("hellMap", false);
                spawnMapEditObject("randombox", (-3659.376, 206.991, 367.125), (0, -233.1834, 0), (-3108.245, 21.6724, 159), (0, -101.1003, 0), (-3863.473, -488.8604, 367.125), (0, -191.3969, 0), (-3601.798, 974.9838, 367.125), (0, -11.53427, 0));
            }
        break;
        case "mp_plaza2":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("invisiblewall", (1367.522, 1447.126, 648.125), (894.0148, 1440.125, 747.5985));
                spawnMapEditObject("randombox", (1424.873, 932.3317, 847.125), (0, -91.03636, 0), (1159.125, 911.9324, 695.625), (0, 91.12245, 0));
                spawnMapEditObject("gambler", (731.8745, 911.0367, 847.125), (0, -89.9597, 0));
                spawnMapEditObject("bank", (589.056, 1147.808, 873.1345), (90, -91.76146, 0));
                spawnMapEditObject("ammo", (1424.875, 545.4252, 847.125), (0, -92.48656, 0));
                spawnMapEditObject("killstreak", (1424.871, 1152.257, 847.125), (0, -91.4044, 0));
                spawnMapEditObject("pap", (984.8749, 914.3679, 663.125), (0, -91.76695, 0));
                spawnMapEditObject("power", (808.7686, 1443.175, 695.125), (0, -0.140976, 0));
                spawnMapEditObject("perk1", (951.6467, 1412.875, 710.625), (90, -91.04735, 0));
                spawnMapEditObject("perk2", (1208.427, 1413.774, 710.625), (90, -92.84911, 0));
                spawnMapEditObject("perk3", (1432.875, 1166.01, 710.625), (90, 179.8535, 0));
                spawnMapEditObject("perk4", (1432.874, 910.2259, 710.625), (90, -179.7839, 0));
                spawnMapEditObject("perk5", (1432.875, 662.3309, 710.625), (90, -179.7839, 0));
                spawnMapEditObject("perk6", (1206.839, 415.1253, 710.625), (90, 90.03481, 0));
                spawnMapEditObject("perk7", (951.4236, 415.1251, 710.625), (90, 88.59011, 0));
                spawnMapEditObject("spawn", (1279.667, 919.0852, 832.125), (6.365357, -179.0478, 0));
                spawnMapEditObject("zombiespawn", (1262.641, 1486.041, 648.3493), (0, -90.32774, 0));
                spawnMapEditObject("zombiespawn", (1002.778, 1477.245, 648.125), (0, -91.4099, 0));
                spawnMapEditObject("zombiespawn", (750.7594, 577.9974, 648.125), (0, 0.2105866, 0));
                spawnMapEditObject("zombiespawn", (712.8749, 1326.646, 648.125), (0, -0.8715669, 0));
                spawnMapEditObject("zombiespawn", (476.4246, 752.3773, 834.1486), (0, 35.56459, 0));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Bone Appetite");
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("bank", (-1860.326, 733.1349, 2654.125), (90, 228.5944, 0));
                spawnMapEditObject("ammo", (-1861.9, 381.4242, 2639.125), (0, -88.98741, 0));
                spawnMapEditObject("killstreak", (-1860.406, 510.709, 2639.125), (0, -87.49327, 0));
                spawnMapEditObject("gambler", (-1863.406, -354, 2639.125), (0, -87.49327, 0));
                spawnMapEditObject("pap", (-2742.339, 102.7867, 2639.125), (0, 88.50221, 0));
                spawnMapEditObject("perk1", (-1866.893, -568.9766, 2654.125), (90, 133.266, 0));
                spawnMapEditObject("perk7", (-1864.657, -224.9937, 2654.125), (90, 179.6997, 0));
                spawnMapEditObject("spawn", (-2029.791, 614.3578, 2624.125), (0, -159.9866, 0));
                spawnMapEditObject("spawn", (-2047.874, 405.129, 2624.125), (0, -173.1152, 0));
                spawnMapEditObject("spawn", (-2047.876, 185.9379, 2624.125), (0, -177.3944, 0));
                spawnMapEditObject("spawn", (-2047.875, -13.25747, 2624.125), (0, -179.0808, 0));
                spawnMapEditObject("spawn", (-2047.877, -176.2854, 2624.125), (0, 165.1813, 0));
                spawnMapEditObject("spawn", (-2047.877, -518.1116, 2624.125), (0, 154.184, 0));
                spawnMapEditObject("spawn", (-2047.876, -361.3595, 2624.125), (0, 169.6033, 0));
                spawnMapEditObject("zombiespawn", (-3006.281, 521.5466, 2624.125), (0, -3.013901, 0));
                spawnMapEditObject("zombiespawn", (-2944.021, 182.4876, 2624.125), (0, -3.156723, 0));
                spawnMapEditObject("zombiespawn", (-2961.281, -62.9824, 2624.126), (0, -4.788193, 0));
                spawnMapEditObject("zombiespawn", (-2981.041, -356.0607, 2624.124), (0, -3.453354, 0));
                spawnMapEditObject("randombox", (-1794.887, 90.29596, 2639.125), (0, -89.91576, 0), (-2599.078, 821.1185, 2635.125), (0, 0.4193268, 0), (-2488.075, -661.9344, 2635.125), (0, -179.5752, 0));
                spawnMapEditObject("invisiblewall", (-1824.542, -394.4305, 2624.125), (-1824.052, -186.3848, 2710.125));
                spawnMapEditObject("invisiblewall", (-1823.984, 341.9557, 2624.125), (-1824.657, 544.0121, 2710.125));
                spawnMapEditObject("hellMap", true);
                spawnMapEditObject("mapname", "Skyscraper to Hell");
                spawnMapEditObject("maxWave", 20);
                spawnMapEditObject("fallLimit", 1900);
            }
            else if (level.mapVariation == 2)
            {
                spawnMapEditObject("bank", (1397.214, 2400.356, 679.7595), (90, 77.21561, 0));
                spawnMapEditObject("ammo", (1068.208, 2938.612, 754.2276), (0, -239.2071, 0));
                spawnMapEditObject("killstreak", (818.6707, 3358.762, 784.9565), (0, -238.5534, 0));
                spawnMapEditObject("gambler", (378.8947, 4427.129, 697.6286), (0, 43.05363, 0));
                spawnMapEditObject("pap", (1195.871, 3721.866, 778.5646), (0, -148.8021, 0));
                spawnMapEditObject("power", (954.7622, 3132.501, 757.7522), (0, -240.071, 0));
                spawnMapEditObject("perk1", (1956.926, 3395.058, 770.0569), (90, 208.726, 0));
                spawnMapEditObject("perk2", (432.9802, 3990.067, 769.6915), (90, 26.03983, 0));
                spawnMapEditObject("perk3", (1329.203, 4440.322, 769.0555), (90, 208.2701, 0));
                spawnMapEditObject("perk4", (695.6115, 4742.266, 687.7938), (90, 301.8461, 0));
                spawnMapEditObject("perk5", (215.5706, 4570.438, 677.5418), (90, 340.2488, 0));
                spawnMapEditObject("perk6", (1029.635, 4935.583, 691.167), (90, 215.7627, 0));
                spawnMapEditObject("perk7", (2295.725, 2837.913, 678.7845), (90, 162.4131, 0));
                spawnMapEditObject("spawn", (1777.995, 3093.276, 712.2634), (0, 127.6469, 0));
                spawnMapEditObject("spawn", (1342.161, 2906.266, 714.3195), (0, 85.74503, 0));
                spawnMapEditObject("spawn", (1604.374, 3021.922, 713.4008), (0, 116.4024, 0));
                spawnMapEditObject("spawn", (1091.643, 3241.409, 750.7972), (0, 40.10233, 0));
                spawnMapEditObject("spawn", (1630.514, 3537.936, 753.2103), (0, -152.0211, 0));
                spawnMapEditObject("spawn", (1461.005, 3870.094, 763.2533), (0, -151.2191, 0));
                spawnMapEditObject("spawn", (907.3775, 3538.725, 763.7879), (0, 30.98368, 0));
                spawnMapEditObject("spawn", (719.0019, 3848.245, 751.7516), (0, 27.34171, 0));
                spawnMapEditObject("spawn", (1319.227, 4183.741, 748.7512), (0, -139.8977, 0));
                spawnMapEditObject("spawn", (1040.023, 4569.877, 703.938), (0, -104.6535, 0));
                spawnMapEditObject("spawn", (760.6402, 4452.104, 702.0698), (0, -57.31344, 0));
                spawnMapEditObject("spawn", (499.0033, 4228.681, 712.8135), (0, -25.78268, 0));
                spawnMapEditObject("zombiespawn", (169.333, 5110.803, 632), (0, -59.5986, 0));
                spawnMapEditObject("zombiespawn", (574.6732, 5274.081, 632), (0, -67.3934, 0));
                spawnMapEditObject("zombiespawn", (1756.68, 2222.109, 640.124), (0, 114.5677, 0));
                spawnMapEditObject("zombiespawn", (2175.785, 2425.395, 638.866), (0, 118.9128, 0));
                spawnMapEditObject("randombox", (1645.594, 3911.744, 786.9881), (0, -60.54195, 0), (1854.515, 2635.082, 658.2899), (0, -150.5324, 0), (417.5773, 4700.514, 656.3788), (0, 28.68205, 0));
                spawnMapEditObject("invisiblewall", (-316.0424, 4360.821, 640.125), (1132.396, 5060.449, 800));
                spawnMapEditObject("invisiblewall", (1161.798, 4830.523, 640.125), (1105.247, 4914.49, 850));
                spawnMapEditObject("invisiblewall", (1161.798, 4830.523, 640.125), (1699.71, 4798.547, 850));
                spawnMapEditObject("invisiblewall", (1151.283, 2248.109, 648.125), (2399.856, 2843.547, 800));
                spawnMapEditObject("invisiblewall", (2399.856, 2843.547, 635.9351), (2799.835, 2904.382, 800));
                spawnMapEditObject("invisiblewall", (1151.283, 2248.109, 648.125), (894.7675, 2255.149, 800));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Liberty Bridge");
                spawnMapEditObject("model", "berlin_utility_parking_lot_gate_down", (1465, 2390, 655), (0, 25, 0));
                spawnMapEditObject("model", "berlin_utility_parking_lot_gate_down", (2263, 2775, 645), (0, 205, 0));
                spawnMapEditObject("model", "mil_razorwire_mid_static", (2018, 2600, 610), (0, 25, 0));
                spawnMapEditObject("model", "mil_razorwire_mid_static", (1775, 2500, 610), (0, 25, 0));
                spawnMapEditObject("model", "mil_razorwire_mid_static", (1550, 2400, 610), (0, 25, 0));
                spawnMapEditObject("model", "mil_razorwire_mid_static", (300, 4750, 600), (0, 25, 0));
            }

            deleteDestructables();
        break;
        case "mp_qadeem":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("bank", (462.621, -758.4777, 366), (90, 91.05727, 0));
                spawnMapEditObject("model", "com_plasticcase_friendly", (462.621, -758.4777, 306), (90, 91.05727, 0));
                spawnMapEditObject("ammo", (-244.2983, -756.128, 351), (0, -178.366, 0));
                spawnMapEditObject("model", "com_plasticcase_friendly", (-244.2983, -756.128, 321), (0, -178.366, 180));
                spawnMapEditObject("killstreak", (-435.7623, -763.3392, 351), (0, -181.2828, 0));
                spawnMapEditObject("model", "com_plasticcase_enemy", (-435.7623, -763.3392, 321), (0, -181.2828, 180));
                spawnMapEditObject("gambler", (271.8647, -756.1998, 351), (0, -180.9422, 0));
                spawnMapEditObject("model", "com_plasticcase_friendly", (271.8647, -756.1998, 321), (0, -180.9422, 180));
                spawnMapEditObject("pap", (17.97299, -563.7167, 675.125), (0, 0.2277832, 0));
                spawnMapEditObject("power", (18.23023, -320.7452, 339.2812), (0, -179.6733, 0));
                spawnMapEditObject("perk1", (-622.7623, -177.4052, 366), (90, 307.5813, 0));
                spawnMapEditObject("model", "com_plasticcase_enemy", (-622.7623, -177.4052, 306), (90, 307.5813, 0));
                spawnMapEditObject("perk2", (380.8592, -234.7428, 366), (90, 358.6293, 0));
                spawnMapEditObject("model", "com_plasticcase_friendly", (380.8592, -234.7428, 306), (90, 358.6293, 0));
                spawnMapEditObject("perk3", (-134.9196, 413.7346, 250), (90, 284.2134, 0));
                spawnMapEditObject("perk4", (682.0398, 151.1292, 220.2379), (90, 126.1366, 0));
                spawnMapEditObject("perk5", (233.5339, 558.9306, 220.318), (90, 312.1901, 0));
                spawnMapEditObject("perk6", (324.8374, -161.125, 354.4938), (90, 228.4578, 0));
                spawnMapEditObject("perk7", (536.4105, -679.2433, 366), (90, 180.3926, 0));
                spawnMapEditObject("model", "com_plasticcase_friendly", (536.4105, -679.2433, 306), (90, 180.3926, 0));
                spawnMapEditObject("spawn", (232.1427, -453.8595, 320), (0, 136.0573, 0));
                spawnMapEditObject("spawn", (-206.6068, -451.6893, 320), (0, 37.83948, 0));
                spawnMapEditObject("spawn", (-205.2125, -196.8851, 320), (0, -38.31774, 0));
                spawnMapEditObject("spawn", (279.1585, -231.9201, 320), (0, -146.0607, 0));
                spawnMapEditObject("spawn", (662.8618, 327.4064, 176), (0, -162.1227, 0));
                spawnMapEditObject("spawn", (-510.6982, -230.12, 336), (0, -42.48705, 0));
                spawnMapEditObject("spawn", (-494.979, -670.3467, 336), (0, 39.99829, 0));
                spawnMapEditObject("spawn", (451.9468, -679.2459, 336), (0, 133.7886, 0));
                spawnMapEditObject("spawn", (19.70971, 252.2346, 220), (0, -87.6024, 0));
                spawnMapEditObject("zombiespawn", (-899.7885, -426.4615, 329.7912), (0, -97.58897, 0));
                spawnMapEditObject("zombiespawn", (900.4122, -460.0896, 336.125), (0, 87.68445, 0));
                spawnMapEditObject("zombiespawn", (-348.5742, 382.2248, 220), (0, -93.5515, 0));
                spawnMapEditObject("zombiespawn", (905.2562, 223.4424, 152), (0, 90.88147, 0));
                spawnMapEditObject("zombiespawn", (892.1548, 563.9097, 152), (0, -89.06908, 0));
                spawnMapEditObject("randombox", (488.5381, 577.0244, 207.125), (0, 1.255005, 0), (20.45709, -526.7258, 335), (0, -179.4316, 0), (15.99958, -772.3082, 351), (0, -178.5472, 0), (66.3613, 416.4524, 235), (0, -1.359741, 0));
                spawnMapEditObject("invisiblewall", (879.2288, -211.125, 336.125), (879.2515, -264.375, 400));
                spawnMapEditObject("invisiblewall", (-666.1907, -481.5965, 336.125), (-667.8849, -563.8752, 400));
                spawnMapEditObject("invisiblewall", (-296.1947, 301.6448, 220.125), (-295.0303, 154.7956, 300));
                spawnMapEditObject("invisiblewall", (779.9741, 315.125, 170.2851), (779.9542, 364.875, 250));
                spawnMapEditObject("invisiblewall", (781.2536, 492.875, 169.8586), (781.3043, 443.1251, 250));
                spawnMapEditObject("timedTeleporter", (688.6152, -237.11, 336.125), (0, 0, 0), (13.28386, -725.8523, 660.125), (0, 89.31592, 0), (-344.1276, -567.7377, 344.0316), (0, -90, 90), 45);
                spawnMapEditObject("invisiblewall", (315.4934, -159.125, 656.125), (315.758, -527.8749, 785));
                spawnMapEditObject("invisiblewall", (315.758, -527.8749, 654.125), (-283.7357, -527.8749, 785));
                spawnMapEditObject("invisiblewall", (-283.7357, -527.8749, 654.125), (-283.734, -157.1251, 785));
                spawnMapEditObject("model", "qad_fence_glass", (865.9336, -209.6251, 336.0256), (0, -179.1295, 0));
                spawnMapEditObject("model", "qad_fence_glass", (865.9336, -209.6251, 335.0256), (0, 0, 180));
                spawnMapEditObject("model", "qad_fence_glass", (-655.7634, -559.819, 336.0669), (0, 0, 0));
                spawnMapEditObject("model", "qad_fence_glass", (-665.7634, -559.819, 335.0669), (0, 180, 180));
                spawnMapEditObject("model", "qad_fence_glass", (772.5729, 371.8576, 158.9275), (0, 179.7828, 0));
                spawnMapEditObject("model", "qad_fence_glass", (771.7703, 501.0402, 158.9532), (0, -179.1405, 0));
                spawnMapEditObject("model", "qad_bench_01", (-304.4544, 244.5869, 235.125), (0, 88.53011, 0));
                spawnMapEditObject("model", "qad_chair_ornate_1", (-306.7388, 170.1556, 220.1365), (0, 2.864513, 0));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Paradise");
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("gambler", (7161.515, 4922.729, 40.46408), (0, -55.14136, 0));
                spawnMapEditObject("bank", (8125.544, 3654.612, 155.0269), (90, -210.7957, 0));
                spawnMapEditObject("ammo", (6924.138, 4724.668, 37.60743), (0, -231.9443, 0));
                spawnMapEditObject("killstreak", (7568.869, 3850.878, 33.93491), (0, -236.3279, 0));
                spawnMapEditObject("pap", (6356.444, 5727.076, 272.9946), (0, -148.5361, 0));
                spawnMapEditObject("perk1", (7808.335, 4066.774, 44.89766), (90, -149.1019, 0));
                spawnMapEditObject("perk7", (6166.243, 6045.4, 287.8463), (90, 298.5305, 0));
                spawnMapEditObject("spawn", (7836.702, 3950.832, 34.49078), (0, 148.6715, 0));
                spawnMapEditObject("spawn", (7750.307, 3894.11, 33.24274), (0, 124.963, 0));
                spawnMapEditObject("spawn", (7657.316, 3837.344, 31.26113), (0, 101.26, 0));
                spawnMapEditObject("spawn", (6841.733, 4913.195, 60.57328), (0, -38.93103, 0));
                spawnMapEditObject("spawn", (6959.791, 4942.573, 51.44141), (0, -66.68799, 0));
                spawnMapEditObject("spawn", (7049.148, 4990.246, 48.51333), (0, -81.56348, 0));
                spawnMapEditObject("zombiespawn", (6685.515, 5435.694, 195.1896), (0, -54.625, 0));
                spawnMapEditObject("zombiespawn", (6540.042, 5298.784, 188.1482), (0, -47.77502, 0));
                spawnMapEditObject("zombiespawn", (8069.381, 3294.649, 199.8059), (0, 123.2546, 0));
                spawnMapEditObject("zombiespawn", (8227.006, 3445.771, 191.4598), (0, 127.9019, 0));
                spawnMapEditObject("invisiblewall", (6618.623, 5095.505, 127.2089), (6910.695, 5298.212, 222.9634));
                spawnMapEditObject("invisiblewall", (7868.382, 3438.563, 129.8992), (8151.591, 3657.376, 212.7436));
                spawnMapEditObject("timedTeleporter", (7340.074, 4425.503, -29.77897), (0, 125.6716, 0), (6244.593, 5899.922, 258.0372), (0, 301.8676, 0), (7870.315, 3461.53, 142.3307), (90, 124.3133, 0), 45);
                spawnMapEditObject("invisiblewall", (6249.921, 5641.881, 254.0963), (6440.425, 5772.411, 359.5301));
                spawnMapEditObject("invisiblewall", (6432.559, 5785.704, 257.9924), (6257.28, 6111.559, 373.0638));
                spawnMapEditObject("invisiblewall", (6247.518, 5655.788, 257.996), (6057.113, 6006.204, 370.6204));
                spawnMapEditObject("invisiblewall", (6240.095, 6116.764, 257.8374), (6070.93, 6025.954, 361.0478));
                spawnMapEditObject("model", "vehicle_luxurysedan_2008_destroy", (6144.344, 6084.497, 257.8283), (0, 27.60375, 0));
                spawnMapEditObject("fallLimit", -204);
                spawnMapEditObject("mapname", "Alternate Reality of Hell");
                spawnMapEditObject("hellMap", true);
                spawnMapEditObject("maxWave", 20);
                spawnMapEditObject("randombox", (7438.802, 4258.541, -12.48232), (0, 220.6268, 0), (7923.871, 3621.406, 115.6965), (0, 214.7973, 0), (6820.389, 5113.347, 114.695), (0, 38.10302, 0));
            }
        break;
        case "mp_radar":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("invisiblewall", (-1752.875, 4441.888, 1166.675), (-1759.87, 4545.896, 1222.646));
                spawnMapEditObject("randombox", (-2522.375, 4371.221, 1181.725), (0, 89.72828, 0), (-1795.125, 4134.005, 1181.725), (0, -93.16113, 0), (-2065.495, 4764.874, 1181.725), (0, -1.903191, 0));
                spawnMapEditObject("gambler", (-1990.478, 3980.126, 1181.725), (0, 177.3772, 0));
                spawnMapEditObject("bank", (-2524.875, 3985.735, 1191.725), (90, -0.1014328, 0));
                spawnMapEditObject("ammo", (-1791.125, 4647.464, 1181.725), (0, -90.64526, 0));
                spawnMapEditObject("killstreak", (-2313.694, 3980.125, 1181.725), (0, 178.0858, 0));
                spawnMapEditObject("pap", (-2524.802, 4684.531, 1181.725), (0, 87.91004, 0));
                spawnMapEditObject("perk1", (-1791.127, 4349.483, 1196.725), (90, -179.7554, 0));
                spawnMapEditObject("perk7", (-2350.597, 4752.875, 1196.725), (90, -90.29919, 0));
                spawnMapEditObject("spawn", (-2272.747, 4351.836, 1166.725), (1.572247, 0.2775955, 0));
                spawnMapEditObject("zombiespawn", (-1650.528, 4408.439, 1173.134), (0, 150.6639, 0));
                spawnMapEditObject("zombiespawn", (-1674.162, 4556.764, 1168.796), (0, -152.7015, 0));
                spawnMapEditObject("model", "com_constructionrailingmedium", (-1771.253, 4492.875, 1165.741), (0, 90, 0));
                spawnMapEditObject("hellMap", true);
                spawnMapEditObject("maxWave", 20);
                spawnMapEditObject("mapname", "Storage Unit Of Hell");
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("gambler", (-7576.942, 4619.18, 1367.125), (0, 0.1253128, 0));
                spawnMapEditObject("bank", (-7663.947, 4022.031, 1388.624), (90, -90.78655, 0));
                spawnMapEditObject("ammo", (-6860.561, 4095.114, 1337.228), (0, -133.7376, 0));
                spawnMapEditObject("killstreak", (-7458.708, 3543.182, 1375.125), (0, 88.96075, 0));
                spawnMapEditObject("pap", (-8142.371, 4427.471, 1365.125), (0, -269.0672, 0));
                spawnMapEditObject("power", (-6916.143, 2897.071, 1410.125), (0, -176.5788, 0));
                spawnMapEditObject("perk1", (-7009.888, 3827.812, 1347.33), (90, -267.9741, 0));
                spawnMapEditObject("perk2", (-6800.786, 3077.601, 1370.199), (90, -181.7094, 0));
                spawnMapEditObject("perk3", (-7444.084, 3189.19, 1336.468), (90, -133.3641, 0));
                spawnMapEditObject("perk4", (-5995.955, 4226.097, 1342.966), (90, -180.0999, 0));
                spawnMapEditObject("perk5", (-7162.517, 3612.976, 1390.125), (90, -88.56731, 0));
                spawnMapEditObject("perk6", (-7080.771, 2354.564, 1338.125), (90, -270.7591, 0));
                spawnMapEditObject("perk7", (-5994.478, 3152.514, 1364.677), (90, -272.5828, 0));
                spawnMapEditObject("spawn", (-7301.829, 4762.434, 1312.125), (0, -59.60186, 0));
                spawnMapEditObject("spawn", (-7078.964, 4722.835, 1307.207), (0, -102.7507, 0));
                spawnMapEditObject("spawn", (-6905.769, 4605.695, 1309.642), (0, -141.027, 0));
                spawnMapEditObject("spawn", (-6645.187, 4394.467, 1330.874), (0, 170.298, 0));
                spawnMapEditObject("spawn", (-6847.846, 4228.233, 1327.699), (0, 135.0759, 0));
                spawnMapEditObject("spawn", (-6977.655, 4157.766, 1323.014), (0, 88.07087, 0));
                spawnMapEditObject("spawn", (-7126.47, 4048.59, 1352.124), (0, 79.81464, 0));
                spawnMapEditObject("spawn", (-7440.939, 4040.782, 1352.126), (0, 46.04267, 0));
                spawnMapEditObject("spawn", (-7352.033, 4462.705, 1421.231), (0, -4.642754, 0));
                spawnMapEditObject("zombiespawn", (-5784.085, 4213.448, 1311.645), (0, 90.8559, 0));
                //spawnMapEditObject("zombiespawn", (-5805.755, 3739.102, 1333.125), (0, -81.81072, 0));
                //spawnMapEditObject("zombiespawn", (-6497.952, 3035.394, 1332.543), (0, -89.02874, 0));
                spawnMapEditObject("wall", (-6761.965, 2560.717, 1307.058), (-6926.291, 2558.469, 1400.114));
                spawnMapEditObject("wall", (-7181.404, 2326.165, 1308.125), (-7120.344, 2324.197, 1389.191));
                spawnMapEditObject("wall", (-6157.391, 3108.797, 1332.887), (-6459.376, 3110.203, 1468.542));
                spawnMapEditObject("invisiblewall", (-5851.571, 3620.111, 1333.127), (-5850.465, 3522.723, 1432.482));
                spawnMapEditObject("invisiblewall", (-6970.226, 3669.532, 1317.165), (-6811.801, 3661.234, 1447.16));
                spawnMapEditObject("invisiblewall", (-6921.569, 3565.655, 1321.376), (-7025.593, 3564.671, 1421.336));
                spawnMapEditObject("invisiblewall", (-6523.955, 2975.43, 1327.485), (-6441.456, 2881.303, 1433.95));
                spawnMapEditObject("timedTeleporter", (-7268.695, 2930.876, 1283.837), (0, -179.199, 0), (-7575.581, 4741.639, 1352.125), (0, -179.199, 0), (-6496.875, 3647.604, 1318.509), (90, 2.222157, 0), 45);
                spawnMapEditObject("doorandspawn", (-6784.125, 3716.725, 1161.997), (-6775.665, 3735.75, 1335.124), (90, 180, 0), 4, 2, 100, 3000, (-5805.755, 3739.102, 1333.125), (0, -81.81072, 0));
                spawnMapEditObject("door", (-7444.394, 4065.407, 1195.752), (-7441.735, 3943.645, 1360.125), (90, 270, 0), 12, 2, 150, 4000);
                spawnMapEditObject("doorandspawn", (-7107.324, 3327.393, 1224.061), (-7110.534, 3351.011, 1360.125), (90, 90, 0), 2, 2, 100, 2500, (-6497.952, 3035.394, 1332.543), (0, -89.02874, 0));
                spawnMapEditObject("model", "cs_handrail_128_double_yel", (-6973.111, 3551.125, 1322.271), (0, 91.51476, 0));
                spawnMapEditObject("model", "cs_handrail_128_double_yel", (-6486.535, 2912.938, 1329.341), (0, 217.5243, 0));
                spawnMapEditObject("mapname", "Snowy Outpost");
                spawnMapEditObject("model", "cs_handrail_256_double_yel", (-6907.132, 3678.382, 1315.268), (0, 87.5432, 0));
                spawnMapEditObject("model", "cs_handrail_256_double_yel", (-5905.013, 4378.801, 1312.061), (0, 210.4902, 0));
                spawnMapEditObject("randombox", (-7285.665, 4459.875, 1330.055), (0, 88.42242, 0), (-6294.619, 4193.668, 1337.333), (0, -180.869, 0), (-7013.699, 2701.22, 1323.125), (0, 0.8998489, 0), (-6277.653, 3775.837, 1348), (0, -90.47894, 0), (-7534.074, 2722.116, 1310.384), (0, -182.8795, 0));
                spawnMapEditObject("invisiblewall", (-5845.579, 4277.125, 1311.58), (-5924.851, 4453.185, 1400.376));
                spawnMapEditObject("model", "cs_handrail_128_double_yel", (-5855, 3568, 1334), (0, 0, 0));
            }
        break;
        case "mp_restrepo_ss":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("bank", (652.8141, -120.3581, 1820.385), (90, 0, 0));
                spawnMapEditObject("ammo", (578.8276, 475.648, 1744.908), (0, -89.20898, 0));
                spawnMapEditObject("killstreak", (847.8735, 117.8238, 1812.625), (0, -91.96655, 0));
                spawnMapEditObject("gambler", (644.3668, 729.4017, 1731.543), (0, -90.98328, 0));
                spawnMapEditObject("pap", (355.0262, 551.1464, 1834.232), (0, 89.25842, 0));
                spawnMapEditObject("perk1", (359.468, 567.2054, 1733.693), (90, 312.4017, 0));
                spawnMapEditObject("perk7", (560.6769, 628.9637, 1851.237), (90, 267.6379, 0));
                spawnMapEditObject("spawn", (433.7214, 396.2207, 1716.431), (0, -55.9314, 0));
                spawnMapEditObject("spawn", (531.4678, 217.5894, 1750.143), (0, 123.1952, 0));
                spawnMapEditObject("spawn", (752.1495, 23.07026, 1767.125), (0, 123.2611, 0));
                spawnMapEditObject("spawn", (550.6157, 650.2342, 1712.554), (0, -102.5354, 0));
                spawnMapEditObject("zombiespawn", (415.4347, 883.4052, 1644.115), (0, -53.96484, 0));
                spawnMapEditObject("zombiespawn", (656.8702, -415.7744, 1799.717), (0, 94.39453, 0));
                spawnMapEditObject("zombiespawn", (52.5273, 392.1247, 1673.205), (0, -93.43323, 0));
                spawnMapEditObject("randombox", (844.7192, -6.878259, 1782.125), (0, -89.41772, 0), (704.7935, 310.1394, 1753.365), (0, -2.752075, 0), (428.3604, 112.5977, 1751.642), (0, -249.906, 0));
                spawnMapEditObject("invisiblewall", (564.4161, -181.3771, 1769.131), (476.4911, -179.4033, 1850));
                spawnMapEditObject("invisiblewall", (262.4726, 333.4808, 1718.862), (469.187, -61.71604, 1900));
                spawnMapEditObject("invisiblewall", (555.3115, 849.1251, 1686.125), (445.7369, 653.1254, 1800));
                spawnMapEditObject("invisiblewall", (580.8751, 652.9329, 1854.124), (489.1254, 652.1968, 1950));
                spawnMapEditObject("invisiblewall", (879.125, 313.5963, 1728.232), (888.9589, 172.1415, 1850));
                spawnMapEditObject("invisiblewall", (763.5388, -161.0329, 1774.031), (875.5807, -176.125, 1850));
                spawnMapEditObject("invisiblewall", (318.1326, 517.1254, 1867.125), (318.2168, 578.8749, 1900));
                spawnMapEditObject("model", "berlin_sandbag_short_sec", (528.8791, 806.7131, 1685.532), (0, -43.64319, -15));
                spawnMapEditObject("model", "berlin_sandbag_short_sec", (510.22, 753.4557, 1695.582), (0, -45, -15));
                spawnMapEditObject("model", "berlin_sandbag_short_sec", (302.7644, 250.8166, 1714.301), (0, 30, 0));
                spawnMapEditObject("model", "berlin_sandbag_short_sec", (521.5558, -170.2256, 1765.991), (0, 90, 0));
                spawnMapEditObject("model", "berlin_sandbag_short_sec", (827.6362, -157.0864, 1774.131), (0, 90, 0));
                spawnMapEditObject("model", "berlin_sandbag_short_sec", (873.6835, 209.8183, 1758.405), (0, 0, -15));
                spawnMapEditObject("model", "berlin_sandbag_short_sec", (864.367, 257.4911, 1736.357), (0, 0, -5));
                spawnMapEditObject("hellMap", true);
                spawnMapEditObject("maxWave", 20);
                spawnMapEditObject("mapname", "Rest Site Of Hell");
                spawnMapEditObject("invisiblewall", (642.875, 771.4324, 1742.758), (631.4435, 664.1849, 1800.125));
                spawnMapEditObject("invisiblewall", (288.3066, 467.6151, 1836.872), (297.7094, 356.085, 1951.034));
            }
        break;
        case "mp_roughneck":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("bank", (-134.8719, 599.1447, 22.125), (90, 187.1424, 0));
                spawnMapEditObject("ammo", (-1152.577, 276.1181, 7.125004), (0, -225.6525, 0));
                spawnMapEditObject("killstreak", (-437.8687, 1112.959, 7.124825), (0, -47.91563, 0));
                spawnMapEditObject("gambler", (-917.031, 176.9995, 7.125085), (0, 44.15527, 0));
                spawnMapEditObject("pap", (-901.2347, 803.4437, 1140.125), (0, -134.2572, 0));
                spawnMapEditObject("power", (-1274.073, 1176.097, 7), (0, 43.93557, 0));
                spawnMapEditObject("perk1", (-607.7001, 1299.85, 22.125), (90, 222.8424, 0));
                spawnMapEditObject("perk2", (-253.8224, 750.8958, 22.1258), (90, 314.798, 0));
                spawnMapEditObject("perk3", (-659.8705, -42.81953, 22.125), (90, 132.2217, 0));
                spawnMapEditObject("perk4", (-1451.23, 587.1852, 22.125), (90, 339.7369, 0));
                spawnMapEditObject("perk5", (-1398.98, 951.3668, 22.12556), (90, 357.9028, 0));
                spawnMapEditObject("perk6", (-1003.401, 1347.902, 22.12539), (90, 267.4799, 0));
                spawnMapEditObject("perk7", (-655.4043, 823.8734, 22.125), (90, 135.6714, 0));
                spawnMapEditObject("spawn", (-654.0657, 204.1403, -7.873203), (0, 73.99414, 0));
                spawnMapEditObject("spawn", (-465.5692, 384.075, -7.876575), (0, 142.0435, 0));
                spawnMapEditObject("spawn", (-265.921, 609.7451, -7.87607), (0, -165.8264, 0));
                spawnMapEditObject("spawn", (-447.877, 936.158, -7.875002), (0, -155.0928, 0));
                spawnMapEditObject("spawn", (-606.5803, 1163.356, -7.875001), (0, -130.2417, 0));
                spawnMapEditObject("spawn", (-842.1666, 1230.935, -7.875042), (0, -107.1265, 0));
                spawnMapEditObject("spawn", (-1238.767, 1131.724, -9.000001), (0, -46.55883, 0));
                spawnMapEditObject("spawn", (-1330.955, 700.506, -5.999993), (0, 1.456933, 0));
                spawnMapEditObject("spawn", (-1269.342, 512.626, -7.874998), (0, 46.44595, 0));
                spawnMapEditObject("spawn", (-1021.72, 336.5076, -4.657376), (0, 75.62561, 0));
                spawnMapEditObject("zombiespawn", (-877.2484, -151.5746, -7.874809), (0, 50.86792, 0));
                spawnMapEditObject("zombiespawn", (-0.001937122, 870.4937, -7.875), (0, -135.0263, 0));
                spawnMapEditObject("zombiespawn", (-315.0927, 1157.334, -8.000004), (0, 135.9955, 0));
                spawnMapEditObject("zombiespawn", (-1393.376, 236.1274, 0.126432), (0, 137.7753, 0));
                spawnMapEditObject("elevator", (-1087.776, 980.0912, 6.000003), (0, -135.1855, 0), (-1087.776, 980.0912, 1128), (-1031.334, 923.9225, 1128.125));
                spawnMapEditObject("elevator", (-746.4603, 643.7189, 1134.125), (0, 41.05166, 0), (-746.4603, 643.7189, 6), (-683.4976, 579.8616, -7.875));
                spawnMapEditObject("randombox", (-744.552, 635.5443, 7.125001), (0, 46.00647, 0), (-751.9943, 953.5524, 7.125002), (0, -224.433, 0), (-1063.286, 645.7446, 7.125004), (0, -45.31736, 0));
                spawnMapEditObject("invisiblewall", (-788.5737, -155.6774, -7.874999), (-883.7911, -54.67268, 75));
                spawnMapEditObject("invisiblewall", (-1367.784, 407.0173, -7.875001), (-1434.886, 476.7846, 50));
                spawnMapEditObject("invisiblewall", (-1365.342, 1130.164, -7.875), (-1240.088, 1250.629, 125));
                spawnMapEditObject("invisiblewall", (-480.9507, 1213.776, -7.875002), (-545.0952, 1279.267, 50));
                spawnMapEditObject("invisiblewall", (-103.8215, 865.655, -7.874999), (29.08015, 787.9161, 75));
                spawnMapEditObject("invisiblewall", (-413.9648, 238.1835, -7.874999), (-339.2302, 303.765, 50));
                spawnMapEditObject("model", "rnk_handrail_128_double_blue", (-1400.929, 437.4952, -5), (0, 45.09768, 0));
                spawnMapEditObject("model", "rnk_handrail_128_double_blue", (-511.6332, 1254.247, -5), (0, 45, 0));
                spawnMapEditObject("model", "rnk_engine_machine", (-372.153, 265.3416, -5), (0, 45.84161, 0));
                spawnMapEditObject("model", "rnk_engine_machine", (-51.5933, 861.6233, -25), (0, 150.9462, 0));
                spawnMapEditObject("model", "rnk_engine_machine", (-837.1577, -110.253, -25), (0, 136.0394, 0));
                spawnMapEditObject("model", "rnk_handrail_128_double_blue", (-1324.619, 1148.169, -7), (0, -46.30616, 0));
                spawnMapEditObject("model", "rnk_handrail_128_double_blue", (-1255.679, 1217.32, -7), (0, -46.6687, 0));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Oil Rig");
            }
        break;
        case "mp_seatown":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("invisiblewall", (-2216, -1222.622, 288.125), (-2342.994, -1229.932, 374.409));
                spawnMapEditObject("invisiblewall", (-1771.214, -1277.87, 316.125), (-1553.117, -1278.51, 438.5247));
                spawnMapEditObject("invisiblewall", (-1553.117, -1278.51, 316.125), (-1547.272, -1452.332, 444.9538));
                spawnMapEditObject("invisiblewall", (-1951.859, -1277.857, 307.737), (-1870.133, -1277.76, 378.1872));
                spawnMapEditObject("invisiblewall", (-1598.519, -1270.875, 158.2988), (-1854.862, -1273.871, 252.301));
                spawnMapEditObject("invisiblewall", (-2262.329, -1014.875, 152.125), (-2076.491, -1021.874, 265.4356));
                spawnMapEditObject("invisiblewall", (-1529.732, -1856.875, 152.125), (-1529.955, -1779.392, 239.6721));
                spawnMapEditObject("model", "me_iron_gate", (-2278.382, -1244.603, 291.1436), (0, 90, 0));
                spawnMapEditObject("model", "me_iron_gate", (-1530.448, -1818.054, 160.1321), (0, 179.6668, 0));
                spawnMapEditObject("model", "me_iron_gate", (-1789.587, -1290.635, 155.1134), (0, -89.42686, 0));
                spawnMapEditObject("model", "me_iron_gate", (-2220.288, -1034.765, 155.1358), (0, -91.23412, 0));
                spawnMapEditObject("randombox", (-1569.417, -1815.707, 167.125), (0, -92.16246, 0), (-1581.854, -1354.391, 303.125), (0, -92.89854, 0));
                spawnMapEditObject("gambler", (-2449.875, -1576.831, 303.125), (0, 88.43628, 0));
                spawnMapEditObject("bank", (-2434.875, -1053.145, 182.125), (90, -90.377183, 0));
                spawnMapEditObject("ammo", (-2160.875, -1778.26, 252.1923), (0, 87.15637, 0));
                spawnMapEditObject("killstreak", (-1986.125, -1494.747, 303.125), (0, -86.71324, 0));
                spawnMapEditObject("pap", (-2440.875, -1820.96, 323.5), (0, 90.00183, 0));
                spawnMapEditObject("perk1", (-2204.779, -1624.874, 182.125), (90, 89.04053, 0));
                spawnMapEditObject("perk7", (-1579.133, -1309.125, 182.125), (90, -137.3712, 0));
                spawnMapEditObject("spawn", (-1809.66, -1510.439, 152.125), (4.09668, 168.4662, 0));
                spawnMapEditObject("spawn", (-2257.886, -1440.101, 152.125), (2.289429, -11.17125, 0));
                spawnMapEditObject("spawn", (-2220.18, -1558.04, 288.125), (1.932373, 49.42383, 0));
                spawnMapEditObject("zombiespawn", (-2285.243, -1139.341, 291.1174), (0, -89.8828, 0));
                spawnMapEditObject("zombiespawn", (-1794.409, -1223.365, 152.125), (0, -90.53099, 0));
                spawnMapEditObject("zombiespawn", (-2217.97, -985.0507, 152.125), (0, -91.2506, 0));
                spawnMapEditObject("hellMap", true);
                spawnMapEditObject("maxWave", 20);
                spawnMapEditObject("mapname", "Seaside Hotel Of Hell");
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("bank", (-2785.636, -2596.663, 222.125), (90, 0.7141113, 0));
                spawnMapEditObject("ammo", (-2066.355, -1993.217, 207.125), (0, -90.45593, 0));
                spawnMapEditObject("killstreak", (-2587.44, -3060.558, 207.125), (0, -0.9448242, 0));
                spawnMapEditObject("pap", (-2066.291, -2715.041, 463.125), (0, -90.20325, 0));
                spawnMapEditObject("power", (-2817.256, -3379.883, 305.7389), (0, -178.797, 45));
                spawnMapEditObject("perk1", (-2222.092, -2335.883, 222.125), (90, 0.1922607, 0));
                spawnMapEditObject("perk2", (-2236.892, -3102.509, 222.125), (90, 358.0994, 0));
                spawnMapEditObject("perk3", (-2761.472, -2880.008, 222.125), (90, 179.7363, 0));
                spawnMapEditObject("perk4", (-2309.649, -2597.266, 222.125), (90, 179.3134, 0));
                spawnMapEditObject("perk5", (-2319.375, -3383.544, 222.125), (90, 132.5006, 0));
                spawnMapEditObject("perk6", (-2734.877, -3387.077, 222.125), (90, 39.96826, 0));
                spawnMapEditObject("perk7", (-2439.427, -1939.948, 222.125), (90, 312.616, 0));
                spawnMapEditObject("spawn", (-2495.368, -2393.233, 192.125), (0, -113.7799, 0));
                spawnMapEditObject("spawn", (-2319.272, -2731.878, 192.125), (0, -149.425, 0));
                spawnMapEditObject("spawn", (-2299.719, -2996.445, 192.125), (0, 157.1924, 0));
                spawnMapEditObject("spawn", (-2398.964, -3193.673, 192.1237), (0, 119.4873, 0));
                spawnMapEditObject("spawn", (-2601.236, -3258.146, 192.1242), (0, 87.92908, 0));
                spawnMapEditObject("spawn", (-2769.513, -3140.764, 192.1249), (0, 48.21899, 0));
                spawnMapEditObject("zombiespawn", (-2821.23, -3522.727, 384.125), (0, 88.5553, 0));
                spawnMapEditObject("zombiespawn", (-2650.165, -3460.198, 192.1247), (0, 95.32837, 0));
                spawnMapEditObject("zombiespawn", (-2449.981, -3443.167, 192.1249), (0, 88.54431, 0));
                spawnMapEditObject("zombiespawn", (-2155.132, -3458.237, 192.1247), (0, 89.00574, 0));
                spawnMapEditObject("gambler", (-2513.522, -2140.304, 207.125), (0, 62.41882, 0));
                spawnMapEditObject("randombox", (-2467.823, -2753.045, 207.125), (0, -226.236, 0), (-2065.499, -2842.005, 207.125), (0, -90.8844, 0), (-2697.698, -2347.682, 207.125), (0, 34.93103, 0));
                spawnMapEditObject("timedTeleporter", (-2590.289, -2877.917, 208.125), (0, 0, 0), (-2155.923, -2158.887, 448.125), (0, -91.07666, 0), (-2272.421, -2043.875, 192.125), (90, 90, 0), 40);
                spawnMapEditObject("invisiblewall", (-2302.977, -3407.128, 192.125), (-2750.104, -3407.093, 386.769));
                spawnMapEditObject("invisiblewall", (-2238.72, -3400.125, 200.1265), (-2050.93, -3401.131, 352.1965));
                spawnMapEditObject("invisiblefloor", (-2875.64, -3515.99, 350.1262), (-2700.747, -3360.204, 350.1262));
                spawnMapEditObject("mapname", "The Wishing Well");
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("model", "com_pallet_stack", (-2675, -3430, 190), (0, 0, 0));
                spawnMapEditObject("model", "com_pallet_stack", (-2600, -3430, 190), (0, 90, 0));
                spawnMapEditObject("model", "com_pallet_stack", (-2525, -3430, 182), (0, 180, 0));
                spawnMapEditObject("model", "com_pallet_stack", (-2450, -3430, 190), (0, 180, 0));
                spawnMapEditObject("model", "com_pallet_stack", (-2375, -3430, 182), (0, 270, 0));
                spawnMapEditObject("model", "com_pallet_stack", (-2190, -3430, 173), (0, 0, 0));
                spawnMapEditObject("model", "com_pallet_stack", (-2100, -3430, 173), (0, 0, 0));
            }
        break;
        case "mp_shipbreaker":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("bank", (1750.604, -2789.67, 698.3676), (90, 212.2358, 0));
                spawnMapEditObject("ammo", (1641.42, -1952.806, 675.9537), (0, -19.24615, 0));
                spawnMapEditObject("killstreak", (2421.703, -1962.067, 645.3391), (0, -161.4972, 0));
                spawnMapEditObject("gambler", (2005.551, -2581.261, 687.3747), (0, -212.4957, 0));
                spawnMapEditObject("pap", (2432.059, -1418.702, 639), (0, 11.96052, 0));
                spawnMapEditObject("power", (1702.73, -2714.709, 702.1594), (0, -32.633, 0));
                spawnMapEditObject("perk1", (1851.015, -2581.368, 707.0109), (90, 63.7006, 0));
                spawnMapEditObject("perk2", (1274.829, -2204.881, 757.8642), (90, 349.856, 0));
                spawnMapEditObject("perk3", (1822.603, -1753.449, 694.3688), (90, 287.5635, 0));
                spawnMapEditObject("perk4", (1337.769, -2577.037, 702.8469), (90, 230.7862, 0));
                spawnMapEditObject("perk5", (1522.21, -3167.592, 696.7027), (90, 103.6359, 0));
                spawnMapEditObject("perk6", (2569.845, -1768.638, 659.2782), (90, 194.7785, 0));
                spawnMapEditObject("perk7", (1148.902, -3092.705, 690.1047), (90, 60.69584, 0));
                spawnMapEditObject("spawn", (1453.316, -2973.489, 657.2158), (0, 68.59503, 0));
                spawnMapEditObject("spawn", (2241.77, -2483.65, 641.7693), (0, 135.4084, 0));
                spawnMapEditObject("spawn", (2456.074, -1840.13, 625.0712), (0, -170.7916, 0));
                spawnMapEditObject("spawn", (2084.38, -1679.628, 644.4178), (0, -81.19808, 0));
                spawnMapEditObject("spawn", (1607.058, -2020.524, 660.625), (0, -24.55258, 0));
                spawnMapEditObject("spawn", (1519.491, -2273.9, 674.4624), (0, -10.52853, 0));
                spawnMapEditObject("zombiespawn", (967.8665, -2910.397, 635.5739), (0, -22.53109, 0));
                spawnMapEditObject("zombiespawn", (1216.046, -2313.709, 735.625), (0, 6.522274, 0));
                spawnMapEditObject("zombiespawn", (1898.141, -1509.508, 644.6949), (0, -47.85458, 0));
                spawnMapEditObject("randombox", (1897.504, -2278.33, 699.5115), (0, -55.28681, 0), (2084.136, -2147.889, 681.0731), (0, -228.4753, 0), (2422.721, -2482.944, 640.3529), (0, -124.3524, 0));
                spawnMapEditObject("invisiblewall", (2024.032, -1553.366, 648.4108), (1835.217, -1661.892, 750));
                spawnMapEditObject("invisiblewall", (2103.626, -1537.848, 647.4376), (2256.398, -1640.708, 750));
                spawnMapEditObject("invisiblewall", (2298.982, -1657.354, 750), (2395.399, -1641.267, 682.1918));
                spawnMapEditObject("invisiblewall", (2387.784, -1376.708, 627.7224), (2440.731, -1364.737, 700));
                spawnMapEditObject("invisiblewall", (1251.836, -2232.894, 775), (1455.156, -2352.278, 684.1378));
                spawnMapEditObject("invisiblewall", (1318.118, -2686.248, 661.3442), (1098.043, -3062.735, 850));
                spawnMapEditObject("invisiblewall", (1313.55, -2695.718, 668.3589), (1257.856, -2658.023, 775));
                spawnMapEditObject("model", "sb_stack_sheets_01", (1961.883, -1547.306, 646.5278), (0, 114, 0));
                spawnMapEditObject("model", "sb_stack_sheets_01", (1874.686, -1585.397, 656.4622), (0, -56, 0));
                spawnMapEditObject("model", "sb_stack_sheets_01", (2127.497, -1556.452, 642.722), (0, -128.0713, 0));
                spawnMapEditObject("model", "sb_stack_sheets_01", (2200.84, -1599.231, 639.5295), (0, -131.6858, 0));
                spawnMapEditObject("model", "sb_stack_sheets_01", (2378.945, -1639.097, 683.618), (37.02271, -78.65475, 0));
                spawnMapEditObject("model", "sb_stack_sheets_01", (1273.762, -2703.442, 692.1364), (35.22095, 56.25186, 0));
                spawnMapEditObject("model", "sb_stack_sheets_01", (1100.439, -3007.852, 654.789), (0, -27.07394, 0));
                spawnMapEditObject("model", "sb_stack_sheets_01", (1152.912, -2947.651, 656.2252), (0, -31.0455, 0));
                spawnMapEditObject("model", "sb_stack_sheets_01", (1317.574, -2283.757, 726.619), (14.65454, 48.62733, 10));
                spawnMapEditObject("model", "sb_stack_sheets_01", (1395.992, -2320.912, 708.6342), (14.06799, 64.8981, 10));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Shantytown");
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("gambler", (3216.175, -3349.084, 714.5751), (0, -129.0895, 0));
                spawnMapEditObject("bank", (3234.286, -2693.172, 690.3496), (90, -204.6864, 0));
                spawnMapEditObject("ammo", (2902.541, -2985.438, 684.8058), (0, -220.4737, 0));
                spawnMapEditObject("killstreak", (2454.917, -2752.27, 665.7431), (0, -210.7014, 0));
                spawnMapEditObject("pap", (3670.893, -2926.031, 700.328), (0, -35.73314, 0));
                spawnMapEditObject("power", (3042.941, -3194.687, 703.4149), (0, 44.50002, 0));
                spawnMapEditObject("perk1", (2489.328, -2941.524, 692.6273), (90, -40.70995, 0));
                spawnMapEditObject("perk2", (2780.202, -2524.761, 662.959), (90, -171.1726, 0));
                spawnMapEditObject("perk3", (3080.354, -2870.922, 687.8855), (90, -132.1382, 0));
                spawnMapEditObject("perk4", (3417.499, -3351.448, 742.4857), (90, -312.4019, 0));
                spawnMapEditObject("perk5", (3890.622, -3236.566, 765.0161), (90, -241.3313, 0));
                spawnMapEditObject("perk6", (3438.285, -2792.927, 701.7717), (90, -64.41295, 0));
                spawnMapEditObject("perk7", (2702.067, -3050.915, 698.5252), (90, -222.3414, 0));
                spawnMapEditObject("spawn", (2507.479, -2677.344, 644.3185), (0, -25.88939, 0));
                spawnMapEditObject("spawn", (2600.875, -2484.002, 685.2238), (0, -41.03954, 0));
                spawnMapEditObject("spawn", (3831.021, -3141.091, 716.4711), (0, -174.6223, 0));
                spawnMapEditObject("spawn", (3698.671, -3222.485, 718.4813), (0, 140.6084, 0));
                spawnMapEditObject("spawn", (3573.965, -3321.115, 706.0195), (0, 125.8593, 0));
                spawnMapEditObject("spawn", (3593.609, -3061.083, 701.5196), (0, -142.7674, 0));
                spawnMapEditObject("spawn", (3496.002, -2970.365, 685.7209), (0, -143.3992, 0));
                spawnMapEditObject("spawn", (3070.334, -2703.001, 653.7233), (0, -107.4025, 0));
                spawnMapEditObject("zombiespawn", (3638.261, -3546.531, 725.4744), (0, 115.5156, 0));
                spawnMapEditObject("zombiespawn", (3753.959, -3472.46, 717.6271), (0, 123.0962, 0));
                spawnMapEditObject("invisiblewall", (3524.995, -3453.192, 721.9002), (3762.811, -3329.764, 843.5553));
                spawnMapEditObject("invisiblewall", (3782.235, -3319.781, 728.8013), (3933.336, -3238.952, 868.9794));
                spawnMapEditObject("invisiblewall", (3942.603, -3229.6, 730.0871), (3991.435, -3171.889, 840.2659));
                spawnMapEditObject("invisiblewall", (3993.672, -3138.22, 710.2444), (3449.422, -2755.436, 863.7747));
                spawnMapEditObject("invisiblewall", (3443.473, -2754.783, 670.0117), (3542.359, -2818.208, 706.754));
                spawnMapEditObject("invisiblewall", (3335.33, -2981.09, 684.6421), (3415.132, -2798.246, 841.4595));
                spawnMapEditObject("invisiblewall", (3307.744, -2981.086, 681.3773), (3277.859, -2963.674, 835.6435));
                spawnMapEditObject("invisiblewall", (3342.413, -2723.095, 665.415), (3281.769, -2943.696, 838.0759));
                spawnMapEditObject("invisiblewall", (3335.124, -2674.876, 659.7313), (2994.758, -2561.568, 833.998));
                spawnMapEditObject("invisiblewall", (2996.054, -2583.148, 645.4725), (2943.867, -2643.322, 816.7378));
                spawnMapEditObject("invisiblewall", (2926.662, -2640.64, 645.7792), (2801.153, -2533.847, 766.8201));
                spawnMapEditObject("invisiblewall", (2484.428, -2558.861, 629.5233), (2622.223, -2673.862, 790.5562));
                spawnMapEditObject("invisiblewall", (2502.843, -2522.314, 626.437), (2681.717, -2642.664, 786.1047));
                spawnMapEditObject("invisiblewall", (2635.977, -2678.072, 637.5414), (2674.512, -2649.499, 770.0406));
                spawnMapEditObject("invisiblewall", (2564.47, -2797.23, 654.8344), (2501.035, -2753.96, 778.2084));
                spawnMapEditObject("invisiblewall", (2412.191, -2764.549, 659.0438), (2461.479, -2791.537, 764.9935));
                spawnMapEditObject("invisiblewall", (2488.154, -2773.802, 652.6487), (2464.555, -2836.04, 750.6246));
                spawnMapEditObject("invisiblewall", (3023.977, -3086.912, 681.8582), (3087.047, -3097.606, 785.987));
                spawnMapEditObject("invisiblecrate", (2867.827, -2966.95, 681.7637), (0, 125.8094, 0));
                spawnMapEditObject("door", (2860.835, -3580.527, 1066.364), (3200.603, -3187.035, 700.5982), (90, 50.81202, 0), 6, 4, 100, 5000);
                spawnMapEditObject("door", (2367.171, -3300.109, 1091.197), (2696.867, -2866.88, 662.399), (90, 53.37999, 0), 6, 4, 100, 2500);
                spawnMapEditObject("invisiblewall", (2747.319, -2998.526, 666.4238), (2695.088, -2959.327, 816.8104));
                spawnMapEditObject("invisiblewall", (2712.578, -2941.154, 663.658), (2736.978, -2916.183, 805.6968));
                spawnMapEditObject("mapname", "Scrapped Port");
                spawnMapEditObject("hellMap", false);
                spawnMapEditObject("randombox", (3021.638, -3421.569, 703.4194), (0, -218.1007, 0), (2526.636, -3103.742, 720.6025), (0, -212.8382, 0), (3295.706, -2998.649, 694.4366), (0, -20.35777, 0), (2716.824, -2707.415, 715.9921), (0, 54.02516, 0));
                spawnMapEditObject("model", "slava_pier_railings_06_dest", (3725, -3343, 709), (0, 30, 0));
            }
            else if (level.mapVariation == 2)
            {
                spawnMapEditObject("gambler", (-627.4692, -360.0034, 855.8229), (0, -225.9001, 0));
                spawnMapEditObject("bank", (379.2403, -202.3826, 796.9551), (90, -178.9061, 0));
                spawnMapEditObject("ammo", (-319.5932, 52.51632, 811.6633), (0, -261.4518, 0));
                spawnMapEditObject("killstreak", (-347.2333, -667.3346, 856.1025), (0, -228.2072, 0));
                spawnMapEditObject("pap", (466.43, -94.77616, 769.9617), (0, -135.8671, 0));
                spawnMapEditObject("power", (-388.5116, -209.1938, 827.629), (0, -225.0596, 0));
                spawnMapEditObject("perk1", (-586.413, -109.9324, 853.4478), (90, -50.49236, 0));
                spawnMapEditObject("perk2", (-84.56386, 344.3047, 794.2312), (90, -46.08134, 0));
                spawnMapEditObject("perk3", (203.4331, -189.7358, 807.489), (90, -316.7296, 0));
                spawnMapEditObject("perk4", (-179.749, -484.9068, 849.6326), (90, -186.981, 0));
                spawnMapEditObject("perk5", (92.60123, 275.174, 786.9678), (90, 162.2957, 0));
                spawnMapEditObject("perk6", (-157.1006, -185.8124, 830.3995), (90, 131.6257, 0));
                spawnMapEditObject("perk7", (-21.95972, 13.4211, 809.8812), (90, -171.5397, 0));
                spawnMapEditObject("spawn", (-245.5666, -627.16, 832.3709), (0, 102.8878, 0));
                spawnMapEditObject("spawn", (-343.4766, -530.6805, 832.921), (0, 71.32954, 0));
                spawnMapEditObject("spawn", (-506.0191, -392.2759, 835.1278), (0, 59.97517, 0));
                spawnMapEditObject("spawn", (-619.4261, -235.9153, 833.1132), (0, 34.48141, 0));
                spawnMapEditObject("spawn", (-175.2821, 145.0619, 781.9556), (0, -93.03693, 0));
                spawnMapEditObject("spawn", (-138.2469, 24.19359, 786.7631), (0, -149.6714, 0));
                spawnMapEditObject("spawn", (-58.96288, -105.0985, 789.3591), (0, 179.2537, 0));
                spawnMapEditObject("zombiespawn", (-730.4813, -420.5131, 879.1395), (0, 44.90194, 0));
                spawnMapEditObject("zombiespawn", (-390.1595, -737.9081, 876.1602), (0, 43.60555, 0));
                spawnMapEditObject("invisiblewall", (115.5719, 591.1651, 763.6873), (-721.7638, -184.1045, 982.0107));
                spawnMapEditObject("invisiblewall", (-732.7056, -203.2137, 866.2247), (-769.08, -262.6189, 996.2503));
                spawnMapEditObject("invisiblewall", (-757.5079, -272.9124, 872.1005), (-292.8348, -776.0895, 983.6987));
                spawnMapEditObject("invisiblewall", (-130.0972, -676.9534, 827.8611), (-232.0675, -559.1277, 953.1999));
                spawnMapEditObject("invisiblewall", (-217.3644, -547.212, 825.7509), (-148.4909, -478.4551, 955.7868));
                spawnMapEditObject("invisiblewall", (80.99597, -83.06715, 779.0079), (-10.15334, 15.37245, 884.8022));
                spawnMapEditObject("invisiblewall", (-1.484487, 12.26655, 778.6356), (26.6612, 95.19773, 892.6147));
                spawnMapEditObject("invisiblewall", (106.1485, -73.65096, 776.8335), (168.8994, 37.4814, 886.8557));
                spawnMapEditObject("elevator", (7.457785, -90.88428, 784.1932), (0, -46.56476, 0), (108.3617, -184.1791, 778.8188), (209.5864, -93.99966, 774.3572));
                spawnMapEditObject("elevator", (139.1167, -113.741, 792.1002), (0, 311.6381, 0), (36.83699, -244.0834, 825.9393), (-46.89901, -156.5983, 791.5887));
                spawnMapEditObject("invisiblefloor", (-183.6341, -387.3546, 756.9763), (276.686, -38.24126, 756.9763));
                spawnMapEditObject("fallLimit", 542);
                spawnMapEditObject("mapname", "Ship-REKD");
                spawnMapEditObject("hellMap", false);
                spawnMapEditObject("randombox", (-503.1292, -511.1508, 856.8259), (0, -227.4546, 0), (203.8997, 523.0276, 750.09), (0, -45.68034, 0), (395.6883, 3.157998, 768.6812), (0, 311.2639, 0));

                //Close up broken wall by the large crane
                spawnMapEditObject("invisiblewall", (97, 183, 759), (17, 52, 934));
            }
        break;
        case "mp_six_ss":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("bank", (-1695.873, 593.7447, 312.0783), (90, 1.618652, 0));
                spawnMapEditObject("ammo", (-1505.499, 675.2416, 218.8157), (0, -89.50192, 0));
                spawnMapEditObject("killstreak", (-1581.88, -177.129, 258.125), (0, 1.942757, 0));
                spawnMapEditObject("gambler", (-1811.932, -618.0486, 258.125), (0, 89.19067, 0));
                spawnMapEditObject("pap", (-1702.459, 306.5184, 215.54), (0, -269.3207, 0));
                spawnMapEditObject("power", (-1422.662, 682.0947, 289.2333), (0, 0.5529861, 0));
                spawnMapEditObject("perk1", (-1567.051, 163.2448, 229.7589), (90, 317.2339, 0));
                spawnMapEditObject("perk2", (-984.1257, -326.3821, 247.5112), (90, 225.542, 0));
                spawnMapEditObject("perk3", (-1029.023, -717.3671, 219.6548), (90, 165.8588, 0));
                spawnMapEditObject("perk4", (-1374.513, -847.9091, 224), (90, 156.4655, 0));
                spawnMapEditObject("perk5", (-1624.514, -468.6063, 273.125), (90, 88.41065, 0));
                spawnMapEditObject("perk6", (-1561.128, 775.1311, 230.3622), (90, 0.08056641, 0));
                spawnMapEditObject("perk7", (-1212.694, 937.4612, 242.538), (90, 241.6534, 0));
                spawnMapEditObject("spawn", (-1167.489, 25.12233, 245.5651), (0, -179.9634, 0));
                spawnMapEditObject("spawn", (-1516.065, -776.4577, 194.5757), (0, 24.1022, 0));
                spawnMapEditObject("spawn", (-1222.166, -753.5898, 193.9006), (0, 132.702, 0));
                spawnMapEditObject("spawn", (-1501.822, 64.7809, 195.7298), (0, -4.044793, 0));
                spawnMapEditObject("spawn", (-1233.669, 720.3514, 210.9075), (0, -113.5181, 0));
                //spawnMapEditObject("spawn", (-1598.056, 572.4324, 209.5028), (0, -37.11364, 0));
                spawnMapEditObject("zombiespawn", (-904.3168, 880.3719, 243.831), (0, -146.6473, 0));
                spawnMapEditObject("zombiespawn", (-1628.914, 131.6918, 196.4882), (0, -10.96618, 0));
                spawnMapEditObject("zombiespawn", (-779.6655, -741.7212, 180.2946), (0, 169.5337, 0));
                spawnMapEditObject("randombox", (-1021.297, 31.255, 267.1538), (0, -91.89147, 0), (-1396.668, -256.5804, 209), (0, -168.0157, 0), (-1347.821, -531.4402, 209), (0, 10.69337, 0), (-1815.581, -762.8798, 209), (0, 89.36646, 0));
                spawnMapEditObject("invisiblewall", (-970.3729, 96.87485, 300.125), (-984.0071, -9.874963, 400));
                spawnMapEditObject("invisiblewall", (-936.875, -457.7059, 183.3084), (-877.2211, -572.4699, 420));
                spawnMapEditObject("invisiblewall", (-877.2211, -572.4699, 185.6118), (-951.0997, -865.9218, 420));
                spawnMapEditObject("invisiblewall", (-1013.114, 573.142, 220), (-951.5901, 691.1807, 350));
                spawnMapEditObject("invisiblewall", (-947.9301, 776.2939, 220), (-1125.564, 934.3865, 350));
                spawnMapEditObject("invisiblewall", (-1277.378, 962.4075, 210.4771), (-1412.542, 1018.84, 400));
                spawnMapEditObject("door", (-1505.201, 490.1768, 0), (-1505.201, 490.1768, 233.4449), (90, -2.050796, 0), 2, 1, 75, 1000);
                spawnMapEditObject("door", (-1511.812, 297.2383, 0), (-1511.812, 297.2383, 228.7837), (90, 0, 0), 2, 1, 75, 1000);
                spawnMapEditObject("model", "fence_wooden_01", (-902.5561, -674.2136, 126.7962), (0, 146.023, 0));
                spawnMapEditObject("model", "fence_wooden_01", (-936.0265, -820.5231, 129.6958), (0, 174.2743, 0));
                spawnMapEditObject("model", "fence_wooden_01", (-989.8818, 643.6539, 155.4872), (0, 154.7657, 0));
                spawnMapEditObject("model", "fence_wooden_01", (-993.0281, 781.879, 154.946), (0, -134.5372, 0));
                spawnMapEditObject("model", "fence_wooden_01", (-1086.306, 870.9, 160), (0, -139.58, 0));
                spawnMapEditObject("model", "fence_wooden_01", (-1319.87, 993.199, 160.5715), (0, -120.1012, 0));
                spawnMapEditObject("model", "fence_wooden_01", (-918.5338, -516.1574, 134.1078), (0, -147.9657, 0));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Undead Farm");
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("power", (1308.557, -1575.008, 206.4987), (0, 82.60985, 0));
                spawnMapEditObject("perk1", (1091.85, -1885.025, 222), (90, -312.3541, 0));
                spawnMapEditObject("perk2", (966.5455, -1706.419, 221.6049), (90, -349.3121, 0));
                spawnMapEditObject("perk3", (993.3265, -1311.006, 222), (90, -28.84096, 0));
                spawnMapEditObject("perk4", (1234.823, -1227.768, 221.2798), (90, -86.18959, 0));
                spawnMapEditObject("perk5", (1463.863, -1264.38, 222), (90, -116.0229, 0));
                spawnMapEditObject("perk6", (1398.886, -2007.1, 224.1986), (90, -274.1656, 0));
                spawnMapEditObject("perk7", (1603.073, -1931.13, 222), (90, -236.2738, 0));
                spawnMapEditObject("spawn", (1114.567, -1386.374, 192.125), (0, -52.01659, 0));
                spawnMapEditObject("spawn", (1110.447, -1767.251, 191.9267), (0, 9.907866, 0));
                spawnMapEditObject("spawn", (1430.531, -1854.035, 192.125), (0, 120.7159, 0));
                spawnMapEditObject("spawn", (1464.757, -1433.99, 192.125), (0, -147.323, 0));
                spawnMapEditObject("spawn", (1310.942, -1375.237, 192.125), (0, -94.85229, 0));
                spawnMapEditObject("spawn", (1054.408, -1567.164, 191.9547), (0, -0.08422136, 0));
                spawnMapEditObject("spawn", (1481.047, -1624.974, 190.3126), (0, 169.3194, 0));
                spawnMapEditObject("spawn", (1291.471, -1794.407, 192.0341), (0, 84.07103, 0));
                spawnMapEditObject("zombiespawn", (1424.13, -2363.274, 194.9969), (0, 91.2506, 0));
                spawnMapEditObject("zombiespawn", (1222.705, -2351.631, 194.5798), (0, 85.28502, 0));
                spawnMapEditObject("zombiespawn", (1059.91, -2313.48, 192.7496), (0, 53.86417, 0));
                spawnMapEditObject("gambler", (948.7916, -1476.057, 207), (0, 265.5182, 0));
                spawnMapEditObject("bank", (1676.824, -1544.519, 222), (90, -203.1171, 0));
                spawnMapEditObject("ammo", (966.0105, -1401.194, 207), (0, 68.37706, 0));
                spawnMapEditObject("killstreak", (1614.652, -1371.734, 207), (0, -51.69797, 0));
                spawnMapEditObject("pap", (1702.8, -1646.841, 204.4726), (0, -98.48876, 0));
                spawnMapEditObject("mapname", "The Rodeo");
                spawnMapEditObject("hellMap", false);
                spawnMapEditObject("randombox", (1571.342, -1604.045, 205.7454), (0, -90.30395, 0), (1076.025, -1247.19, 207.4109), (0, 18.71336, 0));
                spawnMapEditObject("invisiblecrate", (1681.099, -1530.215, 205), (0, 105.3049, 0));
                spawnMapEditObject("invisiblecrate", (1693.096, -1576.408, 205), (0, 105.3979, 0));
                spawnMapEditObject("invisiblecrate", (1000.862, -1372.657, 205), (0, 109.7372, 0));
                spawnMapEditObject("invisiblecrate", (974.1223, -1346.771, 205), (0, 341.9388, 0));
                //spawnMapEditObject("invisiblecrate", (1653.176, -1537.56, 205), (0, 105.31, 0));
                spawnMapEditObject("invisiblecrate", (1675.376, -1575.82, 205), (0, 135.6163, 0));
                spawnMapEditObject("invisiblewall", (1202.658, -2011.892, 192), (1108.44, -1949.293, 335.9403));
                spawnMapEditObject("invisiblewall", (1101.577, -1941.477, 192), (1020.764, -1865.055, 333.4818));
                spawnMapEditObject("invisiblewall", (1021.36, -1870.442, 192), (953.9675, -1762.883, 338.9996));
                spawnMapEditObject("invisiblewall", (950.2311, -1757.315, 191.8707), (920.7039, -1646.994, 343.7947));
                spawnMapEditObject("invisiblewall", (919.2067, -1642.605, 191.7231), (914.7294, -1415.496, 336.8953));
                spawnMapEditObject("invisiblewall", (913.0801, -1412.138, 192), (961.707, -1292.804, 334.4749));
                spawnMapEditObject("invisiblewall", (968.9832, -1284.48, 192), (1053.764, -1217.414, 330.3535));
                spawnMapEditObject("invisiblewall", (1072.448, -1210.026, 191.246), (1181.171, -1194.949, 337.5313));
                spawnMapEditObject("invisiblewall", (1189.63, -1195.197, 190.4948), (1298.307, -1193.047, 315.4069));
                spawnMapEditObject("invisiblewall", (1309.61, -1193.058, 189.9245), (1419.944, -1212.689, 327.4248));
                spawnMapEditObject("invisiblewall", (1425.23, -1210.794, 190.2477), (1529.585, -1264.02, 341.1227));
                spawnMapEditObject("invisiblewall", (1540.843, -1272.241, 192), (1622.242, -1339.862, 340.4841));
                spawnMapEditObject("invisiblewall", (1629.345, -1345.128, 192), (1693.483, -1430.937, 336.7997));
                spawnMapEditObject("invisiblewall", (1699.726, -1436.618, 192), (1727.047, -1549.18, 326.4396));
                spawnMapEditObject("invisiblewall", (1732.794, -1569.074, 191.9322), (1732.377, -1671.742, 332.5832));
                spawnMapEditObject("invisiblewall", (1730.711, -1683.109, 188.6023), (1718.416, -1800.027, 342.4475));
                spawnMapEditObject("invisiblewall", (1717.991, -1804.245, 191.7921), (1669.924, -1906.962, 349.906));
                spawnMapEditObject("invisiblewall", (1668.388, -1913.344, 192), (1574.118, -1982.975, 335.4733));
                spawnMapEditObject("invisiblewall", (1562.133, -1989.352, 192), (1459.99, -2020.941, 323.0005));
                spawnMapEditObject("invisiblewall", (1445.097, -2022.895, 192), (1341.975, -2026.303, 312.1357));
                spawnMapEditObject("invisiblewall", (1334.994, -2028.012, 192), (1227.262, -2018.973, 303.5519));
            }
            else if (level.mapVariation == 2)
            {
                spawnMapEditObject("invisiblewall", (828.666, -1725.189, 190.207), (824.55, -2540.284, 291.7293));
                spawnMapEditObject("invisiblewall", (2540.331, -1444.925, 192), (2419.939, -1550.944, 280.8096));
                spawnMapEditObject("invisiblewall", (2417.121, -1571.118, 192), (2454.197, -1744.819, 283.0928));
                spawnMapEditObject("invisiblewall", (2463.4, -1756.981, 189.558), (2630.961, -1815.301, 295.3567));
                spawnMapEditObject("model", "fx_tornado", (2245.803, -1070.827, 254.8102), (0, 48.06789, 0));
                spawnMapEditObject("model", "fx_tornado", (2360.567, -985.7089, 246.7146), (0, 291.4532, 0));
                spawnMapEditObject("model", "fx_tornado", (2189.199, -2017.699, 228.1584), (0, 188.503, 0));
                spawnMapEditObject("model", "fx_tornado", (1706.623, -2201.178, 192), (0, 138.6272, 0));
                spawnMapEditObject("model", "prop_corn_group_animated", (2709.741, -1930.515, 192), (0, 172.9742, 0));
                spawnMapEditObject("model", "prop_corn_group_animated", (2699.039, -2113.075, 192), (0, 180.5632, 0));
                spawnMapEditObject("model", "prop_corn_group_animated", (2701.896, -2305.883, 192), (0, 178.7084, 0));
                spawnMapEditObject("model", "prop_corn_group", (2591.518, -2482.187, 193.9476), (0, 259.9796, 0));
                spawnMapEditObject("invisiblewall", (2646.143, -1831.91, 191.7954), (2595.112, -2542.921, 300.542));
                spawnMapEditObject("invisiblewall", (1751.52, -2514.996, 197.4316), (1995.205, -2517.111, 236.9222));
                spawnMapEditObject("invisiblewall", (2530.864, -895.8337, 237.8131), (2538.381, -1123.694, 293.1811));
                spawnMapEditObject("invisiblewall", (2562.796, -1423.849, 192), (2540.777, -1142.865, 286.3816));
                spawnMapEditObject("invisiblewall", (1758.413, -1683.973, 188.5717), (1793.298, -1641.251, 277.4053));
                spawnMapEditObject("invisiblewall", (1732, -1537.627, 192), (1795.541, -1571.917, 273.3043));
                spawnMapEditObject("invisiblewall", (1801.744, -1629.506, 190.0837), (1802.758, -1570.548, 274.1621));
                spawnMapEditObject("invisiblewall", (1329.278, -2572.237, 204.8427), (1402.563, -2534.775, 264.4388));
                spawnMapEditObject("invisiblewall", (1486.33, -2575.969, 204.8635), (1415.427, -2553.623, 260.2618));
                spawnMapEditObject("invisiblewall", (2578.722, -2477.802, 193.896), (2286.111, -2584.573, 258.2339));
                spawnMapEditObject("invisiblecrate", (1921.13, -1708.108, 241.5053), (0, 178.0327, 0));
                spawnMapEditObject("invisiblecrate", (1921.13, -1708.108, 270), (0, 178.0327, 0));
                spawnMapEditObject("invisiblewall", (1709.721, -1554.625, 192), (1710.391, -1801.539, 276.9406));
                spawnMapEditObject("invisiblewall", (1703.508, -1817.296, 192), (1661.533, -1908.336, 276.4276));
                spawnMapEditObject("invisiblewall", (1648.138, -1921.34, 192), (1447.93, -2019.931, 280.5871));
                spawnMapEditObject("invisiblewall", (1426.502, -2019.773, 192), (1209.254, -2005.577, 271.8295));
                spawnMapEditObject("invisiblewall", (1199.128, -1995.877, 192.6508), (1027.526, -1863.302, 269.6339));
                spawnMapEditObject("invisiblewall", (1015.348, -1848.397, 192), (924.8918, -1652.071, 271.855));
                spawnMapEditObject("invisiblewall", (923.5908, -1644.411, 191.6983), (920.8841, -1405.124, 271.4948));
                spawnMapEditObject("invisiblewall", (927.335, -1390.106, 192), (968.1225, -1293.894, 267.5732));
                spawnMapEditObject("invisiblewall", (1057.44, -1228.287, 210.9201), (969.2179, -1290.803, 284.9718));
                spawnMapEditObject("invisiblewall", (1083.224, -1212.51, 191.2583), (1298.231, -1200, 273.9395));
                spawnMapEditObject("invisiblewall", (1311.782, -1201.208, 194.2329), (1414.043, -1216.707, 268.3358));
                spawnMapEditObject("invisiblewall", (1429.304, -1221.123, 190.6118), (1619.461, -1340.733, 264.7935));
                spawnMapEditObject("invisiblewall", (1625.636, -1353.413, 192), (1716.672, -1497.715, 271.9183));
                spawnMapEditObject("invisiblewall", (948.6537, -1492.595, 192), (987.1641, -1361.955, 275.2342));
                spawnMapEditObject("invisiblewall", (1678.457, -1580.86, 197.5944), (1636.345, -1529.6, 283.4092));
                spawnMapEditObject("invisiblewall", (1698.368, -1502.326, 192.4952), (1643.396, -1526.97, 268.2028));
                spawnMapEditObject("invisiblecrate", (1700.445, -2471.127, 215.0961), (0, 6.670697, 0));
                spawnMapEditObject("invisiblecrate", (2024.982, -2454.555, 213.9508), (0, 6.659024, 0));
                spawnMapEditObject("invisiblecrate", (2313.632, -2438.224, 210.6215), (0, 6.66034, 0));
                spawnMapEditObject("invisiblecrate", (2489.675, -2423.592, 208.2044), (0, 356.5661, 0));
                spawnMapEditObject("invisiblecrate", (2325.643, -937.735, 250.8421), (0, 180.8864, 0));
                spawnMapEditObject("invisiblecrate", (2502.638, -936.168, 253.8495), (0, 179.8133, 0));
                spawnMapEditObject("invisiblecrate", (1700.445, -2471.127, 255.0961), (0, 6.670697, 0));
                spawnMapEditObject("invisiblecrate", (2024.982, -2454.555, 253.9508), (0, 6.659024, 0));
                spawnMapEditObject("invisiblecrate", (2313.632, -2438.224, 250.6215), (0, 6.66034, 0));
                spawnMapEditObject("invisiblecrate", (2489.675, -2423.592, 248.2044), (0, 356.5661, 0));
                spawnMapEditObject("invisiblecrate", (2325.643, -937.735, 290.8421), (0, 180.8864, 0));
                spawnMapEditObject("invisiblecrate", (2502.638, -936.168, 293.8495), (0, 179.8133, 0));
                spawnMapEditObject("gambler", (2475.467, -1462.49, 207), (0, -138.1311, 0));
                spawnMapEditObject("bank", (854.7865, -2526.17, 223.1684), (90, -316.9061, 0));
                spawnMapEditObject("ammo", (2529.125, -1810.659, 206.218), (0, -21.7749, 0));
                spawnMapEditObject("killstreak", (1075.041, -1246.235, 207.3567), (0, 18.39661, 0));
                spawnMapEditObject("pap", (1571.396, -1603.554, 205.7591), (0, -93.21899, 0));
                spawnMapEditObject("power", (2130.508, -2034.741, 207), (0, -88.32458, 0));
                spawnMapEditObject("perk1", (1673.856, -1481.997, 222), (90, -193.5022, 0));
                spawnMapEditObject("perk2", (2415.084, -925.3007, 268.4596), (90, -91.06018, 0));
                spawnMapEditObject("perk3", (984.0336, -1450.312, 222), (90, -14.67773, 0));
                spawnMapEditObject("perk4", (2009.435, -933.8234, 260.4611), (90, -93.87268, 0));
                spawnMapEditObject("perk5", (1443.899, -922.0734, 263.1253), (90, -85.37476, 0));
                spawnMapEditObject("perk6", (2253.756, -2582.238, 232.3308), (90, -249.3677, 0));
                spawnMapEditObject("perk7", (1921.828, -1732.714, 219.6824), (90, -92.21375, 0));
                spawnMapEditObject("spawn", (1805.199, -1824.408, 192.125), (0, -62.29797, 0));
                spawnMapEditObject("spawn", (2417.742, -1094.246, 215.2074), (0, -112.6868, 0));
                spawnMapEditObject("spawn", (2008.486, -1096.886, 211.2301), (0, -112.5769, 0));
                spawnMapEditObject("spawn", (1663.356, -1081.758, 207.5145), (0, -90.65369, 0));
                spawnMapEditObject("spawn", (1348.564, -1043.861, 210.9647), (0, -31.25061, 0));
                spawnMapEditObject("spawn", (1775.422, -1474.712, 192.125), (0, 50.96558, 0));
                spawnMapEditObject("spawn", (2183.313, -2461.698, 198.025), (0, 112.8461, 0));
                spawnMapEditObject("spawn", (961.9069, -2449.968, 198.6042), (0, 52.05872, 0));
                spawnMapEditObject("spawn", (914.0073, -2147.643, 192.125), (0, 0.7745361, 0));
                spawnMapEditObject("zombiespawn", (1466.729, -2719.532, 203.0308), (0, 89.60999, 0));
                spawnMapEditObject("zombiespawn", (1387.131, -2722.648, 202.947), (0, 86.51733, 0));
                spawnMapEditObject("zombiespawn", (2718.18, -2263.366, 192), (0, 176.0504, 0));
                spawnMapEditObject("zombiespawn", (2726.584, -2009.771, 192), (0, 173.1116, 0));
                spawnMapEditObject("zombiespawn", (2676.772, -1290.21, 192.1605), (0, -172.9907, 0));
                spawnMapEditObject("model", "prop_corn_group_animated", (2625.197, -1296.485, 192), (0, 181.7413, 0));
                spawnMapEditObject("model", "prop_corn_group_animated", (2614.371, -1062.449, 227.1033), (0, 184.274, 0));
                spawnMapEditObject("model", "prop_corn_group", (2599.849, -1171.506, 201.3083), (0, 183.5546, 0));
                spawnMapEditObject("elevator", (1272.773, -2091.92, 192), (0, 87.24243, 0), (1284.022, -1939.291, 192), (1289.705, -1849.15, 192));
                spawnMapEditObject("elevator", (1282.791, -1937.578, 192), (0, -93.91663, 0), (1272.739, -2091.677, 192), (1271.247, -2173.693, 192));
                spawnMapEditObject("mapname", "Eye of the Storm");
                spawnMapEditObject("hellMap", false);
                spawnMapEditObject("randombox", (2402.487, -1658.618, 204.1427), (0, -81.16699, 0), (1861.561, -2482.243, 215.4721), (0, -178.7036, 0), (877.8489, -1126.792, 206.7426), (0, 46.41174, 0), (1988.618, -1641.957, 205.9333), (0, 85.46814, 0));
                spawnMapEditObject("invisiblewall", (1602.151, -2578.222, 263.0323), (2177.861, -2607.185, 302.3338));
            }
        break;
        case "mp_terminal":
        case "mp_terminal_cls":
            if (level._mapname == "mp_terminal" || (level.classicMapsEnabled && randomInt(100) > 50))
            {
                spawnMapEditObject("invisiblewall", (2295, 4425, 210), (2695, 4435, 400.2));
                spawnMapEditObject("invisiblewall", (1802,4782, 216),(605, 4781, 267));
                spawnMapEditObject("invisiblewall", (407,4646, 207),(304, 4648, 293));
                spawnMapEditObject("invisiblewall", (1858,4435, 324),(1858, 4046, 419));
                spawnMapEditObject("invisiblewall", (1858,3935, 326),(1858, 3554, 418));
                spawnMapEditObject("invisiblewall", (1913,3429, 200),(2151, 3191, 295));
                spawnMapEditObject("invisiblecrate", (2209,4257,315),(0,180,0));
                spawnMapEditObject("invisiblecrate", (1453,4440,315),(0,0,0));
                spawnMapEditObject("invisiblecrate", (1505,4439,315),(0,0,0));

                spawnMapEditObject("elevator", (1595,3988,315),(0,0,0),(1617,3050,197),(1617,3000,197));//Zipline
                spawnMapEditObject("elevator", (1401,4040,315),(0,90,0),(619,3836,357),(619,3775,357));//Zipline2
                spawnMapEditObject("elevator",(1771,3938,42),(0,0,0),(1791,3945,306), (1726.971, 3997, 306));

                spawnMapEditObject("randombox", (1840,4339,179),(0,90,0));
                spawnMapEditObject("power", (1658,2948,195),(0,190,0));
                spawnMapEditObject("bank", (2038,3294,136),(0,316,0));
                spawnMapEditObject("ammo", (715,2893,56),(0,0,0));
                spawnMapEditObject("gambler", (610,4202,218),(0,180,0));
                spawnMapEditObject("killstreak", (983,4142,51),(0,90,0));
                spawnMapEditObject("pap", (609,2763,213),(0,180,0),(607,2808,213));
                spawnMapEditObject("ramp", (1739.2, -2213.0, 0), (1741.3, -2479, 190.1));
                spawnMapEditObject("perk1", (1761,4215,448),(0,90,0));
                spawnMapEditObject("perk2", (1392,4730,55),(0,90,0));
                spawnMapEditObject("perk3", (550,3062,213),(0,90,0));
                spawnMapEditObject("perk4", (354,4595,201),(0,0,0));
                spawnMapEditObject("perk5", (550,3527,213),(0,90,0));
                spawnMapEditObject("perk6", (673,3059,213),(0,90,0));
                spawnMapEditObject("perk7", (674,4020,213),(0,90,0));
                spawnMapEditObject("spawn", (1503,4095,184), (0, 0, 0));
                spawnMapEditObject("spawn", (1586,4094,184), (0, 0, 0));
                spawnMapEditObject("spawn", (1700,4084,184), (0, 0, 0));
                spawnMapEditObject("spawn", (1773,4079,184), (0, 0, 0));
                spawnMapEditObject("spawn", (1693,4231,184), (0, 0, 0));
                spawnMapEditObject("spawn", (1582,4237,184), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2814,2838,63), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (45,4253,51), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (11,4157,51), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2917,3983,95), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2426,4398,198), (0, 0, 0));
                spawnMapEditObject("mapname", "Airport Invasion");
                spawnMapEditObject("maxWave", 30);
                level.mapVariation = 0;
                return;
            }
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("invisiblewall", (1840.927, 4799.125, 192.125), (602.5479, 4792.131, 300.1762));
                spawnMapEditObject("invisiblewall", (290.1553, 4673.125, 192.125), (422.2553, 4666.125, 301.1136));
                spawnMapEditObject("invisiblewall", (2275.014, 4400.125, 224.125), (2691.735, 4400.125, 292.9139));
                spawnMapEditObject("invisiblewall", (2240.585, 4247.875, 274.123), (2184.566, 4247.861, 296.8596));
                spawnMapEditObject("invisiblewall", (1887.615, 4053.125, 308.125), (1886.905, 4435.866, 411.859));
                spawnMapEditObject("invisiblewall", (1885.125, 4549.125, 308.125), (1875.625, 4721.875, 409.875));
                spawnMapEditObject("invisiblewall", (712.5687, 3700.58, 272.4049), (712.5981, 3650.694, 303.1044));
                spawnMapEditObject("invisiblewall", (1599.215, 4440.039, 304.125), (1372.862, 4437.242, 352.6452));
                spawnMapEditObject("invisiblewall", (1867.991, 3928.875, 182.125), (1867.603, 3554.125, 409.8424));
                spawnMapEditObject("wall", (1564.913, 4442.386, 304.125), (1379.761, 4440.539, 312.125));
                spawnMapEditObject("randombox", (1840.875, 4346.175, 183.125), (0, -91.08215, 0), (1314.078, 3675.125, 55.125), (0, 179.8077, 0), (2437.526, 3340.875, 63.125), (0, -0.9228516, 0));
                spawnMapEditObject("gambler", (612.4559, 4175.171, 218.625), (0, 0.8843994, 0));
                spawnMapEditObject("bank", (404.8736, 2707.825, 70.125), (90, 179.4397, 0));
                spawnMapEditObject("ammo", (714.8166, 2888.963, 55.125), (0, -0.1922607, 0));
                spawnMapEditObject("killstreak", (983.3201, 4159.703, 55.125), (0, 89.62646, 0));
                spawnMapEditObject("pap", (612.2808, 2763.94, 217.625), (0, -176.9513, 0));
                spawnMapEditObject("power", (1656.062, 2960.48, 199.125), (0, -168.2886, 0));
                spawnMapEditObject("elevator", (1733.861, 3954.416, 36.12388), (0, 1.257935, 0), (1733.861, 3954.416, 317.5), (1726.971, 3997.306, 304.125));
                spawnMapEditObject("perk1", (1752.475, 4216.479, 467.125), (90, 179.4452, 0));
                spawnMapEditObject("perk2", (1392.874, 4753.224, 74.125), (90, 179.4397, 0));
                spawnMapEditObject("perk3", (550.1259, 3056.958, 233.625), (90, -0.1977539, 0));
                spawnMapEditObject("perk4", (2023.333, 3299.212, 150.125), (90, -135.8295, 0));
                spawnMapEditObject("perk5", (550.1253, 3514.623, 233.625), (90, -1.642456, 0));
                spawnMapEditObject("perk6", (673.8747, 3060.715, 233.625), (90, 179.8022, 0));
                spawnMapEditObject("perk7", (673.8749, 4019.227, 233.625), (90, -179.8407, 0));
                spawnMapEditObject("spawn", (1603.571, 4231.952, 168.125), (4.915161, -2.005005, 0));
                spawnMapEditObject("zombiespawn", (2869.875, 3984.578, 84.125), (0, 179.0771, 0));
                spawnMapEditObject("zombiespawn", (21.68769, 4159.032, 40.125), (0, -36.63391, 0));
                spawnMapEditObject("zombiespawn", (29.15979, 4260.635, 40.125), (0, 0.5273438, 0));
                spawnMapEditObject("zombiespawn", (2429.905, 4486.164, 192.125), (0, -88.93433, 0));
                spawnMapEditObject("zombiespawn", (2754.289, 2901.905, 76.125), (0, 178.0005, 0));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Death Row");
                spawnMapEditObject("invisiblewall", (7.125029, 4797.857, 209.125), (103.875, 4790.625, 285.875));
                spawnMapEditObject("invisiblewall", (713.9955, 3729.535, 282.6621), (711.9826, 3677.362, 344.9545));
                spawnMapEditObject("ramp", (1478.975, 4123.909, 304.125), (1592.477, 4128.236, 332.2146));
                spawnMapEditObject("model", "cs_handrail_128_double_yel", (2300, 4435, 190), (0, 90, 0));
                spawnMapEditObject("model", "cs_handrail_128_double_yel", (2400, 4435, 190), (0, 90, 0));
                spawnMapEditObject("model", "cs_handrail_128_double_yel", (2500, 4435, 190), (0, 90, 0));
                spawnMapEditObject("model", "cs_handrail_128_double_yel", (2600, 4435, 190), (0, 90, 0));
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("yLimit", 2594, 5500);
                spawnMapEditObject("xLimit", -1834, -34);
                spawnMapEditObject("bank", (-1261.142, 4915.723, 70.125), (90, 225.1648, 0));
                spawnMapEditObject("ammo", (-529.6664, 4146.249, 55.125), (0, -88.98376, 0));
                spawnMapEditObject("killstreak", (-1184.858, 4124.071, 55.125), (0, -181.0547, 0));
                spawnMapEditObject("gambler", (-337.1904, 4537.226, 55.125), (0, -0.3076096, 0));
                spawnMapEditObject("pap", (-897.3298, 4412.674, 231.125), (0, -180.401, 0));
                spawnMapEditObject("perk2", (-599.8566, 4261.122, 246.125), (90, 358.4839, 0));
                spawnMapEditObject("perk3", (-1196.2, 4255.079, 246.125), (90, 179.6924, 0));
                spawnMapEditObject("perk4", (-1189.804, 4637.649, 246.125), (90, 177.6434, 0));
                spawnMapEditObject("perk5", (-602.0339, 4639.498, 246.125), (90, 359.6979, 0));
                spawnMapEditObject("perk6", (-819.3051, 5443.417, 222.125), (90, 270.3186, 0));
                spawnMapEditObject("perk7", (-1518.802, 4799.504, 222.125), (90, 90.90088, 0));
                spawnMapEditObject("spawn", (-153.7437, 4348.807, 40.12512), (0, -125.9802, 0));
                spawnMapEditObject("spawn", (-191.6786, 3810.453, 40.12338), (0, -179.0057, 0));
                spawnMapEditObject("spawn", (-461.9137, 4460.066, 44.12362), (0, -92.90588, 0));
                spawnMapEditObject("spawn", (-912.374, 4127.829, 40.125), (0, -95.84473, 0));
                spawnMapEditObject("spawn", (-1573.061, 4319.002, 40.125), (0, -83.10607, 0));
                spawnMapEditObject("spawn", (-1125.46, 4026.135, 40.125), (0, -48.55957, 0));
                spawnMapEditObject("spawn", (-564.1475, 3936.153, 40.12489), (0, -93.92212, 0));
                spawnMapEditObject("zombiespawn", (-406.241, 2579.062, 40.12434), (0, 91.37879, 0));
                spawnMapEditObject("zombiespawn", (-963.5443, 2509.384, 40.12518), (0, 92.52137, 0));
                spawnMapEditObject("zombiespawn", (-1584.345, 2549.743, 40.125), (0, 91.214, 0));
                spawnMapEditObject("power", (-750.4991, 3496.815, 55.125), (0, -2.032463, 0));
                spawnMapEditObject("perk1", (-1628.602, 4870.938, 60.125), (90, 268.7476, 0));
                spawnMapEditObject("randombox", (-896.516, 4472.397, 59.125), (0, 1.175545, 0), (-1214.851, 3409.695, 55.125), (0, -174.7266, 0), (-1397.752, 3793.093, 55.125), (0, -89.73632, 0));
                spawnMapEditObject("timedTeleporter", (-609.6602, 3811.08, 40.125), (0, -179.0222, 0), (-1559.527, 5109.954, 192.125), (0, 0.2417068, 0), (-159.6159, 4784.875, 50), (-90, 90.0879, 0), 60);
                spawnMapEditObject("invisiblewall", (-1211.662, 3960.499, 40.125), (-1214.933, 3551.213, 150));
                spawnMapEditObject("invisiblewall", (-1214.933, 3551.213, 40.125), (-1281.663, 3547.537, 150));
                spawnMapEditObject("invisiblewall", (-1281.663, 3547.537, 40.125), (-1278.587, 3953.017, 150));
                spawnMapEditObject("invisiblewall", (-1278.587, 3953.017, 40.125), (-1211.662, 3960.499, 150));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Airport Security");
                spawnMapEditObject("model", "vehicle_cart_baggage_airport_big", (-1900, 4500, 40), (0, 0, 0));
                spawnMapEditObject("model", "vehicle_cart_baggage_airport_big", (-1900, 4325, 40), (0, 0, 0));
                spawnMapEditObject("model", "vehicle_cart_baggage_airport_big", (-1900, 3700, 40), (0, 0, 0));
                spawnMapEditObject("model", "vehicle_cart_baggage_airport_big", (-1900, 3500, 40), (0, 0, 0));
                spawnMapEditObject("model", "vehicle_cart_baggage_airport_big", (-1900, 3000, 40), (0, 0, 0));
                spawnMapEditObject("model", "vehicle_cart_baggage_airport_big", (-1900, 2800, 40), (0, 0, 0));
                spawnMapEditObject("model", "vehicle_cart_baggage_airport_big", (-1900, 2600, 40), (0, 0, 0));
                spawnMapEditObject("model", "police_barrier_01", (-1800, 2550, 40), (0, -10, 0));
                spawnMapEditObject("model", "police_barrier_01", (-1650, 2550, 40), (0, 0, 0));
                spawnMapEditObject("model", "police_barrier_01", (-1500, 2550, 40), (0, 10, 0));
                spawnMapEditObject("model", "police_barrier_01", (-1300, 2550, 40), (0, 0, 0));
                spawnMapEditObject("model", "police_barrier_01", (-1000, 2550, 40), (0, 15, 0));
                spawnMapEditObject("model", "police_barrier_01", (-800, 2550, 40), (0, -10, 0));
                spawnMapEditObject("model", "police_barrier_01", (-500, 2550, 40), (0, 0, 0));
                spawnMapEditObject("model", "police_barrier_01", (-500, 2550, 40), (0, 15, 0));
                spawnMapEditObject("model", "police_barrier_01", (-300, 2550, 40), (0, 10, 0));
                spawnMapEditObject("model", "police_barrier_01", (-50, 2550, 40), (0, 3, 0));

                for (i = 18; i < 1000; i++)
                {
                    ent = getEntByNum(i);
                    if (!isDefined(ent)) continue;

                    targetname = ent.targetname;
                    if (!isDefined(targetname) || targetname == "") continue;
                    if (isSubStr(targetname, "toy") || isSubStr(targetname, "vending") || isSubStr(targetname, "destructible") || isSubStr(targetname, "destructable"))
                    {
                        if (isDefined(ent.target))
                        {
                            col = getEnt(ent.target, "targetname");
                            if (isDefined(col)) col delete();
                        }
                        ent delete();
                    }
                }
            }
            else if (level.mapVariation == 2)
            {
                spawnMapEditObject("bank", (1753.916, 6313.605, 222.125), (90, -88.69812, 0));
                spawnMapEditObject("ammo", (1676.991, 5801.993, 207.125), (0, -266.6986, 0));
                spawnMapEditObject("killstreak", (2135.297, 5631.177, 207.125), (0, 89.25842, 0));
                spawnMapEditObject("pap", (2264.902, 6071.276, 207.125), (0, 0, 0));
                spawnMapEditObject("perk1", (2429.498, 5215.631, 222.125), (90, -270.6921, 0));
                spawnMapEditObject("perk7", (2729.5, 5680.35, 222.125), (90, -137.1478, 0));
                spawnMapEditObject("spawn", (1785.736, 6189.03, 192.125), (0, -38.21594, 0));
                spawnMapEditObject("spawn", (1781.029, 5813.608, 192.125), (0, 39.02893, 0));
                spawnMapEditObject("spawn", (2039.405, 6183.669, 192.125), (0, -130.6274, 0));
                spawnMapEditObject("spawn", (2077.577, 5833.555, 192.125), (0, 129.9463, 0));
                spawnMapEditObject("spawn", (2257.331, 5646.044, 192.125), (0, -47.80701, 0));
                spawnMapEditObject("spawn", (2585.548, 5644.205, 192.125), (0, -137.7411, 0));
                spawnMapEditObject("spawn", (2592.315, 5294.025, 192.125), (0, 132.2589, 0));
                spawnMapEditObject("spawn", (2283.95, 5302.396, 192.125), (0, 41.44592, 0));
                spawnMapEditObject("spawn", (2632.224, 5925.575, 192.125), (0, -135.9943, 0));
                spawnMapEditObject("zombiespawn", (1485.979, 6356.389, 192.125), (0, -90.03296, 0));
                spawnMapEditObject("zombiespawn", (1494.219, 5644.744, 192.125), (0, 89.62097, 0));
                spawnMapEditObject("zombiespawn", (2090.69, 5030.374, 192.125), (0, 0.7635498, 0));
                spawnMapEditObject("zombiespawn", (2778.992, 5039.324, 192.125), (0, -179.0387, 0));
                spawnMapEditObject("invisiblewall", (2134.626, 6025.601, 224.125), (2135.414, 6126.643, 302.2602));
                spawnMapEditObject("gambler", (1903.275, 6017.347, 239.625), (0, -181.8677, 0));
                spawnMapEditObject("invisiblewall", (2391.254, 6006.597, 230.125), (2170.693, 6008.345, 301.5245));
                spawnMapEditObject("invisiblewall", (2338.146, 6237.104, 192.125), (2266.125, 6237.368, 280.6372));
                spawnMapEditObject("doorandspawn", (2503.875, 6188.8, 239.9236), (2138.434, 6183.225, 192.125), (90, 176.862, 0), 2, 2, 100, 10000, (2413.63, 6290.377, 192.125), (0, 178.0719, 0));
                spawnMapEditObject("model", "police_barrier_01", (2306.244, 6234.095, 192.125), (0, 0.01191906, 0));
                spawnMapEditObject("mapname", "Burger Town Of Death");
                spawnMapEditObject("hellMap", true);
                spawnMapEditObject("maxWave", 20);
                spawnMapEditObject("randombox", (2793.336, 5440.894, 207.125), (0, -90.06592, 0), (1750.761, 6016.971, 207.125), (0, 89.6759, 0), (2386.846, 5730.87, 207.125), (0, 270.209, 0), (2430.531, 5773.469, 207.125), (0, 180.443, 0), (2131.326, 5285.379, 207.125), (0, 89.63745, 0));

                //Burger Town gates
                gates = [];
                for (i = 18; i < 1000; i++)
                {
                    ent = getEntByNum(i);
                    if (!isDefined(ent)) continue;

                    targetname = ent.targetname;
                    if (!isDefined(targetname) || targetname == "") continue;
                    if (targetname == "gate_gate_closing")
                    {
                        if (!isDefined(gates[0])) gates[0] = ent;
                        else
                        {
                            gates[1] = ent;
                            break;
                        }
                    }
                }

                gates[0].origin = (2432, 5090, gates[1].origin[2]);
                gates[0].angles -= (0, 90, 0);

                level thread maps\mp\gametypes\_aiz_map_edits::terminal_buildGates(gates);
            }
        break;
        case "mp_underground":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("invisiblewall", (-2254.784, 2856.088, -215.875), (-2176.453, 2664.125, -110.3143));
                spawnMapEditObject("invisiblewall", (-787.111, 3839.125, -127.875), (-1205.559, 3901.152, -25.97101));
                spawnMapEditObject("invisiblewall", (-1147.273, 2776.031, -255.875), (-1289.968, 2938.944, -132.2616));
                spawnMapEditObject("invisiblewall", (-1344.292, 3002.425, -247.8673), (-1290.911, 2946.913, -159.2411));
                spawnMapEditObject("invisiblewall", (-1998.251, 3110.646, -115.875), (-2008.726, 3068.867, -51.23801));
                spawnMapEditObject("invisiblewall", (-1215.971, 2753.125, -220.875), (-1177.359, 2764.658, -180.875));
                spawnMapEditObject("randombox", (-2177.566, 2723.413, -200.875), (0, 99.45086, 0), (-1250.878, 2774.795, -96.875), (0, -142.5944, 0), (-2023.166, 2068.125, -200.875), (0, 179.5302, 0), (-902.4297, 3285.09, -112.875), (0, -116.9908, 0));
                spawnMapEditObject("gambler", (-2121.813, 2989.074, -200.875), (0, 43.17344, 0));
                spawnMapEditObject("bank", (-1398.576, 2026.061, -225.875), (90, 100.5275, 0));
                spawnMapEditObject("ammo", (-1192.875, 2606.204, -205.875), (0, -87.77261, 0));
                spawnMapEditObject("killstreak", (-1628.778, 2637.701, -240.875), (0, -110.1973, 0));
                spawnMapEditObject("timedTeleporter", (-1050.124, 3685.467, -127.875), (0, -113.3653, 0), (951.256, 3501.151, -127.875), (0, -163.8694, 0), (-1262.043, 2000.105, -297.875), (0, 91.88128, 0), 45);
                spawnMapEditObject("pap", (675.4774, 3163.125, -112.875), (0, 178.4536, 0));
                spawnMapEditObject("power", (-1891.59, 3157.032, -112.875), (0, 132.6241, 0));
                spawnMapEditObject("perk1", (984.1785, 3364.125, -73.875), (90, 94.0346, 0));
                spawnMapEditObject("perk2", (-1935.96, 2815.572, -179.375), (90, -114.4584, 0));
                spawnMapEditObject("perk3", (-1634.875, 2323.191, -225.875), (90, 2.051611, 0));
                spawnMapEditObject("perk4", (-1660.984, 3305.984, -225.875), (90, -49.53469, 0));
                spawnMapEditObject("perk5", (-1277.824, 3803.746, -97.875), (90, -46.64529, 0));
                spawnMapEditObject("perk6", (-2108.873, 2591.855, -177.875), (90, -1.200342, 0));
                spawnMapEditObject("perk7", (-877.8188, 3027.183, -55.875), (90, 102.3081, 0));
                spawnMapEditObject("spawn", (-1543.515, 2804.363, -255.875), (2.393799, 178.784, 0));
                spawnMapEditObject("spawn", (-1178.433, 3497.47, -127.875), (5.997334, -159.5729, 0));
                spawnMapEditObject("zombiespawn", (-704.3317, 3359.426, -127.875), (0, 173.7247, 0));
                spawnMapEditObject("zombiespawn", (-897.4172, 4097.998, -127.875), (0, -113.4084, 0));
                spawnMapEditObject("zombiespawn", (-2306.577, 2804.311, -215.875), (0, -2.303696, 0));
                spawnMapEditObject("zombiespawn", (-2023.816, 1879.296, -215.875), (0, 87.87758, 0));
                spawnMapEditObject("model", "ny_barrier_pedestrian_01", (-1129.939, 3873.886, -126.8649), (0, -8.791031, 0));
                spawnMapEditObject("model", "ny_barrier_pedestrian_01", (-865.9984, 3832.033, -126.8652), (0, 167.0862, 0));
                spawnMapEditObject("model", "ny_barrier_pedestrian_01", (-993.6631, 3861.257, -126.8633), (0, -8.726361, 0));
                spawnMapEditObject("invisiblewall", (-1916.266, 2043.071, -215.875), (-1924.477, 1970.405, -130.875));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("mapname", "Car Lot Of Pain");
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("gambler", (423.4504, -206.4557, 23.125), (0, 0.416153, 0));
                spawnMapEditObject("bank", (593.5339, -569.7247, 30), (90, -298.7086, 0));
                spawnMapEditObject("ammo", (363.678, -697.4197, 15), (0, -120.4664, 0));
                spawnMapEditObject("killstreak", (-373.1363, -877.0996, 15), (0, -231.9282, 0));
                spawnMapEditObject("pap", (30.36447, -1433.745, 31.125), (0, -180.7539, 0));
                spawnMapEditObject("power", (26.36898, -704.5389, 15), (0, 2.141006, 0));
                spawnMapEditObject("perk1", (272.9391, -1027.887, 38.125), (90, -178.8862, 0));
                spawnMapEditObject("perk2", (-228.1553, -194.7334, 38.125), (90, -90.09471, 0));
                spawnMapEditObject("perk3", (-213.8624, -1145.09, 43.86699), (90, -303.3503, 0));
                spawnMapEditObject("perk4", (486.9096, -634.8041, 30), (90, -209.5436, 0));
                spawnMapEditObject("perk5", (-508.1071, -591.9843, 30), (90, -332.2609, 0));
                spawnMapEditObject("perk6", (216.3916, -208.4455, 38.125), (90, -88.44127, 0));
                spawnMapEditObject("perk7", (177.9517, -1286.442, 46.125), (90, -178.282, 0));
                spawnMapEditObject("spawn", (-270.4554, -567.187, 0.1250001), (0, -41.92516, 0));
                spawnMapEditObject("spawn", (36.30777, -465.0602, 4.08825), (0, -89.96837, 0));
                spawnMapEditObject("spawn", (403.2626, -466.502, 8.124999), (0, -148.0201, 0));
                spawnMapEditObject("spawn", (208.5028, -861.9132, 0.1249974), (0, 125.5175, 0));
                spawnMapEditObject("spawn", (46.39668, -946.8207, 0.1250013), (0, 90.49855, 0));
                spawnMapEditObject("spawn", (-164.1087, -912.4917, 0.1250027), (0, 57.56703, 0));
                spawnMapEditObject("zombiespawn", (-772.1503, -294.3157, 8.124998), (0, -40.70018, 0));
                spawnMapEditObject("zombiespawn", (36.00162, -35.1796, 8.125683), (0, -91.13292, 0));
                spawnMapEditObject("zombiespawn", (659.8555, -695.0906, 0), (0, 63.7743, 0));
                spawnMapEditObject("zombiespawn", (501.4205, -940.1138, 8.124003), (0, -117.967, 0));
                spawnMapEditObject("invisiblewall", (-576.5934, -527.4575, 2.644268), (-562.8522, -215.6479, 196.0093));
                spawnMapEditObject("invisiblewall", (-206.8749, -166.2019, 15.33722), (271.875, -172.8264, 101.8265));
                spawnMapEditObject("invisiblewall", (716.2479, -149.1897, 8.124999), (779.9969, -148.9039, 101.9812));
                spawnMapEditObject("invisiblewall", (633.3388, -612.492, 0), (784.0336, -443.125, 117.933));
                spawnMapEditObject("invisiblewall", (351.7017, -930.8167, 8.124999), (308.0309, -1007.789, 92.65556));
                spawnMapEditObject("door", (29.46534, -1139.409, -289.6798), (24.06567, -1163.249, 16.125), (90, 90.08784, 0), 12, 2, 125, 5000);
                spawnMapEditObject("randombox", (32.5021, -227.8816, 23.125), (0, -0.3313522, 0), (-150.4331, -445.5954, 23.12578), (0, 0.3223343, 0), (224.4966, -442.3106, 23.125), (0, 0.5530472, 0), (-109.4885, -1253.174, 31.125), (0, 89.9433, 0));
                spawnMapEditObject("mapname", "The Station");
                spawnMapEditObject("model", "ny_barrier_pedestrian_01", (308.7858, -1100.19, 8.125), (0, 90, 0));
                spawnMapEditObject("invisiblewall", (304.2075, -1071.125, 8.124998), (304.2013, -1128.822, 100));
                spawnMapEditObject("model", "ny_barrier_pedestrian_01", (-560.2218, -477.147, 3.608532), (-7, 90, 0));
                spawnMapEditObject("model", "ny_barrier_pedestrian_01", (-550.2612, -228.7405, 8.125001), (0, 90, 0));
                spawnMapEditObject("model", "ny_barrier_pedestrian_01", (750.4523, -165.167, 8.125), (0, 180, 0));
                spawnMapEditObject("model", "ny_barrier_pedestrian_01", (315, -964.4506, 8.124999), (0, 60, 0));
                spawnMapEditObject("model", "ny_barrier_pedestrian_01", (33.4315, -195.5125, 8.125001), (0, 180, 0));
            }
        break;
        case "mp_village":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("invisiblewall", (-3972.128, -3131.874, 1344.125), (-3103.552, -3230.334, 1463.337));
                spawnMapEditObject("invisiblewall", (-3103.552, -3230.334, 1344.125), (-1792.492, -2451.009, 1463.558));
                spawnMapEditObject("invisiblewall", (-1792.492, -2451.009, 1344.125), (-1047.816, -2757.295, 1463.648));
                spawnMapEditObject("invisiblewall", (-1047.816, -2757.295, 1344.125), (-329.8658, -3516.445, 1463.393));
                spawnMapEditObject("invisiblewall", (-329.8658, -3516.445, 1344.125), (-456.0952, -4094.704, 1463.301));
                spawnMapEditObject("invisiblewall", (-456.0952, -4094.704, 1344.125), (-819.5269, -4094.378, 1463.69));
                spawnMapEditObject("invisiblewall", (-3418.855, -3223.126, 1344.125), (-3298.955, -3311.978, 1463.125));
                spawnMapEditObject("invisiblewall", (-3298.955, -3311.978, 1344.125), (-3129.926, -3237.858, 1463.133));
                spawnMapEditObject("randombox", (-424.9169, -3810.622, 1359.125), (0, -105.4304, 0), (-1416.543, -2638.212, 1359.125), (0, -27.52088, 0), (-3728.814, -3189.774, 1359.125), (0, -10.57446, 0), (-4116.309, -4072.595, 1359.125), (0, 178.8024, 0));
                spawnMapEditObject("gambler", (-2946.636, -4081.291, 1359.125), (0, 179.1594, 0));
                spawnMapEditObject("bank", (-3214.579, -3307.876, 1374.125), (90, -65.06665, 0));
                spawnMapEditObject("ammo", (-1352.05, -4079.743, 1359.125), (0, -179.7639, 0));
                spawnMapEditObject("killstreak", (-625.7823, -3247.391, 1359.125), (0, -50.26807, 0));
                spawnMapEditObject("pap", (-5678.038, -3652.589, 1359.125), (0, 88.24207, 0));
                spawnMapEditObject("power", (-4263.47, -3157.417, 1359.125), (0, 1.307251, 0));
                spawnMapEditObject("perk1", (-480.3488, -4064.557, 1374.125), (90, 136.2523, 0));
                spawnMapEditObject("perk2", (-4416.634, -4089.1, 1374.125), (90, 89.35713, 0));
                spawnMapEditObject("perk3", (-5684.62, -4084.328, 1374.125), (90, 41.74788, 0));
                spawnMapEditObject("perk4", (-5692.514, -3144.658, 1374.125), (90, -31.48149, 0));
                spawnMapEditObject("perk5", (-1790.034, -2484.594, 1374.125), (90, -81.98015, 0));
                spawnMapEditObject("perk6", (-1062.419, -2785.697, 1374.125), (90, -128.1557, 0));
                spawnMapEditObject("perk7", (-2046.683, -4085.725, 1374.125), (90, 88.27498, 0));
                spawnMapEditObject("spawn", (-2343.601, -3569.354, 1344.125), (2.750855, -178.8301, 0));
                spawnMapEditObject("spawn", (-4173.856, -3649.188, 1344.125), (2.03125, 3.691235, 0));
                spawnMapEditObject("zombiespawn", (-5011.204, -3649.115, 1344.125), (0, 2.059769, 0));
                spawnMapEditObject("zombiespawn", (-3573.019, -3650.552, 1344.125), (0, 0.2525177, 0));
                spawnMapEditObject("zombiespawn", (-1736.269, -3618.38, 1344.125), (0, 0.9776155, 0));
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("fallLimit", 1000);
                spawnMapEditObject("mapname", "Big Black Death");
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("bank", (-1270.352, 1162.426, 309.4712), (90, 106.7144, 0));
                spawnMapEditObject("ammo", (-2216.257, 874.5369, 312.0256), (0, -245.9083, 0));
                spawnMapEditObject("killstreak", (-1635.561, 1082.178, 310.7018), (0, -144.6248, 25));
                spawnMapEditObject("pap", (-481.4149, 783.3632, 140.7745), (0, -146.0316, 0));
                spawnMapEditObject("power", (-948.96, 1605.971, 296.111), (0, -153.8649, 0));
                spawnMapEditObject("gambler", (-2275.983, 1085.092, 297.5887), (0, 117.5139, 0));
                spawnMapEditObject("perk1", (-1561.074, 1519.722, 288.25), (90, 289.3291, 0));
                spawnMapEditObject("perk2", (-1928.07, 1445.927, 309.8759), (90, 281.397, 0));
                spawnMapEditObject("perk3", (-1203.483, 1536.563, 222.2336), (90, 21.48244, 0));
                spawnMapEditObject("perk4", (-705.4416, 2143.032, 289.5521), (90, 286.599, 0));
                spawnMapEditObject("perk5", (-348.8479, 1625.673, 295.0312), (90, 153.1536, 0));
                spawnMapEditObject("perk6", (-1809.664, 1280.659, 338.0184), (90, 243.1371, 0));
                spawnMapEditObject("perk7", (-725.5281, 1334.583, 218.0141), (110, -171.6462, 0));
                spawnMapEditObject("spawn", (-484.7733, 1874.713, 254.08), (0, -152.3158, 0));
                spawnMapEditObject("spawn", (-791.6958, 1150.617, 126.2981), (0, 118.2061, 0));
                spawnMapEditObject("spawn", (-1464.397, 1436.04, 241.7689), (0, 24.52015, 0));
                spawnMapEditObject("spawn", (-2083.017, 906.9351, 290.8552), (0, 41.10402, 0));
                spawnMapEditObject("spawn", (-2152.808, 1145.843, 283.0376), (0, 16.22548, 0));
                //spawnMapEditObject("zombiespawn", (-2220.311, 1434.203, 287.8602), (0, -78.15807, 0));
                spawnMapEditObject("zombiespawn", (-1777.702, 1521.26, 264.771), (0, -68.38573, 0));
                spawnMapEditObject("zombiespawn", (-87.55521, 1845.072, 266.7281), (0, 127.7751, 0));
                spawnMapEditObject("zombiespawn", (-1851.727, 884.9335, 272.324), (0, 108.9226, 0));
                spawnMapEditObject("randombox", (-1104.308, 1705.163, 136.8962), (0, 23.89941, 0), (-2014.882, 1063.411, 298.713), (0, -242.7992, 0), (-2408.513, 1222.085, 303.6483), (0, -244.2164, 0), (-57.00866, 2023.856, 283.0481), (0, -72.97801, 0));
                spawnMapEditObject("invisiblewall", (-2068.759, 815.5958, 289.998), (-1787.396, 986.2704, 410.0895));
                spawnMapEditObject("wall", (-534.7209, 708.4297, 147.055), (-385.4437, 814.7124, 264.4992));
                spawnMapEditObject("invisiblewall", (14.40727, 1908.703, 268.4889), (-241.1476, 1857.77, 394.9895));
                spawnMapEditObject("mapname", "Death Bridge");
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("model", "afr_twig_fence_02a", (0, 1915, 264), (0, 20, 0));
                spawnMapEditObject("model", "afr_twig_fence_02a", (-100, 1885, 264), (0, 20, 0));
                spawnMapEditObject("model", "afr_twig_fence_02a", (-200, 1860, 264), (0, 20, 0));
                spawnMapEditObject("model", "afr_twig_fence_02a", (-1790, 975, 270), (0, 30, 0));
                spawnMapEditObject("model", "afr_twig_fence_02a", (-1900, 920, 270), (0, 30, 0));
                spawnMapEditObject("model", "afr_twig_fence_02a", (-2010, 860, 270), (0, 30, 0));
            }
        break;
        //Classic maps
        case "mp_afghan":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("invisiblewall", (-2135,-62,-1440), (-2209,43,-1297));
                spawnMapEditObject("invisiblewall", (-3501,567,-1443), (-3410,1545,-1233));
                spawnMapEditObject("radiation", (-2110,-1344,-1444), 170, 150);//Hurt area
                spawnMapEditObject("randombox", (-1672,-1081,-1444), (0,44,0), (-3434,1581,-1443), (0,115,0), (-2629,-267,-1439), (0,79,0), (-2755,-1177,-1440), (0,73,0));
                spawnMapEditObject("power", (-3136,41,-1446), (0,333,0));
                spawnMapEditObject("bank", (-2928,-417,-1444), (0,123,0));
                spawnMapEditObject("ammo", (-2710,-424,-1444), (0,34,0));
                spawnMapEditObject("gambler", (-2199,-28,-1444), (0,313,0));
                spawnMapEditObject("killstreak", (-2692,-1314,-1301), (0,168,0));
                spawnMapEditObject("pap", (-2841,-394,-1332), (0,120,0));
                spawnMapEditObject("perk1", (-3822,1390,-1448), (0,185,0));
                spawnMapEditObject("perk2", (-3499,920,-1448), (0,282,0));
                spawnMapEditObject("perk3", (-2502,-13,-1444), (0,7,0));
                spawnMapEditObject("perk4", (-3481,-342,-1448), (0,8,0));
                spawnMapEditObject("perk5", (-3420,379,-1448), (0,280,0));
                spawnMapEditObject("perk6", (-2863,-195,-1445), (0,246,0));
                spawnMapEditObject("perk7", (-3541,-511,-1448), (0,343,0));
                spawnMapEditObject("spawn", (-2084,-708,-1439), (0, randomIntRange(136,212), 0));
                spawnMapEditObject("spawn", (-1941,-886,-1440), (0, randomIntRange(136,212), 0));
                spawnMapEditObject("spawn", (-2157,-371,-1440), (0, randomIntRange(136,212), 0));
                spawnMapEditObject("spawn", (-2347,-748,-1440), (0, randomIntRange(136,212), 0));
                spawnMapEditObject("zombiespawn", (-3883,-553,-1448), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-3975,3,-1448), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-3828,-1164,-1448), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-4523,1006,-1449), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-4422,1209,-1449), (0, 0, 0));
                spawnMapEditObject("mapname", "Desert Wasteland");
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("fallLimit", -1585);

                deleteDeathTriggers();
            }
        break;
        case "mp_boneyard":
        if (level.mapVariation == 0)
            {
                spawnMapEditObject("randombox", (167,-1775,-124),(0,105,0));
                spawnMapEditObject("power", (88,-2355,-119),(0,120,0));
                spawnMapEditObject("bank", (314,-2309,-124),(0,131,0));
                spawnMapEditObject("ammo", (-56,-1799,-120),(0,100,0));
                spawnMapEditObject("gambler", (960,-1661,-51),(0,90,0));
                spawnMapEditObject("killstreak", (248,-3140,-77),(0,293,0));
                spawnMapEditObject("pap", (-537,-2008,-88),(0,90,0));
                spawnMapEditObject("perk1", (1301,-2258,-51),(0,0,0));
                spawnMapEditObject("perk2", (-122,-875,-108),(0,90,0));
                spawnMapEditObject("perk3", (-370,-756,-65),(0,0,0));
                spawnMapEditObject("perk4", (-261,-3077,-68),(0,31,0));
                spawnMapEditObject("perk5", (-875,-1093,-84),(0,163,0));
                spawnMapEditObject("perk6", (-553,-756,-76),(0,0,0));
                spawnMapEditObject("perk7", (-565,-2420,0),(0,70,0));
                spawnMapEditObject("spawn", (124,-810,-124), (0, 270, 0));
                spawnMapEditObject("spawn", (71,-810,-124), (0, 270, 0));
                spawnMapEditObject("spawn", (7,-813,-124), (0, 270, 0));
                spawnMapEditObject("spawn", (-42,-811,-123), (0, 270, 0));
                spawnMapEditObject("zombiespawn", (-674,-3297,-12), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (1287,-2771,-52), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (1268,-2908,-52), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (1205,-2046,-52), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (1440,-4082,-52), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-1036,-3259,-12), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-1212,-2318,-7), (0, 0, 0));
                spawnMapEditObject("mapname", "Deserted Entrance");
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("fallLimit", -200);
            }
        break;
        case "mp_brecourt":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("invisiblewall", (10694,6956,1545),(10693,7477,1600));
                spawnMapEditObject("teleport", (10703,6942,358),(11371,7212,1486));//Teleporter
                spawnMapEditObject("teleport", (10713,7023,1486),(9845,7341,358));//Teleporter2
                
                spawnMapEditObject("randombox", (10113,7044,358),(0,90,0));
                spawnMapEditObject("power", (10113,7198,358),(0,90,0));
                spawnMapEditObject("bank", (10113,7327,358),(0,90,0));
                spawnMapEditObject("ammo", (9480,6527,358),(0,90,0));
                spawnMapEditObject("ammo", (10901,7439,1481),(0,0,0));
                spawnMapEditObject("gambler", (10113,8312,358),(0,90,0));
                spawnMapEditObject("killstreak", (10360,6935,353),(0,0,0));
                spawnMapEditObject("pap", (10727,7210,1486),(0,90,0));
                spawnMapEditObject("perk1", (10528,6222,358),(0,0,0));
                spawnMapEditObject("perk2", (10374,6224,358),(0,0,0));
                spawnMapEditObject("perk3", (9983,6227,358),(0,0,0));
                spawnMapEditObject("perk4", (11909,7442,1486),(0,0,0));
                spawnMapEditObject("perk5", (10241,6224,358),(0,0,0));
                spawnMapEditObject("perk6", (10116,6224,358),(0,0,0));
                spawnMapEditObject("perk7", (11911,6989,1486),(0,0,0));
                spawnMapEditObject("spawn", (10943,7200,1486), (0, 0, 0));
                spawnMapEditObject("spawn", (9958,7285,358), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (10961,6828,358), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (10955,6688,358), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (9850,8886,358), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (9693,8883,358), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (12867,7423,1486), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (12856,7070,1486), (0, 0, 0));
                spawnMapEditObject("mapname", "Apartment Rooftops");
                spawnMapEditObject("fallLimit", 0);
                spawnMapEditObject("maxWave", 30);
            }
        break;
        case "mp_checkpoint":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("randombox", (2740,2738,8),(0,90,0));
                spawnMapEditObject("power", (2597,2610,3),(0,0,0));
                spawnMapEditObject("bank", (2361,2807,11),(0,90,0));
                spawnMapEditObject("ammo", (2582,2892,8),(0,0,0));
                spawnMapEditObject("gambler", (2701,2889,3),(0,0,0));
                spawnMapEditObject("killstreak", (2377,3162,11),(0,90,0));
                spawnMapEditObject("pap", (2588,2714,3),(0,90,0));
                spawnMapEditObject("perk1", (2490,2216,12),(0,90,0));
                spawnMapEditObject("perk7", (2364,2267,11),(0,90,0));
                spawnMapEditObject("spawn", (2367,1941,47), (0, 90, 0));
                spawnMapEditObject("spawn", (2485,1943,47), (0, 90, 0));
                spawnMapEditObject("spawn", (2435,2052,21), (0, 90, 0));
                spawnMapEditObject("zombiespawn", (2584,5298,0), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2280,5295,0), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-42,3239,16), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-39,3020,16), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (4030,2730,0), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (4083,3150,0), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-68,2785,19), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (4308,2511,3), (0, 0, 0));
                spawnMapEditObject("mapname", "Shipping Dock");
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("fallLimit", -50);
            }
        break;
        case "mp_derail":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("invisiblewall", (1506,1760,130), (1501,1462,244));
                spawnMapEditObject("invisiblewall", (1671,3064,130),(1600,2944,244));
                spawnMapEditObject("invisiblewall", (2711,1122,130),(2523,1152,244));
                spawnMapEditObject("invisiblewall", (2713,3136,142),(2520,3131,244));
                spawnMapEditObject("invisiblewall", (1680,3110,158),(1687,3345,227));
                spawnMapEditObject("crate", (2346,3447,294),(0,0,0));
                spawnMapEditObject("crate", (2346,3447,250),(0,0,0));
                spawnMapEditObject("crate", (2346,3447,350),(0,0,0));
                spawnMapEditObject("crate", (1884,3190,456),(0,90,0));
                spawnMapEditObject("crate", (1884,3190,500),(0,90,0));
                spawnMapEditObject("crate", (1884,3190,550),(0,90,0));
                spawnMapEditObject("crate", (1884,3254,450),(0,90,0));
                spawnMapEditObject("crate", (1884,3254,500),(0,90,0));
                spawnMapEditObject("crate", (1884,3254,550),(0,90,0));
                spawnMapEditObject("crate", (2602,2809,158),(0,0,0));
                spawnMapEditObject("crate", (2602,2809,200),(0,0,0));
                spawnMapEditObject("crate", (2602,2809,250),(0,0,0));
                spawnMapEditObject("crate", (1820,2127,320),(0,90,0));
                spawnMapEditObject("crate", (1820,2127,370),(0,90,0));
                spawnMapEditObject("crate", (1820,2198,320),(0,90,0));
                spawnMapEditObject("crate", (1820,2198,370),(0,90,0));
                spawnMapEditObject("crate", (1683,3186,344),(0,90,0));
                spawnMapEditObject("crate", (1684,3269,344),(0,90,0));

                spawnMapEditObject("randombox", (1790,3371,294),(0,0,0), (2191,2949,158),(0,90,0), (1901,2060,294),(0,0,0));
                spawnMapEditObject("power", (1959,2233,294),(0,90,0));
                spawnMapEditObject("bank", (1738,3371,158),(0,0,0));
                spawnMapEditObject("ammo", (1888,2672,158),(0,90,0));
                spawnMapEditObject("gambler", (1810,3084,158),(0,0,0));
                spawnMapEditObject("killstreak", (2488,2400,153),(0,105,0));
                spawnMapEditObject("pap", (2495,3319,294),(0,90,0));
                spawnMapEditObject("perk1", (2154,2606,282),(0,0,0));
                spawnMapEditObject("perk2", (1824,2450,158),(0,90,0));
                spawnMapEditObject("perk3", (1896,2060,158),(0,0,0));
                spawnMapEditObject("perk4", (2153,3196,425),(0,90,0));
                spawnMapEditObject("perk5", (1824,2308,158),(0,90,0));
                spawnMapEditObject("perk6", (1824,2158,158),(0,90,0));
                spawnMapEditObject("perk7", (2299,2788,153),(0,0,0));
                spawnMapEditObject("spawn", (1759,3281,158), (0, 90, 0));
                spawnMapEditObject("spawn", (1748,3223,158), (0, 90, 0));
                spawnMapEditObject("spawn", (1753,3150,158), (0, 90, 0));
                spawnMapEditObject("spawn", (1826,3156,158), (0, 90, 0));
                spawnMapEditObject("spawn", (1828,3198,158), (0, 90, 0));
                spawnMapEditObject("spawn", (1832,3249,158), (0, 90, 0));
                spawnMapEditObject("spawn", (1974,3267,158), (0, 90, 0));
                spawnMapEditObject("spawn", (1973,3137,158), (0, 90, 0));
                spawnMapEditObject("zombiespawn", (981,3216,192), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (1042,3240,192), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (914,1633,198), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (933,1567,176), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2760,819,186), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2987,823,188), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2541,3475,247), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (1695,2781,129), (0, 0, 0));
                spawnMapEditObject("fallLimit", 100);
                spawnMapEditObject("mapname", "Frozen Warehouse");
                spawnMapEditObject("maxWave", 30);
            }
        break;
        case "mp_estate":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("minefield", (-2276,-1298,-434),55,150);
                spawnMapEditObject("minefield", (-2168,-1125,-369),55,150);

                spawnMapEditObject("randombox", (-3191,-1275,-527),(0,156,0));
                spawnMapEditObject("bank", (-2042,-525,-341),(0,113,0));
                spawnMapEditObject("ammo", (-3473,-814,-575),(0,116,0));
                spawnMapEditObject("gambler", (-2321,-45,-286),(0,0,0));
                spawnMapEditObject("killstreak", (-2067,-901,-333),(0,237,0));
                spawnMapEditObject("pap", (-3591,-749,-527),(0,24,0));
                spawnMapEditObject("spawn", (-2586,-243,-312), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-2602,-2388,-490), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-2698,-2395,-491), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-2771,-2384,-489), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-4069,-5,106), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-4164,-81,100), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-2316,-2096,-610), (0, 0, 0));
                spawnMapEditObject("mapname", "Falls of Hell");
                spawnMapEditObject("maxWave", 20);
                spawnMapEditObject("hellMap", true);
                spawnMapEditObject("fallLimit", -713);

                deleteDeathTriggers();
            }
        break;
        case "mp_favela":
        case "mp_fav_tropical":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("invisiblewall", (2740,2858,250),(3047,3047,469));
                spawnMapEditObject("invisiblewall", (1340,2442,408),(1719,2657,448));
                spawnMapEditObject("invisiblewall", (987,2440,408),(1366,2446,470));
                
                spawnMapEditObject("randombox", (1873,2458,296),(0,207,0));
                spawnMapEditObject("power", (2189,2635,296),(0,207,0));
                spawnMapEditObject("bank", (2034,2829,296),(0,25,0));
                spawnMapEditObject("ammo", (1717,2640,296),(0,25,0));
                spawnMapEditObject("gambler", (2292,2692,296),(0,207,0));
                spawnMapEditObject("killstreak", (1266,2254,327),(0,105,0));
                spawnMapEditObject("pap", (2043,2561,291),(0,207,0));
                spawnMapEditObject("perk1", (2695,3160,291),(0,352,0));
                spawnMapEditObject("perk2", (1756,2400,291),(0,207,0));
                spawnMapEditObject("perk3", (1468,2492,291),(0,25,0));
                spawnMapEditObject("perk4", (2149,2889,291),(0,25,0));
                spawnMapEditObject("perk5", (1572,2310,291),(0,207,0));
                spawnMapEditObject("perk6", (1606,2570,291),(0,25,0));
                spawnMapEditObject("perk7", (1049,2424,292),(0,90,0));
                spawnMapEditObject("spawn", (1505,2348,298), (0, 0, 0));
                spawnMapEditObject("spawn", (1492,2397,298), (0, 0, 0));
                spawnMapEditObject("spawn", (1474,2453,298), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2951,3108,296), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2892,3025,296), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2699,3120,296), (0, 0, 0));
                spawnMapEditObject("mapname", "^1Rundown Town");
                spawnMapEditObject("maxWave", 30);
            }
        break;
        case "mp_highrise":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("ramp", (-2368,10168,2256), (-2368,11271,2256));
                spawnMapEditObject("ramp", (-2368,11271,2256), (-2655,11271,2256));
                spawnMapEditObject("ramp", (-2655,11271,2256), (-2655,10168,2256));
                spawnMapEditObject("ramp", (-2655,10168,2256), (-2368,10168,2256));
                spawnMapEditObject("ramp", (-2525,10916,2192), (-2521,11271,2256));
                spawnMapEditObject("ramp", (-2503,10469,2192), (-2507,10168,2256));
                spawnMapEditObject("randombox", (-1608,9688,2179), (0,90,0), (-1939,10416,2275), (0,0,0), (-942,10876,2179), (0,90,0), (-666,11472,2179), (0,0,0));
                spawnMapEditObject("power", (-2824,11461,2179), (0,90,0));
                spawnMapEditObject("bank", (-2297,9593,2275), (0,0,0));
                spawnMapEditObject("ammo", (-551,11091,2179), (0,90,0));
                spawnMapEditObject("gambler", (-2754,9895,2275), (0,90,0));
                spawnMapEditObject("killstreak", (-1210,10063,2179), (0,0,0));
                spawnMapEditObject("pap", (-1471,10415,2179), (0,0,0));
                spawnMapEditObject("fallLimit", -2200);
                spawnMapEditObject("perk1", (-850,11023,2179), (0,0,0));
                spawnMapEditObject("perk2", (-1642,11089,2179), (0,0,0));
                spawnMapEditObject("perk3", (-1096,10414,2179), (0,90,0));
                spawnMapEditObject("perk4", (-1224,10757,2179), (0,90,0));
                spawnMapEditObject("perk5", (-1458,11087,2179), (0,0,0));
                spawnMapEditObject("perk6", (-1096,10962,2179), (0,90,0));
                spawnMapEditObject("perk7", (-2184,10012,2275), (0,90,0));
                spawnMapEditObject("spawn", (-667,9679,2184), (0, 90, 0));
                spawnMapEditObject("spawn", (-793,9681,2184), (0, 90, 0));
                spawnMapEditObject("spawn", (-912,9683,2184), (0, 90, 0));
                spawnMapEditObject("spawn", (-1078,9684,2184), (0, 90, 0));
                spawnMapEditObject("zombiespawn", (-2727,11367,2275), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-1677,11280,2179), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-1684,11124,2179), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-558,9998,2179), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-2362,11359,2275), (0, 0, 0));
                spawnMapEditObject("mapname", "High Hilton");
                spawnMapEditObject("maxWave", 30);

                deleteDeathTriggers();
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("elevator", (1319,10828,3376), (0,90,0), (1319,10828,4100), (1319,10828,4100));
                spawnMapEditObject("elevator", (1808,11462,4075), (0,0,0), (1808,11462,3376), (1808,11300,3376));
                spawnMapEditObject("elevator", (3000,9943,3376), (0,0,0), (3705,3599,2420), (3705,3550,2420));//Zipline
                spawnMapEditObject("elevator", (4191,3705,2360), (0,0,0), (1681,10073,3429), (1681,10125,3429));//Zipline
                spawnMapEditObject("randombox", (2308,10069,4075), (0,0,0), (1439,10831,3371), (0,90,0), (5066,2931,2355), (0,0,0), (2727,11599,3371), (0,0,0));
                spawnMapEditObject("power", (1451,10172,4075), (0,0,0));
                spawnMapEditObject("bank", (2242,11440,4075), (0,90,0));
                spawnMapEditObject("ammo", (5046,2666,2355), (0,180,0));
                spawnMapEditObject("ammo", (1384,10768,3371), (0,180,0));
                spawnMapEditObject("ammo", (1896,10863,4075), (0,90,0));
                spawnMapEditObject("gambler", (1383,10895,3371), (0,180,0));
                spawnMapEditObject("killstreak", (3513,3144,2355), (0,0,0));
                spawnMapEditObject("pap", (1707,10096,3371), (0,0,0));
                spawnMapEditObject("ramp", (2314,-9299,-287), (2654,-8577,-287));
                spawnMapEditObject("perk1", (1394,11458,4075), (0,0,0));
                spawnMapEditObject("perk2", (4981,3698,2355), (0,0,0));
                spawnMapEditObject("perk3", (2943,11008,3371), (0,90,0));
                spawnMapEditObject("perk4", (2943,10664,3371), (0,90,0));
                spawnMapEditObject("perk5", (3089,3237,2355), (0,90,0));
                spawnMapEditObject("perk6", (2943,10310,3371), (0,90,0));
                spawnMapEditObject("perk7", (1936,10035,3371), (0,0,0));
                spawnMapEditObject("spawn", (1278,10408,3376), (0, 0, 0));
                spawnMapEditObject("spawn", (1337,10648,3376), (0, 0, 0));
                spawnMapEditObject("spawn", (5144,2945,2360), (0, 0, 0));
                spawnMapEditObject("spawn", (5503,2899,2360), (0, 0, 0));
                spawnMapEditObject("spawn", (1320,11286,4080), (0, 0, 0));
                spawnMapEditObject("spawn", (1349,11041,4080), (0, 0, 0));
                spawnMapEditObject("mapname", "The Twin Buildings");
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("fallLimit", -108);

                deleteDeathTriggers();

                highrise_createProgressArea((2208,10676,3371),1500,150,0);
	            highrise_createProgressArea((2230,10895,4075),1500,150,1);
	            highrise_createProgressArea((5074,2460,2355),2500,150,2);
            }
            if (level.mapVariation == 2)
            {
                spawnMapEditObject("randombox", (-8060.7,6789.3,2331.1), (0,0,0), (-9049.5,6786.7,2331.1), (0,0,0), (-8942.2,4284.3,2331.1), (0,225,0), (-9248.9,5427.1,2331.1),(0,90,0));
                spawnMapEditObject("power", (-7898.1,5330.9,2331.1), (0,224.9,0));
                spawnMapEditObject("bank", (-8124.8,5095.5,2331.1), (0,224.9,0));
                spawnMapEditObject("ammo", (-8245.9,6795.1,2331.1), (0,0,0));
                spawnMapEditObject("gambler", (-8471.1,4745.8,2331.1), (0,224.9,0));
                spawnMapEditObject("killstreak", (-8767.7,6789.3,2331.1), (0,0,0));
                spawnMapEditObject("pap", (-8493.3,5516.3,2331.1), (0,0,0));
                spawnMapEditObject("perk1", (-8767.5,5348.4,2331.1), (0,0,0));
                spawnMapEditObject("perk2", (-8642.2,5469.6,2331.1), (0,90,0));
                spawnMapEditObject("perk3", (-8487.1,5452.1,2331.1), (0,0,0));
                spawnMapEditObject("perk4", (-9728,6049,2331), (0,90,0));
                spawnMapEditObject("perk5", (-8666.7,5587.1,2331.1), (0,0,0));
                spawnMapEditObject("perk6", (-8791.6,5474.1,2331.1), (0,90,0));
                spawnMapEditObject("perk7", (-8443,5731,2331), (0,0,0));
                spawnMapEditObject("spawn", (-7981,5599,2331), (0, 180, 0));
                spawnMapEditObject("spawn", (-7976,5762,2331), (0, 180, 0));
                spawnMapEditObject("spawn", (-7977,5979,2331), (0, 180, 0));
                spawnMapEditObject("spawn", (-7980,6285,2331), (0, 180, 0));
                spawnMapEditObject("spawn", (-7950,6566,2331), (0, 180, 0));
                spawnMapEditObject("spawn", (-7962,6746,2331), (0, 180, 0));
                spawnMapEditObject("spawn", (-8206,5374,2331), (0, 180, 0));
                spawnMapEditObject("zombiespawn", (-10570.8,3467.6,2331.1), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-10585.3,4465.4,2331.1), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-10584.8,5087.2,2331.1), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-10582.4,5734.4,2331.1), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-10585.2,6343.9,2331.1), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-10590.7,6788.7,2331.1), (0, 0, 0));
                spawnMapEditObject("mapname", "Sunset ^5Infestation");
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("fallLimit", -2200);

                deleteDeathTriggers();
            }
            if (level.mapVariation == 3)
            {
                spawnMapEditObject("ramp", (-14404,7069.8,5300), (-14380,6890.9,5419.1));

                spawnMapEditObject("randombox", (-13630.1,3855.1,5439.1), (0,0,0), (-14032.2,7520.0,5391.1), (0,35,0), (-15771.6,6051.3,5439.1), (0,90,0), (-14614.7,7443.9,5386.1),(0,33,0));
                spawnMapEditObject("power", (-12808.9,3855.1,5439.1), (0,0,0));
                spawnMapEditObject("bank", (-15781.4,4024.6,5439.1), (0,90,0));
                spawnMapEditObject("ammo", (-13051.8,3855.1,5439.1), (0,0,0));
                spawnMapEditObject("gambler", (-15781.4,4223.6,5439.1), (0,90,0));
                spawnMapEditObject("killstreak", (-15781.4,5044.6,5439.1), (0,90,0));
                spawnMapEditObject("pap", (-8493.3,5516.3,2331.1), (0,0,0));
                spawnMapEditObject("perk1", (-12757.6,5044.7,5439.1), (0,90,0));
                spawnMapEditObject("perk2", (-12757.6,4640.9,5439.1), (0,90,0));
                spawnMapEditObject("perk3", (-12757.6,4033.2,5439.1), (0,90,0));
                spawnMapEditObject("perk4", (-14593,5474,5434), (0,0,0));
                spawnMapEditObject("perk5", (-12757.6,4373.7,5439.1),(0,90,0));
                spawnMapEditObject("perk6", (-12757.6,4232.4,5439.1), (0,90,0));
                spawnMapEditObject("perk7", (-14313,3862,5434), (0,0,0));
                spawnMapEditObject("spawn", (-14749.7,3934,5439.1), (0, 180, 0));
                spawnMapEditObject("spawn", (-14530.5,3917,5439.1), (0, 180, 0));
                spawnMapEditObject("zombiespawn", (-12790.8,6852.1,5439.1), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-13306.1,6843.3,5439.1), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-13634.1,6833.1,5439.1), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-14091.3,6824.7,5439.1), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-15127.1,6834.4,5439.1), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-15743.5,6837.2,5439.1), (0, 0, 0));
                spawnMapEditObject("mapname", "Infestation");
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("fallLimit", -2200);

                deleteDeathTriggers();
            }
        break;
        case "mp_nightshift":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("invisiblewall", (-760.1, -918.8, 12.1), (-760.1, -918.8, 100.9));
                spawnMapEditObject("invisiblewall", (-856.2, 343.4, 152.1), (-856.8, 235.9, 235.9));
                spawnMapEditObject("invisiblewall", (-152.7, 719.5, 101.2), (55.9, 722.2, 236.8));
                spawnMapEditObject("invisiblewall", (-266.6, -720.1, 16.1), (-266.6, -767.9, 100.0));
                spawnMapEditObject("invisiblewall", (-2.1, -1840.1, 16.1), (-5.5, -1935.7, 111.8));
                spawnMapEditObject("invisiblewall", (-647.9, -1676.0, 152.1), (-536.1, -1676.3, 253.9));

                spawnMapEditObject("randombox", (-2000.1,-366.9,144.1),(0,90,0), (-2356.7,-912.9,139.1),(0,0,0), (-1176.0,-1986.6,11.1),(0,180,0), (-1432.0,-192.9,3.1),(0,180,0));
                level.boxLocations[level.boxLocations.size] = [(-1414.8,-1984.9,3.1),(0,180,0)];
                spawnMapEditObject("power", (88,-2355,-119),(0,120,0));
                spawnMapEditObject("bank", (-2082.8,-1556.8,-39.9),(0,0,0));
                spawnMapEditObject("ammo", (-2281.3,267.9,32.1),(0,0,0));
                spawnMapEditObject("gambler", (-2496.9,-433.0,139.1),(0,90,0));
                spawnMapEditObject("killstreak", (-1087,155,8),(0,0,0));
                spawnMapEditObject("pap", (-2016.4,-50.8,8.1),(0,90,0));
                spawnMapEditObject("perk1", (-752.6,-883.2,12.2),(0,0,0));
                spawnMapEditObject("perk2", (-496.1,-1728.4,152.1),(0,90,0));
                spawnMapEditObject("perk3", (-1576.1,-2213.3,27.1),(0,90,0));
                spawnMapEditObject("perk4", (-1757,304,3),(0,0,0));
                spawnMapEditObject("perk5", (-318.6,-2023.9,16.1),(0,0,0));
                spawnMapEditObject("perk6", (-1328.1,-1864.5,8.1),(0,90,0));
                spawnMapEditObject("perk7", (-1968,-292,3),(0,90,0));
                spawnMapEditObject("spawn", (-2387.2, -350.7, 144.1), (0, 0, 0));
                spawnMapEditObject("spawn", (-2349.1, -793.4, 144.1), (0, 0, 0));
                spawnMapEditObject("spawn", (-2215.3, 203.2, 32.1), (0, 0, 0));
                spawnMapEditObject("spawn", (-1596.6, -17.4, 8.1), (0, 0, 0));
                spawnMapEditObject("spawn", (-1728.4, -533.1, 8.1), (0, 0, 0));
                spawnMapEditObject("spawn", (-1202.0, -1668.5, 16.1), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-103.6,-1894.1,11.1), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (48.9,927.4,91.1), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (48.9,805.9,91.1), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-1856.9,-2192.3,11.9), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-1803.5,-2203.2,16.1), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-323.3,-713.0,7.1), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-364.8,-538.5,7.1), (0, 0, 0));
                spawnMapEditObject("mapname", "Sunrise Apartments");
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("fallLimit", -200);
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("invisiblewall", (-760,-918,12),(-760, -918, 100));
                spawnMapEditObject("invisiblewall", (-856,343,152),(-856, 235, 235));
                spawnMapEditObject("invisiblewall", (-152,719,101),(55, 722, 236));
                spawnMapEditObject("invisiblewall", (-266,-720,16),(-266, -767, 100.0));
                spawnMapEditObject("invisiblewall", (-685,-1840,16),(-684,-1935,111));
                spawnMapEditObject("invisiblewall", (-647,-1676,152),(-536, -1676, 253));
                spawnMapEditObject("invisiblewall", (-197,-275,200),(-200,-448,263));
                spawnMapEditObject("invisiblecrate", (-126,-458,214),(0, 0, 0));
                spawnMapEditObject("elevator", (822,-1730,190), (0,0,0),(1785,-43,223), (1825,-43,223));//Zipline

                spawnMapEditObject("randombox", (1965,-500,16),(0,90,0), (1574,426,24),(0,90,0), (505,-734,11),(0,90,0), (865,-2096,43),(0,180,0));
                level.boxLocations[level.boxLocations.size] = [(1631,-770,119),(0,90,0)];
                spawnMapEditObject("power", (-185,96,16),(0,90,0));
                spawnMapEditObject("bank", (-2082,-1556,-39),(0,0,0));
                spawnMapEditObject("ammo", (1772,-284,16),(0,0,0));
                spawnMapEditObject("gambler", (1818,-185,227),(0,0,0));
                spawnMapEditObject("killstreak", (543,-696,11),(0,90,0));
                spawnMapEditObject("pap", (1947,309,119),(0,360,0));
                spawnMapEditObject("perk1", (1867,186,224),(0,245,0));
                spawnMapEditObject("perk2", (615,-112,19),(0,180,0));
                spawnMapEditObject("perk3", (31,-991,11),(0,0,0));
                spawnMapEditObject("perk4", (-309,-2016,11),(0,0,0));
                spawnMapEditObject("perk5", (504,-912,11),(0,90,0));
                spawnMapEditObject("perk6", (827,-1799,43),(0,0,0));
                spawnMapEditObject("perk7", (1104,-2112,43),(0,90,0));
                spawnMapEditObject("spawn", (793.4,-1855.6,192.1), (0, 90, 0));
                spawnMapEditObject("spawn", (887.7,-1855.2,192.1), (0, 90, 0));
                spawnMapEditObject("spawn", (1006.8,-1854.7,192.1), (0, 90, 0));
                spawnMapEditObject("spawn", (1068.2,-1851.8,192.1),(0, 90, 0));
                spawnMapEditObject("spawn", (1045,-2027.6,192.1), (0, 90, 0));
                spawnMapEditObject("spawn", (1029.6,-2112.3,192.1), (0, 90, 0));
                spawnMapEditObject("zombiespawn", (-610,-1922,16), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (1904,-1258,3), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-205,-745,16), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-107,672,24), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-6,593,24), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-611,-1873,16), (0, 0, 0));
                spawnMapEditObject("mapname", "Rundown Apartments");
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("fallLimit", -200);
            }
            if (level.mapVariation == 2)
            {
                spawnMapEditObject("invisiblewall", (2057,-3601,0),(1576,-3623,200));
                spawnMapEditObject("invisiblecrate", (2032,-833,16),(0,180,0));
                spawnMapEditObject("invisiblecrate", (2032,-833,50),(0,180,0));
                spawnMapEditObject("invisiblecrate", (2032,-833,100),(0,180,0));

                spawnMapEditObject("randombox", (2040,-1266,16),(0,90,0), (1590,-1393,8),(0,90,0), (1830,-2360,4),(0,0,0));
                spawnMapEditObject("power", (1584,-1842,16),(0,90,0));
                spawnMapEditObject("bank", (1825,-1967,8),(0,0,0));
                spawnMapEditObject("ammo", (1608,-1247,8),(0,90,0));
                spawnMapEditObject("gambler", (1792,-1580,8),(0,90,0));
                spawnMapEditObject("killstreak", (1591,-2068,11),(0,90,0));
                spawnMapEditObject("pap", (1834,-2794,8),(0,0,0));
                spawnMapEditObject("perk1", (1576,-2863,16),(0,90,0));
                spawnMapEditObject("perk2", (1576,-2521,16),(0,90,0));
                spawnMapEditObject("perk3", (2023,-1613,16),(0,90,0));
                spawnMapEditObject("perk4", (1828,-2283,134),(0,0,0));
                spawnMapEditObject("perk5", (2023,-1990,16),(0,90,0));
                spawnMapEditObject("perk6", (2022,-1792,16),(0,90,0));
                spawnMapEditObject("perk7", (1787,-1748,3),(0,90,0));
                spawnMapEditObject("spawn", (1602,-847,16), (0, 270, 0));
                spawnMapEditObject("spawn", (1653,-851,16), (0, 270, 0));
                spawnMapEditObject("spawn", (1724,-855,16), (0, 270, 0));
                spawnMapEditObject("spawn", (1816,-861,16), (0, 270, 0));
                spawnMapEditObject("spawn", (1889,-862,16), (0, 270, 0));
                spawnMapEditObject("spawn", (1952,-862,16), (0, 270, 0));
                spawnMapEditObject("zombiespawn", (1963,-3377,8), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (1740,-3359,16), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (1666,-3366,16), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (1599,-3368,16), (0, 0, 0));
                spawnMapEditObject("mapname", "River Canal");
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("fallLimit", -200);
            }
        break;
        case "mp_invasion":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("randombox", (2335,12023,11),(0,90,0));
                spawnMapEditObject("power", (2403,12760,11),(0,0,0));
                spawnMapEditObject("bank", (2471,11593,11),(0,90,0));
                spawnMapEditObject("ammo", (2335,11223,11),(0,90,0));
                spawnMapEditObject("gambler", (2472,10874,11),(0,90,0));
                spawnMapEditObject("killstreak", (2335,11788,11),(0,90,0));
                spawnMapEditObject("pap", (2403,12760,11),(0,0,0));
                spawnMapEditObject("perk1", (2472,10567,11),(0,90,0));
                spawnMapEditObject("perk2", (2335,10865,11),(0,90,0));
                spawnMapEditObject("perk3", (2335,12127,11),(0,90,0));
                spawnMapEditObject("perk4", (2335,10182,11),(0,90,0));
                spawnMapEditObject("perk5", (2476,11173,11),(0,90,0));
                spawnMapEditObject("perk6", (2335,11544,11),(0,90,0));
                spawnMapEditObject("perk7", (2474,10170,11),(0,90,0));
                spawnMapEditObject("spawn", (2411,12662,11), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (4707,12271,4), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (4656,11899,9), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (4139,11325,-37), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2401,8462,16), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2460,8366,16), (0, 0, 0));
                spawnMapEditObject("mapname", "Dam Sea");
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("fallLimit", 0);
            }
        break;
        case "mp_quarry":
            if (level.mapVariation == 0)
            {
                //Additions for map bounds
                spawnMapEditObject("invisiblewall", (-1850, 690, 0),(-2289, 665, 175));
                spawnMapEditObject("crate", (-2495, 677, 190),(0, 0, 0));
                spawnMapEditObject("crate", (-3320, 1452, 25),(0, 0, 0));
                spawnMapEditObject("crate", (-3320, 1452, 75),(0, 0, 0));
                spawnMapEditObject("crate", (-5450, 1793, 110),(0, 0, 0));
                spawnMapEditObject("crate", (-5450, 1793, 150),(0, 0, 0));
                spawnMapEditObject("crate", (-5450, 1793, 190),(0, 0, 0));
                spawnMapEditObject("crate", (-5130, 1798, 110),(0, 0, 0));
                spawnMapEditObject("crate", (-5130, 1798, 150),(0, 0, 0));
                spawnMapEditObject("invisiblewall", (-4591, 2057, -50),(-4103, 1908, 200));
                spawnMapEditObject("invisiblewall", (-3791, 1525, 125),(-4110, 1525, 200));
                spawnMapEditObject("invisiblewall", (-4090, 1515, 125),(-4090, 1875, 200));

                spawnMapEditObject("ramp", (-1634.4,1019.0,20.1),(-1623.5,823.6,176.1));
                
                spawnMapEditObject("randombox", (-1462.1,2046.0,171.1),(0,90,0));
                spawnMapEditObject("power", (-4825.4,1997.4,187.1),(0,90,0));
                spawnMapEditObject("bank", (-3362.6,1901.5,163.2),(0,90,0));
                spawnMapEditObject("ammo", (-1832.9,2074.2,171.1),(0,90,0));
                spawnMapEditObject("gambler", (-1431.1,1693.2,35.1),(0,90,0));
                spawnMapEditObject("killstreak", (-1678,2152,171),(0,0,0));
                spawnMapEditObject("pap", (-1839.9,768.7,169.5),(0,90,0));
                spawnMapEditObject("perk1", (-1424.1,778.7,171.5),(0,90,0));
                spawnMapEditObject("perk2", (-2020.9,1687.1,35.1),(0,0,0));
                spawnMapEditObject("perk3", (-1660.2,727.1,35.1),(0,0,0));
                spawnMapEditObject("perk4", (-2658,2767,84),(0,0,0));
                spawnMapEditObject("perk5", (-1815.1,2789.7,84.9),(0,90,0));
                spawnMapEditObject("perk6", (-2395.3,1288.9,31.1),(0,0,0));
                spawnMapEditObject("perk7", (-1565,727,169),(0,0,0));
                spawnMapEditObject("spawn", (-1725.1, 2015, 176.1), (0, 0, 0));
                spawnMapEditObject("spawn", (-1662.3, 2050, 176.1), (0, 0, 0));
                spawnMapEditObject("spawn", (-1621.4, 1213.7, 40.1), (0, 0, 0));
                spawnMapEditObject("spawn", (-1625.4, 1099.8, 40.1), (0, 0, 0));
                spawnMapEditObject("spawn", (-1620.0, 825, 40.1), (0, 0, 0));
                spawnMapEditObject("spawn", (-2564.1, 942.0, 40.1), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-5450.5,2040.9,98.4), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-5299.9,2052.6,96.5), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-4564.2,3020.4,81.6), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-2071.8,765.1,29), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-2208.5,762.4,28.8), (0, 0, 0));
                spawnMapEditObject("mapname", "Construction Graveyard");
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("fallLimit", -300);
            }
        break;
        case "mp_rundown":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("model", "foliage_tree_palm_bushy_1", (984,2536,75),(0,90,0));//Tree1
                spawnMapEditObject("model", "foliage_pacific_fern01_animated", (984,2536,75),(0,90,0));//Tree2
                //Tree collision
                spawnMapEditObject("invisiblecrate", (984,2536,100), (90, 0, 0));
                spawnMapEditObject("invisiblecrate", (984,2536,160), (90, 0, 0));
                spawnMapEditObject("zipline", (1403,3316,75), (0,0,0), (1638, 3308,252), (1630, 2414,252), (1052, 2402,130), (1047, 2902,96), (1009, 3261,130));

                spawnMapEditObject("invisiblewall", (1536,2303,50),(1472,2300,200));
                spawnMapEditObject("invisiblewall", (695,2131,50),(495,2174,200));
                spawnMapEditObject("invisiblewall", (304,2327,100),(163,2936,250));
                spawnMapEditObject("randombox", (1407,2651,77), (0,0,0));
                spawnMapEditObject("power", (497,3358,59),(0,0,0));
                spawnMapEditObject("bank", (1496,3056,77),(0,90,0));
                spawnMapEditObject("ammo", (830,2953,75),(0,90,0));
                spawnMapEditObject("gambler", (1215,2988,77),(0,0,0));
                spawnMapEditObject("killstreak", (1535,2699,75),(0,90,0));
                spawnMapEditObject("pap", (1236,2644,82),(0,0,0));
                spawnMapEditObject("perk1", (1708,3040,73),(0,90,0));
                spawnMapEditObject("perk2", (1279,3028,82),(0,0,0));
                spawnMapEditObject("perk3", (1426,3187,82),(0,0,0));
                spawnMapEditObject("perk4", (391,2320,134),(0,0,0));
                spawnMapEditObject("perk5", (1366,3028,82),(0,0,0));
                spawnMapEditObject("perk6", (1343,3187,82),(0,0,0));
                spawnMapEditObject("perk7", (963,2919,80),(0,90,0));
                spawnMapEditObject("spawn", (1432, 2922, 82), (0, 0, 0));
                spawnMapEditObject("spawn", (1238, 2876, 82), (0, 0, 0));
                spawnMapEditObject("spawn", (1327, 3112, 82), (0, 0, 0));
                spawnMapEditObject("spawn", (1425, 3098, 82), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (445,1859,121), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (1581,2081,-5), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-86,2560,146), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (117,2234,213), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (514,3748,41), (0, 0, 0));
                spawnMapEditObject("mapname", "Old Shack");
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("fallLimit", -50);
            }
        break;
        case "mp_rust":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("invisiblewall", (-579.5,-9976.5,-290.5), (-1192,-9332.6,0));
                spawnMapEditObject("invisiblewall", (3281.4,-10772.8,-271.1), (3136.1,-9614.3,-73.2));
                spawnMapEditObject("randombox", (2749.3,-9489.3,-271.5), (0,-25.1,0));
                spawnMapEditObject("power", (1477.0,-10211.9,-162.4), (0,162.4,0));
                spawnMapEditObject("bank", (515.5,-10056.6,-67.3), (0,172.1,0));
                spawnMapEditObject("ammo", (1777.3,-10392.6,-201.5), (0,155,0));
                spawnMapEditObject("gambler", (2630.3,-9443.5,-276.5), (0,340.8,0));
                spawnMapEditObject("killstreak", (1402,-9884,-177), (0,90,0));
                spawnMapEditObject("pap", (2649,-8583,-261), (0,329,0));
                spawnMapEditObject("ramp", (2314,-9299,-287), (2654,-8577,-287));
                spawnMapEditObject("perk1", (-161.8,-10090.0,-155.0), (0,177.6,0));
                spawnMapEditObject("perk2", (756.5,-10078.5,-89.8), (0,180,0));
                spawnMapEditObject("perk3", (1637.8,-9032.8,-274.2), (0,341.8,0));
                spawnMapEditObject("perk4", (1885,-10492,-216), (0,138,0));//AmmoMatic
                spawnMapEditObject("perk5", (3161.6,-10811.7,-176.2), (0,206.2,0));//Stopping Power
                spawnMapEditObject("perk6", (2176.6,-9246.8,-274.8), (0,335.1,0));
                spawnMapEditObject("perk7", (1673,-10304,-187), (0,140,0));
                spawnMapEditObject("spawn", (3024.5, -10978.9, -162.1), (0, 0, 0));
                spawnMapEditObject("spawn", (3028.6, -10879.9, -163.5), (0, 0, 0));
                spawnMapEditObject("spawn", (2658.2, -10886.8, -197.9), (0, 0, 0));
                spawnMapEditObject("spawn", (2551.0, -10848.2, -208.7), (0, 0, 0));
                spawnMapEditObject("spawn", (2408.1, -10792.0, -212.0), (0, 0, 0));
                spawnMapEditObject("spawn", (2683.5, -10662.4, -201.8), (0, 0, 0));
                //spawnMapEditObject("zombiespawn", (3703,-6900,-220), (0, 0, 0));
                //spawnMapEditObject("zombiespawn", (2638,-6917,-258), (0, 0, 0));
                //spawnMapEditObject("zombiespawn", (2524,-6328,-231), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (4281,-10529,-162), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (4489,-10224,-199), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-1342,-9528,-243), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-1294,-9813,-191), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-1165,-9661,-213), (0, 0, 0));
                spawnMapEditObject("mapname", "Raging River");
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("fallLimit", -429);
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("floor", (1302,-6124,-286), (936,-6674,-281));
                spawnMapEditObject("floor", (1338,-5722,-286), (929,-5392,-281));
                spawnMapEditObject("ramp", (1184,-6110,-286), (1174,-5741,-286));
                spawnMapEditObject("ramp", (1370,-5368,-270), (1597,-5147,-255));
                spawnMapEditObject("randombox", (1138,-5393,-255), (0,0,0));
                spawnMapEditObject("power", (1783,-4733,-163), (0,90,0));
                spawnMapEditObject("bank", (1106,-6128,-255), (0,0,0));
                spawnMapEditObject("ammo", (1092,-6437,-255), (0,0,0));
                spawnMapEditObject("gambler", (924,-6453,-255), (0,90,0));
                spawnMapEditObject("pap", (1580,-4481,-147), (0,0,0));
                spawnMapEditObject("perk1", (1353,-5549,-255), (0,90,0));
                spawnMapEditObject("perk3", (914,-5550,-255), (0,90,0));
                spawnMapEditObject("perk7", (1317,-6359,-255), (0, 90,0));
                spawnMapEditObject("spawn", (1444,-4791,-139), (0, 270, 0));
                spawnMapEditObject("spawn", (1595,-4899,-172), (0, 270, 0));
                spawnMapEditObject("spawn", (1239,-4898,-196), (0, 270, 0));
                spawnMapEditObject("spawn", (1479,-4565,-160), (0, 270, 0));
                spawnMapEditObject("spawn", (1712,-4699,-163), (0, 270, 0));
                spawnMapEditObject("spawn", (1279,-5597,-255), (0, 270, 0));
                spawnMapEditObject("spawn", (986,-5643,-255), (0, 270, 0));
                spawnMapEditObject("spawn", (1152,-5514,-255), (0, 270, 0));
                spawnMapEditObject("spawn", (1178,-5915,-255), (0, 270, 0));
                spawnMapEditObject("spawn", (1004,-6355,-255), (0, 270, 0));
                spawnMapEditObject("spawn", (998,-6475,-255), (0, 270, 0));
                spawnMapEditObject("spawn", (1154,-6598,-255), (0, 270, 0));
                spawnMapEditObject("spawn", (1195,-6393,-255), (0, 270, 0));
                //spawnMapEditObject("zombiespawn", (532,-9970,-75), (0, 0, 0));
                //spawnMapEditObject("zombiespawn", (842,-10000,-92), (0, 0, 0));
                //spawnMapEditObject("zombiespawn", (1154,-9684,-131), (0, 0, 0));
                //spawnMapEditObject("zombiespawn", (1483,-9520,-164), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-651,-5268,-201), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-712,-5424,-217), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-2660,-6704,-252), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-2775,-7030,-245), (0, 0, 0));
                spawnMapEditObject("mapname", "Raging River Storm");
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("fallLimit", -300);
            }
        break;
        case "mp_subbase":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("model", "vehicle_uaz_winter_destructible", (-340,-3788,16),(0,26,0));//Car1
                spawnMapEditObject("model", getAlliesFlagModel("mp_subbase"), (-336,-3851,73),(0,180,0));//FlagFriendly
                spawnMapEditObject("model", getAxisFlagModel("mp_subbase"), (133,-4008,472),(0,90,0));//FlagEnemy
                spawnMapEditObject("model", "mil_tntbomb_mp", (-323,-3859,47),(90,90,0));//TNTBomb
                spawnMapEditObject("model", "vehicle_mig29_desert", (-959,-4294,-40),(32,90,45));//Mig
                spawnMapEditObject("model", "vehicle_mig29_desert", (-1140,-3913,-211),(32,-90,45));//Mig
                FXFire((-929,-4227,-20));
	            SmokeFx((-930,-4519,92));
	            SmokeFx((-974,-4495,126));
	            LightFxRed((-1106,-4355,192));

                spawnMapEditObject("randombox", (-208,-4142,27),(0,90,0), (-412,-6440,0),(0,0,0));
                spawnMapEditObject("bank", (5040,-1235,-52),(0,90,0));
                spawnMapEditObject("ammo", (-495,-4193,17),(0,90,0));
                spawnMapEditObject("gambler", (-488,-4360,25),(0,90,0));
                spawnMapEditObject("killstreak", (-488,-4677,20),(0,0,0));
                spawnMapEditObject("pap", (-339,-6440,11),(0,0,0));
                spawnMapEditObject("perk7", (-215,-4328,22),(0,90,0));
                spawnMapEditObject("spawn", (-254,-3903,16), (0, 0, 0));
                spawnMapEditObject("spawn", (-326,-3906,16), (0, 0, 0));
                spawnMapEditObject("spawn", (-408,-3905,16), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-422,-6429,16), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-339,-6430,16), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-252,-6434,16), (0, 0, 0));
                spawnMapEditObject("mapname", "Sub Pens of Hell");
                spawnMapEditObject("maxWave", 20);
                spawnMapEditObject("hellMap", true);
                spawnMapEditObject("fallLimit", -150);
            }
        break;
        case "mp_terminal":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("invisiblewall", (2295, 4425, 210), (2695, 4435, 400.2));
                spawnMapEditObject("invisiblewall", (1802,4782, 216),(605, 4781, 267));
                spawnMapEditObject("invisiblewall", (407,4646, 207),(304, 4648, 293));
                spawnMapEditObject("invisiblewall", (1858,4435, 324),(1858, 4046, 419));
                spawnMapEditObject("invisiblewall", (1858,3935, 326),(1858, 3554, 418));
                spawnMapEditObject("invisiblewall", (1913,3429, 200),(2151, 3191, 295));
                spawnMapEditObject("invisiblecrate", (2209,4257,315),(0,180,0));
                spawnMapEditObject("invisiblecrate", (1453,4440,315),(0,0,0));
                spawnMapEditObject("invisiblecrate", (1505,4439,315),(0,0,0));

                spawnMapEditObject("elevator", (1595,3988,315),(0,0,0),(1617,3050,197),(1617,3000,197));//Zipline
                spawnMapEditObject("elevator", (1401,4040,315),(0,90,0),(619,3836,357),(619,3775,357));//Zipline2
                spawnMapEditObject("elevator",(1771,3938,42),(0,0,0),(1791,3945,306), (1726.971, 3997, 306));

                spawnMapEditObject("randombox", (1840,4339,179),(0,90,0));
                spawnMapEditObject("power", (1658,2948,195),(0,190,0));
                spawnMapEditObject("bank", (2038,3294,136),(0,316,0));
                spawnMapEditObject("ammo", (715,2893,56),(0,0,0));
                spawnMapEditObject("gambler", (610,4202,218),(0,180,0));
                spawnMapEditObject("killstreak", (983,4142,51),(0,90,0));
                spawnMapEditObject("pap", (609,2763,213),(0,180,0),(607,2808,213));
                spawnMapEditObject("ramp", (1739.2, -2213.0, 0), (1741.3, -2479, 190.1));
                spawnMapEditObject("perk1", (1761,4215,448),(0,90,0));
                spawnMapEditObject("perk2", (1392,4730,55),(0,90,0));
                spawnMapEditObject("perk3", (550,3062,213),(0,90,0));
                spawnMapEditObject("perk4", (354,4595,201),(0,0,0));
                spawnMapEditObject("perk5", (550,3527,213),(0,90,0));
                spawnMapEditObject("perk6", (673,3059,213),(0,90,0));
                spawnMapEditObject("perk7", (674,4020,213),(0,90,0));
                spawnMapEditObject("spawn", (1503,4095,184), (0, 0, 0));
                spawnMapEditObject("spawn", (1586,4094,184), (0, 0, 0));
                spawnMapEditObject("spawn", (1700,4084,184), (0, 0, 0));
                spawnMapEditObject("spawn", (1773,4079,184), (0, 0, 0));
                spawnMapEditObject("spawn", (1693,4231,184), (0, 0, 0));
                spawnMapEditObject("spawn", (1582,4237,184), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2814,2838,63), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (45,4253,51), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (11,4157,51), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2917,3983,95), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2426,4398,198), (0, 0, 0));
                spawnMapEditObject("mapname", "Airport Invasion");
                spawnMapEditObject("maxWave", 30);
            }
        break;
        case "mp_underpass":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("invisiblewall", (4113,3144,432),(4129,3448,500));
                spawnMapEditObject("invisiblewall", (4129,3448,432),(4008,3468,500));

                spawnMapEditObject("invisiblefloor", (3680, 2659, 400), (3440, 2565, 400));
                spawnMapEditObject("invisiblefloor", (3680, 2659, 450), (3440, 2565, 450));
                spawnMapEditObject("invisiblefloor", (3680, 2659, 500), (3440, 2565, 500));

                spawnMapEditObject("invisiblefloor", (3650, 2520, 400), (3395, 2425, 400));
                spawnMapEditObject("invisiblefloor", (3650, 2520, 450), (3395, 2425, 450));
                spawnMapEditObject("invisiblefloor", (3650, 2520, 500), (3395, 2425, 500));

                spawnMapEditObject("invisiblefloor", (3915, 3125, 400), (3825, 3375, 400));
                spawnMapEditObject("invisiblefloor", (3915, 3125, 450), (3825, 3375, 450));
                spawnMapEditObject("invisiblefloor", (3915, 3125, 500), (3825, 3375, 500));

                spawnMapEditObject("invisiblefloor", (3795, 3195, 400), (3715, 3450, 400));
                spawnMapEditObject("invisiblefloor", (3795, 3195, 450), (3715, 3450, 450));
                spawnMapEditObject("invisiblefloor", (3795, 3195, 500), (3715, 3450, 500));

                spawnMapEditObject("invisiblefloor", (3520, 3365, 400), (3270, 3450, 400));
                spawnMapEditObject("invisiblefloor", (3520, 3365, 450), (3270, 3450, 450));
                spawnMapEditObject("invisiblefloor", (3520, 3365, 50), (3270, 3450, 500));
                
                spawnMapEditObject("randombox", (3975,2304,400),(0,90,0));
                spawnMapEditObject("power", (3655,1726,400),(0,0,0));
                spawnMapEditObject("bank", (3514,2015,400),(0,132,0));
                spawnMapEditObject("ammo", (3545,1552,400),(0,90,0));
                spawnMapEditObject("gambler", (3691,2508,400),(0,90,0));
                spawnMapEditObject("killstreak", (3651,2240,395),(0,325,0));
                spawnMapEditObject("pap", (3732,2105,395),(0,48,0));
                spawnMapEditObject("ramp", (1739.2, -2213.0, 0), (1741.3, -2479, 190.1));
                spawnMapEditObject("perk1", (3015,3354,395),(0,90,0));
                spawnMapEditObject("perk2", (3660,1968,395),(0,46,0));
                spawnMapEditObject("perk3", (3778,1731,395),(0,0,0));
                spawnMapEditObject("perk4", (3495,2273,395),(0,238,0));
                spawnMapEditObject("perk5", (3542,1426,395),(0,90,0));
                spawnMapEditObject("perk6", (4094,1039,427),(0,0,0));
                spawnMapEditObject("perk7", (4164,1904,427),(0,0,0));
                spawnMapEditObject("spawn", (3949,1062,400), (0, 0, 0));
                spawnMapEditObject("spawn", (3843,1059,400), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2811,3147,400), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (3009,2663,424), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2799,2946,395), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (4036,3602,432), (0, 0, 0));
                spawnMapEditObject("mapname", "Shipping Yard");
                spawnMapEditObject("maxWave", 30);
            }
        break;
        case "mp_overgrown":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("minefield", (-1155,-5490,-150),45,150);
                spawnMapEditObject("minefield", (-1480,-5470,-156),45,150);

                spawnMapEditObject("randombox", (-1700,-5439,-148),(0,353,0));
                spawnMapEditObject("bank", (-895,-5439,-157),(0,0,0));
                spawnMapEditObject("ammo", (-1836,-5554,-148),(0,90,0));
                spawnMapEditObject("gambler", (-1287,-5965,-153),(0,223,0));
                spawnMapEditObject("killstreak", (-756,-5439,-159),(0,0,0));
                spawnMapEditObject("pap", (-2788,-6076,-148),(0,90,0));
                spawnMapEditObject("perk1", (-1959,-6334,-156),(0,0,0));
                spawnMapEditObject("perk5", (-1020,-6103,-150), (0, 255, 0));
                spawnMapEditObject("spawn", (-1248,-5481,-153), (0, 245, 0));
                spawnMapEditObject("spawn", (-1317,-5473,-153), (0, 245, 0));
                spawnMapEditObject("spawn", (-1345,-5601,-151), (0, 245, 0));
                spawnMapEditObject("spawn", (-1381,-5589,-157), (0, 245, 0));
                spawnMapEditObject("spawn", (-1617,-5573,-145), (0, 245, 0));
                spawnMapEditObject("spawn", (-1682,-5583,-141), (0, 245, 0));
                spawnMapEditObject("zombiespawn", (-2766,-6210,-143), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-2773,-6079,-143), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-2766,-5974,-143), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-2764,-5577,-144), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-1999,-6752,-143), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-1461,-6547,-144), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-1169,-6295,-144), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-879,-6137,-150), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-1522,-6546,-144), (0, 0, 0));
                spawnMapEditObject("mapname", "Overgrown Hell");
                spawnMapEditObject("maxWave", 20);
                spawnMapEditObject("fallLimit", -243);
                spawnMapEditObject("hellMap", true);
            }
        break;
        case "mp_trailerpark":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("invisiblewall", (246,-2267,96), (252,-2599,171));
                spawnMapEditObject("invisiblewall", (-754,-2247,17), (-1424,-2261,120));
                spawnMapEditObject("randombox", (271.1,-2360.1,11.1), (0,90,0));
                spawnMapEditObject("power", (-105,-1470,4), (0,0,0));
                spawnMapEditObject("bank", (773.1,-2683.9,20.1), (0,0,0));
                spawnMapEditObject("ammo", (2732,-2642,13), (0,90,0));
                spawnMapEditObject("gambler", (858,-2676,15), (0,0,0));
                spawnMapEditObject("killstreak", (2403,-2568,18), (0,90,0));
                spawnMapEditObject("pap", (1958.9,-1706.1,15.4), (0,0,0));
                spawnMapEditObject("ramp", (1739.2, -2213.0, 0), (1741.3, -2479, 190.1));
                spawnMapEditObject("perk1", (1672.3,-2478.2,190.1), (0,90,0));
                spawnMapEditObject("perk2", (2165.5,-2986.4,190.1), (0,-90,0));
                spawnMapEditObject("perk3", (1613.4,-2907.3,190.1), (0, 73.6,0));
                spawnMapEditObject("perk4", (1468,-2950,15), (0, 0, 0));
                spawnMapEditObject("perk5", (1918.2,-3199.3,190.1), (0, 180, 0));
                spawnMapEditObject("perk6", (2124.6,-3191.7,190.1), (0, 180, 0));
                spawnMapEditObject("perk7", (649,-2676,15), (0, 180, 0));
                spawnMapEditObject("spawn", (1887.5, -2864.0, 24.1), (0, 0, 0));
                spawnMapEditObject("spawn", (1649.6, -2695.0, 24.1), (0, 0, 0));
                spawnMapEditObject("spawn", (1798.7, -2614.4, 24.1), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2772.9,-2118.9,16.1), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2785.4,-2068.2,16.1), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2754.0,-1988.4,17.1), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-1299.1,-2064.4,16.0), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-1176.7,-1980.7,16.0), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-1203.7,-2142.3,16.0), (0, 0, 0));
                spawnMapEditObject("mapname", "Abandoned Gas Station");
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("fallLimit", -50);
            }
        break;
        case "mp_compact":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("invisiblewall", (1936.1,2335.9,300.9),(2487.9,2339.0,0.8));
                spawnMapEditObject("invisiblewall", (984.1,2623.8,96.1),(1095.9,2614.9,202.4));
                spawnMapEditObject("invisiblecrate",(3505.8,2665.8,11.1),(0,0,0));
                spawnMapEditObject("invisiblecrate",(3505.8,2665.8,51.1),(0,0,0));
                spawnMapEditObject("invisiblecrate",(3505.8,2665.8,91.1),(0,0,0));
                spawnMapEditObject("invisiblecrate",(2044.4,1984.2,42.1),(0,0,0));
                spawnMapEditObject("invisiblecrate",(1998.0,1986.2,42.1),(0,0,0));
                spawnMapEditObject("invisiblecrate",(1846.3,1989.2,178.1),(0,0,0));
                spawnMapEditObject("invisiblecrate",(1787.8,1982.3,178.1),(0,0,0));
                spawnMapEditObject("invisiblecrate",(1595.5,2060.3,45.1),(0,90,0));
                spawnMapEditObject("ramp", (1957.5,2666.8,0.1),(2027.9,2406.3,130));

                spawnMapEditObject("randombox", (2250.3,3311.6,63.7),(0,0,0));
                spawnMapEditObject("power", (1608.1,2025.3,152.1),(0,90,0));
                spawnMapEditObject("bank", (2103.8,2230.2,16.1),(0,90,0));
                spawnMapEditObject("ammo", (1644.0,3350.7,87.4),(0,0,0));
                spawnMapEditObject("gambler", (1801.2,2000.1,16.1),(0,0,0));
                spawnMapEditObject("killstreak", (1607,3129,71),(0,90,0));
                spawnMapEditObject("pap", (2807.9,2835.5,70.1),(0,90,0));
                spawnMapEditObject("perk1", (1937.4,2392.1,16.1),(0,0,0));
                spawnMapEditObject("perk2", (2491.9,2472.4,29.0),(0,-90,0));
                spawnMapEditObject("perk3", (2060.0,3351.9,77.5),(0,0,0));
                spawnMapEditObject("perk4", (1753,2360,11),(0,0,0));
                spawnMapEditObject("perk5", (1608.1,2261.2,16.1),(0,90,0));
                spawnMapEditObject("perk6", (2103.9,2078.5,16.1),(0,90,0));
                spawnMapEditObject("perk7", (1718,2399,11),(0,0,0));
                spawnMapEditObject("spawn", (1870.9,2029.6,152.1), (0, 90, 0));
                spawnMapEditObject("spawn", (1876.9,2082.3,152.1), (0, 90, 0));
                spawnMapEditObject("spawn", (1833.3,2271.0,152.1), (0, 90, 0));
                spawnMapEditObject("spawn", (1791.4,2029.6,152.1), (0, 90, 0));
                spawnMapEditObject("spawn", (1718.6,2289.2,152.1), (0, 90, 0));
                spawnMapEditObject("spawn", (1863.5,2302.9,152.1), (0, 90, 0));
                spawnMapEditObject("zombiespawn", (3764,2701,285), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (1050,2000,116), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (1072,1943,133), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (3763,2759,285), (0, 0, 0));
                spawnMapEditObject("mapname", "Snowy Vacation");
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("fallLimit", -50);
            }
        break;
        case "mp_strike":
        case "mp_strike_sh":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("invisiblewall", (-3538,1216,32),(-3959,1211,128));
                spawnMapEditObject("invisiblewall", (-3530,1627,16),(-3959,1621,128));

                spawnMapEditObject("randombox", (-2199,1240,31),(0,0,0));
                spawnMapEditObject("power", (-3116,1240,20),(0,0,0));
                spawnMapEditObject("bank", (-3959,1380,16),(0,90,0));
                spawnMapEditObject("ammo", (-2185,1615,24),(0,0,0));
                spawnMapEditObject("gambler", (-2577,1615,24),(0,0,0));
                spawnMapEditObject("killstreak", (-2905,1608,19),(0,0,0));
                spawnMapEditObject("pap", (-2385,1608,19),(0,0,0));
                spawnMapEditObject("perk1", (-3302,1247,12),(0,0,0));
                spawnMapEditObject("perk2", (-2950,1247,15),(0,0,0));
                spawnMapEditObject("perk3", (-2378,1248,22),(0,0,0));
                spawnMapEditObject("perk4", (-2742,1608,19),(0,0,0));
                spawnMapEditObject("perk5", (-2777,1247,16),(0,0,0));
                spawnMapEditObject("perk6", (-2627,1247,17),(0,0,0));
                spawnMapEditObject("perk7", (-3065,1608,19),(0,0,0));
                spawnMapEditObject("spawn", (-1786,1400,24), (0, 180, 0));
                spawnMapEditObject("spawn", (-1743,1400,26), (0, 180, 0));
                spawnMapEditObject("spawn", (-1878,1400,17), (0, 180, 0));
                spawnMapEditObject("zombiespawn", (-3888,1311,17), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-3879,1459,16), (0, 0, 0));
                spawnMapEditObject("mapname", "Back Ally");
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("fallLimit", -25);
            }
        break;
        case "mp_complex":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("invisiblewall", (-2135,-62,-1440), (-2209,43,-1297));
                spawnMapEditObject("invisiblewall", (-3501,567,-1443), (-3410,1545,-1233));
                spawnMapEditObject("randombox", (2500,-907,407), (0,90,0));
                spawnMapEditObject("power", (469,-852,407), (0,0,0));
                spawnMapEditObject("bank", (1236,-1348,407), (0,0,0));
                spawnMapEditObject("ammo", (1695,-543,395), (0,90,0));
                spawnMapEditObject("gambler", (2147,-1132,407), (0,0,0));
                spawnMapEditObject("killstreak", (1120,-541,395), (0,90,0));
                spawnMapEditObject("pap", (844,-47,430), (0,0,0));
                spawnMapEditObject("perk1", (-780,-1294,395), (0,0,0));
                spawnMapEditObject("perk2", (-243,-1062,407), (0,90,0));
                spawnMapEditObject("perk3", (559,-23,395), (0,90,0));
                spawnMapEditObject("perk4", (-1581,-655,395), (0,0,0));
                spawnMapEditObject("perk5", (-108,-852,407), (0,0,0));
                spawnMapEditObject("perk6", (224,-48,395), (0,90,0));
                spawnMapEditObject("perk7", (-597,-69,395), (0,326,0));
                spawnMapEditObject("spawn", (2237,-576,400), (0, 180, 0));
                spawnMapEditObject("spawn", (2252,-711,400), (0, 180, 0));
                spawnMapEditObject("spawn", (2265,-896,400), (0, 180, 0));
                spawnMapEditObject("zombiespawn", (197,-1142,416), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-577,100,402), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (1369,100,395), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-2105,-164,412), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-2076,-426,412), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-1925,-1220,412), (0, 0, 0));
                spawnMapEditObject("fallLimit", -250);
                spawnMapEditObject("mapname", "Apartment Invasion");
                spawnMapEditObject("maxWave", 30);

                deleteDeathTriggers();
            }
            if (level.mapVariation == 1)
            {
                spawnMapEditObject("randombox", (2717,-2032,1051), (0,0,0));
                spawnMapEditObject("power", (2620,-1948,1051), (0,90,0));
                spawnMapEditObject("bank", (2624,-1767,1051), (0,90,0));
                spawnMapEditObject("ammo", (2918,-1806,1056), (0,0,0));
                spawnMapEditObject("gambler", (3164,-1666,1056), (0,90,0));
                spawnMapEditObject("pap", (3164,-1536,1051), (0,90,0));
                spawnMapEditObject("perk1", (2936,-767,1051), (0,0,0));
                spawnMapEditObject("perk2", (3167,-1346,1051), (0,90,0));
                spawnMapEditObject("perk3", (3166,-1787,1051), (0,90,0));
                spawnMapEditObject("perk4", (2628,-1067,1051), (0,90,0));
                spawnMapEditObject("perk5", (2625,-1473,1051), (0,90,0));
                spawnMapEditObject("perk6", (2624,-1642,1051), (0,90,0));
                spawnMapEditObject("perk7", (3138,-899,1051), (0,90,0));
                spawnMapEditObject("spawn", (2864,-2001,1056), (0, 90, 0));
                spawnMapEditObject("spawn", (2974,-1992,1056), (0, 90, 0));
                spawnMapEditObject("spawn", (3068,-1981,1056), (0, 90, 0));
                spawnMapEditObject("zombiespawn", (3133,-849,1056), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2909,-828,1056), (0, 0, 0));
                spawnMapEditObject("fallLimit", 500);
                spawnMapEditObject("mapname", "The Complex");
                spawnMapEditObject("maxWave", 30);

                deleteDeathTriggers();
            }
        break;
        case "mp_abandon":
            if (level.mapVariation == 0)
            {
                trigger = spawn( "trigger_radius", (-2944,3684,3), 0, 100, 200 );
	            trigger.angles = (0,0,0);
	            trigger solid();
	            trigger setContents(1);

                spawnMapEditObject("randombox", (-2779,2928,3), (0,54,0));
                spawnMapEditObject("power", (-2339,2609,3), (0,50,0));
                spawnMapEditObject("bank", (-2319,1661,3), (0,140,0));
                spawnMapEditObject("ammo", (-2307,3170,3), (0,234,0));
                spawnMapEditObject("gambler", (-1759,2968,3), (0,138,0));
                spawnMapEditObject("killstreak", (-2691,900,-2), (0,50,0));
                spawnMapEditObject("pap", (-1553,2798,3), (0,141,0));
                spawnMapEditObject("perk1", (-2248,1351,3), (0,323,0));
                spawnMapEditObject("perk2", (-3281,2486,3), (0,318,0));
                spawnMapEditObject("perk3", (-2119,3865,3), (0,20,0));
                spawnMapEditObject("perk4", (-2552,1984,3), (0,140,0));
                spawnMapEditObject("perk5", (-3878,2865,3), (0,140,0));
                spawnMapEditObject("perk6", (-2898,3629,3), (0,38,0));
                spawnMapEditObject("perk7", (-1901,1150,3), (0,189,0));
                spawnMapEditObject("spawn", (-2186,2961,3), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-1249,1119,3), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-2064,1635,3), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-1143,1217,3), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-842,2015,3), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-290,3437,3), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-829,4036,3), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-2844,5341,3), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-3144,5303,3), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-3674,4526,3), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-4415,3575,3), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-4112,1326,1), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-3793,1030,1), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-3395,777,1), (0, 0, 0));
                spawnMapEditObject("fallLimit", -250);
                spawnMapEditObject("mapname", "Carnival Parking Lot");
                spawnMapEditObject("maxWave", 30);
            }
        break;
        case "mp_vacant":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("invisiblewall", (-846,-503,-8),(-849,-384,50));
                spawnMapEditObject("invisiblewall", (-520,16,-31),(-518,-96,50));
                spawnMapEditObject("invisiblewall", (-848,640,-8),(-846,520,50));
                spawnMapEditObject("invisiblewall", (-4,677,-32),(-52,675,50));
                spawnMapEditObject("invisiblewall", (72,959,-32),(73,848,46));
                spawnMapEditObject("invisiblewall", (343,-880,-32),(346,-928,50));
                
                spawnMapEditObject("randombox", (445,1526,-96),(0,0,0));
                spawnMapEditObject("power", (-1659,208,-91),(0,90,0));
                spawnMapEditObject("bank", (-539,86,-36),(0,90,0));
                spawnMapEditObject("ammo", (-241,692,-31),(0,0,0));
                spawnMapEditObject("gambler", (-828,-261,-37),(0,90,0));
                spawnMapEditObject("killstreak", (-1783,512,-91),(0,180,0));
                spawnMapEditObject("pap", (-1625,972,-83),(0,0,0));
                spawnMapEditObject("ramp", (1739.2, -2213.0, 0), (1741.3, -2479, 190.1));
                spawnMapEditObject("perk1", (196,1600,-101),(0,90,0));
                spawnMapEditObject("perk2", (-867,409,-98),(0,90,0));
                spawnMapEditObject("perk3", (-1404,152,-98),(0,0,0));
                spawnMapEditObject("perk4", (764,1663,-100),(0,90,0));
                spawnMapEditObject("perk5", (-659,78,-100),(0,90,0));
                spawnMapEditObject("perk6", (-1760,-62,-100),(0,0,0));
                spawnMapEditObject("perk7", (53,1093,-36),(0,90,0));
                spawnMapEditObject("spawn", (-53,796,-31), (0, 0, 0));
                spawnMapEditObject("spawn", (-39,949,-31), (0, 0, 0));
                spawnMapEditObject("spawn", (-11,1186,-31), (0, 0, 0));
                spawnMapEditObject("spawn", (-135,1278,-31), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-1768,1765,-87), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-1830,1769,-87), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-734,1782,-97), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (68,-1375,-88), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (494,-1189,-85), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-972,-1366,-91), (0, 0, 0));
                spawnMapEditObject("mapname", "Chernoybl Disaster");
                spawnMapEditObject("fallLimit", -350);
                spawnMapEditObject("maxWave", 30);
            }
        break;
        case "mp_storm":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("invisiblewall", (4700,-62,8),(4737,-59,100));
                spawnMapEditObject("invisiblewall", (2163,-843,8),(2120,-842,100));
                spawnMapEditObject("invisiblewall", (5088,-1360,8),(5004,-1347,100));

                spawnMapEditObject("randombox", (3465,-975,-52),(0,0,0));
                spawnMapEditObject("power", (4646,-975,-52),(0,0,0));
                spawnMapEditObject("bank", (5040,-1235,-52),(0,90,0));
                spawnMapEditObject("ammo", (4207,-1009,-52),(0,90,0));
                spawnMapEditObject("gambler", (4826,-1328,-52),(0,0,0));
                spawnMapEditObject("killstreak", (3424,-2051,3),(0,90,0));
                spawnMapEditObject("pap", (3843,-1903,8),(0,0,0));
                spawnMapEditObject("perk1", (3412,-844,8),(0,90,0));
                spawnMapEditObject("perk2", (2120,-902,8),(0,90,0));
                spawnMapEditObject("perk3", (3913,-1519,16),(0,0,0));
                spawnMapEditObject("perk4", (5056,-1806,8),(0,90,0));
                spawnMapEditObject("perk5", (3668,-1335,-48),(0,0,0));
                spawnMapEditObject("perk6", (3144,-968,-48),(0,0,0));
                spawnMapEditObject("perk7", (5097,-1360,8),(0,0,0));
                spawnMapEditObject("spawn", (2598,-1279,-47), (0, 0, 0));
                spawnMapEditObject("spawn", (2607,-1148,-47), (0, 0, 0));
                spawnMapEditObject("spawn", (2612,-1023,-48), (0, 0, 0));
                spawnMapEditObject("spawn", (2787,-1132,-48), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (5136,-1295,48), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (5120,-1105,48), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (4957,851,-47), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (4787,794,-48), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2851,-1777,8), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (4210,-837,8), (0, 0, 0));
                spawnMapEditObject("mapname", "Dryed Aqueduct");
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("fallLimit", -150);
            }
        break;
        case "mp_fuel2":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("floor", (17794,27616,6953),(18703,27165,6953));

                spawnMapEditObject("randombox", (18370,27175,6994),(0,0,0));
                spawnMapEditObject("power", (17794,27366,6994),(0,90,0));
                spawnMapEditObject("bank", (18228,27608,6994),(0,0,0));
                spawnMapEditObject("ammo", (18249,27358,6994),(0,0,0));
                spawnMapEditObject("gambler", (18705,27380,6994),(0,90,0));
                spawnMapEditObject("killstreak", (17790,27364,6994),(0,90,0));
                spawnMapEditObject("pap", (18041,27175,6994),(0,0,0));
                spawnMapEditObject("perk1", (18051,27345,6994),(0,0,0));
                spawnMapEditObject("perk3", (17962,27608,6994),(0,0,0));
                spawnMapEditObject("perk7", (18571,27608,6994),(0,0,0));
                spawnMapEditObject("spawn", (18515,27358,6994), (0, 0, 0));
                spawnMapEditObject("spawn", (18252,27469,6994), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (13102,29849,8033), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (12960,29570,8034), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (12704,28048,8465), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (14617,25078,9050), (0, 0, 0));
                //spawnMapEditObject("zombiespawn", (18060,32789,8633), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (22002,28482,6810), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (21824,28959,6834), (0, 0, 0));
                spawnMapEditObject("mapname", "Nowhere Mountain");
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("fallLimit", 4000);
                spawnMapEditObject("mapCenter", (18249,27358,6994));
            }
            else if (level.mapVariation == 1)
            {
                spawnMapEditObject("invisiblewall", (-5649,2185,-250),(-5762,1365,-50));
                spawnMapEditObject("invisiblewall", (-6307,2417,-250),(-6439,1725,-50));
                spawnMapEditObject("minefield", (-5930,2640,-236), 750, 300);

                spawnMapEditObject("randombox", (-5996,1435,-125),(0,158,0));
                spawnMapEditObject("ammo", (-6251,1552,-125),(0,147,0));
                spawnMapEditObject("gambler", (-5811,1384,-125),(0,158,0));
                spawnMapEditObject("pap", (-6118,1479,-125),(0,154,0));
                spawnMapEditObject("perk5", (-6399,1668,-125),(0,134,0));
                spawnMapEditObject("spawn", (-6144,1633,-125), (0, 70, 0));
                spawnMapEditObject("spawn", (-6009,1602,-125), (0, 70, 0));
                spawnMapEditObject("spawn", (-5886,1570,-125), (0, 70, 0));
                spawnMapEditObject("zombiespawn", (-5488,3207,-125), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-5784,3263,-125), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-6124,3322,-125), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-6633,3433,-128), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-5712,3658,-125), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-5319,3649,-125), (0, 0, 0));
                spawnMapEditObject("mapname", "Royal Oil Industries");
                spawnMapEditObject("hellMap", true);
                spawnMapEditObject("maxWave", 20);
                spawnMapEditObject("fallLimit", -500);
            }
        break;
        case "mp_crash":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("invisiblewall", (-716,-2169,160), (-753,-3861,254));
                spawnMapEditObject("invisiblewall", (-684,-2152,235), (-430,-2152,310));
                spawnMapEditObject("randombox", (-746,-2175,155), (0,0,0), (-1239,-2646,86), (0,90,0));
                spawnMapEditObject("bank", (-1169,-2146,118), (0,57,0));
                spawnMapEditObject("ammo", (-1045,-2365,106), (0,0,0));
                spawnMapEditObject("gambler", (-873,-3073,81), (0,273,0));
                spawnMapEditObject("killstreak", (-1280,-3015,81), (0,90,0));
                spawnMapEditObject("pap", (-993,-3925,59), (0,180,0));
                spawnMapEditObject("perk1", (-1191,-3578,68), (0,97,0));
                spawnMapEditObject("spawn", (-1055,-2488,107), (0, 270, 0));
                spawnMapEditObject("spawn", (-1117,-2495,105), (0, 270, 0));
                spawnMapEditObject("spawn", (-1116,-2925,88), (0, 270, 0));
                spawnMapEditObject("spawn", (-1047,-3181,83), (0, 270, 0));
                spawnMapEditObject("spawn", (-910,-3350,79), (0, 270, 0));
                spawnMapEditObject("spawn", (-1041,-2174,119), (0, 270, 0));
                spawnMapEditObject("zombiespawn", (-908,-3844,61), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-1052,-3826,61), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-1156,-3821,62), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-426,-1637,88), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-472,-1567,93), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-436,-1701,88), (0, 0, 0));
                spawnMapEditObject("fallLimit", 30);
                spawnMapEditObject("mapname", "Hell Tunnel");
                spawnMapEditObject("hellMap", true);
                spawnMapEditObject("maxWave", 20);
            }
        break;
        case "mp_nuked":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("randombox", (-219,502,-50),(0,34,0));
                spawnMapEditObject("power", (13,-522,-55),(0,2,0));
                spawnMapEditObject("bank", (506,1000,-52),(0,340,0));
                spawnMapEditObject("ammo", (-652,232,-45),(0,339,0));
                spawnMapEditObject("gambler", (-500,414,90),(0,250,0));
                spawnMapEditObject("killstreak", (741,813,-53),(0,193,0));
                spawnMapEditObject("pap", (721,68,90),(0,100,0));
                spawnMapEditObject("perk1", (-1619,1190,-52),(0,32,0));
                spawnMapEditObject("perk2", (-710,294,-45),(0,155,0));
                spawnMapEditObject("perk3", (772,387,-45),(0,13,0));
                //spawnMapEditObject("perk4", ,(0,0,0));
                spawnMapEditObject("perk5", (1402,505,-46),(0,16,0));
                //spawnMapEditObject("perk6", ,(0,0,0));
                spawnMapEditObject("perk7", (-1812,376,-52),(0,65,0));
                spawnMapEditObject("spawn", (-477,526,-45), (0, -20, 0));
                spawnMapEditObject("spawn", (-589,299,-45), (0, -20, 0));
                spawnMapEditObject("spawn", (-909,441,-45), (0, -20, 0));
                spawnMapEditObject("spawn", (-869,613,-45), (0, -20, 0));
                spawnMapEditObject("spawn", (826,361,90), (0, -20, 0));
                spawnMapEditObject("spawn", (1047,446,90), (0, -20, 0));
                spawnMapEditObject("spawn", (695,667,-45), (0, -20, 0));
                spawnMapEditObject("spawn", (996,504,-45), (0, -20, 0));
                spawnMapEditObject("spawn", (56,325,-25), (0, -20, 0));
                spawnMapEditObject("spawn", (165,356,-26), (0, -20, 0));
                spawnMapEditObject("zombiespawn", (-167,-503,-49), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (279,-482,-49), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2011,232,-52), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (1836,607,-52), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-1829,578,-53), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (-1966,259,-53), (0, 0, 0));
                spawnMapEditObject("mapname", "Nuketown");
                spawnMapEditObject("maxWave", 30);
                spawnMapEditObject("fallLimit", -100);

                deleteDeathTriggers();
            }
        break;
        case "mp_crossfire":
        case "mp_cross_fire":
            if (level.mapVariation == 0)
            {
                spawnMapEditObject("ramp", (2750, -4440, -170), (2408, -4127, -160));
                spawnMapEditObject("invisiblewall", (2844, -4400, -125), (2658, -4700, 75));
                spawnMapEditObject("floor", (2300, -3523, -70), (1925, -3171, -70));

                spawnMapEditObject("randombox", (2391,-3274,-48), (0,60,0));
                spawnMapEditObject("bank", (3599.09, -2074.29, 8), (0,-120,0));
                spawnMapEditObject("ammo", (2620, -2948, -6), (0,60,0));
                spawnMapEditObject("gambler", (2159, -3964, -85), (0,60,0));
                spawnMapEditObject("killstreak", (3092.75, -2010.46, 41),(0,240,0));
                spawnMapEditObject("pap", (2329, -4530, -136), (0,-40,0));
                spawnMapEditObject("spawn", (3298,-2511,-17), (0, 180, 0));
                spawnMapEditObject("spawn", (2581,-3090,23), (0, 180, 0));
                spawnMapEditObject("spawn", (2204,-3974,-85), (0, 180, 0));
                spawnMapEditObject("spawn", (2907,-2829,-21), (0, 180, 0));
                spawnMapEditObject("zombiespawn", (2932,-4768,-143), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2963,-4694,-147), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (3011,-4581,-129), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2109,-3215,-29), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2060,-3383,-29), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2680,-2509,35), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (2764,-2343,47), (0, 0, 0));
                spawnMapEditObject("zombiespawn", (3008,-3498,3), (0, 0, 0));
                spawnMapEditObject("mapname", "Alley of Hell");
                spawnMapEditObject("maxWave", 20);
                spawnMapEditObject("hellMap", true);
                spawnMapEditObject("fallLimit", -200);

                deleteDeathTriggers();
            }
        break;
        case "mp_base":
            if (level.mapVariation == 0)
            {
                maps\mp\gametypes\_aiz_nacht_der_untoten::initNachtMapEnts();

                spawnMapEditObject("invisiblecrate", (215, -1005, 125), (90, 90, 0));
                spawnMapEditObject("invisiblecrate", (215, -1005, 185), (90, 90, 0));
                spawnMapEditObject("invisiblecrate", (-445, -1005, 125), (90, 90, 0));
                spawnMapEditObject("invisiblecrate", (-445, -1005, 185), (90, 90, 0));
                spawnMapEditObject("invisiblecrate", (865, -1005, 125), (90, 90, 0));
                spawnMapEditObject("invisiblecrate", (865, -1005, 185), (90, 90, 0));
                spawnMapEditObject("invisiblecrate", (969.421, -587.883, 125), (90, 0, 0));
                spawnMapEditObject("invisiblecrate", (969.421, -587.883, 185), (90, 0, 0));
                spawnMapEditObject("invisiblecrate", (337.767, -522, 170), (90, 270, 0));
                spawnMapEditObject("invisiblecrate", (-881.193, 162, 170), (90, 270, 0));
                spawnMapEditObject("invisiblecrate", (-552.488, -162.518, 125), (90, 0, 0));
                spawnMapEditObject("invisiblecrate", (-552.488, -162.518, 185), (90, 0, 0));
                spawnMapEditObject("invisiblecrate", (-1082.34, -587.704, 306), (90, 180, 0));
                spawnMapEditObject("invisiblecrate", (-990.753, 58.5527, 306), (90, 180, 0));
                spawnMapEditObject("invisiblecrate", (969.421, -587.883, 261), (90, 0, 0));
                spawnMapEditObject("invisiblecrate", (969.421, -587.883, 321), (90, 0, 0));
                spawnMapEditObject("invisiblecrate", (-229.162, -433, 306), (90, 270, 0));
                spawnMapEditObject("invisiblecrate", (-553, -391, 260), (90, 0, 0));
                spawnMapEditObject("invisiblecrate", (-553, -391, 260), (90, 0, 0));
                spawnMapEditObject("invisiblecrate", (-553, -391, 300), (90, 0, 0));
                spawnMapEditObject("invisiblecrate", (-553, -391, 300), (90, 0, 0));
                spawnMapEditObject("invisiblewall", (90.8267, -1002.12, 290), (-496.875, -1004.13, 350));
                spawnMapEditObject("invisiblewall", (-645.029, 165.053, 290), (-896.786, 170.469, 350));
                spawnMapEditObject("invisiblewall", (106.875, -837.875, 250), (-80.2679, -681.125, 350));
                spawnMapEditObject("invisiblecrate", (-558.35, 13.7052, 361), (90, 270, 0));
                spawnMapEditObject("model", "static_okinawa_sandbags_lego_mdl", (-554.874, -395.148, 244.625), (0, 0, 0));
                spawnMapEditObject("model", "static_okinawa_sandbags_lego_mdl", (214.006, -1013.11, 108.185), (0, 90, 0));
                spawnMapEditObject("model", "static_okinawa_sandbags_lego_mdl", (-445, -1013.11, 108.185), (0, 90, 0));
                spawnMapEditObject("model", "static_okinawa_sandbags_lego_mdl", (865, -1013.11, 108.185), (0, 90, 0));
                spawnMapEditObject("model", "static_okinawa_sandbags_lego_mdl", (986.612, -589.423, 108.125), (0, 0, 0));
                spawnMapEditObject("model", "static_okinawa_sandbags_lego_mdl", (-550.643, -162.203, 108.125), (0, 0, 0));
                spawnMapEditObject("invisiblewall", (-603.72, -891.345, 110), (-670.349, -960.975, 200));//box coll

                spawnMapEditObject("spawn", (-216.881, -891.911, 108.124), (0, 90, 0));
                spawnMapEditObject("spawn", (-216.878, -649.748, 108.124), (0, -90, 0));
                spawnMapEditObject("spawn", (16.8578, -924.822, 108.185), (0, 90, 0));
                spawnMapEditObject("spawn", (455.383, -687.649, 108.059), (0, -180, 0));

                spawnMapEditObject("mapname", "Nacht Der Untoten");
                spawnMapEditObject("maxWave", 0);//Infinite rounds
                spawnMapEditObject("hellMap", true);
            }
        break;
        case "mp_factory_sh":
            if (level.mapVariation == 0)
            {
                maps\mp\gametypes\_aiz_der_riese::initDerRieseMapEnts();
                spawnMapEditObject("spawn", (-123.685, 159.884, 93.125), (0, -90, 0));
                spawnMapEditObject("spawn", (2.88529, 159.976, 93.125), (0, -90, 0));
                spawnMapEditObject("spawn", (140.388, -461.611, -2.875), (0, 90, 0));
                spawnMapEditObject("spawn", (-6.08393, -473.826, -2.875), (0, 90, 0));
                spawnMapEditObject("spawn", (-305.178, 374.651, -2.875), (0, -90, 0));
                spawnMapEditObject("spawn", (121.798, 504.473, -2.875), (0, -90, 0));
                spawnMapEditObject("mapname", "Der Riese");
                spawnMapEditObject("maxWave", 0);//Infinite rounds
                spawnMapEditObject("hellMap", false);
            }
        break;
    }
}

FXFire(pos)
{
    fx = level.fx_smallFire;
    fxEnt = spawnFX(fx, pos);
	triggerFX(fx);
}
SmokeFx(pos)
{
    fx = level.fx_flamethrowerImpact;
    fxEnt = spawnFX(fx, pos);
	triggerFX(fxEnt);
}
LightFxGreen(pos)
{
    fxEnt = spawnFX(level.fx_greenSmoke, pos);
	triggerFX(fxEnt);
}

LightFxRed(pos)
{
    fx = loadFX("fx/misc/aircraft_light_red_blink");
    playFX(fx, pos);
}

deleteDestructables(excludedModel)
{
    if (!isDefined(excludedModel))
        excludedModel = "";

    destructables = getEntArray("destructable", "targetname");
    destructibles = getEntArray("destructible", "targetname");

    foreach (destructable in destructables)
    {
        if (destructable.model != excludedModel)
        {
            if (isDefined(destructable.target))
            {
                col = getEnt(destructable.target, "targetname");
                if (isDefined(col)) col delete();
            }
            destructable delete();
        }
    }
    foreach (destructable in destructibles)
    {
        if (destructable.model != excludedModel)
        {
            if (isDefined(destructable.target))
            {
                col = getEnt(destructable.target, "targetname");
                if (isDefined(col)) col delete();
            }
            destructable delete();
        }
    }
}
deleteBarrels()
{
    barrels = getEntArray("explodable_barrel", "targetname");
    foreach (destructable in barrels)
    {
        if (isDefined(destructable.target))
        {
            col = getEnt(destructable.target, "targetname");
            if (isDefined(col)) col delete();
        }
        destructable delete();
    }
}
deleteDeathTriggers()
{
    triggers = getEntArray("trigger_hurt", "classname");
    foreach (trigger in triggers)
    {
        trigger.dmg = 0;
        //trigger.origin -= (0, 0, 10000);//Move triggers away from map
        trigger delete();
    }
}
erosion_createProgressArea(pos, radius, height, num)
{
	trigger = spawn("trigger_radius", pos, 0, radius, height);
	trigger thread erosion_playerEnterArea(radius, num);
}
erosion_playerEnterArea(radius, num)
{
    self waittill("trigger", player);

    switch (num)
    {
        case 0:
            erosion_zone1();
            break;
        case 1:
            erosion_zone2();
            break;
        case 2:
            erosion_zone3();
            break;
        case 3:
            erosion_zone4();
            break;
    }

    self delete();
}
erosion_zone1()
{
    spawnMapEditObject("zombiespawn", (-961.368, -1277.691, 128.1244), (0, 3.572388, 0));
    spawnMapEditObject("zombiespawn", (-834.707, -1845.905, 122.1269), (0, 92.94617, 0));
}
erosion_zone2()
{
    spawnMapEditObject("zombiespawn", (-495.0684, 94.01765, 70.68504), (0, -90.08604, 0));
    spawnMapEditObject("zombiespawn", (-250.0462, -377.6604, 128.125), (0, -99.43541, 0));
}
erosion_zone3()
{
    spawnMapEditObject("zombiespawn", (667.4779, -495.157, 129.7398), (0, -92.56346, 0));
    spawnMapEditObject("zombiespawn", (786.2244, 116.314, 128.125), (0, -179.7894, 0));
    spawnMapEditObject("zombiespawn", (268.9368, 146.4736, 129), (0, -2.382202, 0));
}
erosion_zone4()
{
    spawnMapEditObject("zombiespawn", (781.4849, -1476.622, 128.125), (0, -179.9267, 0));
}
highrise_createProgressArea(pos, radius, height, num)
{
	trigger = spawn("trigger_radius", pos, 0, radius, height);
	trigger thread highrise_playerEnterArea(radius, num);
}
highrise_playerEnterArea(radius, num)
{
    self waittill("trigger", player);

    switch (num)
    {
        case 0:
            highrise_zone1();
            break;
        case 1:
            highrise_zone2();
            break;
        case 2:
            highrise_zone3();
            break;
    }

    self delete();
}
highrise_zone1()
{
    spawnMapEditObject("zombiespawn", (2150,11342,3371), (0, 0, 0));
    spawnMapEditObject("zombiespawn", (2150,10473,3371), (0, 0, 0));
    spawnMapEditObject("zombiespawn", (3037,11690,3371), (0, 0, 0));
    spawnMapEditObject("zombiespawn", (2150,11300,3371), (0, 0, 0));
}
highrise_zone2()
{
    spawnMapEditObject("zombiespawn", (2906,10116,4075), (0, 0, 0));
    spawnMapEditObject("zombiespawn", (2896,10614,4075), (0, 0, 0));
    spawnMapEditObject("zombiespawn", (2892,11239,4075), (0, 0, 0));
    spawnMapEditObject("zombiespawn", (2903,11563,4075), (0, 0, 0));
}
highrise_zone3()
{
    spawnMapEditObject("zombiespawn", (3866,2155,2355), (0, 0, 0));
    spawnMapEditObject("zombiespawn", (5016,1005,2355), (0, 0, 0));
    spawnMapEditObject("zombiespawn", (6005,912,2355), (0, 0, 0));
    spawnMapEditObject("zombiespawn", (6380,964,2355), (0, 0, 0));
}