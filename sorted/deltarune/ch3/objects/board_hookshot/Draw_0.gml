if (init)
{
    x = clamp(x, 140, 500);
    y = clamp(y, 76, 308);
    var chainlength = point_distance(xstart, ystart, x, y);
    var chaindist = 14;
    var chaindir = point_direction(xstart, ystart, x, y);
    for (var i = 0; i < round(chainlength / chaindist); i++)
        draw_sprite_ext(spr_board_hookshot_chain, 0, xstart + lengthdir_x((i + 1) * chaindist, chaindir), ystart + lengthdir_y((i + 1) * chaindist, chaindir), 2, 2, 0, image_blend, image_alpha);
    draw_sprite_ext(spr_board_hookshot_chain, 0, xstart, ystart, 2, 2, 0, image_blend, image_alpha);
    draw_sprite_ext(spr_board_hookshot_hook, 0, round(x / 2) * 2, round(y / 2) * 2, 2, 2, image_angle, image_blend, image_alpha);
}
