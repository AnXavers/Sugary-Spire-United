function scr_inhaleableenemy()
{
if (point_in_circle(x, y, obj_player.x + (75 * obj_player.xscale), obj_player.y, 125) && obj_player.inhaling && state != enemystates.inhaled)
	state = enemystates.inhaled
}