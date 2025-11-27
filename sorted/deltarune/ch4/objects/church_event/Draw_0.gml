if (global.chapter == 4 && global.plot >= 290)
{
    pal_swap_set(bg_church_palette, 1, false);
    draw_self();
    pal_swap_reset();
}
else
{
    draw_self();
}
