if (global.martian_alarmed == 1)
{
	if (sprite_index != spr_guard_outpostthrow)
		sprite_index = spr_guard_outpost;
}
if (place_meeting(x, y, obj_player) && countdown <= 0 && sprite_index == spr_guard_outpost)
	sprite_index = spr_guard_outpostthrow;
if (sprite_index == spr_guard_outpostthrow && animation_end())
{
	instance_create(x, y - 128, obj_thundercloudprojectile);
	sprite_index = spr_guard_outpost;
	countdown = 100;
}
if (countdown >= 0 && sprite_index != spr_guard_outpostthrow)
	countdown -= 0.2;
