if (active)
{
    occupied = false;
    if (place_meeting(x, y, obj_board_bridge_placed))
        occupied = true;
    if (occupied == false)
    {
        mysolid.x = x;
        mysolid.y = y;
    }
    else
    {
        mysolid.x = room_width;
        mysolid.y = room_height;
    }
}
