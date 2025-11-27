if (movesleft > 0 && movetype == "board")
{
}
draw_self();
if (movetype == "free")
{
    if (button1_h() && scr_debug())
    {
        draw_set_color(c_red);
        draw_set_blend_mode(bm_add);
        if (facing == 1)
            draw_rectangle(x + 16, y + 16 + 2, x + 16 + 32, (y + 32) - 2, true);
        if (facing == 3)
            draw_rectangle(x + 16, y + 16 + 2, (x + 16) - 32, (y + 32) - 2, true);
        if (facing == 0)
            draw_rectangle(x + 8, y + 16 + 4, (x + 32) - 8, y + 16 + 28, true);
        if (facing == 2)
            draw_rectangle(x + 8, y + 16 + 4, (x + 32) - 8, (y + 16) - 28, true);
        draw_set_color(c_white);
        draw_set_blend_mode(bm_normal);
    }
}
