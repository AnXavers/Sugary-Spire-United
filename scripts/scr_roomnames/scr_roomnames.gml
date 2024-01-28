function scr_roomnames(argument0 = room)
{
	var room_name = "NO ROOMNAME FOUND";
	switch (argument0)
	{
		case rm_missing:
			room_name = "MISSING ROOM LMAO"
			break
		case outer_room1:
		case outer_room2:
		case scootercutsceneidk:
			room_name = "Welcome To Sugary Spire!"
			break
		case hub_hallway:
			room_name = "Enjoy Your Stay!"
			break
		case tutorial_1:
		case tutorial_1_old:
			room_name = "The Parlor"
			break
		case entryway_secret_1:
		case entryway_secret_1_new:
		case entrywaysecret_1_old:
		case entryway_secret_1_custom:
			room_name = "Hidden Behind Some Walls."
			break
		case entryway_secret_2:
		case entrywaysecret_2_old:
			room_name = "Wet Floor"
			break
		case entryway_secret_2_new:
		case entryway_secret_2_custom:
			room_name = "Probably An OSHA Violation"
			break
		case entryway_secret_3:
		case entryway_secret_3_new:
		case entrywaysecret_3_old:
		case entryway_secret_3_custom:
			room_name = "Slip and Fall"
			break
		case entryway_1_new:
		case entryway_1_old:
		case entryway_1_custom:
		case entryway_1:
			room_name = "Welcome to Sugary Spire!"
			break
		case entryway_2_new:
		case entryway_2_old:
		case entryway_2_custom:
		case entryway_2:
			room_name = "Hard Hat Required"
			break
		case entryway_3_old:
		case entryway_3:
			room_name = "Orange City"
			break
		case entryway_3_new:
		case entryway_3_custom:
			room_name = "Dont Slip"
			break
		case entryway_4_old:
		case entryway_4:
			room_name = "Construction Conglomerate"
			break
		case entryway_4_new:
		case entryway_4_custom:
			room_name = "Road Work Ahead"
			break
		case entryway_5_new:
		case entryway_5_old:
		case entryway_5_custom:
		case entryway_5:
			room_name = "Had A Joke But I'm Still Working On It"
			break
		case entryway_6_old:
		case entryway_6:
			room_name = "Down And Around"
			break
		case entryway_6_new:
		case entryway_6_custom:
			room_name = "Architecture 101"
			break
		case entryway_6b_new:
		case entryway_6b_custom:
			room_name = "Impractical Scaffolding"
			break
		case entryway_7_old:
		case entryway_7:
			room_name = "Wires And Boxes"
			break
		case entryway_7_new:
		case entryway_7_custom:
			room_name = "Unsafe Work Environment"
			break
		case entryway_8_old:
		case entryway_8:
			room_name = "City Outskirts"
			break
		case entryway_8_new:
		case entryway_8_custom:
			room_name = "A Metropolis Now"
			break
		case entryway_9_new:
		case entryway_9_old:
		case entryway_9_custom:
		case entryway_9:
			room_name = "Nailed It"
			break
		case entryway_10_new:
		case entryway_10_old:
		case entryway_10_custom:
		case entryway_10:
			room_name = "Operation Crunch Creak Construct"
			break
		case entryway_11_old:
		case entryway_11:
			room_name = "Beary Careful"
			break
		case entryway_11_new:
		case entryway_11_custom:
			room_name = "Meet Gummy Harry"
			break
		case entryway_portal_custom:
			room_name = "Ready For Round 2?"
			break
		case entryway_treasure_custom:
			room_name = "An Artifact Hidden Away"
			break
		case steamy_secret_1:
		case steamy_secret1_old:
			room_name = "Gumslime Paradise?"
			break
		case steamy_secret_2:
		case steamy_secret2_old:
			room_name = "Digging For Cotton"
			break
		case steamy_secret_3:
		case steamy_secret3_old:
			room_name = "High Speed Cotton"
			break
		case steamy_1:
		case steamy_1_old:
			room_name = "Steamtown Spire"
			break
		case steamy_2:
		case steamy_2_old:
			room_name = "Welcome to Cottontown!"
			break
		case steamy_3:
		case steamy_3_old:
			room_name = "Boiler Room"
			break
		case steamy_4:
		case steamy_4_old:
			room_name = "Steamy Cotton Candy"
			break
		case steamy_5:
		case steamy_5_old:
			room_name = "Skyhigh"
			break
		case steamy_6:
		case steamy_6_old:
			room_name = "Park Tricks"
			break
		case steamy_7:
		case steamy_7_old:
			room_name = "The Great Clock Tower"
			break
		case steamy_8:
		case steamy_8_old:
			room_name = "Grand Gateau"
			break
		case steamy_9:
		case steamy_9_old:
			room_name = "Like Clockwork"
			break
		case steamy_10:
		case steamy_10_old:
			room_name = "Race Around The Clock"
			break
		case steamy_11:
		case steamy_11_old:
			room_name = "Froghop"
			break
		case steamy_11_1:
		case steamy_11_1_old:
			room_name = "Top of the Clock"
			break
		case steamy_12:
		case steamy_12_old:
			room_name = "Beary Break Room"
			break
		case steamy_13:
		case steamy_13_old:
			room_name = "Secret Side Room"
			break
		case steamy_14:
		case steamy_14_old:
			room_name = "Slow and Steady"
			break
		case molasses_1:
		case molasses_1_old:
			room_name = "The Swamp of the Spire"
			break
		case molasses_2:
		case molasses_2_old:
			room_name = "Big Stump"
			break
		case molasses_3:
		case molasses_3_old:
			room_name = "Bubbly Swamp Water"
			break
		case molasses_4:
		case molasses_4_old:
			room_name = "Sticky and Wet"
			break
		case molasses_5:
		case molasses_5_old:
			room_name = "Drowning in Molasses"
			break
		case molasses_6:
		case molasses_6_old:
			room_name = "The Sweet Smell of Death"
			break
		case molasses_6b:
		case molasses_6b_old:
			room_name = "The Ancient Temple Entrance"
			break
		case molasses_6c:
		case molasses_6c_old:
			room_name = "Ancient Hallways"
			break
		case molasses_6d:
		case molasses_6d_old:
			room_name = "Meet the Fling Frog!"
			break
		case molasses_7:
		case molasses_7_old:
			room_name = "Falling and Flinging"
			break
		case molasses_8:
		case molasses_8_old:
			room_name = "This Used to be the Gallery"
			break
		case molasses_8b:
		case molasses_8b_old:
			room_name = "Molasses Everywhere!"
			break
		case molasses_9:
		case molasses_9_old:
			room_name = "Gummy Harry in the Ancient Temple"
			break
		case molasses_10:
		case molasses_10_old:
			room_name = "Don't look down!"
			break
		case molasses_11:
		case molasses_11_old:
			room_name = "Unstationary Ground"
			break
		case molasses_12:
		case molasses_12_old:
			room_name = "Froghop Strikes Back!"
			break
		case molasses_13:
		case molasses_13_old:
			room_name = "The Temple of Goop"
			break
		case molasses_secret_1:
		case molassessecret_1_old:
			room_name = "Groundpound to go higher!"
			break
		case molasses_secret_2:
		case molassessecret_2_old:
			room_name = "and this used to be the Bathroom..."
			break
		case molasses_secret_3:
		case molassessecret_3_old:
			room_name = "Frog Den"
			break
		case mines_1:
		case mines_1_old:
		case mine_1:
		case mineshaft_1:
			room_name = "Sugary Spire Underground"
			break
		case mines_2:
		case mines_2_old:
		case mine_2:
		case mineshaft_2:
			room_name = "Excavation Site"
			break
		case mines_3:
		case mines_3_old:
		case mineshaft_3:
			room_name = "Miner Problem"
			break
		case mines_4:
		case mines_4_old:
			room_name = "Rossette's Humble Shoppe"
			break
		case mines_5:
		case mines_5_old:
			room_name = "Minecart Troubles"
			break
		case mines_6:
		case mines_6_old:
			room_name = "Cobalt Caverns"
			break
		case mines_7:
		case mines_7_old:
			room_name = "Jawbreaker Centre"
			break
		case mines_8:
		case mines_8_old:
			room_name = "RUN AWAY!!"
			break
		case mines_8B:
		case mines_8B_old:
			room_name = "Mining for Confecti"
			break
		case mines_9:
		case mines_9_old:
			room_name = "Journey to the Center of the Jawbreaker"
			break
		case mines_10:
		case mines_10_old:
			room_name = "Even Straighter Drop"
			break
		case mines_11:
		case mines_11_old:
			room_name = "Beary Dark Cave"
			break
		case mines_12:
		case mines_12_old:
			room_name = "Claustrophic Darkness"
			break
		case mines_13:
		case mines_13_old:
			room_name = "The Great Train Escape"
			break
		case mines_14:
			room_name = "Demolition Men Ahead"
			break
		case mines_secret_1:
		case minessecret_1_old:
			room_name = "Jawbreaking Secret"
			break
		case mines_secret_2:
		case minessecret_2_old:
			room_name = "Do you Smell Something Burning?"
			break
		case mines_secret_3:
		case minessecret_3_old:
			room_name = "Mineykarting"
			break
		case mountain_intro:
			room_name = "Mt. Sugary Spire"
			break
		case mountain_1:
			room_name = "Slippery Slopes"
			break
		case mountain_2:
			room_name = "Broken Down Path"
			break
		case mountain_3:
			room_name = "Frozen Frenzy"
			break
		case mountain_3b:
			room_name = "Stayin' Frosty"
			break
		case mountain_4:
			room_name = "Prince Rupert's Drop"
			break
		case mountain_5:
			room_name = "Freezer-Fridge-inator"
			break
		case mountain_6:
			room_name = "Sugar Honey Iced Tea"
			break
		case mountain_7:
			room_name = "14 Steps to Heaven"
			break
		case mountain_8:
			room_name = "Rise and Shine"
			break
		case mountain_9:
			room_name = "Heaven's Door"
			break
		case mountain_10:
			room_name = "Land of Dreams"
			break
		case mountain_11:
			room_name = "Eerie Event"
			break
		case mountain_escape1:
			room_name = "A Nightmare in Dreamland"
			break
		case mountain_escape2:
			room_name = "The Cold don't bother me!"
			break
		case sucrose_1:
			room_name = "The Sky Takes its Last Breath"
			break
		case sucrose_2:
			room_name = "Rocketeering"
			break
		case sucrose_2_1:
			room_name = ""
			break
		case sucrose_3:
			room_name = ""
			break
		case sucrose_4:
			room_name = ""
			break
		case sucrose_5:
			room_name = ""
			break
		case sucrose_6:
			room_name = ""
			break
		case sucrose_6_1:
			room_name = ""
			break
		case sucrose_7:
			room_name = ""
			break
		case sucrose_8:
			room_name = ""
			break
		case sucrose_8_1:
			room_name = ""
			break
		case sucrose_9:
			room_name = ""
			break
		case sucrose_10:
			room_name = ""
			break
		case sucrose_10_1:
			room_name = ""
			break
		case sucrose_11:
			room_name = ""
			break
		case sucrose_portal:
			room_name = ""
			break
		case sucrose_secret1:
			room_name = ""
			break
		case sucrose_secret2:
			room_name = ""
			break
		case sucrose_secret3:
			room_name = ""
			break
		case sucrose_treasure:
			room_name = ""
			break
		default:
			room_name = "NO ROOMNAME FOUND"
			break
	}
	return room_name;
}
