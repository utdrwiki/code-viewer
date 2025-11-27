if (type == 0)
{
    myspeed = 12;
    offset = 80;
    var bx = (round(x / 40) * 40) + offset;
    var by = (round(y / 40) * 40) - 20;
    var spacing = 30;
    if (i_ex(obj_climb_kris))
    {
        var myspeeddir = 1;
        bx = obj_climb_kris.falseloopx[0] + offset;
        while (bx < obj_climb_kris.falseloopx[1])
        {
            bullet = instance_create(bx, by, obj_climb_bullet);
            bullet.hspeed = myspeed * myspeeddir;
            bullet.falseloop = 1;
            bullet.permanent = 1;
            bx += spacing;
            scr_darksize(bullet);
        }
    }
    instance_destroy();
}
