sucrose_lighting = false;
bloodsauce_lighting = false;
dance_lighting = false;
stormy_lighting = false;
boss_radius = 120;
radius_increase = 0;
if (room == sucrose_6 || room == sucrose_6_1 || room == sucrose_7 || room == sucrose_8)
	sucrose_lighting = true;
if (room == dungeon_5 || room == dungeon_6)
	bloodsauce_lighting = true;
if (room == stormy_8 || room == stormy_9 || room == stormy_10 || room == stormy_11 || room == stormy_11_1 || room == stormy_12 || room == stormy_13 || room == stormy_14 || global.flashlight)
	stormy_lighting = true;