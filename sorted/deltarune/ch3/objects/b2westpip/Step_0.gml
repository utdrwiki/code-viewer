scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (tennahere())
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("Even I don't know what's this way!", "obj_b2westpip_slash_Step_0_gml_15_0");
            scr_couchtalk(tetalk, "tenna", 2, 80);
        }
        con = 1;
    }
}
else
{
}
