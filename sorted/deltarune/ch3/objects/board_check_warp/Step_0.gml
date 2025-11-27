if (tilecon == 0)
{
    if (tilechoice == 2)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* You can go inside./%", "obj_board_check_warp_slash_Step_0_gml_9_0");
        d_make();
        tilecon = 99;
    }
    if (tilechoice == 3)
    {
        if (i_ex(obj_board_camera))
        {
            obj_board_camera.shift = "warptile";
            obj_board_camera.warpx = warpx;
            obj_board_camera.warpy = warpy;
            obj_board_camera.playerX = playx;
            obj_board_camera.playerY = playy;
            obj_board_camera.movetype = movetype;
        }
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
    }
}
