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
else
{
    for (var xx = -1; xx <= 1; xx++)
    {
        for (var yy = -1; yy <= 1; yy++)
        {
            var _x = obj_growtangle.x + (xx * 88);
            var _y = obj_growtangle.y + (66 * yy);
            var dist = point_distance((obj_heart.x + 4) * 0.75, obj_heart.y + 4, _x * 0.75, _y);
            var dist2 = point_distance(x * 0.75, y, _x * 0.75, _y);
            if (dist > closest_dist)
            {
                closest_dist = dist;
                targ_x = _x;
                targ_y = _y;
            }
            if (dist2 < dist && dist2 > closest_dist2 && dist2 > min_dist)
            {
                closest_dist2 = dist2;
                backupx = _x;
                backupy = _y;
            }
        }
    }
    if (closest_dist2 != 0 && closest_dist2 < closest_dist)
    {
        targ_x = backupx;
        targ_y = backupy;
    }
    debug_print_persistent("state", "moving");
}
last_tx = storex;
last_ty = storey;
