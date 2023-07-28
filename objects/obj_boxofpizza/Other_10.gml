if (!instance_exists(backPanel))
	backPanel = instance_create(x, y, 367, 
	{
		sprite_index: spr_pizzabox,
		image_xscale: image_xscale,
		image_yscale: image_yscale,
		depth: 104,
		visible: true
	});
