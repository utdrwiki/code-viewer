segment_max = 6 + (2 * sameattack);
segment = segment_max;
if (creator == 0)
{
    xoff += 8;
    yoff += -32;
}
if (creator == 2)
{
    xoff -= 8;
    yoff -= -32;
}
scr_lerpvar("x", x, x - xoff, 12, true, "out");
scr_lerpvar("y", y, y - yoff, 12, true, "out");
