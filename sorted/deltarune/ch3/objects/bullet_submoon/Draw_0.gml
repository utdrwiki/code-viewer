if (touched_water)
{
    scr_draw_in_box_ext_begin(sprite_width, 0);
    draw_self();
    scr_draw_in_box_end();
}
else
{
    draw_self();
}
