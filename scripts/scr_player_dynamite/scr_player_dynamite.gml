function state_player_dynamite() //oughhhh im so noise bombs rn
{
	if grounded
	{
		hsp = (xscale * movespeed)
		if (movespeed > 0 && character == "V")
			movespeed -= 0.1
	}
	if grounded && character = "V"
		hsp = 0
	landAnim = 0
	if (floor(image_index) == (image_number - 1))
	{
		if character == "V" ||  character == "T"
		{
		if (key_sprint && hsp != 0)
			state = states.mach2
		else
			state = states.normal
		}
		if character == "PT" 
		{
		if (key_sprint && hsp != 0)
			state = states.pogo
		else
			state = states.normal
	   }
	}
	image_speed = 0.4
}
