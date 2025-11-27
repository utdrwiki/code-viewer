function scr_round_to_beat(arg0, arg1, arg2 = 4, arg3 = 0)
{
    if (arg2 <= 0)
        arg2 = 1;
    var __mps = 60 / arg1 / arg2;
    return (round((arg0 - arg3) / __mps) * __mps) + arg3;
}

function scr_floor_to_beat(arg0, arg1, arg2 = 4, arg3 = 0)
{
    if (arg2 <= 0)
        arg2 = 1;
    var __mps = 60 / arg1 / arg2;
    return (floor((arg0 - arg3) / __mps) * __mps) + arg3;
}

function scr_ceil_to_beat(arg0, arg1, arg2 = 4, arg3 = 0)
{
    if (arg2 <= 0)
        arg2 = 1;
    var __mps = 60 / arg1 / arg2;
    return (ceil((arg0 - arg3) / __mps) * __mps) + arg3;
}

function scr_round_to_offbeat(arg0, arg1, arg2 = 1, arg3 = 0.5, arg4 = 0)
{
    return scr_round_to_beat(arg0, arg1, arg2, arg4 + (arg3 * (60 / arg1)));
}

function scr_ceil_to_offbeat(arg0, arg1, arg2 = 1, arg3 = 0.5, arg4 = 0)
{
    return scr_ceil_to_beat(arg0, arg1, arg2, arg4 + (arg3 * (60 / arg1)));
}

function scr_floor_to_offbeat(arg0, arg1, arg2 = 1, arg3 = 0.5, arg4 = 0)
{
    return scr_floor_to_beat(arg0, arg1, arg2, arg4 + (arg3 * (60 / arg1)));
}
