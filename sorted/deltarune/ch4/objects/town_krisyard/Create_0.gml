con = -99;
if (global.chapter == 4)
{
    if (global.plot >= 100 && global.plot < 300)
    {
        with (obj_doorX_musfade)
            instance_destroy();
        var door_block = instance_create(140, 170, obj_solidblock);
        with (door_block)
        {
            image_xscale = 3;
            image_yscale = 1;
        }
        var door_readable = instance_create(150, 166, obj_readable_room1);
        with (door_readable)
        {
            extflag = "locked_door";
            image_xscale = 2;
        }
        if (!scr_tenna_alt_plot())
        {
            if (scr_flag_get(780) == 0 && scr_flag_get(779) < 2)
            {
                tv_marker = scr_marker(187, 185, spr_tv_broken_tarp);
                with (tv_marker)
                    scr_depth();
                con = -1;
            }
        }
    }
    else
    {
        instance_destroy();
        exit;
    }
}
