if (block1 != noone)
{
    draw_set_alpha(0)
    with (block1)
        draw_rectangle_colour(bbox_left, bbox_top, bbox_right, bbox_bottom, c_red, c_red, c_red, c_red, 0)
    draw_set_alpha(1)
}
if (block2 != noone)
{
    draw_set_alpha(0)
    with (block2)
        draw_rectangle_colour(bbox_left, bbox_top, bbox_right, bbox_bottom, c_red, c_red, c_red, c_red, 0)
    draw_set_alpha(1)
}
