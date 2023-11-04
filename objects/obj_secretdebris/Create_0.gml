initialhsp = 0;
initialvsp = 0;
rotatedirection = irandom_range(-1, 1);
rotatevalue = irandom_range(-5, 5);
mask_index = spr_maskdebris;
if (place_meeting(x, y, obj_player))
{
	with (instance_place(x, y, obj_player))
	{
		other.initialhsp = hsp / 1.7;
		other.initialvsp = clamp(vsp / 1.3, -12, random_range(0, -5));
	}
}
if (place_meeting(x, y, group_pushables))
{
	with (instance_place(x, y, group_pushables))
	{
		if (thrown == 1 || state == "punch")
		{
			other.initialhsp = hsp / 1.7;
			other.initialvsp = clamp(vsp / 1.3, -12, random_range(0, -5));
		}
	}
}
mask_index = sprite_index;
image_index = random_range(0, 5);
image_speed = 0;
vsp = random_range(-4, 0) + initialvsp;
hsp = random_range(-4, 4) + initialhsp;
grav = 0.3;
image_angle = random_range(1, 270);
depth = -1;
s = -1;
tile_dataset = 33;
tile_dataid = 49;
height = sprite_xoffset;
width = sprite_yoffset;
mode = 1;
blendsprite = spr_targetblock;
