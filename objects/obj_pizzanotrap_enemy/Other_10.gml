if (instance_exists(enemyID))
	exit;
with (instance_create(x, y, enemy))
{
	important = other.important;
	pizzano = true;
	paletteselect = 2;
	other.enemyID = id;
	instance_create(x, y, obj_poofeffect);
	if (face_obj(obj_player) != 0)
		image_xscale = face_obj(obj_player);
	squashedx = true;
	squashvalx = 0;
	stunned = 20;
	if (!scr_enemyDestroyableCheck(x, y))
	{
		invincible = false;
		visible = true;
		flash = true;
		state = 6;
		sprite_index = stunfallspr;
		image_index = 0;
	}
}
if (important)
	instance_destroy();
