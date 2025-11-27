if (global.chapter == 4 && global.plot >= 290)
{
    pal_swap_set(bg_towntiles_palette, 1, false);
    draw_self();
    draw_sprite(spr_flowershop_sign, 0, 1255, 70);
    pal_swap_reset();
}
else
{
    draw_self();
    draw_sprite(spr_flowershop_sign, 0, 1255, 70);
}
