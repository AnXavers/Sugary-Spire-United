if (instance_number(obj_parallax) > 1)
{
	var _first = instance_find(obj_parallax, 0);
	if (id != _first)
	{
		instance_destroy();
		exit;
	}
}
var i = 5;
repeat (5)
	layers[i--] = -4
asset_layers = array_create(5, undefined);
asset_sprites = array_create(5, undefined);
layerNum = 0;
assetNum = 0;
layerArray = [];
spriteNum = 0;
target_panic_id = 0;
target_time_id = 0;
bgflash = 0;
global.ScrollOffset = 0;
greyscalefade = 0;
scroll1 = 0;
RealSurface = -4;
use_war = false;
