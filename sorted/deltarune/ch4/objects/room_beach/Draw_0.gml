if (global.chapter == 4 && global.plot >= 290)
{
    pal_swap_set(bg_towntiles_palette, 1, false);
    draw_sprite(spr_npc_beachtable, 0, 80, 150);
    draw_sprite(spr_npc_beachtable, 0, 160, 150);
    pal_swap_reset();
}
