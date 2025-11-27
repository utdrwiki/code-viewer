if (state == 0)
{
    if (i_ex(sarea))
    {
        var s_x = x;
        var s_y = y;
        with (sarea)
            setxy(s_x + 59, (s_y + 148) - 18);
        sarea.image_angle = 90 * (dir + 2);
        switch (dir)
        {
            case 0:
            case 1:
            case 2:
            case 3:
        }
    }
}
else if (i_ex(sarea))
{
    with (sarea)
        setxy(room_width, room_height);
}
