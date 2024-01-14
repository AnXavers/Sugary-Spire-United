scr_getinput()
var _zoom = obj_cameraRegion.zoom
x += ((key_right + key_left) * 4 * (key_sprint + 1)) * _zoom
y += ((key_down - key_up) * 4 * (key_sprint + 1)) * _zoom
if mouse_check_button_pressed(mb_left)
{
	if mode == 1
	{
		with instance_create(selected_obj_x, selected_obj_y, obj_editor_decoy)
		{
			obj = other.selected_obj
			sprite_index = object_get_sprite(obj)
			visible = true
			image_xscale = (other.selected_obj_w / 32)
			image_yscale = (other.selected_obj_h / 32)
			image_angle = other.selected_obj_r
			array_push(global.editorinsts, id)
		}
	}
	else if mode == 2
	{
		tilemap_set(map_id, 2, floor(selected_obj_x / 32), floor(selected_obj_y / 32));
	}
}
if mode == 3
{
	if keyboard_check_pressed(ord("T"))
	{
		scr_controlprompt("Tile layer created.")
		array_push(global.editorlayers, layer_create((array_length(global.editorlayers) * 100), "untitled_tilelayer"))
	}
	if keyboard_check_pressed(ord("I"))
	{
		scr_controlprompt("Instance layer created.")
		array_push(global.editorlayers, layer_create((array_length(global.editorlayers) * 100), "untitled_instancelayer"))
	}
	if keyboard_check_pressed(ord("A"))
	{
		scr_controlprompt("Asset layer created.")
		array_push(global.editorlayers, layer_create((array_length(global.editorlayers) * 100), "untitled_assetlayer"))
	}
	if keyboard_check_pressed(ord("B"))
	{
		scr_controlprompt("Background layer created.")
		array_push(global.editorlayers, layer_create((array_length(global.editorlayers) * 100), "untitled_backgroundlayer"))
	}
	if keyboard_check_pressed(ord("E"))
	{
		scr_controlprompt("Effect layer created.")
		array_push(global.editorlayers, layer_create((array_length(global.editorlayers) * 100), "untitled_effectlayer"))
	}
}
var _shift_held = keyboard_check(vk_shift)
var _ctrl_held = keyboard_check(vk_control)
var _tab_held = keyboard_check(vk_tab)
var _1_held = keyboard_check(ord("1"))
var _2_held = keyboard_check(ord("2"))
var _3_held = keyboard_check(ord("3"))
var _selected_obj_spr = object_get_sprite(selected_obj)
var _selected_obj_spr_w = sprite_get_width(_selected_obj_spr)
var _selected_obj_spr_h = sprite_get_height(_selected_obj_spr)
if (mouse_wheel_up())
{
	if _1_held
	{
		if _shift_held
			selected_obj_w += _selected_obj_spr_w
		else if _ctrl_held
			selected_obj_w += 1
		else
			selected_obj_w += 32
	}
	else if _2_held
	{
		if _shift_held
			selected_obj_h += _selected_obj_spr_h
		else if _ctrl_held
			selected_obj_h += 1
		else
			selected_obj_h += 32
	}
	else if _3_held
	{
		if _shift_held
			selected_obj_r += 90
		else if _ctrl_held
			selected_obj_r += 1
		else
			selected_obj_r += 5
	}
	else if _shift_held
		selected_obj++
	else if _tab_held
		mode++
	else
		_zoom -= (0.1)
}
else if (mouse_wheel_down())
{
	if _1_held
	{
		if _shift_held
			selected_obj_w -= _selected_obj_spr_w
		else if _ctrl_held
			selected_obj_w -= 1
		else
			selected_obj_w -= 32
	}
	else if _2_held
	{
		if _shift_held
			selected_obj_h -= _selected_obj_spr_h
		else if _ctrl_held
			selected_obj_h -= 1
		else
			selected_obj_h -= 32
	}
	else if _3_held
	{
		if _shift_held
			selected_obj_r -= 90
		else if _ctrl_held
			selected_obj_r -= 1
		else
			selected_obj_r -= 5
	}
	else if _shift_held
		selected_obj--
	else if _tab_held
		mode--
	else
		_zoom += (0.1)
}
_zoom = clamp(_zoom, 0.2, 10)
var _object_num = ((array_length(global.objectlist)) - 1)
mode = wrap(mode, 0, 3)
selected_obj = wrap(selected_obj, 0, _object_num)
selected_obj_r = wrap(selected_obj_r, 0, 359)
cursor_x = (mouse_x - x)
cursor_y = (mouse_y - y)
selected_obj_x = ((floor(mouse_x / 32)) * 32)
selected_obj_y = ((floor(mouse_y / 32)) * 32)
obj_cameraRegion.zoom = _zoom
if (keyboard_check_pressed(vk_escape) && !instance_exists(obj_shell))
	instance_destroy()