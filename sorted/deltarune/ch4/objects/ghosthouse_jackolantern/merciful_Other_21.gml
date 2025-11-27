var closest_dist = 0;
var closest_dist2 = 0;
var min_dist = 40;
var storex = targ_x;
var storey = targ_y;
var backupx = last_tx;
var backupy = last_ty;
var walled = false;
if (end_con >= 2)
{
    x = targ_x;
    y = targ_y;
    debug_print("forcing exit");
    exit;
}
if (mercy >= battle_end)
{
    end_con = 2;
    debug_print("targeting heart");
    targ_x = obj_heart.x + 4;
    targ_y = obj_heart.y + 4;
}
else if (x < (obj_growtangle.x - 200) || x > (obj_growtangle.x + 200) || y < (obj_growtangle.y - 160) || y > (obj_growtangle.y + 160))
{
    var horz = choose(0, 1);
    if (horz)
    {
        y = obj_growtangle.y + choose(-80, 0, 80);
        targ_y = y;
        if (choose(0, 1))
        {
            x = obj_growtangle.x + 200;
            targ_x = obj_growtangle.x - 200;
        }
        else
        {
            x = obj_growtangle.x - 200;
            targ_x = obj_growtangle.x + 200;
        }
    }
    else
    {
        x = obj_growtangle.x + choose(-100, 0, 100);
        targ_x = x;
        if (choose(0, 1))
        {
            y = obj_growtangle.y + 160;
            targ_y = obj_growtangle.y - 160;
        }
        else
        {
            y = obj_growtangle.y - 160;
            targ_y = obj_growtangle.y + 160;
        }
    }
    debug_print("teleport");
}
else
{
    var dir = point_direction(obj_heart.x + 4, obj_heart.y + 4, x, y);
    dir += ((random(1) * 60) - 30);
    targ_x = x + lengthdir_x(100, dir);
    targ_y = y + lengthdir_y(100, dir);
    debug_print("flee");
}
last_tx = storex;
last_ty = storey;
