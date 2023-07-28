setID = true;
base_x = xstart;
sprite_index = spr_spamton;
image_speed = 0.35;
image_xscale = 1;
depth = 10;
sin_add = 0.05;
sin_mag = 5;
talk_condition = function()
{
	return false;
};
no_func = function()
{
	instance_destroy(global.cutsceneManager);
	instance_destroy(obj_cutsceneManager);
	cutscene_create([cutscene_start_player, [cutscene_move_actor, "spamton", obj_player.x + 90, y, 4], [cutscene_wait, 30], [cutscene_do_dialog, [create_dialogue("* WHAT!??!                 WHAT!!T??? ARE YUOU [$#@!] WITH ME ??//", -4, 26), create_dialogue("* NO???? [Nil]? [Nitric Oxide]!??!?!?", undefined, 26), create_dialogue("* WHY YOU... YOU CH34T ! Ill [Show you something you wont forget!]]", undefined, 26, function()
	{
		sprite_index = spr_spamtonlaugh_glitch;
	}), create_dialogue("* [50% off! Pain and Suffering, Buy Now!]] GUARANTEEEDD! [30 YEAR lower LIFE EXPACTANCY compared to SIMILAR PRODUCTz$]", undefined, 26), create_dialogue("* SEE YA IN HE [Double Hockeysticks] K!d !!!", undefined, 26, function()
	{
		instance_create(0, 0, obj_memLeak);
	})], false], cutscene_wait_dialog, cutscene_end_player]);
	cutscene_declare_actor(id, "spamton");
};
yes_func = function()
{
	instance_destroy(global.cutsceneManager);
	instance_destroy(obj_cutsceneManager);
	cutscene_create([cutscene_start_player, [cutscene_move_actor, "spamton", obj_player.x + 90, y, 4]]);
	cutscene_declare_actor(id, "spamton");
};
dialog = [create_dialogue("* [[Belive it or not ! ]] I NEED YOUR(e) [[CCharity]", -4, 26, function()
{
	sprite_index = spr_spamtonup;
}), create_dialogue("* IVE Never SEEN A [[Home and Furnishing for Sale]] LIKE THIS BEFORE!", -4, 26, -4), create_dialogue("* MY CUSTOMER$  [Get in line while Supplies Last !] AND MY Thay R [[Patiently Waiting] FOR [[Lifetime Warranty!] ", -4, 26, -4), create_dialogue("* IM THE BEST IN THE BIZ!! [[Great Dealz$ ]] AT MY [ Stompign Grounds] AND You COULD WIN . !", -4, 26, function()
{
	sprite_index = spr_spamtonpray;
}), create_dialogue("* SURELY THER EIS [[A way out.]&ILL PAY YOU BACK... [[Big Time!]]", -4, 26, function()
{
	sin_mag = 0;
	sprite_index = spr_spamton;
	queue_choices(choices, "Help Spamton?");
})];
dialog2 = [create_dialogue("* YEs! YES! [[I've been waiting for this all my life...]] FINALLY!", -4, 26, function()
{
	image_speed += 0.75;
	image_xscale *= 1.2;
}), create_dialogue("* YOU DID IT [[Big Shot]]!", -4, 26, function()
{
	image_speed += 0.75;
	image_xscale *= 1.2;
}), create_dialogue("* ONCE I RETURN I [[Promise You Unbelievable Deals!]] AND [[Buy one Get One Free]]!", -4, 26, function()
{
	image_speed += 0.75;
	image_xscale *= 1.2;
}), create_dialogue("* SEE YA SOON ... KId!!", -4, 26)];
choices = [create_choice("YES", yes_func), create_choice("NO (CAUSES MEMORY LEAK)", no_func)];
step_event = function()
{
	if (state == 1 && !instance_exists(obj_cutsceneManager) && obj_player.x >= 1504)
	{
		state = 110;
		cutscene_create([cutscene_start_player, [cutscene_wait, 40], [cutscene_with_actor, "spamton", function()
		{
			sin_mag = 0;
			instance_create(x, y - 70, obj_noticeeffect);
			image_xscale = -1;
		}], [cutscene_wait, 10], [cutscene_with_actor, "spamton", function()
		{
			sin_mag = 4;
			sin_set = 0;
			sin_add = 0.2;
			sprite_index = spr_spamtonup;
		}], [cutscene_do_dialog, [create_dialogue("* WOAH!!!1 ISS      THAT 4....", undefined, 26), create_dialogue("* A(n) LI#nl", undefined, 26, function()
		{
			obj_dialogue.drawspd = 1;
			sin_add = 0.4;
			sprite_index = spr_spamtonpray;
		}), create_dialogue("* ONE OF TH #nl", undefined, 26, function()
		{
			obj_dialogue.drawspd = 2;
			sin_add = 0.6;
			sprite_index = spr_spamtonwalk;
		}), create_dialogue("* [[What a Deal!!!]#nl", undefined, 26, function()
		{
			obj_dialogue.drawspd = 3;
			sin_add = 1;
			sprite_index = spr_spamtongrab;
		}), create_dialogue("* I KN0 WHAT U Nee#nl", undefined, 26, function()
		{
			sprite_index = spr_spamtonlaugh_glitch;
		}), create_dialogue("* [[The Law of Equivalent Exchane]] PROCLAI #nl", undefined, 26), create_dialogue("* You're one of those... lig#nl", undefined, 26, function()
		{
			obj_dialogue.drawspd = 0.5;
			sin_mag = 4;
			sin_set = 0;
			sin_add = 0.1;
			sprite_index = spr_spamton;
		}), create_dialogue("* YOYU!!! [[One - on - One] CONTAC.! YOUV GOT to HELP ME ", undefined, 26)], false], cutscene_wait_dialog, [cutscene_move_actor, "spamton", obj_player.x + 70, y, 4], [cutscene_with_actor, "spamton", function()
		{
			sin_mag = 2;
			sin_add = 0.5;
			sprite_index = spr_spamtongrab;
		}], [cutscene_do_dialog, dialog, false], cutscene_wait_dialog]);
		cutscene_declare_actor(id, "spamton");
	}
	if (can_collide)
		scr_collision();
};
