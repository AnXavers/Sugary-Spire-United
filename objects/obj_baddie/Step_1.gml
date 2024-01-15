switch (state)
{
	case enemystates.idle:
		scr_enemy_idle();
		break;
	case enemystates.charge:
		scr_enemy_charge();
		break;
	case enemystates.turn:
		scr_enemy_turn();
		break;
	case enemystates.walk:
		scr_enemy_walk();
		break;
	case enemystates.land:
		scr_enemy_land();
		break;
	case enemystates.hit:
		scr_enemy_hit();
		break;
	case enemystates.stun:
		scr_enemy_stun();
		break;
	case enemystates.thrown:
		scr_enemy_throw();
		break;
	case enemystates.grabbed:
		scr_enemy_grabbed();
		break;
	case enemystates.scared:
		scr_enemy_scared();
		break;
	case enemystates.frozen:
		scr_enemy_frozen();
		break;
	case enemystates.shake:
		scr_enemy_shake();
		break;
	case enemystates.float:
		scr_enemy_float();
		break;
	case enemystates.theif:
		scr_enemy_theif();
		break;
	case enemystates.panicWait:
		scr_enemy_panicWait();
		break;
	case enemystates.secretWait:
		scr_enemy_secretWait();
		break;
	case enemystates.inhaled:
		scr_enemy_inhaled();
		break;
	case enemystates.cherrywait:
		scr_enemy_cherrywait();
		break;
	case enemystates.charcherry:
		scr_enemy_charcherry();
		break;
	case enemystates.applejim_bash:
		scr_applejim_bash();
		break;
	case enemystates.kick:
		scr_enemy_kick();
		break;
	case enemystates.slugidle:
		scr_enemy_slugidle();
		break;
	case enemystates.slugjump:
		scr_enemy_slugjump();
		break;
	case enemystates.slugparry:
		scr_enemy_slugparry();
		break;
	case enemystates.eyescreamwait:
		scr_enemy_eyescreamwait();
		break;
	case enemystates.eyescream:
		scr_enemy_eyescream();
		break;
	case enemystates.rage:
		scr_enemy_rage();
		break;
}
if (y > (room_height + 64))
	instance_destroy();
if (state != 9)
	ScareBuffer = 0;
if (tauntBuffer == 1)
{
	if (!instance_exists(tauntBufferEffect))
	{
		with (instance_create(x, y, obj_baddieangrycloud))
		{
			baddieID = other.id;
			other.tauntBufferEffect = id;
		}
	}
	if (obj_player.state != states.backbreaker && obj_player.state != states.parry && object_index != obj_popcornbag)
	{
		tauntBuffer = false;
		bombreset = 0;
		ragereset = 0;
		stunned = 0;
		jumptimer = 0;
		ScareBuffer = 0;
	}
	if (obj_player.state != states.backbreaker && obj_player.state != states.parry && object_index == obj_popcornbag)
		tauntBuffer = false;
}
if (place_meeting_solid(x, y) && state == 6 && thrown)
	instance_destroy();
persistent = (state == enemystates.grabbed && obj_tv.tvsprite != spr_tvoff) ? true : false;