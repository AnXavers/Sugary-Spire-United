function scr_tvsprites()
{
	idletvspr = spr_pizzytv;
	combotvspr = spr_pizzytv_combo;
	happytvspr = spr_pizzytvhappy;
	escapetvspr = spr_pizzytv_escape1;
	tvchange1 = spr_pizzytv2;
	tvchange2 = spr_pizzytv3;
	cottontvspr = spr_pizzytvcotton;
	hurttvspr = spr_pizzytvhurt;
	minecarttvspr = spr_pizzytvmine;
	bombtvspr = spr_pizzytvbomb;
	firetvspr = spr_pizzytvfire;
	angrytvspr = spr_pizzytvangry;
	orbtvspr = spr_pizzytv_croaked;
	ufotvspr = spr_pizzytvufo;
	mach1tvspr = spr_pizzytvmach1;
	mach2tvspr = spr_pizzytvmach2;
	mach3tvspr = spr_pizzytvmach3;
	mach4tvspr = spr_pizzytvmach4;
	machrolltvspr = spr_pizzytvmachroll;
	frostburntvspr = spr_pizzytvflushed;
	hooktvspr = spr_pizzytvhook;
	marshdogspr = spr_pizzytvmarsh;
	panictvspr = spr_pizzytvescape;
	secrettvspr = spr_pizzytv_secret;
	switch (obj_player.character)
	{
		case "N":
			idletvspr = spr_pizzanotv;
			combotvspr = spr_pizzanotv_combo;
			happytvspr = spr_pizzanotv_happy;
			escapetvspr = spr_pizzytv_escape1;
			tvchange1 = spr_pizzanotv2;
			tvchange2 = spr_pizzanotv2;
			cottontvspr = spr_pizzytvcotton;
			hurttvspr = spr_pizzytvhurt;
			minecarttvspr = spr_pizzytvmine;
			bombtvspr = spr_pizzytvbomb;
			firetvspr = spr_pizzytvfire;
			angrytvspr = spr_pizzytvangry;
			orbtvspr = spr_pizzytv_croaked;
			ufotvspr = spr_pizzytvufo;
			mach1tvspr = spr_pizzanotvmach1;
			mach2tvspr = spr_pizzanotvmach2;
			mach3tvspr = spr_pizzanotvmach3;
			mach4tvspr = spr_pizzanotvmach4;
			machrolltvspr = spr_pizzytvmachroll;
			frostburntvspr = spr_pizzytvflushed;
			hooktvspr = spr_pizzytvhook;
			marshdogspr = spr_pizzytvmarsh;
			panictvspr = spr_pizzytvescape;
			break;
		case "C":
			idletvspr = spr_coneboytv;
			escapetvspr = spr_coneboytv;
			tvchange1 = spr_coneboytv;
			tvchange2 = spr_coneboytv;
			cottontvspr = spr_coneboytv;
			hurttvspr = spr_coneboytv;
			minecarttvspr = spr_coneboytv;
			bombtvspr = spr_coneboytv;
			firetvspr = spr_coneboytv;
			angrytvspr = spr_coneboytv;
			orbtvspr = spr_coneboytv;
			ufotvspr = spr_pizzytvufo;
			mach1tvspr = spr_coneboytv;
			mach2tvspr = spr_coneboytv;
			mach3tvspr = spr_coneboytv;
			mach4tvspr = spr_coneboytv;
			frostburntvspr = spr_coneboytv;
			hooktvspr = spr_coneboytv;
			marshdogspr = spr_pizzytvmarsh;
			panictvspr = spr_pizzytvescape;
			break;
	}
}
