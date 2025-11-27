function scr_walkntalk_create()
{
    auto_talk = false;
}

function scr_walkntalk_start(arg0 = false, arg1 = 4, arg2 = 1)
{
    var d = d_make();
    d.runcheck = 1;
    d.zurasu = 1;
    d.stay = 1;
    d.side = arg2;
    auto_talk = 1;
    global.flag[7] = 1;
    if (arg0)
    {
        with (instance_create(0, 0, obj_slowwalk))
        {
            scr_sizeexact(room_width, room_height);
            maxwalkspeed = arg1;
            extflag = "temporary walkntalk";
        }
    }
}

function scr_walkntalk_stop()
{
    auto_talk = 0;
    global.flag[7] = 0;
    with (obj_slowwalk)
    {
        if (variable_instance_exists(id, "extflag"))
        {
            if (extflag == "temporary walkntalk")
                instance_destroy();
        }
    }
}

function scr_walkntalk_action(arg0 = false)
{
    if (auto_talk)
    {
        if (d_ex())
        {
            if (instance_exists(obj_writer))
            {
                if (obj_writer.halt != 0)
                {
                    if (!variable_instance_exists(id, "talk_timer"))
                        talk_timer = 0;
                    talk_timer++;
                    var max_timer = (global.lang == "ja") ? 90 : 60;
                    if (talk_timer >= max_timer)
                    {
                        with (obj_writer)
                            forcebutton1 = 1;
                        talk_timer = 0;
                    }
                }
                else
                {
                    talk_timer = 0;
                }
            }
        }
        if (arg0)
        {
            if (variable_instance_exists(id, "beginx") && variable_instance_exists(id, "kris"))
            {
                if (kris.x > beginx)
                    roomloop = 1;
            }
        }
    }
}
