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
if (active == 1 && obj_board_camera.con == 0)
{
    if (susiewalkcon == 0 && obj_board_camera.con == 0)
    {
        susietime++;
        if (susietime == 1)
            ralsei.follow = true;
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
            with (obj_mainchara_board)
            {
                if (name == "susie")
                    sleepy = true;
            }
        }
        else
        {
            with (obj_mainchara_board)
            {
                if (name == "susie")
                    sleepy = true;
            }
            var go = choose(0, 1, 2);
            if (go == 0)
                scr_pathfind_to_point("susie", 1, irandom_range(1, 5), 0);
            if (go == 1)
                scr_pathfind_to_point("susie", 10, choose(1, 2, 5, 6), 0);
            if (go == 2)
                scr_pathfind_to_point("susie", choose(3, 4, 7), 1, 0);
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
                scr_pathfind_to_point("susie", targ.x, targ.y, 2);
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
            rawalk = 2;
            if (ralsei.x > 372)
                scr_pathfind_to_point("ralsei", 10, 2, 0);
            else
                scr_pathfind_to_point("ralsei", 7, 1, 0);
        }
    }
    if (rawalk == 2 && kris.iframes <= 0)
    {
        if (scr_board_checklocation("ralsei", board_tilex(10), board_tiley(2), 2) || scr_board_checklocation("ralsei", board_tilex(7), board_tiley(1), 2))
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
