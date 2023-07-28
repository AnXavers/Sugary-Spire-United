draw_flush();
var temparray = ["Player", "Baddies", "HUD", "Backgrounds", "Tiles"];
textureLoaderList = ds_list_create();
for (var i = 0; i < array_length(temparray); i++)
	ds_list_set(textureLoaderList, i, texturegroup_get_textures(temparray[i]));
DslistMax = ds_list_size(textureLoaderList);
alarm[0] = 60;
