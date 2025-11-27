if (kris == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.kris = id;
    }
}
if (susie == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "susie")
            other.susie = id;
    }
}
if (ralsei == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "ralsei")
            other.ralsei = id;
    }
}
if (tetalk == 0)
{
    with (obj_b1cactusfield1)
        other.tetalk = tetalk;
}
if (active == 1 && obj_board_camera.con == 0)
{
    if (susiewalkcon == 0 && obj_board_camera.con == 0)
    {
        susietime++;
        if (susietime >= 10)
        {
            if (!i_ex(obj_quizchaser) && !i_ex(obj_chaseenemy_board))
            {
                susiewalkcon = 1;
                susietime = 0;
            }
        }
    }
    if (susiewalkcon == 1)
    {
        var weedcount = 0;
        with (obj_board_grabbablegrass)
        {
            if (active)
                weedcount++;
        }
        if (global.flag[1020] == 0)
            weedcount = 0;
        if (weedcount != 0)
        {
            susiewalkcon = 10;
        }
        else
        {
            susie.facing = 0;
            susiewalkcon = 2;
        }
    }
    if (susiewalkcon == 10)
    {
        targ = instance_nearest(susie.x, susie.y, obj_board_grabbablegrass);
        if (i_ex(targ))
        {
            if (point_in_rectangle(targ.x, targ.y, board_tilex(0), board_tiley(0), board_tilex(11), board_tiley(7)))
            {
                scr_pathfind_to_point("susie", targ.x, targ.y, 0);
            }
            else
            {
                scr_pathfind_end("susie");
                targ = -4;
                debug_print("no target");
                susiewalkcon = 99;
                susie.sleepy = true;
                scr_play_susie_recording("0W");
            }
        }
        susietime = 0;
        susiewalkcon = 11;
    }
    if (susiewalkcon == 11)
    {
        if (i_ex(targ))
        {
            if (scr_board_checklocation("susie", targ.x, targ.y, 2))
            {
                scr_pathfind_end("susie");
                susietime = 0;
                susiewalkcon = 12;
            }
        }
    }
    if (susiewalkcon == 2)
    {
        if (susie.y == 64)
        {
            suplay = 2;
        }
        else if (susie.x == 480)
        {
            scr_pathfind_to_point("susie", 444, 208, 1);
            suplay = 1;
        }
        else if (susie.y == 288)
        {
            scr_pathfind_to_point("susie", 308, 252, 2);
            suplay = 0;
        }
        else if (susie.x == 128)
        {
            scr_pathfind_to_point("susie", 160, 184, 0);
            suplay = 3;
        }
        else
        {
            suplay = choose(1, 0, 3);
            if (suplay == 1)
                scr_pathfind_to_point("susie", 444, 208, 1);
            if (suplay == 0)
                scr_pathfind_to_point("susie", 308, 252, 2);
            if (suplay == 3)
                scr_pathfind_to_point("susie", 160, 184, 0);
        }
        susiewalkcon = 2.1;
    }
    if (susiewalkcon == 2.1)
    {
        susie.sleepy = true;
        if (suplay == 0)
        {
            if (scr_board_checklocation("susie", 308, 252, 1))
            {
                scr_play_recording("susie", "0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0RU0U0U0U0U0U0U0U0U0U0U0U0U0U0RU0RU0U0U0U0U0U0U0U0U0U0U0U0U0U0U0LU0LU0LU0LU0LU0LU0LU0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0LD0LD0LD0LD0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0LD0LD0L0L0L0L0L0L0L0L0L0L0L0LU0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0RU0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0RD0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W");
                susiewalkcon = 2.2;
            }
        }
        if (suplay == 1)
        {
            if (scr_board_checklocation("susie", 444, 208, 1))
            {
                scr_play_recording("susie", "0D0D0D0D0D0D0D0D0LD0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0RU0RU0RU0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0RD0RD0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0LD0LD0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0LU0U0U0U0U0U0U0U0U0U0U0U0U0U0U0LU0LU0L0L0L0L0L0L0L0L0L0L0L0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0RD0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0RD0D0D0D0W0W0W0W0W0L0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W");
                susiewalkcon = 2.2;
            }
        }
        if (suplay == 3)
        {
            if (scr_board_checklocation("susie", 160, 184, 1))
            {
                scr_play_recording("susie", "0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0RD0RD0R0R0R0R0R0R0R0R0R0R0R0R0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0RU0RU0RU0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0RD0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0LD0LD0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0LU0LU0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0LU0LU0L0L0L0L0L0L0L0L0L0L0L0L0L0L0LD0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0RD0RD0RD0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0RD0D0D0D0D0W0W0W0W0W0W0W0W0W0W0W");
                susiewalkcon = 2.2;
            }
        }
    }
    if (susiewalkcon == 12)
    {
        susietime++;
        if (susietime == 5)
            scr_play_susie_recording("0101");
        if (susietime == 45)
            susiewalkcon = 0;
    }
    if (rawalk == 0 && obj_board_camera.con == 0)
    {
        ralsei.follow = false;
        if (scr_board_checklocation("ralsei", kris.x, kris.y, 16))
        {
            rawalk = 1;
            scr_board_caterpillar_interpolate_ralsei();
            ralsei.follow = true;
        }
    }
    if (rawalk == 1 && obj_board_camera.con == 0)
    {
        if (kris.iframes > 0)
        {
            if (cactuschecked == 0)
            {
                if (obj_board_cactus_flirt.pushed == 1)
                {
                    cactuschecked = 1;
                    scr_board_gridreset();
                }
            }
            rawalk = 2;
            if (ralsei.x < 320)
                scr_pathfind_to_point("ralsei", 3, 2, 0);
            else
                scr_pathfind_to_point("ralsei", 8, 1, 0);
        }
    }
    if (rawalk == 2 && kris.iframes <= 0)
    {
        if (scr_board_checklocation("ralsei", board_tilex(3), board_tiley(2), 2) || scr_board_checklocation("ralsei", board_tilex(8), board_tiley(1), 2))
            rawalk = 0;
    }
}
else
{
    rawalk = 0;
    suwalktimer = 0;
    con = 0;
    timer = 0;
    susiewalkcon = 0;
    suplay = -1;
    susiewalkcon = 0;
    susietime = 0;
}
