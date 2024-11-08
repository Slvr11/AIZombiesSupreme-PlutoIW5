#include maps\mp\gametypes\_aiz;
#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

init()
{
    level.playerSpawnLocs = [];
    level.playerSpawnAngles = [];
    level.boxLocations = [];
    level.boxMaxUses = 15;
    level.randomMap = 0;

    //level.easterEggStep = 0;

    level.sale = false;
    level.boxCounter = 0;
    level.boxIndex = 0;

    //level.moonTriggers = [];

    level.maxBankBalance = 100000;

    level.usables = [];

    level.teddyModel = getTeddyModelForLevel();

    initializeBoxWeapons();

    level.airDropCrates = getEntArray( "care_package", "targetname" );
	level.oldAirDropCrates = getEntArray( "airdrop_crate", "targetname" );
	
	if ( !level.airDropCrates.size )
	{	
		level.airDropCrates = level.oldAirDropCrates;
		
		assert( level.airDropCrates.size );
		
		level.airDropCrateCollision = getEnt( level.airDropCrates[0].target, "targetname" );
	}
	else
	{
		foreach ( crate in level.oldAirDropCrates ) 
			crate maps\mp\killstreaks\_airdrop::deleteCrate();
		
		level.airDropCrateCollision = getEnt( level.airDropCrates[0].target, "targetname" );
		level.oldAirDropCrates = getEntArray( "airdrop_crate", "targetname" );
	}
	
	if (level.airDropCrates.size)
	{
		foreach (crate in level.airDropCrates)
			crate maps\mp\killstreaks\_airdrop::deleteCrate();
	}
	
	level.numDropCrates = 0;

    if (level._mapname == "mp_base")
        level.airDropCrateCollision = getEnt("iw3x_entity_airdroppallet", "targetname");
}

initializeBoxWeapons()
{
    level.weaponModels = [];
    level.weaponNames = [];
    level.localizedWeaponNames = [];

    currentIndex = 0;

	if (level.mw2Weapons == 1 || (level.mw2Weapons == 2 && array_contains(level.classicMaps, level._mapname))) level.weaponModels[currentIndex] = "weapon_steyr_lmg";
    else level.weaponModels[currentIndex] = "weapon_steyr_blue_tiger";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_mp412";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_desert_eagle_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_ak47_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_scar_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_mp5_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_p90_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_m60_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_as50_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_remington_msr_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_aa12_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_model1887";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_skorpion_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_mp9_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_walther_p99_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_fn_fiveseven_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_44_magnum_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_fmg_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_g18_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_smaw";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_xm25";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_m320_gl";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_m4_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_m16_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_cm901";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_type95_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_remington_acr_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_m14_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_g36_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_fad_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_ump45_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_pp90m1_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_uzi_m9_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_mp7_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_dragunov_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_m82_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_l96a1_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_rsass_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_sa80_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_mg36";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_pecheneg_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_mk46_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_usas12_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_ksg_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_spas12_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_striker_iw5";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_riot_shield_mp";
	currentIndex++;
    level.weaponModels[currentIndex] = "viewmodel_light_stick";
	currentIndex++;
    level.weaponModels[currentIndex] = "weapon_ak74u_iw5";
    currentIndex++;
    level.weaponModels[currentIndex] = "weapon_cheytac_no_attach";
    currentIndex++;
    if (array_contains(level.wawMaps, level._mapname)) level.weaponModels[currentIndex] = "weapon_raygun";
    else level.weaponModels[currentIndex] = "weapon_skorpion_iw5";
    currentIndex++;
    if (array_contains(level.wawMaps, level._mapname)) level.weaponModels[currentIndex] = "weapon_thundergun";
    else level.weaponModels[currentIndex] = "weapon_javelin";
    if (level.mw2Weapons == 1 || (level.mw2Weapons == 2 && array_contains(level.classicMaps, level._mapname)))
    {
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_fn2000";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_pp2000";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_m240";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_benelli_super_90";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_kriss";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_m16";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_spas12";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_ump45";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_p90";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_dragunov";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_mini_uzi";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_sa80_lmg";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_glock_green";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_rpd";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_m79";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_usp";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_aa12";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_ak47_tactical";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_m82";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_beretta_393";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_colt_anaconda";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_desert_eagle_tactical";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_famas";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_fn_fal";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_m14ebr_tan";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_m4";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_m4";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_magpul_masada_dust";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_mg4";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_model1887_classic";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_model1887_classic";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_mp5k";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_sawed_off_double_barrel";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_scar_h";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_striker";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_tavor";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_mp9";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_wa2000";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_rpg7_classic";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_javelin_classic";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_mp9_orange_fall";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_pp2000_red_tiger";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_oma_pack_in_hand";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_cheytac_no_attach";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_colt1911_black";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_at4";
    }
    if (level.boWeapons == 1)
    {
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_raygun";
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_thundergun";
    }
    if (array_contains(level.wawMaps, level._mapname))
    {
        currentIndex++;
        level.weaponModels[currentIndex] = "weapon_stinger";
    }

    currentIndex = 0;

    if (level.mw2Weapons == 1 || (level.mw2Weapons == 2 && array_contains(level.classicMaps, level._mapname))) level.weaponNames[currentIndex] = "iw4_aug_mp"; 
    else level.weaponNames[currentIndex] = "iw5_m60jugg_mp_silencer_camo07";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_mp412_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_deserteagle_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_ak47_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_scar_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_mp5_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_p90_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_m60_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_as50_mp_as50scope";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_msr_mp_msrscope";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_aa12_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_1887_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_skorpion_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_mp9_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_p99_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_fnfiveseven_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_44magnum_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_fmg9_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_g18_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_smaw_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_xm25_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "m320_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_m4_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_m16_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_cm901_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_type95_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_acr_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_mk14_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_g36c_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_fad_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_ump45_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_pp90m1_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_m9_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_mp7_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_dragunov_mp_dragunovscope";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_barrett_mp_barrettscope";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_l96a1_mp_l96a1scope";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_rsass_mp_rsassscope";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_sa80_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_mg36_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_pecheneg_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_mk46_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_usas12_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_ksg_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_spas12_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_striker_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "riotshield_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "lightstick_mp";
	currentIndex++;
    level.weaponNames[currentIndex] = "iw5_ak74u_mp";
    currentIndex++;
    level.weaponNames[currentIndex] = "iw5_cheytac_mp_cheytacscope";
    currentIndex++;
    if (array_contains(level.wawMaps, level._mapname)) level.weaponNames[currentIndex] = "t5_raygun_mp";
    else level.weaponNames[currentIndex] = "iw5_raygun_mp_eotechsmg_scope7";
    currentIndex++;
    if (array_contains(level.wawMaps, level._mapname)) level.weaponNames[currentIndex] = "t5_thundergun_mp";
    else level.weaponNames[currentIndex] = "thundergun_mp";
    if (level.mw2Weapons == 1 || (level.mw2Weapons == 2 && array_contains(level.classicMaps, level._mapname)))
    {
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_fn2000_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_pp2000_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_m240_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_m1014_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_kriss_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_m16_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_spas12_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_ump45_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_p90_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_dragunov_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_uzi_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_sa80_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_glock_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_rpd_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "m79_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_usp_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_aa12_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_ak47_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_barrett_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_beretta393_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_coltanaconda_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw5_deserteagletactical_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_famas_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_fal_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_m21_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_m4reflex_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_m4silencer_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_masada_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_mg4_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_model1887_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_model1887fmj_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_mp5k_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_ranger_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_scar_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_striker_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_tavor_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_tmp_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_wa2000_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_rpg_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_javelin_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_tmpsilencer_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_raygun_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_onemanarmy_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw5_cheytac_mp_cheytacscope2";
        currentIndex++;
        level.weaponNames[currentIndex] = "iw4_colt45_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "at4_mp";
    }
    if (level.boWeapons == 1)
    {
        currentIndex++;
        level.weaponNames[currentIndex] = "t5_raygun_mp";
        currentIndex++;
        level.weaponNames[currentIndex] = "t5_thundergun_mp";
    }
    if (array_contains(level.wawMaps, level._mapname))
    {
        currentIndex++;
        level.weaponNames[currentIndex] = "stinger_mp";
    }

    currentIndex = 0;

    level.localizedWeaponNames[currentIndex] = &"WEAPON_AUG";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_MP412";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_DESERTEAGLE";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_AK47";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_SCAR";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_MP5";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_P90";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_M60";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_AS50";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_MSR";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_AA12";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_MODEL1887";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_SKORPION";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_MP9";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_P99";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_FNFIVESEVEN";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_ANACONDA";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_FMG";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_GLOCK_18";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_SMAW";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_XM25";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_M320";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_M4";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_M16";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_CM901";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_TYPE95";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_ACR";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_MK14";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_G36";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_FAD";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_UMP45";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_PP90M1";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_UZIM9";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_MP7";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_DRAGUNOV";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_BARRETT";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_L96A1";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_RSASS";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_SA80";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_MG36";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_PECHENEG";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_MK46";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_USAS12";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_KSG";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_SPAS12";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_STRIKER";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_RIOTSHIELD";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_GLOWSTICK";
	currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_AK74U";
    currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_CHEYTAC";
    currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_RAYGUN";
    currentIndex++;
    level.localizedWeaponNames[currentIndex] = &"WEAPON_THUNDERGUN";
    if (level.mw2Weapons == 1 || (level.mw2Weapons == 2 && array_contains(level.classicMaps, level._mapname)))
    {
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_FN2000";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_PP2000";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_M240";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_M1014";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_KRISS";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_M16_REDDOT";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_SPAS12";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_UMP45";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_P90";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_DRAGUNOV";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_UZI";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_SA80";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_GLOCK";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_RPD";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_M79";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_USP";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_AA12";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_AK47";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_BARRETT";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_BERETTA393";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_ANACONDA";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_DESERTEAGLE";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_FAMAS";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_FNFAL";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_M14EBR_ACOG";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_M4_CARBINE_REDDOT";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_M4_CARBINE_SILENCER";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_ACR_LEGACY";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_MG4";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_MODEL1887";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_MODEL1887_FMJ";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_MP5K";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_RANGER";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_SCAR";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_STRIKER";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_TAVOR";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_TMP";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_WA2000_ACOG";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_RPG";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_JAVELIN";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_FLAMETHROWER";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_RAYGUN";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_OMA";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_CHEYTAC_EXP_BULLETS";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_COLT45";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_AT4_LOCKAIR";
    }
    if (level.boWeapons == 1)
    {
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_RAYGUN";
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_THUNDERGUN";
    }
    if (array_contains(level.wawMaps, level._mapname))
    {
        currentIndex++;
        level.localizedWeaponNames[currentIndex] = &"WEAPON_ZAPPER";
    }
}

executeUsable(type, player, ent)
{
    switch (type)
    {
        case "sentryPickup":
            player maps\mp\gametypes\_aiz_killstreaks::pickupSentry(ent.turret, false);
            break;
        case "revive":
            revivePlayer(ent, player);
            break;
        case "door":
            player useDoor(ent);
            break;
        case "randombox":
            player thread useBox(ent);
            break;
        case "pap":
            player thread usePapBox(ent, player getCurrentWeapon());
            break;
        case "gambler":
            player useGambler(ent);
            break;
        case "perk1":
            player usePerk(ent, 1);
            break;
        case "perk2":
            player usePerk(ent, 2);
            break;
        case "perk3":
            player usePerk(ent, 3);
            break;
        case "perk4":
            player usePerk(ent, 4);
            break;
        case "perk5":
            player usePerk(ent, 5);
            break;
        case "perk6":
            player usePerk(ent, 6);
            break;
        case "perk7":
            player usePerk(ent, 7);
            break;
        case "perk8":
            player usePerk(ent, 8);
            break;
        case "ammo":
            player useAmmo(ent);
            break;
        case "bank":
            player useBank(true);
            break;
        case "power":
            player usePower(ent);
            break;
        case "killstreak":
            player useKillstreak(ent);
            break;
        case "linker":
            player thread linkTeleporter(ent);
            break;
        case "teleporter":
            player thread useTeleporter(ent);
            break;
        case "elevator":
            player useElevator(ent);
            break;
        case "carePackage":
            player grabCarePackage(ent);
            break;
        case "expAmmo":
            player setExpAmmo(ent);
            break;
        case "heliExtraction":
            player heliSniper_boardHeli(ent);
            break;
        case "wallweapon":
            player useWallWeapon(ent);
            break;
        //case "helmet":
            //player useHelmet();
            //break;
        case "dome_eeDog":
            player dome_checkEasterEggTrigger1(ent);
            break;
        case "dome_eeBunkerCabinet":
            dome_checkEasterEggStep4_A(ent);
            break;
        case "dome_eeDomeCabinet":
            dome_checkEasterEggStep4_B(ent);
            break;
        case "giftTrigger":
            player givePlayerCash(ent.owner);
            break;
        case "zipline":
            player useZipline(ent);
            break;
        default:
            break;
    }
}

removeUsable()
{
    if (isDefined(self.objID))
    {
        _objective_delete(self.objID);
    }
    if (isDefined(self.icon))
    {
        self.icon destroy();
    }

    //trigger = self.trigger;
    level.usables = array_remove(level.usables, self);
    if (!array_contains(level.usables, self))
    {
        if (isDefined(self.pieces))
        {
            pieces = self.pieces;
            foreach (p in pieces) p delete();
        }
        self delete();
        if (isDefined(self.collision))
            self.collision delete();
        //trigger delete();
    }
}

trackUsablesForPlayer()
{
    self notify("track_usables");

    level endon ("game_ended");
    self endon ("death");
    self endon ("disconnect");
    self endon("track_usables");

    self thread handleUsableMessage();
    
    triggerHelper = spawn("script_origin", self.origin);
    triggerHelper setCursorHint("HINT_NOICON");
    triggerHelper setHintString(&"NULL_EMPTY");
    triggerHelper setSelfUsable(self);
    triggerHelper thread notUsableForJoiningPlayers(self);
    triggerHelper linkTo(self, "tag_origin", (0, 0, 15), (0,0,0));
    triggerHelper thread deleteTriggerHelperOnDeath(self);

    while(isDefined(triggerHelper))
    {
        triggerHelper waittill("trigger");
    
        self checkPlayerUsables();
    }
}
deleteTriggerHelperOnDeath(player)
{
    player waittill_any("death", "disconnect", "track_usables");

    self unlink();
    self delete();
}

handleUsableMessage()
{
    self notify("track_usable_messages");

    level endon ("game_ended");
    self endon ("death");
    self endon ("disconnect");
    self endon ("track_usable_messages");

    while (true)
    {
        wait(0.25);

        if (self.hasMessageUp)
            continue;

        foreach (usable in level.usables)
        {
            if (!isDefined(usable.range)) continue;

            if (usable.usabletype == "giftTrigger" && usable.owner == self) continue;

            if (distanceSquared(self.origin, usable.origin) < usable.range)
            {
                self displayUsableHintMessage(usable);
            }
        }
    }
}

setLowerMessageParams(messageParams)
{
    if (!isDefined(messageParams) || messageParams.size == 0)
        return;

    self.lowerMessage setText(&"NULL_EMPTY");
    self.lowerMessage.label = messageParams[0];
    if (messageParams.size > 1)
        self.lowerMessage setText(messageParams[1]);
    if (messageParams.size > 2)
        self.lowerMessage setValue(messageParams[2]);
}

displayUsableHintMessage(usable)
{
    //if (!isDefined(self.hud_message)) return;

    self.hasMessageUp = true;
    //message = self.hud_message;
    //message.alpha = 0.85;
    //message setText(usable getUsableText(self));
    usableText = usable getUsableText(self);

    if (usableText.size > 0)
    {
        self setLowerMessage("usable_message", usableText[0]);
        self setLowerMessageParams(usableText);
    }

    self thread watchPlayerLeaveUsable(usable);
}
watchPlayerLeaveUsable(usable)
{
    level endon ("game_ended");
    self endon ("death");
    self endon ("disconnect");
    self endon ("left_usable");

    while (true)
    {
        if (!isDefined(usable))
        {
            self clearLowerMessage("usable_message");
            self.hasMessageUp = false;
            self notify("left_usable");
        }

        //message setText(getUsableText(usable, self));
        usableText = usable getUsableText(self);
        if (usableText.size > 0)
            self setLowerMessageParams(usableText);

        if (distanceSquared(self.origin, usable.origin) > usable.range)
        {
            //message.alpha = 0;
            //message setText(&"NULL_EMPTY");
            self clearLowerMessage("usable_message");
            self.hasMessageUp = false;
            self notify("left_usable");
        }

        wait(0.25);
    }
}

checkPlayerUsables()
{
    //Check revive triggers first
    foreach (usable in level.usables)
    {
        if (usable.usabletype != "revive") continue;

        if (isDefined(usable.range) && distanceSquared(self.origin, usable.origin) < usable.range)
        {
            executeUsable(usable.usabletype, self, usable);
            return;//We found a revive usable close enough, get out of this loop
        }
    }
    foreach (usable in level.usables)
    {
        if (usable.usabletype == "giftTrigger" && usable.owner == self) continue;

        if (isDefined(usable.range) && distanceSquared(self.origin, usable.origin) < usable.range)
        {
            executeUsable(usable.usabletype, self, usable);
            return;//We found a usable close enough, get out of this loop
        }
    }
}

//-SPECIAL USABLE LOGIC-//
revivePlayer(reviveTrigger, reviver)
{
    //self = player being revived
    if (isDefined(reviver.isCarryingSentry) && reviver.isCarryingSentry) return;
    if (reviver.isDown) return;
    if (reviver.sessionTeam != "allies") return;
    if (reviveTrigger.player == reviver) return;
    if (isDefined(reviveTrigger.user)) return;//To avoid multiple revivers at a time

    reviveTrigger.player iPrintLnBold("Being revived by " + reviver.name + "...");
    reviver maps\mp\gametypes\_aiz_hud::createPrimaryProgressBar(0, 0);
    //progressBar setPoint("center", "center", 0, -61);
    reviver.progressBar.isScaling = false;
    reviveTrigger.user = reviver;
    reviveTrigger.reviveCounter = 1;
    reviver thread revivePlayer_logicLoop(reviveTrigger);
}
revivePlayer_logicLoop(reviveTrigger)
{
    //level endon("game_ended");
    //self endon("disconnect");

    while(true)
    {
        if (level.gameEnded || !isDefined(self))
        {
            reviveTrigger.user = undefined;
            self.progressBar.bar destroy();
            self.progressBar destroy();
            break;
        }
        if (self useButtonPressed() && isDefined(reviveTrigger.player) && reviveTrigger.player.isAlive && distanceSquared(self.origin, reviveTrigger.origin) < 5625 && !self.isDown)
        {
            reviveCounter = reviveTrigger.reviveCounter;
            self disableWeapons();
            reviveCounter++;
            if (self.autoRevive) reviveCounter++;//Double time
            reviveTrigger.reviveCounter = reviveCounter;

            if (!self.progressBar.isScaling)
            {
                self.progressBar.isScaling = true;
                if (self.autoRevive) self.progressBar maps\mp\gametypes\_aiz_hud::updateBar(120, 2.5);
                else self.progressBar maps\mp\gametypes\_aiz_hud::updateBar(120, 5);
            }
            if (reviveCounter >= 100)
            {
                downedPlayer = reviveTrigger.player;
                downedPlayer lastStandRevive();
                self enableWeapons();
                downedPlayer.isDown = false;
                if (!level.isHellMap || (level.isHellMap && level.visionRestored)) downedPlayer visionSetNakedForPlayer(level.vision);
                else downedPlayer visionSetNakedForPlayer(level.hellVision);
                downedPlayer setCardDisplaySlot(self, 5);
                downedPlayer showHudSplash("revived", 1);
                downedPlayer enableWeaponSwitch();
                downedPlayer enableOffhandWeapons();
                downedPlayer thread reviveGracePeriod();
                //weaponList = downedPlayer.weaponsList;
                if (!array_contains(downedPlayer.weaponsList, "iw5_usp45_mp"))
                {
                    downedPlayer takeWeapon("iw5_usp45_mp");
                    downedPlayer switchToWeapon(downedPlayer.lastDroppableWeapon);
                }
                downedPlayer thread restoreWeaponIfEmptyHanded();

                downedPlayer.Health = downedPlayer.maxHealth;
                reviveTrigger.icon destroy();
                //downedPlayer.headIcon = "";
                //downedPlayer.headIconTeam = "axis";
                self.progressBar.bg destroy();
                self.progressBar destroy();
                amount = int(downedPlayer.cash / 30);
                amount -= int(amount % 10);//Remove the difference
                self maps\mp\gametypes\_aiz_hud::scoreMessage(&"Revived &&1!", downedPlayer);
                if (isDefined(amount))
                {
                    self.cash += amount;
                    self maps\mp\gametypes\_aiz_hud::scorePopup(amount);
                }
                self.assists++;
                reviveTrigger.reviveCounter = undefined;
                reviveTrigger removeUsable();
                self clearLowerMessage("usable_message");
                self.hasMessageUp = false;
                self notify("left_usable");
                break;
            }
        }
        else
        {
            downedPlayer = reviveTrigger.player;
            reviveTrigger.user = undefined;
            self.progressBar.bg destroy();
            self.progressBar destroy();
            reviveTrigger.reviveCounter = 1;
            self enableWeapons();
            if (!isDefined(downedPlayer) || !downedPlayer.isAlive)
            {
                reviveTrigger removeUsable();
            }
            break;
        }
        wait(0.05);
    }
}

