var closest_dist = 0;
var min_dist = 40;
var storex = targ_x;
var storey = targ_y;
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
    targ_y = obj_heart.x + 4;
}
else
{
    for (var xx = -1; xx <= 1; xx++)
    {
        for (var yy = -1; yy <= 1; yy++)
        {
            var _x = obj_growtangle.x + (xx * 88);
            var _y = obj_growtangle.y + (66 * yy);
            var dist = point_distance(obj_heart.x + 4, obj_heart.y + 4, _x, _y);
            if (dist > closest_dist && point_distance(x, y, _x, _y) > 35 && (irandom(1) || closest_dist == 0) && (_x != last_tx || _y != last_ty))
            {
                closest_dist = dist;
                targ_x = _x;
                targ_y = _y;
            }
        }
    }
}
last_tx = storex;
last_ty = storey;
