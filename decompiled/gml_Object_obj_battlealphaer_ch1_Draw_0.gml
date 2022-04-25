cur_alpha = battlealpha
if (obj_mainchara_ch1.battlemode == 1)
{
    if (battlealpha < 0.5)
        battlealpha += 0.04
}
else if (battlealpha > 0)
    battlealpha -= 0.04
if (tile_fade == true)
{
    if (cur_alpha != battlealpha)
    {
        for (var i = 0; i < array_length_1d(tilearray); i++)
            tile_set_alpha_ch1(tilearray[i], (battlealpha * 2))
    }
}
draw_set_alpha(battlealpha)
draw_set_color(c_black)
draw_rectangle((__view_get((0 << 0), 0) - 100), (__view_get((1 << 0), 0) - 100), (__view_get((0 << 0), 0) + 740), (__view_get((1 << 0), 0) + 540), false)
draw_set_alpha(1)
if instance_exists(obj_caterpillarchara_ch1)
{
    obj_caterpillarchara_ch1.image_blend = merge_color(c_white, c_black, battlealpha)
    if (battlealpha <= 0)
        obj_caterpillarchara_ch1.image_blend = c_white
}
