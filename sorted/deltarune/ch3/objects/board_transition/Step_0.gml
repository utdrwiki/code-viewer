if (prefill == 1)
{
    for (i = 0; i < 24; i += 1)
    {
        for (j = 0; j < 16; j += 1)
            tile[i][j] = 1;
    }
    prefill = 0;
}
if (con == 0)
{
    timer = 0;
    con = 1;
}
if (type == 0)
{
    if (con == 1)
    {
        timer++;
        if (i_ex(obj_gameshow_swordroute))
        {
            var amt = merge_color(s_curcol, c_black, (tilescovered + 1) / 8);
            obj_gameshow_swordroute.screencolor = amt;
        }
        if (timer >= transitionspeed)
        {
            timer = 0;
            tilescovered += 1;
        }
        for (i = 0; i < 24; i += 1)
        {
            tile[i][tilescovered] = 1;
            tile[i][15 - tilescovered] = 1;
            tile[tilescovered][i] = 1;
            tile[23 - tilescovered][i] = 1;
        }
        if (tilescovered >= 8)
        {
            con = 2;
            timer = 0;
        }
    }
    if (con == 2)
    {
        timer += 1;
        if (timer == 1)
            triggered = 1;
        if (timer >= pausetime)
        {
            tilescovered = 8;
            timer = 0;
            con = 3;
        }
    }
    if (con == 3)
    {
        timer++;
        if (timer >= transitionspeed)
        {
            timer = 0;
            tilescovered -= 1;
        }
        for (i = 13; i >= (tilescovered * 2); i -= 1)
        {
            for (j = 7; j >= tilescovered; j -= 1)
            {
                tile[i][j] = 0;
                tile[i][15 - j] = 0;
                tile[23 - i][j] = 0;
                tile[23 - i][15 - j] = 0;
            }
        }
        if (tilescovered <= 0)
        {
            con = 4;
            timer = 0;
        }
        var amt = tilescovered / 8;
        if (i_ex(obj_gameshow_swordroute))
        {
            var mynewcolor = -4;
            with (obj_board_screenColorChanger)
            {
                if (distance_to_point(160, 96) < 32)
                {
                    mynewcolor = id;
                    init = 1;
                }
            }
            if (i_ex(mynewcolor))
                obj_gameshow_swordroute.screencolor = merge_color(mynewcolor.image_blend, c_black, amt);
        }
    }
    if (con == 4)
    {
        if (interactResetter == true)
            global.interact = 0;
        instance_destroy();
    }
}
