event_inherited();
firstGumslime = false;
grav = 0.5;
hsp = 1;
vsp = 0;
movespeed = 5;
state = enemystates.float;
stunned = 0;
alarm[0] = 150;
roaming = 1;
collectdrop = 5;
flying = 0;
straightthrow = 0;
cigar = 0;
cigarcreate = 0;
stomped = 0;
shot = 0;
thrown = 0;
reset = 0;
flash = 0;
landspr = spr_thundercloud;
idlespr = spr_thundercloud_stun;
fallspr = spr_thundercloud;
stunfallspr = spr_thundercloud_stun;
walkspr = spr_thundercloud;
turnspr = spr_thundercloud;
recoveryspr = spr_thundercloud;
grabbedspr = spr_thundercloud_stun;
scaredspr = spr_thundercloud_scared;
deadspr = spr_thundercloud_dead;
spr_throw = spr_thundercloud_throw;
throw_frame = 9;
bombreset = 100;
hp = 1;
slapped = 0;
grounded = 1;
birdcreated = 0;
boundbox = 0;
idletimer = 200;
substate = substates.unknown_0;
roomname = room_get_name(room);
spr_palette = spr_thundercloud_pal;
for (var i = 0; i < 11; i++)
{
	if (roomname == ("mountain_" + string(i)) && i < 7)
		paletteselect = 0;
	if (roomname == ("mountain_" + string(i)) && i > 6)
	{
		paletteselect = 1;
		if (roomname == ("mountain_" + string(i)) && i > 7)
			paletteselect = 2;
	}
}
if (roomname == "mountain_escape1")
	paletteselect = 2;
