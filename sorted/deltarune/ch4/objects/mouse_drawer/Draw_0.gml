draw_self();
draw_set_colour(c_black);
if (yy > 0)
    ossafe_fill_rectangle(x + 4, y + 38, x + 75, y + 38 + yy, 0);
draw_sprite_ext(sprite_index, 1, x, y + yy, 2, 2, 0, c_white, 1);
