scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (!i_ex(voucher))
        {
            con = 1;
            if (global.flag[1022] == 0)
            {
                var tetalk = stringsetloc("Congrats kids, you've earned it!", "obj_b2sphinxvoucher_slash_Step_0_gml_19_0");
                scr_couchtalk(tetalk, "tenna", 2, 60);
            }
        }
    }
}
else
{
}
