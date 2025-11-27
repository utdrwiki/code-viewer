function scr_shakeobj_x()
{
    shakeobj = instance_create(x, y, obj_shakeobj);
    shakeobj.target = id;
    if (argument_count >= 1)
        shakeobj.shakeamt = argument[0];
    if (argument_count >= 2)
        shakeobj.shakespeed = argument[1];
    if (argument_count == 3)
        shakeobj.shakespeed = argument[2];
    with (shakeobj)
        event_user(0);
    return shakeobj;
}
