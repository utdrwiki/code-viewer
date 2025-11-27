if (con == 1 && !d_ex())
{
    change = instance_create(x, y, obj_tvturnoff_manager);
    change.kind = 1;
    change.roomtarg = 161;
    global.entrance = 9;
    con = 2;
}
