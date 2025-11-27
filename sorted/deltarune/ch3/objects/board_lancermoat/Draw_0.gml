if (wither == 0)
{
    animindex += 0.125;
    for (var i = 0; i < 7; i++)
        draw_sprite_ext(spr_board_shallowwater, animindex, x + (i * 32), y, 2, 2, 0, c_white, 1);
    draw_self();
}
