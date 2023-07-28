function scr_enemy_eyescream()
{
	switch (substate)
	{
		case substates.unknown_0:
			var inrange = false;
			var _targetx = obj_player.x - (randomx * obj_player.xscale);
			var _targety = obj_player.y - randomy;
			var tgtX = obj_player.x - (obj_player.xscale * randomx);
			var tgtY = obj_player.y - randomy;
			var tgtMVSP = distance_to_point(tgtX, tgtY) / 200;
			var _d = point_direction(x, y, tgtX, tgtY);
			hsp = lengthdir_x(14 * tgtMVSP, _d);
			vsp = lengthdir_y(14 * tgtMVSP, _d);
			x += hsp;
			y += vsp;
			var _dist = point_distance(x, y, _targetx, _targety);
			var _spd = (_dist / 200) * 20;
			sprite_index = spr_eyescreamsandwich;
			x = approach(x, _targetx, _spd);
			y = approach(y, _targety, _spd) + wave(-5, 5, 5, 5);
			if (_dist < 50)
			{
				inrange = true;
				cancollide = true;
			}
			if (x != obj_player.x)
				image_xscale = -sign(x - obj_player.x);
			if (timer > 0)
				timer--;
			else if (inrange)
			{
				substate = substates.unknown_2;
				vsp = 0;
				hsp = 0;
				image_index = 0;
				sprite_index = spr_eyescreamsandwich_divestart;
			}
			break;
		case substates.unknown_1:
			x += hsp;
			y += vsp;
			vsp += grav;
			if (y <= targety && vsp < 0)
				substate = substates.unknown_0;
			break;
		case substates.unknown_2:
			hsp = 0;
			vsp = 0;
			if (animation_end() && 86)
			{
				var tgthsp = point_distance(x, 0, obj_player.x, 0) / 100;
				substate = substates.unknown_1;
				vsp = 10;
				hsp = 6 * tgthsp * image_xscale;
				targety = y;
				timer = maxtime;
				sprite_index = spr_eyescreamsandwich_dive;
			}
			break;
	}
}
