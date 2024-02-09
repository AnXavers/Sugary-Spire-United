if (state == 0 && other.state != states.comingoutdoor && other.hsp == 0 && other.grounded && other.key_up2)
{
	state = 1
	other.state = states.actor
	other.key_up2 = 0
	other.movespeed = 0
	other.hsp = 0
	other.sprite_index = spr_pizzelle_idle
	other.image_speed = 0.35
}
