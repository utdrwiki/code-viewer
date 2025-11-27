function scr_checkskiptimer(arg0, arg1, arg2 = true, arg3 = true)
{
    var _skip = false;
    if (timer > (arg0 + 5) && timer < (arg1 - 1))
    {
        if (button3_h())
            _skip = true;
    }
    if (timer > (arg0 + 1) && timer < (arg1 - 1))
    {
        if (button1_p())
            _skip = true;
    }
    if (_skip)
    {
        timer = arg1 - 1;
        if (arg2)
        {
            with (obj_tennatalkbubble)
                instance_destroy();
        }
        if (arg3)
        {
            with (obj_couchwriter)
                instance_destroy();
        }
        _skip = false;
    }
    return _skip;
}
