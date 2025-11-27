con = 0;
timer = 0;
if (scr_flag_get(850) == 6 || global.tempflag[98] == 1)
    con = -1;
if (scr_debug())
{
    if (global.tempflag[90] || keyboard_check(ord("P")))
    {
        global.tempflag[90] = 0;
        with (obj_dw_church_dark_maze_controller)
        {
            con = 0;
            timer = 0;
        }
        with (obj_mainchara)
            setxy(881, 640);
        with (obj_caterpillarchara)
        {
            if (name == "susie")
            {
                setxy(823.9, 624.33);
                scr_caterpillar_interpolate_old();
            }
            if (name == "ralsei")
                setxy(768, 628);
        }
        krlight = instance_create(x, y, obj_light_following);
        with (krlight)
        {
            target = 1049;
            preset = 1;
            setxy(899, 678);
        }
        sulight = instance_create(x, y, obj_light_following);
        sulight.preset = 2;
        ralight = instance_create(x, y, obj_light_following);
        ralight.preset = 3;
        with (obj_light_following)
            size = clamp(distance_to_point(2122, 1960) / 5, 40, 200);
        with (obj_darkness_overlay)
            scr_delay_var("active", 1, 1);
    }
}
