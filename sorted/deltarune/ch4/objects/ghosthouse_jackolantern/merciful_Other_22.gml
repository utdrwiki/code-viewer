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
    debug_print("hit!");
}
last_tx = storex;
last_ty = storey;
