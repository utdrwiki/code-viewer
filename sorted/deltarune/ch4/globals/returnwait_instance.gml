function scr_returnwait_instance(arg0, arg1, arg2)
{
    if (!instance_exists(arg0))
    {
        debug_print("Argument 1 does not exist");
        return 1;
    }
    if (!instance_exists(arg1))
    {
        debug_print("Argument 2 does not exist");
        return 1;
    }
    var dist = max(1, round(point_distance(arg0.x, arg0.y, arg1.x, arg1.y) / arg2));
    return dist;
}
