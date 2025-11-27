if (tilecon == 0)
{
    if (tilechoice == 2)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Aw yeah, FRED!/%", "obj_board_investigatable_template_slash_Step_0_gml_9_0");
        d_make();
        tilecon = 99;
    }
    if (tilechoice == 3)
    {
        tilecon = 6;
        timer = 0;
        scr_fadeout(30);
    }
}
if (tilecon == 6)
{
    timer++;
    if (timer == 35)
    {
        tilecon = 7;
        scr_speaker("no_name");
        msgsetloc(0, "* Everything was engulfed in flames./%", "obj_board_investigatable_template_slash_Step_0_gml_28_0");
        d_make();
    }
}
if (tilecon == 7 && !d_ex())
{
    scr_fadein(15);
    safe_delete(obj_fadeout);
    tilecon = 99;
    scr_speaker("no_name");
    msgsetloc(0, "* Just kidding./%", "obj_board_investigatable_template_slash_Step_0_gml_39_0");
    d_make();
}
if (tilecon == 99)
{
    tilechoice = 0;
    if (!d_ex())
    {
        tilecon = 0;
        obj_board_controller.phase = 0;
        obj_board_controller.inputbuffer = 2;
    }
}
