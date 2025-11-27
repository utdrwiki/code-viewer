function scr_array_shuffle(arg0)
{
    var _len = array_length(arg0);
    var _last = 0;
    var _i = 0;
    while (_len)
    {
        _i = irandom(--_len);
        _last = arg0[_len];
        arg0[_len] = arg0[_i];
        arg0[_i] = _last;
    }
    return arg0;
}