grabCarePackage(package)
{
    //if (!isDefined(package.user)) return;//Default so that there can't be multiple users
    if (self.isCarryingSentry) return;
    if (self.sessionTeam != "allies") return;
    if (!isDefined(self.percent) || self.percent != 0) return;

    self maps\mp\gametypes\_aiz_hud::createPrimaryProgressBar(0, 0);
    self.progressBar.isScaling = false;

    //package.user = self;
    self.percent = 0;

    self thread grabCarePackage_logicLoop(package);
}
grabCarePackage_logicLoop(package)
{
    //level endon("game_ended");
    self endon("disconnect");

    while(true)
    {
        if (level.gameEnded)
        {
            self.progressBar.bar destroy();
            self.progressBar destroy();
            return;
        }

        if (isDefined(package) && self useButtonPressed() && distanceSquared(self.origin, package.origin) < 5625)
        {
            self disableWeapons();

            if (package.owner == self)
                self.percent += 10;
            else
                self.percent++;

            if (!self.progressBar.isScaling && package.owner == self)
            {
                self.progressBar.isScaling = true;
                //self.progressBar scaleOverTime(1, 100, 10);
                self.progressBar maps\mp\gametypes\_aiz_hud::updateBar(120, .5);
            }
            else if (!self.progressBar.isScaling && package.owner != self)
            {
                self.progressBar.isScaling = true;
                //self.progressBar scaleOverTime(2.5f, 100, 10);
                self.progressBar maps\mp\gametypes\_aiz_hud::updateBar(120, 5);
            }
            if (self.percent >= 100)
            {
                self enableWeapons();
                self.progressBar.bg destroy();
                self.progressBar destroy();
                if (self != package.owner)
                {
                    package.owner.cash += 100;
                    package.owner maps\mp\gametypes\_aiz_hud::scorePopup(100);
                    package.owner maps\mp\gametypes\_aiz_hud::scoreMessage(&"Shared Care Package!");
                }
                playFX(level.fx_crateCollectSmoke, package.origin);
                playSoundAtPos(package.origin, "crate_impact");
                self.percent = 0;
                package removeUsable();
                self maps\mp\gametypes\_aiz_killstreaks::giveKillstreak(package.streak);
                self clearLowerMessage("usable_message");
                self.hasMessageUp = false;
                self notify("left_usable");
                return;
            }
        }
        else
        {
            self.progressBar.bg destroy();
            self.progressBar destroy();
            self.percent = 0;
            self enableWeapons();
            return;
        }

        wait(0.05);
    }
}

setExpAmmo(box)
{
    if (self.hasExpAmmoPerk) return;
    if (self.isCarryingSentry) return;
    if (self.sessionTeam != "allies") return;
    if (!isDefined(self.percent) || self.percent != 0) return;

    self maps\mp\gametypes\_aiz_hud::createPrimaryProgressBar(0, 0);
    self.progressBar.isScaling = false;

    self.percent = 0;

    self thread setExpAmmo_logicLoop(box);
}
setExpAmmo_logicLoop(box)
{
    //level endon("game_ended");
    self endon("disconnect");

    while(true)
    {
        if (level.gameEnded)
        {
            self.progressBar.bar destroy();
            self.progressBar destroy();
            return;
        }
        if (self useButtonPressed() && distanceSquared(self.origin, box.origin) < 5625 && isDefined(box))
        {
            self disableWeapons();
            self.percent += 2;

            if (!self.progressBar.isScaling)
            {
                self.progressBar.isScaling = true;
                self.progressBar maps\mp\gametypes\_aiz_hud::updateBar(120, 2.5);
            }
            if (self.percent >= 100)
            {
                self.progressBar.bg destroy();
                self.progressBar destroy();
                self givePerk("specialty_explosivebullets", false);
                self.hasExpAmmoPerk = true;
                self.percent = 0;

                foreach (weapon in self.weaponsList)
                {
                    type = weaponType(weapon);
                    if (type == "projectile" || type == "grenade" || isRayGun(weapon) || isThunderGun(weapon) || weapon == "iw5_usp45_mp_akimbo_silencer02" || weapon == "iw4_berettaupgraded_mp" || weapon == "iw4_javelin_mp" || weapon == "iw4_stinger_mp" || weapon == "iw4_colt45upgraded_mp" || isFlameWeapon(weapon)) continue;

                    self setWeaponAmmoClip(weapon, 0);
                    if (weaponIsAkimbo(weapon))
                        self setWeaponAmmoClip(weapon, 0, "left");
                    self giveMaxAmmo(weapon);
                }

                self enableWeapons();
                if (self != box.owner)
                {
                    box.owner.cash += 50;
                    box.owner maps\mp\gametypes\_aiz_hud::scorePopup(50);
                    box.owner maps\mp\gametypes\_aiz_hud::scoreMessage(&"Explosive Ammo Shared!");
                }
                return;
            }
        }
        else
        {
            self.progressBar.bg destroy();
            self.progressBar destroy();
            self.percent = 0;
            self enableWeapons();
            return;
        }
        wait(0.05);
    }
}

heliSniper_boardHeli(node)
{
    if (self.isCarryingSentry) return;
    if (self.sessionTeam != "allies") return;
    if (isWeaponDeathMachine(self getCurrentWeapon())) return;
    if (self != node.heli.owner || self.isDown) return;

    node.percent = 0;
    self thread heliSniper_boardHeli_holdLogicLoop(node);
}
heliSniper_boardHeli_holdLogicLoop(node)
{
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    
    while(true)
    {
        if (self useButtonPressed() && distanceSquared(self.origin, node.origin) < 5625)
        {
            node.percent++;
            if (node.percent >= 5)
            {
                self thread maps\mp\gametypes\_aiz_killstreaks::heliSniper_doBoarding(node.heli);
                if (isDefined(node.icon)) node.icon destroy();
                node.percent = undefined;
                node removeUsable();
                //Clear usable message manually
                self clearLowerMessage("usable_message");
                self.hasMessageUp = false;
                self notify("left_usable");
                break;
            }
        }
        else
        {
            break;
        }

        wait(0.05);
    }
}

givePlayerCash(recipient)
{
    if (!recipient.isDown) return;
    if (self == recipient) return;
    if (!recipient.IsAlive || !self.IsAlive) return;
    if (self.cash < 500) return;

    self.cash -= 500;
    self maps\mp\gametypes\_aiz_hud::scorePopup(-500);
    //icon = "cardicon_girlskull";
    senderMessage = /*icon + */level.gameStrings[238];/*, recipient.name + icon;*/
    self maps\mp\gametypes\_aiz_hud::scoreMessage(senderMessage, recipient);

    recipient.cash += 500;
    recipient maps\mp\gametypes\_aiz_hud::scorePopup(500);
    recipientMessage = /*icon + */level.gameStrings[239];/*, self.name + icon;*/
    recipient maps\mp\gametypes\_aiz_hud::scoreMessage(recipientMessage, self);
}
//-END SPECIAL USABLE LOGIC-//

//-START STRUCTURE CREATORS-//
randomWeaponCrate(origin, angles, objID, currentLoc)
{
    if (!isDefined(currentLoc))
        currentLoc = 0;

    if (array_contains(level.wawMaps, level._mapname))
    {
        crate = spawn("script_model", origin);
        crate.angles = angles + (0, 90, 0);
        crate setModel("tag_origin");
    }
    else
        crate = spawnCrate(origin, angles, false, false);
    curObjID = undefined;
    //if (isDefined(objId))
        //curObjID = objID;
    //else
        curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();
    objective_add(curObjID, "invisible", (0, 0, 0));
    objective_position(curObjId, crate.origin);
    objective_team(curObjID, "allies");
    objective_state(curObjId, "active");
    objective_icon(curObjId, "weapon_colt_45");
    crate.objID = curObjID;
    /*
    HeadIcon = newHudElem();
    HeadIcon[0] = origin[0];
    HeadIcon[1] = origin[1];
    HeadIcon[2] = origin[2] + 40;
    HeadIcon.alpha = 0.85f;
    HeadIcon setShader("weapon_colt_45", 10, 10);
    HeadIcon setWaypoint(true, false, false);
    crate.icon = HeadIcon;
    */

    crate.state = "idle";
    crate.weapon = 0;
    crate.player = undefined;
    crate.destroyed = true;
    crate.lastLocation = currentLoc;

    weapon = spawn("script_model", crate.origin + (0, 0, 20));
    weapon setModel("viewmodel_metal_gear_gun");
    if (array_contains(level.wawMaps, level._mapname))
        weapon setModel("tag_origin");
    weapon hidePart("tag_silencer");
    weapon hidePart("tag_knife");
    crate.weaponEnt = weapon;

    if (!array_contains(level.wawMaps, level._mapname)) crate thread rotateWeaponCrateWeapon();

    crate addUsable("randombox", 75);

    if (!array_contains(level.wawMaps, level._mapname)) crate thread watchCratePlayerCollision();

    /*
    if (level.isXmas)
        crate spawnXmasLightsOnUsable();
    */

    if (level._mapname == "mp_factory_sh")
    {
        boxSpawn = getEnt("magic_box_weapon_spawn_" + currentLoc, "targetname");
        if (!isDefined(boxSpawn))
        {
            printLn("Missing a zombie mystery box spawn with index " + currentLoc);
            return;
        }

        boxBase = getEnt("magic_box_base_" + currentLoc, "targetname");
        boxBase show();
        crate.boxBase = boxBase;
        boxLid = getEnt("magic_box_lid_" + currentLoc, "targetname");
        boxLid show();
        crate.boxLid = boxLid;
        boxLid.angles = boxLid.spawnAngles;
    }

    return crate;
}
watchCratePlayerCollision()
{
    self endon("death");

    self notSolid();
    self setContents(0);

    isClear = false;
    while (!isClear)
    {
        waitframe();
        isClear = true;
        foreach (player in level.players)
        {
            if (!isDefined(player.isAlive) || !player.isAlive)
                continue;

            if (player isTouching(self))
            {
                isClear = false;
                break;
            }
        }
    }

    self solid();
    self setContents(1);
}
rotateWeaponCrateWeapon()
{
    level endon("game_ended");
    self endon("death");

    while(true)
    {
        if (self.state == "idle")
        {
            if (isDefined(self.weaponEnt))
                self.weaponEnt rotateYaw(360, 3);

            wait(3);
        }
        else wait(1);
    }
}

papCrate(origin, angles)
{
    crate = spawn("script_model", origin - (0, 0, 15));
    crate setModel("com_plasticcase_beige_big");
    crate.angles = angles;
    crateCol = spawnCrate(origin, angles, true, false);
    crate.collision = crateCol;
    curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();
    objective_add(curObjID, "invisible", (0, 0, 0));
    objective_position(curObjId, crate.origin);
    objective_team(curObjID, "allies");
    objective_state(curObjId, "active");
    objective_icon(curObjId, "cardicon_brassknuckles");
    /*
    HeadIcon = newHudElem();
    HeadIcon.x = origin[0];
    HeadIcon.y = origin[1];
    HeadIcon.z = origin[2] + 40;
    HeadIcon.alpha = 0.85f;
    HeadIcon setShader("cardicon_brassknuckles", 10, 10);
    HeadIcon setWaypoint(true, false, false);
    */
    crate.state = "idle";
    crate.weapon = "";
    crate.player = undefined;

    weapon = spawn("script_model", crate.origin + (0, 0, 10));
    weapon setModel("tag_origin");
    weapon hide();
    //weapon enableLinkTo();
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
    //return crate;
}

gamblerCrate(origin, angles)
{
    crate = spawnCrate(origin, angles, false, false);
    laptop = spawn("script_model", (origin[0], origin[1], origin[2] + 22));
    laptop.angles = (0, 90, 0);
    laptop setModel("com_laptop_2_open");
    crate.laptop = laptop;
    crate.gamblerInUse = false;
    laptop thread rotateEntity();
    curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();
    objective_add(curObjID, "invisible", (0, 0, 0));
    objective_position(curObjId, crate.origin);
    objective_team(curObjID, "allies");
    objective_state(curObjId, "active");
    objective_icon(curObjId, "cardicon_8ball");
    /*
    HeadIcon = newHudElem();
    HeadIcon.x = origin[0];
    HeadIcon.y = origin[1];
    HeadIcon.z = origin[2] + 40;
    HeadIcon.alpha = 0.85f;
    HeadIcon setShader("cardicon_8ball", 10, 10);
    HeadIcon setWaypoint(true, false, false);
    */
    crate addUsable("gambler", 75);
    //return crate;
}

perkCrate(origin, angles, perk)
{
    crate = spawnCrate(origin, angles, false, false);
    model = "com_plasticcase_friendly";
    if (perk == -1 || perk == 1 || perk == 2 || perk == 5) model = "com_plasticcase_enemy";
    crate setModel(model);
    curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();
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
            cost = 4000;
            icon = "specialty_twoprimaries_upgrade";
            break;
        case 5:
            cost = 2000;
            icon = "weapon_attachment_rof";
            break;
        case 6:
            cost = 1500;
            icon = "specialty_stalker_upgrade";
            break;
        case 7:
            cost = 1500;
            icon = "waypoint_revive";
            break;
        case 8:
            cost = 4000;
            icon = "specialty_scavenger_upgrade";
            break;
        default:
            icon = "white";
            break;
    }
    if (perk == -1)
    {
        cosr = 2500;
        icon = "specialty_light_armor";
    }

    objective_add(curObjID, "invisible", (0, 0, 0));
    objective_position(curObjId, crate.origin);
    objective_team(curObjID, "allies");
    objective_state(curObjId, "active");
    objective_icon(curObjId, icon);
    crate.cost = cost;
    if (perk == -1) crate spawnRebar(origin);
    else crate addUsable("perk" + perk, 75);
    //return crate;
}

ammoCrate(origin, angles)
{
    crate = spawnCrate(origin, angles, false, false);
    curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();
    objective_add(curObjID, "invisible", (0, 0, 0));//waypoint_ammo_friendly or airdrop_icon
    objective_position(curObjId, crate.origin);
    objective_team(curObjID, "allies");
    objective_state(curObjId, "active");
    objective_icon(curObjId, "waypoint_ammo_friendly");
    /*
    HeadIcon = newHudElem();
    HeadIcon[0] = origin[0];
    HeadIcon[1] = origin[1];
    HeadIcon[2] = origin[2] + 40;
    HeadIcon.alpha = 0.85f;
    HeadIcon setShader("airdrop_icon", 10, 10);
    HeadIcon setWaypoint(true, false, false);
    */

    ammoBox = spawn("script_model", origin + (0, 0, 20));
    ammoBox.angles = (0, 0, 0);
    ammoBox setModel("weapon_m60_clip_iw5");
    ammoRotater = Spawn("script_model", origin + (0, 0, 20));
    ammoRotater.angles = (0, 0, 0);
    ammoRotater setModel("tag_origin");
    //ammoBox enableLinkTo();
    ammoBox linkTo(ammoRotater, "tag_origin", (7, -4, 0), (0, 0, 0));
    ammoRotater thread rotateEntity();

    crate.used = false;
    crate addUsable("ammo", 75);
    //return crate;
}

killstreakCrate(origin, angles)
{
    crate = spawnCrate(origin, angles, false, false);
    crate setModel("com_plasticcase_enemy");
    curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();
    objective_add(curObjID, "invisible", (0, 0, 0));
    objective_position(curObjId, crate.origin);
    objective_team(curObjID, "allies");
    objective_state(curObjId, "active");
    objective_icon(curObjId, "cardicon_aircraft_01");
    /*
    HeadIcon = newHudElem();
    HeadIcon[0] = origin[0];
    HeadIcon[1] = origin[1];
    HeadIcon[2] = origin[2] + 40;
    HeadIcon.alpha = 0.85f;
    HeadIcon setShader("cardicon_brassknuckles", 10, 10);
    HeadIcon setWaypoint(true, false, false);
    */
    remote = spawn("script_model", origin + (0, 0, 20));
    remote.angles = (0, 0, 0);
    remote setModel("viewmodel_uav_radio");
    remote thread rotateEntity();

    crate addUsable("killstreak", 75);
    //return crate;
}

rotateEntity()
{
    level endon ("game_ended");

    while (true)
    {
        self rotateYaw(360, 4);
        wait(4);
    }
}

powerCrate(origin, angles)
{
    crate = spawnCrate(origin, angles, false, false);
    curObjID = maps\mp\gametypes\_gameobjects::getNextObjID();
    objective_add(curObjID, "invisible", (0, 0, 0));
    objective_position(curObjId, crate.origin);
    objective_team(curObjID, "allies");
    objective_state(curObjId, "active");
    objective_icon(curObjId, "cardicon_bulb");
    crate.objID = curObjID;
    /*
    HeadIcon = newHudElem();
    HeadIcon[0] = origin[0];
    HeadIcon[1] = origin[1];
    HeadIcon[2] = origin[2] + 40;
    HeadIcon.alpha = 0.85f;
    HeadIcon setShader("cardicon_bulb", 10, 10);
    HeadIcon setWaypoint(true, false, false);
    */
    //crate.icon = HeadIcon;

    crate.fx = spawnFX(level.fx_glow, crate.origin + (0, 0, 20));
    crate.fx2 = spawnFX(level.fx_glow2, crate.origin + (0, 0, 30));
    crate thread runPowerCrateFX();

    crate.bought = false;
    crate addUsable("power", 75);
    //return crate;
}

runPowerCrateFX()
{
    level endon("game_ended");
    self endon("death");

    while (isDefined(self.fx))
    {
        TriggerFX(self.fx);
        TriggerFX(self.fx2);

        wait(0.1);
    }
}

wallWeapon(origin, angles, weapon, price)
{
    wep = spawn("script_model", origin);
    model = getWeaponModel(weapon);
    wep setModel(model);
    if (isSubStr("iw4_", weapon))
    {
        wep hideAllParts();
        wep showPart("tag_weapon");
        wep showPart("tag_clip");
        if (weapon == "iw4_m4reflex_mp" || weapon == "iw4_m16_mp")
            wep showPart("tag_red_dot");
        else if (weapon == "iw4_m4silencer_mp")
            wep showPart("tag_silencer");
        else if (weapon == "iw4_m21_mp" || weapon == "iw4_wa2000_mp")
            wep showPart("tag_acog_2");
        else if (weapon == "iw4_dragunov_mp")
            wep showPart("tag_dragunov_scope");
        else if (weapon == "iw4_barrett_mp")
            wep showPart("tag_m82_scope");
        else if (weapon == "iw4_raygun_mp")
            wep showPart("tag_eotech");
        else wep showPart("tag_sight_on");
    }
    wep.angles = angles;
    wep.price = price;
    wep.weapon = weapon;
    wep.bought = false;
    wep addUsable("wallweapon", 70);
    return wep;
}

createRamp(top, bottom)
{
    rampDist = distance(top, bottom);
    blocks = ceil(rampDist / 30);
    a = ((top[0] - bottom[0]) / blocks, (top[1] - bottom[1]) / blocks, (top[2] - bottom[2]) / blocks);
    temp = VectorToAngles(top - bottom);
    ba = (temp[2], temp[1] + 90, temp[0]);
    for (b = 0; b <= blocks; b++)
    {
        spawnCrate(bottom + (a * b), ba, false, false);
    }
}

