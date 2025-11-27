function scr_delay_globalinteract(arg0, arg1)
{
    var _interact = instance_create(0, 0, obj_globalinteractdelay);
    _interact.set = arg0;
    with (_interact)
        alarm_set(0, arg1);
}
