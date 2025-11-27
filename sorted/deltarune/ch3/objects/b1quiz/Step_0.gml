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
if (tenna == 0)
    tenna = obj_actor_tenna;
if (rareal == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "ralsei")
            other.rareal = id;
    }
}
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (vcon == 0)
        {
            vcontimer = 0;
            vcon = 1;
        }
        con = 1;
    }
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
            var potsinstead = false;
            if (global.flag[1020] == 1 && (!i_ex(obj_quizchaser) || susie.y > 266))
            {
                with (obj_board_grabbleObject)
                {
                    if (active)
                        potsinstead = true;
                }
            }
            if (potsinstead == true)
            {
                debug_print("pots instead!");
                susie.graballpots = true;
                susiewalkcon = 99;
            }
        }
    }
    if (susiewalkcon == 99)
    {
        var potcount = 0;
        with (obj_board_grabbleObject)
        {
            if (active)
                potcount++;
        }
        if (potcount == 0)
        {
            susiewalkcon = 0;
            susietime = -30;
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
            scr_pathfind_to_point("susie", 5, 2, 0);
            susiewalkcon = 2;
        }
    }
    if (susiewalkcon == 2 && scr_board_checklocation("susie", 5, 2, 4))
    {
        susietime++;
        if (susietime == 1)
        {
            scr_pathfind_end("susie");
            var rand = choose(0, 0, 0, 1);
            if (rand == 0)
                scr_pathfind_to_point("susie", 7, choose(2, 3), 0);
            if (rand == 1)
            {
                var sustring = choose("0RD0R0R0R0RU0RU0U0U0LU0L0L0L0LD0D0D0RD0R0R0R0RU0RU0U0LU0L0L0L0L0LD0D0D0RD0R0R0R0RU0U0U0LU0L0L0L0L0LD0D0RD0R0R0D0", "0D0D0D0D0R0R0R0R0R0R0R0R0R0RU0U0U0U0U0U0LU0L0L0L0L0L0L0L0LD0D0D0D0D0D0L0L0L0L0L0L0L0L0L0LU0U0U0U0U0R0R0R0R0R0R0R0R0RD0RD0D0D0D0D0D0R0R0R0R0R0R0R0R0RU0U0U0U0U0U0U0LU0L0L0L0L0L0L0L0LD0D0D0D0D0D0D0LD0L0L0L0L0L0L0L0LU0U0U0U0U0RU0R0R0R0R0R0R0R0R0RD0RD0D0D0D0D0D0RD0R0R0R0R0R0RU0RU0U0U0U0U0U0U0LU0L0L0L0L0L0L0L0LD0D0D0D0D0D");
                scr_play_recording("susie", sustring);
            }
            susie.sleepy = true;
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
    if (susiewalkcon == 12)
    {
        susietime++;
        if (susietime == 5)
            scr_play_susie_recording("0101");
        if (susietime == 45)
            susiewalkcon = 0;
    }
}
else
{
    con = 0;
    timer = 0;
    susiewalkcon = 0;
    susietime = 0;
}
if (vcon == 1 && obj_board_camera.con == 0)
{
    tenna.bounce = 1;
    var tetalk = stringsetloc("Quiz vortex! Watch out!", "obj_b1quiz_slash_Step_0_gml_154_0");
    scr_couchtalk(tetalk, "tenna", 2, 75);
    if (kris.y >= 268)
        vcon = -99;
    else
        vcon = 2;
}
if (vcon == 2)
{
    var docheck = 0;
    if (x >= 128 && x <= 512 && y >= 64 && y <= 320)
        docheck = 1;
    if (docheck)
    {
        if (i_ex(obj_quizsequence))
        {
            vcontimer = 0;
            vcon = 200;
        }
    }
}
if (vcon == 200)
{
    if (!i_ex(obj_quizsequence))
    {
        vcontimer++;
        if (vcontimer == 8)
        {
            with (obj_actor_tenna)
                bounce = 1;
            var tetalk = stringsetloc("Solve the Quiz, get a Q!!!", "obj_b1quiz_slash_Step_0_gml_191_0");
            scr_couchtalk(tetalk, "tenna", 2, 90);
            vcontimer = 0;
            vcon++;
        }
    }
}
if (vcon >= 201 && vcontimer > 15 && !active)
{
    vcon = -1;
    suwalktimer = 0;
}
