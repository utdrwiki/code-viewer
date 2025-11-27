if (con == 1 && !d_ex())
{
    change = instance_create(x, y, obj_tvturnoff_manager);
    change.kind = 1;
    change.roomtarg = 181;
    global.entrance = 1;
    con = 2;
}
