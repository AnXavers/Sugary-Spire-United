speaking = false;
if (place_meeting(x, y, obj_player) && ((!press_to_speak) || (obj_player.key_attack2 && press_to_speak)))
	speaking = true;
if global.panic
	sprite_index = speaking ? panicspeak : panicidle;
else
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
	else if (!instance_exists(obj_waterfaucet))
		text = "That was the only gadget he left behind...";
}
with (inst_78702139)
{
	if ((obj_player.sprite_index == spr_pizzelle_taunt) && (obj_player.image_index == 16))
		visible = false
	else if obj_player.sprite_index != spr_pizzelle_taunt
		visible = true
}
if turn_to_player
{
	image_xscale = 1
	if obj_player.x > x
		image_xscale = -1
}