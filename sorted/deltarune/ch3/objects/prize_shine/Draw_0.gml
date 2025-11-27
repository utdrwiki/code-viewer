draw_set_blend_mode(bm_add);
if (length < max_length)
    length = min(length + 10, max_length);
for (i = 0; i < 6; i++)
    scr_draw_beam_color(x, y, length, 15, angleA + (i * 60), c_yellow, 0, 1, 0);
for (i = 0; i < 5; i++)
    scr_draw_beam_color(x, y, length, 25, angleB + (i * 72), c_yellow, 0, 1, 0);
draw_set_blend_mode(bm_normal);
angleA += 4;
angleB -= 5;
