function scr_limitval_lower(arg0 = id, arg1, arg2, arg3 = -1)
{
    var ____limiter = instance_create(x, y, obj_limit_val);
    ____limiter.limittype = 0;
    ____limiter.target = arg0;
    ____limiter.variablename = arg1;
    ____limiter.vallimit = arg2;
    ____limiter.lifetime = arg3;
    return ____limiter;
}

function scr_limitval_upper(arg0 = id, arg1, arg2, arg3 = -1)
{
    var ____limiter = instance_create(x, y, obj_limit_val);
    ____limiter.limittype = 1;
    ____limiter.target = arg0;
    ____limiter.variablename = arg1;
    ____limiter.vallimit2 = arg2;
    ____limiter.lifetime = arg3;
    return ____limiter;
}

function scr_limitval_clamp(arg0 = id, arg1, arg2, arg3, arg4 = -1)
{
    var ____limiter = instance_create(x, y, obj_limit_val);
    ____limiter.target = arg0;
    ____limiter.limittype = 2;
    ____limiter.variablename = arg1;
    ____limiter.vallimit = arg2;
    ____limiter.vallimit2 = arg3;
    ____limiter.lifetime = arg4;
    return ____limiter;
}
