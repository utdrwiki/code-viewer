if (creator == 0)
{
    xoff += 0;
    yoff += -24;
}
if (creator == 2)
{
    xoff -= 0;
    yoff -= -24;
}
if (i_ex(obj_shutta_enemy))
    yoff = 0;
scr_lerpvar("x", x, x - xoff, 12, true, "out");
scr_lerpvar("y", y, y - yoff, 12, true, "out");
