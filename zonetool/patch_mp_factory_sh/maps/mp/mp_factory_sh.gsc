#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_class;

// Coded By ZECxR3ap3r
// Edited by Slvr99

main() {
	maps\mp\mp_factory_sh_fx::main();
	maps\createart\mp_factory_sh_art::main();
	maps\createfx\mp_factory_sh_fx::main();
	maps\mp\_load::main();

	game[ "attackers" ] = "allies";
	game[ "defenders" ] = "axis";

	ambientPlay ( "ambient_mp_rural" );

	setdvar( "compassmaxrange", "2100" );
	maps\mp\_compass::setupMiniMap( "compass_map_mp_factory_sh" );

    level.jugg_fx = loadfx("zombie/zm_perk_jugg_fx");
    level.speed_fx = loadfx("zombie/zm_perk_speed_fx");
    level.dtap_fx = loadfx("zombie/zm_perk_doubletap_fx");
    level.revive_fx = loadfx("zombie/zm_perk_revive_fx");

	level thread cyborg_think();
	level thread perk_jingles();
	level thread ee_main();

	// flashbacks
	exploder(901);
	exploder(902);
	exploder(903);
	exploder(904);
	// mainframe steam
	exploder(106);
	// mainframe
	exploder(500);
	// teleporter middle
	exploder(301);
	// teleporter right
	exploder(401);
	// teleporter tv room
	exploder(201);
	// teleporter lights
	exploder(202);
	exploder(302);
	exploder(402);
}

ee_main() {
	ent = spawn("script_model", (432.647, 1955.56, 115));
	ent.angles = (0, 45, 0);
	ent setmodel("codo_zombie_zapper_wall_control");
	ent setcandamage(1);

	ent waittill("damage");

	iprintlnbold("Ported By ^5ZECxR3ap3r"); // if you change this your a son of a bitch :)
	wait(2);
	iprintlnbold("Edited By ^2Slvr99"); // if you change this you're* a son of a bitch also :)
}

perk_jingles() {
	// Quick Revive
	quick_machine = getent("vending_revive", "targetname");
	if(isdefined(quick_machine)) {
		quick_machine thread play_perk_jingle("quick_song");
        fx = spawnfx(level.revive_fx, quick_machine.origin, anglestoforward(quick_machine.angles));
        triggerfx(fx);
    }

	// Double Tab
	double_tab = getent("vending_doubletap", "targetname");
	if(isdefined(double_tab)) {
		double_tab thread play_perk_jingle("double_song");
        fx = spawnfx(level.dtap_fx, double_tab.origin, anglestoforward(double_tab.angles));
        triggerfx(fx);
    }

	// juggernog
	jugg_machine = getent("vending_jugg", "targetname");
	if(isdefined(jugg_machine)) {
		jugg_machine thread play_perk_jingle("jugg_song");
        fx = spawnfx(level.jugg_fx, jugg_machine.origin, anglestoforward(jugg_machine.angles));
        triggerfx(fx);
    }

	// Speed Cola
	speed_cola = getent("vending_sleight", "targetname");
	if(isdefined(speed_cola)) {
		speed_cola thread play_perk_jingle("speed_song");
        fx = spawnfx(level.speed_fx, speed_cola.origin, anglestoforward(speed_cola.angles));
        triggerfx(fx);
    }
}

play_perk_jingle(alias) {
	while(isdefined(self)) {
		wait randomintrange(30, 45);
		self playsound(alias);
	}
}

cyborg_think() {
	cyborg = getentarray("cyborg_ent", "targetname");

	if(isdefined(cyborg[0]))
		cyborg[0] thread handle_movement(cyborg[1]);

	broken_cyborg = getentarray("cyborg_broken", "targetname");

	if(isdefined(broken_cyborg[0]))
		broken_cyborg[0] thread handle_movement_broken(broken_cyborg[1], "ent_broken_start");

	broken_cyborg = getentarray("cyborg_broken1", "targetname");

	if(isdefined(broken_cyborg[0]))
		broken_cyborg[0] thread handle_movement_broken(broken_cyborg[1], "ent_broken_start1");
}

handle_movement_broken(holder, targy) {
	start = getent(targy, "targetname");
	end = getent(start.target, "targetname");

	self playloopsound("emi_portal_lp_01");

	self.origin = start.origin;
	holder.origin = start.origin;

	while(1) {
		self moveto(end.origin, 1);
		holder moveto(end.origin, 1);

		wait randomintrange(1, 5);

		self moveto(start.origin, 1);
		holder moveto(start.origin, 1);

		wait randomintrange(1, 5);
	}
}

handle_movement(holder) {
	start = getent("cyborg_start", "targetname");

	self playloopsound("emi_portal_lp_01");

	while(1) {
		self.origin = start.origin;
		holder.origin = start.origin;

		ent = getent(start.target, "targetname");
		self moveto(ent.origin, 3);
		holder moveto(ent.origin, 3);
		wait 5;
		ent = getent(ent.target, "targetname");
		self moveto(ent.origin, 4);
		holder moveto(ent.origin, 4);
		wait 5;
		ent = getent(ent.target, "targetname");
		self moveto(ent.origin, 3);
		holder moveto(ent.origin, 3);
		wait 5;
	}
}