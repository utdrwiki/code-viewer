function lines_intersect_x()
{
    var ua = 0;
    var ux = argument2 - argument0;
    var uy = argument3 - argument1;
    var vx = argument6 - argument4;
    var vy = argument7 - argument5;
    var wx = argument0 - argument4;
    var wy = argument1 - argument5;
    var ud = (vy * ux) - (vx * uy);
    if (ud != 0)
    {
        ua = ((vx * wy) - (vy * wx)) / ud;
        if (argument8)
        {
            var ub = ((ux * wy) - (uy * wx)) / ud;
            if (ua < 0 || ua > 1 || ub < 0 || ub > 1)
                ua = 0;
        }
    }
    return ua;
}
