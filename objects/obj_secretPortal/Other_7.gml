if (sprite_index == spr_secretPortal_open && secretActivated)
{
	sprite_index = spr_secretPortal;
	image_index = 0;
}
if (sprite_index == spr_secretPortal_tele && global.gamemode == 1)
	instance_destroy();