spawnRebar(origin)
{
    if (level._mapname != "mp_interchange") return;
    rebar = spawn("script_model", origin - (0, 100, 45));
    rebar setModel("concrete_slabs_lrg1");
    self thread initJuggAnim(rebar);
}
initJuggAnim(rebar)
{
    level endon("game_ended");
    self endon("interchange_crate_activated");

    while (true)
    {
        wait(30);

        if (!level.powerActivated)
        {
            continue;
        }
        else if (level.EMPTime == 0)
        {
            foreach (player in level.players)
            {
                player playLocalSound("nuke_wave");
            }
            /*
            if (isDefined(self.fx_xmas))
            {
                stopFXOnTag(level.fx_rayGunUpgrade, self.fx_xmas[0], "tag_origin");
                stopFXOnTag(level.fx_rayGun, self.fx_xmas[1], "tag_origin");
                stopFXOnTag(level.fx_rayGun, self.fx_xmas[2], "tag_origin");
                stopFXOnTag(level.fx_rayGunUpgrade, self.fx_xmas[3], "tag_origin");
            }
            */

            wait(2.8);

            rockCrumble = spawnFX(level.fx_rock, rebar.origin);
            triggerFX(rockCrumble);
            smoke2 = spawnFX(level.fx_crateSmoke, rebar.origin + (100, 0, 0));
            triggerFX(smoke2);
            smoke3 = spawnFX(level.fx_crateSmoke, rebar.origin - (100, 0, 0));
            triggerFX(smoke3);
            earthquake(0.5, 6.5, rebar.origin - (0, 0, 500), 5000);

            wait(2);

            rebar playSound("talon_destroyed");
            rebar rotateTo((50, 0, -25), 4, 0.5, 1);
            rebar moveTo(rebar.origin - (0, 0, 50), 4, 0.5, 1);

            wait(1);

            dropImpulse = (300, 50, -60);
            self physicsLaunchServer((0, 0, 0), dropImpulse);

            wait(1.5f);

            crateSmoke = spawnFX(level.fx_crateSmoke, self.origin);
            triggerFX(crateSmoke);

            wait(3);

            crateSmoke delete();
            rockCrumble delete();
            smoke2 delete();
            smoke3 delete();

            wait(1);
            /*
            if (isDefined(self.fx_xmas))
            {
                playFXOnTag(level.fx_rayGunUpgrade, self.fx_xmas[0], "tag_origin");
                playFXOnTag(level.fx_rayGun, self.fx_xmas[1], "tag_origin");
                playFXOnTag(level.fx_rayGun, self.fx_xmas[2], "tag_origin");
                playFXOnTag(level.fx_rayGunUpgrade, self.fx_xmas[3], "tag_origin");
            }
            */
            self addUsable("perk1", 75);
            self notify("interchange_crate_activated");
        }
    }
}

createDoor(open, close, angle, size, height, range, cost, newSpawn, newSpawnAngles)
{

    offset = (((size / 2) - 0.5) * -1);
    center = spawn("script_model", close);
    pieces = [];
    if (size > 0)
    {
        for (j = 0; j < size; j++)
        {
            door = spawnCrate(close + vecscale((0, 30, 0), offset), (0, 0, 0), false, false);
            door setModel("com_plasticcase_enemy");
            //door enableLinkTo();
            door linkTo(center);
            pieces[pieces.size] = door;
            for (h = 1; h < height; h++)
            {
                doorHeightOffset = 70;
                if (level._mapname == "mp_base")
                    doorHeightOffset = 30;
                door2 = spawnCrate(close + vecscale((0, 30, 0), offset) - vecscale((doorHeightOffset, 0, 0), h), (0, 0, 0), false, false);
                door2 setModel("com_plasticcase_enemy");
                //door2 enableLinkTo();
                door2 linkTo(center);
                pieces[pieces.size] = door2;
            }
            offset += 1;
        }
    }
    center.angles = angle;
    center.open = open;
    center.close = close;
    center.cost = cost;
    center.pieces = pieces;

    center addUsable("door", range);
    center.state = "close";

    if (isDefined(newSpawn) && isDefined(newSpawnAngles))
    {
        center.spawn = newSpawn;
        center.spawnAngles = newSpawnAngles;
    }

    return center;
}

createWall(start, end, invisible, death)
{
    D = distance((start[0], start[1], 0), (end[0], end[1], 0));
    H = distance((0, 0, start[2]), (0, 0, end[2]));
    blocks = roundDecimalPlaces(D / 60, 0);
    height = roundDecimalPlaces(H / 30, 0);

    C = end - start;
    A = (C[0] / blocks, C[1] / blocks, C[2] / height);
    TXA = A[0] / 4;
    TYA = A[1] / 4;
    angle = VectorToAngles(C);
    angle = (0, angle[1], 90);
    //center = Spawn("script_origin", (
    //(start[0] + end[0]) / 2, (start[1] + end[1]) / 2, (start[2] + end[2]) / 2));
    for (h = 0; h < height; h++)
    {
        crate = spawnCrate((start + (TXA, TYA, 15) + vecscale((0, 0, A[2]), h)), angle, invisible, death);
        //crate enableLinkTo();
        //crate linkTo(center);
        crate willNeverChange();
        if (death) crate thread setDeathWall();
        for (i = 0; i < blocks; i++)
        {
            crate = spawnCrate(start + vecscale((A[0], A[1], 0), i) + (0, 0, 15) + vecscale((0, 0, A[2]), h), angle, invisible, death);
            //crate enableLinkTo();
            //crate linkTo(center);
            crate willNeverChange();
            if (death) crate thread setDeathWall();
        }
        crate = spawnCrate((end[0], end[1], start[2]) + (TXA * -1, TYA * -1, 15) + vecscale((0, 0, A[2]), h), angle, invisible, death);
        //crate enableLinkTo();
        //crate linkTo(center);
        crate willNeverChange();
        if (death) crate thread setDeathWall();
    }
    //return center;
}

vecscale(vec, scalar)
{
	return (vec[0]*scalar, vec[1]*scalar, vec[2]*scalar);
}

setDeathWall()
{
    level endon("game_ended");
    self endon("death");

    while(true)
    {
        foreach (player in level.players)
        {
            if (player.isAlive && distanceSquared(player.origin, self.origin) < 3600)
                player suicide();
        }

        wait(0.2);
    }
}

createFloor(corner1, corner2, invisible, death)
{
    width = corner1[0] - corner2[0];
    if (width < 0) width = width * -1;
    length = corner1[1] - corner2[1];
    if (length < 0) length = length * -1;

    bwide = roundDecimalPlaces(width / 50, 0);
    length = roundDecimalPlaces(length / 30, 0);
    C = corner2 - corner1;
    A = (C[0] / bwide, C[1] / length, 0);
    //center = spawn("script_origin", (
    //(corner1[0] + corner2[0]) / 2, (corner1[1] + corner2[1]) / 2, corner1[2]));
    for (i = 0; i < bwide; i++)
    {
        for (j = 0; j < length; j++)
        {
            crate = spawnCrate(corner1 + vecscale((A[0], 0, 0), i) + vecscale((0, A[1], 0), j), (0, 0, 0), invisible, death);
            //crate enableLinkTo();
            //crate linkTo(center);
            crate willNeverChange();
        }
    }
    //return center;
}

createElevator(enter, exit)
{
    flag = Spawn("script_model", enter);
    flag setModel(getAlliesFlagModel(level._mapname));
    flag2 = Spawn("script_model", exit);
    flag2 setModel(getAxisFlagModel(level._mapname));
    //trigger = spawn("trigger_radius", flag.origin + (0, 0, 50), 0, 50, 50);
    //trigger.code_classname = "trigger_teleport";
    //trigger.endPos = exit;

    level thread watchElevator(enter, exit);
}

watchElevator(enter, exit)
{
    level endon("game_ended");

    while(true)
    {
        foreach (player in level.players)
        {
            if (player.isAlive && distanceSquared(player.origin, enter) <= 2500)
            {
                player setOrigin(exit);
            }
        }
        wait(.2);
    }
}

realElevator(start, angle, end, drop)
{
    elevator = spawnCrate(start, angle, false, false);
    elevator.startPos = start;
    elevator.endPos = end;
    elevator.dropPos = drop;
    elevator.isMoving = false;
    elevator addUsable("elevator", 50);
}
createZipline(start, angle, pos1, pos2, pos3, pos4, pos5)
{
    zipline = spawnCrate(start, angle, false, false);
    zipline.startPos = start;
    zipline.path = [];
    zipline.path[zipline.path.size] = pos1;
    if (isDefined(pos2))
        zipline.path[zipline.path.size] = pos2;
    if (isDefined(pos3))
        zipline.path[zipline.path.size] = pos3;
    if (isDefined(pos4))
        zipline.path[zipline.path.size] = pos4;
    if (isDefined(pos5))
        zipline.path[zipline.path.size] = pos5;

    zipline.isMoving = false;
    zipline addUsable("zipline", 50);
}

createTeleporter(startPos, startAngles, endPos, endAngles, linkerPos, linkerAngles, time)
{
    teleporter = spawn("script_model", startPos + (0, 0, 45));
    teleporter.angles = startAngles;
    teleporter setModel("tag_origin");
    teleporter hide();
    //teleporter enableLinkTo();
    teleporter.isLinked = false;
    teleporter.endPos = endPos;
    teleporter.endAngles = endAngles;
    teleporter.teleTime = time;
    floorsActive = [];
    for (i = 0; i < 6; i++)
    {
        floor = spawnCrate(startPos, (0, 0, 0), false, false);
        floor setModel("com_plasticcase_enemy");
        floorActive = spawn("script_model", startPos);
        floorActive setModel("com_plasticcase_trap_bombsquad");
        floorActive hide();
        //floor solid();
        offset = (0, 0, 0);
        switch (i)
        {
            case 0:
                offset = (28, 30, -45);
                break;
            case 1:
                offset = (-28, 30, -45);
                break;
            case 2:
                offset = (28, -30, -45);
                break;
            case 3:
                offset = (-28, -30, -45);
                break;
            case 4:
                offset = (28, 0, -45);
                break;
            case 5:
                offset = (-28, 0, -45);
                break;
        }
        floor linkTo(teleporter, "tag_origin", offset, (0, 0, 0));
        floorActive linkTo(teleporter, "tag_origin", offset, (0, 0, 0));
        floorsActive[i] = floorActive;
    }
    teleporter.floorsActive = floorsActive;
    teleporter.state = 0;
    linker = Spawn("script_model", linkerPos + (0, 0, 45));
    linker.angles = linkerAngles;
    linker setModel("weapon_radar");
    linker.teleporter = teleporter;
    //HeadIcon = HudElem.NewHudElem();
    //HeadIcon[0] = linkerPos[0];
    //HeadIcon[1] = linkerPos[1];
    //HeadIcon[2] = linkerPos[2] + 75;
    //HeadIcon.Alpha = 0.85f;
    //HeadIcon setShader("cardicon_illuminati", 3, 3);
    //HeadIcon setWaypoint(true, false);
    //linker.icon = HeadIcon;
    linker addUsable("linker", 75);
    teleporter addUsable("teleporter", 80);
}

spawnModel(origin, angles, model)
{
    ent = Spawn("script_model", origin);
    ent setModel(model);
    ent.angles = angles;

    ent checkModelForAnim();
    return ent;
}
checkModelForAnim()
{
    modelName = self.Model;

    if (isSubStr(modelName, "plastic_fence"))
    {
        PreCacheMpAnim(modelName + "_med_01");
        self scriptModelPlayAnim(modelName + "_med_01");
    }
    else if (isSubStr(modelName, "fence_tarp"))
    {
        if (modelName != "fence_tarp_134x76")
        {
            PreCacheMpAnim(modelName + "_med_01");
            self scriptModelPlayAnim(modelName + "_med_01");
        }
        else if (modelName == "fence_tarp_134x76")
        {
            PreCacheMpAnim(modelName + "_med_02");
            self scriptModelPlayAnim(modelName + "_med_02");
        }

    }
    else if (isSubStr(modelName, "oil_pump_jack"))
    {
        PreCacheMpAnim("oilpump_pump01");
        self scriptModelPlayAnim("oilpump_pump01");
    }
    else if (isSubStr(modelName, "machinery_windmill"))
    {
        PreCacheMpAnim("windmill_spin_med");
        self scriptModelPlayAnim("windmill_spin_med");
    }
    else if (modelName == "foliage_tree_palm_bushy_1")
    {
        preCacheMpAnim("palmtree_mp_bushy1_sway");
        self scriptModelPlayAnim("palmtree_mp_bushy1_sway");
        self setContents(1);
    }
    else if (modelName == "foliage_pacific_fern01_animated")
    {
        preCacheMpAnim("foliage_pacific_fern01_sway");
        self scriptModelPlayAnim("foliage_pacific_fern01_sway");
        self setContents(1);
    }
}

spawnCrate(origin, angles, invisible, death)
{
    ent = spawn("script_model", origin);
    if (!invisible && !death) ent setModel("com_plasticcase_friendly");
    ent.angles = angles;
    if (!death)
    {
        if (level._mapname == "mp_base")
        {
            crateForward = anglesToForward(angles);
            crateRight = anglesToRight(angles);

            weakColl1 = spawn("script_origin", origin + (crateForward * 25) + (crateRight * 10));
            weakColl1 setContents(1);
            if (invisible) weakColl1 willNeverChange();
            weakColl2 = spawn("script_origin", origin + (crateForward * 25) + (crateRight * -10));
            weakColl2 setContents(1);
            if (invisible) weakColl2 willNeverChange();
            weakColl3 = spawn("script_origin", origin + (crateForward * -25) + (crateRight * 10));
            weakColl3 setContents(1);
            if (invisible) weakColl3 willNeverChange();
            weakColl4 = spawn("script_origin", origin + (crateForward * -25) + (crateRight * -10));
            weakColl4 setContents(1);
            if (invisible) weakColl4 willNeverChange();
            weakColl5 = spawn("script_origin", origin + (crateRight * 10));
            weakColl5 setContents(1);
            if (invisible) weakColl5 willNeverChange();
            weakColl6 = spawn("script_origin", origin + (crateRight * -10));
            weakColl6 setContents(1);
            if (invisible) weakColl6 willNeverChange();

            if (!invisible)
            {
                weakColl1 linkTo(ent);
                weakColl2 linkTo(ent);
                weakColl3 linkTo(ent);
                weakColl4 linkTo(ent);
                weakColl5 linkTo(ent);
                weakColl6 linkTo(ent);
            }

            return ent;
        }

        ent cloneBrushModelToScriptModel(level.airDropCrateCollision);
        ent setContents(1);
        //ent solid();
    }
    return ent;
}

monitorFallDeath(height)
{
    level endon ("game_ended");

    level waittill("connected");

    while(true)
    {
        foreach (player in level.players)
        {
            if (isDefined(player.isAlive) && player.isAlive && !player.notTargetable)
            {
                if (player.origin[2] < height)
                    player suicide();
            }
        }
        wait(0.2);
    }
}

setupSpaceLimit(isX, min, max)
{
    level thread watchSpaceLimit(isX, min, max);
}

watchSpaceLimit(isX, min, max)
{
    level endon("game_ended");

    level waittill("connected");

    while(true)
    {
        foreach (player in level.players)
        {
            if (player.isAlive)
            {
                origin = player.origin;
                if (isX)
                {
                    if (origin[0] < min) player setOrigin((min + 10, origin[1], origin[2]));
                    else if (origin[0] > max) player setOrigin((max - 10, origin[1], origin[2]));
                }
                else
                {
                    if (origin[1] < min) player setOrigin((origin[0], min + 10, origin[2]));
                    else if (origin[1] > max) player setOrigin((origin[0], max - 10, origin[2]));
                }
            }
        }
        wait(0.2);
    }
}

spawnBank(origin, angles)
{
    ent = spawnCrate(origin, angles, false, false);
    ent addUsable("bank", 75);
    //return ent;
}
//-END STRUCTURE CREATORS-//

//-START USE LOGIC-//
useBox(box)
{
    currentWeapon = self getCurrentWeapon();
    if (self.SessionTeam == "axis" || self.isDown || isSubStr(currentWeapon, "killstreak") || isWeaponDeathMachine(currentWeapon) || (isSubStr(currentWeapon, "marker") && currentWeapon != "uav_strike_marker_mp") || currentWeapon == "none") return;
    if (self isSwitchingWeapon()) return;
    //boxPlayer = box.player;
    if (box.state == "waiting" && box.player == self)
    {
        boxWeapon = box.weapon;
        name = level.weaponNames[boxWeapon];

        if (isRayGun(name))
        {
            box playSound("copycat_steal_class");
            level.currentRayguns++;
        }
        else if (isThunderGun(name))
        {
            box playSound("copycat_steal_class");
            level.currentThunderguns++;
        }
        else if (name == "stinger_mp")
        {
            box playSound("copycat_steal_class");
            level.currentZappers++;
        }

        if ((self.perksBought[3] && self.newGunReady && self.perk4weapon == "") || (self.perksBought[3] && self.perk4weapon != name && currentWeapon == self.perk4weapon))
            self.perk4weapon = name;

        if (isThunderGun(currentWeapon))
            level.currentThunderguns--;
        else if (isRayGun(currentWeapon))
            level.currentRayguns--;
        else if (currentWeapon == "stinger_mp")
            level.currentZappers--;

        if (!self hasWeapon(name) && !self.newGunReady)
        {
            if (name != "lightstick_mp")
            {
                if (isSubStr(currentWeapon, "alt_iw5_") || isSubStr(currentWeapon, "alt_iw4_"))//Fix alt weapons allowing players to take multiple weapons
                {
                    tokens = strTok(currentWeapon, "_");
                    currentWeapon = "iw5";
                    for (i = 2; i < tokens.size; i++)
                        currentWeapon += "_" + tokens[i];
                }
                else if (currentWeapon == "alt_rsass_hybrid_mp")
                    currentWeapon = "rsass_hybrid_mp";

                self updatePlayerWeaponsList(currentWeapon, true);
                self takeWeapon(currentWeapon);
            }
            else self maps\mp\gametypes\_aiz_hud::updateAmmoHud(false);
        }
        self giveWeapon(name);
        self giveMaxAmmo(name);

        if (name != "lightstick_mp")
        {
            self switchToWeapon(name);
            self updatePlayerWeaponsList(name);
            self.newGunReady = false;
        }
        else self maps\mp\gametypes\_aiz_hud::updateAmmoHud(false);
        self playLocalSound("ammo_crate_use");
        weaponEnt = box.weaponEnt;
        //weaponEnt hide();
        weaponEnt setModel("viewmodel_metal_gear_gun");
        if (array_contains(level.wawMaps, level._mapname))
            weaponEnt setModel("tag_origin");

        weaponEnt showAllParts();
        weaponEnt hidePart("tag_silencer");
        weaponEnt hidePart("tag_knife");
        weaponEnt moveTo(box.origin + (0, 0, 20), 1, 0.3, 0.6);
        box.destroyed = true;
        box.state = "post_pickup";

        if (array_contains(level.wawMaps, level._mapname))
        {
            box.boxLid rotateRoll(-90, 0.75);
            wait(0.5);
            box playSound("aiz_mystery_box_close");
        }

        box notify("weapon_taken");

        wait(2);
        box.state = "idle";
        return;
    }

    if (box.state != "idle") return;

    if (self.cash < 10 && level.sale)
    {
        self iPrintLn(level.gameStrings[240]);
        return;
    }
    else if (self.cash < 950 && !level.sale)
    {
        self iPrintLn(level.gameStrings[241]);
        return;
    }

    if (box.state == "idle")
    {
        if (level.sale)
        {
            self.cash -= 10;
            self maps\mp\gametypes\_aiz_hud::scorePopup(-10);
        }
        else
        {
            self.cash -= 950;
            self maps\mp\gametypes\_aiz_hud::scorePopup(-950);
        }
        self maps\mp\gametypes\_aiz_hud::scoreMessage(level.gameStrings[242]);
    }
    box.state = "inuse";
    self playLocalSound("achieve_bomb");
    weapon = box.weaponEnt;
    //weapon.origin = box.origin;
    //weapon show();
    weapon setModel(level.weaponModels[0]);
    //weapon.angles = angles;
    weapon rotateTo(box.angles, 1, 0, .5);
    box.destroyed = false;

    if (array_contains(level.wawMaps, level._mapname))
    {
        box playSound("aiz_mystery_box_open");
        box playSound("aiz_mystery_box_music");
        box.boxLid rotateRoll(90, 0.75);
    }

    weapon.boxCounter = 0;
    weapon.boxIndex = 0;

    weapon moveTo(box.origin + (0, 0, 40), 3, 0, 0.5);

    weapon thread box_rollWeapon();

    wait(3);

    if (level.boxLocations.size > 1)//Fix box getting bear with 1 location available
    {
        isBear = randomInt(level.boxMaxUses) == level.boxMaxUses - 1;//Random number is max
        if (isBear && level.boxMaxUses < 13 && !level.sale && self.hasUsedBox)
        {
            weapon.angles -= (0, 90, 0);
            box thread moveWeaponBox(weapon);
            //give player back their 'hard earned' moo-lah
            self.cash += 950;
            self maps\mp\gametypes\_aiz_hud::scorePopup(950);
            return;
        }
        else if (!level.sale) level.boxMaxUses--;
    }

    self.hasUsedBox = true;

    if ((isRayGun(level.weaponNames[weapon.boxIndex]) && (level.currentRayguns >= level.maxRayguns || self hasRayGun()))
    || (isThunderGun(level.weaponNames[weapon.boxIndex]) && (level.currentThunderguns >= level.maxThunderguns || self hasThunderGun()))
    || (level.weaponNames[weapon.boxIndex] == "stinger_mp" && level.currentZappers > 0))
    {
        weapon.boxIndex = randomInt(level.weaponModels.size);
        weapon setModel(level.weaponModels[weapon.boxIndex]);
    }

    if (self hasWeapon(level.weaponNames[weapon.boxIndex]) || self hasUpgradedWeapon(getWeaponUpgrade(level.weaponNames[weapon.boxIndex])))//Just reroll
    {
        weapon.boxIndex = randomInt(level.weaponModels.size);
        weapon setModel(level.weaponModels[weapon.boxIndex]);
        if (self hasWeapon(level.weaponNames[weapon.boxIndex]) || self hasUpgradedWeapon(getWeaponUpgrade(level.weaponNames[weapon.boxIndex])))//If again, reroll
        {
            weapon.boxIndex = randomInt(level.weaponModels.size);
            weapon setModel(level.weaponModels[weapon.boxIndex]);
        }
    }

    box.state = "waiting";
    box.weapon = weapon.boxIndex;
    weapon setModel(level.weaponModels[weapon.boxIndex]);
    if (isSubStr(level.weaponNames[weapon.boxIndex], "iw4_") && level.weaponNames[weapon.boxIndex] != "iw4_onemanarmy_mp")
    {
        weapon hideAllParts();
        weapon showPart("tag_weapon");
        weapon showPart("tag_clip");
        if (level.weaponNames[weapon.boxIndex] == "iw4_m4reflex_mp" || level.weaponNames[weapon.boxIndex] == "iw4_m16_mp")
            weapon showPart("tag_red_dot");
        else if (level.weaponNames[weapon.boxIndex] == "iw4_m4silencer_mp" || level.weaponNames[weapon.boxIndex] == "iw4_tmpsilencer_mp")
            weapon showPart("tag_silencer");
        else if (level.weaponNames[weapon.boxIndex] == "iw4_m21_mp" || level.weaponNames[weapon.boxIndex] == "iw4_wa2000_mp")
            weapon showPart("tag_acog_2");
        else if (level.weaponNames[weapon.boxIndex] == "iw4_dragunov_mp")
            weapon showPart("tag_dragunov_scope");
        else if (level.weaponNames[weapon.boxIndex] == "iw4_barrett_mp")
            weapon showPart("tag_m82_scope");
        else if (level.weaponNames[weapon.boxIndex] == "iw4_raygun_mp")
            weapon showPart("tag_eotech");
        else if (level.weaponNames[weapon.boxIndex] == "iw4_striker_mp")
            weapon showPart("tag_foregrip");
        else if (level.weaponNames[weapon.boxIndex] == "iw4_colt45_mp")
            weapon showPart("j_pistol_grip");
        else weapon showPart("tag_sight_on");
    }
    weapon moveTo(box.origin + (0, 0, 20), 10, 0, 1);
    box.player = self;

    box thread box_waitForWeapon(weapon);
}
box_waitForWeapon(weapon)
{
    self endon("weapon_taken");

    wait(11);

    if (self.state != "idle" && distance(weapon.origin, (self.origin + (0, 0, 20))) < 0.1)
    {
        if (!self.destroyed)
        {
            self.weapon = 0;
            self.destroyed = true;
            //weapon hide();
            weapon setModel("viewmodel_metal_gear_gun");
            if (array_contains(level.wawMaps, level._mapname))
                weapon setModel("tag_origin");

            weapon hidePart("tag_silencer");
            weapon hidePart("tag_knife");

            if (array_contains(level.wawMaps, level._mapname))
            {
                self.state = "post_pickup";
                self.boxLid rotateRoll(-90, 0.75);
                wait(0.5);
                self playSound("aiz_mystery_box_close");
                wait(0.25);
            }

            self.state = "idle";
        }
    }
}
box_rollWeapon()
{
    level endon("game_ended");
    self endon("death");

    while (self.boxCounter < 60)
    {
        self.boxIndex = randomInt(level.weaponModels.size);
        self setModel(level.weaponModels[self.boxIndex]);
        self.boxCounter++;
        wait(0.05);
    }
}

