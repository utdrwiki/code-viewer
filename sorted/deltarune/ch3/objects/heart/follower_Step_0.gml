xdiff = target.x - x;
ydiff = target.y - y;
x = scr_movetowards(x, target.x, clamp(abs(xdiff) * smoothing, 1, max_speed));
y = scr_movetowards(y, target.y, clamp(abs(ydiff) * smoothing, 1, max_speed));
