function d_make_ext()
{
    var _d = d_make();
    _d.side = argument0;
    if (argument_count > 1)
        _d.boxheight = argument1;
    if (argument_count > 2)
        _d.boxwidth = argument2;
    if (argument_count > 3)
        _d.xoff = argument3;
    if (argument_count > 4)
        _d.yoff = argument4;
    if (argument_count > 5)
        _d.free = argument5;
    if (argument_count > 6)
        _d.zurasu = argument6;
    if (argument_count > 7)
        _d.stay = argument7;
    return _d;
}
