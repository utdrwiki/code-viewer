if ((con == 0 || con == 2 || con == 4 || con == 6) && global.interact == 0)
{
    var proceed = 0;
    with (obj_mainchara)
    {
        var trig = instance_place(x, y, obj_triggervolume);
        if (!place_meeting(x, y, obj_darkslide_new))
        {
            if (i_ex(trig))
            {
                proceed = 1;
                safe_delete(trig);
            }
        }
    }
    if (proceed)
    {
        if (con == 2)
            global.facing = 0;
        scr_speaker("jackenstein");
        if (con == 0)
        {
            with (obj_border_controller)
                set_custom_effect(3);
            msgsetloc(0, "* ..^1. LAIGHT.../", "obj_dw_church_dark_maze_controller_slash_Step_0_gml_31_0");
            msgnextloc("* ..^1. WHO DAIRE BRING LAIGHT HEAR.../%", "obj_dw_church_dark_maze_controller_slash_Step_0_gml_32_0");
        }
        if (con == 2)
        {
            with (obj_border_controller)
                set_custom_effect(4);
            msgsetloc(0, "* ..^1. GO..^1. BACK.../", "obj_dw_church_dark_maze_controller_slash_Step_0_gml_36_0");
            msgnextloc("* ..^1. YOU SUDN'T COME HERE.../%", "obj_dw_church_dark_maze_controller_slash_Step_0_gml_37_0");
            with (obj_light_following)
            {
            }
        }
        if (con == 4)
        {
            with (obj_border_controller)
                set_custom_effect(5);
            msgsetloc(0, "* ..^1. THIS ZOAN..^1. IS FORBIDEN.../", "obj_dw_church_dark_maze_controller_slash_Step_0_gml_46_0");
            msgnextloc("* ..^1. CONTINUE AND YOU MAY FIND YOURSELF SPOOCKED IN THE DARK.../%", "obj_dw_church_dark_maze_controller_slash_Step_0_gml_47_0");
            with (obj_light_following)
            {
            }
        }
        con++;
        if (con < 6)
        {
            with (d_make(0, undefined, undefined, 1))
            {
                drawbox = false;
                shadowybox = true;
            }
            global.interact = 1;
        }
    }
}
with (obj_light_following)
{
    if (target != -4)
        size = clamp(distance_to_point(2122, 1960) / 5, 54, 180);
}
if ((con == 1 || con == 3 || con == 5) && !d_ex())
{
    global.interact = 0;
    con++;
}
if (con == 7 && !d_ex())
{
    global.interact = 1;
    con++;
    with (obj_ch4_DCA08D)
        con = 0;
    instance_destroy();
}
