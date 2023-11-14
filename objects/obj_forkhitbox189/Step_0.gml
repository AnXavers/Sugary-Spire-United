// Feather disable GM1049
if (!instance_exists(ID))
{
	instance_destroy();
	exit;
}
x = ID.x;
y = ID.y;
image_xscale = ID.image_xscale;
image_index = ID.image_index;
with ID
{
	if (object_index == obj_sluggy && obj_sluggy.state == 20 && obj_player.state != states.parry)
	{
		sluggyhitboxcreated = 0;
		instance_destroy(other.id);
	}
}
