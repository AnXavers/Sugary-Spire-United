function create_afterimage(argument0, argument1 = image_xscale, argument2 = false)
{
	if (!instance_exists(id))
		exit;
	var parent = object_index;
	var _id = id;
	var pal = [-4, -4];
	var _angle = _id.image_angle;
	if (object_get_parent(parent) == 381)
		pal = [paletteselect, spr_palette];
	if (parent == obj_player)
		_angle = obj_player.draw_angle;
	var q = 
	{
		x: _id.x,
		y: _id.y,
		blink: argument2,
		sprite_index: _id.sprite_index,
		image_index: _id.image_index,
		image_alpha: 1,
		image_angle: _angle,
		image_xscale: argument1,
		visible: true,
		alarm: [13, 30],
		color_choose: argument0,
		hsp: 0,
		vsp: 0,
		identity: _id,
		gonealpha: 0.85,
		vanish: false,
		paletteselect: pal[0],
		spr_palette: pal[1]
	};
	ds_list_add(global.afterimage_list, q);
	return q;
}
function create_heat_afterimage(argument0, argument1 = image_xscale, argument2 = 8)
{
	with (create_afterimage(argument0, argument1))
	{
		gonealpha = 0.85;
		vsp = argument2;
		alarm[0] = 1;
		alarm[1] = 60;
	}
	with (create_afterimage(argument0, argument1))
	{
		gonealpha = 0.85;
		vsp = -argument2;
		alarm[0] = 1;
		alarm[1] = 60;
	}
	with (create_afterimage(argument0, argument1))
	{
		gonealpha = 0.85;
		hsp = argument2;
		alarm[0] = 1;
		alarm[1] = 60;
	}
	with (create_afterimage(argument0, argument1))
	{
		gonealpha = 0.85;
		hsp = -argument2;
		alarm[0] = 1;
		alarm[1] = 60;
	}
}
