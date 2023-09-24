var textHeight = string_height_ext(entry[selected][4], 15, 400)
if obj_player.key_right2
{
	if (selected2 == 3)
		selected2 = 0;
	else
		selected2++;
}
else if (-obj_player.key_left2)
{
	if (selected2 == 0)
		selected2 = 3;
	else
		selected2--;
}
if obj_player.key_jump
	event_user(selected2);
if keyboard_check_pressed(vk_escape)
{
	instance_destroy();
	with (obj_mainfartselect)
		abletomove = 1;
}
if scrolling
{
	if (obj_player.key_up && texty < 0)
		texty += 3;
	else if (obj_player.key_down && texty > (-((textHeight - 100))))
		texty -= 3;
}
