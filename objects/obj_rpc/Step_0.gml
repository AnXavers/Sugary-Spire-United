if (global.collect > global.crank && global.collect < global.brank)
	global.rpcrank = "C";
else if (global.collect > global.brank && global.collect < global.arank)
	global.rpcrank = "B";
else if (global.collect > global.arank && global.collect < global.srank)
	global.rpcrank = "A";
else if (global.collect > global.srank)
	global.rpcrank = "S";
else if (global.collect < global.crank)
	global.rpcrank = "D";
if (global.gamePauseState == 0)
{
	if (global.panic == 1)
		rousr_dissonance_set_timestamps(undefined, floor(global.fill / 60));
	else
		rousr_dissonance_set_timestamps(undefined, undefined);
	if (room != realtitlescreen && room != rm_introVideo && room != scootercutsceneidk && room != outer_room1 && room != outer_room2 && room != hub_w1 && room != palroom && room != rank_room)
	{
		if (global.lapcount == 0)
			rousr_dissonance_set_state(string(global.collect) + " Points | Rank " + string(global.rpcrank));
		else
			rousr_dissonance_set_state(string(global.collect) + " Points | Rank " + string(global.rpcrank) + " | Lap " + string(global.lapcount));
	}
	else if (room == rank_room)
		rousr_dissonance_set_state("Rank " + string(global.rpcrank));
	else
		rousr_dissonance_set_state("");
	switch (obj_player.character)
	{
		case "P":
			rousr_dissonance_set_small_image("pizzelle", "Playing as Pizzelle");
			break;
		case "N":
			rousr_dissonance_set_small_image("pizzano", "Playing as Pizzano");
			break;
		case "G":
			rousr_dissonance_set_small_image("gumbob", "Playing as Gumbob");
			break;
		case "C":
			rousr_dissonance_set_small_image("coneboy", "Playing as Coneboy");
			break;
	}
}
discord_update_presence();
