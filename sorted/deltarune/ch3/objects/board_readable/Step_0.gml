if (tilecon == 0)
{
    if (tilechoice == 2)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Everything looks pretty here./%", "obj_board_readable_slash_Step_0_gml_9_0");
        d_make();
        tilecon = 99;
    }
    if (tilechoice == 3)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Huh, you chose book./%", "obj_board_readable_slash_Step_0_gml_16_0");
        d_make();
        tilecon = 99;
    }
}
if (tilecon == 99)
{
    tilechoice = 0;
    if (!d_ex())
    {
        tilecon = 0;
        obj_board_controller.phase = 0;
        obj_board_controller.inputbuffer = 2;
        if (dontmem != 0)
            obj_board_controller.menooptionmem = 0;
    }
}
if (turnended == 1)
{
    if (!place_meeting(x, y, obj_mainchara_board))
        turnended = 0;
}
