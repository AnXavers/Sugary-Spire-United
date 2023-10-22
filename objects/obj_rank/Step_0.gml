scr_getinput();
if (clipy != 0 && goup)
{
	clipy = approach(clipy, 0, 25 - accel);
	accel = approach(accel, 24, 0.4);
	if (sprite_index == obj_player.spr_player_rankP && clipy <= 270)
		x = approach(x, 0, 25 - accel);
}
if (floor(image_index) >= (image_number - 1))
	image_speed = 0;
if (stampani == 1)
	stampdex = approach(stampdex, 11, 0.5);
if (stampdex >= 11)
	stampani = 0;
if (stampdex == 3)
{
	scr_sound(sound_stamp);
	stampsnd = true;
	rankdex = dex + 1;
	countpoint = global.collect;
	pshake = 1;
	alarm[5] = 10;
}
playerdex += 0.5;
if (playerdex >= 10)
	playerdex = 0;
carddex1 += 0.3;
carddex2 += 0.3;
carddex3 += 0.3;
if (floor(image_index) >= (image_number - 1))
	image_speed = 0;
if (counting == 1)
	pspeed += 7;
bgx--;
bgy++;
if (jandraw == 1)
	janscale = approach(janscale, 1, 0.3);
totalalpha = approach(totalalpha, 1, 0.1);
if (canleave == 1 && key_jump2)
	alarm[4] = 1;
flash = approach(flash, 0, 0.1);
if (!goup)
{
	if (sprite_index != obj_player.spr_rankwait)
		x = lerp(x, 259, 0.5);
}
