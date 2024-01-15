function scr_levelSet()
{
	global.MinesFlags[0] = false;
	global.MinesFlags[1] = false;
	global.MinesFlags[2] = false;
	global.MinesFlags[3] = false;
	global.MinesFlags[4] = false;
	global.MinesFlags[5] = false;
	global.MinesFlags[6] = false;
	instance_destroy(obj_endlevelfade);
	instance_destroy(obj_fadeout);
	instance_destroy(obj_cutsceneManager);
	instance_destroy(obj_coneball);
	instance_destroy(obj_snowwalkparticles);
	instance_destroy(obj_discoball);
	instance_destroy(obj_discoball);
	instance_destroy(obj_danceoffprank);
	instance_destroy(obj_lap2visual);
	instance_destroy(obj_yogurtexe);
	global.cutsceneManager = -4;
	instance_destroy(obj_cutsceneManager)
	global.martian_alarmed = false;
	global.freezeframe = false;
	global.greyscalefade = 0;
	global.fill = 4000;
	global.seconds = 59;
	global.treat = false;
	global.minutes = 1;
	global.combofreeze = 0;
	global.secretfound = 0;
	global.playmiliseconds = 0;
	global.playseconds = 0;
	global.playminutes = 0;
	global.playhour = 0;
	global.panic = 0;
	global.style = 0;
	global.stylethreshold = 0;
	global.hurtcounter = 0;
	global.hurtmilestone = 0;
	global.minesProgress = false;
	global.exitgatetaunt = 0;
	global.coneballaggro = 0;
	global.dolap10fg = 0;
	global.clutterhit = 0;
	global.enableportal = 0;
	obj_tv.image_index = 0;
	obj_tv.tvsprite = spr_tvturnon;
	obj_player.visible = true;
	camera_set_view_angle(view_camera[0], 0);
	with (obj_creamtheifOLD)
		theifkeyinv = 0;
	ds_list_clear(global.saveroom);
	ds_list_clear(global.escaperoom);
	ds_list_clear(global.baddieroom);
	instance_destroy(obj_confectimallow);
	instance_destroy(obj_confecticrack);
	instance_destroy(obj_confectichoco);
	instance_destroy(obj_confectiworm);
	instance_destroy(obj_confecticandy);
	instance_destroy(obj_rudejanitor);
	instance_destroy(obj_lapjanitor);
	ds_list_clear(global.FollowerList);
	global.mallowfollow = false;
	global.crackfollow = false;
	global.chocofollow = false;
	global.wormfollow = false;
	global.candyfollow = false;
	global.janitorRudefollow = false;
	global.janitorLapfollow = false;
	global.treasure = 0;
	global.lapcount = 1;
	global.lapmusic = false;
	global.harrycolor = 0;
	ini_open(global.fileselect);
	var ranks = ini_read_string("Ranks", string(global.levelname), "none");
	ini_close();
	ini_open(global.fileselect);
	global.kungairtime = ini_read_string("achievments", "kungairtime", 0);
	ini_close();
	global.showplaytimer = ranks != "none";
	global.conedowntime = -1
	global.getawayfill = time_in_frames(0, 30)
	global.lowfacefill = time_in_frames(0, 10)
	global.secretsspire = [entryway_secret_1, entryway_secret_2, entryway_secret_3, steamy_secret_1, steamy_secret_2, steamy_secret_3, molasses_secret_1, molasses_secret_2, molasses_secret_3, mountain_secret_1, mountain_secret_2, mountain_secret_3, dance_secret1, dance_secret2, dance_secret3, estate_secret1, estate_secret2, estate_secret3, bee_secret_1, bee_secret_2, bee_secret_3, sucrose_secret1, sucrose_secret2, sucrose_secret3, exitway_secret_1, stormy_secret_1, stormy_secret_2, stormy_secret_3, martian_secret_1, entrance_secret3, entrance_secret4, entrance_secret5, medieval_secret4, medieval_secret5, medieval_secret6, dungeon_secret1, dungeon_secret2, dungeon_secret3]
	global.secretstotal = array_length(global.secretsspire)
	global.gamemode = 0
	global.leveldesign = 1
	global.lapmode = 1
	global.jerald = 0
	global.perfect = 0
	global.flashlight = 0
	global.collects = 1
	global.breakables = 1
	global.enemies = 1
	global.escapetimer = 0
	with (obj_camera)
	{
		NextFreeze = false;
		DrawHUD = true;
		DrawY = 0;
		global.targetCamX = obj_player.x;
		global.targetCamY = obj_player.y;
		var target = obj_player;
		var _cam_x = target.x - (camera_get_view_width(view_camera[0]) / 2);
		var _cam_y = target.y - (camera_get_view_height(view_camera[0]) / 2);
		chargecamera = 0;
		_cam_x = clamp(_cam_x, Camera_xorigin, (Camera_xorigin + Camera_width) - camera_get_view_width(view_camera[0]));
		_cam_y = clamp(_cam_y, Camera_yorigin, (Camera_yorigin + Camera_height) - camera_get_view_height(view_camera[0]));
		_cam_x = clamp(_cam_x, 0, room_width - camera_get_view_width(view_camera[0]));
		_cam_y = clamp(_cam_y, 0, room_height - camera_get_view_height(view_camera[0]));
		Cam_x = _cam_x;
		Cam_y = _cam_y;
		cam_langle = 0;
		cam_lzoom = 1;
		cam_angle = 0;
		cam_zoom = 1;
		Collectshake = 0;
	}
	with (obj_player)
	{
		scr_playersounds_init();
		upsideDownJump = false;
		mach4mode = 0;
		hsp = 0;
		vsp = 0;
		hspCarry = 0;
		vspCarry = 0;
		true_hsp = 0;
		true_vsp = 0;
		prevHsp = 0;
		prevVsp = 0;
		slideHsp = 0;
		draw_angle = 0;
		slope_angle = 0;
		secretPortal = false;
		scale = 1;
		groundedSlope = false;
		targetDoor = "A";
		firetrailbuffer = 0;
		state = states.comingoutdoor;
		image_index = 0;
		sprite_index = spr_walkfront;
		Sjumpcan_doublejump = true;
		playComboVariable = -4;
		ResetMusic = false;
		Dashpad_buffer = 0;
		Dashpad_buffer = 0;
		vertical = false;
		verticaloffset = 0;
		supertauntbuffer = 300;
		supertaunteffect = -4;
		supertauntcharged = false;
		characterspr();
		characterpal();
		charactergui();
		characterenv();
		charactersfx();
		alarm[0] = -1;
		alarm[1] = -1;
		alarm[3] = -1;
		alarm[4] = -1;
		alarm[5] = -1;
		alarm[6] = -1;
		alarm[7] = -1;
		alarm[8] = -1;
		alarm[9] = -1;
		alarm[10] = -1;
		grav = 0.5;
		hsp = 0;
		vsp = 0;
		xscale = 1;
		yscale = 1;
		steppy = 0;
		movespeedmax = 5;
		jumpstop = 0;
		start_running = 1;
		visible = true;
		turn = 0;
		jumpAnim = 1;
		dashAnim = 1;
		landAnim = 0;
		machslideAnim = 0;
		moveAnim = 1;
		stopAnim = 1;
		crouchslideAnim = 1;
		crouchAnim = 1;
		machhitAnim = 0;
		stompAnim = 0;
		inv_frames = 0;
		turning = 0;
		hurtbounce = 0;
		hurted = 0;
		autodash = 0;
		mach2 = 0;
		input_buffer_jump = 8;
		input_buffer_secondjump = 8;
		input_buffer_highjump = 8;
		targetRoom = 0;
		flash = 0;
		global.key_inv = 0;
		global.keyget = 0;
		global.collect = 0;
		global.ammo = 0;
		global.treasure = 0;
		global.combo = 0;
		global.highestcombo = 0;
		global.combotime = 0;
		global.combolost = 0;
		global.pizzacoin = 0;
		global.roomsave = 0;
		global.toppintotal = 1;
		global.hasallconfecti = 0;
		global.hit = 0;
		in_water = 0;
		key_particles = 0;
		barrel = 0;
		bounce = 0;
		a = 0;
		idle = 0;
		attacking = 0;
		slamming = 0;
		superslam = 0;
		machpunchAnim = 0;
		punch = 0;
		machfreefall = 0;
		shoot = 1;
		instakillmove = 0;
		windingAnim = 0;
		facestompAnim = 0;
		ladderbuffer = 0;
		chainsaw = 50;
		toomuchalarm1 = 0;
		toomuchalarm2 = 0;
		dashdust = 0;
		throwforce = 0;
		hurtsound = mu_entryway_title;
		idleanim = 0;
		momemtum = 0;
		cutscene = 0;
		grabbing = 0;
		dir = xscale;
		shotgunAnim = 0;
		goingdownslope = 0;
		goingupslope = 0;
		fallinganimation = 0;
		bombpeptimer = 100;
		slapbuffer = 0;
		slaphand = 1;
		suplexmove = 0;
		suplexhavetomash = 0;
		timeuntilhpback = 300;
		anger = 0;
		angry = 0;
		colors[0] = irandom(3);
		headless = 0;
		substate = substates.unknown_0;
		sourbuddied = 0;
		hp = 6;
	}
	with (obj_tv)
	{
		sucroseTimer = false;
		ComboShake = false;
		combofade = 0;
		comboendImage = 0;
		comboendSprite = spr_badcombo_boil;
		combocanFade = true;
		chooseOnecomboend = true;
		tvlength = 0;
		ds_queue_clear(global.newhudtvanim);
		ds_queue_clear(global.newhudmessage);
		alarm[1] = 1;
		staticdraw = false;
		DrawY = 0;
		shownranka = 0;
		shownrankb = 0;
		shownrankc = 0;
	}
	with (obj_music)
	{
		contTrack_pos = 0;
		audio_stop_all();
		music = undefined;
		escapemusic = -4;
		playintro = true;
		nolag = 0;
		fadeoff = 0;
		ignore_change = false;
		hard_force = false;
		audio_resume_all();
		audio_stop_all();
		fadeoff = 0;
		unforce_continuous = true;
		music = undefined;
		escapemusic = -4;
	}
}