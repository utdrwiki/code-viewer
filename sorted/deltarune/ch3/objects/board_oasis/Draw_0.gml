animindex += 0.125;
sparkleanimindex += 0.1;
if (wither == 0)
{
    for (var i = 0; i < 4; i++)
    {
        for (var j = 0; j < 2; j++)
            draw_sprite_ext(spr_board_shallowwater, animindex, x + (32 * i), y + (32 * j), 2, 2, 0, c_white, 1);
    }
    for (var i = 0; i < 2; i++)
    {
        for (var j = 0; j < 2; j++)
            draw_sprite_ext(spr_board_shallowwater, animindex, x + (32 * i) + 32, y + (32 * j) + 64, 2, 2, 0, c_white, 1);
    }
}
draw_sprite_ext(spr_board_oasis_border, 0, x, y, 2, 2, image_angle, image_blend, image_alpha);
