if (init < 0)
    exit;
line_timer++;
if (line_timer == 1)
    scr_lerpvar("line_alpha", 0, 1, 15, 2, "out");
y_pos += y_speed;
if (y_pos >= 1980)
    y_pos = cameray() - 40;
