#include maps\_utility;
#include common_scripts\utility;
#include maps\_zombiemode_utility;

init()
{
	//idk just added it
	level.max_perks = 8;
	
	level.zombiemode_using_marathon_perk = true;
	level.zombiemode_using_divetonuke_perk = true;
	
	//this is show a no textue icon for when getting the perk!(used in dev to not throw errors and to make sure item was removed)
	PrecacheShader( "specialty_marathon_zombies" ); // just a holder, not reall nessary
	PrecacheShader( "specialty_divetonuke_zombies" ); // just a holder, not really nessary
	PrecacheShader( "specialty_quickrevive_zombies_pro" ); //self revive

	//cost

	if ( is_true( level.zombiemode_using_divetonuke_perk ) )
	{
		// set the behavior function
		level.zombiemode_divetonuke_perk_func = ::divetonuke_explode;

		// precache the effect
		level._effect["divetonuke_groundhit"] = loadfx("explosions/fx_default_explosion"); //this needs to be changed(but I mean it works ig)

		// tweakable variables
		set_zombie_var( "zombie_perk_divetonuke_radius", 300 );
		set_zombie_var( "zombie_perk_divetonuke_min_damage", 1000 );
		set_zombie_var( "zombie_perk_divetonuke_max_damage", 10000 );
	}
	
	//Base Maps
	if(level.script == "zombie_theater") //Kino Der Toten
	{
		level thread upon_player_connection();
		level thread perk_machine( (526.04, -496.359, 323.672), (0, 180, 0), "zombie_vending_sleight_on", "Stamin-up",2000 , "specialty_longersprint" ); //top room, on deck near pack room
		level thread perk_machine( (-1177.64, 1543.8, 168.125), (0, -90, 0), "zombie_vending_jugg_on", "PhD",3000 , "specialty_flakjacket" ); //In above ally with the song rock
		level thread perk_machine( (823.641, 1026.56, -15.875), (0, 90, 0), "zombie_vending_revive_on", "Self Revive",8000 , "specialty_selfrevive" ); //In dressing room next to song rock
	}
	else if(level.script == "zombie_pentagon") //"Five"
	{
		level thread upon_player_connection();
		level thread perk_machine( (-676.441, 4016.36, -712.875), (0, 0, 0), "zombie_vending_sleight_on", "Stamin-up",2000 , "specialty_longersprint" ); //In basment in first hallway to the right
		level thread perk_machine( (-1436.95, 4899.64, -712.875), (0, 180, 0), "zombie_vending_jugg_on", "PhD",3000 , "specialty_flakjacket" ); //Basment morge room next to box
		level thread perk_machine( (-255.391, 2052.54, 16.125), (0, -90, 0), "zombie_vending_revive_on", "Self Revive",8000 , "specialty_selfrevive" ); //In first room you can buy, at the end of the hall
	}
	//WaW Maps
	else if(level.script == "zombie_cod5_prototype") //Nacht Der Untoten
	{
		level thread perk_machine( (417.162, 641.311, 144.125), (0, 180, 0), "zombie_vending_sleight_on", "Stamin-up",2000 , "specialty_longersprint" ); //Top Room Near Sniper Buy
		level thread perk_machine( (166.249, 594.359, 145.125), (0, 0, 0), "zombie_vending_jugg_on", "PhD",3000 , "specialty_flakjacket" ); //Top Room By Stairs
		level thread perk_machine( (367.608, 641.641, 1.125), (0, 180, 0), "zombie_vending_revive_on", "Self Revive",8000 , "specialty_selfrevive" ); //
	}
	else if(level.script == "zombie_cod5_asylum") //Verruckt
	{
		level thread perk_machine( (218.832, -695.901, 226.125), (0, 0, 0), "zombie_vending_sleight_on", "Stamin-up",2000 , "specialty_longersprint" ); //Bathroom Near Song Toilet
		level thread perk_machine( (-762.677, 1.64091, 226.125), (0, 180, 0), "zombie_vending_jugg_on", "PhD",3000 , "specialty_flakjacket" ); //Kitchin
		level thread perk_machine( (9535.22, 474.641, -660.875), (0, 90, 0), "zombie_vending_revive_on", "Self Revive",8000 , "specialty_selfrevive" ); //
	}
	//else if(level.script == "zombie_cod5_sumpf") //Shi No Numa (idk this map just doesnt listn to angles, or the if for this map and Nacht)
	//{
		//level thread perk_machine( (10714.4, 720.226, -660.738), (0, 90, 0), "zombie_vending_sleight_on", "Stamin-up",2000 , "specialty_longersprint" ); //Bottem Of Spawn Room In Back Going to The Full Swamp Room/Zip Line Room
		//level thread perk_machine( (10360.6, 1159.64, -528.875), (0, 180, 0), "zombie_vending_jugg_on", "PhD",3000 , "specialty_flakjacket" ); //	Top Door Of Spawn Up the Stairs Or Behind Box Spawn
		//level thread perk_machine( (9535.22, 474.641, -660.875), (0, 0, 0), "zombie_vending_revive_on", "Self Revive",8000 , "specialty_selfrevive" ); //
	//}
	else if(level.script == "zombie_cod5_factory") //Der Riese
	{
		level thread perk_machine( (618.359, -2020.91, 88.125), (0, -90, 0), "zombie_vending_sleight_on", "Stamin-up",2000 , "specialty_longersprint" ); //Behind Big Metal Doot By Power, Directly To The Left
		level thread perk_machine( (-696.042, -1048.64, 199.125), (0, 0, 0), "zombie_vending_jugg_on", "PhD",3000 , "specialty_flakjacket" ); //Up Stairs Above Tompson
		level thread perk_machine( (-1165.7, -1464.36, 199.125), (0, 180, 0), "zombie_vending_revive_on", "Self Revive",8000 , "specialty_selfrevive" ); //
	}
	//DlC Maps (Custom Perks Only)
	else if(level.script == "zombie_cosmodrome") //Ascension
	{
		//level thread perk_machine( (-255.391, 2052.54, 16.125), (0, 0, 0), "zombie_vending_revive_on", "Self Revive",8000 , "specialty_selfrevive" );
	}
	else if(level.script == "zombie_coast") //Call of The Dead
	{
		//level thread perk_machine( (-255.391, 2052.54, 16.125), (0, 0, 0), "zombie_vending_revive_on", "Self Revive",8000 , "specialty_selfrevive" ); 
	}
	else if(level.script == "zombie_temple") //Shangri La
	{
		//level thread perk_machine( (-255.391, 2052.54, 16.125), (0, 0, 0), "zombie_vending_revive_on", "Self Revive",8000 , "specialty_selfrevive" ); 
	}
	else if(level.script == "zombie_moon") //Moon
	{
		//level thread perk_machine( (-255.391, 2052.54, 16.125), (0, 0, 0), "zombie_vending_revive_on", "Self Revive",8000 , "specialty_selfrevive" ); 
	}
}

