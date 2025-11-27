animindex += 0.125;
if (wither == 0)
{
    for (var i = 0; i < 4; i++)
    {
        for (var j = 0; j < 2; j++)
            draw_sprite_ext(spr_board_shallowwater, animindex, x + (32 * i), y + (32 * j), 2, 2, image_angle, image_blend, image_alpha);
    }
    if (room != room_board_1_sword)
        draw_sprite_ext(spr_board_lilfountain_spring, animindex, x + 48, y + 16, 2, 2, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_board_lilfountain_border, 0, x, y, 2, 2, image_angle, image_blend, image_alpha);
}
