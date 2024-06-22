global.music = {
	secret_event_instance: noone,
	event_instance: noone,
	pillar_instance: noone,
    
	pillar_dist: 10,
	pitch: 1
}

start_bg_escape = false;
secret = false;
music_map = ds_map_create();

// Misc
add_music(realtitlescreen, mu_titlescreen, mu_titlescreen);

add_music([hub_outside, hub_basement, hub_w1, hub_w2, hub_w3, hub_shop1, hub_shop2, hub_shop3], mu_spire, mu_spire, function()
	{
		var _state = 0;
		switch (room)
		{
			case hub_shop1:
				_state = 1;
				break;
				
			case hub_shop2:
				_state = 2;
				break;
				
			case hub_shop3:
				_state = 3;
				break;
			
			case hub_w1:
				_state = 5;
				break;
			
			case hub_w2:
				_state = 6;
				break;
				
			case hub_w3:
				_state = 7;
				break;
				
			case hub_basement:
				_state = 8;
				break;
				
		}
		
		fmod_studio_event_instance_set_parameter_by_name(global.music.event_instance, "state", _state)
	}
);

// Spire W1
add_music([entryway_1, entryway_1_old, entryway_1_new, entryway_1_custom], mu_entryway, mu_entryway_secret)

add_music([steamy_1, steamy_1_old, steamy_1_new, steamy_1_custom, steamy_7, steamy_7_old, steamy_7_new, steamy_7_custom], mu_steamy, mu_steamy_secret, function() {
	var _val = 0;
	if (string_ends_with(room_get_name(room), "custom"))
		_val = 2;
	
	fmod_studio_event_instance_set_parameter_by_name(global.music.event_instance, "state", _val);
});
add_music([steamy_8, steamy_8_old, steamy_8_new, steamy_8_custom], mu_steamy, mu_steamy_secret, function() {
	fmod_studio_event_instance_set_parameter_by_name(global.music.event_instance, "state", 1)
});

add_music([molasses_1, molasses_1_old, molasses_6, molasses_6_old], mu_swamp, mu_swamp_secret)
add_music([molasses_6b, molasses_6b_old], mu_swamp, mu_swamp_secret, function() {
	fmod_studio_event_instance_set_parameter_by_name(global.music.event_instance, "state", 1)
});

add_music([mines_1, mines_1_old, mineshaft_1, mines_4, mines_4_old], mu_mines, mu_mines_secret)
add_music([mines_5, mines_5_old], mu_mines, mu_mines_secret, function(){
	fmod_studio_event_instance_set_parameter_by_name(global.music.event_instance, "state", 1)
});

// Spire W2
add_music([mountain_1, mountain_7], mu_fudge, mu_fudge_secret)
add_music(mountain_8, mu_fudge, mu_fudge_secret, function() {
	fmod_studio_event_instance_set_parameter_by_name(global.music.event_instance, "state", 1)
});

add_music([dance_1, dance_1_old, dance_8, dance_8_old], mu_dance, mu_dance_secret, function() {
	fmod_studio_event_instance_set_parameter_by_name(global.music.event_instance, "state", 2 * (room == dance_1_old))
});
add_music([dance_9, dance_9_old], mu_dance, mu_dance_secret, function(){
	fmod_studio_event_instance_set_parameter_by_name(global.music.event_instance, "state", 1)
})

add_music([estate_1, estate_1_old, estate_1_new, estate_6, estate_6_old, estate_6_new], mu_estate, mu_estate_secret, function() {
	fmod_studio_event_instance_set_parameter_by_name(global.music.event_instance, "state", 2 * (room == estate_1_old))
});
add_music(estate_dog, mu_estate, mu_estate_secret, function() {
	fmod_studio_event_instance_set_parameter_by_name(global.music.event_instance, "state", 1)
})

add_music([bee_1, bee_1_old], mu_bee, mu_estate_secret, function(){
	fmod_studio_event_instance_set_parameter_by_name(global.music.event_instance, "state", 1 * (room == bee_1_old))
});

// Spire W3
add_music(sucrose_1, mu_sucrose, mu_sucrose_secret);

add_music([martian_1, martian_3], mu_martian, mu_estate_secret);
add_music(martian_4, mu_martian, mu_estate_secret, function() {
	fmod_studio_event_instance_set_parameter_by_name(global.music.event_instance, "state", 1)
});

// Spire FEX
add_music(exitway_1, mu_exitway, mu_estate_secret);
add_music(stormy_1, mu_stormy, mu_estate_secret);

// Other
add_music([tutorial_1, tutorial_1_old], mu_tutorial, mu_tutorial, function() {
	fmod_studio_event_instance_set_parameter_by_name(global.music.event_instance, "state", 1 * (room == tutorial_1))
});

add_music(secrets_start, mu_secretworld, mu_secretworld);