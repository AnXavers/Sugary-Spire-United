if (ds_exists(textureLoaderList, 2))
{
	if (!ds_list_empty(textureLoaderList))
	{
		var tex = ds_list_find_value(textureLoaderList, 0);
		for (var i = 0; i < array_length(tex); i++)
		{
			if (!texture_is_ready(tex[i]))
				texture_prefetch(tex[i]);
		}
		ds_list_delete(textureLoaderList, 0);
	}
	else
	{
		ds_list_destroy(textureLoaderList);
		room_goto(rm_initializer);
	}
}

// THIS LOOP COULD CAUSE AN OUT OF MEMORY EXCEPTION
// REMOVING IT WILL WORK BUT THE GAME WILL STUTTER WHEN LOADING SPRITES

/*
var i = 0;
while sprite_exists(i)
{
	sprite_prefetch(i);
	i++;
}
*/

alarm[0] = 2;
