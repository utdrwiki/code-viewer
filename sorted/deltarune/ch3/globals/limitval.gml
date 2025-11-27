function scr_limitval_lower(arg0, arg1, arg2)
{
    var ____limiter = instance_create(x, y, obj_limit_val);
    ____limiter.limittype = 0;
    ____limiter.target = arg0;
    ____limiter.variablename = arg1;
    ____limiter.vallimit = arg2;
    if (argument_count >= 4)
        ____limiter.lifetime = argument3;
}

function scr_limitval_upper(arg0, arg1, arg2)
{
    var ____limiter = instance_create(x, y, obj_limit_val);
    ____limiter.limittype = 1;
    ____limiter.target = arg0;
    ____limiter.variablename = arg1;
    ____limiter.vallimit2 = arg2;
    if (argument_count >= 4)
        ____limiter.lifetime = argument3;
}

function scr_limitval_clamp(arg0, arg1, arg2, arg3)
{
    var ____limiter = instance_create(x, y, obj_limit_val);
    ____limiter.target = arg0;
    ____limiter.limittype = 2;
    ____limiter.variablename = arg1;
    ____limiter.vallimit = arg2;
    ____limiter.vallimit2 = arg3;
    if (argument_count >= 5)
        ____limiter.lifetime = argument4;
}
