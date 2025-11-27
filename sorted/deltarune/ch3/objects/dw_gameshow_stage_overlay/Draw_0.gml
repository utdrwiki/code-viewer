for (var i = 0; i < 6; i++)
{
    draw_set_alpha(i / 6);
    draw_set_color(merge_color(c_black, #90407F, 0.15));
    ossafe_fill_rectangle(0, 338 + (i * 16), room_width, 428, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}
ossafe_fill_rectangle_color(0, 420, room_width, cameray() + view_hport[0], merge_color(c_black, #90407F, 0.15), merge_color(c_black, #90407F, 0.15), merge_color(c_black, #90407F, 0.15), merge_color(c_black, #90407F, 0.15), false);
