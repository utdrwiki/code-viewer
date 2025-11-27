if (level >= 10)
    draw_sprite_ext(spr_cat_aura, current_time / 100, x, y, 1, 1, 0, c_red, 0.5);
image_blend = merge_colour(c_yellow, c_red, clamp(level * 0.1, 0, 1));
draw_sprite_ext(sprite_index, image_index, x, y, xscale, 1, image_angle, image_blend, 1);
if (scr_debug())
{
    draw_set_color(c_yellow);
    ossafe_fill_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1);
    draw_set_color(c_red);
    ossafe_fill_rectangle(bbox_left + boxmargin, bbox_top + boxmargin + 10, bbox_right - boxmargin, bbox_bottom - boxmargin - 10, 1);
    draw_set_color(-1);
}
