if (!global.freezeframe)
{
	if (state != enemystates.cherrywait)
		instance_destroy();
	if (other.object_index != obj_donutShitted)
		instance_destroy(other.id);
}
