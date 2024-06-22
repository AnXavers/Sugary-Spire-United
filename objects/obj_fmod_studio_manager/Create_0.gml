

//Starting FMOD 
var _max_channels = 1024
var _flags_core = FMOD_INIT.NORMAL;
var _flags_studio = FMOD_STUDIO_INIT.LIVEUPDATE;
	
//#macro USE_DEBUG_CALLBACKS true // Should debugging be initialised?
	
//if (USE_DEBUG_CALLBACKS)
	//fmod_debug_initialize(FMOD_DEBUG_FLAGS.LEVEL_LOG, FMOD_DEBUG_MODE.CALLBACK);
	
fmod_studio_system_create();
show_debug_message("fmod_studio_system_create: " + string(fmod_last_result()));
	
fmod_studio_system_init(_max_channels, _flags_studio, _flags_core);
show_debug_message("fmod_studio_system_init: " + string(fmod_last_result()));
	
fmod_main_system = fmod_studio_system_get_core_system();
		
master_bank = fmod_studio_system_load_bank_file(fmod_path_bundle("gamedata\\sound\\Desktop\\Master.bank"), FMOD_STUDIO_LOAD_BANK.NORMAL);
master_strings_bank = fmod_studio_system_load_bank_file(fmod_path_bundle("gamedata\\sound\\Desktop\\Master.strings.bank"), FMOD_STUDIO_LOAD_BANK.NORMAL)
		
music_bank = fmod_studio_system_load_bank_file(fmod_path_bundle("gamedata\\sound\\Desktop\\Music.bank"), FMOD_STUDIO_LOAD_BANK.NORMAL)
sfx_bank = fmod_studio_system_load_bank_file(fmod_path_bundle("gamedata\\sound\\Desktop\\SFX.bank"), FMOD_STUDIO_LOAD_BANK.NORMAL)

music_bus = fmod_studio_system_get_bus("bus:/music");
sfx_bus = fmod_studio_system_get_bus("bus:/sfx");


//That fucking listener that I HATE
fmod_studio_system_set_num_listeners(0)

listener_weight = 0;

listener_attributes = {
	position: {x: 0, y: 0, z: 0},
	velocity: {x:0, y:0, z:0},
	forward: {x:0, y:0, z:1.0},
	up: {x:0, y:1.0, z:0},
}

fmod_studio_system_set_listener_attributes(0, listener_attributes);
fmod_studio_system_set_listener_weight(0, listener_weight);

fmod_ready = false;
alarm[0] = 15;

#region // Music macros
	#macro mu_titlescreen "event:/music/title"
	#macro mu_pause "event:/music/pause"
	#macro mu_credits "event:/music/credits"
	#macro mu_modifiers "event:/music/modifiers"
	
	// Hub
	#macro mu_spire "event:/music/spire"
	#macro mu_tower "event:/music/tower"
	
	// Levelstructure
	#macro mu_escape "event:/music/level_structure/escape"
	#macro mu_escape_secret "event:/music/level_structure/escape_secret"
	#macro mu_getaway "event:/music/level_structure/getaway"
	#macro mu_nearharry "event:/music/level_structure/gummyharry"
	#macro mu_rankscreen "event:/music/level_structure/ranks"
	
	// Boss
	#macro mu_painter "event:/music/boss/painter"
	#macro mu_coneball "event:/music/boss/coneball"
	
	// Crunchy Construction
	#macro mu_entryway_title "event:/music/levels/crunchy_construction/wafer_title"
	#macro mu_entryway "event:/music/levels/crunchy_construction/wafer"
	#macro mu_entryway_secret "event:/music/levels/crunchy_construction/wafer_secret"
	
	// Cottontown
	#macro mu_steamy_title "event:/music/levels/cottontown/steamy_title"
	#macro mu_steamy "event:/music/levels/cottontown/steamy"
	#macro mu_steamy_secret "event:/music/levels/cottontown/steamy"
	
	// Molasses Swamp
	#macro mu_swamp_title "event:/music/levels/molasses_swamp/swamp_title"
	#macro mu_swamp "event:/music/levels/molasses_swamp/swamp"
	#macro mu_swamp_secret "event:/music/levels/molasses_swamp/swamp_secret"
	
	// Sugarshack Mines
	#macro mu_mines_title "event:/music/levels/sugarshack_mines/mines_title"
	#macro mu_mines "event:/music/levels/sugarshack_mines/mines"
	#macro mu_mines_secret "event:/music/levels/sugarshack_mines/mines_secret"
	
	// Mt. Fudgetop
	#macro mu_fudge "event:/music/levels/mt_fudgetop/fudge"
	#macro mu_fudge_secret "event:/music/levels/mt_fudgetop/fudge_secret"
	
	// Danceoff
	#macro mu_dance "event:/music/levels/danceoff/dance"
	#macro mu_dance_secret "event:/music/levels/danceoff/dance_secret"
	
	// Chocoa Cafe
	#macro mu_estate "event:/music/levels/chocoa_cafe/estate"
	#macro mu_estate_secret "event:/music/levels/chocoa_cafe/estate_secret"
	
	// Sting Operation 
	#macro mu_bee_title "event:/music/levels/sting_operation/bee_title"
	#macro mu_bee "event:/music/levels/sting_operation/bee"
	
	// Sucrose Snowstorm
	#macro mu_sucrose_title "event:/music/levels/sucrose_snowstorm/sucrose_title"
	#macro mu_sucrose "event:/music/levels/sucrose_snowstorm/sucrose"
	#macro mu_sucrose_secret "event:/music/levels/sucrose_snowstorm/sucrose_secret"
	
	// Other
	#macro mu_tutorial "event:/music/levels/other/tutorial"
	#macro mu_martian "event:/music/levels/other/martian"
	#macro mu_exitway "event:/music/levels/other/waferdim"
	#macro mu_stormy "event:/music/levels/other/stormy"
	#macro mu_secretworld "event:/music/levels/other/secretworld"
#endregion

#region // SFX Macros

#endregion