moveWeaponBox(bear)
{
    self notSolid();
    self setContents(0);
    self playSound("mp_last_stand");
    level.usables = array_remove(level.usables, self);
    bear moveTo(bear.origin + (0, 0, 60), 3, 1);
    bear setModel(level.teddyModel);
    self.isRotating = true;

    if (isDefined(self.fx_xmas))
    {
        foreach (fx in self.fx_xmas)
            fx delete();
        self.fx_xmas = undefined;
    }

    wait(3);

    if (array_contains(level.wawMaps, level._mapname))
    {
        bear moveTo(bear.origin + (0, 0, 500), 3, 1);

        wait(3);

        bear delete();
        self.boxBase hide();
        self.boxLid hide();
        self.boxLid rotateRoll(90, 0.75);
        playFX(level.fx_disappear, self.origin);
        objID = self.objID;
        //_objective_delete(objID);
        newLoc = randomInt(level.boxLocations.size);
        if (newLoc == self.lastLocation)//Reroll
            newLoc = randomInt(level.boxLocations.size);
        
        self removeUsable();

        level.boxMaxUses = 15;//Reset uses
        wait(1.5);
        randomWeaponCrate(level.boxLocations[newLoc][0], level.boxLocations[newLoc][1], objID, newLoc);
        return;
    }

    playFX(level.fx_disappear, bear.origin);
    bear delete();
    self moveTo(self.origin + (0, 0, 80), 5, 3);

    self rotatePitch(-25, .35, .15, .15);

    wait(.4);

    self thread rotateBoxLoop();//800

    wait(4.6);

    self.isRotating = undefined;
    PlayFX(level.fx_disappear, self.origin);
    objID = self.objID;
    _objective_delete(objID);
    //_objIDs.Remove(box);//Removing from internal list only to avoid overwrite
    newLoc = randomInt(level.boxLocations.size);
    if (newLoc == self.lastLocation)//Reroll
        newLoc = randomInt(level.boxLocations.size);
        
    self delete();

    level.boxMaxUses = 15;//Reset uses
    wait(1.5);
    randomWeaponCrate(level.boxLocations[newLoc][0], level.boxLocations[newLoc][1], objID, newLoc);
}
rotateBoxLoop()
{
    level endon("game_ended");
    self endon("death");

    while (isDefined(self.isRotating))
    {
        self rotatePitch(50, 0.35, 0.15, 0.15);
        wait(0.4);
        self rotatePitch(-50, 0.35, 0.15, 0.15);
        wait(0.4);
    }
}

usePapBox(box, currentGun)
{
    if (self.sessionTeam != "allies") return;

    if (box.state == "waiting" && isDefined(box.player) && box.player == self)
    {
        gun = box.weaponName;

        if (!isSubStr(gun, "iw5_") && weaponIsAkimbo(gun))
            self giveWeapon(gun, 0, true);
        else
            self giveWeapon(gun);
        self giveMaxAmmo(gun);
        self switchToWeapon(gun);
        //self.newGunReady = false;

        self updatePlayerWeaponsList(gun);

        if (self.perk4weapon == box.oldWeapon) self.perk4weapon = gun;

        self playLocalSound("oldschool_pickup");
        weaponEnt = box.weaponEnt;
        attachments = box.attachments;
        foreach (a in attachments) 
        {
            a setModel("tag_origin");
            a hide(); 
        }
        weaponEnt setModel("tag_origin");
        weaponEnt hide();
        box notify("weapon_taken");

        wait(1);//Wait a second until being ready again to fix the rapid upgrade bug

        box.state = "idle";
        box.player = undefined;
        return;
    }

    currentWeapon = self getCurrentWeapon();
    if (!level.powerActivated || self.isDown) return;
    if (self isSwitchingWeapon()) return;
    if (currentWeapon == "" || currentWeapon == "none") return;//If we have no gun, no PAP
    if (isSubStr(currentWeapon, "killstreak")) return;

    if (box.state != "idle") return;
    if (self.cash < 5000) return;
    if (getWeaponUpgrade(currentGun) == "") return;//Don't PAP already PAPed guns
    if (self hasWeapon(getWeaponUpgrade(currentGun))) return;//Don't allow PAP if the player already has this PAP. Fixes double PAPs taking away a weapon slot
    if (box.state == "idle")
    {
        self.cash -= 5000;
        self maps\mp\gametypes\_aiz_hud::scorePopup(-5000);
        self maps\mp\gametypes\_aiz_hud::scoreMessage(level.gameStrings[243]);
    }
    box.state = "inuse";
    box.player = self;
    weapon = box.weaponEnt;
    weapon.angles = box.angles;
    weaponModel = getWeaponModel(currentGun);
    weapon show();
    weapon setModel(weaponModel);
    weapon.origin = box.origin + (0, 0, 40);
    if (array_contains(level.wawMaps, level._mapname))
        weapon.origin = box.origin + (0, -20, 60);
    upgradeWeapon = getWeaponUpgrade(currentGun);
    if (weaponHasOptic(upgradeWeapon) && upgradeWeapon != "iw5_raygun_mp_eotechsmg_xmags_scope7" && upgradeWeapon != "iw5_m60jugg_mp_thermal_silencer_camo08" && upgradeWeapon != "gl_mp") upgradeWeapon += "_scope" + randomIntRange(1, 6);
    box.weaponName = upgradeWeapon;
    box.oldWeapon = currentWeapon;
    self updatePlayerWeaponsList(currentWeapon, true);
    self takeWeapon(currentWeapon);
    //self.newGunReady = true;
    if (self.weaponsList.size != 0)
        self switchToWeapon(self.weaponsList[0]);
    box playSound("aiz_upgrade_start");

    if (isSubStr(upgradeWeapon, "iw4_") && currentGun != "iw4_onemanarmy_mp")
    {
        weapon hideAllParts();
        weapon showPart("tag_weapon");
        weapon showPart("tag_clip");
        if (currentGun == "iw4_m4reflex_mp" || currentGun == "iw4_m16_mp")
            weapon showPart("tag_red_dot");
        else if (currentGun == "iw4_m4silencer_mp" || currentGun == "iw4_tmpsilencer_mp")
            weapon showPart("tag_silencer");
        else if (currentGun == "iw4_m21_mp" || currentGun == "iw4_wa2000_mp")
            weapon showPart("tag_acog_2");
        else if (currentGun == "iw4_dragunov_mp")
            weapon showPart("tag_dragunov_scope");
        else if (currentGun == "iw4_barrett_mp")
            weapon showPart("tag_m82_scope");
        else if (currentGun == "iw4_raygun_mp")
            weapon showPart("tag_eotech");
        else if (currentGun == "iw4_striker_mp")
            weapon showPart("tag_foregrip");
        else if (currentGun == "iw4_colt45_mp")
            weapon showPart("j_pistol_grip");
        else weapon showPart("tag_sight_on");
    }

    wait(1);

    box playLoopSound("aiz_upgrade_loop");
    if (array_contains(level.wawMaps, level._mapname))
        weapon moveTo(box.origin + (0, 20, 60), 2);
    else
        weapon moveTo(box.origin + (0, 0, 10), 2);

    wait(2);

    wep = box.weaponName;
    weapon setModel(getWeaponUpgradeModel(currentGun));

    if ((isSubStr(upgradeWeapon, "iw4_") && upgradeWeapon != "iw4_onemanarmy_mp") || upgradeWeapon == "rsass_hybrid_mp")
    {
        weapon hideAllParts();
        weapon showPart("tag_weapon");
        weapon showPart("tag_clip");
        if (upgradeWeapon == "iw4_pp2000upgraded2_mp" || upgradeWeapon == "iw4_ak47thermalupgraded_mp") weapon showPart("tag_thermal_scope");
        if (upgradeWeapon == "iw4_pp2000upgraded_mp" || upgradeWeapon == "iw4_krissupgraded_mp" || upgradeWeapon == "iw4_masadaupgraded_mp" || upgradeWeapon == "iw4_falupgraded_mp") weapon showPart("tag_red_dot");
        if (upgradeWeapon == "iw4_augupgraded2_mp") weapon showPart("tag_steyr_scope");
        if (upgradeWeapon == "iw4_sa80upgraded2_mp") weapon showPart("tag_sa80_scope");
        if (upgradeWeapon == "iw4_fn2000upgraded_mp") weapon showPart("tag_fn2000_scope");
        if (upgradeWeapon == "iw4_tavorupgraded_mp") weapon showPart("tag_tavor_scope");
        if (upgradeWeapon == "iw4_augupgraded2_mp" || upgradeWeapon == "iw4_pp2000upgraded2_mp" || upgradeWeapon == "iw4_uziupgraded_mp" || upgradeWeapon == "iw4_tmpsilencerupgraded_mp" || upgradeWeapon == "iw4_m4silencerupgraded_mp" || upgradeWeapon == "iw4_tmpsilencerupgraded_mp" || upgradeWeapon == "iw4_krissupgraded2_mp") weapon showPart("tag_silencer");
        if (upgradeWeapon == "iw4_uziupgraded_mp" || upgradeWeapon == "iw4_dragunovupgraded_mp" || upgradeWeapon == "iw4_wa2000upgraded_mp" || upgradeWeapon == "iw4_famasupgraded_mp" || upgradeWeapon == "iw4_barrettupgraded_mp" || upgradeWeapon == "iw4_m21upgraded_mp" || upgradeWeapon == "iw4_m4silencerupgraded_mp") weapon showPart("tag_acog_2");
        if (upgradeWeapon == "iw4_mg4upgraded_mp" || upgradeWeapon == "iw4_m240upgraded_mp" || upgradeWeapon == "iw4_rpdupgraded_mp" || upgradeWeapon == "iw4_ump45upgraded_mp" || upgradeWeapon == "iw4_m16upgraded_mp" || upgradeWeapon == "iw4_m4reflexupgraded_mp" || upgradeWeapon == "iw4_augupgraded_mp" || upgradeWeapon == "iw4_scarupgraded_mp" || upgradeWeapon == "iw4_raygunupgraded_mp") weapon showPart("tag_eotech");
        if (upgradeWeapon == "iw4_rpdupgraded_mp" || upgradeWeapon == "iw4_sa80upgraded_mp" || upgradeWeapon == "iw4_aa12upgraded_mp" || upgradeWeapon == "iw4_spas12upgraded_mp" || upgradeWeapon == "iw4_striker_mp") weapon showPart("tag_foregrip");
        if (upgradeWeapon == "iw4_m4reflexupgraded_mp") weapon showPart("tag_shotgun");
        if (upgradeWeapon == "iw4_ak47thermalupgraded_mp") weapon showPart("tag_gp25");
        if (upgradeWeapon == "iw4_colt45upgraded_mp") weapon showPart("j_pistol_grip");
        if (upgradeWeapon == "rsass_hybrid_mp")
        {
            weapon showPart("tag_thermal_scope");
            weapon showPart("tag_red_dot");
        }
    }

    tag = "tag_origin";
    tagOffset = (0, 0, 0);
    model = "tag_origin";
    tokenizedWeapon = strTok(wep, "_");

    foreach (a in maps\mp\gametypes\_aiz::getWeaponAttachments(wep))
    {
        switch (a)
        {
            case "reflex":
            case "reflexsmg":
            case "reflexlmg":
                tag = "tag_red_dot";
                model = "weapon_reflex_iw5";
                break;
            case "acog":
            case "acogsmg":
            case "acoglmg":
                tag = "tag_acog_2";
                model = "weapon_acog";
                break;
            case "grip":
                tag = "tag_foregrip";
                model = "weapon_remington_foregrip";
                break;
            case "akimbo":
                tag = "tag_weapon";
                tagOffset = (6, 5, 2);
                model = weapon.model;
                break;
            case "thermal":
            case "thermalsmg":
            case "thermallmg":
                tag = "tag_thermal_scope";
                model = "weapon_thermal_scope";
                break;
            case "shotgun":
                tag = "tag_shotgun";
                model = "weapon_shotgun";
                break;
            case "heartbeat":
                tag = "tag_heartbeat";
                model = "weapon_heartbeat_iw5";
                break;
            case "eotech":
            case "eotechsmg":
            case "eotechlmg":
                tag = "tag_eotech";
                model = "weapon_eotech";
                break;
            case "gl":
                tag = "tag_m203";
                model = "weapon_m203";
                break;
            case "gp25":
                tag = "tag_gp25";
                model = "weapon_gp25";
                break;
            case "m320":
                tag = "tag_m320";
                model = "weapon_m320";
                break;
            case "silencer":
                tag = "tag_flash";
                model = "weapon_silencer_01";
                break;
            case "silencer02":
                tag = "tag_flash";
                model = "weapon_silencer_02";
                break;
            case "silencer03":
                tag = "tag_flash";
                model = "weapon_silencer_03";
                break;
            case "hamrhybrid":
                tag = "tag_hamr_hybrid";
                model = "weapon_hamr_hybrid";
                break;
            case "hybrid":
                tag = "tag_magnifier";
                model = "weapon_magnifier";
                break;
            case "tactical":
                tag = "tag_weapon";
                model = "weapon_parabolic_knife";
                tagOffset = (2, 0, -3);
                break;
            case "dragunovscopevz":
            case "rsassscopevz":
            case "as50scopevz":
            case "dragunovscope":
            case "rsassscope":
            case "as50scope":
                tag = "tag_" + tokenizedWeapon[1] + "_scope";
                model = "weapon_" + tokenizedWeapon[1] + "_scope_iw5";
                break;
            case "l96a1scope":
            case "l96a1scopevz":
                tag = "tag_scope";
                model = "weapon_" + tokenizedWeapon[1] + "_scope_iw5";
                break;
            case "barrettscope":
            case "barrettscopevz":
                tag = "tag_m82_scope";
                model = "weapon_m82_scope_iw5";
                break;
            case "msrscope":
            case "msrscopevz":
                tag = "tag_scope";
                model = "weapon_remington_" + tokenizedWeapon[1] + "_scope_iw5";
                break;
            case "cheytacscope":
            case "cheytacscope2":
                tag = "tag_cheytac_scope";
                model = "weapon_cheytac_scope";
                break;
        }

        tagOrigin = weapon getTagOrigin(tag);
        tagAngles = weapon getTagAngles(tag);
        attachEnts = box.attachments;

        if (attachEnts[0].model == "tag_origin")
        {
            attachEnts[0] show();
            attachEnts[0] unlink();
            attachEnts[0].angles = tagAngles;
            attachEnts[0] setModel(model);
            attachEnts[0].origin = tagOrigin + tagOffset;
            attachEnts[0] linkTo(weapon, tag, tagOffset, (0, 0, 0));
        }
        else
        {
            attachEnts[1] show();
            attachEnts[1] unlink();
            attachEnts[1].angles = tagAngles;
            attachEnts[1] setModel(model);
            attachEnts[1].origin = tagOrigin + tagOffset;
            attachEnts[1] linkTo(weapon, tag, tagOffset, (0, 0, 0));
        }
    }

    if (!isSubStr(upgradeWeapon, "iw5_") && weaponIsAkimbo(upgradeWeapon))//Legacy akimbo weapons
    {
        tag = "tag_weapon";
        tagOffset = (6, 5, 2);
        model = weapon.model;

        tagOrigin = weapon getTagOrigin(tag);
        tagAngles = weapon getTagAngles(tag);
        attachEnts = box.attachments;

        if (attachEnts[0].model == "tag_origin")
        {
            attachEnts[0] show();
            attachEnts[0] unlink();
            attachEnts[0].angles = tagAngles;
            attachEnts[0] setModel(model);
            attachEnts[0] hideAllParts();
            attachEnts[0] showPart("tag_weapon");
            attachEnts[0] showPart("tag_clip");
            if (upgradeWeapon == "iw4_colt45upgraded_mp") attachEnts[0] showPart("j_pistol_grip");
            attachEnts[0].origin = tagOrigin + tagOffset;
            attachEnts[0] linkTo(weapon, tag, tagOffset, (0, 0, 0));
        }
    }

    if (array_contains(level.wawMaps, level._mapname))
        weapon moveTo(box.origin + (0, -20, 60), 2);
    else
        weapon moveTo(box.origin + (0, 0, 60), 2);
        
    wait(1);

    box stopLoopSound();
    box playSound("aiz_upgrade_end");
    wait(1);

    box playSound("aiz_upgrade_ding");
    box.state = "waiting";
    if (array_contains(level.wawMaps, level._mapname))
        weapon moveTo(box.origin + (0, 15, 60), 10);
    else
        weapon moveTo(box.origin + (0, 0, 25), 10);

    box thread pap_waitForWeapon(self);
}
pap_waitForWeapon(player)
{
    self endon("weapon_taken");

    wait(10.5);

    foreach (a in self.attachments)
    {
        a setModel("tag_origin");
        a hide();
    }
    self.weaponEnt setModel("tag_origin");
    self.weaponEnt hide();
    self.state = "idle";
    self.player = undefined;
    player.newGunReady = true;
}

