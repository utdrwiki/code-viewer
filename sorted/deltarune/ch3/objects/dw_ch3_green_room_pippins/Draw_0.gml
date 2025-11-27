if (!show_up)
{
    draw_set_alpha(1);
    scr_draw_set_mask(true, true);
    ossafe_fill_rectangle(mask_x_pos, mask_y_pos - 50, mask_x_pos + 80, mask_y_pos + 20);
    scr_draw_in_mask_begin();
    draw_self();
    scr_draw_in_mask_end();
}
else
{
    draw_self();
}
