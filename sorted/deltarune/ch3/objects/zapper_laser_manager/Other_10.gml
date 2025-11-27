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
if (i_ex(obj_tenna_board4_enemy))
{
    scr_lerpvar("x", x, x + 54, 12, true, "out");
    scr_lerpvar("y", y, (y - yoff) + 20, 12, true, "out");
}
else
{
    scr_lerpvar("x", x, x - xoff, 12, true, "out");
    scr_lerpvar("y", y, y - yoff, 12, true, "out");
}
