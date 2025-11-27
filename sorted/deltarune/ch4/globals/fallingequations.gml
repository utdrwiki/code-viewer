function scr_getfalltime(arg0, arg1)
{
    arg1 = abs(arg1);
    return sqrt((2 * arg1) / arg0);
}

function scr_getfalldistance(arg0, arg1)
{
    return 0.5 * arg0 * sqr(arg1);
}

function scr_getfallgravity(arg0, arg1)
{
    return (2 * arg0) / sqr(arg1);
}

function scr_getvelocity_fromtime(arg0, arg1)
{
    return arg0 * arg1;
}

function scr_getvelocity_fromdistance(arg0, arg1)
{
    return sqrt(2 * arg0 * arg1);
}

function scr_gettime_fromvelocity(arg0, arg1)
{
    return arg1 / arg0;
}
