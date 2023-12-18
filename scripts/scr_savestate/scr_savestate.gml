function savestate_save(argument0)
{
	game_save("Savestates/" + argument0)
}
function savestate_load(argument0)
{
	game_load("Savestates/" + argument0)
}
function checkpoint_save(argument0)
{
	game_save("Savestates/Checkpoints/" + argument0)
}
function checkpoint_load(argument0)
{
	game_load("Savestates/Checkpoints/" + argument0)
}