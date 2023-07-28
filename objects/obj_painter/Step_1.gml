switch (state)
{
	case 2:
		scr_enemy_turn();
		break;
	case 0:
	case 3:
		scr_painter_walk();
		break;
	case 4:
		scr_enemy_land();
		break;
	case 5:
		scr_enemy_hit();
		break;
	case 1:
		scr_enemy_charge();
		break;
	case 6:
		scr_enemy_stun();
		break;
	case 10:
		scr_enemy_frozen();
		break;
	case 11:
		scr_enemy_shake();
		break;
	case 22:
		scr_enemy_float();
		break;
	case 23:
		scr_enemy_theif();
		break;
	case 12:
		scr_enemy_panicWait();
		break;
	case 13:
		scr_enemy_secretWait();
		break;
	case 7:
		scr_enemy_throw();
		break;
	case 8:
		scr_enemy_grabbed();
		break;
	case 9:
		scr_enemy_scared();
		break;
	case 14:
		scr_enemy_inhaled();
		break;
	case 15:
		scr_enemy_cherrywait();
		break;
	case 16:
		scr_enemy_charcherry();
		break;
	case 19:
		scr_enemy_slugidle();
		break;
	case 20:
		scr_enemy_slugjump();
		break;
	case 21:
		scr_enemy_slugparry();
		break;
	case 18:
		scr_enemy_kick();
		break;
	case 24:
		scr_enemy_eyescreamwait();
		break;
	case 25:
		scr_enemy_eyescream();
		break;
	case 26:
		scr_enemy_rage();
		break;
	case 17:
		scr_applejim_bash();
		break;
}