useGambler(box)
{
    if (self.sessionTeam != "allies") return;
    if (box.gamblerInUse)
    {
        self iPrintLn(level.gameStrings[244]);
        return;
    }
    if (!self.gamblerReady && !box.gamblerInUse)
    {
        self iPrintLnBold(level.gameStrings[245]);
        return;
    }
    if (self.cash >= 1000)
    {
        self.cash -= 1000;
        self maps\mp\gametypes\_aiz_hud::scorePopup(-1000);
        self maps\mp\gametypes\_aiz_hud::scoreMessage(level.gameStrings[246]);
        box.gamblerInUse = true;
        self.gamblerReady = false;
        //level notify("use_gambler");
        self iPrintLnBold(level.gameStrings[248]);
        self thread gamblerCountdown();
        box.laptop thread moveGamblerLaptop(box);
        self thread gamblerRoll(box);
    }
}

moveGamblerLaptop(box)
{
    self moveTo(box.origin + (0, 0, 38), 4);

    wait(8.5);

    self moveTo(box.origin + (0, 0, 22), 4);
}

gamblerRoll(box)
{
    wait(12.5);

    box.gamblerInUse = false;
    if (!self.isAlive) return;
    switch (randomInt(24))
    {
        case 0:
            //Extra weapon
            self giveWeapon("defaultweapon_mp");
            self updatePlayerWeaponsList("defaultweapon_mp");
            self thread switchToWeapon_delay("defaultweapon_mp", 0.1);
            self iPrintLnBold(level.gameStrings[249], "an extra weapon slot");
            
            break;
        case 1:
            //500 points
            self.cash += 500;
            self maps\mp\gametypes\_aiz_hud::scorePopup(500);
            self iPrintLnBold(level.gameStrings[249], "500 points");
            
            self playFX(level.fx_money, self.origin);
            break;
        case 2:
            //1000 points
            self.cash += 1000;
            self maps\mp\gametypes\_aiz_hud::scorePopup(1000);
            self iPrintLnBold(level.gameStrings[249], "1000 points");
            
            self playFX(level.fx_money, self.origin);
            break;
        case 3:
            //1500 points
            self.cash += 1500;
            self maps\mp\gametypes\_aiz_hud::scorePopup(1500);
            self iPrintLnBold(level.gameStrings[249], "1500 points");
            
            self playFX(level.fx_money, self.origin);
            break;
        case 4:
            //2000 points
            self.cash += 2000;
            self maps\mp\gametypes\_aiz_hud::scorePopup(2000);
            self iPrintLnBold(level.gameStrings[249], "2000 points");
            
            self playFX(level.fx_money, self.origin);
            break;
        case 5:
            //5000 points
            self.cash += 5000;
            self maps\mp\gametypes\_aiz_hud::scorePopup(5000);
            self iPrintLnBold(level.gameStrings[249], "5000 points");
            
            self playFX(level.fx_money, self.origin);
            break;
        case 6:
            //7500 points
            self.cash += 7500;
            self maps\mp\gametypes\_aiz_hud::scorePopup(7500);
            self iPrintLnBold(level.gameStrings[249], "7500 points");
            
            self playFX(level.fx_money, self.origin);
            break;
        case 7:
            //10000 points
            self.cash += 10000;
            self maps\mp\gametypes\_aiz_hud::scorePopup(10000);
            self iPrintLnBold(level.gameStrings[249], "10000 points");
            
            self playFX(level.fx_money, self.origin);
            break;
        case 8:
            //lose 500
            self.cash -= 500;
            if (self.cash < 0)
                self.cash = 0;
            self maps\mp\gametypes\_aiz_hud::scorePopup(-500);
            self iPrintLnBold(level.gameStrings[250], "500 points");
            
            break;
        case 9:
            //lose all perks
            if (!isDefined(self.allPerks))
            {
                if (self.perksBought[0])
                {
                    self.maxHealth = level.maxPlayerHealth;
                    self.health = level.maxPlayerHealth;
                    self.perksBought[0] = false;
                }
                if (self.perksBought[1])
                {
                    self _unSetPerk("specialty_lightweight");
                    //self _unSetPerk("specialty_marathon");
                    self _unSetPerk("specialty_longersprint");
                    self.perksBought[1] = false;
                }
                if (self.perksBought[2])
                {
                    self _unSetPerk("specialty_fastreload");
                    //self _unSetPerk("specialty_quickswap");
                    self _unSetPerk("specialty_quickdraw");
                    self.perksBought[2] = false;
                }
                if (self.perksBought[3])
                {
                    if (isDefined(self.perk4weapon) && self hasWeapon(self.perk4weapon))
                    {
                        perk4weapon = self.perk4weapon;
                        if (isThunderGun(perk4weapon))
                            level.currentThunderguns--;
                        else if (isRayGun(perk4weapon))
                            level.currentRayguns--;
                        self takeWeapon(perk4weapon);
                        self updatePlayerWeaponsList(perk4weapon, true);
                    }
                    else
                    {
                        currentWeapon = self getCurrentWeapon();
                        if (isThunderGun(currentWeapon))
                            level.currentThunderguns--;
                        else if (isRayGun(currentWeapon))
                            level.currentRayguns--;
                        self takeWeapon(currentWeapon);
                        self updatePlayerWeaponsList(currentWeapon, true);
                    }
                    self.perksBought[3] = false;
                    self.perk4weapon = undefined;
                }
                if (self.perksBought[4])
                {
                    self _unSetPerk("specialty_rof");
                    self.perksBought[4] = false;
                }
                if (self.perksBought[5])
                {
                    self _unSetPerk("specialty_stalker");
                    self.perksBought[5] = false;
                }
                if (self.perksBought[6] > 0)
                    self.autoRevive = false;

                self maps\mp\gametypes\_aiz_hud::updatePerksHud(true, true);
                self.totalPerkCount = 0;
            }
            self iPrintLnBold(level.gameStrings[250], "all of your perks");
            break;
        case 10:
            //lose all perks and 200 points
            self.cash -= 200;
            if (self.cash < 0)
                self.cash = 0;
            self maps\mp\gametypes\_aiz_hud::scorePopup(-200);

            if (!isDefined(self.allPerks))
            {
                if (self.perksBought[0])
                {
                    self.maxHealth = level.maxPlayerHealth;
                    self.health = level.maxPlayerHealth;
                    self.perksBought[0] = false;
                }
                if (self.perksBought[1])
                {
                    self _unSetPerk("specialty_lightweight");
                    //self _unSetPerk("specialty_marathon");
                    self _unSetPerk("specialty_longersprint");
                    self.perksBought[1] = false;
                }
                if (self.perksBought[2])
                {
                    self _unSetPerk("specialty_fastreload");
                    //self _unSetPerk("specialty_quickswap");
                    self _unSetPerk("specialty_quickdraw");
                    self.perksBought[2] = false;
                }
                if (self.perksBought[3])
                {
                    if (isDefined(self.perk4weapon) && self hasWeapon(self.perk4weapon))
                    {
                        perk4weapon = self.perk4weapon;
                        if (isThunderGun(perk4weapon))
                            level.currentThunderguns--;
                        else if (isRayGun(perk4weapon))
                            level.currentRayguns--;
                        self takeWeapon(perk4weapon);
                        self updatePlayerWeaponsList(perk4weapon, true);
                    }
                    else
                    {
                        currentWeapon = self getCurrentWeapon();
                        if (isThunderGun(currentWeapon))
                            level.currentThunderguns--;
                        else if (isRayGun(currentWeapon))
                            level.currentRayguns--;
                        self takeWeapon(currentWeapon);
                        self updatePlayerWeaponsList(currentWeapon, true);
                    }
                    self.perksBought[3] = false;
                    self.perk4weapon = undefined;
                }
                if (self.perksBought[4])
                {
                    self _unSetPerk("specialty_rof");
                    self.perksBought[4] = false;
                }
                if (self.perksBought[5])
                {
                    self _unSetPerk("specialty_stalker");
                    self.perksBought[5] = false;
                }
                if (self.perksBought[6] > 0)
                    self.autoRevive = false;

                self maps\mp\gametypes\_aiz_hud::updatePerksHud(true, true);
                self.totalPerkCount = 0;
            }
            self iPrintLnBold(level.gameStrings[250], "all of your perks and 200 points");
            break;
        case 11:
            //double health
            self iPrintLnBold(level.gameStrings[251]);
            self thread setTempHealth(self.health * 2, 30, level.gameStrings[252]);
            
            break;
        case 12:
            //inf health
            self iPrintLnBold(level.gameStrings[253]);
            self thread setTempHealth(999999999, 30, level.gameStrings[254]);
            
            break;
        case 13:
            //model1887
            self iPrintLnBold(level.gameStrings[249], "a Model 1887");

            if (self hasWeapon("iw5_1887_mp"))
            {
                self giveMaxAmmo("iw5_1887_mp");
                self thread switchToWeapon_delay("iw5_1887_mp", 0.1);
                return;
            }

            currentWeapon = self getCurrentWeapon();
            if (isThunderGun(currentWeapon))
                level.currentThunderguns--;
            else if (isRayGun(currentWeapon))
                level.currentRayguns--;

            self takeWeapon(currentWeapon);
            self updatePlayerWeaponsList(currentWeapon, true);
            self giveWeapon("iw5_1887_mp");
            self updatePlayerWeaponsList("iw5_1887_mp");
            self thread switchToWeapon_delay("iw5_1887_mp", 0.1);
            
            break;
        case 14:
            //max ammo
            self iPrintLnBold(level.gameStrings[255]);

            if (cointoss())
            {
                self thread gambler_maxAmmo(true);
            }
            else
                self thread gambler_maxAmmo(false);
            
            break;
        case 15:
            //lose 1000
            self.cash -= 1000;
            if (self.cash < 0)
                self.cash = 0;
            self maps\mp\gametypes\_aiz_hud::scorePopup(-1000);
            self iPrintLnBold(level.gameStrings[250], "1000 points");
            
            break;
        case 16:
            //lose all $
            cash = -self.cash;
            self.cash = 0;
            self maps\mp\gametypes\_aiz_hud::scorePopup(cash);
            self iPrintLnBold(level.gameStrings[250], "all of your points");
            
            break;
        case 17:
            //live or die
            self iPrintLnBold(level.gameStrings[258]);
            self thread gambler_determineDeath();
            
            break;
        case 18:
            self iPrintLnBold(level.gameStrings[247], "nothing");
            
            break;
        case 19:
            self iPrintLnBold(level.gameStrings[249], "an extra free perk");
            self thread maps\mp\gametypes\_aiz_bonus_drops::giveRandomPerk();
            
            break;
        case 20:
            self iPrintLnBold(level.gameStrings[250], "your current weapon");
            if (aiz_mayDropWeapon(self getCurrentWeapon()) && self.weaponsList.size > 1)
            {
                self updatePlayerWeaponsList(self getCurrentWeapon(), true);
                if (isRayGun(self getCurrentWeapon())) level.currentRayguns--;
                else if (isThunderGun(self getCurrentWeapon())) level.currentThunderguns--;
                self takeWeapon(self getCurrentWeapon());
                self thread switchToWeapon_delay(self.weaponsList[0], 0.4);
                self.newGunReady = true;
            }
            
            break;
        case 21:
            self iPrintLnBold(level.gameStrings[249], "a random killstreak");
            maxStreaks = 12;
            if (level.classicKillstreaks == 1 || (level.classicKillstreaks == 2 && array_contains(level.classicMaps, level._mapname)))
                maxStreaks = 15;
            randomStreak = randomInt(maxStreaks);
            if (randomStreak == 0)
                randomStreak = 1;
            self maps\mp\gametypes\_aiz_killstreaks::giveKillstreak(randomStreak);
            
            break;
        case 22:
            self iPrintLnBold(level.gameStrings[249], "a free pack-a-punch");

            currentGun = self getCurrentWeapon();
            if (getWeaponUpgrade(currentGun) == "")
            {
                self.cash += 5000;
                self maps\mp\gametypes\_aiz_hud::scorePopup(5000);
                return;
            }

            newWeapon = getWeaponUpgrade(currentGun);
            ammoClip = self getWeaponAmmoClip(currentGun);
            ammoStock = self getWeaponAmmoStock(currentGun);
            self takeWeapon(currentGun);
            self updatePlayerWeaponsList(currentGun, true);
            if (isSubStr(newWeapon, "iw4_"))
                self giveWeapon(newWeapon, 0, weaponIsAkimbo(newWeapon));
            else
                self giveWeapon(newWeapon);
            self setWeaponAmmoClip(newWeapon, ammoClip);
            self setWeaponAmmoStock(newWeapon, ammoStock);
            self updatePlayerWeaponsList(newWeapon);
            self playLocalSound("aiz_upgrade_ding");

            self thread switchToWeapon_delay(newWeapon, 0.1);
            break;
        case 23:
            self iPrintLnBold(level.gameStrings[249], "a random weapon");

            currentGun = self getCurrentWeapon();

            newWeaponIndex = randomInt(level.weaponNames.size);
            newWeapon = level.weaponNames[newWeaponIndex];
            if (randomInt(100) > 75 && getWeaponUpgrade(newWeapon) != "")
                newWeapon = getWeaponUpgrade(newWeapon);
            self takeWeapon(currentGun);
            self updatePlayerWeaponsList(currentGun, true);
            if (isSubStr(newWeapon, "iw4_"))
                self giveWeapon(newWeapon, 0, weaponIsAkimbo(newWeapon));
            else
                self giveWeapon(newWeapon);
            self giveMaxAmmo(newWeapon);
            self updatePlayerWeaponsList(newWeapon);

            self thread switchToWeapon_delay(newWeapon, 0.1);
            break;
        default:
            self iPrintLnBold(level.gameStrings[247], "nothing");
            
            break;
    }
}

gambler_maxAmmo(success)
{
    self endon("death");
    level endon("game_ended");

    wait(2);

    if (success)
    {
        self z_giveMaxAmmo();
        self iPrintLnBold(level.gameStrings[256]);
    }
    else
        self iPrintLnBold(level.gameStrings[257]);
}

gambler_determineDeath()
{
    level endon("game_ended");
    self endon("death");

    wait(1.5);
    self iPrintLnBold("^24");
    wait(1);
    self iPrintLnBold("^23");
    wait(1);
    self iPrintLnBold("^22");
    wait(1);
    self iPrintLnBold("^21");
    wait(1);
    roll = randomInt(4);
    switch (roll)
    {
        case 2:
            self suicide();
            break;
        default:
            self iPrintLnBold(level.gameStrings[259]);
            break;
    }
}

gamblerCountdown()
{
    level endon("game_ended");
    self endon("death");

    wait(1.5);
    self iPrintLnBold("^210");
    wait(1);
    self iPrintLnBold("^29");
    wait(1);
    self iPrintLnBold("^28");
    wait(1);
    self iPrintLnBold("^27");
    wait(1);
    self iPrintLnBold("^26");
    wait(1);
    self iPrintLnBold("^25");
    wait(1);
    self iPrintLnBold("^24");
    wait(1);
    self iPrintLnBold("^23");
    wait(1);
    self iPrintLnBold("^22");
    wait(1);
    self iPrintLnBold("^21");
}

useAmmo(box)
{
    if (self.sessionTeam != "allies") return;
    cost = 4500 + self.ammoCostAddition;
    if (self.cash < cost)
    {
        self iPrintLn(level.gameStrings[260], cost);
        return;
    }
    else
    {
        self.cash -= cost;
        self maps\mp\gametypes\_aiz_hud::scorePopup(-cost);
        self maps\mp\gametypes\_aiz_hud::scoreMessage(level.gameStrings[261]);
        if (self.ammoCostAddition == 0) self.ammoCostAddition = 500;
        else self.ammoCostAddition *= 2;
        self z_giveMaxAmmo();
        self playLocalSound("ammo_crate_use");
    }

    wait(1);//Wait a second to allow using after a delay
}

useKillstreak(box)
{
    if (!level.powerActivated) return;
    if (self.SessionTeam != "allies") return;
    if (!isDefined(self.aizHud_created)) return;
    if (self.points < 200) return;
    else
    {
        self.points -= 200;
        self maps\mp\gametypes\_aiz_hud::scorePopup(-200);
        self maps\mp\gametypes\_aiz_hud::scoreMessage(level.gameStrings[262]);
        pointNumber = self.hud_point;
        points = self.points;
        pointNumber setValue(points);
        maxStreaks = 12;
        if (level.classicKillstreaks == 1 || (level.classicKillstreaks == 2 && array_contains(level.classicMaps, level._mapname)))
            maxStreaks = 15;
        randomKS = randomIntRange(1, maxStreaks);
        while (randomKS == 3)//EMPs are useless from this since power needs to be on to use it
            randomKS = randomIntRange(1, maxStreaks);
        self maps\mp\gametypes\_aiz_killstreaks::giveKillstreak(randomKS);
    }
}

useBank(isWithdraw)
{
    if (!level.powerBox && !level.isHellMap) return;//BS 12/1/21 - Changing this to require the power box instead of power in favor of keeping EMPs from enabling this
    if (self.SessionTeam != "allies" || !self.isAlive) return;
    if (!isWithdraw)
    {
        if (self.cash < 1000) return;
        totalBalance = self getPlayerData("money");

        if (totalBalance >= level.maxBankBalance)
        {
            if (totalBalance > level.maxBankBalance)//Reset bank to max if players are above max
            {
                totalBalance = level.maxBankBalance;
                self setPlayerData("money", totalBalance);
            }
            self iPrintLnBold(level.gameStrings[328]);
            return;
        }

        totalBalance += 1000;
        self.cash -= 1000;
        self maps\mp\gametypes\_aiz_hud::scorePopup(-1000);
        self maps\mp\gametypes\_aiz_hud::scoreMessage(level.gameStrings[273]);
        self setPlayerData("money", totalBalance);
        self iPrintLnBold(level.gameStrings[263], totalBalance);
    }
    else
    {
        if (self getPlayerData("money") < 1000)
        {
            self iPrintLnBold(level.gameStrings[263], 0);
            return;
        }
        totalBalance = self getPlayerData("money");
        totalBalance -= 1000;
        if (totalBalance > level.maxBankBalance)//Reset bank to max if players are above max
        {
            totalBalance = level.maxBankBalance;
        }
        self.cash += 900;
        self maps\mp\gametypes\_aiz_hud::scorePopup(900);
        self maps\mp\gametypes\_aiz_hud::scoreMessage(level.gameStrings[264]);
        self setPlayerData("money", totalBalance);
        self iPrintLnBold(level.gameStrings[263], totalBalance);
    }
}

linkTeleporter(linker)
{
    if (self.SessionTeam != "allies") return;
    if (!level.powerActivated) return;
    if (linker.teleporter.isLinked) return;

    self playSound("item_nightvision_on");
    linker.teleporter.isLinked = true;
    playFX(level.fx_sparks, linker.origin, (0, linker.origin[1], 90));

    wait(1);

    linker.teleporter playSound("item_nightvision_on");
    foreach (floor in linker.teleporter.floorsActive)
        floor show();
}

