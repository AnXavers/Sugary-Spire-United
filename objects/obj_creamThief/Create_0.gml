scr_collision_init();
taunttimer = 0;
tauntStored = 
{
	
};
verticalMovespeed = 0;
start_x = xstart;
start_y = ystart;
start_xscale = image_xscale;
xscale = image_xscale;
movespeed = 0;
grav = 0.5;
hsp = 0;
vsp = 0;
image_speed = 0.35;
grounded = 0;
state = 0;
with (instance_create(x, y, obj_icontracker))
{
	target = other.id;
	visible_cond = function()
	{
		return target.state != 0;
	};
}
