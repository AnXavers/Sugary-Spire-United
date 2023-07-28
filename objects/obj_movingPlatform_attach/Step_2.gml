for (var i = 0; i < ds_list_size(objectList); i++)
{
	with (ds_list_find_value(objectList, i))
		kinematics_movingPlatforms(id, other.platformID, false);
}
kinematics_movingPlatforms(id, platformID, false);
