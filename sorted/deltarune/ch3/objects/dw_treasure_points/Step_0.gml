if (myinteract == 3)
{
    if (i_ex(mydialoguer) == false)
    {
        global.interact = 0;
        myinteract = 0;
        with (obj_mainchara)
            onebuffer = 5;
    }
}
else if (open_chest)
{
    if (chest_con == 0 && !d_ex())
    {
        chest_con = 1;
        snd_play(snd_locker);
        scr_speaker("no_name");
        msgsetloc(0, "* You opened the chest./%", "obj_dw_treasure_points_slash_Step_0_gml_23_0");
        var _d = d_make();
        _d.stay = 5;
        scr_var_delay("chest_con", 2, 1);
    }
    if (chest_con == 2 && !d_ex())
    {
        chest_con = 3;
        scr_speaker("no_name");
        msgsetloc(0, "* Inside was 10 POINTs!/%", "obj_dw_treasure_points_slash_Step_0_gml_37_0");
        var _d = d_make();
        _d.stay = 5;
        scr_var_delay("chest_con", 4, 1);
        display = instance_create(0, 0, obj_dw_points_fake_ui);
        with (display)
            display_points(10);
    }
    if (chest_con == 4 && !d_ex())
    {
        chest_con = 5;
        snd_play(snd_item);
        with (display)
            show_point_increase();
        scr_speaker("no_name");
        msgsetloc(0, "* 10 POINTs was added to your SCORE./%", "obj_dw_treasure_points_slash_Step_0_gml_57_0");
        d_make();
        scr_var_delay("chest_con", 6, 1);
    }
    if (chest_con == 6 && !d_ex() && i_ex(display) && !display.increase_points)
    {
        chest_con = 0;
        open_chest = false;
        myinteract = 3;
        scr_flag_set(treasure_flag, 1);
        with (display)
            instance_destroy();
    }
}
