
function scr_pizzano_machtwirl()
{
	sprite_index = spr_machtwirl
	move = (key_left + key_right);
	hsp = (xscale * movespeed);
	mach2++
	if move != 0 {
		if move == xscale && movespeed < 11
			movespeed += 0.75
		if move != xscale && movespeed > -11
			movespeed -= 0.75
	}
	if (key_down2 && (!grounded) && vsp < 10)
		vsp = 10

	if !key_jump2 && vsp < -4
		vsp = -4
	if grounded {
		if key_sprint {
			state = states.mach2
			image_index = 0;
			
			jumpstop = 0
		}
		else {
			state = states.normal;
			image_index = 0;
			mach2 = 0;
			jumpstop = 0	
		}	
	}
	
	var jumpbad = instance_place(x, y + vsp, obj_baddie)
	if jumpbad
	{
		instance_destroy(jumpbad)
		vsp = -10
	}
	if key_attack2 {
		if !charged && !key_up {
			flash = 1
			state = states.pizzano_rocketfist
			sprite_index = spr_superjump_cancelprep
			image_index = 0
			movespeed = (movespeed / 1.50);
			mach2 = 0
			charged = 0	
			scr_sound(sound_superjumpcharge1);
			
		}
		else if !charged {
			flash = 1
			alarm[0] = 240
			image_index = 0
			sprite_index = spr_superjumpprep	
			state = states.Sjump
			scr_sound(sound_superjumpcharge1)
		}
		else {
			scr_sound(sfx_kungfuair)
			if movespeed < 9
				movespeed = 9
			airkung = 0
			kungtime = 30
			state = states.pizzano_kungfu
			flash = 1
			if !grounded
			{
				airkung = 1
				sprite_index = choose(spr_kungfuair1start, spr_kungfuair2start, spr_kungfuair3start);
			}
			else
				sprite_index = choose(spr_kungfu1, spr_kungfu2, spr_kungfu3, spr_kungfu4, spr_kungfu5, spr_kungfu6);
			instance_create(x,y,obj_crazyrunothereffect)
			if ((!instance_exists(obj_superdashcloud)) && grounded) 
					instance_create(x, y, obj_superdashcloud, 
					{ playerID: id
						});
			p1Vibration(30, 5)
			image_index = 0	
		}
	}

	if key_sprint && (!grounded || slopeCheck(x + xscale, y)) && scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles)  
	{
		verticalMovespeed = movespeed;
		if (vsp > 0) && (place_meeting(x + xscale, y, obj_icyWall)) 
		{
			verticalMovespeed -= round(vsp * 1.25);			
		}
		else if (vsp > 0) && (character == "N") 
		{
			verticalMovespeed -= vsp;
		}	
		grabclimbbuffer = 0;
		state = states.climbwall;
	}


}