function scr_pingpong(arg0, arg1)
{
    if (arg1 == 0)
        return arg0;
    var __value = scr_loop(arg0, arg1 * 2);
    if (__value > arg1)
        __value = (arg1 * 2) - __value;
    return __value;
}

function scr_pingpong_ext(arg0, arg1, arg2)
{
    var __range = arg2 - arg1;
    if (__range == 0)
        return arg0;
    var __value = scr_loop(arg0 - arg1, __range * 2);
    if (__value > __range)
        __value = (__range * 2) - __value;
    return __value + arg1;
}

function scr_loop(arg0, arg1)
{
    if (arg1 == 0)
        return arg0;
    var __value = arg0 % arg1;
    if (arg0 < 0)
        __value += arg1;
    return __value;
}

function scr_loop_ext(arg0, arg1, arg2)
{
    var __range = arg2 - arg1;
    if (__range == 0)
        return arg0;
    var __amount = arg0 - arg1;
    var __value = __amount % __range;
    if (__value < 0)
        scr_debug_print(string(__amount) + " % " + string(__range) + " = " + string(__value));
    if (__amount < 0)
        __value += __range;
    return __value + arg1;
}
