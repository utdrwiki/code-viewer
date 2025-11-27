function scr_lines_intersect()
{
    var ua = 0;
    var ux = argument[2] - argument[0];
    var uy = argument[3] - argument[1];
    var vx = argument[6] - argument[4];
    var vy = argument[7] - argument[5];
    var wx = argument[0] - argument[4];
    var wy = argument[1] - argument[5];
    var ud = (vy * ux) - (vx * uy);
    if (ud != 0)
    {
        ua = ((vx * wy) - (vy * wx)) / ud;
        if (argument[8])
        {
            var ub = ((ux * wy) - (uy * wx)) / ud;
            if (ua < 0 || ua > 1 || ub < 0 || ub > 1)
                ua = 0;
        }
    }
    return ua;
}
