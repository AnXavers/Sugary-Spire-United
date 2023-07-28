if (image_index > 9)
	exit;
if (other.state != 22)
{
	scr_hurtplayer(other);
	other.state = 22;
	other.bombpeptimer = 0;
	other.sprite_index = spr_bombpep_end;
	other.image_index = 0;
}
