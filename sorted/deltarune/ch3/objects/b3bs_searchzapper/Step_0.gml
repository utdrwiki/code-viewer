switch (state)
{
    case 0:
        scr_depth();
        if (pacetype == 0 && global.interact == 0)
        {
            if (con == 0)
            {
                dir = 1;
                image_index = dir;
                x += 4;
                if (x >= (xstart + 240))
                {
                    x = xstart + 240;
                    con = 1;
                    timer = 0;
                }
            }
            if (con == 1 || con == 3)
            {
                timer++;
                if (timer == 30 || timer == 90)
                {
                    dir = 2;
                    image_index = dir;
                }
                if (timer == 60 || timer == 1)
                {
                    dir = 0;
                    image_index = dir;
                }
                if (timer == 120)
                {
                    timer = 0;
                    if (con == 1)
                        con = 2;
                    if (con == 3)
                        con = 0;
                }
            }
            if (con == 2)
            {
                dir = 3;
                image_index = dir;
                x -= 4;
                if (x <= xstart)
                {
                    x = xstart;
                    con = 3;
                    timer = 0;
                }
            }
        }
        if (pacetype == 1 && global.interact == 0)
        {
            if (con == 0)
            {
                dir = 1;
                image_index = dir;
                x += 4;
                if (x >= (xstart + 280))
                {
                    x = xstart + 280;
                    con = 1;
                    timer = 0;
                }
            }
            if (con == 1 || con == 3 || con == 5 || con == 7)
            {
                timer++;
                if (timer == 30 || timer == 90)
                {
                    dir = 2;
                    image_index = dir;
                }
                if (timer == 60 || timer == 1)
                {
                    dir = 0;
                    image_index = dir;
                }
                if (timer == 120)
                {
                    timer = 0;
                    if (con == 1)
                        con = 2;
                    if (con == 3)
                        con = 4;
                    if (con == 5)
                        con = 6;
                    if (con == 7)
                        con = 0;
                }
            }
            if (con == 2)
            {
                dir = 1;
                image_index = dir;
                x += 4;
                if (x >= (xstart + 560))
                {
                    x = xstart + 560;
                    con = 3;
                    timer = 0;
                }
            }
            if (con == 4)
            {
                dir = 3;
                image_index = dir;
                x -= 4;
                if (x <= (xstart + 280))
                {
                    x = xstart + 280;
                    con = 5;
                    timer = 0;
                }
            }
            if (con == 6)
            {
                dir = 3;
                image_index = dir;
                x -= 4;
                if (x <= xstart)
                {
                    x = xstart;
                    con = 7;
                    timer = 0;
                }
            }
        }
        var trig = 0;
        with (sarea)
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = 1;
            if (trig == 1)
            {
                with (obj_mainchara)
                {
                    if (place_meeting(x, y, obj_b3bs_stealthsafe))
                        trig = 0;
                }
            }
        }
        if (trig == 1)
        {
            debug_print("CAUGHT!!!!");
            state = 1;
            with (instance_create(x - 4, y + 116, obj_chaseenemy_zapper))
            {
            }
            safe_delete(sarea);
            instance_destroy();
        }
        break;
    case 1:
        timer++;
        if (timer == 1)
        {
            visible = false;
            state = 2;
        }
        break;
    case 2:
        break;
    case 3:
        break;
}