upon_player_connection()
{
	for(;;)
	{
		level waittill("connecting", player);
		player.specialty_selfrevive = false;
		player.lives_given = 0;
	}
}

// this is needed for PhD to work, and makes it tweakable
divetonuke_explode( attacker, origin )
{
	// tweakable vars
	radius = level.zombie_vars["zombie_perk_divetonuke_radius"];
	min_damage = level.zombie_vars["zombie_perk_divetonuke_min_damage"];
	max_damage = level.zombie_vars["zombie_perk_divetonuke_max_damage"];

	// radius damage
	RadiusDamage( origin, radius, max_damage, min_damage, attacker, "MOD_GRENADE_SPLASH" );

	// play fx
	PlayFx( level._effect["divetonuke_groundhit"], origin );

	// play sound
	attacker playsound("wpn_grenade_explode"); //this needs to be changed
	
	attacker SetClientFlag( level._ZOMBIE_PLAYER_FLAG_DIVE2NUKE_VISION );
	wait_network_frame();
	wait_network_frame();
	attacker ClearClientFlag( level._ZOMBIE_PLAYER_FLAG_DIVE2NUKE_VISION );
}
	
perk_machine( origin, angles, model_name, perk_name, cost, perk) 
{
    collision = spawn("script_model", ( (origin[0]), (origin[1]), (origin[2] + 50)) ); 
    collision setModel("collision_geo_32x32x128");
    collision rotateTo(angles, .1);
    collision hide();
    vender_perk = spawn( "script_model", origin );
    vender_perk setModel( model_name );
    vender_perk rotateTo(angles, .1);
    trig = spawn("trigger_radius", origin, 1, 25, 25);
	if (level.script == "zombie_cod5_prototype" || level.script == "zombie_cod5_sumpf"){
	vender_perk thread maps\_zombiemode_perks::perk_fx( "revive_light" );
    trig SetCursorHint( "HINT_NOICON" );
    trig setHintString("Press ^3&&1^7 to Buy  "+ perk_name +" [Cost: "+ cost +"]");
	}
	else{
    trig SetCursorHint( "HINT_NOICON" ); 
    trig setHintString("You must turn on the power first!"); 
    level waittill("juggernog_on"); 
    vender_perk thread maps\_zombiemode_perks::perk_fx( "revive_light" );
    trig SetCursorHint( "HINT_NOICON" );
    trig setHintString("Press ^3&&1^7 to Buy  "+ perk_name +" [Cost: "+ cost +"]"); 
	}
    level waittill("notifier_1");
	if (perk == "specialty_selfrevive"){
		trig thread revive_think(perk, cost);
	}
	else{
	trig thread perk_think(perk, cost);
	}
}


