#include common_scripts\utility;
#include maps\mp\_utility;

createWaypoints()
{
    waypoints = getWaypointsForMap();
    foreach (point in waypoints)
    {
        if (!isDefined(point) || point == (0, 0, 0)) continue;

        //wp = spawn("script_origin", point + (0, 0, 5));//Moving this to struct system
        wp = spawnStruct();
        wp.origin = point + (0, 0, 5);
        level.waypoints[level.waypoints.size] = wp;
    }
    if (level.waypoints.size > 0) bakeWaypoints();
}

bakeWaypoints()
{
    badPoints = [];
    foreach (wp in level.waypoints)
    {
        if (!isDefined(wp))
            continue;

        bakes = [];
        foreach (p in level.waypoints)
        {
            if (!isDefined(p))
                continue;

            if (p == wp) continue;//No unneccesary trace

            if (distance(p.origin, wp.origin) > 1500) continue;//Don't trace for too far away points

            trace = sightTracePassed(wp.origin, p.origin, false, undefined);
            trace2 = bulletTracePassed(wp.origin, p.origin, false, undefined);
            if (level._mapname == "mp_factory_sh") trace = undefined;
            if ((isDefined(trace) && trace) || (isDefined(trace2) && trace2))
                bakes[bakes.size] = p;
        }
        if (bakes.size > 0) wp.visiblePoints = bakes;
        else
            badPoints[badPoints.size] = wp;
    }

    validateWaypoints(badPoints);

    //Set current wps to never change
    //Not for the struct system
    /*
    foreach (wp in level.waypoints)
    {
        if (isDefined(wp))
        {
            wp willNeverChange();
        }
    }
    */
}
validateWaypoints(badPoints)
{
    if (badPoints.size > 0)
    {
        foreach (p in badPoints)
        {
            foreach (goodPoint in level.waypoints)
            {
                if (goodPoint == p)
                    continue;

                if (maps\mp\gametypes\_aiz::array_contains(badPoints, goodPoint))
                    continue;

                visiblePoints = goodPoint.visiblePoints;
                for (i = 0; i < visiblePoints.size; i++)
                {
                    if (visiblePoints[i] == p)//If a good point linked to this bad point, unlink them
                    {
                        visiblePoints = array_remove(visiblePoints, p);
                    }
                }

                if (visiblePoints.size == 0)//If that was the only link to the good point, it is now bad.
                {
                    badPoints[badPoints.size] = goodPoint;
                    validateWaypoints(badPoints);
                    return;
                }

                goodPoint.visiblePoints = visiblePoints;
            }

            level.waypoints = array_remove(level.waypoints, p);
            //p delete();
            print("A waypoint had no visible links! Deleting waypoint...");
        }
    }
}

