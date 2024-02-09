if (key_jump)
	playedjumpsound = 0;
scr_getinput();
characterspr();
characterpal();
charactergui();
characterenv();
charactersfx();
if (state == states.gottreasure || sprite_index == spr_peppino_knightstart || sprite_index == spr_peppino_knightthunder || state == states.keyget || state == states.door || state == states.victory || state == states.comingoutdoor || state == states.gameover)
	cutscene = 1;
else
	cutscene = 0;
is_inSecretPortal = false;
if (grounded && vsp >= 0 && !(state == states.climbwall || state == states.tumble || state == states.grab || state == states.freefallland || state == states.shotgun || state == states.finishingblow || state == states.shoulder))
{
	var targetangle = 360;
	var RotationStep = ((abs(hsp) / 16) - 2) * -1;
	if (abs(hsp) >= 8 || state == states.minecart)
	{
		targetangle = scr_slopeangle();
		RotationStep = (((abs(hsp) / 16) + (abs(hsp) / 32)) - 2) * -1;
	}
	slope_angle = darctan2(dsin(targetangle) + (dsin(slope_angle) * RotationStep), dcos(targetangle) + (dcos(slope_angle) * RotationStep));
}
else
{
	var _rotateSpeed = 16;
	if (slope_angle <= 0)
		slope_angle += 360;
	if (slope_angle < 180)
		slope_angle = lerp(slope_angle, 0, 0.25);
	else
		slope_angle = lerp(slope_angle, 360, 0.25);
	slope_angle = round(slope_angle);
}
draw_angle = slope_angle;
scr_playerstate();
