/// @description Rank Show
if rankdex == 0
	stampani = 1
if global.collect >= global.srank
{
	rankdex = 5
}
else if global.collect >= global.arank && global.collect < global.srank
{
	rankdex = 4
}
else if global.collect >= global.brank && global.collect < global.arank
{
	rankdex = 3
}
else if global.collect >= global.crank && global.collect < global.brank
{
	rankdex = 2
}
else
{
	rankdex = 1
}
obj_player.visible = 0
if (obj_player.character == "P")
{
	if (global.rank == "p")
		sprite_index = spr_rankP;
	if (global.rank == "s")
		sprite_index = spr_rankS;
	if (global.rank == "a")
		sprite_index = spr_rankA;
	if (global.rank == "b")
		sprite_index = spr_rankB;
	if (global.rank == "c")
		sprite_index = spr_rankC;
	if (global.rank == "d")
		sprite_index = spr_rankD;
	if (global.rank == "e")
		sprite_index = spr_rankS;
}
if (obj_player.character == "N")
{
	if (global.rank == "s")
		sprite_index = spr_pizzano_rankS;
	if (global.rank == "a")
		sprite_index = spr_pizzano_rankA;
	if (global.rank == "b")
		sprite_index = spr_pizzano_rankB;
	if (global.rank == "c")
		sprite_index = spr_pizzano_rankC;
	if (global.rank == "d")
		sprite_index = spr_pizzano_rankD;
	if (global.rank == "e")
		sprite_index = spr_pizzano_rankS;
}
alarm[7] = 60
image_speed = 0.45
/*if hatunlock = false
	alarm[4] = 250
else
	alarm[5] = 250*/
canleave = 1
alarm[3] = -1
