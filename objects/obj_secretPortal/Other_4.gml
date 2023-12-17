visible = secretActivated;
if ((ds_list_find_index(global.saveroom, id) != -1) || (global.levelname == "yogurt"))
	instance_destroy();
if global.levelname == "secrets"
{
	if array_length(global.secretsspire) == 0
	{
		targetRoom = secrets_end
	}
	else
		targetRoom = global.secretsspire[irandom((array_length(global.secretsspire)) - 1)]
}