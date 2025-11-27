function scr_jump_arc(arg0 = id, arg1 = x, arg2 = y, arg3, arg4, arg5, arg6)
{
    var _jump = instance_create(0, 0, obj_jump_arc);
    with (_jump)
    {
        master = arg0;
        origx = arg1;
        origy = arg2;
        goalx = arg3;
        goaly = arg4;
        zheight = arg5;
        time = arg6;
        jump_start();
    }
    return _jump;
}
