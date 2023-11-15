// Feather disable GM1049
var curMsg = global.dialogmsg[current_message];
var dialogLength = array_length(global.dialogmsg);
var _text = curMsg[0];
var _textLength = string_length(_text);
var _portrait = curMsg[1];
var _sound = curMsg[2];
var _func = curMsg[3];
var hasImage = _portrait != -4;
var _states = obj_player.state == states.talkto || obj_player.state == states.actor;
var _spd = (yoffset < 50) ? (((yoffset / 50) * 8) + 0.3) : 8;
snddelay = drawspd * 3;
if (!_states && state != 1)
	instance_destroy();
switch (state)
{
	case 0:
		yoffset = approach(yoffset, 0, _spd);
		if (yoffset == 0 || (_states && obj_player.key_jump))
			state = 2;
		break;
	case 1:
		yoffset = approach(yoffset, 200, _spd);
		if (yoffset == 200 || instant_destroy)
			instance_destroy();
		break;
	case 2:
		yoffset = 0;
		if ((_states && obj_player.key_jump) || force_next)
		{
			if (drawchar >= _textLength || force_next)
				event_user(0);
			else
			{
				real_drawchar = _textLength;
				drawchar = _textLength;
			}
		}
		break;
	case 3:
		yoffset = 0;
		var totalChoices = array_length(global.dialogchoices);
		var curChoice = global.dialogchoices[choice_selected];
		var _funcChoice = curChoice[1];
		move2 = -(obj_player.key_up2 - obj_player.key_down2);
		choice_selected += (1 * move2);
		choice_selected = wrap(choice_selected, 0, totalChoices - 1);
		if (obj_player.state == states.talkto && obj_player.key_jump)
		{
			drawchar = 0;
			if (current_message == (dialogLength - 1))
			{
				state = 1;
				obj_player.state = states.normal;
			}
			else
				current_message++;
			if (_func != -4)
			{
				if (whos_talkin != -4 && instance_exists(whos_talkin))
				{
					with whos_talkin
						_func();
				}
				else
					_func();
			}
		}
		break;
}
pause_time--;
if (pause_time <= 0)
{
	if (drawchar < (_textLength + 1) && (state == 2 || state == 3))
	{
		drawchar += drawspd;
		var curLetter = string_char_at(_text, real_drawchar);
		var nextLetter = string_char_at(_text, real_drawchar + 1);
		var nexterLetter = string_char_at(_text, real_drawchar + 2);
		var nextestLetter = string_char_at(_text, real_drawchar + 3);
		if (_sound != -4)
		{
			if (sndcnt < snddelay)
				sndcnt++;
			else
			{
				sndcnt = 0;
				scr_sound(_sound);
			}
		}
	}
}
else
	show_debug_message(pause_time);
