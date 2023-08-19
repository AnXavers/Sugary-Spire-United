if (!instance_exists(obj_player))
    return "";
if (current_palette != obj_player1.paletteselect || current_texture != global.palettetexture)
{
    current_palette = obj_player1.paletteselect
    current_texture = global.palettetexture
    send_online_palette(obj_player1.paletteselect, global.palettetexture)
}
