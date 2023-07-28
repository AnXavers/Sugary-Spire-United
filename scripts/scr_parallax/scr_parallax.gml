global.ParallaxMap = ds_map_create();
function scr_addParallaxLayer(argument0, argument1, argument2 = [])
{
	ds_map_set(global.ParallaxMap, argument0, 
	{
		func: argument1,
		args: argument2
	});
	exit;
}
function defaultParallax()
{
	x += (camera_get_view_x(view_camera[0]) * argument0);
	y += (camera_get_view_y(view_camera[0]) * argument1);
}
function defaultParallaxGround()
{
	var _sprite_height = sprite_get_height(layer_background_get_sprite(layer_background_get_id(id)));
	var _height = room_height - _sprite_height;
	var cam_y = clamp(camera_get_view_y(view_camera[0]), _height - 200, room_height);
	x += (camera_get_view_x(view_camera[0]) * argument0);
	y += (cam_y - clamp(cam_y * argument1 * (camera_get_view_height(view_camera[0]) / _height), 0, _sprite_height - camera_get_view_height(view_camera[0])));
}
function defaultParallaxH()
{
	x += (camera_get_view_x(view_camera[0]) * argument0);
	y += (camera_get_view_y(view_camera[0]) - clamp(camera_get_view_y(view_camera[0]) * argument1 * (camera_get_view_height(view_camera[0]) / room_height), 0, sprite_get_height(layer_background_get_sprite(layer_background_get_id(id))) - camera_get_view_height(view_camera[0])));
}
function defaultParallaxV()
{
	x += (camera_get_view_x(view_camera[0]) - clamp(camera_get_view_x(view_camera[0]) * argument0 * (camera_get_view_width(view_camera[0]) / room_width), 0, sprite_get_width(layer_background_get_sprite(layer_background_get_id(id))) - camera_get_view_width(view_camera[0])));
	y += (camera_get_view_y(view_camera[0]) * argument1);
}
function defaultParallaxFar()
{
	x += (camera_get_view_x(view_camera[0]) - clamp(camera_get_view_x(view_camera[0]) * argument0 * (camera_get_view_width(view_camera[0]) / room_width), 0, sprite_get_width(layer_background_get_sprite(layer_background_get_id(id))) - camera_get_view_width(view_camera[0])));
	y += (camera_get_view_y(view_camera[0]) - clamp(camera_get_view_y(view_camera[0]) * argument1 * (camera_get_view_height(view_camera[0]) / room_height), 0, sprite_get_height(layer_background_get_sprite(layer_background_get_id(id))) - camera_get_view_height(view_camera[0])));
}
function parallaxZigZagV()
{
	var time = global.ScrollOffset / 60;
	var _spd = layer_get_vspeed(id);
	var _sin = sin(time) * _spd;
	x += (camera_get_view_x(view_camera[0]) * argument0);
	y += ((camera_get_view_y(view_camera[0]) * argument1) + _sin);
	y -= yShift;
}
function parallaxZigZagVFar()
{
	var time = global.ScrollOffset / 60;
	var _spd = vspeed;
	var _sin = sin(time) * _spd;
	x += (camera_get_view_x(view_camera[0]) - clamp(camera_get_view_x(view_camera[0]) * argument0 * (camera_get_view_width(view_camera[0]) / room_width), 0, sprite_get_width(layer_background_get_sprite(layer_background_get_id(id))) - camera_get_view_width(view_camera[0])));
	y += (_sin + (camera_get_view_y(view_camera[0]) - clamp(camera_get_view_y(view_camera[0]) * argument1 * (camera_get_view_height(view_camera[0]) / room_height), 0, sprite_get_height(layer_background_get_sprite(layer_background_get_id(id))) - camera_get_view_height(view_camera[0]))));
	y -= yShift;
}
