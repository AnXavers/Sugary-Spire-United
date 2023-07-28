if (vsp < 20)
	vsp += grav;
x += hsp;
y += floor(vsp);
if (!alarm[0])
	alarm[0] = 5;
drawx = x;
drawy = y;
