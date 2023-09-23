if (vsp < 20)
	vsp += grav;
x += hsp;
y += floor(vsp);
if (!alarm[0])
	alarm[0] = 5;
drawx = x;
drawy = y;
if (sprite_index == spr_explosiveBarrel_destroyed && place_meeting_collision(x, y))
{
	instance_destroy()
	instance_create(x, y - 10, obj_explosioneffect)
	scr_sound(sound_explosion)
}