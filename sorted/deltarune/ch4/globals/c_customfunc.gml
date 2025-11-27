function c_customfunc(arg0, arg1 = -1)
{
    if (instance_exists(obj_cutscene_master))
    {
        with (obj_cutscene_master)
            array_push(customfuncs, arg0);
        c_cmd("customfunc", arg1, 0, 0, 0);
    }
}

function c_delay_customfunc(arg0, arg1, arg2 = -1)
{
    if (instance_exists(obj_cutscene_master))
        c_cmd_x("delaycmd", arg0, "customfunc", arg2, arg1, 0, 0);
}