playTeleporterSounds()
{
    wait(1);

    playSoundAtPos(self.endPos, "emp_grenade_detonate");
    wait(self.teleTime);

    self playSound("ims_trigger");

    wait(1);

    self playSound("emp_grenade_detonate");
}
useTeleporter(teleporter)
{
    if (level._mapname == "mp_factory_sh") return;

    if (self.sessionTeam != "allies") return;
    if (!teleporter.isLinked || teleporter.state != 0) return;
    teleporter playSound("mine_betty_spin");
    playFX(level.fx_teleportSpark, teleporter.origin);
    teleporter.state = 1;//Cooldown
    teleporter thread playTeleporterSounds();

    foreach (player in level.players)
    {
        if (!player.isAlive) continue;
        if (player.sessionTeam != "allies") continue;
        if (distanceSquared(player.origin, teleporter.origin) < 6400 && self.isAlive) player thread teleportPlayer(teleporter);
    }

    wait(1);

    //teleporter.isLinked = false;
    foreach (floor in teleporter.floorsActive)
        floor hide();

    wait(teleporter.teleTime);

    teleporter.isLinked = false;
    teleporter.state = 0;
}
teleportPlayer(teleporter)
{
    level endon("game_ended");
    //self endon("death");

    self playLocalSound("counter_uav_activate");
    self disableWeapons();
    self visionSetNakedForPlayer("cheat_chaplinnight", 1);
    self setWaterSheeting(1, 2);
    self freezeControls(true);
    self.isCurrentlyTeleported = true;

    wait(1);

    self playSound("emp_grenade_detonate");
    if ((level.isHellMap && !level.visionRestored)) self visionSetNakedForPlayer("cobra_sunset3", 1);
    else if (level.isBossWave) self visionSetNakedForPlayer(level.bossVision, 1);
    else self visionSetNakedForPlayer(level.vision, 1);
    self setOrigin(teleporter.endPos);
    self setPlayerAngles(teleporter.endAngles);
    self freezeControls(false);
    self enableWeapons();
    timer = newClientHudElem(self);
    timer.parent = level.uiParent;
    timer.children = [];
    timer.elemType = "font";
    timer.font = "hudsmall";
    timer.fontScale = 1.5;
    timer.hideWhenInMenu = true;
    timer.alpha = 1;
    timer setPoint("TOPCENTER", "TOPCENTER", 0, 80, 2);
    time = teleporter.teleTime;
    timer setTimer(time);

    wait(time);

    if (!self.isAlive)
    {
        timer destroy(); 
        return;
    }

    self visionSetNakedForPlayer("cheat_chaplinnight", 1);
    timer destroy();
    playFX(level.fx_teleportSpark, self.origin);
    self playLocalSound("counter_uav_deactivate");
    wait(1);

    if (!self.isDown && !level.isBossWave) self visionSetNakedForPlayer(level.vision, 1);
    else if (!self.isDown && level.isBossWave) self visionSetNakedForPlayer(level.bossVision, 1);
    else self visionSetNakedForPlayer("cheat_bw", 1);

    playFX(level.fx_teleportSpark, teleporter.origin);
    self setOrigin(teleporter.origin);
    self setPlayerAngles(teleporter.angles);
    self.isCurrentlyTeleported = undefined;
}

useElevator(elevator)
{
    if (self.isDown || (!level.powerActivated && level._mapname != "mp_highrise" && (level._mapname != "mp_terminal_cls" || (level._mapname == "mp_terminal_cls" && level.mapVariation != 0))) || !self.isAlive || self.cash < 500 || elevator.isMoving) return;
    self.cash -= 500;
    self maps\mp\gametypes\_aiz_hud::scorePopup(-500);
    self maps\mp\gametypes\_aiz_hud::scoreMessage(level.gameStrings[265]);
    elevator.isMoving = true;
    /*
    if (isDefined(elevator.fx_xmas))
    {
        fx = elevator.fx_xmas;

        stopFXOnTag(level.fx_rayGunUpgrade, fx[0], "tag_origin");
        stopFXOnTag(level.fx_rayGun, fx[1], "tag_origin");
        stopFXOnTag(level.fx_rayGun, fx[2], "tag_origin");
        stopFXOnTag(level.fx_rayGunUpgrade, fx[3], "tag_origin");

        wait(0.5);

        playFXOnTag(level.fx_rayGunUpgrade, fx[0], "tag_origin");
        playFXOnTag(level.fx_rayGun, fx[1], "tag_origin");
        playFXOnTag(level.fx_rayGun, fx[2], "tag_origin");
        playFXOnTag(level.fx_rayGunUpgrade, fx[3], "tag_origin");
    }
    */
    start = elevator.startPos;
    end = elevator.endPos;
    drop = elevator.dropPos;
    self playerLinkTo(elevator, "tag_origin", 0, 180, 180, 180, 180, true);
    elevator moveTo(end, 5, 1, 1);

    wait(5);

    elevator thread elevator_dropOffPlayer(self, start, drop);
}
elevator_dropOffPlayer(player, start, drop)
{
    self moveTo(start, 5, 1, 1);

    if (player.isAlive)
    {
        player unlink();
        player setOrigin(drop);
    }

    wait(5);

    self.isMoving = false;
}
useZipline(zipline)
{
    if (self.isDown || !level.powerActivated || !self.isAlive/* || self.cash < 5000*/ || zipline.isMoving) return;
    //self.cash -= 5000;
    self maps\mp\gametypes\_aiz_hud::scorePopup(-5000);
    self maps\mp\gametypes\_aiz_hud::scoreMessage(&"Zipline!");
    self.notTargetable = true;//Setting this flag to make the user not targeted by bots
    zipline.isMoving = true;
    /*
    if (isDefined(zipline.fx_xmas))
    {
        fx = zipline.fx_xmas;

        stopFXOnTag(level.fx_rayGunUpgrade, fx[0], "tag_origin");
        stopFXOnTag(level.fx_rayGun, fx[1], "tag_origin");
        stopFXOnTag(level.fx_rayGun, fx[2], "tag_origin");
        stopFXOnTag(level.fx_rayGunUpgrade, fx[3], "tag_origin");

        wait(0.5);

        playFXOnTag(level.fx_rayGunUpgrade, fx[0], "tag_origin");
        playFXOnTag(level.fx_rayGun, fx[1], "tag_origin");
        playFXOnTag(level.fx_rayGun, fx[2], "tag_origin");
        playFXOnTag(level.fx_rayGunUpgrade, fx[3], "tag_origin");
    }
    */
    start = zipline.startPos;
    path = zipline.path;
    self playerLinkTo(zipline, "tag_origin", 0, 180, 180, 180, 180, true);
    zipline thread zipline_ridePath(self, start, path);
}
zipline_ridePath(player, start, path)
{
    travelTime = 5;
    for (i = 0; i < path.size; i++)
    {
        self moveTo(path[i], travelTime);
        wait(travelTime);
        travelTime = 10;
    }

    self moveTo(start, 5);

    wait(5);

    if (player.isAlive)
    {
        player unlink();
        player setOrigin(start + (0, 0, 50));
        player.notTargetable = false;
    }

    self.isMoving = false;
}

usePerk(box, perk)
{
    if (!level.powerActivated || self.isDown) return;
    if (self.SessionTeam != "allies") return;
    if (self.totalPerkCount >= level.perkLimit && level.perkLimit > 0) return;
    if (perk != 7 && self.perksBought[perk-1]) return;
    else if (perk == 7 && (self.perksBought[6] > 2 || self.autoRevive)) return;
    if (self.cash < box.cost) return;

    cost = box.cost;
    name = "";
    icon = "white";
    perks = [];
    switch (perk)
    {
        case 1:
            name = level.gameStrings[266];
            //perks[perks.size] = "specialty_armorvest";
            icon = "specialty_light_armor";
            break;
        case 2:
            name = level.gameStrings[267];
            perks[perks.size] = "specialty_lightweight";
            perks[perks.size] = "specialty_longersprint";
            //perks[perks.size] = "specialty_marathon";
            icon = "specialty_longersprint_upgrade";
            break;
        case 3:
            name = level.gameStrings[268];
            perks[perks.size] = "specialty_fastreload";
            perks[perks.size] = "specialty_quickdraw";
            //perks[perks.size] = "specialty_quickswap";
            icon = "specialty_fastreload_upgrade";
            break;
        case 4:
            name = level.gameStrings[269];
            icon = "specialty_twoprimaries_upgrade";
            break;
        case 5:
            name = level.gameStrings[270];
            perks[perks.size] = "specialty_rof";
            icon = "weapon_attachment_rof";
            break;
        case 6:
            name = level.gameStrings[271];
            perks[perks.size] = "specialty_stalker";
            icon = "specialty_stalker_upgrade";
            break;
        case 7:
            name = level.gameStrings[272];
            icon = "waypoint_revive";
            break;
        case 8:
            name = level.gameStrings[273];
            perks[perks.size] = "specialty_scavenger";
            icon = "specialty_scavenger_upgrade";
            break;
    }
    self.cash -= cost;
    self maps\mp\gametypes\_aiz_hud::scorePopup(-cost);
    self maps\mp\gametypes\_aiz_hud::scoreMessage(name);

    foreach (perkName in perks) self givePerk(perkName, false);
    self thread setPerkBlur();

    if (perk == 1)
    {
        self.maxHealth = level.maxPlayerHealth_Jugg;
        self.health = level.maxPlayerHealth_Jugg;
    }
    else if (perk == 4)
    {
        self.newGunReady = true;
        if (self.weaponsList.size < 2)
        {
            //Give hand-gun to fill second slot if the player only has one gun
            self giveWeapon("defaultweapon_mp");
            self updatePlayerWeaponsList("defaultweapon_mp");
        }
    }
    else if (perk == 7)
        self.autoRevive = true;
    if (perk != 7) self.perksBought[perk-1] = true;
    else if (perk == 7) self.perksBought[6]++;

    self.totalPerkCount++;
    self.lastBoughtPerk = icon;
    self playLocalSound("earn_perk");
    self thread maps\mp\gametypes\_aiz_hud::showBoughtPerk(name, icon, perk-1);

    //wait(0.05);

    self maps\mp\gametypes\_aiz_hud::updatePerksHud(false, false);
}
setPerkBlur()
{
    self setBlurForPlayer(10, 0.3f);

    wait (0.7f);

    self setBlurForPlayer(0, 0.3f);
}

usePower(box)
{
    if (self.sessionTeam != "allies") return;
    if (self.cash < 10000) return;
    if (box.bought) return;
    self.cash -= 10000;
    self maps\mp\gametypes\_aiz_hud::scorePopup(-10000);
    self maps\mp\gametypes\_aiz_hud::scoreMessage(level.gameStrings[274]);
    box.bought = true;

    if (isDefined(box.lever))
    {
        lever = box.lever;
        lever rotateRoll(-85, 0.75);
        lever playSound("vending_machine_button_press");

        wait(0.5);

        lever playSound("mp_killstreak_talon");
        level notify("power_activated");

        playFX(level.fx_sparks, box.origin);
        box removeUsable();
        level.powerActivated = true;

        level.EMPTime = 0;
        objID = box.objID;
        _objective_delete(objID);
        level.powerBox = true;

        if (isDefined(level.powerHud))
        {
            level.powerHud.color = (0, 0.9, 0);
            level.powerHud.label = level.gameStrings[275];
            level.powerHud setText(&"NULL_EMPTY");
        }
        self thread maps\mp\gametypes\_aiz_hud::powerBoughtHud();

        return;
    }

    //box cloneBrushModelToScriptModel(undefined);
    box notSolid();
    box setContents(0);
    box moveTo(box.origin + (0, 0, 2000), 5);
    box.fx.delete = true;
    /*
    if (isDefined(box.fx_xmas))
    {
        foreach (fx in box.fx_xmas)
        {
            fx delete();
        }
        box.fx_xmas = undefined;
    }
    */

    level.EMPTime = 0;
    objID = box.objID;
    _objective_delete(objID);
    level.powerBox = true;
    
    box thread powerBoxActivate(self);
}
powerBoxActivate(player)
{
    level endon("game_ended");

    level notify("power_activated");
    self.fx delete();
    self.fx2 delete();
    self.fx = undefined;
    self.fx2 = undefined;

    wait (5);

    playFX(level.fx_empBlast, self.origin);
    playSoundAtPos(self.origin, "nuke_explosion");
    playSoundAtPos(self.origin, "nuke_wave");
    self removeUsable();
    //self delete();
    level.powerActivated = true;
    if (isDefined(level.powerHud))
    {
        level.powerHud.color = (0, 0.9, 0);
        level.powerHud.label = level.gameStrings[275];
        level.powerHud setText(&"NULL_EMPTY");
    }
    player thread maps\mp\gametypes\_aiz_hud::powerBoughtHud();
}

useDoor(door)
{
    if (!self.isAlive) return;
    if (self.SessionTeam == "allies")
    {
        if (door.state != "close") return;
        cost = door.cost;
        if (self.cash < cost) return;
        door.state = "open";
        self.cash -= cost;
        self maps\mp\gametypes\_aiz_hud::scorePopup(-cost);
        self maps\mp\gametypes\_aiz_hud::scoreMessage(level.gameStrings[276]);
        door moveTo(door.open, 1);
        if (isDefined(door.spawn) && isDefined(door.spawnAngles))
        {
            level.botSpawns[level.botSpawns.size] = door.spawn;
            level.botSpawnAngles[level.botSpawnAngles.size] = door.spawnAngles;
        }

        wait (1.1);

        door removeUsable();
    }
}

useWallWeapon(box)
{
    if (self.sessionTeam != "allies") return;

    price = box.price;
    if (self hasWeapon(box.weapon) && box.weapon != "frag_grenade_mp") price /= 2;
    if (self.cash < price) return;
    if (self.isAlive)
    {
        if (!box.bought) box.bought = true;
        self.cash -= price;
        self maps\mp\gametypes\_aiz_hud::scorePopup(-price);
        weapon = box.weapon;
        if (!self.newGunReady && !self hasWeapon(weapon) && weapon != "frag_grenade_mp")
        {
            if (isThunderGun(self getCurrentWeapon()))
                level.currentThunderguns--;
            else if (isRayGun(self getCurrentWeapon()))
                level.currentRayguns--;

            self updatePlayerWeaponsList(self getCurrentWeapon(), true);
            self takeWeapon(self getCurrentWeapon());
        }
        self giveWeapon(weapon);
        self giveMaxAmmo(weapon);
        if (weapon != "frag_grenade_mp") 
        {
            self updatePlayerWeaponsList(weapon);
            self switchToWeapon(weapon);
            self.newGunReady = false;
        }
        self playLocalSound("oldschool_pickup");
        self maps\mp\gametypes\_aiz_hud::updateAmmoHud(false);
    }
}
//-END USE LOGIC-//

//-GET TEXTS-//
getUsableText(player)
{
    if (player.sessionTeam != "allies") return [&"NULL_EMPTY"];
    if (level.gameEnded) return [&"NULL_EMPTY"];
    
    switch (self.usableType)
    {
        case "sentryPickup":
            if (self.turret.isBeingCarried || self.turret.owner != player) return [&"NULL_EMPTY"];
            return [level.gameStrings[338], "^3[{+activate}]^7"];
        case "revive":
            downed = self.player;
            if (player == downed || (isDefined(self.user) && self.user == player)) return [&"NULL_EMPTY"];
            else if (player.isDown) return [&"NULL_EMPTY"];
            else if (isDefined(self.user)) return [level.gameStrings[299], downed.name];
            else return [level.gameStrings[300], downed.name];
        case "giftTrigger":
            if (player == self.owner) return [&"NULL_EMPTY"];
            if (!self.owner.isAlive || self.owner.isDown || !isPlayer(self.owner)) return [&"NULL_EMPTY"];
            return [level.gameStrings[277], self.owner.name];
        case "door":
            if (self.state == "close")
                return [level.gameStrings[278], &"NULL_EMPTY", self.cost];
            else return [&"NULL_EMPTY"];
        case "randombox":
            if (self.state == "inuse" || self.state == "post_pickup") return [&"NULL_EMPTY"];
            if (self.state == "waiting")
            {
                if (self.player == player)
                    return [level.gameStrings[279], level.localizedWeaponNames[self.weapon]];
                return [&"NULL_EMPTY"];
            }
            if (level.sale) return [level.gameStrings[280]];
            else return [level.gameStrings[281]];
        case "pap":
            if (!level.powerActivated) return [level.gameStrings[282]];
            if (self.state == "inuse") return [&"NULL_EMPTY"];
            if (self.state == "waiting")
            {
                if (self.player == player)
                    return [level.gameStrings[283]];
                return [&"NULL_EMPTY"];
            }
            return [level.gameStrings[284]];
        case "gambler":
            if (!player.gamblerInUse) return [level.gameStrings[285]];
            else return [&"NULL_EMPTY"];
        case "killstreak":
            if (!level.powerActivated) return [level.gameStrings[282]];
            else return [level.gameStrings[286]];
        case "teleporter":
            if (array_contains(level.wawMaps, level._mapname) && !level.powerActivated) return [level.gameStrings[282]];
            if (self.state > 0) return [level.gameStrings[287]];
            else if (!self.isLinked) return [level.gameStrings[288]];
            else return [level.gameStrings[289]];
        case "linker":
            if (!level.powerActivated) return [level.gameStrings[282]];
            else if (self.teleporter.state > 0) return [level.gameStrings[287]];
            else if (self.teleporter.isLinked) return [&"NULL_EMPTY"];
            else return [level.gameStrings[290]];
        case "elevator":
            if (!level.powerActivated && (level._mapname != "mp_highrise" && (level._mapname != "mp_terminal_cls" || (level._mapname == "mp_terminal_cls" && level.mapVariation != 0)))) return [level.gameStrings[282]];
            else if (self.isMoving) return [&"NULL_EMPTY"];
            else return [level.gameStrings[291]];
        case "bank":
            if (!level.powerBox && !level.isHellMap) return [level.gameStrings[282]];//BS 12/1/21 - Changing this to require the power box instead of power in favor of keeping EMPs from enabling this
            else return [level.gameStrings[292]];
        case "perk1":
            if (!level.powerActivated) return [level.gameStrings[282]];
            if (player.perksBought[0]) return [level.gameStrings[293], level.gameStrings[266]];
            if (player.totalPerkCount >= level.perkLimit && level.perkLimit > 0) return [level.gameStrings[295], &"NULL_EMPTY", level.perkLimit];
            else return [level.gameStrings[27], &"NULL_EMPTY", 2500];
        case "perk2":
            if (!level.powerActivated) return [level.gameStrings[282]];
            if (player.perksBought[1]) return [level.gameStrings[293], level.gameStrings[267]];
            if (player.totalPerkCount >= level.perkLimit && level.perkLimit > 0) return [level.gameStrings[295], &"NULL_EMPTY", level.perkLimit];
            else return [level.gameStrings[28], &"NULL_EMPTY", 2000];
        case "perk3":
            if (!level.powerActivated) return [level.gameStrings[282]];
            if (player.perksBought[2]) return [level.gameStrings[293], level.gameStrings[268]];
            if (player.totalPerkCount >= level.perkLimit && level.perkLimit > 0) return [level.gameStrings[295], &"NULL_EMPTY", level.perkLimit];
            else return [level.gameStrings[29], &"NULL_EMPTY", 3000];
        case "perk4":
            if (!level.powerActivated) return [level.gameStrings[282]];
            if (player.perksBought[3]) return [level.gameStrings[293], level.gameStrings[269]];
            if (player.totalPerkCount >= level.perkLimit && level.perkLimit > 0) return [level.gameStrings[295], &"NULL_EMPTY", level.perkLimit];
            else return [level.gameStrings[30], &"NULL_EMPTY", 4000];
        case "perk5":
            if (!level.powerActivated) return [level.gameStrings[282]];
            if (player.perksBought[4]) return [level.gameStrings[293], level.gameStrings[270]];
            if (player.totalPerkCount >= level.perkLimit && level.perkLimit > 0) return [level.gameStrings[295], &"NULL_EMPTY", level.perkLimit];
            else return [level.gameStrings[31], &"NULL_EMPTY", 2000];
        case "perk6":
            if (!level.powerActivated) return [level.gameStrings[282]];
            if (player.perksBought[5]) return [level.gameStrings[293], level.gameStrings[271]];
            if (player.totalPerkCount >= level.perkLimit && level.perkLimit > 0) return [level.gameStrings[295], &"NULL_EMPTY", level.perkLimit];
            else return [level.gameStrings[32], &"NULL_EMPTY", 1500];
        case "perk7":
            if (!level.powerActivated) return [level.gameStrings[282]];
            if (player.autoRevive) return [level.gameStrings[293], level.gameStrings[272]];
            else if (player.perksBought[6] >= 3) return [&"You already bought Quick Revive Pro three times!"];
            if (player.totalPerkCount >= level.perkLimit && level.perkLimit > 0) return [level.gameStrings[295], &"NULL_EMPTY", level.perkLimit];
            else return [level.gameStrings[33], &"NULL_EMPTY", 1500];
        case "perk8":
            if (!level.powerActivated) return [level.gameStrings[282]];
            if (player.perksBought[7]) return [level.gameStrings[293], level.gameStrings[273]];
            if (player.totalPerkCount >= level.perkLimit && level.perkLimit > 0) return [level.gameStrings[295], &"NULL_EMPTY", level.perkLimit];
            else return [level.gameStrings[321], level.gameStrings[273]];
        case "ammo":
            if (self.used) return [&"NULL_EMPTY"];
            else return [level.gameStrings[321], &"NULL_EMPTY", (4500 + player.ammoCostAddition)];
        case "power":
            return [level.gameStrings[296]];
        case "expAmmo":
            if (player.hasExpAmmoPerk) return [&"NULL_EMPTY"];
            else return [level.gameStrings[297]];
        case "heliExtraction":
            lb = self.heli;
            owner = lb.owner;
            if (player != owner || lb.hasPassenger) return [&"NULL_EMPTY"];
            else return [level.gameStrings[298]];
        case "carePackage":
            streak = "";
            switch (self.streak)
            {
                case 0:
                    streak = level.gameStrings[301];
                    break;
                case 1:
                    streak = level.gameStrings[302];
                    break;
                case 2:
                    streak = level.gameStrings[303];
                    break;
                case 3:
                    if (level.isHellMap)
                        streak = level.gameStrings[304];
                    else
                        streak = level.gameStrings[305];
                    break;
                case 4:
                    streak = level.gameStrings[306];
                    break;
                case 5:
                    streak = level.gameStrings[229];
                    break;
                case 6:
                    streak = level.gameStrings[308];
                    break;
                case 7:
                    streak = level.gameStrings[309];
                    break;
                case 9:
                    streak = level.gameStrings[310];
                    break;
                case 12:
                    streak = level.gameStrings[315];
                    break;
                case 13:
                    streak = level.gameStrings[339];
                    break;
                case 14:
                    streak = level.gameStrings[129];
                    break;
                case 8:
                    streak = level.gameStrings[315];
                    break;
            }
            return [level.gameStrings[316], streak];
        case "wallweapon":
            if (isDefined(self.script_noteworthy)) return [level.gameStrings[318]];

            weapon = self.weapon;
            //weaponName = maps\mp\gametypes\_aiz_hud::getWeaponName(weapon);
            //if (weaponName == &"NULL_EMPTY") weaponName = level.gameStrings[317];
            cost = self.price;

            //PLUTOIW5 - There is no great way to do this base string, and this feature is seemingly unused in the base game mode so this is being changed to simply show the weapon name.
            //if (!player hasWeapon(weapon) && cost != 0) return [&"NULL_EMPTY", "Press ^3[{+activate}] ^7for " + weaponName + " ^7[Cost: " + cost + "]"];
            /*else */if (!player hasWeapon(weapon) || weapon == "frag_grenade_mp"/* && cost == 0*/) return [level.gameStrings[322], &"NULL_EMPTY", cost];
            else return [level.gameStrings[321], &"NULL_EMPTY", (cost/2)];
        case "helmet":
            if (isDefined(player.helmet) && player.helmet) return [&"NULL_EMPTY"];
            return [level.gameStrings[320], " P.E.S."];
        case "zipline":
            if (!level.powerActivated && (level._mapname != "mp_highrise" && (level._mapname != "mp_terminal_cls" || (level._mapname == "mp_terminal_cls" && level.mapVariation != 0)))) return [level.gameStrings[282]];
            else if (self.isMoving) return [&"NULL_EMPTY"];
            else return [&"Hold ^3[{+activate}]^7 to use Zipline[^2$^35000^7]"];
        default:
            return [&"NULL_EMPTY"];
    }
}
//-END GET TEXTS-//

