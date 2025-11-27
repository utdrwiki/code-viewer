if (i_ex(obj_mike_controller))
{
    with (statue_readable)
        instance_destroy();
}
if (statue_active)
{
    if (con == 0)
    {
        var is_active = true;
        with (statue)
        {
            if (act == 1)
                is_active = false;
        }
        if (!is_active)
        {
            con = 1;
            scr_delay_var("con", 5, 5);
            global.interact = 1;
        }
    }
    if (con == 5)
    {
        statue_active = false;
        con = -1;
        global.interact = 0;
        clean_up();
    }
}