getWaypointsForMap()
{
    currentMap = level._mapname;
    waypoints = [];

    switch (currentMap)
    {
        case "mp_aground_ss":
            waypoints[waypoints.size] = (733.652,1636.66,496.9419);
            waypoints[waypoints.size] = (226.6237,1550.334,440.343);
            waypoints[waypoints.size] = (-637.0939,1039.916,343.7559);
            waypoints[waypoints.size] = (-840.6141,626.8457,300.1438);
            waypoints[waypoints.size] = (-527.5485,356.5355,327.6597);
            waypoints[waypoints.size] = (-418.8591,-1103.289,353.5634);
            waypoints[waypoints.size] = (-4.839658,-1128.628,319.0117);
            waypoints[waypoints.size] = (22.51072,-896.8111,326.7933);
            waypoints[waypoints.size] = (-328.5806,-657.3851,284.7649);
            waypoints[waypoints.size] = (-422.6194,-365.6055,256.5077);
            waypoints[waypoints.size] = (377.7072,-1014.937,311.1723);
            waypoints[waypoints.size] = (432.5213,-1336.253,297.1445);
            waypoints[waypoints.size] = (513.6872,-1304.469,255.7224);
            waypoints[waypoints.size] = (582.9395,-1107.193,173.0095);
            waypoints[waypoints.size] = (95.32257,-799.8381,307.2084);
            waypoints[waypoints.size] = (196.6009,-727.275,247.7051);
            waypoints[waypoints.size] = (594.3251,-766.6541,185.5384);
            waypoints[waypoints.size] = (614.8215,-359.5564,200.2885);
            waypoints[waypoints.size] = (695.0062,41.86766,80.21643);
            waypoints[waypoints.size] = (177.8229,-139.4284,176.4452);
            waypoints[waypoints.size] = (228.1002,-619.59,204.3573);
            waypoints[waypoints.size] = (369.277,-758.2477,192.875);
            waypoints[waypoints.size] = (626.9393,-165.8104,157.5502);
            waypoints[waypoints.size] = (-66.49564,99.35958,91.99572);
            waypoints[waypoints.size] = (618.9926,1249.289,422.8063);
            waypoints[waypoints.size] = (1004.634,1260.791,411.1563);
            waypoints[waypoints.size] = (822.7732,663.6504,236.8265);
            waypoints[waypoints.size] = (1251.333,405.9103,171.8683);
            waypoints[waypoints.size] = (937.6295,-87.22648,92.40146);
            waypoints[waypoints.size] = (1523.628,-488.3101,8);
            waypoints[waypoints.size] = (897.5397,-810.6605,129.7882);
            waypoints[waypoints.size] = (873.1002,-482.614,152.1721);
            waypoints[waypoints.size] = (598.9543,685.9743,265.1899);
            waypoints[waypoints.size] = (629.9172,822.1954,399.7449);
            waypoints[waypoints.size] = (379.8336,905.527,414.0011);
            waypoints[waypoints.size] = (439.6286,1289.428,425.9085);
            waypoints[waypoints.size] = (282.8477,1236.392,408.9233);
            waypoints[waypoints.size] = (-23.04194,812.4047,256.2316);
        break;
        case "mp_alpha":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (-1733.982,-41.43102,-4.249259);
            waypoints[waypoints.size] = (-1725.115,136.1086,-4.120231);
            waypoints[waypoints.size] = (-1727.724,279.265,-4.032718);
            waypoints[waypoints.size] = (-1737.752,381.9674,-4.22531);
            waypoints[waypoints.size] = (-2179.358,351.2084,3);
            waypoints[waypoints.size] = (-1974.71,360.4082,-1);
            waypoints[waypoints.size] = (-2208.288,423.315,2);
            waypoints[waypoints.size] = (-2211.644,486.9398,8.125001);
            waypoints[waypoints.size] = (-2174.141,663.5779,8.124999);
            waypoints[waypoints.size] = (-2066.999,668.9243,8.125394);
            waypoints[waypoints.size] = (-2070.81,865.9808,8.125472);
            waypoints[waypoints.size] = (-2070.582,1058.546,8.125301);
            waypoints[waypoints.size] = (-1995.058,1115.731,8.124998);
            waypoints[waypoints.size] = (-1921.354,1055.51,8.124999);
            waypoints[waypoints.size] = (-1938.092,874.5952,8.125962);
            waypoints[waypoints.size] = (-1946.882,558.0231,8.125004);
            waypoints[waypoints.size] = (-1996.438,1182.007,0);
            waypoints[waypoints.size] = (-2253.984,1216.399,0);
            waypoints[waypoints.size] = (-1950.07,1408.477,0);
            waypoints[waypoints.size] = (-1705.99,1410.554,-8);
            waypoints[waypoints.size] = (-1665.49,717.0035,-5.892747);
            waypoints[waypoints.size] = (-713.6335,635.7916,-4.67958);
            waypoints[waypoints.size] = (-911.8012,637.9001,-4.087493);
            waypoints[waypoints.size] = (-999.796,635.9617,-4.188998);
            waypoints[waypoints.size] = (-1391.557,639.9637,-4.311835);
            waypoints[waypoints.size] = (-1407.136,788.2641,0);
            waypoints[waypoints.size] = (-1405.574,1442.391,0);
            waypoints[waypoints.size] = (-1079.288,1546.07,-4.919598);
            waypoints[waypoints.size] = (-1079.304,1952.657,-1.952217);
            waypoints[waypoints.size] = (-1090.121,1790.254,-0.4648951);
            waypoints[waypoints.size] = (-1088.111,1696.387,-1);
            waypoints[waypoints.size] = (-1229.432,1650.909,3);
            waypoints[waypoints.size] = (-1591.983,1652.141,6);
            waypoints[waypoints.size] = (-1567.371,1832.774,6);
            waypoints[waypoints.size] = (-1348.971,1652.542,1);
            waypoints[waypoints.size] = (-1622.729,1022.258,-8);
            waypoints[waypoints.size] = (-1392.181,1097.511,2);
            waypoints[waypoints.size] = (-1727.634, 205.3276, 10);
            waypoints[waypoints.size] = (-1090.004, 1660.499, 10);
            waypoints[waypoints.size] = (-1726.234, 170.1852, 10);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (82.57023,4488.846,-8);
            waypoints[waypoints.size] = (29.24185,4102.111,-7);
            waypoints[waypoints.size] = (380.1516,4720.654,12);
            waypoints[waypoints.size] = (287.3447,4254.277,-8);
            waypoints[waypoints.size] = (471.9898,4094.06,-8);
            waypoints[waypoints.size] = (459.0656,4445.451,-1.91);
            waypoints[waypoints.size] = (704.7206,4347.857,-3.6);
            waypoints[waypoints.size] = (1229.032,4330.865,-3.38);
            waypoints[waypoints.size] = (975.6346,4129.377,-6.10);
            waypoints[waypoints.size] = (969.6137,4598.801,-0.72);
        }
        break;
        case "mp_boardwalk":
            waypoints[waypoints.size] = (-1014.913,401.7431,128);
            waypoints[waypoints.size] = (-678.6538,396.5154,128);
            waypoints[waypoints.size] = (-612.5169,615.4767,128);
            waypoints[waypoints.size] = (-997.0763,815.0956,128);
            waypoints[waypoints.size] = (-555.5892,808.5934,128);
            waypoints[waypoints.size] = (-563.2409,1085.987,128);
            waypoints[waypoints.size] = (-578.1697,1358.112,128);
            waypoints[waypoints.size] = (-169.1187,1346.945,128.125);
            waypoints[waypoints.size] = (-371.6339,962.2451,128.125);
            waypoints[waypoints.size] = (-569.7546,963.3438,128);
            waypoints[waypoints.size] = (-602.6272,1884.029,128);
            waypoints[waypoints.size] = (-1072.806,1875.869,128.125);
            waypoints[waypoints.size] = (-924.887,1921.006,144.003);
            waypoints[waypoints.size] = (-884.6139,1866.197,128.125);
            waypoints[waypoints.size] = (-851.7188,1560.719,128.125);
            waypoints[waypoints.size] = (-740.3331,2078.795,128);
            waypoints[waypoints.size] = (-644.5786,2387.915,128);
            waypoints[waypoints.size] = (-672.9426,2716.972,128.1253);
            waypoints[waypoints.size] = (-990.6927,2897.237,128);
            waypoints[waypoints.size] = (-1095.524,2798.089,128);
            waypoints[waypoints.size] = (-845.6041,2504.747,128);
        break;
        case "mp_bootleg":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (2458.165,-766.3791,-79.99999);
            waypoints[waypoints.size] = (2164.81,-712.0799,-71.875);
            waypoints[waypoints.size] = (2453.739,-1637.182,-80);
            waypoints[waypoints.size] = (2400.833,-1227.22,-80);
            waypoints[waypoints.size] = (1442.764,-1211.31,-79.26122);
            waypoints[waypoints.size] = (1385.402,-1482.413,-65.87547);
            waypoints[waypoints.size] = (1326.361,-1785.726,-66);
            waypoints[waypoints.size] = (1002.135,-1752.91,-66);
            waypoints[waypoints.size] = (864.6607,-2012.809,-66);
            waypoints[waypoints.size] = (1802.866,-1195.113,-80.00001);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (-2678.095,-3482.604,-104.5);
            waypoints[waypoints.size] = (-3022.715,-3472.659,-104.5);
            waypoints[waypoints.size] = (-3327.76,-3405.414,-71.87564);
            waypoints[waypoints.size] = (-2954.189,-3084.629,-104.5);
            waypoints[waypoints.size] = (-2700.08,-2801.409,-104.5);
            waypoints[waypoints.size] = (-3157.154,-2783.564,-104.5);
            waypoints[waypoints.size] = (-2888.521,-2419.088,-104.5);
            waypoints[waypoints.size] = (-3225.77,-2144.493,-71.875);
            waypoints[waypoints.size] = (-2634.464,-2112.942,-104.5);
            waypoints[waypoints.size] = (-2918.461,-1830.925,-104.5);
            waypoints[waypoints.size] = (-3292.267,-1562.671,-104.5);
            waypoints[waypoints.size] = (-2800.283,-1548.215,-104.5);
            waypoints[waypoints.size] = (-3050.405,-1189.84,-104.5);
            waypoints[waypoints.size] = (-2780.813,-918.7891,-104.5);
            waypoints[waypoints.size] = (-3358.615,-896.6125,-104.5);
            waypoints[waypoints.size] = (-3095.08,-538.5414,-104.5);
            waypoints[waypoints.size] = (-2775.66,-161.5502,-104.5);
            waypoints[waypoints.size] = (-3388.239,-158.4396,-104.5);
            waypoints[waypoints.size] = (-3078.312,150.0443,-104.5);
            waypoints[waypoints.size] = (-3370.855,483.3016,-104.5);
            waypoints[waypoints.size] = (-2951.249,496.7928,-104.5);
            waypoints[waypoints.size] = (-2645.225,531.3727,-104.5);
            waypoints[waypoints.size] = (-3110.499,-1695.364,-104.5);
            waypoints[waypoints.size] = (-3049.436,-3728.951,-104.5);
            waypoints[waypoints.size] = (-2767.649,-3691.653,-104.5);
        }
        break;
        case "mp_bravo":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (-663.4982,-2175.45,1112.938);
            waypoints[waypoints.size] = (-256.8134,-2177.779,1114);
            waypoints[waypoints.size] = (253.3163,-2404.263,1114);
            waypoints[waypoints.size] = (362.2193,-2236.232,1114.897);
            waypoints[waypoints.size] = (333.2993,-1769.199,1063.991);
            waypoints[waypoints.size] = (66.32018,-2294.76,1113.788);
            waypoints[waypoints.size] = (717.4704,-1735.75,1070);
            waypoints[waypoints.size] = (719.3177,-1429.6,1043.259);
            waypoints[waypoints.size] = (817.0349,-1591.514,1077.821);
            waypoints[waypoints.size] = (583.5759,-1208.752,985.8169);
            waypoints[waypoints.size] = (313.8668,-1204.368,971.0732);
            waypoints[waypoints.size] = (-180.8494,-1878.95,1114);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (-306.7841,-113.2812,1219.368);
            waypoints[waypoints.size] = (-26.65581,-114.8328,1220.325);
            waypoints[waypoints.size] = (217.4,-111.6517,1215.728);
            waypoints[waypoints.size] = (268.5886,30.19468,1211.287);
            waypoints[waypoints.size] = (311.1958,398.5762,1209.641);
            waypoints[waypoints.size] = (-72.07099,406.9904,1210.651);
            waypoints[waypoints.size] = (-300.9051,207.797,1212);
            waypoints[waypoints.size] = (-433.6883,399.9465,1211.63);
            waypoints[waypoints.size] = (-698.4546,412.856,1212.138);
            waypoints[waypoints.size] = (945.1725,437.2338,1181.329);
            waypoints[waypoints.size] = (946.9576,258.994,1180.835);
            waypoints[waypoints.size] = (914.2014,-113.0975,1134.585);
            waypoints[waypoints.size] = (817.3661,-175.6633,1102.614);
            waypoints[waypoints.size] = (789.1957,-22.83576,1144.282);
            waypoints[waypoints.size] = (432.068,-16.8533,1208.539);
            waypoints[waypoints.size] = (1004.554, 269.2629, 1175.949);
        }
        else if (level.mapVariation == 2)
        {
            waypoints[waypoints.size] = (1431.158,276.0226,1164.337);
            waypoints[waypoints.size] = (1268.383,-163.5272,1129.275);
            waypoints[waypoints.size] = (1261.87,-842.7211,1089.614);
            waypoints[waypoints.size] = (1270.515,-548.1367,1094.925);
            waypoints[waypoints.size] = (1452.1,-181.5843,1122.432);
            waypoints[waypoints.size] = (1444.403,87.69996,1139.687);
            waypoints[waypoints.size] = (1546.669,84.38525,1159.989);
            waypoints[waypoints.size] = (1856.059,69.66891,1153.839);
            waypoints[waypoints.size] = (1818.111,-180.1745,1101.699);
            waypoints[waypoints.size] = (1874.989,-22.12455,1127.37);
            waypoints[waypoints.size] = (1803.27,-374.3832,1169.124);
            waypoints[waypoints.size] = (1797.643,-583.1844,1169);
            waypoints[waypoints.size] = (1501.652,-586.6957,1169);
            waypoints[waypoints.size] = (2055.496,-572.88,1169);
            waypoints[waypoints.size] = (2072.305,-183.0167,1101.953);
        }
        break;
        case "mp_burn_ss":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (-789.6375,-854.0154,-23.80409);
            waypoints[waypoints.size] = (-785.7889,-84.44694,-47.80228);
            waypoints[waypoints.size] = (-871.4496,123.7326,-34.90727);
            waypoints[waypoints.size] = (-703.9838,114.47,-37.00473);
            waypoints[waypoints.size] = (-702.6682,243.303,-39.85149);
            waypoints[waypoints.size] = (-879.2192,214.4688,-39.64943);
            waypoints[waypoints.size] = (-792.8457,337.8506,-44.27299);
            waypoints[waypoints.size] = (-776.9747,819.2811,-18.63872);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (1745.472,-267.2395,64);
            waypoints[waypoints.size] = (1704.561,-454.8252,64);
            waypoints[waypoints.size] = (1480.53,-447.0512,64);
            waypoints[waypoints.size] = (1247.316,-447.1112,64);
            waypoints[waypoints.size] = (1041.197,-442.9553,64);
            waypoints[waypoints.size] = (1068.018,-239.295,64);
            waypoints[waypoints.size] = (1054.95,-73.57093,67.64291);
            waypoints[waypoints.size] = (1280.655,-95.6543,65.43457);
            waypoints[waypoints.size] = (1447.078,-114.0343,64.00001);
            waypoints[waypoints.size] = (1443.753,-302.5787,64);
            waypoints[waypoints.size] = (1253.955,-292.5959,64.00001);
            waypoints[waypoints.size] = (1048.631,-523.6907,106.125);
            waypoints[waypoints.size] = (1262.266,-524.0133,106.125);
            waypoints[waypoints.size] = (1483.826,-525.3466,106.125);
            waypoints[waypoints.size] = (1046.049,-620.8315,33.89642);
            waypoints[waypoints.size] = (1277.764,-613.7753,35.6703);
            waypoints[waypoints.size] = (1493.414,-594.3338,42.0833);
            waypoints[waypoints.size] = (1510.409,-813.7919,-16.33095);
            waypoints[waypoints.size] = (1287.845,-797.418,-5.759698);
            waypoints[waypoints.size] = (1032.706,-794.8063,1);
        }
        break;
        case "mp_carbon":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (-2916.668,-4720.116,3577.546);
            waypoints[waypoints.size] = (-3083.143,-4711.42,3573.455);
            waypoints[waypoints.size] = (-3007.981,-4491.559,3566.878);
            waypoints[waypoints.size] = (-3223.184,-4288.371,3566.551);
            waypoints[waypoints.size] = (-3620.085,-4282.928,3572.205);
            waypoints[waypoints.size] = (-3622.581,-3725.521,3570.879);
            waypoints[waypoints.size] = (-3154.967,-3994.673,3569.259);
            waypoints[waypoints.size] = (-3320.568,-3288.509,3570.027);
            waypoints[waypoints.size] = (-3640.542,-3463.467,3569.118);
            waypoints[waypoints.size] = (-3223.656,-3527.106,3570.39);
            waypoints[waypoints.size] = (-3901.866,-3892.64,3574.778);
            waypoints[waypoints.size] = (-3796.832,-4141.14,3585.777);
            waypoints[waypoints.size] = (-3438.458,-3865.482,3569.595);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (-2255.133,-5051.104,3698.87);
            waypoints[waypoints.size] = (-2474.998,-5088.282,3652.906);
            waypoints[waypoints.size] = (-2347.128,-5492.045,3760.125);
            waypoints[waypoints.size] = (-2296.689,-5267.092,3676.706);
            waypoints[waypoints.size] = (-2510.464,-5344.641,3650.124);
            waypoints[waypoints.size] = (-2748.253,-5401.736,3610.125);
            waypoints[waypoints.size] = (-1987.031,-5377.561,3724.716);
            waypoints[waypoints.size] = (-1853.262,-5609.207,3742.82);
            waypoints[waypoints.size] = (-2099.479,-5693.882,3754.31);
            waypoints[waypoints.size] = (-2142.868,-6036.979,3752.718);
            waypoints[waypoints.size] = (-1868.103,-5839.011,3745.48);
            waypoints[waypoints.size] = (-2600.864,-5991.657,3742.749);
            waypoints[waypoints.size] = (-2411.426, -5453.287, 3797);
        }
        break;
        case "mp_cement":
            waypoints[waypoints.size] = (-6540.343,1889.919,296.1241);
            waypoints[waypoints.size] = (-6301.234,1766.983,296.125);
            waypoints[waypoints.size] = (-6582.174,1342.147,296.1248);
            waypoints[waypoints.size] = (-6235.946,1236.641,296.1253);
            waypoints[waypoints.size] = (-5669.51,831.0576,296.1249);
            waypoints[waypoints.size] = (-6168.426,797.593,296.1246);
            waypoints[waypoints.size] = (-6212.335,204.5749,296.1249);
            waypoints[waypoints.size] = (-5581.681,387.2523,296.1251);
            waypoints[waypoints.size] = (-5751.178,22.14342,296.125);
            waypoints[waypoints.size] = (-5948.686,422.5833,296.1257);
            waypoints[waypoints.size] = (-6220.87,-305.9689,296.1249);
            waypoints[waypoints.size] = (-6093.948,-1112.109,296.125);
            waypoints[waypoints.size] = (-5998.134,-608.9271,296.125);
            waypoints[waypoints.size] = (-5522.805,-257.1658,296.1248);
            waypoints[waypoints.size] = (-4987.105,74.91043,296.1249);
            waypoints[waypoints.size] = (-4817.042,-196.4114,296);
            waypoints[waypoints.size] = (-5041.343,-627.3614,296.125);
        break;
        case "mp_courtyard_ss":
            waypoints[waypoints.size] = (765.4263,123.6526,121.1011);
            waypoints[waypoints.size] = (274.5121,146.3001,127.9569);
            waypoints[waypoints.size] = (548.4968,114.0349,0.6397166);
            waypoints[waypoints.size] = (542.488,-718.8779,0.6404918);
            waypoints[waypoints.size] = (645.8779,-497.2341,129.8034);
            waypoints[waypoints.size] = (654.2222,-687.7101,0.5000004);
            waypoints[waypoints.size] = (168.6251,-706.9333,0.4999995);
            waypoints[waypoints.size] = (207.0554,-346.2757,128.1971);
            waypoints[waypoints.size] = (210.4477,-538.5526,0.4999998);
            waypoints[waypoints.size] = (216.0166,-933.2108,-2.089715);
            waypoints[waypoints.size] = (773.6848,-1471.198,126.6067);
            waypoints[waypoints.size] = (626.2582,-1475.978,31.25144);
            waypoints[waypoints.size] = (207.7549,-1254.129,-2.283364);
            waypoints[waypoints.size] = (227.0602,-1560.369,6.182802);
            waypoints[waypoints.size] = (115.2479,-1733.422,6.735181);
            waypoints[waypoints.size] = (111.5506,-1597.119,4.703273);
            waypoints[waypoints.size] = (108.0575,-1441.274,4.753747);
            waypoints[waypoints.size] = (-946.859,-1267.559,126.8103);
            waypoints[waypoints.size] = (-753.217,-1275.298,7.971626);
            waypoints[waypoints.size] = (-829.6499,-1775.763,17.03038);
            waypoints[waypoints.size] = (-228.0672,-1446.727,-5.143529);
            waypoints[waypoints.size] = (-215.1954,-1597.174,-5.012685);
            waypoints[waypoints.size] = (-215.0527,-1735.583,-0.3070872);
            waypoints[waypoints.size] = (-515.6034,-1254.44,27.75622);
            waypoints[waypoints.size] = (-511.209,-106.8255,19.68229);
            waypoints[waypoints.size] = (-524.178,-963.3242,33.60368);
            waypoints[waypoints.size] = (-790.9064,-582.3506,-0.2239982);
            waypoints[waypoints.size] = (-528.0983,-419.5476,12.39323);
            waypoints[waypoints.size] = (-244.7622,-385.9133,128.1251);
            waypoints[waypoints.size] = (-250.255,-667.8112,-1.375128);
            waypoints[waypoints.size] = (-231.8368,-818.8183,-1.516071);
            waypoints[waypoints.size] = (160.351,-813.4573,0.5000032);
        break;
        case "mp_crosswalk_ss":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (4120.259,-1518.418,2972.125);
            waypoints[waypoints.size] = (4229.275,-1684.273,2972.125);
            waypoints[waypoints.size] = (4357.047,-1869.988,2972.125);
            waypoints[waypoints.size] = (3933.572,-1899.635,2972.124);
            waypoints[waypoints.size] = (3002.386,-2546.366,2972.125);
            waypoints[waypoints.size] = (2937.33,-2728.873,2972.125);
            waypoints[waypoints.size] = (2791.117,-2539.502,2972.125);
            waypoints[waypoints.size] = (2177.709,-2946.067,2972.125);
            waypoints[waypoints.size] = (2319.212,-3151.221,2972.125);
            waypoints[waypoints.size] = (1774.775,-3349.528,2972.125);
            waypoints[waypoints.size] = (954.6775,-3909.765,2972.126);
            waypoints[waypoints.size] = (623.2702,-4352.17,2972.125);
            waypoints[waypoints.size] = (423.3335,-4055.464,2972.125);
            waypoints[waypoints.size] = (1346.777,-3773.01,2972.125);
            waypoints[waypoints.size] = (1220.674,-3591.97,2972.125);
            waypoints[waypoints.size] = (2596.48,-2816.501,2972.126);
            waypoints[waypoints.size] = (3254.643,-2283.819,2972.125);
            waypoints[waypoints.size] = (3400.151,-2381.066,2972.125);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (-127.9002,545.8965,828.125);
            waypoints[waypoints.size] = (-99.85728,686.2053,828.125);
            waypoints[waypoints.size] = (51.66057,616.6047,828.125);
            waypoints[waypoints.size] = (156.8176,684.1366,828.1246);
            waypoints[waypoints.size] = (147.8883,578.8351,828.125);
            waypoints[waypoints.size] = (230.8435,629.3724,828.1259);
            waypoints[waypoints.size] = (325.5788,574.9485,828.1257);
            waypoints[waypoints.size] = (318.3233,659.4071,828.125);
            waypoints[waypoints.size] = (440.184,612.4969,828.1246);
            waypoints[waypoints.size] = (516.048,666.1225,828.1254);
            waypoints[waypoints.size] = (546.1115,531.2384,828.125);
            waypoints[waypoints.size] = (575.0925,399.693,828.125);
            waypoints[waypoints.size] = (644.3368,510.8106,828.125);
            waypoints[waypoints.size] = (12.54853,676.8193,828.125);
            waypoints[waypoints.size] = (0.8565109,562.0945,828.125);
        }
        break;
        case "mp_dome":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (-335.9785,1441.799,-285.9127);
            waypoints[waypoints.size] = (-645.0636,1418.46,-280.9293);
            waypoints[waypoints.size] = (-449.5819,977.0627,-283.778);
            waypoints[waypoints.size] = (226.6546,961.1883,-310.882);
            waypoints[waypoints.size] = (5.727349,1458.807,-290.875);
            waypoints[waypoints.size] = (136.2413,820.1141,-309.0848);
            waypoints[waypoints.size] = (-604.6086,83.37051,-413.8297);
            waypoints[waypoints.size] = (-220.3642,183.4029,-398.7145);
            waypoints[waypoints.size] = (-85.66466,648.6254,-354.7658);
            waypoints[waypoints.size] = (-136.5737,47.70163,-390.375);
            waypoints[waypoints.size] = (164.7923,154.8896,-390.375);
            waypoints[waypoints.size] = (326.2328,-125.3123,-390.375);
            waypoints[waypoints.size] = (10.4175,-243.1024,-390.375);
            waypoints[waypoints.size] = (608.8121,-228.1752,-394.2316);
            waypoints[waypoints.size] = (655.5255,226.061,-400.3176);
            waypoints[waypoints.size] = (916.8306,361.3986,-388.55);
            waypoints[waypoints.size] = (991.616,903.0084,-325.1733);
            waypoints[waypoints.size] = (261.4625,1135.884,-311.2903);
            waypoints[waypoints.size] = (620.8136,1014.996,-315.7569);
            waypoints[waypoints.size] = (1324.124,677.596,-322.1883);
            waypoints[waypoints.size] = (1272.335,3.922247,-394.4641);
            waypoints[waypoints.size] = (810.2381,-395.4685,-395.4166);
            waypoints[waypoints.size] = (-106.5491,2049.056,-290.875);
            waypoints[waypoints.size] = (386.6993,2061.878,-254.875);
            waypoints[waypoints.size] = (750.8327,2236.435,-254.875);
            waypoints[waypoints.size] = (652.9404,1854.689,-235.7291);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (343.8396,2068.462,-254.875);
            waypoints[waypoints.size] = (645.5324,2038.837,-251.7681);
            waypoints[waypoints.size] = (687.9592,2374.042,-254.875);
            waypoints[waypoints.size] = (1180.308,2330.216,-254.875);
            waypoints[waypoints.size] = (1364.097,2306.748,-254.875);
            waypoints[waypoints.size] = (1354.596,1878.339,-254.8745);
            waypoints[waypoints.size] = (1318.16,1640.178,-254.875);
            waypoints[waypoints.size] = (1306.226,1308.06,-254.8757);
            waypoints[waypoints.size] = (1594,1257.261,-254.875);
            waypoints[waypoints.size] = (1100.984,1695.398,-254.875);
            waypoints[waypoints.size] = (1121.433,1890.751,-254.875);
            waypoints[waypoints.size] = (952.1491,1920.029,-254.875);
            waypoints[waypoints.size] = (1009.423,2354.522,-254.875);
            waypoints[waypoints.size] = (793.6144,2033.732,-253.4286);
            waypoints[waypoints.size] = (618.1174,1810.883,-226.875);
        }
        else if (level.mapVariation == 2)
        {
            waypoints[waypoints.size] = (-815.9095,1094.88,-392.1714);
            waypoints[waypoints.size] = (-922.9402,1034.798,-416.7078);
            waypoints[waypoints.size] = (-1069.38,1301.161,-427.8738);
            waypoints[waypoints.size] = (-1164.879,1507.233,-427.875);
            waypoints[waypoints.size] = (-1330.412,1440.56,-451.875);
            waypoints[waypoints.size] = (-1507.867,1353.592,-427.875);
            waypoints[waypoints.size] = (-1242.746,1477.25,-435.0186);
            waypoints[waypoints.size] = (-1435.237,1387.968,-434.33);
            waypoints[waypoints.size] = (-1413.985,1106.386,-423.7954);
            waypoints[waypoints.size] = (-1275.095,808.2147,-451.875);
            waypoints[waypoints.size] = (-1331.313,925.619,-435.0847);
            waypoints[waypoints.size] = (-1122.868,886.2221,-451.875);
            waypoints[waypoints.size] = (-1222.379,1161.769,-436);
            waypoints[waypoints.size] = (-958.6686,648.0377,-451.8749);
            waypoints[waypoints.size] = (-761.5908,294.0142,-415.3301);
            waypoints[waypoints.size] = (-814.9822,385.0837,-426.0574);
            waypoints[waypoints.size] = (-705.4037,-21.10515,-411.5291);
            waypoints[waypoints.size] = (-462.7966,270.0304,-409.2917);
            waypoints[waypoints.size] = (-68.4575,688.662,-346.3942);
            waypoints[waypoints.size] = (-94.90681,560.913,-371.6733);
            waypoints[waypoints.size] = (-164.513,351.1321,-398.3161);
            waypoints[waypoints.size] = (32.47539,373.7596,-388.4713);
            waypoints[waypoints.size] = (-211.2983,189.0864,-398.8876);
            waypoints[waypoints.size] = (-165.7507,91.86921,-390.375);
            waypoints[waypoints.size] = (14.42278,-254.6234,-390.3759);
            waypoints[waypoints.size] = (317.1668,-118.8957,-390.375);
            waypoints[waypoints.size] = (146.4815,184.6393,-390.375);
            waypoints[waypoints.size] = (-618.005,121.0368,-415.8227);
        }
        else if (level.mapVariation == 3)
        {
            waypoints[waypoints.size] = (1166.212,2363.386,-254.875);
            waypoints[waypoints.size] = (1378.01,2295.684,-254.875);
            waypoints[waypoints.size] = (1326.093,1671.954,-254.875);
            waypoints[waypoints.size] = (1119.748,1695.358,-254.875);
            waypoints[waypoints.size] = (650.8218,1753.704,-245.6546);
            waypoints[waypoints.size] = (720.4778,2385.231,-254.875);
            waypoints[waypoints.size] = (557.2748,2382.76,-254.875);
            waypoints[waypoints.size] = (477.1867,2226.305,-254.875);
            waypoints[waypoints.size] = (447.4532,1889.179,-253.107);
            waypoints[waypoints.size] = (547.7307,2062.198,-254.875);
            waypoints[waypoints.size] = (533.6536,1736.472,-251.575);
            waypoints[waypoints.size] = (1321.074,1311.068,-254.875);
            waypoints[waypoints.size] = (1559.456,1259.466,-254.875);
            waypoints[waypoints.size] = (1557.157,1054.427,-254.875);
            waypoints[waypoints.size] = (1538.623,630.1993,-314.8114);
            waypoints[waypoints.size] = (1308.471,246.5927,-384.3044);
            waypoints[waypoints.size] = (1263.789,11.46795,-394.6915);
            waypoints[waypoints.size] = (991.17,-217.7518,-403.0648);
            waypoints[waypoints.size] = (876.3331,181.938,-403.3705);
            waypoints[waypoints.size] = (455.2693,-160.3829,-390.3751);
            waypoints[waypoints.size] = (670.6226,-251.5762,-394.7516);
            waypoints[waypoints.size] = (646.8302,140.753,-399.5725);
            waypoints[waypoints.size] = (295.3189,-107.3955,-390.3736);
            waypoints[waypoints.size] = (151.5919,162.6498,-390.3752);
            waypoints[waypoints.size] = (16.92421,-227.9953,-390.375);
            waypoints[waypoints.size] = (-141.9329,73.933,-390.3748);
            waypoints[waypoints.size] = (-287.7451,253.4106,-401.4019);
            waypoints[waypoints.size] = (-746.957,329.0399,-414.011);
            waypoints[waypoints.size] = (-89.67645,651.3965,-354.1281);
            waypoints[waypoints.size] = (158.338,832.2819,-307.6438);
            waypoints[waypoints.size] = (271.8102,2063.961,-254.875);
            waypoints[waypoints.size] = (91.89445,2004.791,-290.875);
            waypoints[waypoints.size] = (85.82769,1727.335,-290.8746);
            waypoints[waypoints.size] = (-127.6885,1647.132,-290.875);
            waypoints[waypoints.size] = (72.68315,1227.543,-294.4814);
            waypoints[waypoints.size] = (534.0721,1092.19,-311.4705);
            waypoints[waypoints.size] = (985.4398,891.6721,-325.9561);
        }
        else if (level.mapVariation == 4)
        {

        }
        break;
        case "mp_exchange":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (858.997,460.1796,-134.2777);
            waypoints[waypoints.size] = (1156.8,1427.544,-175.6358);
            waypoints[waypoints.size] = (1171.679,728.9935,-161.6461);
            waypoints[waypoints.size] = (987.959,452.2699,-142.8768);
            waypoints[waypoints.size] = (730.7126,594.4676,-115.3775);
            waypoints[waypoints.size] = (828.9516,201.536,-129.1431);
            waypoints[waypoints.size] = (842.8425,-298.8199,-57.33735);
            waypoints[waypoints.size] = (651.3919,-159.876,-126.0458);
            waypoints[waypoints.size] = (644.6891,-328.97,-122.2767);
            waypoints[waypoints.size] = (456.0497,-528.9465,-156.6477);
            waypoints[waypoints.size] = (349.7194,-783.8875,-176);
            waypoints[waypoints.size] = (326.7947,-1091.347,-165.772);
            waypoints[waypoints.size] = (695.9943,-1093.411,-176);
            waypoints[waypoints.size] = (27.27176,-1067.78,-176);
            waypoints[waypoints.size] = (664.6005,225.5922,-104.3372);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (4325.671,3705.367,922.125);
            waypoints[waypoints.size] = (4395.253,3572.178,922.1243);
            waypoints[waypoints.size] = (4240.542,3557.953,922.125);
            waypoints[waypoints.size] = (4328.727,3358.962,922.1243);
            waypoints[waypoints.size] = (4223.281,3157.958,922.1247);
            waypoints[waypoints.size] = (4397.78,3142.359,922.125);
            waypoints[waypoints.size] = (4319.607,2879.526,922.1251);
            waypoints[waypoints.size] = (4220.216,2660.248,922.1259);
            waypoints[waypoints.size] = (4426.106,2649.871,922.1254);
            waypoints[waypoints.size] = (4316.966,2418.852,922.1248);
            waypoints[waypoints.size] = (4312.777,2289.355,922.125);
            waypoints[waypoints.size] = (4306.784,2089.363,998.125);
            waypoints[waypoints.size] = (4401.364,1934.537,998.125);
            waypoints[waypoints.size] = (4245.088,1898.09,998.1245);
            waypoints[waypoints.size] = (4352.591,1746.395,998.1246);
            waypoints[waypoints.size] = (4556.112,1763.466,998.124);
            waypoints[waypoints.size] = (4563.355,1872.794,1014.125);
            waypoints[waypoints.size] = (4480.174,1951.167,1014.125);
            waypoints[waypoints.size] = (4567.831,1972.488,998.125);
            waypoints[waypoints.size] = (4546.004,2270.08,998.1245);
            waypoints[waypoints.size] = (4545.218,2658.671,998.125);
            waypoints[waypoints.size] = (4545.77,3020.325,998.1255);
            waypoints[waypoints.size] = (4546.72,3304.722,998.124);
            waypoints[waypoints.size] = (4546.782,3530.957,998.1251);
            waypoints[waypoints.size] = (4554.829,3647.997,998.125);
            waypoints[waypoints.size] = (4660.545,3643.034,998.125);
            waypoints[waypoints.size] = (4480.283,1873.718,1014.125);
            waypoints[waypoints.size] = (4317.64,1996.327,998.125);
        }
        break;
        case "mp_hardhat":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (-1215.235,-1641.082,400);
            waypoints[waypoints.size] = (-1262.194,-1451.853,408.8029);
            waypoints[waypoints.size] = (-1309.676,-1232.559,459.8601);
            waypoints[waypoints.size] = (-1310.992,-947.2194,479.5976);
            waypoints[waypoints.size] = (-1316.449,-832.5807,509.1496);
            waypoints[waypoints.size] = (-1318.318,-788.3385,544.0964);
            waypoints[waypoints.size] = (-1328.352,-475.5489,547.4525);
            waypoints[waypoints.size] = (-1314.523,-148.0685,544.44);
            waypoints[waypoints.size] = (-1307.475,294.7216,549.3412);
            waypoints[waypoints.size] = (-1441.914,158.1994,547.8048);
            waypoints[waypoints.size] = (-1481.108,-749.614,546.2308);
            waypoints[waypoints.size] = (-1423.388,-1037.254,482.5647);
            waypoints[waypoints.size] = (-1209.95,-1091.9,440.6499);
            waypoints[waypoints.size] = (-1176.595,-1348.201,400);
            waypoints[waypoints.size] = (-1403.756,-1340.72,447.8795);
            waypoints[waypoints.size] = (-1151.878,-1556.458,400);
            waypoints[waypoints.size] = (-1321.016,-1561.486,409.8097);
            waypoints[waypoints.size] = (-1236.633,-613.7802,544.7946);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (-1081.078,-2222.103,384.125);
            waypoints[waypoints.size] = (-532.9781,-1999.232,384.125);
            waypoints[waypoints.size] = (-542.9423,-2293.114,384.125);
            waypoints[waypoints.size] = (235.4782,-2163.017,384.1252);
            waypoints[waypoints.size] = (974.3506,-1970.456,384.125);
            waypoints[waypoints.size] = (952.8808,-2447.385,384.125);
            waypoints[waypoints.size] = (1522.964,-2211.886,384.1246);
            waypoints[waypoints.size] = (2759.096,-2247.938,384.125);
            waypoints[waypoints.size] = (1021.871,-2984.352,384.125);
        }
        break;
        case "mp_hillside_ss":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (1743.342,-643.5035,2183.682);
            waypoints[waypoints.size] = (2027.195,-692.1411,2166.76);
            waypoints[waypoints.size] = (2251.746,-697.7281,2152.34);
            waypoints[waypoints.size] = (2269.748,-459.0953,2157.153);
            waypoints[waypoints.size] = (2081.236,-423.6624,2167.987);
            waypoints[waypoints.size] = (1827.85,-405.7632,2181.356);
            waypoints[waypoints.size] = (1865.292,-93.60847,2179.218);
            waypoints[waypoints.size] = (2058.084,-73.65378,2169.425);
            waypoints[waypoints.size] = (2297.873,-43.32476,2156.193);
            waypoints[waypoints.size] = (2302.923,92.65822,2155.734);
            waypoints[waypoints.size] = (2020.342,83.41258,2171.222);
            waypoints[waypoints.size] = (1821.122,79.93489,2181.816);
            waypoints[waypoints.size] = (1810.032,330.1121,2182.469);
            waypoints[waypoints.size] = (2004.162,379.53,2171.992);
            waypoints[waypoints.size] = (2287.476,402.6368,2155.068);
            waypoints[waypoints.size] = (2261.694,739.3677,2154.103);
            waypoints[waypoints.size] = (2052.759,664.1464,2168.953);
            waypoints[waypoints.size] = (1829.225,644.224,2181.34);
            waypoints[waypoints.size] = (1560.709,672.6508,2202.27);
            waypoints[waypoints.size] = (1509.268,865.0294,2206.784);
            waypoints[waypoints.size] = (1842.827,826.7351,2180.134);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (-1803.927,-1527.871,2326.076);
            waypoints[waypoints.size] = (-1797.549,-1361.877,2325.929);
            waypoints[waypoints.size] = (-1916.234,-1459.308,2340.257);
            waypoints[waypoints.size] = (-1632.808,-1375.278,2305.465);
            waypoints[waypoints.size] = (-1660.581,-1456.351,2308.592);
            waypoints[waypoints.size] = (-1474.323,-1501.6,2284.26);
            waypoints[waypoints.size] = (-1448.017,-1376.464,2281.134);
            waypoints[waypoints.size] = (-1182.052,-1404.251,2241.798);
            waypoints[waypoints.size] = (-1202.095,-1720.51,2249.817);
            waypoints[waypoints.size] = (-1206,-2059.814,2257.869);
            waypoints[waypoints.size] = (-1203.176,-2340.166,2265.733);
            waypoints[waypoints.size] = (-1417.244,-2376.763,2295.928);
            waypoints[waypoints.size] = (-1634.619,-2394.625,2325.529);
            waypoints[waypoints.size] = (-1805.561,-2395.808,2341.707);
            waypoints[waypoints.size] = (-1387.434,-2020.89,2279.356);
            waypoints[waypoints.size] = (-1374.776,-1735.608,2273.364);
            waypoints[waypoints.size] = (-1644.528,-1608.115,2368.125);
            waypoints[waypoints.size] = (-1639.804,-1739.446,2461.126);
            waypoints[waypoints.size] = (-1638.332,-2065.891,2461.125);
            waypoints[waypoints.size] = (-2075.743,-2001.575,2461.125);
            waypoints[waypoints.size] = (-1816.921,-2040.118,2475.125);
            waypoints[waypoints.size] = (-2236.041,-2238.412,2461.125);
            waypoints[waypoints.size] = (-2249.957,-1832.063,2461.125);
            waypoints[waypoints.size] = (-1910.684,-1830.897,2461.125);
            waypoints[waypoints.size] = (-1921.388,-2215.99,2461.125);
            waypoints[waypoints.size] = (-2082.153,-1732.622,2461.125);
        }
        break;
        case "mp_interchange":
            waypoints[waypoints.size] = (-329.9671,479.1274,66.11772);
            waypoints[waypoints.size] = (29.56694,198.2987,97.69564);
            waypoints[waypoints.size] = (-294.1086,16.41811,70.28242);
            waypoints[waypoints.size] = (-516.2379,156.8413,16.17399);
            waypoints[waypoints.size] = (-449.6578,-103.3902,16.99896);
            waypoints[waypoints.size] = (-721.6404,39.02387,13.81486);
            waypoints[waypoints.size] = (-1099.29,288.8835,14.59944);
            waypoints[waypoints.size] = (-1236.357,-4.876176,24.65725);
            waypoints[waypoints.size] = (-1263.098,-234.7302,43.86327);
            waypoints[waypoints.size] = (-973.6649,-461.1957,66.88322);
            waypoints[waypoints.size] = (-1459.877,-573.4796,69.24001);
            waypoints[waypoints.size] = (-1085.549,-768.4293,91.78718);
            waypoints[waypoints.size] = (-678.283,-905.45,89.80035);
            waypoints[waypoints.size] = (-180.4419,-279.1308,68.29961);
            waypoints[waypoints.size] = (-194.1601,-87.93198,127.2281);
            waypoints[waypoints.size] = (103.9433,146.2376,130.3995);
            waypoints[waypoints.size] = (203.3108,110.0799,88.86456);
            waypoints[waypoints.size] = (597.2041,-176.2849,134.0509);
            waypoints[waypoints.size] = (106.6798,-466.8405,93.47688);
            waypoints[waypoints.size] = (469.0524,-517.5025,94.3444);
            waypoints[waypoints.size] = (949.0919,-545.3953,132.1816);
            waypoints[waypoints.size] = (503.2209,-724.1669,158.8839);
            waypoints[waypoints.size] = (675.0354,-834.9918,149.0804);
            waypoints[waypoints.size] = (302.5191,-280.1024,100.7017);
        break;
        case "mp_italy":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (190.4891,-684.0543,877.0178);
            waypoints[waypoints.size] = (313.2891,-772.3897,796.4852);
            waypoints[waypoints.size] = (803.2955,-594.1136,736);
            waypoints[waypoints.size] = (788.8221,-414.0637,800.125);
            waypoints[waypoints.size] = (970.8935,-294.8386,800.125);
            waypoints[waypoints.size] = (1265.913,-275.7305,800.125);
            waypoints[waypoints.size] = (1262.844,-425.6841,800.125);
            waypoints[waypoints.size] = (1278.493,-602.005,736);
            waypoints[waypoints.size] = (1422.877,-700.4793,736);
            waypoints[waypoints.size] = (1403.498,-1027.143,704);
            waypoints[waypoints.size] = (1118.554,-1188.591,704);
            waypoints[waypoints.size] = (857.879,-931.7302,704.125);
            waypoints[waypoints.size] = (828.0937,-709.2788,736.1261);
            waypoints[waypoints.size] = (572.6787,-933.0611,704.125);
            waypoints[waypoints.size] = (1124.863,-753.4468,704);
            waypoints[waypoints.size] = (581.588,-655.2092,744.8187);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (1762.477,-1448.055,91.08044);
            waypoints[waypoints.size] = (1777.925,-1775.08,66.07001);
            waypoints[waypoints.size] = (1436.021,-1810.557,64);
            waypoints[waypoints.size] = (1431.558,-1461.437,94.52335);
            waypoints[waypoints.size] = (1129.017,-1463.95,88);
            waypoints[waypoints.size] = (857.24,-1449.329,98.95741);
            waypoints[waypoints.size] = (523.1125,-1436.19,94.03745);
            waypoints[waypoints.size] = (220.1305,-1420.63,94.00735);
            waypoints[waypoints.size] = (-123.2956,-1354.233,89.42617);
            waypoints[waypoints.size] = (-401.4703,-1436.751,86.18378);
            waypoints[waypoints.size] = (-708.8463,-1489.38,90.55463);
            waypoints[waypoints.size] = (-1015.47,-1519.44,90.85162);
            waypoints[waypoints.size] = (-1293.078,-1515.526,88);
            waypoints[waypoints.size] = (-1620.216,-1507.776,112.2528);
            waypoints[waypoints.size] = (-1663.875,-1803.69,99.74524);
            waypoints[waypoints.size] = (-1319.49,-1919.874,86.83141);
            waypoints[waypoints.size] = (-870.1938,-1817.657,64);
            waypoints[waypoints.size] = (-507.1215,-1772.312,64.00001);
            waypoints[waypoints.size] = (-160.3596,-1791.196,65.74187);
            waypoints[waypoints.size] = (239.7497,-1847.65,64);
            waypoints[waypoints.size] = (944.3646,-1854.644,68.70568);
            waypoints[waypoints.size] = (-323.7691,-1601.816,71);
            waypoints[waypoints.size] = (-902.0849,-1649.342,81.35651);
            waypoints[waypoints.size] = (-1505.524,-1666.803,95.89218);
            waypoints[waypoints.size] = (-1638.124,-1188.993,256.125);
            waypoints[waypoints.size] = (-1578.443,-1135.065,256.125);
            waypoints[waypoints.size] = (-1381.149,-1218.976,380.0595);
            waypoints[waypoints.size] = (-1325.484,-1231.564,384.125);
            waypoints[waypoints.size] = (-1202.359,-1106.301,512.125);
            waypoints[waypoints.size] = (-1628.79,-1388.417,131.4487);
            waypoints[waypoints.size] = (339.7751,-1603.581,81.49146);
            waypoints[waypoints.size] = (929.5641,-1608.502,90.27848);
            waypoints[waypoints.size] = (1567.154,-1573.599,81.62675);
        }
        break;
        case "mp_lambeth":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (3128.341,1423.161,-320.9374);
            waypoints[waypoints.size] = (3327.719,1560.032,-318.8838);
            waypoints[waypoints.size] = (3558.835,1703.837,-311.5836);
            waypoints[waypoints.size] = (4236.22,1966.714,-273.7843);
            waypoints[waypoints.size] = (4037.658,1888.055,-278.2133);
            waypoints[waypoints.size] = (3789.442,1800.321,-293.1907);
            waypoints[waypoints.size] = (3648.126,1899.06,-280.8894);
            waypoints[waypoints.size] = (3750.473,1677.023,-294.9341);
            waypoints[waypoints.size] = (4168.818,1836.775,-267.9033);
            waypoints[waypoints.size] = (4063.657,2021.988,-266);
            waypoints[waypoints.size] = (3212.411,1734.358,-308.8465);
            waypoints[waypoints.size] = (3381.583,1484.43,-316.3557);
            waypoints[waypoints.size] = (3951.156,1780.828,-281.4303);
            waypoints[waypoints.size] = (3906.094,1958.891,-277.7013);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (-1180.955,-5022.152,-264.0626);
            waypoints[waypoints.size] = (-1665.358,-5100.571,-259.487);
            waypoints[waypoints.size] = (-1541.147,-4687.311,-246.875);
            waypoints[waypoints.size] = (-1491.019,-4244.476,-246.875);
            waypoints[waypoints.size] = (-1063.657,-4178.306,-246.875);
            waypoints[waypoints.size] = (-281.6977,-4093.723,-270.2549);
            waypoints[waypoints.size] = (-683.4231,-4039.573,-263.6714);
            waypoints[waypoints.size] = (-904.5781,-3431.277,-259.85);
            waypoints[waypoints.size] = (-1611.561,-3328.987,-257.7128);
            waypoints[waypoints.size] = (-1518.175,-3715.907,-246.875);
            waypoints[waypoints.size] = (-1050.951,-3931.835,-246.875);
            waypoints[waypoints.size] = (-1088.628,-2930.784,-258.1242);
        }
        break;
        case "mp_meteora":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (-1390.967,2226.207,1552);
            waypoints[waypoints.size] = (-1389.571,1891.961,1552);
            waypoints[waypoints.size] = (-1050.268,2048.873,1584.125);
            waypoints[waypoints.size] = (-1167.707,2048.473,1584.125);
            waypoints[waypoints.size] = (-1250.241,2213.698,1584.125);
            waypoints[waypoints.size] = (-1253.078,1886.404,1584.125);
            waypoints[waypoints.size] = (-2005.754,1871.288,1552);
            waypoints[waypoints.size] = (-2025.263,2051.124,1552);
            waypoints[waypoints.size] = (-2006.654,2222.372,1552);
            waypoints[waypoints.size] = (-2206.07,2050.435,1552);
            waypoints[waypoints.size] = (-1573.248,2222.698,1552);
            waypoints[waypoints.size] = (-1562.429,2051.253,1552);
            waypoints[waypoints.size] = (-1557.024,1871.516,1552);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (-826.2371,-345.0677,1600);
            waypoints[waypoints.size] = (-821.1331,-488.3266,1600);
            waypoints[waypoints.size] = (-760.2354,-481.2003,1598);
            waypoints[waypoints.size] = (-763.2509,-343.692,1598);
            waypoints[waypoints.size] = (-553.3844,-347.0651,1598);
            waypoints[waypoints.size] = (-532.4172,-477.9636,1598);
            waypoints[waypoints.size] = (-307.0725,-480.5006,1630.414);
            waypoints[waypoints.size] = (-293.2772,-357.7555,1631.923);
            waypoints[waypoints.size] = (-53.76625,-369.4456,1645.68);
            waypoints[waypoints.size] = (-50.71033,-485.7782,1645.585);
            waypoints[waypoints.size] = (174.0676,-482.4516,1630.961);
            waypoints[waypoints.size] = (196.6487,-354.0045,1628.419);
            waypoints[waypoints.size] = (398.7326,-350.9015,1597.309);
            waypoints[waypoints.size] = (407.3458,-471.3192,1596.906);
            waypoints[waypoints.size] = (640.1306,-471.433,1597.794);
            waypoints[waypoints.size] = (631.625,-349.1886,1597.56);
            waypoints[waypoints.size] = (723.5092,-354.3865,1599.153);
            waypoints[waypoints.size] = (720.8923,-485.5677,1600.384);
            waypoints[waypoints.size] = (303.8759,-410.8505,1612.771);
            waypoints[waypoints.size] = (-180.6977,-427.6573,1641.53);
            waypoints[waypoints.size] = (-633.7855,-420.3141,1598);
            waypoints[waypoints.size] = (-397.1613,-419.6593,1618.944);
            waypoints[waypoints.size] = (523.7892,-412.0179,1593.553);
        }
        else if (level.mapVariation == 2)
        {
            waypoints[waypoints.size] = (-1287.093,-171.915,1598);
            waypoints[waypoints.size] = (-1290.674,-114.3943,1599.833);
            waypoints[waypoints.size] = (-1557.24,-86.4307,1598);
            waypoints[waypoints.size] = (-1547.949,65.33632,1598);
            waypoints[waypoints.size] = (-1256.198,262.3255,1598);
            waypoints[waypoints.size] = (-1286.184,34.49767,1599.71);
            waypoints[waypoints.size] = (-1734.889,-180.6332,1598);
            waypoints[waypoints.size] = (-1726.352,-41.95441,1543.817);
            waypoints[waypoints.size] = (-1735.233,120.5524,1542.885);
            waypoints[waypoints.size] = (-1278.718,328.8543,1604.126);
            waypoints[waypoints.size] = (-1348.819,426.5464,1541.676);
            waypoints[waypoints.size] = (-1564.818,319.0904,1534.507);
            waypoints[waypoints.size] = (-1741.248,504.2151,1534.851);
            waypoints[waypoints.size] = (-1943.128,595.8706,1533.579);
            waypoints[waypoints.size] = (-1872.817,908.8681,1536.921);
            waypoints[waypoints.size] = (-2039.867,1090.103,1538.467);
            waypoints[waypoints.size] = (-2016.871,1237.21,1540.381);
            waypoints[waypoints.size] = (-1751.186,1296.506,1537.57);
            waypoints[waypoints.size] = (-1550.172,1383.049,1538.998);
            waypoints[waypoints.size] = (-1408.335,1311.01,1538.252);
            waypoints[waypoints.size] = (-1427.785,1105.784,1538.043);
            waypoints[waypoints.size] = (-1420.718,771.728,1533.857);
            waypoints[waypoints.size] = (-1234.782,770.1587,1538.198);
            waypoints[waypoints.size] = (-1184.797,768.005,1536.125);
            waypoints[waypoints.size] = (-1621.484,740.1641,1530.644);
            waypoints[waypoints.size] = (-1718.44,929.6885,1537.453);
            waypoints[waypoints.size] = (-1658.804,1103.894,1537.891);
            waypoints[waypoints.size] = (-1344.467,625.8976,1541.805);
            waypoints[waypoints.size] = (-1553.363,1571.291,1552.125);
            waypoints[waypoints.size] = (-1550.417,1500.358,1539.227);
        }
        break;
        case "mp_moab":
            waypoints[waypoints.size] = (1196.604,3350.236,418.2322);
            waypoints[waypoints.size] = (1741.884,2884.154,450.9742);
            waypoints[waypoints.size] = (1824.33,1785.374,494.4743);
            waypoints[waypoints.size] = (1592.354,1542.656,417.5201);
            waypoints[waypoints.size] = (1729.602,1856.125,432.7203);
            waypoints[waypoints.size] = (1845.98,2231.24,449.557);
            waypoints[waypoints.size] = (1579.853,2123.749,401.9308);
            waypoints[waypoints.size] = (1518.417,2284.219,397.645);
            waypoints[waypoints.size] = (1718.763,2396.77,405.8164);
            waypoints[waypoints.size] = (1636.448,2613.282,392.3742);
            waypoints[waypoints.size] = (1405.876,2583.694,381.3228);
            waypoints[waypoints.size] = (1393.526,2791.892,377.2201);
            waypoints[waypoints.size] = (1191.933,2879.667,374.3722);
            waypoints[waypoints.size] = (1119.763,3154.987,369.2847);
            waypoints[waypoints.size] = (1417.254,3109.489,372.5394);
            waypoints[waypoints.size] = (1602.485,2977.34,407.0193);
        break;
        case "mp_mogadishu":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (3723.387,-400.9253,-46);
            waypoints[waypoints.size] = (3340.734,-444.7841,-46);
            waypoints[waypoints.size] = (2929.642,-360.7194,-46);
            waypoints[waypoints.size] = (2659.142,-403.2171,-46);
            waypoints[waypoints.size] = (2409.388,-358.2458,-45.52507);
            waypoints[waypoints.size] = (2019.95,-418.837,-13.87476);
            waypoints[waypoints.size] = (1928.143,-309.3236,-13.875);
            waypoints[waypoints.size] = (1950.594,-74.69082,-13.875);
            waypoints[waypoints.size] = (1948.932,-663.47,-45.875);
            waypoints[waypoints.size] = (1987.875,-876.2894,-23.7866);
            waypoints[waypoints.size] = (1897.328,-934.6907,-24.80975);
            waypoints[waypoints.size] = (1908.437,-1116.833,-11.37933);
            waypoints[waypoints.size] = (2125.928,-1210.768,-26.34843);
            waypoints[waypoints.size] = (2413.832,-1211.122,-46);
            waypoints[waypoints.size] = (2891.378,-1172.171,-46);
            waypoints[waypoints.size] = (3319.732,-1244.796,-46);
            waypoints[waypoints.size] = (3611.608,-1201.747,-46);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (-1509.063,-2369.371,-46);
            waypoints[waypoints.size] = (-1509.691,-2077.167,-46);
            waypoints[waypoints.size] = (-1518.057,-1717.859,-46);
            waypoints[waypoints.size] = (-1514.77,-1050.471,-40.76812);
            waypoints[waypoints.size] = (-1512.689,-1387.535,-46);
            waypoints[waypoints.size] = (-1712.756,-1778.018,-53.875);
            waypoints[waypoints.size] = (-1713.051,-1595.618,-53.875);
            waypoints[waypoints.size] = (-1810.775,-1696.762,-53.875);
            waypoints[waypoints.size] = (-885.9448,-2413.663,-78.1498);
            waypoints[waypoints.size] = (-2129.691, -2199.138, -81.45382);
            waypoints[waypoints.size] = (-2139.647, -1705.861, -80.42136);
            waypoints[waypoints.size] = (-2138.845, -1333.258, -80.3673);
        }
        break;
        case "mp_morningwood":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (-1880.385,2061.637,1161.625);
            waypoints[waypoints.size] = (-1500.872,2365.655,1161.625);
            waypoints[waypoints.size] = (-1606.358,2013.777,1161.625);
            waypoints[waypoints.size] = (-1786.496,1805.998,1161.625);
            waypoints[waypoints.size] = (-1591.568,1696.806,1161.625);
            waypoints[waypoints.size] = (-1436.46,1942.921,1161.625);
            waypoints[waypoints.size] = (-1100.171,1569.84,1161.5);
            waypoints[waypoints.size] = (-1285.996,1589.699,1161.625);
            waypoints[waypoints.size] = (-1438.511,1305.631,1161.5);
            waypoints[waypoints.size] = (-1616.077,1417.793,1161.625);
            waypoints[waypoints.size] = (-1447.308,1679.743,1161.625);
            waypoints[waypoints.size] = (-1219.464,1817.464,1289.625);
            waypoints[waypoints.size] = (-1215.391,1726.891,1289.625);
            waypoints[waypoints.size] = (-1287.12,1574.434,1291.625);
            waypoints[waypoints.size] = (-1489.164,1458.999,1290.625);
            waypoints[waypoints.size] = (-1396.214,1401.809,1290.625);
            waypoints[waypoints.size] = (-1729.804,1716.331,1292.125);
            waypoints[waypoints.size] = (-1571.487,1705.935,1291.625);
            waypoints[waypoints.size] = (-1693.452,1791.886,1289.625);
            waypoints[waypoints.size] = (-1816.364,1525.345,1161.625);
            waypoints[waypoints.size] = (-1151.324,1301.371,1161.5);
            waypoints[waypoints.size] = (-1380.39,1434.348,1161.625);
            waypoints[waypoints.size] = (-1216.643,1352.604,1290.625);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (-2359.347,-5929.19,256.125);
            waypoints[waypoints.size] = (-2358.339,-6033.026,256.125);
            waypoints[waypoints.size] = (-2486.011,-5990.682,256.125);
            waypoints[waypoints.size] = (-2719.45,-5983.853,256.1248);
            waypoints[waypoints.size] = (-3052.837,-5981.437,256.1248);
            waypoints[waypoints.size] = (-2884.704,-5981.909,256.125);
            waypoints[waypoints.size] = (-3037.932,-5809.326,256.125);
            waypoints[waypoints.size] = (-3132.118,-5806.181,256.125);
            waypoints[waypoints.size] = (-3123.07,-5672.12,256.125);
            waypoints[waypoints.size] = (-3131.594,-5454.439,256.125);
            waypoints[waypoints.size] = (-3132.665,-5266.176,256.125);
            waypoints[waypoints.size] = (-3032.479,-5273.792,256.125);
            waypoints[waypoints.size] = (-3124.686,-5047.494,256.125);
            waypoints[waypoints.size] = (-2943.54,-5040.647,256.1248);
            waypoints[waypoints.size] = (-2775.356,-5055.209,256.125);
            waypoints[waypoints.size] = (-2780.34,-5205.75,256.1252);
            waypoints[waypoints.size] = (-2672.548,-5149.436,256.125);
            waypoints[waypoints.size] = (-2567.778,-5099.362,256.125);
            waypoints[waypoints.size] = (-2576.956,-5210.437,256.125);
            waypoints[waypoints.size] = (-2864.289,-5123.304,256.125);
            waypoints[waypoints.size] = (-3029.779,-5149.009,256.125);
            waypoints[waypoints.size] = (-2590.741,-5950.313,256.125);
            waypoints[waypoints.size] = (-2606.511,-6035.136,256.125);
            waypoints[waypoints.size] = (-2812.746,-6020.967,256.125);
            waypoints[waypoints.size] = (-2819.205,-5930.015,256.125);
            waypoints[waypoints.size] = (-2975.953,-6013.399,256.125);
            waypoints[waypoints.size] = (-2973.15,-5917.905,256.125);
        }
        break;
        case "mp_nola":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (-4096.034,-60.0474,10);
            waypoints[waypoints.size] = (-4104.858,201.409,9.999998);
            waypoints[waypoints.size] = (-3908.278,80.54948,10);
            waypoints[waypoints.size] = (-3687.345,59.42622,9.999996);
            waypoints[waypoints.size] = (-3556.569,-81.38001,16.00001);
            waypoints[waypoints.size] = (-3338.179,-277.193,16);
            waypoints[waypoints.size] = (-3115.683,-251.6027,16);
            waypoints[waypoints.size] = (-3525.717,202.0966,10);
            waypoints[waypoints.size] = (-3284.097,204.0911,10);
            waypoints[waypoints.size] = (-3106.969,53.48091,10);
            waypoints[waypoints.size] = (-3025.752,189.8556,10);
            waypoints[waypoints.size] = (-2865.81,-138.9568,16);
            waypoints[waypoints.size] = (-2693.749,-78.95328,16.00001);
            waypoints[waypoints.size] = (-2627.692,-267.4966,16);
            waypoints[waypoints.size] = (-2751.619,-176.1268,16);
            waypoints[waypoints.size] = (-3015.88,-27.55174,10);
            waypoints[waypoints.size] = (-3268.034,17.82201,9.999999);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (1951.365,-380.8,8.125003);
            waypoints[waypoints.size] = (1916.033,-132.9321,8.125812);
            waypoints[waypoints.size] = (1913.087,191.8769,53.38005);
            waypoints[waypoints.size] = (1929.131,73.63139,8.124996);
            waypoints[waypoints.size] = (1658.377,238.2673,16);
            waypoints[waypoints.size] = (1423.599,242.4006,16);
            waypoints[waypoints.size] = (1171.772,245.1124,16);
            waypoints[waypoints.size] = (921.8568,244.5751,16);
            waypoints[waypoints.size] = (746.7819,247.3626,16);
            waypoints[waypoints.size] = (750.6678,399.2646,16);
            waypoints[waypoints.size] = (762.3551,73.41199,12.125);
            waypoints[waypoints.size] = (1055.199,101.4221,8.125848);
            waypoints[waypoints.size] = (1299.016,101.9946,8.125894);
            waypoints[waypoints.size] = (1536.126,91.05177,8.125427);
            waypoints[waypoints.size] = (1672.663,-40.5409,8.125259);
            waypoints[waypoints.size] = (1857.629,-38.42155,8.125);
            waypoints[waypoints.size] = (1826.492,-277.0891,8.125004);
            waypoints[waypoints.size] = (1583.365,-383.1444,8.125216);
            waypoints[waypoints.size] = (1577.979,-256.7838,8.124635);
            waypoints[waypoints.size] = (1369.673,-396.4443,8.125503);
            waypoints[waypoints.size] = (1056.705,-384.2697,8.125);
            waypoints[waypoints.size] = (788.0985,-386.2401,8.124083);
            waypoints[waypoints.size] = (567.009,-376.2519,60.59477);
            waypoints[waypoints.size] = (577.5723,-63.07886,59.52307);
            waypoints[waypoints.size] = (582.7538,-233.6768,65.62864);
            waypoints[waypoints.size] = (931.1776,-135.0334,8.125);
        }
        break;
        case "mp_overwatch":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (-406.2904,1629.884,12864.13);
            waypoints[waypoints.size] = (-520.8412,1539.775,12864.13);
            waypoints[waypoints.size] = (-513.449,1139.46,12864.13);
            waypoints[waypoints.size] = (-136.8869,1140.529,12865.13);
            waypoints[waypoints.size] = (86.6787,1139.51,12865.12);
            waypoints[waypoints.size] = (264.4485,1149.337,12865.19);
            waypoints[waypoints.size] = (329.5155,1464.434,12868.13);
            waypoints[waypoints.size] = (466.6211,1133.387,12864.13);
            waypoints[waypoints.size] = (523.4501,862.8259,12864.13);
            waypoints[waypoints.size] = (465.2554,560.4239,12864);
            waypoints[waypoints.size] = (644.2165,341.9449,12864);
            waypoints[waypoints.size] = (588.2057,430.1336,12864);
            waypoints[waypoints.size] = (131.9551,561.2924,12864.13);
            waypoints[waypoints.size] = (-37.28012,451.5287,12864.13);
            waypoints[waypoints.size] = (-135.0978,525.6624,12864.13);
            waypoints[waypoints.size] = (-471.1022,604.2038,12864);
            waypoints[waypoints.size] = (-466.7968,782.6957,12864);
            waypoints[waypoints.size] = (-347.9998,921.6656,12864.13);
            waypoints[waypoints.size] = (-79.5697,851.1858,12864.13);
            waypoints[waypoints.size] = (134.8587,881.9678,12864.13);
            waypoints[waypoints.size] = (-630.2908,674.4813,12864);
            waypoints[waypoints.size] = (-646.5624,406.6285,12870.51);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (-4601.98,11742.78,13360.13);
            waypoints[waypoints.size] = (-4820.043,11726.95,13360.13);
            waypoints[waypoints.size] = (-5014.631,11735.57,13360.13);
            waypoints[waypoints.size] = (-5214.437,11724.5,13360.13);
            waypoints[waypoints.size] = (-5186.525,12198.28,13360.13);
            waypoints[waypoints.size] = (-4931.667,12186.3,13360.13);
            waypoints[waypoints.size] = (-4725.113,12175.8,13360.13);
            waypoints[waypoints.size] = (-4575.046,12165.62,13360.13);
            waypoints[waypoints.size] = (-4578.076,12604.19,13360.13);
            waypoints[waypoints.size] = (-4785.521,12635.16,13360.13);
            waypoints[waypoints.size] = (-5018.954,12618.44,13360.13);
            waypoints[waypoints.size] = (-5231.179,12609.62,13360.13);
            waypoints[waypoints.size] = (-5112.067,12437.05,13360.13);
            waypoints[waypoints.size] = (-5052.327,12001.03,13360.13);
            waypoints[waypoints.size] = (-4767.421,11938.39,13360.13);
            waypoints[waypoints.size] = (-4841.537,12392.91,13360.13);
            waypoints[waypoints.size] = (-4583.405,13129.24,13360.13);
            waypoints[waypoints.size] = (-4773.725,13111.99,13360.13);
            waypoints[waypoints.size] = (-5003.898,13113.15,13360.13);
            waypoints[waypoints.size] = (-5211.374,13098.02,13360.13);
            waypoints[waypoints.size] = (-5173.512,13534.62,13360.13);
            waypoints[waypoints.size] = (-4969.5,13544.1,13360.13);
            waypoints[waypoints.size] = (-4694.718,13540.73,13360.13);
            waypoints[waypoints.size] = (-4573.344,13535.87,13360.13);
            waypoints[waypoints.size] = (-4870.934,12944.12,13360.13);
            waypoints[waypoints.size] = (-5110.724,12902.18,13360.13);
            waypoints[waypoints.size] = (-5073.195,13275.35,13360.13);
            waypoints[waypoints.size] = (-4835.846,13281.74,13360.13);
        }
        break;
        case "mp_paris":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (-3253.152,1753.99,251.0336);
            waypoints[waypoints.size] = (-3153.663,1836.592,252.5605);
            waypoints[waypoints.size] = (-2938.684,1840.619,240.3541);
            waypoints[waypoints.size] = (-3488.369,1969.522,247.2401);
            waypoints[waypoints.size] = (-3247.856,2125.322,223.4271);
            waypoints[waypoints.size] = (-2831.409,2146.39,222.0054);
            waypoints[waypoints.size] = (-2380.362,2144.593,223.1866);
            waypoints[waypoints.size] = (-1833.579,2139.483,222.2546);
            waypoints[waypoints.size] = (-1778.015,2441.861,221.3166);
            waypoints[waypoints.size] = (-1225.381,2482.188,221.0828);
            waypoints[waypoints.size] = (-1066.389,2528.315,225.6851);
            waypoints[waypoints.size] = (-1081.649,2894.877,222.7102);
            waypoints[waypoints.size] = (-1222.364,2165.613,226.424);
            waypoints[waypoints.size] = (-2636.989,1860.76,244.1817);
            waypoints[waypoints.size] = (-2199.47,1895.421,246.4948);
            waypoints[waypoints.size] = (-1529.28,1899.979,237.702);
            waypoints[waypoints.size] = (-1415.36,2125.572,235.2589);
            waypoints[waypoints.size] = (-1582.037,2254.59,236.6492);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (2436.245,458.8801,-1.180207);
            waypoints[waypoints.size] = (2539.397,457.736,-2.619485);
            waypoints[waypoints.size] = (2437.29,579.4452,-21.50364);
            waypoints[waypoints.size] = (2444.53,742.925,-21.37867);
            waypoints[waypoints.size] = (2773.804,751.9639,-26.65718);
            waypoints[waypoints.size] = (3488.584,685.6188,-41.23589);
            waypoints[waypoints.size] = (3554.69,1143.663,-47.24815);
            waypoints[waypoints.size] = (3254.034,1027.869,-27.34431);
            waypoints[waypoints.size] = (2509.568,986.0261,-30.63266);
            waypoints[waypoints.size] = (3504.297,1719.956,-52.553);
            waypoints[waypoints.size] = (3188.811,1780.795,-39.13511);
            waypoints[waypoints.size] = (2326.923,1801.396,-29.77646);
            waypoints[waypoints.size] = (2121.648,1912.561,-28.15075);
            waypoints[waypoints.size] = (2109.456,1779.1,-24.73109);
            waypoints[waypoints.size] = (2047.183,1790.716,-22.73685);
            waypoints[waypoints.size] = (2041.357,1885.839,-23.8962);
        }
        break;
        case "mp_park":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (1542.409,-148.6454,-8.581031);
            waypoints[waypoints.size] = (1484.779,-333.0076,-47.05649);
            waypoints[waypoints.size] = (1156.852,-166.4655,-47.875);
            waypoints[waypoints.size] = (978.6273,-74.35962,-47.875);
            waypoints[waypoints.size] = (882.8915,-168.3757,-47.875);
            waypoints[waypoints.size] = (559.1727,-3.152351,152.125);
            waypoints[waypoints.size] = (868.1205,-372.1453,-47.875);
            waypoints[waypoints.size] = (1243.88,-535.9251,-45.37202);
            waypoints[waypoints.size] = (1336.475,-416.6397,-49.20008);
            waypoints[waypoints.size] = (1581.298,-533.5612,-46.57465);
            waypoints[waypoints.size] = (1469.489,-617.6468,-38.83818);
            waypoints[waypoints.size] = (1879.515,-686.0585,14.75633);
            waypoints[waypoints.size] = (2097.109,-793.1882,166.9924);
            waypoints[waypoints.size] = (2291.209,-835.8206,200.125);
            waypoints[waypoints.size] = (2160.901,-832.1773,196.2999);
            waypoints[waypoints.size] = (2179.538,-978.9461,200.125);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (-1961.851,-1599.144,224);
            waypoints[waypoints.size] = (-1440.548,-1358.521,172.7388);
            waypoints[waypoints.size] = (-1509.801,-1563.531,196.8259);
            waypoints[waypoints.size] = (-1530.069,-1609.058,213.4091);
            waypoints[waypoints.size] = (-1536.17,-1659.121,224.125);
            waypoints[waypoints.size] = (-1578.989,-1884.128,224);
            waypoints[waypoints.size] = (-1144.735,-1855.301,224.125);
            waypoints[waypoints.size] = (-823.3064,-1815.427,229.2246);
            waypoints[waypoints.size] = (-856.0951,-1883.905,226.3463);
            waypoints[waypoints.size] = (-994.4929,-2235.615,224.125);
            waypoints[waypoints.size] = (-1159.129,-2293.43,224.125);
            waypoints[waypoints.size] = (-1087.826,-2426.656,208.125);
            waypoints[waypoints.size] = (-670.2519,-2537.388,208.1247);
            waypoints[waypoints.size] = (-617.7921,-2401.779,224.125);
            waypoints[waypoints.size] = (-64.91908,-2548.292,224.1254);
            waypoints[waypoints.size] = (-121.5972,-2728.903,208.125);
            waypoints[waypoints.size] = (368.5055,-2939.536,208.125);
            waypoints[waypoints.size] = (136.1209,-2907.616,208);
            waypoints[waypoints.size] = (121.0585,-2019.707,226.0486);
            waypoints[waypoints.size] = (278.8338,-2635.814,224);
        }
        else if (level.mapVariation == 2)
        {
            waypoints[waypoints.size] = (-3998.371,156.7932,334.9687);
            waypoints[waypoints.size] = (-3963.674,465.2947,340);
            waypoints[waypoints.size] = (-3818.271,458.0439,352.125);
            waypoints[waypoints.size] = (-3636.352,874.4804,352.125);
            waypoints[waypoints.size] = (-3671.704,662.4914,352.1237);
            waypoints[waypoints.size] = (-3710.357,472.9914,352.126);
            waypoints[waypoints.size] = (-3730.548,307.5466,352.1248);
            waypoints[waypoints.size] = (-3851.008,299.1561,352.125);
            waypoints[waypoints.size] = (-3891.374,109.0384,352.125);
            waypoints[waypoints.size] = (-3784.387,-9.793998,352.1238);
            waypoints[waypoints.size] = (-3818.299,-178.0162,352.1253);
            waypoints[waypoints.size] = (-3858.734,-411.5035,352.125);
            waypoints[waypoints.size] = (-3658.371,111.1881,352.125);
            waypoints[waypoints.size] = (-3590.013,201.4333,352.125);
            waypoints[waypoints.size] = (-3651.139,277.2249,352.1233);
            waypoints[waypoints.size] = (-3358.202,180.5243,216.125);
            waypoints[waypoints.size] = (-3487.011,192.8846,280.125);
        }
        break;
        case "mp_plaza2":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (943.5552,543.305,648.125);
            waypoints[waypoints.size] = (1293.745,565.032,648.125);
            waypoints[waypoints.size] = (1275.62,1269.127,648.125);
            waypoints[waypoints.size] = (881.5327,1270.596,648.125);
            waypoints[waypoints.size] = (942.816,1048.127,685.6087);
            waypoints[waypoints.size] = (942.0378,909.22,740.125);
            waypoints[waypoints.size] = (940.5735,801.6183,700.125);
            waypoints[waypoints.size] = (1065.49,917.2958,788.125);
            waypoints[waypoints.size] = (1270.517,912.2889,832.125);
            waypoints[waypoints.size] = (1282.075,602.6445,832.125);
            waypoints[waypoints.size] = (760.1238,595.5648,862.6258);
            waypoints[waypoints.size] = (696.0586,765.0539,832.125);
            waypoints[waypoints.size] = (697.0834,1179.659,832.125);
            waypoints[waypoints.size] = (857.1237,1226.209,832.125);
            waypoints[waypoints.size] = (1119.287,1218.844,832.125);
            waypoints[waypoints.size] = (1292.64,1143.887,832.125);
            waypoints[waypoints.size] = (587.6498,845.3603,840.125);
            waypoints[waypoints.size] = (577.0011,985.295,840.125);
            waypoints[waypoints.size] = (685.0209,913.8655,832.125);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (-2780.696,505.6218,2624.125);
            waypoints[waypoints.size] = (-2799.521,224.3278,2624.125);
            waypoints[waypoints.size] = (-2836.816,-15.48715,2624.124);
            waypoints[waypoints.size] = (-2867.542,-320.5099,2624.125);
            waypoints[waypoints.size] = (-2036.995,-346.6309,2624.125);
            waypoints[waypoints.size] = (-2047.875,545.695,2624.125);
            waypoints[waypoints.size] = (-2433.27,91.18671,2624.125);
            waypoints[waypoints.size] = (-2404.9,-504.4344,2624.125);
            waypoints[waypoints.size] = (-2416.665,-211.6269,2624.125);
            waypoints[waypoints.size] = (-2421.055,307.2179,2624.125);
            waypoints[waypoints.size] = (-2400.596,619.2254,2624.125);
            waypoints[waypoints.size] = (-2047.873,58.5195,2624.125);
        }
        else if (level.mapVariation == 2)
        {
            waypoints[waypoints.size] = (1667.633,2456.735,637.1203);
            waypoints[waypoints.size] = (2138.025,2689.049,636.432);
            waypoints[waypoints.size] = (2092.344,2802.568,653.1475);
            waypoints[waypoints.size] = (1596.852,2578.891,655.3287);
            waypoints[waypoints.size] = (1663.031,2957.356,703.5884);
            waypoints[waypoints.size] = (1362.531,3444.834,755.1842);
            waypoints[waypoints.size] = (1220.199,3679.733,763.678);
            waypoints[waypoints.size] = (1014.752,4016.146,750.1177);
            waypoints[waypoints.size] = (784.7642,4387.793,710.4678);
            waypoints[waypoints.size] = (469.9045,4678.723,649.8453);
            waypoints[waypoints.size] = (392.9397,4783.478,634.8752);
            waypoints[waypoints.size] = (605.5652,4307.7,709.9465);
            waypoints[waypoints.size] = (935.2009,4608.674,692.9888);
            waypoints[waypoints.size] = (1127.493,4357.356,729.3337);
            waypoints[waypoints.size] = (737.6279,4053.234,738.8895);
            waypoints[waypoints.size] = (903.9761,3775.667,759.0983);
            waypoints[waypoints.size] = (1285.165,3961.395,758.9294);
            waypoints[waypoints.size] = (1677.309,3343.44,739.1848);
            waypoints[waypoints.size] = (1319.193,3092.24,732.6744);
        }
        break;
        case "mp_qadeem":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (-883.6621,-452.5157,336);
            waypoints[waypoints.size] = (-883.9026,-516.3265,336);
            waypoints[waypoints.size] = (-694.2937,-514.6498,336);
            waypoints[waypoints.size] = (-458.0049,-517.8541,336);
            waypoints[waypoints.size] = (-444.3506,-244.2461,336);
            waypoints[waypoints.size] = (-429.4286,-673.6345,336);
            waypoints[waypoints.size] = (-216.7095,-683.1109,336);
            waypoints[waypoints.size] = (-224.8125,-227.5199,320);
            waypoints[waypoints.size] = (183.4632,-238.6831,320);
            waypoints[waypoints.size] = (230.2457,-454.2088,320);
            waypoints[waypoints.size] = (-201.4231,-454.2569,320);
            waypoints[waypoints.size] = (248.5632,-662.8916,336);
            waypoints[waypoints.size] = (465.6891,-681.5254,336);
            waypoints[waypoints.size] = (464.6269,-473.0708,336);
            waypoints[waypoints.size] = (467.3508,-225.5821,336);
            waypoints[waypoints.size] = (811.0519,-237.3949,336);
            waypoints[waypoints.size] = (894.3676,-242.1096,345.4135);
            waypoints[waypoints.size] = (12.26179,-25.69197,320);
            waypoints[waypoints.size] = (10.55296,137.3751,220);
            waypoints[waypoints.size] = (-331.7925,247.3136,220);
            waypoints[waypoints.size] = (-246.6255,242.456,220);
            waypoints[waypoints.size] = (41.90002,354.2865,220);
            waypoints[waypoints.size] = (240.8192,267.8629,219.6012);
            waypoints[waypoints.size] = (392.6597,310.5529,180.1379);
            waypoints[waypoints.size] = (653.6313,398.5226,176);
            waypoints[waypoints.size] = (753.7194,339.1332,176);
            waypoints[waypoints.size] = (755.7012,467.7138,176);
            waypoints[waypoints.size] = (866.7803,473.0306,152.3623);
            waypoints[waypoints.size] = (866.0097,338.2388,152);
            waypoints[waypoints.size] = (880.8748, -202.9528, 336.125);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (6592.689,5213.504,157.3101);
            waypoints[waypoints.size] = (6772.17,5348.036,157.1531);
            waypoints[waypoints.size] = (6896.246,5188.015,102.904);
            waypoints[waypoints.size] = (6698.088,5071.687,108.9526);
            waypoints[waypoints.size] = (6607.681,5174.913,146.3919);
            waypoints[waypoints.size] = (6796.167,5298.652,142.3879);
            waypoints[waypoints.size] = (7037.497,4964.833,45.65077);
            waypoints[waypoints.size] = (6907.48,4831.339,40.36137);
            waypoints[waypoints.size] = (7134.077,4513.386,-16.69343);
            waypoints[waypoints.size] = (7346.734,4574.857,-24.02195);
            waypoints[waypoints.size] = (7559.193,4282.12,-23.64618);
            waypoints[waypoints.size] = (7442.511,4120.407,-18.17179);
            waypoints[waypoints.size] = (7660.838,3851.619,29.14485);
            waypoints[waypoints.size] = (7831.196,3934.019,35.99103);
            waypoints[waypoints.size] = (8079.752,3612.614,126.6663);
            waypoints[waypoints.size] = (7933.119,3521.237,122.4819);
            waypoints[waypoints.size] = (7979.212,3402.546,156.0595);
            waypoints[waypoints.size] = (8137.344,3525.109,155.3149);
            waypoints[waypoints.size] = (8238.821,3418.554,200.7803);
            waypoints[waypoints.size] = (8038.883,3296.515,193.394);
            waypoints[waypoints.size] = (7655.697,4011.54,8.119015);
            waypoints[waypoints.size] = (7429.178,4305.117,-28.98523);
            waypoints[waypoints.size] = (7164.991,4670.432,-5.014697);
            waypoints[waypoints.size] = (6773.604,5167.916,117.497);
            waypoints[waypoints.size] = (7872.536,3715.756,76.30908);
        }
        break;
        case "mp_radar":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (-1771.495,4493.338,1166.725);
            waypoints[waypoints.size] = (-2344.122,4629.131,1166.725);
            waypoints[waypoints.size] = (-1984.637,4615.495,1166.725);
            waypoints[waypoints.size] = (-1974.172,4146.324,1166.725);
            waypoints[waypoints.size] = (-2371.129,4127.023,1166.725);
            waypoints[waypoints.size] = (-2183.811,4355.544,1166.725);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (-5811.395,4402.337,1312.468);
            waypoints[waypoints.size] = (-6030.826,4332.612,1311.486);
            waypoints[waypoints.size] = (-6303.241,4303.829,1320.002);
            waypoints[waypoints.size] = (-6717.946,4428.004,1329.309);
            waypoints[waypoints.size] = (-6902.115,4631.801,1308.26);
            waypoints[waypoints.size] = (-7142.955,4490.086,1313.37);
            waypoints[waypoints.size] = (-6969.65,4220.604,1320.54);
            waypoints[waypoints.size] = (-7233.341,4222.938,1308.874);
            waypoints[waypoints.size] = (-7243.797,4114.249,1352.125);
            waypoints[waypoints.size] = (-7417.571,4051.971,1352.125);
            waypoints[waypoints.size] = (-7300.924,3901.854,1360.125);
            waypoints[waypoints.size] = (-7592.021,3910.368,1360.125);
            waypoints[waypoints.size] = (-7388.511,3716.981,1360.125);
            waypoints[waypoints.size] = (-7149.612,3457.81,1360.125);
            waypoints[waypoints.size] = (-7095.903,3293.565,1360.125);
            waypoints[waypoints.size] = (-7090.695,3182.798,1306.949);
            waypoints[waypoints.size] = (-6949.404,4044.812,1319.557);
            waypoints[waypoints.size] = (-6868.988,3725.91,1316.877);
            waypoints[waypoints.size] = (-6777.335,3738.265,1335.125);
            waypoints[waypoints.size] = (-6549.842,3757.877,1356.317);
            waypoints[waypoints.size] = (-6384.777,3746.468,1339.448);
            waypoints[waypoints.size] = (-5791.471,3555.939,1333.125);
            waypoints[waypoints.size] = (-5939.712,3558.475,1339.256);
            waypoints[waypoints.size] = (-6240.846,3493.024,1335.127);
            waypoints[waypoints.size] = (-6905.782,3083.833,1306.708);
            waypoints[waypoints.size] = (-6696.76,2842.746,1322.742);
            waypoints[waypoints.size] = (-6457.48,2935.736,1330.296);
            waypoints[waypoints.size] = (-7258.608,2926.655,1287.406);
            waypoints[waypoints.size] = (-6941.542,2768.419,1298.016);
        }
        break;
        case "mp_restrepo_ss":
            waypoints[waypoints.size] = (529.7711,-197.3505,1767.419);
            waypoints[waypoints.size] = (838.9585,-186.4518,1773.339);
            waypoints[waypoints.size] = (832.6954,-111.1965,1767.125);
            waypoints[waypoints.size] = (678.2698,109.0359,1767.125);
            waypoints[waypoints.size] = (672.7014,233.9393,1746.366);
            waypoints[waypoints.size] = (503.1099,228.9094,1742.618);
            waypoints[waypoints.size] = (317.0795,261.7193,1754.961);
            waypoints[waypoints.size] = (528.1328,747.1552,1697.323);
            waypoints[waypoints.size] = (515.5901,515.4362,1719.083);
            waypoints[waypoints.size] = (408.8714,520.2925,1708.558);
            waypoints[waypoints.size] = (561.8433,319.1325,1746.594);
            waypoints[waypoints.size] = (570.2711,453.4537,1822.251);
            waypoints[waypoints.size] = (549.6586,543.2178,1820.502);
            waypoints[waypoints.size] = (10.91213, 242.3685, 1664.692);
        break;
        case "mp_roughneck":
            waypoints[waypoints.size] = (-1483.544,352.4547,-7.875003);
            waypoints[waypoints.size] = (-1378.604,472.1647,-7.875003);
            waypoints[waypoints.size] = (-1232.354,582.1242,-7.874998);
            waypoints[waypoints.size] = (-1258.772,831.718,-7.875002);
            waypoints[waypoints.size] = (-1184.135,1070.368,-9.000001);
            waypoints[waypoints.size] = (-881.3358,1188.255,-7.875);
            waypoints[waypoints.size] = (-680.9191,1070.762,-7.874997);
            waypoints[waypoints.size] = (-535.4742,1224.731,-7.874998);
            waypoints[waypoints.size] = (-461.3873,1298.008,-7.999997);
            waypoints[waypoints.size] = (-535.377,769.4102,-7.875);
            waypoints[waypoints.size] = (-633.3344,493.7049,-7.875001);
            waypoints[waypoints.size] = (-907.3005,421.3894,-6.000003);
            waypoints[waypoints.size] = (-469.2297,364.0029,-7.875004);
            waypoints[waypoints.size] = (-65.10684,815.3013,-7.875001);
            waypoints[waypoints.size] = (-825.7244,-72.64057,-7.875003);
        break;
        case "mp_seatown":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (-1666.093,-1361.806,288.125);
            waypoints[waypoints.size] = (-2295.571,-1362.443,288.125);
            waypoints[waypoints.size] = (-2116.977,-1453.422,288.125);
            waypoints[waypoints.size] = (-2232.04,-1661.87,291.3815);
            waypoints[waypoints.size] = (-2229.858,-1871.236,288.125);
            waypoints[waypoints.size] = (-2101.966,-1861.801,238.7944);
            waypoints[waypoints.size] = (-1903.168,-1863.316,152.1249);
            waypoints[waypoints.size] = (-1623.869,-1819.863,152.125);
            waypoints[waypoints.size] = (-2028.602,-1696.516,288.125);
            waypoints[waypoints.size] = (-1931.877,-1697.96,229.4015);
            waypoints[waypoints.size] = (-1773.873,-1690.109,152.1254);
            waypoints[waypoints.size] = (-1761.263,-1519.878,152.125);
            waypoints[waypoints.size] = (-1789.831,-1337.071,155.1045);
            waypoints[waypoints.size] = (-2041.719,-1476.726,152.125);
            waypoints[waypoints.size] = (-2251.574,-1448.917,152.125);
            waypoints[waypoints.size] = (-2217.644,-1077.203,152.125);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (-2439.69,-3360.033,192.125);
            waypoints[waypoints.size] = (-2638.531,-3388.036,192.125);
            waypoints[waypoints.size] = (-2569.829,-3181.846,192.125);
            waypoints[waypoints.size] = (-2789.685,-3097.227,192.125);
            waypoints[waypoints.size] = (-2813.082,-2735.084,192.1256);
            waypoints[waypoints.size] = (-2578.516,-2580.851,192.125);
            waypoints[waypoints.size] = (-2375.32,-2701.87,192.125);
            waypoints[waypoints.size] = (-2373.759,-3038.068,192.125);
            waypoints[waypoints.size] = (-2411.561,-2247.484,192.125);
            waypoints[waypoints.size] = (-2144.679,-2219.169,192.125);
            waypoints[waypoints.size] = (-2351.671,-2465.104,192.125);
            waypoints[waypoints.size] = (-2128.797,-2470.807,192.125);
            waypoints[waypoints.size] = (-2135.22,-2704.514,192.125);
            waypoints[waypoints.size] = (-2172.872,-2967.663,192.125);
            waypoints[waypoints.size] = (-2142.967,-3302.833,192.125);
            waypoints[waypoints.size] = (-2362.438,-3200.492,192.125);
            waypoints[waypoints.size] = (-2823.673,-3432.932,326.1047);
            waypoints[waypoints.size] = (-2800.832,-3216.833,192.1248);
        }
        break;
        case "mp_shipbreaker":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (1983.8,-1621.756,649.0497);
            waypoints[waypoints.size] = (2142.267,-1621.142,640.5475);
            waypoints[waypoints.size] = (2152.796,-1906.581,644.0638);
            waypoints[waypoints.size] = (2479.804,-1823.46,627.6485);
            waypoints[waypoints.size] = (2282.781,-2409.41,636.6235);
            waypoints[waypoints.size] = (1681.5,-2423.291,665.4046);
            waypoints[waypoints.size] = (1822.66,-2035.621,663.2489);
            waypoints[waypoints.size] = (1374.967,-2261.973,700.9289);
            waypoints[waypoints.size] = (1657.594,-2264.304,662.3962);
            waypoints[waypoints.size] = (1997.328,-2453.97,672.6488);
            waypoints[waypoints.size] = (1579.577,-2675.828,662.79);
            waypoints[waypoints.size] = (1180.57,-2998.284,648.4774);
            waypoints[waypoints.size] = (1089.931,-2957.274,637.3516);
            waypoints[waypoints.size] = (1391.522,-3036.973,658.6253);
            waypoints[waypoints.size] = (1510.024,-2811.242,656.7886);
            waypoints[waypoints.size] = (2220.751,-2135.227,652.705);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (3722.786,-3418.007,714.4608);
            waypoints[waypoints.size] = (3587.19,-3459.176,719.9304);
            waypoints[waypoints.size] = (3530.63,-3335.556,706.8047);
            waypoints[waypoints.size] = (3666.412,-3282.439,710.8364);
            waypoints[waypoints.size] = (3794.755,-3158.193,719.7469);
            waypoints[waypoints.size] = (3645.658,-3040.638,695.3332);
            waypoints[waypoints.size] = (3487.987,-2950.869,683.6936);
            waypoints[waypoints.size] = (3425.224,-3027.839,694.4213);
            waypoints[waypoints.size] = (3316.642,-3157.994,697.5085);
            waypoints[waypoints.size] = (3504.199,-3195.32,694.8839);
            waypoints[waypoints.size] = (3155.203,-3037.218,677.5851);
            waypoints[waypoints.size] = (2942.458,-2921.681,662.2849);
            waypoints[waypoints.size] = (2791.854,-2816.153,653.8852);
            waypoints[waypoints.size] = (2625.506,-2501.898,626.9139);
            waypoints[waypoints.size] = (2784.675,-2633.823,637.6372);
            waypoints[waypoints.size] = (2618.266,-2744.083,679.7368);
            waypoints[waypoints.size] = (2450.719,-2651.249,640.8622);
            waypoints[waypoints.size] = (3044.466,-2716.531,655.1351);
            waypoints[waypoints.size] = (3255.748,-3082.852,682.7839);
            waypoints[waypoints.size] = (2982.301,-2809.192,650.2334);
        }
        else if (level.mapVariation == 2)
        {
            waypoints[waypoints.size] = (-715.4902,-408.8842,877.4859);
            waypoints[waypoints.size] = (-694.4357,-323.9024,874.298);
            waypoints[waypoints.size] = (-658.0244,-296.1063,842.082);
            waypoints[waypoints.size] = (-289.3806,-697.3499,843.3137);
            waypoints[waypoints.size] = (-324.6098,-728.2029,871.3754);
            waypoints[waypoints.size] = (-404.2971,-730.1851,876.6087);
            waypoints[waypoints.size] = (-248.1755,-652.7314,834.0011);
            waypoints[waypoints.size] = (-367.6561,-539.7928,834.9575);
            waypoints[waypoints.size] = (-477.264,-397.8221,833.5543);
            waypoints[waypoints.size] = (-617.7537,-250.1201,833.7929);
            waypoints[waypoints.size] = (-478.5413,-103.3935,816.1345);
            waypoints[waypoints.size] = (-379.5517,-219.8404,812.6868);
            waypoints[waypoints.size] = (-264.1618,-338.9384,816.3745);
            waypoints[waypoints.size] = (-180.5209,-105.2104,797.1117);
            waypoints[waypoints.size] = (-273.0175,-33.95533,798.8137);
            waypoints[waypoints.size] = (-273.5768,130.1661,789.0936);
            waypoints[waypoints.size] = (-165.6867,239.9997,775.639);
            waypoints[waypoints.size] = (-42.0064,333.0668,762.1673);
            waypoints[waypoints.size] = (135.5775,419.4701,745.6316);
            waypoints[waypoints.size] = (24.96247,264.8956,761.9207);
            waypoints[waypoints.size] = (-104.2296,118.7172,778.9033);
            waypoints[waypoints.size] = (-44.73001,-78.67265,786.8173);
            waypoints[waypoints.size] = (181.14,-129.9317,775.3651);
            waypoints[waypoints.size] = (248.4642,-203.8857,775.4394);
            waypoints[waypoints.size] = (259.2029,-32.01558,764.5335);
            waypoints[waypoints.size] = (368.501,7.216195,755.1852);
            waypoints[waypoints.size] = (397.6166,-101.0569,759.7524);
            waypoints[waypoints.size] = (282.2161,-114.7337,755.9274);
        }
        break;
        case "mp_six_ss":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (-889.9166,-685.5502,188.2217);
            waypoints[waypoints.size] = (-924.0925,-828.2081,191.7361);
            waypoints[waypoints.size] = (-1006.3,-624.215,190.9741);
            waypoints[waypoints.size] = (-1064.443,-817.497,190);
            waypoints[waypoints.size] = (-1219.662,-715.7458,193.7533);
            waypoints[waypoints.size] = (-1453.523,-593.1906,194);
            waypoints[waypoints.size] = (-1248.238,-553.4619,194);
            waypoints[waypoints.size] = (-1283.474,-252.4881,198.6832);
            waypoints[waypoints.size] = (-1473.784,-264.8684,194);
            waypoints[waypoints.size] = (-1368.339,31.40477,202.3261);
            waypoints[waypoints.size] = (-1142.08,29.88909,249.2468);
            waypoints[waypoints.size] = (-1356.223,301.7762,202.2895);
            waypoints[waypoints.size] = (-1301.147,574.2062,210.6939);
            waypoints[waypoints.size] = (-1048.734,816.6163,217.2558);
            waypoints[waypoints.size] = (-1345.286,870.3766,209.8427);
            waypoints[waypoints.size] = (-1106.171,670.7076,209.7562);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (1198.044,-2123.927,192);
            waypoints[waypoints.size] = (1321.588,-2134.104,192);
            waypoints[waypoints.size] = (1266.552,-2022.42,192);
            waypoints[waypoints.size] = (1280.199,-1977.238,192);
            waypoints[waypoints.size] = (1464.547,-1938.483,192);
            waypoints[waypoints.size] = (1605.731,-1841.278,192);
            waypoints[waypoints.size] = (1644.304,-1696.031,189.1151);
            waypoints[waypoints.size] = (1638.573,-1544.719,192);
            waypoints[waypoints.size] = (1619.69,-1428.708,192);
            waypoints[waypoints.size] = (1496.576,-1332.234,192);
            waypoints[waypoints.size] = (1300.382,-1286.283,192);
            waypoints[waypoints.size] = (1101.864,-1352.351,192);
            waypoints[waypoints.size] = (1043.629,-1487.703,192);
            waypoints[waypoints.size] = (1031.474,-1627.782,191.3929);
            waypoints[waypoints.size] = (1119.969,-1837.347,192);
            waypoints[waypoints.size] = (1355.2,-1679.532,189.2217);
            waypoints[waypoints.size] = (1458.084,-1817.562,192);
            waypoints[waypoints.size] = (1228.924,-1751.057,191.4115);
            waypoints[waypoints.size] = (1229.724,-1545.009,192);
            waypoints[waypoints.size] = (1403.537,-1580.006,191.3789);
            waypoints[waypoints.size] = (1330.667,-1414.084,192);
        }
        else if (level.mapVariation == 2)
        {
            waypoints[waypoints.size] = (2461.776,-1325.189,192);
            waypoints[waypoints.size] = (2422.724,-1018.128,231.2389);
            waypoints[waypoints.size] = (2118.728,-1065.564,216.8322);
            waypoints[waypoints.size] = (2169.01,-1399.277,192);
            waypoints[waypoints.size] = (2228.774,-1772.013,190.3879);
            waypoints[waypoints.size] = (2293.787,-2323.847,192);
            waypoints[waypoints.size] = (2521.559,-2066.765,192);
            waypoints[waypoints.size] = (2505.909,-2317.237,192);
            waypoints[waypoints.size] = (1817.197,-1359.737,192);
            waypoints[waypoints.size] = (1789.35,-1068.566,207.3237);
            waypoints[waypoints.size] = (1571.86,-1169.811,187.4049);
            waypoints[waypoints.size] = (1209.221,-1096.441,198.3668);
            waypoints[waypoints.size] = (954.3101,-1212.307,191.5524);
            waypoints[waypoints.size] = (869.4318,-1495.516,192);
            waypoints[waypoints.size] = (890.3095,-1738.684,191.9607);
            waypoints[waypoints.size] = (982.8199,-1943.252,192);
            waypoints[waypoints.size] = (980.4637,-2178.216,192);
            waypoints[waypoints.size] = (972.498,-2440.771,198.9843);
            waypoints[waypoints.size] = (1198.732,-2470.646,200.6833);
            waypoints[waypoints.size] = (1242.771,-2167.867,192);
            waypoints[waypoints.size] = (1410.057,-2452.144,199.4383);
            waypoints[waypoints.size] = (1407.314,-2569.46,204.9222);
            waypoints[waypoints.size] = (1534.51,-2124.7,192);
            waypoints[waypoints.size] = (1860.371,-2351.671,193.8687);
            waypoints[waypoints.size] = (1894.289,-1965.198,192);
            waypoints[waypoints.size] = (2151.36,-2084.354,192);
            waypoints[waypoints.size] = (2101.24,-1667.846,188.8044);
            waypoints[waypoints.size] = (1284.89,-1928.162,192);
            waypoints[waypoints.size] = (1476.554,-1672.85,188.8773);
            waypoints[waypoints.size] = (1079.009,-1620.607,191.2161);
            waypoints[waypoints.size] = (1291.124,-1380.286,192);
        }
        break;
        case "mp_terminal_cls":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (246.6061,4167.143,40.125);
            waypoints[waypoints.size] = (624.7712,3753.226,40.125);
            waypoints[waypoints.size] = (1130.358,4027.027,40.125);
            waypoints[waypoints.size] = (1087.296,4586.28,40.125);
            waypoints[waypoints.size] = (1313.875,3320.234,40.125);
            waypoints[waypoints.size] = (1449.158,3819.982,38.125);
            waypoints[waypoints.size] = (1877.665,3746.595,52.12454);
            waypoints[waypoints.size] = (2432.747,3782.803,48.125);
            waypoints[waypoints.size] = (2431.024,4194.254,48.125);
            waypoints[waypoints.size] = (2431.89,4409.198,191.5181);
            waypoints[waypoints.size] = (2759.16,3982.838,84.125);
            waypoints[waypoints.size] = (2595.402,3442.513,48.125);
            waypoints[waypoints.size] = (2419.577,3148.779,72.125);
            waypoints[waypoints.size] = (1813.192,3018.418,40.125);
            waypoints[waypoints.size] = (1692.714,3377.876,40.125);
            waypoints[waypoints.size] = (1696.307,3805.034,40.125);
            waypoints[waypoints.size] = (1128.519,2845.981,40.125);
            waypoints[waypoints.size] = (627.8413,2635.537,40.125);
            waypoints[waypoints.size] = (322.6416,3256.328,40.125);
            waypoints[waypoints.size] = (111.4816,3831.948,40.125);
            waypoints[waypoints.size] = (610.4529,2813.211,45.7037);
            waypoints[waypoints.size] = (609.9446,3008.77,203.625);
            waypoints[waypoints.size] = (608.8327,3772.375,203.625);
            waypoints[waypoints.size] = (727.4998,3767.509,193.0807);
            waypoints[waypoints.size] = (960.3929,3766.779,52.02162);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (-388.2456,2807.48,40.125);
            waypoints[waypoints.size] = (-963.1502,2825.634,40.125);
            waypoints[waypoints.size] = (-1567.131,2856.344,40.125);
            waypoints[waypoints.size] = (-1269.253,3155.547,40.125);
            waypoints[waypoints.size] = (-707.6882,3188.526,40.125);
            waypoints[waypoints.size] = (-355.1854,3551.948,40.12556);
            waypoints[waypoints.size] = (-289.0125,4036.49,40.125);
            waypoints[waypoints.size] = (-278.0256,4333.731,40.125);
            waypoints[waypoints.size] = (-614.525,4264.66,40.12498);
            waypoints[waypoints.size] = (-922.6282,4243.782,40.12582);
            waypoints[waypoints.size] = (-1319.264,4259.342,40.12596);
            waypoints[waypoints.size] = (-1645.896,4066.859,40.12539);
            waypoints[waypoints.size] = (-1635.849,4460.894,40.12436);
            waypoints[waypoints.size] = (-1575.53,3606.47,40.125);
            waypoints[waypoints.size] = (-1565.562,3209.881,40.12611);
            waypoints[waypoints.size] = (-939.0685,3417.664,40.125);
            waypoints[waypoints.size] = (-918.7841,3972.996,40.125);
            waypoints[waypoints.size] = (-612.6995,3817.509,55.25);
        }
        else if (level.mapVariation == 2)
        {
            waypoints[waypoints.size] = (2569.506,5038.915,192.125);
            waypoints[waypoints.size] = (2350.767,5037.602,192.125);
            waypoints[waypoints.size] = (2309.466,5275.099,192.125);
            waypoints[waypoints.size] = (2598.073,5288.062,192.125);
            waypoints[waypoints.size] = (2596.918,5618.59,192.125);
            waypoints[waypoints.size] = (2256.84,5628.258,192.125);
            waypoints[waypoints.size] = (2247.064,5872.119,192.125);
            waypoints[waypoints.size] = (2566.791,5852.317,192.125);
            waypoints[waypoints.size] = (2049.795,5885.242,192.125);
            waypoints[waypoints.size] = (2056.774,6164.297,192.125);
            waypoints[waypoints.size] = (1765.833,6148.722,192.125);
            waypoints[waypoints.size] = (1789.686,5888.189,192.125);
            waypoints[waypoints.size] = (1475.903,5880.878,192.125);
            waypoints[waypoints.size] = (1494.784,6194.971,192.125);
            waypoints[waypoints.size] = (2306.309,6294.527,192.125);
            waypoints[waypoints.size] = (2295.443,6176.554,192.125);
        }
        break;
        case "mp_underground":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (-998.0133,3787.935,-127.875);
            waypoints[waypoints.size] = (-911.3917,3632.124,-121.3066);
            waypoints[waypoints.size] = (-1190.925,3725.581,-127.875);
            waypoints[waypoints.size] = (-1130.752,3464.061,-127.875);
            waypoints[waypoints.size] = (-947.5724,3291.856,-128);
            waypoints[waypoints.size] = (-1370.306,3447.237,-149.2319);
            waypoints[waypoints.size] = (-1484.128,3569.504,-127.875);
            waypoints[waypoints.size] = (-1843.571,3201.406,-127.875);
            waypoints[waypoints.size] = (-1589.452,3192.22,-255.8757);
            waypoints[waypoints.size] = (-1607.622,2852.224,-255.875);
            waypoints[waypoints.size] = (-1436.528,2762.835,-255.8758);
            waypoints[waypoints.size] = (-1454.277,2277.921,-255.875);
            waypoints[waypoints.size] = (-1836.382,2805.356,-219.5901);
            waypoints[waypoints.size] = (-1995.399,2732.485,-215.875);
            waypoints[waypoints.size] = (-2019.35,2169.696,-215.875);
            waypoints[waypoints.size] = (-1988.995,2981.448,-215.875);
            waypoints[waypoints.size] = (-2182.127,2834.84,-215.875);
            waypoints[waypoints.size] = (-1816.408,3071.69,-224.3457);
            waypoints[waypoints.size] = (-1314.759,3466.238,-127.875);
            waypoints[waypoints.size] = (-849.5073,3396.425,-128);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (456.3191,-1015.269,8.125001);
            waypoints[waypoints.size] = (739.5526,-546.3484,5.8);
            waypoints[waypoints.size] = (615.0104,-395.5304,8.124998);
            waypoints[waypoints.size] = (290.1607,-953.2531,8.000001);
            waypoints[waypoints.size] = (130.5361,-902.3724,3.7);
            waypoints[waypoints.size] = (-74.05907,-903.8788,3.1);
            waypoints[waypoints.size] = (38.92542,-1076.96,8.124293);
            waypoints[waypoints.size] = (36.26085,-703.2631,2.4);
            waypoints[waypoints.size] = (131.11,-522.4643,3.7);
            waypoints[waypoints.size] = (-70.3464,-533.3646,-1);
            waypoints[waypoints.size] = (-571.671,-464.9786,7.999998);
            waypoints[waypoints.size] = (-421.2934,-591.1396,-2.6);
            waypoints[waypoints.size] = (-281.637,-387.6024,8.124723);
            waypoints[waypoints.size] = (-248.4726,-747.452,3.5);
            waypoints[waypoints.size] = (-187.6784,-1066.429,8.125002);
            waypoints[waypoints.size] = (32.54412,-232.6686,8.124999);
            waypoints[waypoints.size] = (408.9318,-458.5514,8.124995);
        }
        break;
        case "mp_village":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (-5367.659,-3818.357,1344.125);
            waypoints[waypoints.size] = (-5401.533,-3363.619,1344.125);
            waypoints[waypoints.size] = (-5006.875,-3588.415,1344.125);
            waypoints[waypoints.size] = (-4591.574,-3380.407,1344.125);
            waypoints[waypoints.size] = (-4557.568,-3955.691,1344.125);
            waypoints[waypoints.size] = (-4220.148,-3630.679,1344.125);
            waypoints[waypoints.size] = (-3788.414,-3490.111,1344.125);
            waypoints[waypoints.size] = (-3778.18,-3943.262,1344.125);
            waypoints[waypoints.size] = (-3541.645,-3709.89,1344.125);
            waypoints[waypoints.size] = (-3140.462,-3522.513,1344.125);
            waypoints[waypoints.size] = (-3154.924,-3910.552,1344.125);
            waypoints[waypoints.size] = (-2756.397,-3659.165,1344.125);
            waypoints[waypoints.size] = (-2460.411,-3224.645,1344.125);
            waypoints[waypoints.size] = (-2308.696,-3505.94,1344.125);
            waypoints[waypoints.size] = (-2287.174,-3852.062,1344.125);
            waypoints[waypoints.size] = (-1800.871,-3861.471,1344.125);
            waypoints[waypoints.size] = (-1714.076,-3428.71,1344.125);
            waypoints[waypoints.size] = (-1767.279,-2883.021,1344.125);
            waypoints[waypoints.size] = (-1272.79,-3003.476,1344.125);
            waypoints[waypoints.size] = (-1255.002,-3375.671,1344.125);
            waypoints[waypoints.size] = (-1176.086,-3857.083,1344.125);
            waypoints[waypoints.size] = (-747.6812,-3759.779,1344.125);
            waypoints[waypoints.size] = (-783.3102,-3360.866,1344.125);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (-1878.072,963.6439,276.2899);
            waypoints[waypoints.size] = (-2126.751,1348.11,284.5155);
            waypoints[waypoints.size] = (-1986.737,1190.188,281.925);
            waypoints[waypoints.size] = (-1863.751,1403.247,269.1604);
            waypoints[waypoints.size] = (-1755.087,1149.997,268.8643);
            waypoints[waypoints.size] = (-1544.501,1334.458,252.6958);
            waypoints[waypoints.size] = (-1351.738,1481.324,238.3905);
            waypoints[waypoints.size] = (-1061.706,1602.04,260.1238);
            waypoints[waypoints.size] = (-735.2196,1786.019,243.2625);
            waypoints[waypoints.size] = (-512.4389,1732.373,231.4429);
            waypoints[waypoints.size] = (-960.6357,1423.509,136.9);
            waypoints[waypoints.size] = (-1047.634,1756.8,123.8073);
            waypoints[waypoints.size] = (-682.4146,1057.017,120.7834);
            waypoints[waypoints.size] = (-690.6092,1617.504,183.8678);
            waypoints[waypoints.size] = (-526.109,1928.184,256.8011);
            waypoints[waypoints.size] = (-194.0519,1968.72,264.4645);
            waypoints[waypoints.size] = (-133.0641,1894.734,275.8562);
            waypoints[waypoints.size] = (-1158.031,1390.374,197.9545);
            waypoints[waypoints.size] = (-1400.507,1350.17,238.438);
            waypoints[waypoints.size] = (-1754.983,1450.133,265.4109);
        }
        break;
        //Classic maps
        case "mp_afghan":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] =  (-2199,-400,-1440);
            waypoints[waypoints.size] =  (-2692,-400,-1440);
            waypoints[waypoints.size] = (-2863,-400,-1445);
            waypoints[waypoints.size] = (-3481,-400,-1425);
            waypoints[waypoints.size] = (-3750,379,-1448);
            waypoints[waypoints.size] = (-3750,920,-1448);
            waypoints[waypoints.size] = (-3541,-1314,-1448);
        }
        if (level.mapVariation == 1)
        {
        }
        break;
        case "mp_boneyard":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (22,-811,-124);
            waypoints[waypoints.size] = (60,-1777,-124);
            waypoints[waypoints.size] = (206,-2395,-123);
            waypoints[waypoints.size] = (673,-2961,-123);
            waypoints[waypoints.size] = (205,-3216,-75);
            waypoints[waypoints.size] = (-319,-2314,-72);
            waypoints[waypoints.size] = (-425,-1825,-73);
            waypoints[waypoints.size] = (-315,-3271,-1);
            waypoints[waypoints.size] = (-730,-2772,-3);
            waypoints[waypoints.size] = (-136,-2508,-67);
            waypoints[waypoints.size] = (1004,-4099,-46);
            waypoints[waypoints.size] = (697,-2318,-52);
            waypoints[waypoints.size] = (1040,-2853,-51);
            waypoints[waypoints.size] = (330,-1689,-52);
            waypoints[waypoints.size] = (-583,-1375,-82);
            waypoints[waypoints.size] = (-245,-2019,-64);
            waypoints[waypoints.size] = (-100,-2449,-63);
        }
        break;
        case "mp_brecourt":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (10860,6414,358);
            waypoints[waypoints.size] = (9972,6588,358);
            waypoints[waypoints.size] = (9901,7736,358);
            waypoints[waypoints.size] = (9856,8772,358);
            waypoints[waypoints.size] = (9535,8017,358);
            waypoints[waypoints.size] = (9591,6754,358);
            waypoints[waypoints.size] = (10570,6826,358);
            waypoints[waypoints.size] = (10855,7218,1486);
            waypoints[waypoints.size] = (12034,7271,1494);
            waypoints[waypoints.size] = (12824,7364,1486);
        }
        if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (679,229,30);
            waypoints[waypoints.size] = (877,-552,-32);
            waypoints[waypoints.size] = (851,-993,-41);
            waypoints[waypoints.size] = (1258,-856,-51);
            waypoints[waypoints.size] = (753,-913,-39);
            waypoints[waypoints.size] = (2230,-919,-33);
            waypoints[waypoints.size] = (-1104,-456,-14);
            waypoints[waypoints.size] = (-223,-682,-40);
            waypoints[waypoints.size] = (-89,-730,-10);
            waypoints[waypoints.size] = (661,-819,-19);
        }
        break;
        case "mp_checkpoint":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (2425,2216,11);
            waypoints[waypoints.size] = (2425,2800,11);
            waypoints[waypoints.size] = (2425,3400,11);
            waypoints[waypoints.size] = (3000,2216,11);
            waypoints[waypoints.size] = (3000,2800,11);
            waypoints[waypoints.size] = (3000,3400,11);
            waypoints[waypoints.size] = (3600,2216,11);
            waypoints[waypoints.size] = (3600,2800,11);
            waypoints[waypoints.size] = (3600,3400,11);
            waypoints[waypoints.size] = (2400,2216,11);
            waypoints[waypoints.size] = (2400,2800,11);
            waypoints[waypoints.size] = (2400,3400,11);
            waypoints[waypoints.size] = (1800,2216,11);
            waypoints[waypoints.size] = (1800,2800,11);
            waypoints[waypoints.size] = (1800,3400,11);
            waypoints[waypoints.size] = (1000,2216,11);
            waypoints[waypoints.size] = (1000,2800,11);
            waypoints[waypoints.size] = (1000,3400,11);
            waypoints[waypoints.size] = (200,2216,11);
            waypoints[waypoints.size] = (200,2800,11);
            waypoints[waypoints.size] = (200,3400,11);
        }
        break;
        case "mp_derail":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (1685,2654,130);
            waypoints[waypoints.size] = (1736,1901,139);
            waypoints[waypoints.size] = (2021,1458,144);
            waypoints[waypoints.size] = (2253,1239,144);
            waypoints[waypoints.size] = (2774,1221,144);
            waypoints[waypoints.size] = (2715,1686,144);
            waypoints[waypoints.size] = (2373,1630,144);
            waypoints[waypoints.size] = (2861,2018,144);
            waypoints[waypoints.size] = (2856,2620,144);
            waypoints[waypoints.size] = (2367,2265,158);
            waypoints[waypoints.size] = (2371,2702,158);
            waypoints[waypoints.size] = (2580,2701,160);
            waypoints[waypoints.size] = (1896,2368,158);
            waypoints[waypoints.size] = (1905,2736,294);
            waypoints[waypoints.size] = (1981,2994,294);
            waypoints[waypoints.size] = (2428,2952,294);
            waypoints[waypoints.size] = (2361,3383,294);
            waypoints[waypoints.size] = (1963,3291,294);
            waypoints[waypoints.size] = (2157,3412,294);
            waypoints[waypoints.size] = (1927,3414,430);
            waypoints[waypoints.size] = (2061,3113,158);
            waypoints[waypoints.size] = (1850,2699,294);
            waypoints[waypoints.size] = (1816,3217,158);

            waypoints[waypoints.size] = (1600,1567,158);
            waypoints[waypoints.size] = (1600,3100,158);
        }
        break;
        case "mp_estate":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (-2067,-1275,-400);
            waypoints[waypoints.size] = (-2500,-1400,-500);
            waypoints[waypoints.size] = (-2300,-350,-310);
            waypoints[waypoints.size] = (-2300,-800,-475);
            waypoints[waypoints.size] = (-3591,-700,-475);
            waypoints[waypoints.size] = (-2321,-901,-300);
        }
        break;
        case "mp_favela":
        case "mp_fav_tropical":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (1953,2640,296);
            waypoints[waypoints.size] = (1670,2492,291);
            waypoints[waypoints.size] = (2300,2889,291);
        }
        break;
        case "mp_highrise":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (-1067,-10013,2184);
            waypoints[waypoints.size] = (-1230,9703,2184);
            waypoints[waypoints.size] = (-1558,9688,2184);
            waypoints[waypoints.size] = (-612,9679,2184);
            waypoints[waypoints.size] = (-1278,10221,2184);
            waypoints[waypoints.size] = (-1047,10340,2184);
            waypoints[waypoints.size] = (-1052,11253,2184);
            waypoints[waypoints.size] = (-1627,11258,2184);
            waypoints[waypoints.size] = (-588,11323,2184);
            waypoints[waypoints.size] = (-667,10841,2184);
            waypoints[waypoints.size] = (-652,10338,2184);
            waypoints[waypoints.size] = (-1771,9922,2280);
            waypoints[waypoints.size] = (-2172,9890,2280);
            waypoints[waypoints.size] = (-2646,9902,2280);
            waypoints[waypoints.size] = (-2683,11197,2280);
            waypoints[waypoints.size] = (-1880,11312,2280);
            waypoints[waypoints.size] = (-2319,10223,2280);
            waypoints[waypoints.size] = (-1959,10209,2280);
            waypoints[waypoints.size] = (-1935,9645,2280);
            waypoints[waypoints.size] = (-829,-1855,128);
            waypoints[waypoints.size] = (-989,-2222,119);
            waypoints[waypoints.size] = (-1049,-3115,85);
            waypoints[waypoints.size] = (-983,-3778,68);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (2000,11342,3380);
            waypoints[waypoints.size] = (2000,11300,3380);
            waypoints[waypoints.size] = (2500,11690,3380);
            waypoints[waypoints.size] = (2000,11690,3380);
            waypoints[waypoints.size] = (1750,11342,3380);
            waypoints[waypoints.size] = (1750,11300,3380);

            waypoints[waypoints.size] = (2308,10863,4080);
            waypoints[waypoints.size] = (2308,10400,4080);
            waypoints[waypoints.size] = (2308,11200,4080);
            waypoints[waypoints.size] = (1896,10400,4080);
            waypoints[waypoints.size] = (1896,11200,4080);
            waypoints[waypoints.size] = (1500,10863,4080);
            waypoints[waypoints.size] = (1500,10400,4080);
            waypoints[waypoints.size] = (1500,11200,4080);

            waypoints[waypoints.size] = (4191,2666,2355);
            waypoints[waypoints.size] = (6000,2666,2355);
            waypoints[waypoints.size] = (4191,3144,2355);
            waypoints[waypoints.size] = (6000,3144,2355);
            waypoints[waypoints.size] = (4191,2000,2355);
            waypoints[waypoints.size] = (6000,2000,2355);
        }
        else if (level.mapVariation == 2)
        {
            waypoints[waypoints.size] = (-9161, 4163, 2320);
            waypoints[waypoints.size] = (-9161, 4863, 2320);
            waypoints[waypoints.size] = (-9161, 5563, 2320);
            waypoints[waypoints.size] = (-9161, 6263, 2320);
            waypoints[waypoints.size] = (-9761, 4163, 2320);
            waypoints[waypoints.size] = (-9761, 4863, 2320);
            waypoints[waypoints.size] = (-9761, 5563, 2320);
            waypoints[waypoints.size] = (-9761, 6263, 2320);
            waypoints[waypoints.size] = (-10261, 4163, 2320);
            waypoints[waypoints.size] = (-10261, 4863, 2320);
            waypoints[waypoints.size] = (-10261, 5563, 2320);
            waypoints[waypoints.size] = (-10261, 6263, 2320);
        }
        else if (level.mapVariation == 3)
        {
            waypoints[waypoints.size] = (-15333, 4210, 5423);
            waypoints[waypoints.size] = (-14633, 4210, 5423);
            waypoints[waypoints.size] = (-13933, 4210, 5423);
            waypoints[waypoints.size] = (-13233, 4210, 5423);
            waypoints[waypoints.size] = (-15333, 5010, 5423);
            waypoints[waypoints.size] = (-14633, 5010, 5423);
            waypoints[waypoints.size] = (-13933, 5010, 5423);
            waypoints[waypoints.size] = (-13233, 5010, 5423);
            waypoints[waypoints.size] = (-15333, 5810, 5423);
            waypoints[waypoints.size] = (-14633, 5810, 5423);
            waypoints[waypoints.size] = (-13933, 5810, 5423);
            waypoints[waypoints.size] = (-13233, 5810, 5423);
            waypoints[waypoints.size] = (-15333, 6510, 5423);
            waypoints[waypoints.size] = (-14633, 6510, 5423);
            waypoints[waypoints.size] = (-13933, 6510, 5423);
            waypoints[waypoints.size] = (-13233, 6510, 5423);
        }
        break;
        case "mp_nightshift":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (-711,-651,12);
            waypoints[waypoints.size] = (-1724,-542,8);
            waypoints[waypoints.size] = (-1641,-1004,9);
            waypoints[waypoints.size] = (-1787,-1353,4);
            waypoints[waypoints.size] = (-1758,-2129,10);
            waypoints[waypoints.size] = (-1422,-1803,8);
            waypoints[waypoints.size] = (-1134,-1686,16);
            waypoints[waypoints.size] = (-920,-1911,16);
            waypoints[waypoints.size] = (-920,-2112,96);
            waypoints[waypoints.size] = (-617,-2106,96);
            waypoints[waypoints.size] = (-600,-1986,152);
            waypoints[waypoints.size] = (-985,-1248,16);
            waypoints[waypoints.size] = (-1249,-1207,4);
            waypoints[waypoints.size] = (-2155,-1272,56);
            waypoints[waypoints.size] = (-2197,-1095,136);
            waypoints[waypoints.size] = (-2214,-765,144);
            waypoints[waypoints.size] = (-2370,-461,144);
            waypoints[waypoints.size] = (-2257,-206,144);
            waypoints[waypoints.size] = (-2259,-60,144);
            waypoints[waypoints.size] = (-2257,203,32);
            waypoints[waypoints.size] = (-1655,212,16);
            waypoints[waypoints.size] = (-1659,-63,8);
            waypoints[waypoints.size] = (-1193,-39,2);
            waypoints[waypoints.size] = (-1472,318,8);
            waypoints[waypoints.size] = (-1447,811,8);
            waypoints[waypoints.size] = (-1136,847,96);
            waypoints[waypoints.size] = (-942,706,96);
            waypoints[waypoints.size] = (-963,514,152);
            waypoints[waypoints.size] = (-957,279,152);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (1450,-968,16);
            waypoints[waypoints.size] = (1438,-1278,8);
            waypoints[waypoints.size] = (1168,-961,16);
            waypoints[waypoints.size] = (1035,-1194,8);
            waypoints[waypoints.size] = (1011,-1427,8);
            waypoints[waypoints.size] = (1235,-1509,16);
            waypoints[waypoints.size] = (1410,-1618,16);
            waypoints[waypoints.size] = (554,-1093,8);
            waypoints[waypoints.size] = (444,-1485,8);
            waypoints[waypoints.size] = (418,-1900,16);
            waypoints[waypoints.size] = (722,-1979,48);
            waypoints[waypoints.size] = (935,-1966,48);
            waypoints[waypoints.size] = (1001,-2135,49);
            waypoints[waypoints.size] = (837,-2147,192);
            waypoints[waypoints.size] = (922,-2143,113);
            waypoints[waypoints.size] = (909,-1858,192);
            waypoints[waypoints.size] = (1249,-576,16);
            waypoints[waypoints.size] = (1542,-400,16);
            waypoints[waypoints.size] = (1650,-113,16);
            waypoints[waypoints.size] = (1487,140,16);
            waypoints[waypoints.size] = (1192,100,8);
            waypoints[waypoints.size] = (894,3,16);
            waypoints[waypoints.size] = (777,-556,16);
            waypoints[waypoints.size] = (761,-850,16);
            waypoints[waypoints.size] = (790,-227,20);
            waypoints[waypoints.size] = (158,-189,16);
            waypoints[waypoints.size] = (-96,18,16);
            waypoints[waypoints.size] = (-5,-412,24);
            waypoints[waypoints.size] = (6,-760,16);
            waypoints[waypoints.size] = (397,-743,16);
            waypoints[waypoints.size] = (231,-134,24);
        }
        else if (level.mapVariation == 2)
        {
            waypoints[waypoints.size] = (1850,-1580,18);
            waypoints[waypoints.size] = (1850,-2500,18);
            waypoints[waypoints.size] = (1850,-3000,18);
            waypoints[waypoints.size] = (1950,-1580,8);
            waypoints[waypoints.size] = (1950,-2500,8);
            waypoints[waypoints.size] = (1950,-3000,8);
        }
        break;
        case "mp_invasion":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (2400,12127,11);
            waypoints[waypoints.size] = (2900,12127,11);
            waypoints[waypoints.size] = (3500,12127,11);
            waypoints[waypoints.size] = (4000,12127,11);
            waypoints[waypoints.size] = (2400,11173,11);
            waypoints[waypoints.size] = (2900,11173,11);
            waypoints[waypoints.size] = (3500,11173,11);
            waypoints[waypoints.size] = (4000,11173,11);
            waypoints[waypoints.size] = (2400,10567,11);
            waypoints[waypoints.size] = (2900,10567,11);
            waypoints[waypoints.size] = (3500,10567,11);
            waypoints[waypoints.size] = (4000,10567,11);
            waypoints[waypoints.size] = (2400,10000,11);
            waypoints[waypoints.size] = (2400,8500,11);
        }
        break;
        case "mp_quarry":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (-2020.9,1400,35.1);
            waypoints[waypoints.size] = (-2020.9,1000,35.1);
            waypoints[waypoints.size] = (-1634.4,1050,35);
            waypoints[waypoints.size] = (-1634.4,1687,35);
            waypoints[waypoints.size] = (-2658,2152,35);
            waypoints[waypoints.size] = (-2658,1400,35.1);
            waypoints[waypoints.size] = (-3000,2152,35);
            waypoints[waypoints.size] = (-4000,2152,35);
            waypoints[waypoints.size] = (-3000,2152,35);
            waypoints[waypoints.size] = (-4000,2152,70);
            waypoints[waypoints.size] = (-4825.4,2152,160);
        }
        break;
        case "mp_rundown":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (577,2398,84);
            waypoints[waypoints.size] = (1616,2496,75);
            waypoints[waypoints.size] = (1625,3240,80);
            waypoints[waypoints.size] = (683,3222,79);
            waypoints[waypoints.size] = (618,2783,78);
            waypoints[waypoints.size] = (924,2687,80);
            waypoints[waypoints.size] = (1148,2925,83);
            waypoints[waypoints.size] = (1510,2917,82);
            waypoints[waypoints.size] = (1666,2930,74);
            waypoints[waypoints.size] = (1437,3096,82);
            waypoints[waypoints.size] = (1219,3115,82);
            waypoints[waypoints.size] = (1502,2320,64);
            waypoints[waypoints.size] = (232,2730,116);
            waypoints[waypoints.size] = (282,2479,150);
            waypoints[waypoints.size] = (611,2200,103);
            waypoints[waypoints.size] = (654,3296,75);
        }
        break;
        case "mp_rust":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (3002,-9871,-244);
            waypoints[waypoints.size] = (2630,-10112,-225);
            waypoints[waypoints.size] = (2368,-10356,-199);
            waypoints[waypoints.size] = (1819,-10242,-192);
            waypoints[waypoints.size] = (2015,-9838,-201);
            waypoints[waypoints.size] = (2034,-9395,-221);
            waypoints[waypoints.size] = (1497,-9355,-181);
            waypoints[waypoints.size] = (1118,-9720,-129);
            waypoints[waypoints.size] = (648,-9955,-86);
            waypoints[waypoints.size] = (314,-9580,-205);
            waypoints[waypoints.size] = (202,-9624,-204);
            waypoints[waypoints.size] = (-328,-9727,-221);
            waypoints[waypoints.size] = (-594,-9864,-206);
            waypoints[waypoints.size] = (724,-9315,-228);
            waypoints[waypoints.size] = (1431,-9296,-184);
            waypoints[waypoints.size] = (509,-9727,-132);
            waypoints[waypoints.size] = (1955,-10430,-210);
            waypoints[waypoints.size] = (2568,-10673,-206);
            waypoints[waypoints.size] = (2377,-9932,-217);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (1264,-6562,-255);
            waypoints[waypoints.size] = (970,-6556,-255);
            waypoints[waypoints.size] = (988,-6240,-255);
            waypoints[waypoints.size] = (1284,-6201,-255);
            waypoints[waypoints.size] = (1182,-6131,-255);
            waypoints[waypoints.size] = (1169,-5529,-255);
            waypoints[waypoints.size] = (1434,-4841,-124);
            waypoints[waypoints.size] = (1299,-5068,-189);
            waypoints[waypoints.size] = (1593,-4717,-255);
            waypoints[waypoints.size] = (1640,-5091,-214);
            waypoints[waypoints.size] = (1453,-4572,-155);
            waypoints[waypoints.size] = (1732,-4594,-125);
        }
        break;
        case "mp_subbase":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (-323,-4193,17);
            waypoints[waypoints.size] = (-323,-4677,17);
            waypoints[waypoints.size] = (-323,-5000,17);
            waypoints[waypoints.size] = (-323,-5600,17);
        }
        break;
        case "mp_terminal":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (246.6061,4167.143,40.125);
            waypoints[waypoints.size] = (624.7712,3753.226,40.125);
            waypoints[waypoints.size] = (1130.358,4027.027,40.125);
            waypoints[waypoints.size] = (1087.296,4586.28,40.125);
            waypoints[waypoints.size] = (1313.875,3320.234,40.125);
            waypoints[waypoints.size] = (1449.158,3819.982,38.125);
            waypoints[waypoints.size] = (1877.665,3746.595,52.12454);
            waypoints[waypoints.size] = (2432.747,3782.803,48.125);
            waypoints[waypoints.size] = (2431.024,4194.254,48.125);
            waypoints[waypoints.size] = (2431.89,4409.198,191.5181);
            waypoints[waypoints.size] = (2759.16,3982.838,84.125);
            waypoints[waypoints.size] = (2595.402,3442.513,48.125);
            waypoints[waypoints.size] = (2419.577,3148.779,72.125);
            waypoints[waypoints.size] = (1813.192,3018.418,40.125);
            waypoints[waypoints.size] = (1692.714,3377.876,40.125);
            waypoints[waypoints.size] = (1696.307,3805.034,40.125);
            waypoints[waypoints.size] = (1128.519,2845.981,40.125);
            waypoints[waypoints.size] = (627.8413,2635.537,40.125);
            waypoints[waypoints.size] = (322.6416,3256.328,40.125);
            waypoints[waypoints.size] = (111.4816,3831.948,40.125);
            waypoints[waypoints.size] = (610.4529,2813.211,45.7037);
            waypoints[waypoints.size] = (609.9446,3008.77,203.625);
            waypoints[waypoints.size] = (608.8327,3772.375,203.625);
            waypoints[waypoints.size] = (727.4998,3767.509,193.0807);
            waypoints[waypoints.size] = (960.3929,3766.779,52.02162);
        }
        break;
        case "mp_underpass":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (4035,3004,432);
            waypoints[waypoints.size] = (4045,2773,432);
            waypoints[waypoints.size] = (4048,2364,432);
            waypoints[waypoints.size] = (4049,2018,432);
            waypoints[waypoints.size] = (4064,1219,432);
            waypoints[waypoints.size] = (3091,2595,417);
            waypoints[waypoints.size] = (3071,2862,426);
            waypoints[waypoints.size] = (3077,3131,412);
            waypoints[waypoints.size] = (3163,3380,400);
            waypoints[waypoints.size] = (3562,3143,400);
            waypoints[waypoints.size] = (3604,3351,400);
            waypoints[waypoints.size] = (3569,2352,400);
            waypoints[waypoints.size] = (3838,2738,400);
            waypoints[waypoints.size] = (3888,2470,400);
            waypoints[waypoints.size] = (3888,1986,400);
            waypoints[waypoints.size] = (3481,1786,400);
            waypoints[waypoints.size] = (3488,1358,400);
            waypoints[waypoints.size] = (3800,1339,400);
            waypoints[waypoints.size] = (3924,1878,400);
            waypoints[waypoints.size] = (3251,2396,430);
            waypoints[waypoints.size] = (3540,2548,400);
            waypoints[waypoints.size] = (3699,2556,400);
            waypoints[waypoints.size] = (3820,3132,400);
        }
        break;
        case "mp_overgrown":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (-1087,-5965,-153);
            waypoints[waypoints.size] = (-1587,-5965,-153);
            waypoints[waypoints.size] = (-2000,-5965,-153);
            waypoints[waypoints.size] = (-2500,-5965,-153);
            waypoints[waypoints.size] = (-1836,-5700,-148);
            waypoints[waypoints.size] = (-1836,-6100,-148);
        }
        break;
        case "mp_trailerpark":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (66,-2053,16);
            waypoints[waypoints.size] = (602,-2455,16);
            waypoints[waypoints.size] = (1165,-2384,16);
            waypoints[waypoints.size] = (1821,-2632,24);
            waypoints[waypoints.size] = (2225,-2169,16);
            waypoints[waypoints.size] = (1304,-2011,22);
            waypoints[waypoints.size] = (1119,-1849,24);
            waypoints[waypoints.size] = (804,-1853,28);
            waypoints[waypoints.size] = (548,-2022,18);
            waypoints[waypoints.size] = (2639,-2357,16);
            waypoints[waypoints.size] = (2940,-2062,16);
            waypoints[waypoints.size] = (1219,-2967,16);
            waypoints[waypoints.size] = (587,-2609,16);
            waypoints[waypoints.size] = (1174,-2935,16);
            waypoints[waypoints.size] = (-283,-1576,22);
            waypoints[waypoints.size] = (662,-2552,16);
        }
        break;
        case "mp_compact":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (3050,2724,40);
            waypoints[waypoints.size] = (2579,2791,37);
            waypoints[waypoints.size] = (2213,2807,57);
            waypoints[waypoints.size] = (2239,3211,60);
            waypoints[waypoints.size] = (1683,2902,46);
            waypoints[waypoints.size] = (1254,2882,64);
            waypoints[waypoints.size] = (1031,2863,96);
            waypoints[waypoints.size] = (1877,2481,16);
            waypoints[waypoints.size] = (1863,2102,16);
        }
        break;
        case "mp_strike":
        case "mp_strike_sh":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (-2185,1425,24);
            waypoints[waypoints.size] = (-2500,1425,24);
            waypoints[waypoints.size] = (-3000,1425,24);
            waypoints[waypoints.size] = (-3500,1425,24);
            waypoints[waypoints.size] = (-2185,1500,24);
            waypoints[waypoints.size] = (-2500,1500,24);
            waypoints[waypoints.size] = (-3000,1500,24);
            waypoints[waypoints.size] = (-3500,1500,24);
            waypoints[waypoints.size] = (-2185,1350,24);
            waypoints[waypoints.size] = (-2500,1350,24);
            waypoints[waypoints.size] = (-3000,1350,24);
            waypoints[waypoints.size] = (-3500,1350,24);
        }
        break;
        case "mp_complex":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (1358,-200,400);
            waypoints[waypoints.size] = (320,-376,400);
            waypoints[waypoints.size] = (224,-838,412);
            waypoints[waypoints.size] = (-327,-629,400);
            waypoints[waypoints.size] = (-479,-1103,400);
            waypoints[waypoints.size] = (-545,-312,400);
            waypoints[waypoints.size] = (-1444,-313,400);
            waypoints[waypoints.size] = (-1351,-869,400);
            waypoints[waypoints.size] = (-784,-1140,400);
            waypoints[waypoints.size] = (806,-1165,400);
            waypoints[waypoints.size] = (1429,-1050,400);
            waypoints[waypoints.size] = (2256,-797,400);
            waypoints[waypoints.size] = (2295,-345,400);
            waypoints[waypoints.size] = (2289,-5,400);
            waypoints[waypoints.size] = (1374,-592,412);
        }
        if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (2798.63, -1931.75, 1040.13);
            waypoints[waypoints.size] = (3036.63, -1931.75, 1040.13);
            waypoints[waypoints.size] = (2798.63, -1631.75, 1040.13);
            waypoints[waypoints.size] = (3036.63, -1631.75, 1040.13);
            waypoints[waypoints.size] = (2798.63, -1331.75, 1040.13);
            waypoints[waypoints.size] = (3036.63, -1331.75, 1040.13);
            waypoints[waypoints.size] = (2798.63, -1031.75, 1040.13);
            waypoints[waypoints.size] = (3036.63, -1031.75, 1040.13);
        }
        break;
        case "mp_abandon":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (-3454,-3475,1);
            waypoints[waypoints.size] = (-2954,3136,1);
            waypoints[waypoints.size] = (-2087,1759,1);
            waypoints[waypoints.size] = (-1268,1108,1);
            waypoints[waypoints.size] = (-1092,1825,5);
            waypoints[waypoints.size] = (-401,2349,1);
            waypoints[waypoints.size] = (-579,2781,1);
            waypoints[waypoints.size] = (-359,3336,1);
            waypoints[waypoints.size] = (-1302,4566,1);
            waypoints[waypoints.size] = (-2586,5430,1);
            waypoints[waypoints.size] = (-3442,4566,1);
            waypoints[waypoints.size] = (-4097,4079,1);
            waypoints[waypoints.size] = (-2971,3461,-4);
            waypoints[waypoints.size] = (-3761,1983,6);
            waypoints[waypoints.size] = (-3194,1270,6);
            waypoints[waypoints.size] = (-3289,206,6);
            waypoints[waypoints.size] = (-4456,1214,6);
            waypoints[waypoints.size] = (-4620,2052,6);
            waypoints[waypoints.size] = (-4466,2611,6);
            waypoints[waypoints.size] = (-4494,3190,6);
            waypoints[waypoints.size] = (-3952,2975,6);
            waypoints[waypoints.size] = (-3434,2581,6);
        }
        break;
        case "mp_vacant":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (129,-1184,-87);
            waypoints[waypoints.size] = (-102,-998,-87);
            waypoints[waypoints.size] = (512,-1227,-86);
            waypoints[waypoints.size] = (-1037,-1199,-88);
            waypoints[waypoints.size] = (995,-220,-101);
            waypoints[waypoints.size] = (-988,1179,-99);
            waypoints[waypoints.size] = (-448,1232,-88);
            waypoints[waypoints.size] = (-551,1724,-87);
            waypoints[waypoints.size] = (677,1760,-95);
            waypoints[waypoints.size] = (68,1406,-92);
            waypoints[waypoints.size] = (-509,1436,-92);
            waypoints[waypoints.size] = (-1791,1320,-100);
            waypoints[waypoints.size] = (-1892,687,-95);
            waypoints[waypoints.size] = (-2015,-219,-91);
            waypoints[waypoints.size] = (-1521,52,-100);
            waypoints[waypoints.size] = (-957,-31,-96);
            waypoints[waypoints.size] = (-1628,708,-95);
            waypoints[waypoints.size] = (-1437,-223,-95);
            waypoints[waypoints.size] = (-1135,-247,-94);
        }
        break;
        case "mp_storm":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (4826,-1328,-52);
            waypoints[waypoints.size] = (4826,-800,-52);
            waypoints[waypoints.size] = (4826, 0,-52);
            waypoints[waypoints.size] = (4826, 800,-52);
            waypoints[waypoints.size] = (4400,-1328,-52);
            waypoints[waypoints.size] = (3700,-1328,-52);
            waypoints[waypoints.size] = (3000,-1328,-52);
            waypoints[waypoints.size] = (5000,-1806,8);
            waypoints[waypoints.size] = (4400,-1806,8);
            waypoints[waypoints.size] = (3700,-1806,8);
            waypoints[waypoints.size] = (3000,-1806,8);
        }
        break;
        case "mp_fuel2":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (18150,27358,7000);
            waypoints[waypoints.size] = (18600,27358,7000);
            waypoints[waypoints.size] = (17800,27358,7000);
            waypoints[waypoints.size] = (19000,27358,7000);
            waypoints[waypoints.size] = (17500,27358,7000);
            waypoints[waypoints.size] = (16500,27358,7000);
            waypoints[waypoints.size] = (20000,27358,7000);
            waypoints[waypoints.size] = (21000,27358,7000);
            waypoints[waypoints.size] = (15500,27358,7000);
            waypoints[waypoints.size] = (18150,27000,7000);
            waypoints[waypoints.size] = (18600,27000,7000);
            waypoints[waypoints.size] = (17800,27000,7000);
            waypoints[waypoints.size] = (18150,27700,7000);
            waypoints[waypoints.size] = (18600,27700,7000);
            waypoints[waypoints.size] = (17800,27700,7000);
        }
        else if (level.mapVariation == 1)
        {
            waypoints[waypoints.size] = (-6251,1700,-130);
            waypoints[waypoints.size] = (-5996,1700,-130);
            waypoints[waypoints.size] = (-6251,2700,-250);
            waypoints[waypoints.size] = (-5996,2700,-250);
        }
        break;
        case "mp_crash":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (-829,-1855,128);
            waypoints[waypoints.size] = (-989,-2222,119);
            waypoints[waypoints.size] = (-1049,-3115,85);
            waypoints[waypoints.size] = (-983,-3778,68);
        }
        break;
        case "mp_nuked":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (172,-219,-59);
            waypoints[waypoints.size] = (-216,-305,-50);
            waypoints[waypoints.size] = (-288,308,-51);
            waypoints[waypoints.size] = (-9,383,-59);
            waypoints[waypoints.size] = (-200,904,-52);
            waypoints[waypoints.size] = (305,875,-51);
            waypoints[waypoints.size] = (497,756,-51);
            waypoints[waypoints.size] = (1093,910,-51);
            waypoints[waypoints.size] = (1556,543,-52);
            waypoints[waypoints.size] = (1633,158,-52);
            waypoints[waypoints.size] = (1392,161,-53);
            waypoints[waypoints.size] = (576,-103,-53);
            waypoints[waypoints.size] = (327,341,-56);
            waypoints[waypoints.size] = (87,355,-25);
            waypoints[waypoints.size] = (-548,409,-45);
            waypoints[waypoints.size] = (-940,487,-45);
            waypoints[waypoints.size] = (-874,660,-45);
            waypoints[waypoints.size] = (-1376,826,-52);
            waypoints[waypoints.size] = (-1479,275,-52);
            waypoints[waypoints.size] = (-1058,137,-47);
            waypoints[waypoints.size] = (-1104,-56,-53);
            waypoints[waypoints.size] = (-671,-147,-46);
            waypoints[waypoints.size] = (-280,190,-57);
            waypoints[waypoints.size] = (-878,81,-45);
            waypoints[waypoints.size] = (-782,228,-45);
            waypoints[waypoints.size] = (-583,568,-45);
            waypoints[waypoints.size] = (-795,660,90);
            waypoints[waypoints.size] = (-913,694,90);
            waypoints[waypoints.size] = (-847,408,90);
            waypoints[waypoints.size] = (-595,279,90);
            waypoints[waypoints.size] = (-1177,669,88);
            waypoints[waypoints.size] = (-1248,467,-47);
            waypoints[waypoints.size] = (-939,904,-53);
            waypoints[waypoints.size] = (-1672,966,-52);
            waypoints[waypoints.size] = (-248,732,-52);
            waypoints[waypoints.size] = (680,477,-46);
            waypoints[waypoints.size] = (900,684,-45);
            waypoints[waypoints.size] = (1127,726,-46);
            waypoints[waypoints.size] = (899,263,-45);
            waypoints[waypoints.size] = (719,46,-45);
            waypoints[waypoints.size] = (993,132,90);
            waypoints[waypoints.size] = (1086,174,90);
            waypoints[waypoints.size] = (982,311,90);
            waypoints[waypoints.size] = (668,187,90);
            waypoints[waypoints.size] = (1333,303,88);
            waypoints[waypoints.size] = (1265,531,-46);
        }
        case "mp_cross_fire":
        case "mp_crossfire":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (2629.74, -4495, -150.715);
            waypoints[waypoints.size] = (2174.32, -4232.14, -119.379);
            waypoints[waypoints.size] = (2366.53, -3859.87, -89.747);
            waypoints[waypoints.size] = (2568.79, -3490.41, -71.178);
            waypoints[waypoints.size] = (2781.1, -3107.02, -49.7082);
            waypoints[waypoints.size] = (3049.5, -2616.42, -27.2612);
            waypoints[waypoints.size] = (3226.63, -2321.09, -4.18731);
            waypoints[waypoints.size] = (2796.76, -3372.43, 10.4963);
            waypoints[waypoints.size] = (2984.83, -3479.45, 23.9299);
        }
        break;
        case "mp_factory_sh":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (-290.986, 188.384, -2.875);
            waypoints[waypoints.size] = (-180.219, -161.952, -2.875);
            waypoints[waypoints.size] = (138.579, -161.884, -2.875);
            waypoints[waypoints.size] = (60.6456, -502.84, -2.875);
            waypoints[waypoints.size] = (-170.853, -306.283, -2.875);
            waypoints[waypoints.size] = (-170.909, -579.624, -142.875);
            waypoints[waypoints.size] = (-47.3085, 87.3376, 93.125);
            waypoints[waypoints.size] = (150.692, 300.291, -2.875);
            waypoints[waypoints.size] = (-372.881, -10.6834, 69.125);
            waypoints[waypoints.size] = (-452.863, -125.349, 69.125);
            waypoints[waypoints.size] = (-560.471, -180.116, 69.125);
            waypoints[waypoints.size] = (-782.993, -199.244, 67.125);
            waypoints[waypoints.size] = (-663.094, -622.45, 66.625);
            waypoints[waypoints.size] = (-912.076, -632.958, 66.625);
            waypoints[waypoints.size] = (-911.911, -886.197, 67.125);
            waypoints[waypoints.size] = (-616.678, -868.38, 67.125);
            waypoints[waypoints.size] = (-438.018, -869.966, 133.625);
            waypoints[waypoints.size] = (-634.881, -1095.21, 66.625);
            waypoints[waypoints.size] = (-909.784, -1213.58, 67.125);
            waypoints[waypoints.size] = (-637.74, -1434.4, 67.125);
            waypoints[waypoints.size] = (-421.208, -1027.3, 200.625);
            waypoints[waypoints.size] = (-662.171, -1211.14, 199.125);
            waypoints[waypoints.size] = (-992.578, -1214.05, 199.125);
            waypoints[waypoints.size] = (-1130.19, -1203.87, 200.625);
            waypoints[waypoints.size] = (-1552.14, -1065.99, 199.125);
            waypoints[waypoints.size] = (-1532.03, -1343.27, 199.125);
            waypoints[waypoints.size] = (-1357.45, -1494.46, 199.625);
            waypoints[waypoints.size] = (-388.59, -1219.37, 199.125);
            waypoints[waypoints.size] = (-158.763, -997.856, 191.125);
            waypoints[waypoints.size] = (-152.036, -1415.82, 191.125);
            waypoints[waypoints.size] = (81.7279, -1251.99, 191.125);
            waypoints[waypoints.size] = (560.778, -1254.99, 248.125);
            waypoints[waypoints.size] = (565.842, -999, 248.125);
            waypoints[waypoints.size] = (678.417, -999.029, 248.004);
            waypoints[waypoints.size] = (925.989, -1002.94, 162.125);
            waypoints[waypoints.size] = (923.696, -1362.02, 164.125);
            waypoints[waypoints.size] = (941.789, -1478.29, 133.078);
            waypoints[waypoints.size] = (1315.54, -1422.45, 133.125);
            waypoints[waypoints.size] = (1062.08, -1013.47, 162.849);
            waypoints[waypoints.size] = (1177.27, -915.569, 96.0644);
            waypoints[waypoints.size] = (756.714, -656.279, 63.125);
            waypoints[waypoints.size] = (755.524, -393.754, 63.125);
            waypoints[waypoints.size] = (971.985, -393.573, 64.125);
            waypoints[waypoints.size] = (937.114, -133.766, 63.125);
            waypoints[waypoints.size] = (750.843, -141.321, 63.125);
            waypoints[waypoints.size] = (742.979, 187.841, 63.125);
            waypoints[waypoints.size] = (927.537, 106.868, 63.125);
            waypoints[waypoints.size] = (1153.02, 344.618, 64.125);
            waypoints[waypoints.size] = (984.685, 487.965, 64.125);
            waypoints[waypoints.size] = (979.106, 789.037, 167.125);
            waypoints[waypoints.size] = (989.233, 1052.97, 168.125);
            waypoints[waypoints.size] = (1531.74, 1043.68, 168.125);
            waypoints[waypoints.size] = (1534.25, 786.536, 167.125);
            waypoints[waypoints.size] = (1538.2, 485.098, 64.0016);
            waypoints[waypoints.size] = (757.675, 530.393, 52.4823);
            waypoints[waypoints.size] = (384.126, 300.933, 62.0804);
            waypoints[waypoints.size] = (320.439, -111.613, 64.2074);
            waypoints[waypoints.size] = (321.402, -823.843, 50.3117);
            waypoints[waypoints.size] = (306.225, -640.159, 60);
            waypoints[waypoints.size] = (584.242, -842.813, 64.125);
            waypoints[waypoints.size] = (70.6644, -786.061, 48.2691);
            waypoints[waypoints.size] = (59.6635, -992.511, 64.125);
            waypoints[waypoints.size] = (557.075, -1142.06, 65.692);
            waypoints[waypoints.size] = (-278.303, -592.183, 68.4037);
            waypoints[waypoints.size] = (297.05, -1139.88, 57.0924);
            waypoints[waypoints.size] = (314.615, -1558.43, 54.639);
            waypoints[waypoints.size] = (273.517, -1968.95, 88.125);
            waypoints[waypoints.size] = (134.418, -2370.36, 88.125);
            waypoints[waypoints.size] = (289.389, -2678.47, 88.125);
            waypoints[waypoints.size] = (289.56, -2958.23, 156.125);
            waypoints[waypoints.size] = (543.561, -2770.91, 90.6554);
            waypoints[waypoints.size] = (543.502, -2467.22, 272.125);
            waypoints[waypoints.size] = (-29.0888, -3034.38, 156.125);
            waypoints[waypoints.size] = (-95.5846, -2954.03, 156.125);
            waypoints[waypoints.size] = (-94.4858, -2508.85, 46.125);
            waypoints[waypoints.size] = (15.2143, -2085.17, 136.057);
            waypoints[waypoints.size] = (-280.987, -2136.96, 156.125);
            waypoints[waypoints.size] = (-101.854, -2087.35, 160.744);
            waypoints[waypoints.size] = (49.215, -1009.32, 64.125);
            waypoints[waypoints.size] = (282.75, -1007.95, 54.982);
            waypoints[waypoints.size] = (129.713, -1393.74, 50);
            waypoints[waypoints.size] = (122.441, -1139.17, 50);
            waypoints[waypoints.size] = (66.5237, -1002.98, 64.125);
        }
        break;
        case "mp_base":
        if (level.mapVariation == 0)
        {
            waypoints[waypoints.size] = (866.861, -604.678, 115.059);
            waypoints[waypoints.size] = (738.795, -777.108, 109.404);
            waypoints[waypoints.size] = (862.903, -914.483, 115.289);
            waypoints[waypoints.size] = (298.317, -750.292, 110.237);
            waypoints[waypoints.size] = (337.827, -533.241, 149.125);
            waypoints[waypoints.size] = (216.395, -932.811, 108.07);
            waypoints[waypoints.size] = (209.787, -770.375, 110.663);
            waypoints[waypoints.size] = (-211.399, -765.896, 108.125);
            waypoints[waypoints.size] = (-211.39, -933.125, 108.125);
            waypoints[waypoints.size] = (-443.081, -933.083, 108.125);
            waypoints[waypoints.size] = (-443.097, -766.182, 108.125);
            waypoints[waypoints.size] = (-448.161, -562.624, 111.359);
            waypoints[waypoints.size] = (-682.031, -552.931, 108.166);
            waypoints[waypoints.size] = (-682.031, -820, 108.166);
            waypoints[waypoints.size] = (-880, -820, 108.166);
            waypoints[waypoints.size] = (-880, -552.931, 108.166);
            waypoints[waypoints.size] = (-682.031, -163, 108.166);
            waypoints[waypoints.size] = (-880, -163, 108.166);
            waypoints[waypoints.size] = (-883.777, 85.3301, 108.604);
            waypoints[waypoints.size] = (-1036.15, -623.655, 108.125);
            waypoints[waypoints.size] = (-1047.39, -881.752, 244.125);
            waypoints[waypoints.size] = (-1044.25, -948.033, 244.125);
            waypoints[waypoints.size] = (-926.198, -941.963, 244.366);
            waypoints[waypoints.size] = (-926.186, -586.733, 244.375);
            waypoints[waypoints.size] = (-926.35, -128.109, 257.35);
            waypoints[waypoints.size] = (-705.666, -923.789, 257.721);
            waypoints[waypoints.size] = (-708.704, -520.686, 244.267);
            waypoints[waypoints.size] = (-633.688, -395.252, 244.375);
            waypoints[waypoints.size] = (-635.281, 47.9259, 259.37);
            waypoints[waypoints.size] = (-768.07, 60.8863, 245.33);
            waypoints[waypoints.size] = (-934.091, 56.556, 248.648);
            waypoints[waypoints.size] = (-763.972, -126.947, 245.986);
            waypoints[waypoints.size] = (-559.811, -726.157, 244.374);
            waypoints[waypoints.size] = (-233.579, -724.74, 244.415);
            waypoints[waypoints.size] = (-229.425, -441.876, 285.125);
        }
        break;
    }

    return waypoints;
}