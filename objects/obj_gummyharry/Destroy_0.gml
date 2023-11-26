if (ds_list_find_index(global.saveroom, id) == -1)
{
	repeat (2)
	{
		instance_create(x, y, obj_bangeffect);
		instance_create(x, y, obj_slapstar);
	}
	audio_pause_all()
	ds_list_add(global.saveroom, id);
	with (instance_create(x, y, obj_harrydead))
	{
		isfrozen = 0
		if !global.harryfreeze
			alarm[1] = 1;
		else
		{
			global.harryfxval = 1
			global.harryfx = fx_create("_filter_tintfilter")
			fx_set_parameter(global.harryfx, "g_TintCol", [global.harryfxval, global.harryfxval, global.harryfxval, 1])
			global.harryeffect = layer_create(-1, "Effect_Harry")
			layer_set_fx(global.harryeffect, global.harryfx)
			audio_pause_all()
			scr_soundloop(sfx_harrypause)
			with instance_create(obj_player.x - 100, obj_player.y - 100, obj_cameraRegion)
			{
				zoom = 0.6
				ClampTop = false
				ClampBottom = false
				ClampLeft = false
				ClampRight = false
			}
			alarm[1] = 60;
			freezevsp = obj_player.vsp
			freezehsp = obj_player.hsp
			freezestate = obj_player.state
			if instance_exists(obj_coneball)
			{
				coneballvsp = obj_coneball.vspeed
				coneballhsp = obj_coneball.hspeed
				obj_coneball.image_speed = 0
			}
			isfrozen = 1
			cutscene_create([cutscene_harryFreeze])
		}
	}
}
