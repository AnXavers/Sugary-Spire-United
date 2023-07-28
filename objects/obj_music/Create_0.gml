global.music_map = ds_map_create();
global.secret_room = false;
global.secretmusic = -4;
function add_music(argument0, argument1, argument2, argument3, argument4 = undefined)
{
	var b = 
	{
		music: argument1,
		secret_music: argument2,
		continuous: argument3,
		my_func: argument4
	};
	ds_map_set(global.music_map, argument0, b);
}
museffect = 0;
pausedmusic = 0;
prevmuID = -4;
target_gain = 1;
contTrack_pos = 0;
GummyBear = false;
music = undefined;
escapemusic = -4;
default_escapemusic = mu_escape;
musicGain = 1;
force_continuous = false;
unforce_continuous = false;
ignore_change = false;
hard_force = false;
musicfadein = 0;
room_details = 
{
	music: -4,
	secret_music: -4,
	continuous: false,
	my_func: undefined
};
add_music(rm_disclaimer, mu_gummyharry, mu_painter, false);
add_music(rm_introVideo, -4, mu_painter, false);
add_music(devroom, mu_what, mu_painter, false);
add_music(rm_missing, mu_void, mu_painter, false);
add_music(realtitlescreen, mu_title, mu_painter, false);
add_music(hub_w1, mu_hubw1, mu_painter, true);
add_music(hub_w2, mu_hubw2, mu_painter, true);
add_music(rm_credits, mu_credits, mu_painter, false);
add_music(tutorial_1, mu_tutorial, mu_painter, false);
add_music(entryway_1, mu_waffle, mu_wafflesecret, false);
add_music(steamy_1, mu_steamy, mu_steamysecret, false);
add_music(steamy_7, mu_steamy, mu_steamysecret, true);
add_music(steamy_8, mu_steamyinner, mu_steamysecret, true);
add_music(molasses_1, mu_swamp1, mu_swampsecret, false);
add_music(molasses_6, mu_swamp1, mu_swampsecret, true);
add_music(molasses_6b, mu_swamp2, mu_swampsecret, true);
add_music(mines_1, mu_mineshaft1, mu_minessecret, false, function()
{
	if (global.minesProgress && obj_player.state == 61)
		return 99;
	else if (global.minesProgress)
		return 184;
	else
		return 39;
});
add_music(mines_6, mu_mineshaft2, mu_minessecret, false);
add_music(mineshaft_1, mu_mineshaft1, mu_minessecret, false);
add_music(mountain_intro, mu_mountain1, mu_mountainsecret, false);
add_music(mountain_5, mu_mountain1, mu_mountainsecret, true);
add_music(mountain_6, mu_mountain2, mu_mountainsecret, true);
add_music(dance_1, mu_dance2, mu_dancesecret, false);
add_music(dance_8, mu_dance2, mu_dancesecret, true);
add_music(dance_9, mu_dance, mu_dancesecret, true);
add_music(sucrose_1, mu_sucrose, mu_sucrosesecret, false);
add_music(estate_1, mu_estate, mu_estatesecret, false);
add_music(estate_6, mu_estate, mu_estatesecret, true);
add_music(238, mu_gummyharry, mu_estatesecret, true);
add_music(bee_1, mu_martian, mu_what, false);
audio_sound_loop_start(mu_waffle, 34.9);
audio_sound_loop_end(mu_waffle, 218.18);
audio_sound_loop_start(mu_steamy, 8);
audio_sound_loop_end(mu_steamy, 144);
