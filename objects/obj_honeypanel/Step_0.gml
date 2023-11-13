if (active == 1 && obj_player.state != states.rupertjump && sprite_index != spr_honeypanel_regen)
	sprite_index = spr_honeypanel;
if (sprite_index == spr_honeypanel_dissapear && animation_end())
	sprite_index = spr_honeypanel_deactive;
if (sprite_index == spr_honeypanel_regen && animation_end())
	sprite_index = spr_honeypanel;
