accel = 0;
canleave = 0;
image_speed = 0;
sprite_index = obj_player.spr_rankwait;
alarm[3] = 180;
depth = -6;
totalalpha = 0;
event = 0;
if (global.challengemode == 1 && global.highestcombo >= 20)
{
	scr_sound(sound_toppingot);
	global.challengemode = 0;
}
if (global.challengemode == 1 && global.highestcombo < 20)
{
	scr_sound(sound_parry);
	global.challengemode = 0;
}
if (global.challengemode == 2 && global.playminutes >= 2)
{
	scr_sound(sound_toppingot);
	global.challengemode = 0;
}
if (global.challengemode == 2 && global.playminutes < 2)
{
	scr_sound(sound_parry);
	global.challengemode = 0;
}
drawmallow = false;
drawchoco = false;
drawcrack = false;
drawworm = false;
drawcandy = false;
mallowdex = 0;
chocodex = 0;
crackdex = 0;
wormdex = 0;
candydex = 0;
shake1 = false;
shake2 = false;
shake3 = false;
shake4 = false;
shake5 = false;
scale1 = 0;
scale2 = 0;
scale3 = 0;
scale4 = 0;
scale5 = 0;
card1 = 0;
card2 = 0;
card3 = 0;
sevent = 0;
cshake1 = false;
cshake2 = false;
cshake3 = false;
card1spr = (global.secretfound > 0 ? spr_rankcardflipped : spr_rankcard);
card2spr = (global.secretfound > 1 ? spr_rankcardflipped : spr_rankcard);
card3spr = (global.secretfound > 2 ? spr_rankcardflipped : spr_rankcard);
carddex1 = 0;
carddex2 = 0;
carddex3 = 0;
cakedex = 0;
countpoint = global.collect;
if (countpoint >= global.srank)
{
	if (global.lapcount >= 10 && global.hurtcounter < 1 && global.hasallconfecti && !global.combolost && global.secretfound > 2 && global.treasure)
		dex = 6;
	else if (!global.combolost && global.secretfound > 2 && global.treasure && global.lapcount >= 2)
		dex = 5;
	else
		dex = 4;
}
else if (countpoint >= global.arank && countpoint < global.srank)
	dex = 3;
else if (countpoint >= global.brank && countpoint < global.arank)
	dex = 2;
else if (countpoint >= global.crank && countpoint < global.brank)
	dex = 1;
else if (countpoint < global.crank)
	dex = 0;
flash = 0;
pshake = false;
pspeed = 0;
counting = false;
rscale = 1;
stampani = 0;
stampdex = 0;
rankdex = dex + 1;
playerdex = 0;
hatdex = 0;
hatunlock = false;
hatappear = false;
hatdisappear = true;
hatmsg = "balls";
hatmsgx = 500;
hatmsgy = 600;
stampsnd = false;
inicollect = global.collect / 30;
collected = "0";
var i = 0;
var _string = round(string(countpoint));
var _string_length = string_length(_string) + 1;
for (i = 0; i < _string_length; i++)
	colors[i] = irandom(6);
bgx = 0;
bgy = 0;
bgspr = bg_rank;
bgdex = 0;
paltime = 0;
rankpal = spr_rankpal;
janspr = spr_rankrudejanitor;
lapjanspr = spr_rankotherjanitor
janscale = 1;
jandraw = 1;
clipy = 809;
goup = false;
if (global.treasure == 1)
	janspr = spr_rankrudejanitor;
else
	janspr = spr_null;
if (global.lapcount >= 2 && global.jerald)
	lapjanspr = spr_rankotherjanitor;
else
	lapjanspr = spr_null;

function setcolors(argument0, argument1, argument2, argument3, argument4, argument5)
{
	realcol = 
	{
		r: argument0,
		g: argument1,
		b: argument2,
		r2: argument3,
		g2: argument4,
		b2: argument5
	};
};
function afterimagesetup()
{
	shader_set(shd_afterimage);
	var colorblend1 = shader_get_uniform(shd_afterimage, "blendcolor1");
	shader_set_uniform_f(colorblend1, realcol.r / 255, realcol.g / 255, realcol.b / 255);
	var colorblend2 = shader_get_uniform(shd_afterimage, "blendcolor2");
	shader_set_uniform_f(colorblend2, realcol.r2 / 255, realcol.g2 / 255, realcol.b2 / 255);
};
