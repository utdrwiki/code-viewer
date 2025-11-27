function scr_calculate_move_distance(arg0, arg1, arg2, arg3, arg4 = 6)
{
    var move_time = 1;
    var distance_time = round(point_distance(arg0, arg1, arg2, arg3) / arg4);
    if (distance_time > move_time)
        move_time = distance_time;
    return move_time;
}
