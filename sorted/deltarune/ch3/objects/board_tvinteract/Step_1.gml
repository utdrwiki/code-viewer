pre = 0;
if (myinteract < 3)
{
    var trig = 0;
    with (obj_board_trigger)
    {
        if (place_meeting(x, y, obj_mainchara_board))
            trig = 1;
    }
    if (trig == 1)
    {
        with (obj_mainchara_board)
        {
            if (facing == 2 && button1_p())
            {
                trig = 2;
                canfreemove = false;
                scr_delay_var("canfreemove", true, 10);
            }
        }
    }
    if (trig == 2)
        myinteract = 3;
}
