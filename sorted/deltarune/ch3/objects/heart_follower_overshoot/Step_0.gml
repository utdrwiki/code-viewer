xdiff = target.x - x;
ydiff = target.y - y;
xvelocity = scr_movetowards(xvelocity, clamp(xdiff, -max_speed, max_speed), smoothing);
yvelocity = scr_movetowards(yvelocity, clamp(ydiff, -max_speed, max_speed), smoothing);
x += xvelocity;
y += yvelocity;
