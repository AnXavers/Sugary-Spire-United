depth = -3;
revealCondition = function()
{
	return place_meeting(x, y, obj_player);
};
secretAlpha = 1;
secretSurface = -4;
revealActivated = false;
for (var i = 0; i < array_length(layerArray); i++)
{
	var arg = layerArray[i];
	var layerid = layer_get_id(arg);
	layer_set_visible(layerid, false);
	layerArray[i] = layerid;
}
var _f = function()
{
	return -(layer_get_depth(argument0) - layer_get_depth(argument1));
};
array_sort(layerArray, _f);
