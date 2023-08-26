function scr_levelcorrection()
{
	if room == entryway_treasure || entryway_portal || entryway_secret_1 || entryway_secret_2 || entryway_secret_3 || entryway_1 || entryway_2 || entryway_3 || entryway_4 || entryway_5 || entryway_6 || entryway_7 || entryway_8 || entryway_9 || entryway_10 || entryway_11
		global.levelname = "entryway"
	else if room == steamy_treasure || steamy_portal || steamy_secret_1 || steamy_secret_2 || steamy_secret_3 || steamy_secret_4 || steamy_1 || steamy_2 || steamy_3 || steamy_4 || steamy_5 || steamy_6 || steamy_7 || steamy_8 || steamy_9 || steamy_10 || steamy_11 || steamy_11_1 || steamy_12 || steamy_13 || steamy_14 || steamy_sideroom
		global.levelname = "steamy"
	else if room == molasses_treasure || molasses_secret_1 || molasses_secret_2 || molasses_secret_3 || molasses_1 || molasses_2 || molasses_2b || molasses_3 || molasses_4 || molasses_5 || molasses_6 || molasses_6b || molasses_6c || molasses_6d || molasses_7 || molasses_8 || molasses_8b | molasses_9 || molasses_10 || molasses_11 || molasses_12 || molasses_13
		global.levelname = "molasses"
	else if room == mine_1 || mine_2 || mineshaft_1 || mineshaft_3 || mines_silver || mines_treasure || mines_secret_1 || mines_secret_2 || mines_secret_3 || mines_1 || mines_2 || mines_3 || mines_4 || mines_5 || mines_6 || mines_7 || mines_8 || mines_8B || mines_9 || mines_10 || mines_11 || mines_12 || mines_13 || mines_14
		global.levelname = "mines"
	else if room == tutorial_portal || tutorial_1 || tutorial_2 || tutorial_3 || tutorial_4
		global.levelname = "tutorial"
	else if room == fudge_1 || fudge_2 || fudge_3 || fudge_4 || fudge_5 || mountain_treasure || mountain_secret_1 || mountain_secret_2 || mountain_secret_3 || mountain_1 || mountain_2 || mountain_3 || mountain_3b || mountain_4 || mountain_5 || mountain_6 || mountain_7 || mountain_8 || mountain_9 || mountain_10 || mountain_11 || mountain_secret_plaza2
		global.levelname = "fudge"
	else if room == estate_1 || estate_2 || estate_3 || estate_4 || estate_4B || estate_4C || estate_5 || estate_6 || estate_6B || estate_6C || estate_7 || estate_8 || estate_8B || estate_9 || estate_dog || estate_secret1 || estate_secret2 || estate_secret3 || estate_treasure
		global.levelname = "estate"
	else if room == sucrose_1 || sucrose_2 || sucrose_2_1 || sucrose_3 || sucrose_4 || sucrose_5 || sucrose_6 || sucrose_6_1 || sucrose_7 || sucrose_8 || sucrose_8_1 || sucrose_9 || sucrose_10 || sucrose_10_1 || sucrose_11 || sucrose_portal || sucrose_secret1 || sucrose_secret2 || sucrose_secret3 || sucrose_treasure
		global.levelname = "sucrose"
	else if room == dance_1 || dance_2 || dance_3 || dance_4 || dance_5 || dance_6 || dance_7 || dance_8 || dance_9 || dance_10 || dance_11 || dance_pillar || dance_escape1 || dance_escape2 || dance_escape3 || dance_portal || dance_secret1 || dance_secret2 || dance_secret3 || dance_treasure
		global.levelname = "dance"
	else if room == bee_1 || bee_2 || bee_3 || bee_4 || bee_5 || bee_6 || bee_7 || bee_8 || bee_9 || bee_10 || bee_11 || bee_11B || bee_12 || bee_escape1 || bee_escape2 || bee_secret_1 || bee_secret_2 || bee_secret_3 || bee_treasure
		global.levelname = "bee"
	else if room == martian_1 || martian_2 || martian_3 || martian_4 || martian_portal
		global.levelname = "martian"
	else if room == exitway_1 || exitway_2 || exitway_3 || exitway_4 || exitway_secret_1
		global.levelname = "exitway"
	else if room == dragonlair_1 || dragonlair_2 || dragonlair_3 || dragonlair_4 || dragonlair_5 || dragonlair_6 || dragonlair_7 || dragonlair_8 || dragonlair_9
		global.levelname = "dragonlair"
	else if room == finale_pre || finale_0 || finale_1
		global.levelname = "finale"
	else if room == entrance_1 || entrance_2 || entrance_3 || entrance_4 || entrance_5 || entrance_6 || entrance_6c || entrance_7 || entrance_8 || entrance_9 || entrance_10 || entrance_portal || entrance_secret3 || entrance_secret4 || entrance_secret5 || entrance_treasure
		global.levelname = "entrance"
	else if room == dungeon_1 || dungeon_2 || dungeon_3 || dungeon_4 || dungeon_5 || dungeon_6 || dungeon_7 || dungeon_8 || dungeon_9 || dungeon_10 || dungeon_pizzamart || dungeon_secret1 || dungeon_secret2 || dungeon_secret3 || dungeon_secret4 || dungeon_secret5 || dungeon_secret6 || dungeon_treasure
		global.levelname = "bloodsauce"
}
function scr_exitlevellocation()
{
	if global.levelname == "tutorial"
	{
		global.entergateroom = hub_hallway
		global.entergatedoor = "Z"
	}
	else if global.levelname == "entryway"
	{
		if !global.isoldw1
			global.entergateroom = hub_w1
		else
			global.entergateroom = hub_w1old
		global.entergatedoor = "W"
	}
	else if global.levelname == "steamy"
	{
		if !global.isoldw1
			global.entergateroom = hub_w1
		else
			global.entergateroom = hub_w1old
		global.entergatedoor = "X"
	}
	else if global.levelname == "molasses"
	{
		if !global.isoldw1
			global.entergateroom = hub_w1
		else
			global.entergateroom = hub_w1old
		global.entergatedoor = "Y"
	}
	else if global.levelname == "mines"
	{
		if !global.isoldw1
			global.entergateroom = hub_w1
		else
			global.entergateroom = hub_w1old
		global.entergatedoor = "Z"
	}
	else if global.levelname == "souractive"
	{
		global.entergateroom = hub_w2
		global.entergatedoor = "U"
	}
	else if global.levelname == "martian"
	{
		global.entergateroom = hub_w2
		global.entergatedoor = "U"
	}
	else if global.levelname == "fudge"
	{
		global.entergateroom = hub_w2
		global.entergatedoor = "V"
	}
	else if global.levelname == "estate"
	{
		global.entergateroom = hub_w2
		global.entergatedoor = "W"
	}
	else if global.levelname == "sucrose"
	{
		global.entergateroom = hub_w2
		global.entergatedoor = "X"
	}
	else if global.levelname == "dance"
	{
		global.entergateroom = hub_w2
		global.entergatedoor = "Y"
	}
	else if global.levelname == "bee"
	{
		global.entergateroom = hub_w2
		global.entergatedoor = "Z"
	}
	else if global.levelname == "entrance"
	{
		global.entergateroom = tower_johngutterhall
		global.entergatedoor = "Z"
	}
	else if global.levelname == "pizzascape"
	{
		global.entergateroom = tower_1
		global.entergatedoor = "X"
	}
	else if global.levelname == "ancient"
	{
		global.entergateroom = tower_1
		global.entergatedoor = "Y"
	}
	else if global.levelname == "bloodsauce"
	{
		global.entergateroom = tower_1
		global.entergatedoor = "Z"
	}
	else if global.levelname == "exitway"
	{
		global.entergateroom = hub_basement
		global.entergatedoor = "X"
	}
	else if global.levelname == "dragonlair"
	{
		global.entergateroom = hub_basement
		global.entergatedoor = "Y"
	}
	else if global.levelname == "walls"
	{
		global.entergateroom = hub_basement
		global.entergatedoor = "Z"
	}
	else if global.levelname == "soursweet"
	{
		global.entergateroom = hub_basement
		global.entergatedoor = "Z"
	}
	else if global.levelname == "themepark"
	{
		global.entergateroom = hub_basement
		global.entergatedoor = "Z"
	}
	else if global.levelname == "catacomb"
	{
		global.entergateroom = hub_basement
		global.entergatedoor = "Z"
	}
	else if global.levelname == "finale"
	{
		global.entergateroom = hub_outside
		global.entergatedoor = "Z"
	}
}
function scr_musiccorrection()
{
	if is_hub()
	{
		if room == silver_0 || silver_1 || silver_2 || silver_3 || silver_4
			add_music(room, mu_silver, mu_silver, true)
		else if room == rm_painter || rm_pizzano || hub_outside || outer_room1 || outer_room2 || tower_outside
			add_music(room, mu_top, mu_top, true)
		else if room == hub_basement || hub_w3 || hub_top
			add_music(room, mu_hubw0, mu_hubw0, true)
		else if room == hub_w1 || hub_hallway || hub_w1old
			add_music(room, mu_hubw1, mu_hubw1, true)
		else if room == hub_w2
			add_music(room, mu_hubw2, mu_hubw2, true)
		else if room == rm_coneball
			add_music(room, mu_danger, mu_danger, true)
		else if room == tower_1 || tower_entrancehall || tower_johngutterhall
			add_music(room, mu_tower1, mu_tower1, true)
		else if room == tower_2
			add_music(room, mu_tower2, mu_tower2, true)
		else if room == tower_3
			add_music(room, mu_tower3, mu_tower3, true)
		else if room == tower_4
			add_music(room, mu_tower4, mu_tower4, true)
		else if room == tower_5
			add_music(room, mu_tower5, mu_tower5, true)
		else if room == hub_shop1
			add_music(room, mu_hubshop1, mu_hubshop1, true)
		else if room == hub_shop2
			add_music(room, mu_hubshop2, mu_hubshop2, true)
		else if room == hub_shop3
			add_music(room, mu_hubshop2, mu_hubshop2, true)
		else
			add_music(room, mu_void, mu_void, true)
	}
	else if global.levelname == "entryway"
	{
		add_music(room, mu_waffle, mu_wafflesecret, true)
	}
	else if global.levelname == "steamy"
	{
		if room == steamy_1 || steamy_2 || steamy_3 || steamy_4 || steamy_5 || steamy_6 || steamy_7 || steamy_portal
			add_music(room, mu_steamy, mu_steamysecret, true)
		else 
			add_music(room, mu_steamyinner, mu_steamysecret, true)
	}
	else if global.levelname == "molasses"
	{
		if room == molasses_1 || molasses_2 || molasses_3 || molasses_4 || molasses_5 || molasses_6
			add_music(room, mu_swamp1, mu_swampsecret, true)
		else 
			add_music(room, mu_swamp2, mu_swampsecret, true)
	}
	else if global.levelname == "mines"
	{
		if !global.minesProgress
			add_music(room, mu_mineshaft1, mu_minessecret, true)
		else 
			add_music(room, mu_mineshaft2, mu_minessecret, true)
	}
	else if global.levelname == "tutorial"
	{
		add_music(room, mu_tutorial, mu_tutorial, true)
	}
	else if global.levelname == "martian"
	{
		add_music(room, mu_martian, mu_martian, true)
	}
	else if global.levelname == "fudge"
	{
		if room == mountain_intro || mountain_1 || mountain_2 || mountain_3 || mountain_3b || mountain_4 || mountain_5 || mountain_6 || mountain_7 || mountain_treasure
			add_music(room, mu_mountain1, mu_mountainsecret, true)
		else 
			add_music(room, mu_mountain2, mu_mountainsecret, true)
	}
	else if global.levelname == "estate"
	{
		if room == estate_dog
			add_music(room, mu_danger, mu_estatesecret, true)
		else
			add_music(room, mu_estate, mu_estatesecret, true)
	}
	else if global.levelname == "dance"
	{
		if room == dance_1 || dance_2 || dance_3 || dance_4 || dance_5 || dance_6 || dance_7 || dance_8 || dance_portal || dance_treasure
			add_music(room, mu_dance2, mu_dancesecret, true)
		else
			add_music(room, mu_dance, mu_dancesecret, true)
	}
	else if global.levelname == "sucrose"
	{
		add_music(room, mu_sucrose, mu_sucrosesecret, true)
	}
	else if global.levelname == "bee"
	{
		add_music(room, mu_bee, mu_bee, true)
	}
	else if global.levelname == "entrance"
	{
		add_music(room, mu_entrance, mu_entrancesecret, true)
	}
	else if global.levelname == "bloodsauce"
	{
		add_music(room, mu_bloodsauce, mu_bloodsaucesecret, true)
	}
	else if global.levelname == "exitway"
	{
		add_music(room, mu_exitway, mu_exitway, true)
	}
	else if room == rm_credits
		add_music(room, mu_credits, mu_credits, true)
	else if room == rm_painterarena
		add_music(room, mu_painter, mu_painter, true)
	else if room == rm_pizzanoarena
		add_music(room, mu_pizzanothemetune, mu_pizzanothemetune, true)
	else if room == rm_coneballarena
		add_music(room, mu_coneball1, mu_coneball1, true)
	else if room == realtitlescreen
		add_music(room, mu_title, mu_title, true)
	else if room == devroom || options_room || options_sound
		add_music(room, mu_pizzanosecret, mu_pizzanosecret, true)
	else if room == rm_introVideo
		add_music(room, -4, -4, true)
	else if room == rm_disclaimer || palroom || rm_verify
		add_music(room, mu_paletteselect, mu_paletteselect, true)
	else
		add_music(room, mu_void, mu_void, true)
}