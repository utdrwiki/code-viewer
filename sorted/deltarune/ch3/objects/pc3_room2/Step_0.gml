if (con == 0)
{
    if (puz.solved == 1)
    {
        con = 1;
        global.flag[1150] = 3;
        debug_print("yes");
    }
}
if (!made)
{
    var trig = 0;
    with (obj_board_trigger)
    {
        if (extflag == "pc3safety")
        {
            if (place_meeting(x, y, obj_mainchara_board))
                trig = 1;
        }
    }
    if (trig)
    {
        made = 1;
        with (instance_create(2656, 1472, obj_board_solid))
        {
            setxy_board();
            scr_size(1, 2);
        }
    }
}
