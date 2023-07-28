function scr_roomcheck()
{
	return room != scootercutsceneidk && room != devroom && room != rm_introVideo && room != palroom && room != rank_room && room != timesuproom && room != realtitlescreen && room != rm_credits && room != rm_painterarena && room != rm_titlecard && room != rm_disclaimer;
}
function is_hub()
{
	return room == hub_w1 || room == hub_w2 || room == hub_basement || room == hub_hallway;
}