revive_think(perk, cost)
{	
    for(;;) {
        self waittill( "trigger", who );
            if( who UseButtonPressed() && who.score >= cost && who.specialty_selfrevive == false && who.lives_given <= 2) { //the lives thing needs to be fixed
                while( who UseButtonPressed() )
                    wait 0.05;
                who maps\_zombiemode_score::minus_to_player_score( cost ); //taking points
                who thread do_drink_perk(perk);
				wait 2.5;
            }
            else if( who UseButtonPressed() && !( who.score >= cost ) ) {
                while( who UseButtonPressed() )
                    wait 0.05;
                play_sound_on_ent( "no_purchase" );
                who maps\_zombiemode_audio::create_and_play_dialog( "general", "no_money", undefined, 1 );    
            }
            wait 0.05;
    } 
}

perk_think(perk, cost)
{	
    for(;;) {
        self waittill( "trigger", who );
            if( who UseButtonPressed() && who.score >= cost && !who hasperk(perk)) {
                while( who UseButtonPressed() )
                    wait 0.05;
                who maps\_zombiemode_score::minus_to_player_score( cost ); //taking points
                who thread do_drink_perk(perk);
				wait 2.5;
            }
            else if( who UseButtonPressed() && !( who.score >= cost ) ) {
                while( who UseButtonPressed() )
                    wait 0.05;
                play_sound_on_ent( "no_purchase" );
                who maps\_zombiemode_audio::create_and_play_dialog( "general", "no_money", undefined, 1 );    
            }
            wait 0.05;
    } 
}

do_drink_perk(perk) //this is a mix between my perk giving and pistakillas
{
	self DisableOffhandWeapons();
	self DisableWeaponCycling();

	my_gun = self getCurrentWeapon();
	perk_bottle = "";
	if(perk == "specialty_longersprint")
	{
		perk_bottle = "zombie_perk_bottle_jugg"; //bottle to drink
	}
	else if(perk == "specialty_flakjacket")
	{
		perk_bottle = "zombie_perk_bottle_revive"; //bottle to drink
	}
	else if(perk == "specialty_selfrevive")
	{
		perk_bottle = "zombie_perk_bottle_revive"; //bottle to drink
	}

	self GiveWeapon( perk_bottle );
	self SwitchToWeapon( perk_bottle );

	self waittill( "weapon_change_complete" );

	self EnableOffhandWeapons();
	self EnableWeaponCycling();

	self TakeWeapon( perk_bottle );
	self SwitchToWeapon( my_gun );

	self setblur( 4, 0.1 );
	wait(0.1);
	self setblur(0, 0.1);
	
	self maps\_zombiemode_perks::give_perk( perk ); //add the perk to player
	if(perk == "specialty_longersprint")
	{
		self.perk_hud["specialty_longersprint"].color = (255,165,0); //change color of the missing asset
		hud = self.perk_hud["specialty_longersprint"];
		hud SetShader( "specialty_fastreload_zombies_pro", 28, 28 );
	}
	else if(perk == "specialty_flakjacket")
	{
		self.perk_hud["specialty_flakjacket"].color = (128,0,128); //change color of the missing asset
		hud = self.perk_hud["specialty_flakjacket"];
		hud SetShader( "specialty_juggernaut_zombies_pro", 28, 28 );
	}
	else if(perk == "specialty_selfrevive")
	{
		self.specialty_selfrevive = true;
		self.lives_given++;
		hud = self.perk_hud["specialty_selfrevive"];
		hud SetShader( "specialty_quickrevive_zombies_pro", 28, 28 );
		self waittill("player_downed");
		self.specialty_selfrevive = false;
		wait 3;
		self maps\_laststand::revive_force_revive(self);
	}
}