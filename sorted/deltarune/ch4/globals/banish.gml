function scr_banish(arg0 = id, arg1)
{
    with (instance_create_depth(0, 0, 0, obj_banish))
    {
        time = arg1;
        alarm[0] = arg1;
        target = arg0;
        base = target.image_alpha;
        persistent = target.persistent;
    }
}
