function scr_shakeobj_ext()
{
    var _shakeobj = instance_create(x, y, obj_shakeobj_ext);
    _shakeobj.target = id;
    if (argument_count >= 1)
    {
        if (i_ex(argument0))
            _shakeobj.target = argument0;
    }
    if (argument_count >= 2)
    {
        if (argument1 != -1)
            _shakeobj.shakexamt = argument1;
    }
    if (argument_count >= 3)
    {
        if (argument2 != -1)
            _shakeobj.shakeyamt = argument2;
    }
    if (argument_count >= 4)
    {
        if (argument3 != -1)
            _shakeobj.shakereduct = argument3;
    }
    if (argument_count >= 5)
    {
        if (argument4 != -1)
            _shakeobj.shakespeed = argument4;
    }
    with (_shakeobj)
        event_user(0);
}
