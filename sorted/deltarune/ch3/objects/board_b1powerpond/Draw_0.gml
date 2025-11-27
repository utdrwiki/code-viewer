if (i_ex(obj_board_smallpond))
    wither = obj_board_smallpond.wither;
if (wither == 0)
{
    animindex += 0.125;
    for (var i = 0; i < 2; i++)
        draw_sprite_ext(spr_board_shallowwater, animindex, x + (32 * i), y, 2, 2, image_angle, image_blend, image_alpha);
}
draw_self();
