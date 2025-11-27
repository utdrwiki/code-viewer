function round_to_multiple(arg0, arg1)
{
    if (arg1 == 0)
        return arg0;
    return round(arg0 / arg1) * arg1;
}

function ceil_to_multiple(arg0, arg1)
{
    if (arg1 == 0)
        return arg0;
    return ceil(arg0 / arg1) * arg1;
}

function floor_to_multiple(arg0, arg1)
{
    if (arg1 == 0)
        return arg0;
    return floor(arg0 / arg1) * arg1;
}
