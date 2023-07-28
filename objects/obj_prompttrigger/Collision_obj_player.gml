obj_tv.nexttext = prompt;
ds_list_add(global.saveroom, id);
instance_destroy();
obj_tv.prompt_timer = time;
if (!obj_tv.promptappear)
	obj_tv.promptappear = true;
