function scr_enemy_grabbed()
{
	with (obj_player)
		{
		other.image_xscale = -xscale;
		other.stunned = 200;
		baddiegrabbedID = other.id;
		if (state == states.grabbing || state == states.grab || state == states.throwing || state == states.slam || state == states.charge)
		{
			other.depth = 0;
			other.x = x;
			if (sprite_index != spr_haulingstart)
				other.y = y - 40;
			else if (floor(image_index) == 0)
				other.y = y;
			else if (floor(image_index) == 1)
				other.y = y - 10;
			else if (floor(image_index) == 2)
				other.y = y - 20;
			else if (floor(image_index) == 3)
				other.y = y - 30;
			other.image_xscale = -xscale;
			if (sprite_index == spr_lungehit)
			{
				other.x = x + supergrabx;
				other.y = y + supergraby;
			}
		}
		suplexhavetomash = other.hp - 1;
		scr_getinput();
		move = key_left2 + key_right2;
		if (!global.freezeframe && state != states.frozen && state != states.grab && state != states.grabbing && state != states.finishingblow && state != states.slam && state != states.charge && state != states.punch && state != states.superslam && state != states.backkick && state != states.uppunch && state != states.shoulder)
		{
			other.stuntouch = 50;
			other.x = x;
			other.y = y;
			other.state = enemystates.stun;
			other.image_index = 0;
		}
	}
	hsp = 0;
	if (obj_player.state == states.punch && floor(obj_player.image_index) == 2)
	{
		alarm[3] = 3;
		global.hit++;
		if (other.object_index == obj_pizzaball)
			global.golfhit++;
		hp--;
		instance_create(x + (obj_player.xscale * 30), y, obj_bumpeffect);
		alarm[1] = 5;
		thrown = 1;
		x = obj_player.x;
		vsp = 0;
		y = obj_player.y;
		state = enemystates.stun;
		hsp = -image_xscale * 25;
		grav = 0;
		global.combotime = 60;
		instance_create(x, y, obj_slapstar);
		instance_create(x, y, obj_baddiegibs);
		flash = 1;
		with (obj_camera)
		{
			shake_mag = 3;
			shake_mag_acc = 3 / room_speed;
		}
	}
	if (obj_player.state == states.backkick && floor(obj_player.image_index) == 2)
	{
		alarm[3] = 3;
		global.hit++;
		if (other.object_index == obj_pizzaball)
			global.golfhit++;
		hp--;
		instance_create(x + (-obj_player.xscale * 50), y, obj_bumpeffect);
		alarm[1] = 5;
		thrown = 1;
		x = obj_player.x;
		y = obj_player.y;
		state = enemystates.stun;
		image_xscale *= -1;
		hsp = -image_xscale * 20;
		vsp = -7;
		global.combotime = 60;
		instance_create(x, y, obj_slapstar);
		instance_create(x, y, obj_baddiegibs);
		flash = 1;
		with (obj_camera)
		{
			shake_mag = 3;
			shake_mag_acc = 3 / room_speed;
		}
	}
	if (obj_player.state == states.shoulder)
	{
		global.hit++;
		hp--;
		instance_create(x, y + 20, obj_bumpeffect);
		alarm[1] = 5;
		thrown = 1;
		x = obj_player.x;
		y = obj_player.y;
		state = enemystates.stun;
		hsp = -image_xscale * 10;
		vsp = -10;
		global.combotime = 60;
		instance_create(x, y, obj_slapstar);
		instance_create(x, y, obj_baddiegibs);
		flash = 1;
		with (obj_camera)
		{
			shake_mag = 3;
			shake_mag_acc = 3 / room_speed;
		}
	}
	if (obj_player.state == states.throwing && floor(obj_player.image_index) == 2)
	{
		global.hit++;
		hp--;
		alarm[1] = 5;
		thrown = 1;
		x = obj_player.x;
		y = obj_player.y;
		state = enemystates.stun;
		hsp = -image_xscale * 10;
		vsp = -10;
	}
	if (obj_player.state == states.charge)
	{
		if (floor(obj_player.image_index) == 0)
		{
			depth = 0;
			x = obj_player.x + (obj_player.xscale * 10);
			y = obj_player.y;
		}
		if (floor(obj_player.image_index) == 1)
		{
			depth = 0;
			x = obj_player.x + (obj_player.xscale * 5);
			y = obj_player.y;
		}
		if (floor(obj_player.image_index) == 2)
		{
			depth = 0;
			x = obj_player.x;
			y = obj_player.y;
		}
		if (floor(obj_player.image_index) == 3)
		{
			depth = 0;
			x = obj_player.x + (obj_player.xscale * -5);
			y = obj_player.y;
		}
		if (floor(obj_player.image_index) == 4)
		{
			depth = 0;
			x = obj_player.x + (obj_player.xscale * -10);
			y = obj_player.y;
		}
		if (floor(obj_player.image_index) == 5)
		{
			depth = -8;
			x = obj_player.x + (obj_player.xscale * -5);
			y = obj_player.y;
		}
		if (floor(obj_player.image_index) == 6)
		{
			depth = -8;
			x = obj_player.x;
			y = obj_player.y;
		}
		if (floor(obj_player.image_index) == 7)
		{
			depth = -8;
			x = obj_player.x + (obj_player.xscale * 5);
			y = obj_player.y;
		}
	}
	if (obj_player.state == states.superslam)
	{
		if (obj_player.character == "P")
		{
			x = obj_player.x - (obj_player.xscale * 2);
			y = obj_player.y - 70;
		}
		else
		{
			depth = -7;
			x = obj_player.x;
			y = obj_player.y - 40;
		}
	}
	sprite_index = grabbedspr;
	image_speed = 0.35;
	if (obj_player.state == states.finishingblow && thrown == 0)
	{
		var try_x = 0;
		while (try_x < 60)
		{
			if (!scr_solid(obj_player.x + (try_x * obj_player.xscale), y) && !scr_slopePlatform(obj_player.x + (try_x * obj_player.xscale), y))
				try_x++;
			else
				break;
		}
		x = obj_player.x + (try_x * obj_player.xscale);
		y = obj_player.y;
		hsp = 0;
		vsp = 0;
	}
}
