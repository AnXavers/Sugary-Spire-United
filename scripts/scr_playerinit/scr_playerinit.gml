function scr_playerrespawn(argument0 = true)
{
	if (!argument0)
	{
		if (state != states.gameover && state != states.actor && state != states.fling && !place_meeting(x, y, obj_vertical_hallway) && !instance_exists(obj_fadeout) && room != outer_room2 && room != timesuproom && room != rank_room)
		{
			var _checkpoint = instance_nearest(x, y, obj_checkpoint_invis);
			var _checkpointReal = -4;
			with (obj_checkpoint)
			{
				if (Checkpointactivated == 1)
					_checkpointReal = id;
			}
			if (instance_exists(_checkpoint) && _checkpoint.Checkpointactivated == 1)
			{
				x = _checkpoint.x;
				y = _checkpoint.y;
				instance_create(_checkpoint.x, _checkpoint.y, obj_poofeffect);
			}
			else if (instance_exists(_checkpointReal) && _checkpointReal.Checkpointactivated == 1)
			{
				x = _checkpointReal.x;
				y = _checkpointReal.y;
				instance_create(_checkpointReal.x, _checkpointReal.y, obj_poofeffect);
			}
			else
			{
				x = roomstartx;
				y = roomstarty;
				instance_create(roomstartx, roomstarty, obj_poofeffect);
			}
			if (instance_exists(obj_train))
			{
				with (obj_train)
				{
					x = xstart;
					y = ystart;
					image_xscale = start_xscale;
					image_index = 0;
					sprite_index = spr_spray;
					vsp = 0;
					movespeed = 10;
					state = states.frozen;
				}
			}
			state = states.hurt;
			if global.newvoicelines
				scr_sound(choose(sfx_newhurt1p, sfx_newhurt2p))
			alarm[8] = 30;
			alarm[7] = 60;
			hurted = 1;
			sprite_index = spr_pizzelle_hurt;
			movespeed = 0;
			vsp = -3;
		}
	}
	else if (room != timesuproom && !instance_exists(obj_techdiff) && !instance_exists(obj_fadeout))
		instance_create(x, y, obj_techdiff);
}
function scr_playerstate()
{
	var _stateFunction = undefined;
	switch (state)
	{
		case states.frozen:
			_stateFunction = state_player_frozen;
			break;
		case states.normal:
			_stateFunction = state_player_normal;
			break;
		case states.titlescreen:
			_stateFunction = state_player_titlescreen;
			break;
		case states.Nhookshot:
			_stateFunction = scr_playerN_hookshot;
			break;
		case states.slap:
			_stateFunction = state_player_slap;
			break;
		case states.charge:
			_stateFunction = state_player_charge;
			break;
		case states.cheesepep:
			_stateFunction = state_player_cheesepep;
			break;
		case states.cheeseball:
			_stateFunction = state_player_cheeseball;
			break;
		case states.cheesepepstick:
			_stateFunction = state_player_cheesepepstick;
			break;
		case states.boxxedpep:
			_stateFunction = state_player_boxxedpep;
			break;
		case states.pistalaim:
			_stateFunction = state_player_pistolaim;
			break;
		case states.climbwall:
			_stateFunction = state_player_climbwall;
			break;
		case states.climbdownwall:
			_stateFunction = state_player_climbdownwall;
			break;
		case states.knightpepslopes:
			_stateFunction = state_player_knightpepslopes;
			break;
		case states.portal:
			_stateFunction = state_player_portal;
			break;
		case states.secondjump:
			_stateFunction = state_player_secondjump;
			break;
		case states.chainsawbump:
			_stateFunction = state_player_chainsawbump;
			break;
		case states.handstandjump:
			_stateFunction = state_player_handstandjump;
			break;
		case states.gottreasure:
			_stateFunction = state_player_gottreasure;
			break;
		case states.knightpep:
			_stateFunction = state_player_knightpep;
			break;
		case states.knightpepattack:
			_stateFunction = state_player_knightpepattack;
			break;
		case states.meteorpep:
			_stateFunction = state_player_meteorpep;
			break;
		case states.bombpep:
			_stateFunction = state_player_bombpep;
			break;
		case states.grabbing:
			_stateFunction = state_player_grabbing;
			break;
		case states.chainsawpogo:
			_stateFunction = state_player_chainsawpogo;
			break;
		case states.shotgunjump:
			_stateFunction = state_player_shotgunjump;
			break;
		case states.stunned:
			_stateFunction = state_player_stunned;
			break;
		case states.highjump:
			_stateFunction = state_player_highjump;
			break;
		case states.chainsaw:
			_stateFunction = state_player_chainsaw;
			break;
		case states.facestomp:
			_stateFunction = state_player_facestomp;
			break;
		case states.timesup:
			_stateFunction = state_player_timesup;
			break;
		case states.machroll:
			_stateFunction = state_player_machroll;
			break;
		case states.pistol:
			_stateFunction = state_player_pistol;
			break;
		case states.shotgun:
			_stateFunction = state_player_shotgun;
			break;
		case states.machfreefall:
			_stateFunction = state_player_machfreefall;
			break;
		case states.throwing:
			_stateFunction = state_player_throw;
			break;
		case states.superslam:
			_stateFunction = state_player_superslam;
			break;
		case states.slam:
			_stateFunction = state_player_slam;
			break;
		case states.skateboard:
			_stateFunction = state_player_skateboard;
			break;
		case states.grind:
			_stateFunction = state_player_grind;
			break;
		case states.grab:
			_stateFunction = state_player_grab;
			break;
		case states.punch:
			_stateFunction = state_player_punch;
			break;
		case states.backkick:
			_stateFunction = state_player_backkick;
			break;
		case states.uppunch:
			_stateFunction = state_player_uppunch;
			break;
		case states.shoulder:
			_stateFunction = state_player_shoulder;
			break;
		case states.backbreaker:
			_stateFunction = state_player_backbreaker;
			break;
		case states.bossdefeat:
			_stateFunction = state_player_bossdefeat;
			break;
		case states.bossintro:
			_stateFunction = state_player_bossintro;
			break;
		case states.ufofloat:
			_stateFunction = state_player_ufofloat;
			break;
		case states.ufodash:
			_stateFunction = state_player_ufodash;
			break;
		case states.pizzathrow:
			_stateFunction = state_player_pizzathrow;
			break;
		case states.gameover:
			_stateFunction = state_player_gameover;
			break;
		case states.Sjumpland:
			_stateFunction = state_player_Sjumpland;
			break;
		case states.freefallprep:
			_stateFunction = state_player_freefallprep;
			break;
		case states.runonball:
			_stateFunction = state_player_runonball;
			break;
		case states.boulder:
			_stateFunction = state_player_boulder;
			break;
		case states.keyget:
			_stateFunction = state_player_keyget;
			break;
		case states.tackle:
			_stateFunction = state_player_tackle;
			break;
		case states.slipnslide:
			_stateFunction = state_player_slipnslide;
			break;
		case states.ladder:
			_stateFunction = state_player_ladder;
			break;
		case states.jump:
			_stateFunction = state_player_jump;
			break;
		case states.victory:
			_stateFunction = state_player_victory;
			break;
		case states.comingoutdoor:
			_stateFunction = state_player_comingoutdoor;
			break;
		case states.Sjump:
			_stateFunction = state_player_Sjump;
			break;
		case states.Sjumpprep:
			_stateFunction = state_player_Sjumpprep;
			break;
		case states.crouch:
			_stateFunction = state_player_crouch;
			break;
		case states.crouchjump:
			_stateFunction = state_player_crouchjump;
			break;
		case states.crouchslide:
			_stateFunction = state_player_crouchslide;
			break;
		case states.mach1:
			_stateFunction = state_player_mach1;
			break;
		case states.mach2:
			_stateFunction = state_player_mach2;
			break;
		case states.mach3:
			_stateFunction = state_player_mach3;
			break;
		case states.machslide:
			_stateFunction = state_player_machslide;
			break;
		case states.bump:
			_stateFunction = state_player_bump;
			break;
		case states.hurt:
			_stateFunction = state_player_hurt;
			break;
		case states.freefall:
			_stateFunction = state_player_freefall;
			break;
		case states.freefallland:
			_stateFunction = state_player_freefallland;
			break;
		case states.hang:
			_stateFunction = state_player_hang;
			break;
		case states.door:
			_stateFunction = state_player_door;
			break;
		case states.pepperman_pinball:
			_stateFunction = state_pepperman_pinball;
			break;
		case states.candy_normal:
			_stateFunction = state_pepperman_pinball;
			break;
		case states.candy_dash:
			_stateFunction = state_pepperman_pinball;
			break;
		case states.candy_pinball:
			_stateFunction = state_pepperman_pinball;
			break;
		case states.cottonspring:
			_stateFunction = state_player_cottonspring;
			break;
		case states.cookiemount:
			_stateFunction = state_player_cookiemount;
			break;
		case states.cookiemountattack:
			_stateFunction = state_player_cookiemountattack;
			break;
		case states.cookiemountfireass:
			_stateFunction = state_player_cookiemountfireass;
			break;
		case states.current:
			_stateFunction = state_player_current;
			break;
		case states.finishingblow:
			_stateFunction = state_player_finishingblow;
			break;
		case states.cotton:
			_stateFunction = state_player_cotton;
			break;
		case states.uppercut:
			_stateFunction = state_player_uppercut;
			break;
		case states.pal:
			_stateFunction = state_player_pal;
			break;
		case states.shocked:
			_stateFunction = state_player_shocked;
			break;
		case states.bushdisguise:
			_stateFunction = state_player_bushdisguise;
			break;
		case states.parry:
			_stateFunction = state_player_parry;
			break;
		case states.tumble:
			_stateFunction = state_player_tumble;
			break;
		case states.talkto:
			_stateFunction = state_player_talkto;
			break;
		case states.puddle:
			_stateFunction = state_player_puddle;
			break;
		case states.cottondrill:
			_stateFunction = state_player_cottondrill;
			break;
		case states.cottonroll:
			_stateFunction = state_player_cottonroll;
			break;
		case states.fling:
			_stateFunction = state_player_fling;
			break;
		case states.breakdance:
			_stateFunction = state_player_breakdance;
			break;
		case states.gumbob_propeller:
			_stateFunction = scr_gumbob_propeller;
			break;
		case states.gumbob_mixnbrew:
			_stateFunction = scr_gumbob_mixnbrew;
			break;
		case states.minecart:
			_stateFunction = state_player_minecart;
			break;
		case states.fireass:
			_stateFunction = state_player_fireass;
			break;
		case states.squished:
			_stateFunction = state_player_squished;
			break;
		case states.machtumble:
			_stateFunction = state_player_machtumble;
			break;
		case states.pizzano_mach:
			_stateFunction = scr_mach_pizzano;
			break;
		case states.pizzano_rocketfist:
			_stateFunction = scr_rocketfist_pizzano;
			break;
		case states.pizzano_kungfu:
			_stateFunction = scr_pizzano_kungfu;
			break;
		case states.pizzano_pummel:
			_stateFunction = scr_pizzano_pummel;
			break;
		case states.coneboy_inhale:
			_stateFunction = scr_coneboy_inhale;
			break;
		case states.coneboy_inhale114:
			_stateFunction = scr_coneboy_inhale;
			break;
		case states.coneboy_inhale115:
			_stateFunction = scr_coneboy_inhale;
			break;
		case states.coneboy_kick:
			_stateFunction = scr_coneboy_kick;
			break;
		case states.geyser:
			_stateFunction = state_player_geyser;
			break;
		case states.pizzano_twirl:
			_stateFunction = scr_pizzano_twirl;
			break;
		case states.pizzano_machtwirl:
			_stateFunction = scr_pizzano_machtwirl;
			break;
		case states.pizzano_shoulderbash:
			_stateFunction = scr_pizzano_shoulderbash;
			break;
		case states.pizzano_wallcling:
			_stateFunction = scr_pizzano_wallcling;
			break;
		case states.actor:
			_stateFunction = state_player_actor;
			break;
		case states.changing:
			_stateFunction = state_player_changing;
			break;
		case states.donothing:
			_stateFunction = state_player_donothing;
			break;
		case states.mini:
			_stateFunction = state_player_mini;
			break;
		case states.flushed:
			_stateFunction = state_player_flushed;
			break;
		case states.drown:
			_stateFunction = state_player_drown;
			break;
		case states.hooks:
			_stateFunction = state_player_hooks;
			break;
		case states.trick:
			_stateFunction = state_player_trick;
			break;
		case states.noclip:
			_stateFunction = state_player_noclip;
			break;
		case states.costumenormal:
			_stateFunction = state_player_costumenormal;
			break;
		case states.costumegrab:
			_stateFunction = state_player_costumegrab;
			break;
		case states.costumechuck:
			_stateFunction = state_player_costumechuck;
			break;
		case states.costumebreeze:
			_stateFunction = state_player_costumebreeze;
			break;
		case states.bottlerocket:
			_stateFunction = state_player_bottlerocket;
			break;
		case states.donut:
			_stateFunction = state_player_donut;
			break;
		case states.holdbomb:
			_stateFunction = state_player_holdbomb;
			break;
		case states.climbceiling:
			_stateFunction = state_player_climbceiling;
			break;
		case states.frostburn:
			_stateFunction = state_player_frostburn;
			break;
		case states.frostburnwallrun:
			_stateFunction = state_player_frostburnwallrun;
			break;
		case states.frostburnspin:
			_stateFunction = state_player_frostburnspin;
			break;
		case states.frostburnbump:
			_stateFunction = state_player_frostburnbump;
			break;
		case states.seacream:
			_stateFunction = state_player_seacream;
			break;
		case states.seacreamjump:
			_stateFunction = state_player_seacreamjump;
			break;
		case states.seacreamstick:
			_stateFunction = state_player_seacreamstick;
			break;
		case states.gumballoon:
			_stateFunction = state_player_gumballoon;
			break;
		case states.rupertnormal:
			_stateFunction = state_player_rupertnormal;
			break;
		case states.rupertslide:
			_stateFunction = state_player_rupertslide;
			break;
		case states.rupertjump:
			_stateFunction = state_player_rupertjump;
			break;
		case states.rupertstick:
			_stateFunction = state_player_rupertstick;
			break;
		case states.unused_3:
			_stateFunction = state_player_normal;
			break;
		case states.honey:
			_stateFunction = state_player_honey;
			break;
		case states.supergrab:
			_stateFunction = state_player_supergrab;
			break;
		case states.pogo:
			_stateFunction = scr_player_pogo;
			break;
		case states.dynamite:
			_stateFunction = state_player_dynamite
			break
		case states.cottonswim:
			_stateFunction = state_player_cottonswim()
			break
			case states.cottonbash:
			_stateFunction = state_coneboy_cottonbash()
			break
			case states.cottonbounce:
			_stateFunction = state_coneboy_cottonbounce()
			break
		case states.ufodashOLD:
			show_error("Smirk old code lmao", false);
			_stateFunction = state_player_ufodash;
			break;
	}
	stateName = "states.undefined";
	if (!is_undefined(_stateFunction))
	{
		_stateFunction();
		stateName = "states." + string_extract(script_get_name(_stateFunction), "_", 1) + string_extract(script_get_name(_stateFunction), "_", 3);
	}
}
function scr_taunt_storeVariables()
{
	tauntStored = 
	{
		state: state,
		hsp: hsp,
		prevHsp: prevHsp,
		vsp: vsp,
		prevVsp: prevVsp,
		movespeed: movespeed,
		verticalMovespeed: verticalMovespeed,
		sprite_index: sprite_index,
		image_index: image_index
	};
}
function scr_taunt_setVariables()
{
	state = tauntStored.state;
	hsp = tauntStored.hsp;
	prevHsp = tauntStored.prevHsp;
	vsp = tauntStored.vsp;
	prevVsp = tauntStored.prevVsp;
	movespeed = tauntStored.movespeed;
	verticalMovespeed = tauntStored.verticalMovespeed;
	sprite_index = tauntStored.sprite_index;
	image_index = tauntStored.image_index;
}
