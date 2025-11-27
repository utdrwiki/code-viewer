if (init == 0)
{
    init = 1;
    if (fadeplease == 1)
    {
        tile_layer_amount = 777777;
        alpha_changed = 0;
        tile_fade = 1;
        tilearray = tile_get_ids_at_depth(tile_layer_amount);
        for (var i = 0; i < array_length_1d(tilearray); i++)
            tile_set_alpha(tilearray[i], 0);
    }
}
cur_alpha = battlealpha;
if (autobattle == 1)
{
    if (instance_exists(obj_overworldbulletparent))
        obj_mainchara.battlemode = 1;
    else
        obj_mainchara.battlemode = 0;
}
if (obj_mainchara.battlemode == 1)
{
    if (battlealpha < 0.5)
        battlealpha += 0.04;
}
else if (battlealpha > 0)
{
    battlealpha -= 0.04;
}
if (tile_fade == 1)
{
    if (cur_alpha != battlealpha)
    {
        for (var i = 0; i < array_length_1d(tilearray); i++)
            tile_set_alpha(tilearray[i], battlealpha * 2);
    }
}
if (fadeplease)
    draw_sprite_ext(spr_pxwhite, 0, camerax() - 100, cameray() - 100, 740, 580, 0, c_black, battlealpha);
if (instance_exists(obj_caterpillarchara))
{
    obj_caterpillarchara.image_blend = merge_color(c_white, c_black, battlealpha);
    if (battlealpha <= 0)
        obj_caterpillarchara.image_blend = c_white;
}
