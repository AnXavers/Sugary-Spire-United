condition = function()
{
	return global.panic;
};
output = function()
{
	var lay_id = layer_get_id("Assets_1");
	var sprite_id = layer_sprite_get_id(lay_id, "graphic_5214D7B3");
	layer_sprite_change(sprite_id, bg_exitwaylighthouseE);
	var sprite_id = layer_sprite_get_id(lay_id, "graphic_5617AC40");
	layer_sprite_change(sprite_id, bg_exitwaylighthousebottomE);
};
