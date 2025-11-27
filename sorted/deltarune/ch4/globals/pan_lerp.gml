function scr_pan_lerp(arg0, arg1, arg2, arg3 = -1)
{
    panner = instance_create(arg0, arg1, obj_panner);
    panner.panmax = arg2;
    panner.type = 1;
    if (arg3 != -1)
        panner.locktype = arg3;
}
