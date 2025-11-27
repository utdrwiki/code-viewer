draw_sprite_ext(sprite_index, image_index, x, y, xscale, 1, angle, image_blend, 1);
if (scr_debug())
{
    draw_set_color(c_yellow);
    ossafe_fill_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1);
    draw_set_color(c_red);
    ossafe_fill_rectangle(bbox_left + boxmargin, bbox_top + boxmargin + 10, bbox_right - boxmargin, bbox_bottom - boxmargin - 4, 1);
    draw_set_color(-1);
}
