function scr_weighted_choice()
{
    var _n = 0;
    for (var _i = 1; _i < argument_count; _i += 2)
    {
        if (argument[_i] <= 0)
            continue;
        _n += argument[_i];
    }
    _n = random(_n);
    for (var _i = 1; _i < argument_count; _i += 2)
    {
        if (argument[_i] <= 0)
            continue;
        _n -= argument[_i];
        if (_n < 0)
            return argument[_i - 1];
    }
    return argument[0];
}
