initialvsp = random_range(-5, -10);
initialhsp = sign(x - obj_player.x) * random_range(5, 10);
if (x != obj_player.x)
	image_xscale = -sign(x - obj_player.x);
vsp = initialvsp;
hsp = initialhsp;
grav = 0.3;
alarm[0] = 5;
cigar = 0;
stomped = 0;
drawx = x;
drawy = y;
canrotate = false;
rotatedirection = irandom_range(-1, 1);
rotatevalue = irandom_range(-20, 20);
pal_sprite = -4;
spr_palette = -4;
paletteselect = -4;
col = 0;
depth = -250;