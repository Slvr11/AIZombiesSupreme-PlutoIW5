#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include AImod\_OtherFunctions;

PrecacheAghan()
{
	if(getDvar("mapname") == "mp_afghan")
	{
		precacheModel("727_overhead_door");
		precacheModel("foliage_red_pine_med");
		precacheModel("com_fire_extinguisher_des");
		precacheModel("food_snacks_cherrypie01");
		precacheModel("food_snacks_chewers01");
		precacheModel("food_snacks_chips01");
		precacheModel("food_snacks_cookies01");
		precacheModel("food_snacks_donuts01");
		precacheModel("food_snacks_gumbox01");
		precacheModel("food_snacks_beefjerky01");
		precacheModel("food_snacks_krustbar01");
		precacheModel("food_snacks_peanuts01");
		precacheModel("com_cardboardboxshortopen_2");
		precacheModel("fx_paper_sheet02");
		precacheModel("fx_paper_sheet01");
		precacheModel("com_copypaper_box_lid");
		precacheModel("com_barrel_piece2");
		precacheModel("com_barrel_piece");
		precacheModel("727_coach_seat01");
		precacheModel("727_seats_row_left");
		precacheModel("727_seats_row_right");
		precacheModel("machinery_727_tire01");
		precacheModel("c130_engine");
		precacheModel("c130_propeller");
		precacheModel("foliage_cod5_tree_pine05_large_animated");
		precacheModel("foliage_pacific_bushtree01_animated");
		precacheModel("foliage_pacific_bushtree01_halfsize_animated");
		precacheModel("foliage_pacific_bushtree02_halfsize_animated");
		precacheModel("foliage_cod5_tree_jungle_02_animated");
		precacheModel("foliage_pacific_bushtree02_animated");
		precacheModel("foliage_desertbrush_1_animated");
		precacheModel("foliage_shrub_desertspikey");
		precacheModel("foliage_shrub_greenfan");
		precacheModel("foliage_red_pine_med");
		precacheModel("foliage_tree_pine_xl_b");
		precacheModel("foliage_cod5_tree_pine05_sm");
	}
}

Afghan2Init()
{
	SpawnModel((9373,3142,105),(0,265,0),"foliage_cod5_tree_pine05_large_animated");
}

SpawnModel(pos, angle, model)
{
	block = spawn("script_model", pos );
	block setModel(model);
	block.angles = angle;
	block Solid();
}

WaypointInit()
{
}