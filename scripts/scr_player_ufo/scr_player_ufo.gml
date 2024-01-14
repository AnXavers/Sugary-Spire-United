function state_player_ufofloat()
{
	static shoot_buffer = 0;
	var maxspeed = 10;
	var hspaccel = 0.6;
	var vspaccel = 0.6;
	var speed_magnitude = 0;
	move = key_right + key_left;
	move2 = key_down - key_up;
	if ((sprite_index != spr_ufoShoot || (animation_end() && sprite_index == spr_ufoShoot)) && sprite_index != spr_ufoShootHold)
	{
		sprite_index = spr_ufoFloat;
		if (ufotimer <= 125)
			sprite_index = spr_ufoFloatLow;
	}
	if (move != 0 && sprite_index != spr_ufoShoot)
		xscale = move;
	if (key_attack && sprite_index != spr_ufoShootHold)
	{
		image_index = 0;
		sprite_index = spr_ufoShootHold;
		scr_soundloop(sfx_ufocharge)
	}
	else if (!key_attack && sprite_index == spr_ufoShootHold)
	{
		image_index = 0;
		sprite_index = spr_ufoShoot;
		audio_stop_sound(sfx_ufocharge)
		scr_sound(sfx_ufoshoot)
		with (instance_create(x, y + 25, obj_donutShitted, 
		{
			bigShot: shoot_buffer >= 30
		}))
		{
			var _angle = (other.xscale > 0) ? 0 : 180;
			Hmovespeed = lengthdir_x(20, _angle);
			Vmovespeed = lengthdir_y(20, _angle);
			shattedBy = other.id;
		}
		shoot_buffer = 0;
	}
	if (key_attack && shoot_buffer <= 30)
		shoot_buffer++;
	if (shoot_buffer < 30 && !key_attack)
		shoot_buffer += 0.3;
	if (shoot_buffer >= 30)
		image_index = 0;
	if (sprite_index == spr_ufoShoot || sprite_index == spr_ufoShootHold)
	{
		maxspeed = 7;
		hspaccel = 0.65;
		vspaccel = 0.65;
	}
	movespeed = approach(movespeed, move * maxspeed, hspaccel);
	verticalMovespeed = approach(verticalMovespeed, move2 * maxspeed, vspaccel);
	hsp = movespeed;
	vsp = verticalMovespeed;
	if (place_meeting_collision(x + sign(hsp), y, 1) && !place_meeting(x + sign(hsp), y, obj_destructibles))
		movespeed = 0;
	if (place_meeting_collision(x, y + sign(vsp), 1) && !place_meeting(x, y + sign(vsp), obj_destructibles))
		verticalMovespeed = 0;
	if (ufotimer <= 0)
	{
		audio_stop_sound(sfx_ufocharge)
		with (instance_create(x, y, obj_ufo_dead))
			hsp = other.hsp + 2;
		vsp = -11;
		state = states.normal;
		movespeed = abs(hsp);
		if (movespeed < 6)
			movespeed = 6;
		if (sign(hsp) != 0)
			xscale = sign(hsp);
	}
	if (hsp != 0 || vsp != 0)
	{
		with (create_afterimage(0, xscale))
		{
			gonealpha = 0.85;
			alarm[0] = 1;
			alarm[1] = 60;
		}
	}
	if (global.moveset == 1 && key_sprint)
	{
		state = states.ufodash
		audio_stop_sound(sfx_ufocharge)
		audio_stop_sound(sfx_ufodash)
		scr_sound(sfx_ufodash)
	}
	exit;
	image_speed = 0.35;
}
function state_player_ufodash()
{
	var maxspeed = 12;
	var hspaccel = 0.5;
	var vspaccel = 0.5;
	sprite_index = spr_ufoFloatSpeedUp;
	var _angle = (xscale > 0) ? 0 : 180;
	if (move != 0 || move2 != 0)
		_angle = point_direction(0, 0, move, move2);
	if (floor(image_index) < 4)
	{
		var _speed = 14;
		movespeed = lengthdir_x(_speed, _angle);
		hsp = movespeed;
		verticalMovespeed = lengthdir_y(_speed, _angle);
		vsp = verticalMovespeed;
	}
	else
	{
		move = key_right + key_left;
		move2 = key_down - key_up;
		if (move != 0)
			movespeed = approach(movespeed, move * maxspeed, hspaccel);
		if (move2 != 0)
			verticalMovespeed = approach(verticalMovespeed, move2 * maxspeed, vspaccel);
		hsp = movespeed;
		vsp = verticalMovespeed;
		if (place_meeting_collision(x + sign(hsp), y, 1) && !place_meeting(x + sign(hsp), y, obj_destructibles))
			movespeed = 0;
		if (place_meeting_collision(x, y + sign(vsp), 1) && !place_meeting(x, y + sign(vsp), obj_destructibles))
			verticalMovespeed = 0;
	}
	create_afterimage(irandom_range(1, 2), xscale);
	if (animation_end() && sprite_index == spr_ufoFloatSpeedUp)
		state = states.ufofloat;
	image_speed = 0.5;
	exit;
}
