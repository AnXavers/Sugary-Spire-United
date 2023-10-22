global.collect = 0;
if (instance_exists(obj_rudejanitor))
	instance_destroy(obj_rudejanitor);
global.lapcount = 1;
global.Eranklength = 1;
ds_list_clear(global.doorsave);
global.isoldw1 = 1;
global.harrycolor = 0;