speaking = place_meeting(x, y, obj_player);
sprite_index = speaking ? speak : idle;
mytex_x -= 0.5;
mytex_x %= sprite_get_width(mytex);
mytex_y = wave(-5, 5, 5, 20);
propdex += 0.35;
propdex %= 3;
with (inst_6DA06790)
{
	if (instance_exists(obj_waterfaucet) && obj_waterfaucet.sprite_index == spr_onoffswitch_blue)
		text = "Oh.";
}
with (inst_6DA06790)
{
	if (!instance_exists(obj_waterfaucet))
		text = "That was the only gadget he left behind...";
}
