if (con == 0)
{
    if (room == room_dark2_ch1)
    {
        if (x < (__view_get((0 << 0), 0) + 630))
        {
            vspeed = -8
            image_speed = 0.2
            con = 1
            if (global.plot < 12)
                global.plot = 12
        }
    }
    if (room == room_dark3_ch1)
    {
        if (x < (__view_get((0 << 0), 0) + 610))
        {
            hspeed = 8
            image_speed = 0.2
            con = 1
            if (global.plot < 13)
                global.plot = 13
        }
    }
}
