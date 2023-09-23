if (live_call()) return live_result;
speaking = place_meeting(x, y, obj_player);
mytex_x -= 0.5;
mytex_x %= sprite_get_width(mytex);
mytex_y = wave(-5, 5, 5, 20);
propdex += 0.35;
propdex %= 3;
ini_open("silversave.ini")
if ini_read_real("Dialog", "meeting", 1)
{
	text = "So, what do we have here? Someone else in this god forsaken place other than myself? Interesting.";
	if dialogline
		text = "Why are you here, to torment me some more? as if being trapped here for.. whoever knows-long isn't enough. Leave me be, cretin.";
	else if dialogline == 2
		text = "My story? it really isn't much to awe at, I'm here because of that damned creature in heaven. one day ill show that thing what it messed with.. oh right, my story. Well the reason I ended up here of all places is that thing threw me down here, apparently I did something to wrong it. And that's why I'm here, though there is that huge door over there, wonder what that's for... Perhaps an exit? Hey, listen. I have an offer for you, if you help me out by seeing if there's any keys for these locks, ill help you out by exchanging you some of my power. Sound good to you?"
	else if dialogline == 3
		text = "Wow, aren't you a comedic genius. I know you are more than you come off as in your outside appearance, child. Now answer me properly."
	else 
		text = "Pleasure doing business with you. How's about I set up a little shop here for you, eh? I'll get to work on that while you go out and find me some keys. I'll also accept some.. rarer artifacts for some clues on how to reach my ''eyes'' so to speak. I sent them out on lookout to see if I could find a way out of here, that quickly turned up to be a fruitless venture as I haven't heard from them since and my powers have dwindled in strength since I first arrived here, and moving that many clones is quite energy consuming. They might know a bit more about the keys, hell, maybe there's grander keys out there that I can convert into multiple regular ones, who knows. Now get out there and do some digging, I'll be waiting."
}
ini_close()