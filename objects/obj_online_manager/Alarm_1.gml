var onlinePlayerCount = instance_number(obj_online_player)
var detectword = [["NIGGER"], ["TRANNY"], ["FAG"], ["NIGGA"]]
if (onlinePlayerCount == 0)
{
}
else
{
    for (var i = (onlinePlayerCount - 1); i >= 0; i--)
    {
        var onlinePlayer = instance_find(obj_online_player, i)
        if (onlinePlayer.sprite_index != spr_playerPZ_supertaunt1 && onlinePlayer.sprite_index != spr_playerPZ_supertaunt2 && onlinePlayer.sprite_index != spr_playerPZ_supertaunt3 && onlinePlayer.sprite_index != spr_playerBN_supertaunt1 && onlinePlayer.sprite_index != spr_playerBN_supertaunt2 && onlinePlayer.sprite_index != spr_playerBN_supertaunt3 && onlinePlayer.sprite_index != spr_playerBN_supertaunt4)
        {
            if (sprite_get_width(onlinePlayer.sprite_index) > 300 || sprite_get_height(onlinePlayer.sprite_index) > 550 || onlinePlayer.xscale > 3 || onlinePlayer.xscale < -3)
                instance_destroy(onlinePlayer)
        }
    }
}
alarm[1] = 300