//-MOON UTILS-//
/*
spawnMoonHelmet(location, angles)
{
    helmet = spawn("script_model", location);
    helmet.origin = angles;
    helmet setModel("mp_fullbody_ally_juggernaut");
    helmet hidePart("j_spine4");
    helmet hidePart("j_elbow_ri");
    helmet hidePart("j_hip_ri");

    helmet addUsable("helmet", 50);
}

spawnMoonExcavator(location, angles, name)
{
    excavatorBase = spawn("script_model", location);
    excavatorBase.angles = angles;
    excavatorBase setModel("machinery_windmill");
    excavator = spawn("script_model", location);
    excavator.angles = angles;
    excavator setModel("vehicle_pavelow_opforce");
    excavator hidePart("body_animate_jnt");
    excavator hidePart("j_door_ri");
    excavator linkTo(excavatorBase, "j_top", (0, 0, 0), (0, 0, 0));
}

useHelmet()
{
    if (!isDefined(self.helmet)) return;
    self playLocalSound("mp_killstreak_equip_done");
    self iPrintLnBold(level.gameStrings[322]);
    self giveWeapon("trophy_mp");
    self setActionSlot(3, "weapon", "trophy_mp");
    self.helmet = true;
}
putOnHelmet()
{
    self disableWeaponSwitch();
    self playLocalSound("foly_onemanarmy_bag3_plr");
    self setWeaponAmmoClip("trophy_mp", 0);
    self setWeaponAmmoStock("trophy_mp", 0);

    wait(3);

    helmet = createIcon(self, "goggles_overlay", 640, 480);
    helmet.alpha = 1;
    helmet.archived = false;
    helmet.foreground = false;
    helmet.hideIn3rdPerson = true;
    helmet.hideWhenDead = true;
    helmet.hideWhenInMenu = false;
    helmet.horzAlign = "fullscreen";
    helmet.vertAlign = "fullscreen";
    self.hud_helmet = helmet;
    self enableWeaponSwitch();
    self switchToWeapon(self.lastDroppableWeapon);
    self setWeaponAmmoClip("trophy_mp", 1);
    self setWeaponAmmoStock("trophy_mp", 1);
    self.hasHelmetOn = true;
    self notify("helmet_on");
    self thread monitorHelmetOnForBreathing();
    self remoteCameraSoundscapeOn();
    self setReverb("snd_enveffectsprio_level", "sewer", 0.1, 1, 0);
    
    self attach("ims_scorpion_explosive1", "j_head", true);

    self iPrintLnBold(level.gameStrings[323]);
}
takeOffHelmet()
{
    self disableWeaponSwitch();
    self playLocalSound("foly_onemanarmy_bag3_plr");
    helmet = self.hud_helmet;
    helmet destroy();
    self detach("ims_scorpion_explosive1", "j_head");
    self remoteCameraSoundscapeOff();
    self setReverb("snd_enveffectsprio_level", "default");
    self notify("helmet_off");

    wait(1.5);

    self enableWeaponSwitch();
    self switchToWeapon(self.lastDroppableWeapon);

    wait(0.5);

    self.hasHelmetOn = undefined;
}

monitorHelmetOnForBreathing()
{
    self endon ("death");
    self endon ("helmet_off");

    while (true)
    {
        self playLocalSound("juggernaut_breathing_sound");
        wait(4);
    }
}

monitorMoonGravity()
{
    level endon ("game_ended");

    while (true)
    {
        //Check for gravity and air here
        //Glass values:
        //Building: 
        //150 -153 = front right
        //96, 103, 42, 54 = top front
        //146-149 = front left
        //1, 80, 93, 94, 129, 135, 136, 137 = front far left
        //132, 133, 134, 99, 98, 97, 95, 5= front far right
        //6-12 = back hallway right
        //77-84 = back hallway right 2
        //85-90 = back hallway left 2
        //91, 92, 108, 109-116 = back hallway left
        //105-107 = back entrance
        //Dome:
        //155-160
        foreach (player in level.players)
        {
            if (!isDefined(player) || !player.isAlive) continue;
            if (!isDefined(player.isDown)) continue;
            if (player.isDown) continue;

            if (player isTouching(level.moonTriggers[0]) || player isTouching(level.moonTriggers[1]) || player isTouching(level.moonTriggers[2]) ||
                player isTouching(level.moonTriggers[3]) || player isTouching(level.moonTriggers[4]) || player isTouching(level.moonTriggers[5]) ||
                player isTouching(level.moonTriggers[6]))
            {
                if (isDefined(player.moonGravity))
                {
                    player _unSetPerk("specialty_jumpdive", true);
                    player.moonGravity = undefined;
                }
                if (!isDefined(player.isInside))
                {
                    player notify("helmet_on");
                    player.isInside = true;
                }
            }
            else
            {
                if (isDefined(player.isInside) && player.isInside)
                    player.isInside = undefined;
                if (!isDefined(player.moonGravity))
                {
                    player givePerk("specialty_jumpdive", false);
                    player.moonGravity = true;
                }
                if (!isDefined(player.hasHelmetOn) && !isDefined(player.isSuffocating))
                    player thread suffocatePlayer();
            }
        }

        wait (0.1);
    }
}
suffocatePlayer()
{
    if (self.isDown) return;

    helmetWait = "timeout";
    self.isSuffocating = true;
    self playLocalSound("breathing_heartbeat");
    helmetWait = self waittill_any_timeout(3, "helmet_on", "death", "disconnect");
    if (helmetWait != "timeout" || isDefined(self.hasHelmetOn))
    {
        self.isSuffocating = undefined;
        return;
    }
    self iPrintLnBold(level.gameStrings[324]);
    self playLocalSound("breathing_hurt");
    self setBlurForPlayer(0.5, 0.25);
    wait(0.5);
    self setBlurForPlayer(0, 0.25);

    helmetWait = self waittill_any_timeout(3, "helmet_on", "death", "disconnect");
    if (helmetWait != "timeout" || isDefined(self.hasHelmetOn))
    {
        self.isSuffocating = undefined;
        self playLocalSound("weap_sniper_breathout");
        return;
    }

    self playLocalSound("breathing_heartbeat");
    self setBlurForPlayer(1, 0.25);
    wait(0.5);
    self setBlurForPlayer(0, 0.25);

    helmetWait = self waittill_any_timeout(3, "helmet_on", "death", "disconnect");
    if (helmetWait != "timeout" || isDefined(self.hasHelmetOn))
    {
        self.isSuffocating = undefined;
        self playLocalSound("weap_sniper_breathgasp");
        return;
    }

    self playLocalSound("breathing_heartbeat");
    self setBlurForPlayer(1.5, 0.25);
    wait(0.5);
    self setBlurForPlayer(0, 0.25);

    helmetWait = self waittill_any_timeout(3, "helmet_on", "death", "disconnect");
    if (helmetWait != "timeout" || isDefined(self.hasHelmetOn))
    {
        self.isSuffocating = undefined;
        self playLocalSound("weap_sniper_breathgasp");
        return;
    }

    self playLocalSound("breathing_heartbeat");
    self setBlurForPlayer(2, 0.25);
    wait(0.5);
    self setBlurForPlayer(0, 0.25);

    helmetWait = self waittill_any_timeout(3, "helmet_on", "death", "disconnect");
    if (helmetWait != "timeout" || isDefined(self.hasHelmetOn))
    {
        self.isSuffocating = undefined;
        self playLocalSound("weap_sniper_breathgasp");
        return;
    }
    self finishPlayerDamage(undefined, undefined, self.health, 0, "MOD_FALLING", "none", self.origin, (0, 0, 0), "j_neck", 0);
    self.isSuffocating = undefined;
}
*/
//-END MOON UTILS-//

startSale()
{
    if (level.sale) return;

    level.sale = true;

    level thread endSaleAfterTime();

    if (array_contains(level.wawMaps, level._mapname) || level.fullFireSale)
        populateAllBoxLocations();

    foreach (usable in level.usables)
    {
        if (isDefined(usable.usabletype) && usable.usabletype == "randombox")
        {
            fx = spawnFX(level.fx_smallFire, usable.weaponEnt.origin);
            triggerFX(fx);
            //usable playLoopSound("elev_musak_loop");
            fx thread deleteSaleFXOnEnd();
        }
    }
}

deleteSaleFXOnEnd()
{
    level waittill("sale_ended");
    self delete();
}
endSaleAfterTime()
{
    wait (30);
    level notify("sale_ended");
    level.sale = false;
}
populateAllBoxLocations()
{
    currentBox = undefined;
    foreach (usable in level.usables)
    {
        if (!isDefined(usable) || !isDefined(usable.usableType))
            continue;

        if (usable.usableType == "randombox")
        {
            currentBox = usable;
            break;
        }
    }

    if (!isDefined(currentBox))
        return;

    currentBoxLocationIndex = currentBox.lastLocation;

    for (i = 0; i < level.boxLocations.size; i++)
    {
        if (i == currentBoxLocationIndex)
            continue;
            
        box = randomWeaponCrate(level.boxLocations[i][0], level.boxLocations[i][1], 0, i);
        box thread removeAfterSale();
    }
}
removeAfterSale()
{
    level waittill("sale_ended");

    while (isDefined(self.state) && self.state != "idle")
        wait(0.05);

    self.boxBase hide();
    self.boxLid hide();
    self.weaponEnt delete();
    playFX(level.fx_disappear, self.origin);
    
    self removeUsable();
}

addUsable(type, range)
{
    self.usabletype = type;
    self.range = (range * range);
    /*
    trigger = spawn("trigger_radius", self.origin, 0, range, range);
    //trigger.code_classname = "trigger_" + type;
    trigger.type = type);
    trigger linkTo(self);
    trigger.parent = self;
    self.trigger = trigger;
    */
    level.usables[level.usables.size] = self;
}

