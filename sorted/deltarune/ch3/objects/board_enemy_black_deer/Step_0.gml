scr_board_enemy_step_init();
if (toriel == true && controlled == false)
{
}
else
{
    scr_board_enemy_sword_collision();
}
scr_depth_board();
scr_board_enemy_hurt_state();
if (hp < 1)
{
    obj_mainchara_board.abouttoregaincontrol = true;
    with (obj_board_puzzle_wall)
        con = 1;
    snd_play(snd_impact);
}
if (abouttoregaincontrol == true)
{
    if (!left_h() && !right_h() && !up_h() && !down_h())
    {
        abouttoregaincontrol = false;
        controlled = 1;
    }
}
if (controlled == 1)
{
    var _index = false;
    if (place_meeting(x - 30, y, obj_mainchara_board) && !i_ex(obj_board_swordhitbox))
    {
        with (obj_mainchara_board)
        {
            swordhitbox = instance_create(x, y, obj_board_swordhitbox);
            swordhitbox.facing = 1;
            swordhitbox.swordlv = swordlv;
            swordhitbox.parentid = id;
            swordhitbox.detectiononly = true;
            swordfacing = 1;
        }
    }
    else if (place_meeting(x, y - 30, obj_mainchara_board) && !i_ex(obj_board_swordhitbox))
    {
        with (obj_mainchara_board)
        {
            swordhitbox = instance_create(x, y, obj_board_swordhitbox);
            swordhitbox.facing = 0;
            swordhitbox.swordlv = swordlv;
            swordhitbox.parentid = id;
            swordhitbox.detectiononly = true;
            swordfacing = 0;
        }
    }
    nopress = 0;
    if (press_d == 0 && press_l == 0 && press_u == 0 && press_r == 0)
        nopress = 1;
    press_l = 0;
    press_r = 0;
    press_d = 0;
    press_u = 0;
    press_1 = 0;
    press_2 = 0;
    if (left_h())
        press_l = 1;
    if (right_h())
        press_r = 1;
    if (up_h())
        press_u = 1;
    if (down_h())
        press_d = 1;
    if (button1_p())
        press_1 = 1;
    if (button2_p())
        press_2 = 1;
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
    var lenient_x = px;
    var lenient_y = py;
    var on_top_of_ice_block = false;
    if (place_meeting(x + px, y + py, obj_board_solid))
        xymeet = 1;
    if (place_meeting(x + px, y, obj_board_solid))
    {
        var block = instance_place(x + px, y, obj_board_solid);
        if (block.object_index == obj_pushableblock_board && block.jello == true)
        {
        }
        else
        {
            if (place_meeting(x + px, y, obj_board_solid))
            {
                for (g = wspeed; g > 0; g -= 1)
                {
                    mvd = 0;
                    if (press_d == 0 && !place_meeting(x + px, y - g, obj_board_solid))
                    {
                        y -= g;
                        _index = true;
                        py = 0;
                        break;
                        mvd = 1;
                    }
                    if (press_u == 0 && mvd == 0 && !place_meeting(x + px, y + g, obj_board_solid))
                    {
                        y += g;
                        _index = true;
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
    }
    if (place_meeting(x, y + py, obj_board_solid))
    {
        var block = instance_place(x, y + py, obj_board_solid);
        if (block.object_index == obj_pushableblock_board && block.jello == true)
        {
        }
        else
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
                        _index = true;
                        px = 0;
                        break;
                        mvd = 1;
                    }
                    if (mvd == 0 && press_l == 0 && !place_meeting(x + g, y + py, obj_board_solid))
                    {
                        x += g;
                        _index = true;
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
    }
    if (place_meeting(x + px, y + py, obj_board_solid))
    {
        var block = instance_place(x + px, y + py, obj_board_solid);
        if (block.object_index == obj_pushableblock_board && block.jello == true)
        {
        }
        else
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
    }
    var lenient_amount = 8;
    if (px == 0 && lenient_y == 0 && lenient_x > 0)
    {
        var colllide_count = 0;
        for (i = 0; i <= 16; i += 1)
        {
            if (position_meeting(x + 32, (y + 32) - i, obj_board_solid))
                colllide_count = i;
        }
        if (colllide_count <= lenient_amount)
        {
            y -= wspeed;
            _index = true;
        }
        colllide_count = 0;
        for (i = 0; i <= 16; i += 1)
        {
            if (position_meeting(x + 32, y + 16 + i, obj_board_solid))
                colllide_count = i;
        }
        if (colllide_count <= lenient_amount)
        {
            y += wspeed;
            _index = true;
        }
    }
    if (px == 0 && lenient_y == 0 && lenient_x < 0)
    {
        var colllide_count = 0;
        for (i = 0; i <= 16; i += 1)
        {
            if (position_meeting(x - 1, (y + 32) - i, obj_board_solid))
                colllide_count = i;
        }
        if (colllide_count <= lenient_amount)
        {
            y -= wspeed;
            _index = true;
        }
        colllide_count = 0;
        for (i = 0; i <= 16; i += 1)
        {
            if (position_meeting(x - 1, y + 16 + i, obj_board_solid))
                colllide_count = i;
        }
        if (colllide_count <= lenient_amount)
        {
            y += wspeed;
            _index = true;
        }
    }
    if (py == 0 && lenient_x == 0 && lenient_y > 0)
    {
        lenient_amount = 12;
        var colllide_count = 0;
        for (i = 0; i <= 32; i += 1)
        {
            if (position_meeting((x + 32) - i, y + 32, obj_board_solid))
                colllide_count = i;
        }
        if (colllide_count <= lenient_amount)
        {
            x -= wspeed;
            _index = true;
        }
        colllide_count = 0;
        for (i = 0; i <= 32; i += 1)
        {
            if (position_meeting(x + i, y + 32, obj_board_solid))
                colllide_count = i;
        }
        if (colllide_count <= lenient_amount)
        {
            x += wspeed;
            _index = true;
        }
        lenient_amount = 8;
    }
    if (py == 0 && lenient_x == 0 && lenient_y < 0)
    {
        var colllide_count = 0;
        for (i = 0; i <= 32; i += 1)
        {
            if (position_meeting((x + 32) - i, y, obj_board_solid))
                colllide_count = i;
        }
        if (colllide_count <= lenient_amount)
        {
            x -= wspeed;
            _index = true;
        }
        colllide_count = 0;
        for (i = 0; i <= 32; i += 1)
        {
            if (position_meeting(x + i, y, obj_board_solid))
                colllide_count = i;
        }
        if (colllide_count <= lenient_amount)
        {
            x += wspeed;
            _index = true;
        }
    }
    x += px;
    y += py;
    if (px != 0 || py != 0)
        image_index += 0.125;
}
if (x < 128)
    x = 128;
if (x > 480)
    x = 480;
if (y < 64)
    y = 64;
if (y > 288)
    y = 288;
