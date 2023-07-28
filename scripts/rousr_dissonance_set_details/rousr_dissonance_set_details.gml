function rousr_dissonance_set_details()
{
	var _details = argument0;
	with (global.__rousr_dissonance)
	{
		Is_dirty = true;
		discord_set_details(_details);
	}
}
