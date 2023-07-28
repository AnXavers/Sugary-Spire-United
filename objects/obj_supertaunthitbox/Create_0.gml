if (obj_player.supertauntcharged == 0)
	instance_destroy();
with (obj_baddie)
{
	if (bbox_in_camera(view_camera[0]) && !invincible)
	{
		debris = false;
		camera_shake(10, 30);
		instance_destroy();
		with (instance_create(x, y, obj_shake))
		{
			sprite_index = other.deadspr;
			spr_palette = other.spr_palette;
			paletteselect = other.paletteselect;
			alarm[0] = 30;
		}
	}
}
