scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        var trig = 0;
        with (obj_board_trigger)
        {
            if (extflag == "b2southriverarea")
            {
                if (place_meeting(x, y, obj_mainchara_board))
                    trig = 1;
            }
        }
        if (trig == 1)
        {
            if (tennahere())
            {
                var tetalk = stringsetloc("Yeah, this is where you're supposed to go.", "obj_b2southwest_slash_Step_0_gml_17_0");
                scr_couchtalk(tetalk, "tenna", 2, 80);
                tenna.bounce = 1;
                con = 1;
            }
        }
    }
}
else
{
}
