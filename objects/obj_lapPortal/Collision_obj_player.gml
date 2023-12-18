if (other.state != states.actor && sprite_index == obj_player.spr_lapportal_idle && (global.panic || global.levelname == "secrets") && (global.enableportal = 2 || !global.jerald))
{
	with (other)
	{
		x = other.x;
		y = other.y;
		targetDoor = other.targetDoor;
		targetRoom = other.targetRoom;
		image_index = 0;
		sprite_index = obj_player.spr_lapportal_enter;
	}
	with instance_create(x, y, obj_cameraRegion)
	{
		zoom = 0.6
		ClampTop = false
		ClampBottom = false
		ClampLeft = false
		ClampRight = false
	}
	global.secretsspire = [entryway_secret_1, entryway_secret_2, entryway_secret_3, steamy_secret_1, steamy_secret_2, steamy_secret_3, molasses_secret_1, molasses_secret_2, molasses_secret_3, mountain_secret_1, mountain_secret_2, mountain_secret_3, dance_secret1, dance_secret2, dance_secret3, estate_secret1, estate_secret2, estate_secret3, bee_secret_1, bee_secret_2, bee_secret_3, sucrose_secret1, sucrose_secret2, sucrose_secret3, exitway_secret_1, stormy_secret_1, stormy_secret_2, stormy_secret_3, martian_secret_1, entrance_secret3, entrance_secret4, entrance_secret5, medieval_secret4, medieval_secret5, medieval_secret6, dungeon_secret1, dungeon_secret2, dungeon_secret3]
	global.secretstotal += array_length(global.secretsspire)
	if global.levelname == "secrets"
	{
		ds_list_clear(global.saveroom);
		ds_list_clear(global.escaperoom);
		ds_list_clear(global.baddieroom);
	}
	scr_sound(sfx_lapenter)
	cutscene_create([cutscene_lapPortal_start, cutscene_lapPortal_middle, cutscene_lapPortal_end]);
	instance_destroy();
}