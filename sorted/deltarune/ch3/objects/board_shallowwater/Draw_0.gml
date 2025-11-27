if (active)
{
    waterindex += 0.125;
    for (var i = 0; i < (image_xscale / 2); i++)
    {
        for (var ii = 0; ii < (image_yscale / 2); ii++)
            draw_sprite_ext(spr_board_shallowwater, waterindex, x + (i * 32), y + (ii * 32), 2, 2, 0, c_white, 1);
    }
}
