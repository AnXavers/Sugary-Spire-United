if (global.panic == 1 && !global.oldhud)
	scr_queue_tvanim(choose(escape1tvspr, escape2tvspr, escape3tvspr, escape4tvspr, escape5tvspr, escape6tvspr, escape7tvspr), 240);
alarm[1] = irandom_range(300, 1000);
