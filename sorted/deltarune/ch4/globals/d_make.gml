function d_make(arg0 = -1, arg1 = -1, arg2 = -1, arg3 = -1, arg4 = -1)
{
    var _____d = instance_create(0, 0, obj_dialoguer);
    if (arg0 != -1)
        _____d.side = arg0;
    if (arg1 != -1)
        _____d.zurasu = arg1;
    if (arg2 != -1)
        _____d.stay = arg2;
    if (arg3 != -1)
        _____d.runcheck = arg3;
    if (arg4 != -1)
        _____d.preventcskip = arg3;
    return _____d;
}
