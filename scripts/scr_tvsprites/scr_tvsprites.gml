function scr_tvsprites()
{
	tvspr = spr_pizzelletv
	idletvspr = spr_pizzelletv_idle;
	combotvspr = spr_pizzelletv_combo;
	happytvspr = spr_pizzelletv_happy;
	tvchange1 = spr_pizzelletv_idleanim1;
	tvchange2 = spr_pizzelletv_idleanim2;
	cottontvspr = spr_pizzelletv_cotton;
	hurttvspr = spr_pizzelletv_hurt;
	minecarttvspr = spr_pizzelletv_mine;
	bombtvspr = spr_pizzelletv_bomb;
	firetvspr = spr_pizzelletv_fire;
	angrytvspr = spr_pizzelletv_angry;
	orbtvspr = spr_pizzelletv_croaked;
	ufotvspr = spr_pizzelletv_ufo;
	mach1tvspr = spr_pizzelletv_mach1;
	mach2tvspr = spr_pizzelletv_mach2;
	mach3tvspr = spr_pizzelletv_mach3;
	mach4tvspr = spr_pizzelletv_mach4;
	machrolltvspr = spr_pizzelletv_machroll;
	frostburntvspr = spr_pizzelletv_flushed;
	hooktvspr = spr_pizzelletv_hook;
	marshdogspr = spr_pizzelletv_marsh;
	panictvspr = spr_pizzelletv_escape;
	laptvspr = spr_pizzelletv_rage;
	secrettvspr = spr_pizzelletv_secret;
	crashtvspr = spr_pizzelletv_ouchiecrash;
	lap3tvspr = spr_pizzelletv_lap3;
	lap4tvspr = spr_pizzelletv_lap4;
	confecti1tvspr = spr_pizzelletv_confecti1
	confecti2tvspr = spr_pizzelletv_confecti2
	confecti3tvspr = spr_pizzelletv_confecti3
	confecti4tvspr = spr_pizzelletv_confecti4
	confecti5tvspr = spr_pizzelletv_confecti5
	hurttext1tvspr = spr_pizzelletv_hurtext1
	keytvspr = spr_pizzelletv_key
	janitor1tvspr = spr_pizzelletv_janitor
	janitor2tvspr = spr_pizzelletv_janitor2
	escape1tvspr = spr_pizzelletv_escape1;
	escape2tvspr = spr_pizzelletv_escape2;
	escape3tvspr = spr_pizzelletv_escape3;
	escape4tvspr = spr_pizzelletv_escape4;
	escape5tvspr = spr_pizzelletv_escape5;
	escape6tvspr = spr_pizzelletv_escape6;
	escape7tvspr = spr_pizzelletv_escape7;
	DrawX = 0;
	OldDrawY = 0;
	tvcutspr = spr_pizzelletv_cut;
	if global.newplayeranim
	{
		tvspr = spr_pizzelletv_new
		marshdogspr = spr_pizzelletv_marsh_new;
		idletvspr = spr_pizzelletv_idle_new;
		tvchange1 = spr_pizzelletv_idleanim1_new
		tvchange2 = spr_pizzelletv_idleanim2_new
	}
	switch (obj_player.character)
	{
		case "N":
			tvspr = spr_pizzanotv;
			idletvspr = spr_pizzanotv_idle;
			combotvspr = spr_pizzanotv_combo;
			happytvspr = spr_pizzanotv_happy;
			tvchange1 = spr_pizzanotv_idleanim1;
			tvchange2 = spr_pizzanotv_idleanim1;
			cottontvspr = spr_pizzanotv_cotton;
			hurttvspr = spr_pizzanotv_hurt;
			minecarttvspr = spr_pizzanotv_mine;
			orbtvspr = spr_pizzanotv_croaked;
			mach1tvspr = spr_pizzanotv_mach1;
			mach2tvspr = spr_pizzanotv_mach2;
			mach3tvspr = spr_pizzanotv_mach3;
			mach4tvspr = spr_pizzanotv_mach4;
			frostburntvspr = spr_pizzanotv_flushed;
			panictvspr = spr_pizzanotv_panic;
			laptvspr = spr_pizzanotv_lap3;
			lap3tvspr = spr_pizzanotv_lap3;
			lap4tvspr = spr_pizzanotv_lap4;
			break;
		case "S":
			tvspr = spr_peppinotv;
			idletvspr = spr_peppinotv_idle;
			combotvspr = spr_peppinotv_combo;
			happytvspr = spr_peppinotv_collect;
			tvchange1 = spr_peppinotv_idleanim1;
			tvchange2 = spr_peppinotv_idleanim2;
			hurttvspr = spr_peppinotv_hurt;
			bombtvspr = spr_peppinotv_bomb;
			firetvspr = spr_peppinotv_fireass;
			angrytvspr = spr_peppinotv_heat;
			mach1tvspr = spr_peppinotv_mach3;
			mach2tvspr = spr_peppinotv_mach3;
			mach3tvspr = spr_peppinotv_mach3;
			mach4tvspr = spr_peppinotv_mach4;
			panictvspr = spr_peppinotv_panic;
			laptvspr = spr_peppinotv_heat;
			lap3tvspr = spr_peppinotv_heat;
			lap4tvspr = spr_peppinotv_heat;
			tvcutspr = spr_peppinotv_cut;
			break;
		case "C":
			tvspr = spr_coneboytv;
			idletvspr = spr_coneboytv_idle;
			tvchange1 = spr_coneboytv_idle;
			tvchange2 = spr_coneboytv_idle;
			tvcutspr = spr_coneboytv_cut;
			break;
		case "T":
			tvspr = spr_noisetv;
			idletvspr = spr_noisetv_idle;
			combotvspr = spr_noisetv_combo;
			happytvspr = spr_noisetv_collect;
			tvchange1 = spr_noisetv_idleanim1;
			tvchange2 = spr_noisetv_idleanim2;
			cottontvspr = spr_pizzanotv_cotton;
			hurttvspr = spr_noisetv_hurt;
			bombtvspr = spr_noisetv_bomb;
			firetvspr = spr_noisetv_fireass;
			angrytvspr = spr_noisetv_heat;
			orbtvspr = spr_pizzanotv_croaked;
			mach1tvspr = spr_noisetv_mach3;
			mach2tvspr = spr_noisetv_mach3;
			mach3tvspr = spr_noisetv_mach3;
			mach4tvspr = spr_noisetv_mach4;
			panictvspr = spr_noisetv_panic;
			secrettvspr = spr_noisetv_secret
			laptvspr = spr_noisetv_heat;
			tvcutspr = spr_peppinotv_cut;
			break;
				case "PT":
			tvspr = spr_noisetv;
			idletvspr = spr_noisetv_idle;
			combotvspr = spr_noisetv_combo;
			happytvspr = spr_noisetv_collect;
			tvchange1 = spr_noisetv_idleanim1;
			tvchange2 = spr_noisetv_idleanim2;
			cottontvspr = spr_pizzanotv_cotton;
			hurttvspr = spr_noisetv_hurt;
			bombtvspr = spr_noisetv_bomb;
			firetvspr = spr_noisetv_fireass;
			angrytvspr = spr_noisetv_heat;
			orbtvspr = spr_pizzanotv_croaked;
			mach1tvspr = spr_noisetv_mach3;
			mach2tvspr = spr_noisetv_mach3;
			mach3tvspr = spr_noisetv_mach3;
			mach4tvspr = spr_noisetv_mach4;
			panictvspr = spr_noisetv_panic;
			secrettvspr = spr_noisetv_secret
			laptvspr = spr_noisetv_heat;
			tvcutspr = spr_peppinotv_cut;
			break;
		case "V":
			tvspr = spr_vigilantetv;
			panictvspr = spr_vigilantetv_panic;
			mach1tvspr = spr_vigilantetv_mach3;
			mach2tvspr = spr_vigilantetv_mach3;
			mach3tvspr = spr_vigilantetv_mach3;
			mach4tvspr = spr_vigilantetv_mach3;
			tvcutspr = spr_peppinotv_cut;
			break;
		case "M":
			tvspr = spr_peppinotv;
			happytvspr = spr_peppermantv_collect;
			tvcutspr = spr_peppinotv_cut;
			break;
	}
	if global.oldhud
	{
		idletvspr = spr_pizzelle_normalHUD;
		combotvspr = spr_pizzelle_menacingHUD;
		happytvspr = spr_pizzelle_happyHUD;
		escapetvspr = spr_pizzelle_explodedHUD;
		tvchange1 = spr_pizzelle_normal1HUD;
		tvchange2 = spr_pizzelle_normal2HUD;
		cottontvspr = spr_pizzelle_cottonHUD;
		hurttvspr = spr_pizzelle_hurtHUD;
		minecarttvspr = spr_pizzelle_cottonHUD;
		bombtvspr = spr_pizzelle_explodedHUD;
		firetvspr = spr_pizzelle_explodedHUD;
		angrytvspr = spr_pizzelle_menacingHUD;
		orbtvspr = spr_pizzelle_cottonHUD;
		ufotvspr = spr_pizzelle_cottonHUD;
		mach1tvspr = spr_pizzelle_mach1HUD;
		mach2tvspr = spr_pizzelle_mach2HUD;
		mach3tvspr = spr_pizzelle_mach3HUD;
		mach4tvspr = spr_pizzelle_mach4HUD;
		machrolltvspr = spr_pizzelle_superjumpprepHUD;
		frostburntvspr = spr_pizzelle_cottonHUD;
		hooktvspr = spr_pizzelle_bumpHUD;
		marshdogspr = spr_pizzelle_mach1HUD;
		panictvspr = spr_pizzelle_hurtHUD;
		laptvspr = spr_pizzelle_menacingHUD;
		secrettvspr = spr_pizzelle_happyHUD;
		crashtvspr = spr_pizzelle_slamHUD;
		lap3tvspr = spr_pizzelle_hurtHUD;
		lap4tvspr = spr_pizzelle_explodedHUD;
		confecti1tvspr = spr_pizzelle_happyHUD
		confecti2tvspr = spr_pizzelle_happyHUD
		confecti3tvspr = spr_pizzelle_happyHUD
		confecti4tvspr = spr_pizzelle_happyHUD
		confecti5tvspr = spr_pizzelle_happyHUD
		keytvspr = spr_pizzelle_happyHUD
		janitor1tvspr = spr_pizzelle_happyHUD
		janitor2tvspr = spr_pizzelle_happyHUD
		DrawX = 715
		OldDrawY = 10
		switch (obj_player.character)
		{
			case "S":
				idletvspr = spr_peppino_HUD;
				combotvspr = spr_peppino_HUDmenacing;
				happytvspr = spr_peppino_HUDhappy;
				escapetvspr = spr_peppino_HUDpanic;
				tvchange1 = spr_peppino_HUD;
				tvchange2 = spr_peppino_HUD;
				cottontvspr = spr_peppino_HUDknight;
				hurttvspr = spr_peppino_HUDhurt;
				minecarttvspr = spr_peppino_HUDknight;
				bombtvspr = spr_peppino_HUDbombend;
				firetvspr = spr_peppino_HUDbombend;
				angrytvspr = spr_peppino_HUDmenacing;
				orbtvspr = spr_peppino_HUDstun;
				ufotvspr = spr_peppino_HUDknight;
				mach1tvspr = spr_peppino_HUDmach1;
				mach2tvspr = spr_peppino_HUDmach2;
				mach3tvspr = spr_peppino_HUDmach3;
				mach4tvspr = spr_peppino_HUDmach4;
				machrolltvspr = spr_peppino_HUDrolling;
				frostburntvspr = spr_peppino_HUDknight;
				hooktvspr = spr_peppino_HUDstun;
				marshdogspr = spr_peppino_HUDknight;
				panictvspr = spr_peppino_HUDpanic;
				laptvspr = spr_peppino_HUDscream;
				lap3tvspr = spr_peppino_HUD3hp;
				lap4tvspr = spr_peppino_HUD1hp;
				break;
			case "T":
				idletvspr = spr_noiseHUD_idle;
				combotvspr = spr_noiseHUD_menacing;
				happytvspr = spr_noiseHUD_happy;
				escapetvspr = spr_noiseHUD_panic;
				tvchange1 = spr_noiseHUD_idle;
				tvchange2 = spr_noiseHUD_idle;
				cottontvspr = spr_noiseHUD_knight;
				hurttvspr = spr_noiseHUD_hurt;
				minecarttvspr = spr_noiseHUD_knight;
				bombtvspr = spr_noiseHUD_knight;
				firetvspr = spr_noiseHUD_angry;
				angrytvspr = spr_noiseHUD_angry;
				orbtvspr = spr_noiseHUD_knight;
				ufotvspr = spr_noiseHUD_knight;
				mach1tvspr = spr_noiseHUD_mach1;
				mach2tvspr = spr_noiseHUD_mach2;
				mach3tvspr = spr_noiseHUD_mach3;
				mach4tvspr = spr_noiseHUD_crazyrun;
				machrolltvspr = spr_peppino_HUDrolling;
				frostburntvspr = spr_noiseHUD_knight;
				hooktvspr = spr_noiseHUD_lowhealth;
				marshdogspr = spr_noiseHUD_knight;
				panictvspr = spr_noiseHUD_panic;
				secrettvspr = spr_noiseHUD_happy
				laptvspr = spr_noiseHUD_lowhealth;
		}
	}
}
