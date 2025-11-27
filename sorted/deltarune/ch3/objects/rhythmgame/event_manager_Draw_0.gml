draw_sprite_ext_centerscale(1459, 0, camerax() + 100, cameray() + 350, 2 + left_beat, 2 + left_beat, 0, tori_col_a, 1);
draw_sprite_ext_centerscale(1459, 0, (camerax() + 640) - 100, cameray() + 350, -(2 + right_beat), 2 + right_beat, 0, tori_col_b, 1);
if (left_beat > 0)
    left_beat = scr_movetowards(left_beat, 0, 0.25);
if (right_beat > 0)
    right_beat = scr_movetowards(right_beat, 0, 0.25);
