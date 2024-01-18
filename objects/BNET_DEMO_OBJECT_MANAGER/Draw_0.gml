var 
g = depth_grid,
inst_num = instance_number(BNET_DEMO_OBJECT_PLAYER);
if(inst_num < 1) exit;

ds_grid_resize(g, 2, inst_num);

var yy = 0;

with(BNET_DEMO_OBJECT_PLAYER){
	g[# 0, yy] = id;
	g[# 1, yy] = y;
	yy++
}

ds_grid_sort(g, 1, true);

yy = 0;

repeat(inst_num){
	with(g[# 0, yy]) event_perform(ev_draw, 0);	
	yy++;
}