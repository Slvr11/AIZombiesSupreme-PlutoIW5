// IW5 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level.killstreakfuncs = [];
    level.killstreaksetupfuncs = [];
    level.killstreakweapons = [];
    level.killstreakweildweapons = [];
}

initkillstreakdata()
{
}

initplayerkillstreaks()
{
}

updatestreakcount()
{
}

resetstreakcount()
{
}

setstreakcounttonext()
{
}

getnextstreakname()
{
    return undefined;
}

getmaxstreakcost()
{
    return 0;
}

updatestreakslots()
{
}

waitforchangeteam()
{
}

isridekillstreak( var_0 )
{
    switch ( var_0 )
    {
        case "helicopter_mk19":
        case "helicopter_minigun":
        case "remote_uav":
        case "remote_tank":
        case "remote_mortar":
        case "osprey_gunner":
        case "predator_missile":
        case "ac130":
            return 1;
        default:
            return 0;
    }
}

iscarrykillstreak( var_0 )
{
    switch ( var_0 )
    {
        case "deployable_exp_ammo":
        case "gl_turret":
        case "sentry_gl":
        case "deployable_vest":
        case "ims":
        case "minigun_turret":
        case "sentry":
            return 1;
        default:
            return 0;
    }
}

deadlykillstreak( var_0 )
{
    switch ( var_0 )
    {
        case "harrier_airstrike":
        case "helicopter_minigun":
        case "stealth_airstrike":
        case "littlebird_support":
        case "helicopter":
        case "remote_tank":
        case "remote_mortar":
        case "osprey_gunner":
        case "littlebird_flock":
        case "helicopter_flares":
        case "predator_missile":
        case "precision_airstrike":
        case "ac130":
            return 1;
    }

    return 0;
}

killstreakusepressed()
{
    return 1;
}

usedkillstreak( var_0, var_1 )
{
}

updatekillstreaks( keepCurrent )
{
}

clearkillstreaks()
{
}

updatespecialistkillstreaks()
{
}

getfirstprimaryweapon()
{
    var_0 = self getweaponslistprimaries();
    return var_0[0];
}

killstreakusewaiter()
{
}

waittakekillstreakweapon( var_0, var_1 )
{
}

takekillstreakweaponifnodupe( var_0 )
{
}

shouldswitchweaponpostkillstreak( var_0, var_1 )
{
    return 1;
}

finishdeathwaiter()
{
}

checkstreakreward()
{
}

getcustomclassloc()
{
	return "customClasses";
}

killstreakearned( var_0 )
{
}

earnkillstreak( var_0, var_1 )
{
}

givekillstreak( var_0, var_1, var_2, var_3, var_4 )
{
}

iscurrentlyholdingkillstreakweapon( var_0 )
{
    return false;
}

givekillstreakweapon( var_0 )
{
}

getstreakcost( var_0 )
{
    return 0;
}

isassaultkillstreak( var_0 )
{
    switch ( var_0 )
    {
        case "littlebird_support":
        case "helicopter":
        case "airdrop_remote_tank":
        case "remote_mortar":
        case "ims":
        case "osprey_gunner":
        case "littlebird_flock":
        case "helicopter_flares":
        case "airdrop_juggernaut":
        case "airdrop_sentry_minigun":
        case "airdrop_assault":
        case "predator_missile":
        case "precision_airstrike":
        case "ac130":
        case "uav":
            return 1;
        default:
            return 0;
    }
}

issupportkillstreak( var_0 )
{
    switch ( var_0 )
    {
        case "sam_turret":
        case "remote_uav":
        case "uav_support":
        case "airdrop_juggernaut_recon":
        case "remote_mg_turret":
        case "deployable_vest":
        case "escort_airdrop":
        case "airdrop_trap":
        case "stealth_airstrike":
        case "counter_uav":
        case "triple_uav":
        case "emp":
            return 1;
        default:
            return 0;
    }
}

isspecialistkillstreak( var_0 )
{
    switch ( var_0 )
    {
        case "all_perks_bonus":
        case "specialty_stalker_ks":
        case "specialty_quieter_ks":
        case "specialty_bulletaccuracy_ks":
        case "specialty_autospot_ks":
        case "specialty_detectexplosive_ks":
        case "_specialty_blastshield_ks":
        case "specialty_assists_ks":
        case "specialty_quickdraw_ks":
        case "specialty_coldblooded_ks":
        case "specialty_hardline_ks":
        case "specialty_paint_ks":
        case "specialty_blindeye_ks":
        case "specialty_scavenger_ks":
        case "specialty_fastreload_ks":
        case "specialty_longersprint_ks":
            return 1;
        default:
            return 0;
    }
}

