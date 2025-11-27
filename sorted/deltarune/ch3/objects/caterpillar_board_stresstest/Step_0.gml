if (active == 1)
{
    scr_depth_board();
    wallcheck = 0;
    nowx = x;
    nowy = y;
    bkx = 0;
    bky = 0;
    bkxy = 0;
    aitimer++;
    if ((aitimer % 8) == 0)
    {
        var movedir = choose(0, 0, 0, 0, 0, 1, 2, 3, 4);
        switch (movedir)
        {
            case 0:
                press_l = 0;
                press_r = 0;
                press_d = 0;
                press_u = 0;
                nopress = 1;
                break;
            case 1:
                press_l = 1;
                press_r = 0;
                press_d = 0;
                press_u = 0;
                break;
            case 2:
                press_l = 0;
                press_r = 1;
                press_d = 0;
                press_u = 0;
                break;
            case 3:
                press_l = 0;
                press_r = 0;
                press_d = 1;
                press_u = 0;
                break;
            case 4:
                press_l = 0;
                press_r = 0;
                press_d = 0;
                press_u = 1;
                break;
        }
    }
    if (global.interact == 0 && canfreemove == 1)
    {
        px = 0;
        py = 0;
        pressdir = -1;
        if (press_r == 1)
        {
            px = wspeed;
            pressdir = 1;
        }
        if (press_l == 1)
        {
            px = -wspeed;
            pressdir = 3;
        }
        if (press_d == 1)
        {
            py = wspeed;
            pressdir = 0;
        }
        if (press_u == 1)
        {
            py = -wspeed;
            pressdir = 2;
        }
        if (nopress == 1 && pressdir != -1)
            facing = pressdir;
        if (facing == 2)
        {
            if (press_d == 1)
                facing = 0;
            if (press_u == 0 && pressdir != -1)
                facing = pressdir;
        }
        if (facing == 0)
        {
            if (press_u == 1)
                facing = 2;
            if (press_d == 0 && pressdir != -1)
                facing = pressdir;
        }
        if (facing == 3)
        {
            if (press_r == 1)
                facing = 1;
            if (press_l == 0 && pressdir != -1)
                facing = pressdir;
        }
        if (facing == 1)
        {
            if (press_l == 1)
                facing = 3;
            if (press_r == 0 && pressdir != -1)
                facing = pressdir;
        }
        nopress = 0;
        xmeet = 0;
        ymeet = 0;
        xymeet = 0;
        if (place_meeting(x + px, y + py, obj_board_solid))
            xymeet = 1;
        if (place_meeting(x + px, y, obj_board_solid))
        {
            if (place_meeting(x + px, y, obj_board_solid))
            {
                for (g = wspeed; g > 0; g -= 1)
                {
                    mvd = 0;
                    if (press_d == 0 && !place_meeting(x + px, y - g, obj_board_solid))
                    {
                        y -= g;
                        py = 0;
                        break;
                        mvd = 1;
                    }
                    if (press_u == 0 && mvd == 0 && !place_meeting(x + px, y + g, obj_board_solid))
                    {
                        y += g;
                        py = 0;
                        break;
                    }
                }
            }
            xmeet = 1;
            bkx = 0;
            if (px > 0)
            {
                for (i = px; i >= 0; i -= 1)
                {
                    if (!place_meeting(x + i, y, obj_board_solid))
                    {
                        px = i;
                        bkx = 1;
                        break;
                    }
                }
            }
            if (px < 0)
            {
                for (i = px; i <= 0; i += 1)
                {
                    if (!place_meeting(x + i, y, obj_board_solid))
                    {
                        px = i;
                        bkx = 1;
                        break;
                    }
                }
            }
            if (bkx == 0)
                px = 0;
        }
        if (place_meeting(x, y + py, obj_board_solid))
        {
            ymeet = 1;
            bky = 0;
            if (place_meeting(x, y + py, obj_board_solid))
            {
                for (g = wspeed; g > 0; g -= 1)
                {
                    mvd = 0;
                    if (press_r == 0 && !place_meeting(x - g, y + py, obj_board_solid))
                    {
                        x -= g;
                        px = 0;
                        break;
                        mvd = 1;
                    }
                    if (mvd == 0 && press_l == 0 && !place_meeting(x + g, y + py, obj_board_solid))
                    {
                        x += g;
                        px = 0;
                        break;
                    }
                }
            }
            if (py > 0)
            {
                for (i = py; i >= 0; i -= 1)
                {
                    if (!place_meeting(x, y + i, obj_board_solid))
                    {
                        py = i;
                        bky = 1;
                        break;
                    }
                }
            }
            if (py < 0)
            {
                for (i = py; i <= 0; i += 1)
                {
                    if (!place_meeting(x, y + i, obj_board_solid))
                    {
                        py = i;
                        bky = 1;
                        break;
                    }
                }
            }
            if (bky == 0)
                py = 0;
        }
        if (place_meeting(x + px, y + py, obj_board_solid))
        {
            xymeet = 1;
            bkxy = 0;
            i = px;
            j = py;
            while (j != 0 || i != 0)
            {
                if (!place_meeting(x + i, y + j, obj_board_solid))
                {
                    px = i;
                    py = j;
                    bkxy = 1;
                    break;
                }
                if (abs(j) >= 1)
                {
                    if (j > 0)
                        j -= 1;
                    if (j < 0)
                        j += 1;
                }
                else
                {
                    j = 0;
                }
                if (abs(i) >= 1)
                {
                    if (i > 0)
                        i -= 1;
                    if (i < 0)
                        i += 1;
                }
                else
                {
                    i = 0;
                }
            }
            if (bkxy == 0)
            {
                px = 0;
                py = 0;
            }
        }
        x += px;
        y += py;
    }
    if (fun == 0)
    {
        walk = 0;
        if (x != nowx && nopress == 0)
            walk = 1;
        if (y != nowy && nopress == 0)
            walk = 1;
        if (walk == 1)
            walkbuffer = 6;
        if (walkbuffer > 3)
        {
            walktimer += 1.5;
            if (walktimer >= 40)
                walktimer -= 40;
            if (walktimer < 10)
                image_index = 0;
            if (walktimer >= 10)
                image_index = 1;
            if (walktimer >= 20)
                image_index = 2;
            if (walktimer >= 30)
                image_index = 3;
        }
        if (walkbuffer <= 0 && fun == 0)
        {
            if (walktimer < 10)
                walktimer = 9.5;
            if (walktimer >= 10 && walktimer < 20)
                walktimer = 19.5;
            if (walktimer >= 20 && walktimer < 30)
                walktimer = 29.5;
            if (walktimer >= 30)
                walktimer = 39.5;
            image_index = 0;
        }
        walkbuffer -= 0.75;
        if (name == "susie")
        {
            if (facing == 0)
                sprite_index = spr_board_susie_walk_down;
            if (facing == 1)
                sprite_index = spr_board_susie_walk_right;
            if (facing == 2)
                sprite_index = spr_board_susie_walk_up;
            if (facing == 3)
                sprite_index = spr_board_susie_walk_left;
        }
        if (name == "ralsei")
        {
            if (facing == 0)
                sprite_index = spr_board_ralsei_walk_down;
            if (facing == 1)
                sprite_index = spr_board_ralsei_walk_right;
            if (facing == 2)
                sprite_index = spr_board_ralsei_walk_up;
            if (facing == 3)
                sprite_index = spr_board_ralsei_walk_left;
        }
    }
    if (button2_p() && sword == true && swordbuffer <= 0 && onebuffer <= 0 && global.interact == 0)
    {
        swordbuffer = 8;
        swordfacing = facing;
        canfreemove = 0;
    }
    if (swordbuffer > 0)
    {
        swordbuffer--;
        facing = swordfacing;
        if (facing == 0)
            sprite_index = spr_board_kris_strike_down;
        if (facing == 1)
            sprite_index = spr_board_kris_strike_right;
        if (facing == 2)
            sprite_index = spr_board_kris_strike_up;
        if (facing == 3)
            sprite_index = spr_board_kris_strike_left;
        if (swordbuffer == 7)
            image_index = 0;
        if (swordbuffer == 6)
            image_index = 0;
        if (swordbuffer == 5)
            image_index = 1;
        if (swordbuffer == 4)
            image_index = 1;
        if (swordbuffer == 3)
            image_index = 1;
        if (swordbuffer == 2)
            image_index = 2;
        if (swordbuffer == 1)
            image_index = 0;
        if (swordbuffer == 0)
            canfreemove = 1;
        if (swordbuffer == 5)
        {
            var swordhitbox = instance_create(x, y, obj_board_swordhitbox);
            swordhitbox.facing = facing;
        }
    }
}