spawnMapEditObject(type, origin, angles, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
{
    if (!isDefined(type) || !isDefined(origin))
        return;

    switch (type)
    {
        case "crate":
            spawnCrate(origin, angles, false, false);
            break;
        case "invisiblecrate":
            spawnCrate(origin, angles, true, false);
            break;
        case "ramp":
            createRamp(origin, angles);
            break;
        case "teleport":
            createElevator(origin, angles);
            break;
        case "timedTeleporter":
            createTeleporter(origin, angles, arg2, arg3, arg4, arg5, arg6);
            break;
        case "door":
            createDoor(origin, angles, arg2, arg3, arg4, arg5, arg6);
            break;
        case "doorandspawn":
            if (!isDefined(arg8))
            {
                createDoor(origin, angles, arg2, arg3, arg4, arg5, arg6);
                break;
            }
            createDoor(origin, angles, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
            break;
        case "wall":
            createWall(origin, angles, false, false);
            break;
        case "invisiblewall":
            createWall(origin, angles, true, false);
            break;
        case "deathwall":
            createWall(origin, angles, true, true);
            break;
        case "randombox":
            level.boxLocations[level.boxLocations.size] = [origin, angles];
            if (isDefined(arg2) && isDefined(arg3))
            {
                level.boxLocations[level.boxLocations.size] = [arg2, arg3];
            }
            if (isDefined(arg4) && isDefined(arg5))
            {
                level.boxLocations[level.boxLocations.size] = [arg4, arg5];
            }
            if (isDefined(arg6) && isDefined(arg7))
            {
                level.boxLocations[level.boxLocations.size] = [arg6, arg7];
            }
            if (isDefined(arg8) && isDefined(arg9))
            {
                level.boxLocations[level.boxLocations.size] = [arg8, arg9];
            }
            randomWeaponCrate(origin, angles);
            break;
        case "pap":
            papCrate(origin, angles);
            break;
        case "gambler":
            gamblerCrate(origin, angles);
            break;
        case "floor":
            createFloor(origin, angles, false, false);
            break;
        case "invisiblefloor":
            createFloor(origin, angles, true, false);
            break;
        case "deathfloor":
            createFloor(origin, angles, true, true);
            break;
        case "elevator":
            realElevator(origin, angles, arg2, arg3);
            break;
        case "model":
            spawnModel(angles, arg2, origin);
            break;
        case "bank":
            spawnBank(origin, angles);
            break;
        case "perk1":
            perkCrate(origin, angles, 1);
            break;
        case "perk2":
            perkCrate(origin, angles, 2);
            break;
        case "perk3":
            perkCrate(origin, angles, 3);
            break;
        case "perk4":
            perkCrate(origin, angles, 4);
            break;
        case "perk5":
            perkCrate(origin, angles, 5);
            break;
        case "perk6":
            perkCrate(origin, angles, 6);
            break;
        case "perk7":
            perkCrate(origin, angles, 7);
            break;
        case "perk8":
            perkCrate(origin, angles, 8);
            break;
        case "ammo":
            ammoCrate(origin, angles);
            break;
        case "killstreak":
            killstreakCrate(origin, angles);
            break;
        case "power":
            powerCrate(origin, angles);
            break;
        case "spawn":
            level.playerSpawnLocs[level.playerSpawnLocs.size] = origin;
            level.playerSpawnAngles[level.playerSpawnAngles.size] = angles;
            break;
        case "zombiespawn":
            level.botSpawns[level.botSpawns.size] = origin;
            level.botSpawnAngles[level.botSpawnAngles.size] = angles;
            break;
        case "perk1Interchange":
            perkCrate((453.7388, -415.7576, 614.9092), (90, 0, 0), -1);
            break;
        case "mapname":
            level.zombieMapname = origin;
            break;
        case "hellMap":
            if (origin)
            {
                level.isHellMap = true;
                level.powerActivated = true;
            }
            else 
            {
                level.isHellMap = false;
            }
            break;
        case "maxWave":
            level.totalWaves = origin;
            break;
        case "xLimit":
            setupSpaceLimit(true, origin, angles);
            break;
        case "yLimit":
            setupSpaceLimit(false, origin, angles);
            break;
        case "minefield":
            mine = spawn("trigger_radius", origin, 0, angles, arg2);
            mine.targetname = "minefield";
            break;
        case "radiation":
            rad = spawn("trigger_radius", origin, 0, angles, arg2);
            rad.targetname = "radiation";
            break;
        case "fallLimit":
            level thread monitorFallDeath(origin);
            //Also set zombie death limit here
            level.mapHeight = origin;
            break;
        case "wallweapon":
            return wallWeapon(origin, angles, arg2, arg3);
        case "mapcenter":
            setMapCenter(origin);
            break;
        /*
        case "spacehelmet":
            if (level._mapname != "mp_dome") return;
            spawnMoonHelmet(origin, angles);
            break;
        case "excavator":
            if (level._mapname != "mp_dome") return;
            spawnMoonExcavator(origin, angles, arg2);
            break;
        */
        case "zipline":
            createZipline(origin, angles, arg2, arg3, arg4, arg5, arg6);
            break;
        default:
            printLn(level.gameStrings[326], type);
            break;
    }
}
terminal_buildGates(gates)
{
    wait(0.3);

    intro_col = [];
    intro_col2 = [];
    for (i = 0; i < 7; i++)
    {
        gatePart = spawn("script_model", gates[1].origin - (0, 0, 24 * i));
        gatePart.angles = gates[1].angles;
        gatePart cloneBrushModelToScriptModel(gates[1]);
        gatePart linkTo(gates[1]);

        gatePart2 = spawn("script_model", gates[0].origin - (0, 0, 24 * i));
        gatePart2.angles = gates[0].angles;
        gatePart2 cloneBrushModelToScriptModel(gates[0]);
        gatePart2 linkTo(gates[0]);
    }
    for (i = 0; i < 7; i++)
    {
        gateCol = spawn("script_model", gates[1].origin - (0, 0, 24 * i));
        gateCol.angles = gates[1].angles;
        gateCol cloneBrushModelToScriptModel(gates[1]);
        gateCol hide();
        intro_col[i] = gateCol;

        gateCol2 = spawn("script_model", gates[0].origin - (0, 0, 24 * i));
        gateCol2.angles = gates[0].angles;
        gateCol2 cloneBrushModelToScriptModel(gates[0]);
        gateCol2 hide();
        intro_col2[i] = gateCol2;
    }

    gates[0].origin += (0, 0, 143);
    gates[1].origin += (0, 0, 143);

    level thread terminal_dropTheGates(gates, intro_col, intro_col2);
}
terminal_dropTheGates(gates, intro_col, intro_col2)
{
    while (!level.intermissionTimerStarted)
    {
        wait(1);
    }

    wait(2);

    foreach (gate in gates)
    {
        gate moveTo(gate.origin - (0, 0, 143), 2, 1.5);
        gate playLoopSound("ugv_engine_high");
    }

    wait(2);

    gates[0] stopLoopSound();
    gates[1] stopLoopSound();
    gates[0] playSound("physics_car_door_default");
    gates[1] playSound("physics_car_door_default");

    foreach (col in intro_col)
        col delete();
    foreach (col in intro_col2)
        col delete();
}
/*
domeEasterEgg()
{
    eggIsVisible = self worldPointInReticle_Circle((-9.501169, 233.3094, -192.0296), 64, 64);
    if (eggIsVisible)
    {
        self playLocalSound("elm_dog");
    }
}
*/
cleanLevelEnts()
{
    //wait(0.1);
    for (i = 18; i < 2000; i++)
    {
        ent = getEntByNum(i);
        if (!isDefined(ent)) continue;
        entTargetName = ent.targetname;
        if (!isDefined(entTargetName))
            continue;

        entClassName = ent.classname;
        if (!isDefined(entClassName))
            continue;

        if (isSubStr(entTargetName, "killCamEnt_") || 
        (isSubStr(entClassName, "mp_") && isSubStr(entClassName, "_spawn") && !isSubStr(entClassName, "mp_tdm")) ||
        /*isSubStr(entTargetName, "auto") || */isSubStr(entTargetName, "heli_") ||
        entTargetName == "flag_descriptor" ||
        entTargetName == "remote_uav_range" ||
        entTargetName == "radiotrigger" ||
        (entTargetName == "grnd_zone" || entTargetName == "grnd_dropZone"))
            ent delete();
    }

    wait(0.1);

    for (i = 18; i < 2000; i++)//Second pass to grab additional spawned stuff
    {
        ent = getEntByNum(i);
        if (!isDefined(ent)) continue;
        entTargetName = ent.targetname;
        if (!isDefined(entTargetName))
            continue;

        entClassName = ent.classname;
        if (!isDefined(entClassName))
            continue;

        if (isSubStr(entTargetName, "killCamEnt_") || 
        (isSubStr(entClassName, "mp_") && isSubStr(entClassName, "_spawn") && !isSubStr(entClassName, "mp_tdm")) ||
        /*isSubStr(entTargetName, "auto") || */isSubStr(entTargetName, "heli_") ||
        entTargetName == "flag_descriptor" ||
        entTargetName == "remote_uav_range" ||
        entTargetName == "radiotrigger" ||
        (entTargetName == "grnd_zone" || entTargetName == "grnd_dropZone"))
            ent delete();
    }
}
dome_deleteDynamicModels()
{
    newEnts = [];
    dynamicEnts = getEntArray("animated_model", "targetname");
    foreach (ent in dynamicEnts)
    {
        newEnt = spawn("script_model", ent.origin);//Spawn 'fake' model
        newEnt.angles = ent.angles;
        newEnt setModel(ent.model);
        newEnt hide();
        newEnts[newEnts.size] = newEnt;
        ent delete();
    }

    wait(0.05);

    foreach (ent in newEnts)
    {
        model = ent.model;
        if (isSubStr(model, "fence_tarp_"))
        {
            ent.targetName = "dynamic_model";
            if (model != "fence_tarp_134x76") ent scriptModelPlayAnim(model + "_med_01");
            else if (model == "fence_tarp_134x76") ent scriptModelPlayAnim(model + "_med_02");
        }
        else if (model == "machinery_windmill")
        {
            ent.targetName = "dynamic_model";
            ent scriptModelPlayAnim("windmill_spin_med");
            if (!isDefined(level.dome_windmillList))
                level.dome_windmillList = [];

            level.dome_windmillList[level.dome_windmillList.size] = ent;
        }
        else if (isSubStr(model, "foliage"))
        {
            ent.targetName = "dynamic_model";
            ent scriptModelPlayAnim("foliage_desertbrush_1_sway");
        }
        else if (isSubStr(model, "oil_pump_jack"))
        {
            ent.targetName = "dynamic_model";
            ent scriptModelPlayAnim("oilpump_pump0" + (randomInt(2) + 1));
        }
        else if (model == "accessories_windsock_large")
        {
            ent.targetName = "dynamic_model";
            ent scriptModelPlayAnim("windsock_large_wind_medium");
        }
        ent show();
    }
}

getAlliesFlagModel(mapname)
{
    switch (mapname)
    {
        case "mp_alpha":
        case "mp_dome":
        case "mp_exchange":
        case "mp_hardhat":
        case "mp_interchange":
        case "mp_lambeth":
        case "mp_radar":
        case "mp_cement":
        case "mp_hillside_ss":
        case "mp_morningwood":
        case "mp_overwatch":
        case "mp_park":
        case "mp_qadeem":
        case "mp_restrepo_ss":
        case "mp_terminal_cls":
        case "mp_roughneck":
        case "mp_boardwalk":
        case "mp_moab":
        case "mp_nola":
        case "mp_burn_ss":
        case "mp_six_ss":
        case "mp_brecourt":
            return "prop_flag_delta";
        case "mp_bootleg":
        case "mp_bravo":
        case "mp_carbon":
        case "mp_mogadishu":
        case "mp_village":
        case "mp_shipbreaker":
            return "prop_flag_pmc";
        case "mp_paris":
            return "prop_flag_gign";
        case "mp_plaza2":
        case "mp_seatown":
        case "mp_underground":
        case "mp_aground_ss":
        case "mp_courtyard_ss":
        case "mp_italy":
        case "mp_meteora":
        case "mp_subbase":
            return "prop_flag_sas";
    }
    return "";
}
getAxisFlagModel(mapname)
{
    switch (mapname)
    {
        case "mp_alpha":
        case "mp_bootleg":
        case "mp_dome":
        case "mp_exchange":
        case "mp_hardhat":
        case "mp_interchange":
        case "mp_lambeth":
        case "mp_paris":
        case "mp_plaza2":
        case "mp_radar":
        case "mp_underground":
        case "mp_cement":
        case "mp_hillside_ss":
        case "mp_overwatch":
        case "mp_park":
        case "mp_restrepo_ss":
        case "mp_terminal_cls":
        case "mp_roughneck":
        case "mp_boardwalk":
        case "mp_moab":
        case "mp_nola":
        case "mp_brecourt":
            return "prop_flag_speznas";
        case "mp_bravo":
        case "mp_carbon":
        case "mp_mogadishu":
        case "mp_village":
        case "mp_shipbreaker":
            return "prop_flag_africa";
        case "mp_seatown":
        case "mp_aground_ss":
        case "mp_courtyard_ss":
        case "mp_meteora":
        case "mp_morningwood":
        case "mp_qadeem":
        case "mp_italy":
        case "mp_subbase":
            return "prop_flag_ic";
    }
    return "";
}

//-START DOME MOON-//
/*
initDomeMoon()
{
    bunkerZone = getEntByNum(550);
    bunkerEntranceZone = getEntByNum(544);
    backBuildingZone = getEntByNum(538);
    domeZone = getEntByNum(59);
    if (bunkerZone.classname == "trigger_multiple") bunkerZone willNeverChange();
    if (backBuildingZone.classname == "trigger_multiple") backBuildingZone willNeverChange();
    if (domeZone.classname == "trigger_multiple") domeZone willNeverChange();
    if (bunkerEntranceZone.classname == "trigger_multiple") bunkerEntranceZone willNeverChange();

    backHallwayZone = spawn("trigger_radius", (1302.512, 1400.346, -254.875), 0, 186, 512);
    buildingZone = spawn("trigger_radius", (980.6837, 2035.045, -254.875), 0, 612, 512);
    bunkerMidZone = spawn("trigger_radius", (-1108.737, 901.4845, -451.875), 0, 312, 612);
    bunkerMidZone.angles = (90, 0, 0);
    bunkerMidZone willNeverChange();
    backHallwayZone willNeverChange();
    buildingZone willNeverChange();

    level.moonTriggers[0] = bunkerZone;
    level.moonTriggers[1] = bunkerEntranceZone;
    level.moonTriggers[2] = bunkerMidZone;
    level.moonTriggers[3] = backBuildingZone;
    level.moonTriggers[4] = backHallwayZone;
    level.moonTriggers[5] = buildingZone;
    level.moonTriggers[6] = domeZone;
}
initMoon()
{
    ambientStop();
    setSunlight((-1, -1, 1));
    visionSetNaked("cobra_sunset3");
    level.vision = "cobra_sunset3";
    monitorMoonGravity();

    hummers = getEntArray("vehicle_hummer_destructible", "model");
    foreach (hummer in hummers)
    {
        hummer setModel("com_satellite_dish_big");
        hummer setCanDamage(false);
        hummer thread rotateEntity();
    }
}
*/
//-END DOME MOON-//

//-START EASTER EGGS-//
//-DOME-//
dome_initEasterEgg()
{
    preCacheShader("specialty_perks_all");

    t = spawn("script_origin", (-40, 413, -393));//getEnt("trigger_use_touch", "classname");
    if (isDefined(t))
    {
        t.targetName = "aiz_dome_trigger_1";
        //t.origin = (-40.87393, 413.6856, -393.5953);
        t.hasBeenActivated = false;
        //t willNeverChange();

    }

    t2 = spawn("script_origin", (-1442, 1079, -426));//getEnt("sab_bomb_defuse_allies", "targetname");
    if (isDefined(t2))
    {
        t2.targetName = "aiz_dome_cabinet_trigger_bunker";
        //t2.origin = (-1442.411, 1079.49, -426.0376);
        t2.hasBeenActivated = false;
        //t2 willNeverChange();
    }
    t3 = spawn("script_origin", (-67, -236, -390));//getEnt("sab_bomb_defuse_axis", "targetname");
    if (isDefined(t3))
    {
        t3.targetName = "aiz_dome_cabinet_trigger_dome";
        //t3.origin = (-67.49985, -236.227, -390.375);
        t3.hasBeenActivated = false;
        //t3 willNeverChange();
    }

    electronicCabinet1 = spawn("script_model", (-1482.5, 1055.2, -426.5));
    electronicCabinet1.angles = (0, 115.9, 0);
    electronicCabinet1 setModel("icbm_electronic_cabinet2_busted");
    spawnCrate(electronicCabinet1.origin + (0, 0, 40), (90, 115.9, 0), true, false);//Collision
    electronicCabinet1.targetName = "dome_cabinet_bunker";

    electronicCabinet2 = spawn("script_model", (-111.5, -257.2, -390.4));
    electronicCabinet2.angles = (0, 112.7, 0);
    electronicCabinet2 setModel("icbm_electronic_cabinet2_busted");
    spawnCrate(electronicCabinet2.origin + (0, 0, 40), (90, 112.7, 0), true, false);//Collision
    electronicCabinet2.targetName = "dome_cabinet_dome";

    triggerBunker = getEnt("aiz_dome_cabinet_trigger_bunker", "targetname");
    triggerBunker.cabinet = electronicCabinet1;
    triggerDome = getEnt("aiz_dome_cabinet_trigger_dome", "targetname");
    triggerDome.cabinet = electronicCabinet2;


    teddy1 = spawn("script_model", (521, 304, -343));
    teddy1 setModel("com_teddy_bear");
    teddy1.angles = (0, 24, 0);
    teddy1.targetName = "teddy_1";
    teddy1 setCanDamage(true);
    teddy1 setCanRadiusDamage(false);

    teddy2 = spawn("script_model", (530, 369, -341));
    teddy2 setModel("com_teddy_bear");
    teddy2.angles = (0, 210, 0);
    teddy2.targetName = "teddy_2";
    teddy2 setCanDamage(false);
    teddy2 setCanRadiusDamage(false);
    teddy2 hide();

    teddy3 = spawn("script_model", (-773, 55, -362));
    teddy3 setModel("com_teddy_bear");
    teddy3.angles = (0, 201, 0);
    teddy3.targetName = "teddy_3";
    teddy3 setCanDamage(false);
    teddy3 setCanRadiusDamage(false);
    teddy3 hide();

    teddy4 = spawn("script_model", (590, -553, -370));
    teddy4 setModel("com_teddy_bear");
    teddy4.angles = (85, 190, 0);
    teddy4.targetName = "teddy_4";
    teddy4 setCanDamage(false);
    teddy4 setCanRadiusDamage(false);
    teddy4 hide();

    level thread dome_watchTeddyDamage(teddy1, teddy2, teddy3, teddy4);
}
dome_watchTeddyDamage(teddy1, teddy2, teddy3, teddy4)
{
    level endon("game_ended");

    teddy1 waittill("damage");

    //teddy1 hide();
    teddy1 moveZ(30, 1, 0.5);
    teddy1 setCanDamage(false);
    wait(1);

    teddy1 playSound("re_pickup_paper");
    playFX(level.fx_disappear, teddy1.origin);
    teddy1 hide();
    teddy3 show();
    teddy3 setCanDamage(true);

    teddy3 waittill("damage");

    //teddy3 hide();
    teddy3 moveZ(30, 1, 0.5);
    teddy3 setCanDamage(false);
    wait(1);

    teddy3 playSound("re_pickup_paper");
    playFX(level.fx_disappear, teddy3.origin);
    teddy3 hide();
    teddy2 show();
    teddy2 setCanDamage(true);
    teddy2 waittill("damage");

    //teddy2 hide();
    teddy2 moveZ(30, 1, 0.5);
    teddy2 setCanDamage(false);
    wait(1);

    teddy2 playSound("re_pickup_paper");
    PlayFX(level.fx_disappear, teddy2.origin);
    teddy2 hide();
    teddy4 show();
    teddy4 setCanDamage(true);
    teddy4 waittill("damage");

    //teddy4 hide();
    teddy4 moveZ(30, 1, .5f);
    teddy4 setCanDamage(false);
    wait(1);

    PlayFX(level.fx_disappear, teddy4.origin);
    teddy4 hide();
    teddy4 playSound("scrambler_beep");

    step2Trigger = getEnt("aiz_dome_trigger_1", "targetname");
    if (isDefined(step2Trigger)) step2Trigger addUsable("dome_eeDog", 150);
    //dome_watchEasterEggTrigger1();
}
dome_checkEasterEggTrigger1(trigger)
{
    //trigger = getEnt("aiz_dome_trigger_1", "targetname");
    //if (isDefined(trigger))
    //{
    if (trigger.hasBeenActivated) return;

    viewPoint = (26, 246, -187);
    isVisible = self worldPointInReticle_Circle(viewPoint, 65, 65);

    if (isVisible)
    {
        for (i = 0; i < 50; i++)
            self playLocalSound("elm_dog");

        trigger.hasBeenActivated = true;
        trigger removeUsable();
        dome_easterEggStep3();
    }
    //}
}
dome_easterEggStep3()
{
    foreach (ent in level.dome_windmillList)
    {
        ent setCanDamage(true);
        ent setCanRadiusDamage(true);
        ent.health = 999999;
	    ent.maxHealth = 999999;
        ent.destroyed = false;
        
        ent thread dome_watchWindmillDamage();
    }
}
dome_watchWindmillDamage()
{
    level endon("game_ended");
    self endon("death");

    self waittill("damage", damage, attacker, direction_vec, point, meansOfDeath, modelName, partName, tagName, iDFlags, weapon);

    self dome_onWindmillDamage(damage, attacker, direction_vec, point, meansOfDeath, modelName, partName, tagName, iDFlags, weapon);
}
dome_onWindmillDamage(damage, player, direction, point, mod, modelname, partname, tagname, dFlags, weapon)
{
    if (self.destroyed) return; 

    if (mod == "MOD_PROJECTILE" || mod == "MOD_PROJECTILE_SPLASH" || mod == "MOD_GRENADE" || mod == "MOD_GRENADE_SPLASH" || mod == "MOD_EXPLOSIVE")
    {
        self.destroyed = true;
        self scriptModelClearAnim();
        self thread dome_playWindmillExplodeFX();
        direction = vectorNormalize(direction);
        fallPos = (direction[0] * 90, 0, direction[2] * 90);
        self rotateTo(self.angles + fallPos, 3, .05, .25);
        self playSound("hind_helicopter_hit");
        level.dome_windmillList = array_remove(level.dome_windmillList, self);

        if (level.dome_windmillList.size == 0)
        {
            self playSound("new_perk_unlocks");
            triggerBunker = getEnt("aiz_dome_cabinet_trigger_bunker", "targetname");
            triggerDome = getEnt("aiz_dome_cabinet_trigger_dome", "targetname");
            if (isDefined(triggerBunker)) triggerBunker addUsable("dome_eeBunkerCabinet", 50);
            if (isDefined(triggerDome)) triggerDome addUsable("dome_eeDomeCabinet", 50);
            //dome_easterEggStep4();
        }
    }
    else
        self thread dome_watchWindmillDamage();
}
dome_playWindmillExplodeFX()
{
    wait(1.5);

    playFX(level.fx_nuke, self.origin);

    wait(1.3);

    self playSound("hind_helicopter_crash_dist");
}
dome_checkEasterEggStep4_A(t)
{
    if (t.hasBeenActivated) return;

    t.hasBeenActivated = true;
    t.cabinet setModel("icbm_electronic_cabinet2");
    t playSound("switch_auto_lights_on");
    t.time = 0;
    triggerDome = getEnt("aiz_dome_cabinet_trigger_dome", "targetname");

    t thread dome_monitorEasterEggStep4_A(triggerDome);
}

dome_monitorEasterEggStep4_A(triggerDome)
{
    self endon("turned_off");

    while (true)
    {
        if (self.time > 10)
        {
            self.hasBeenActivated = false;
            self.cabinet setModel("icbm_electronic_cabinet2_busted");
            self playSound("switch_auto_lights_off");
            self notify("turned_off");
        }
        else if (triggerDome.hasBeenActivated)
        {
            self playSound("ims_plant");
            self removeUsable();
            return;
        }
        self.time++;

        wait(0.05);
    }
}

dome_checkEasterEggStep4_B(t)//Bunker
{
    if (t.hasBeenActivated) return;

    t.hasBeenActivated = true;
    t.cabinet setModel("icbm_electronic_cabinet2");
    t playSound("switch_auto_lights_on");
    t.time = 0;
    triggerBunker = getEnt("aiz_dome_cabinet_trigger_bunker", "targetname");

    t thread dome_monitorEasterEggStep4_B(triggerBunker);
}
dome_monitorEasterEggStep4_B(triggerBunker)
{
    self endon("turned_off");

    while (true)
    {
        if (self.time > 10)
        {
            self.hasBeenActivated = false;
            self.cabinet setModel("icbm_electronic_cabinet2_busted");
            self playSound("switch_auto_lights_off");
            self notify("turned_off");
        }
        else if (triggerBunker.hasBeenActivated)
        {
            self playSound("ims_plant");
            self removeUsable();
            dome_easterEggReward();
            return;
        }
        self.time++;

        wait(0.05);
    }
}
easterEgg_awardAllPerks()
{
    if (isDefined(self))
    {
        self maps\mp\gametypes\_aiz_bonus_drops::giveAllPerks();
        self.allPerks = true;
        self maps\mp\gametypes\_aiz_hud::scoreMessage(level.gameStrings[327]);
    }
    else
    {
        foreach (player in level.players)
        {
            if (!isDefined(player.isDown)) continue;
            if (!player.isAlive) continue;

            player maps\mp\gametypes\_aiz_bonus_drops::giveAllPerks();
            player.allPerks = true;
            player maps\mp\gametypes\_aiz_hud::scoreMessage(level.gameStrings[327]);
        }

        level.allPerks = true;
    }
}
dome_easterEggReward()
{
    easterEgg_awardAllPerks();

    crate = spawn("script_model", (-92, 2235, -291));
    crate.angles = (0, -3.8, 0);
    crate setModel("com_plasticcase_green_big_us_dirt");
    crateCol = spawnCrate((-92, 2235, -275), (0, -3.8, 0), true, false);
    crate.collision = crateCol;

    weapCrate = spawn("script_model", crate.origin + (0, 0, 30));
    weapCrate.angles = crate.angles;
    weapCrate setModel("com_plasticcase_green_rifle");

    weapon = wallWeapon(weapCrate.origin + (15, 0, 10), weapCrate.angles - (0, 0, 90), "stinger_mp", 0);
    weapon thread dome_watchEasterEggReward();

    level.currentZappers = 1;
    level.weaponModels[level.weaponModels.size] = "weapon_stinger";
    level.weaponNames[level.weaponNames.size] = "stinger_mp";
    level.localizedWeaponNames[level.localizedWeaponModels.size] = "^2Zapper";
}
dome_watchEasterEggReward()
{
    level endon("game_ended");
    self endon("death");
    self endon("weapon_collected");

    while (true)
    {
        if (self.bought)
        {
            playFX(level.fx_disappear, self.origin);
            self removeUsable();
            self notify("weapon_collected");
        }
        
        wait(0.05);
    }
}
//-END DOME-//
//-END EASTER EGGS-//