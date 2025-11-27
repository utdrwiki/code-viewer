talking = 0;
if (global.plot == 17 && global.chapter == 2)
    talking = 1;
if (global.chapter == 4)
{
    if (!scr_tenna_alt_plot())
    {
        if (scr_flag_get(779) < 2 && scr_flag_get(780) == 0)
        {
            scr_flag_set(780, 1);
            talking = 1;
        }
    }
}
if (talking == 0)
{
    if (!instance_exists(obj_persistentfadein))
    {
        myinteract = 1;
        global.interact = 1;
        con = 1;
    }
}
if (talking == 1)
{
    if (global.chapter < 4)
    {
        global.interact = 1;
        talking = 2;
        myinteract = 3;
        scr_speaker("none");
        msgsetloc(0, "* (Can't go back there for now.)/%", "obj_dw_transition_interactable_slash_Other_10_gml_18_0");
        d = d_make();
    }
    if (global.chapter == 4)
    {
        with (obj_room_schooldoor)
            con = 0;
    }
}