getkillstreakhint( var_0 )
{
    return tablelookupistring( "mp/killstreakTable.csv", 1, var_0, 6 );
}

getkillstreakinformenemy( var_0 )
{
    return int( tablelookup( "mp/killstreakTable.csv", 1, var_0, 11 ) );
}

getkillstreaksound( var_0 )
{
    return tablelookup( "mp/killstreakTable.csv", 1, var_0, 7 );
}

getkillstreakdialog( var_0 )
{
    return tablelookup( "mp/killstreakTable.csv", 1, var_0, 8 );
}

getkillstreakweapon( var_0 )
{
    return tablelookup( "mp/killstreakTable.csv", 1, var_0, 12 );
}

getkillstreakicon( var_0 )
{
    return tablelookup( "mp/killstreakTable.csv", 1, var_0, 14 );
}

getkillstreakcrateicon( var_0 )
{
    return tablelookup( "mp/killstreakTable.csv", 1, var_0, 15 );
}

getkillstreakdpadicon( var_0 )
{
    return tablelookup( "mp/killstreakTable.csv", 1, var_0, 16 );
}

getkillstreakindex( var_0 )
{
    return tablelookuprownum( "mp/killstreakTable.csv", 1, var_0 ) - 1;
}

streaktyperesetsondeath( var_0 )
{
    switch ( var_0 )
    {
        case "assault":
        case "specialist":
            return 1;
        case "support":
            return 0;
    }
}

giveownedkillstreakitem( var_0 )
{
}

initridekillstreak( var_0 )
{
    return "fail";
}

initridekillstreak_internal( var_0 )
{
    return "fail";
}

clearrideintro( var_0 )
{
}

giveselectedkillstreakitem()
{
}

showselectedstreakhint( var_0 )
{
}

getkillstreakcount()
{
    return 0;
}

// NEW SYSTEM
inittrackerdata()
{
    self.streakuseenabled = true;
    self.actionslotenabled = [];
    self.actionslotenabled[0] = true;
    self.actionslotenabled[1] = true;
    self.actionslotenabled[2] = true;
    self.actionslotenabled[3] = true;
}

streaknotifytracker()
{
}

streakselectuptracker()
{
}

streakselectdowntracker()
{
}

shufflekillstreaksup()
{
}

shufflekillstreaksdown()
{
}

streakusegamepadtracker()
{
}

streakusekeyboardtracker()
{
}

disablekillstreakactionslots()
{
}

enablekillstreakactionslots()
{
}

watchgamepad()
{
}

switch_to_keyboard()
{
}

switch_to_gamepad()
{
}

registeradrenalineinfo( var_0, var_1 )
{
    if ( !isdefined( level.adrenalineinfo ) )
        level.adrenalineinfo = [];

    level.adrenalineinfo[var_0] = var_1;
}

giveadrenaline( var_0 )
{
}

giveallperks()
{
    var_0 = [];
    var_0[var_0.size] = "specialty_longersprint";
    var_0[var_0.size] = "specialty_fastreload";
    var_0[var_0.size] = "specialty_scavenger";
    var_0[var_0.size] = "specialty_blindeye";
    var_0[var_0.size] = "specialty_paint";
    var_0[var_0.size] = "specialty_hardline";
    var_0[var_0.size] = "specialty_coldblooded";
    var_0[var_0.size] = "specialty_quickdraw";
    var_0[var_0.size] = "_specialty_blastshield";
    var_0[var_0.size] = "specialty_detectexplosive";
    var_0[var_0.size] = "specialty_autospot";
    var_0[var_0.size] = "specialty_bulletaccuracy";
    var_0[var_0.size] = "specialty_quieter";
    var_0[var_0.size] = "specialty_stalker";
    var_0[var_0.size] = "specialty_marksman";
    var_0[var_0.size] = "specialty_sharp_focus";
    var_0[var_0.size] = "specialty_longerrange";
    var_0[var_0.size] = "specialty_fastermelee";
    var_0[var_0.size] = "specialty_reducedsway";
    var_0[var_0.size] = "specialty_lightweight";

    foreach ( var_2 in var_0 )
    {
        if ( !maps\mp\_utility::_hasperk( var_2 ) )
        {
            maps\mp\_utility::giveperk( var_2, 0 );

            if ( maps\mp\gametypes\_class::isperkupgraded( var_2 ) )
            {
                var_3 = tablelookup( "mp/perktable.csv", 1, var_2, 8 );
                maps\mp\_utility::giveperk( var_3, 0 );
            }
        }
    }
}

resetadrenaline()
{
}

setadrenaline( var_0 )
{
}

killstreakhit( var_0, var_1, var_2 )
{
}

is_player_gamepad_enabled()
{
    return false;
}
