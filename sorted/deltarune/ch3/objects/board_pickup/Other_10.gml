if (con == 2 && obj_board_camera.con == 0 && obj_board_camera.shift == "none" && global.interact == 0 && tempblock == false)
{
    if (type == "power")
    {
        if (place_meeting(x, y, other.susie))
            con = 30;
        if (place_meeting(x, y, player))
            con = 20;
    }
    else
    {
        con = 3;
    }
}
