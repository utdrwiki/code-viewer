direction = clamp(point_direction(x, y, scr_get_box(2), scr_get_box(1) + (scr_get_box(5) * 0.5) + irandom(40)), 150, 219);
gravity_direction = direction;
speed = 16 + random(2);
image_angle = 180;
image_yscale = 1;
xdiff = abs((x - scr_get_box(2)) + random(20));
xtime = xdiff / abs(hspeed);
xarc = pi / xtime;
archeight = 7 + random(3);
if (!force_arc)
{
    if (arc_y < (scr_get_box(1) + (scr_get_box(5) * 0.5)))
        archeight = -abs(archeight);
    if (arc_y > (scr_get_box(1) + (scr_get_box(5) * 0.5)))
        archeight = abs(archeight);
}
arcpos = 0;
