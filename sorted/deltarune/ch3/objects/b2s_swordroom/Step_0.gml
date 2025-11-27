scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
    }
    if (obj_board_camera.con == 0 && !made)
    {
        with (obj_board_boat)
        {
            if (extflag == "swordreset")
                instance_destroy();
        }
        boat = instance_create(999, 999, obj_board_boat);
        with (boat)
            setxy_board(2176, 3200);
        boat.extflag = "swordreset";
        made = true;
    }
}
else
{
    made = false;
}
