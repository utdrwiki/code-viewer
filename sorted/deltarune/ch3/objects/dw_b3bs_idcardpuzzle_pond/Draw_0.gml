var watertile = 2186;
if (room == room_dw_b3bs_rouxls_lanina)
    watertile = 3460;
if (amt > 0 && con == 0)
{
    image_index = amt / 2;
    image_blend = #4CFF00;
    draw_self();
    chromakey_mask_begin(65356, 5);
    draw_self();
    image_blend = c_white;
    chromakey_mask_end();
    chromakey_on();
    draw_sprite_tiled_ext(watertile, animindex, x, y, 2, 2, c_white, 1);
    chromakey_off();
}
if (con > 0)
{
    for (var i = 0; i < 3; i++)
    {
        draw_sprite_ext(watertile, animindex, x + (32 * i), y, 2, 2, 0, c_white, 1);
        draw_sprite_ext(watertile, animindex, x + (32 * i), y + 32, 2, 2, 0, c_white, 1);
    }
    var ypos = y + 64;
    for (var i = 0; i < 3; i++)
    {
        thiswater = waterfalllength + (i * 4);
        var wateramt = min(thiswater, 64);
        draw_sprite_part_ext(spr_board_waterfall_2tall, animindex, 0, 0, 32, scr_even(wateramt), x + (i * 32), ypos, 2, 2, c_white, 1);
    }
}
