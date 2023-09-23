canCollide = function(argument0 = obj_player)
{
	return !place_meeting(x, y, argument0);
};
event_inherited();
scr_collision_init();
grav = 0.5;
dhsp = 0;
dvsp = 0;
spinspeed = 0;
if (sprite_index == spr_clutterBarrel || sprite_index == spr_explosiveBarrel || sprite_index == spr_clutterTrash)
{
	hitsound = sfx_metalclutterhit
}
else
{
	hitsound = sfx_clutterhit
}