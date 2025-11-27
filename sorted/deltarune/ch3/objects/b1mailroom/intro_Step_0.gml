scr_board_populatevars();
scr_gameshow_populatevars();
if (active)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        var roomdelay = 0;
        var adddelay = 30;
        timer++;
        var doanyways = false;
        checkskip(0, 15 + roomdelay);
        if (timer == (1 + roomdelay) || doanyways)
            ralsei.follow = false;
        if (timer == (8 + roomdelay) || doanyways)
        {
            scr_pathfind_to_point("susie", 5, 1.5, 2);
            with (obj_mainchara_board)
            {
                if (name == "susie")
                    sleepy = true;
            }
        }
        if (timer == (14 + roomdelay) || doanyways)
            scr_pathfind_to_point("ralsei", 6, 1.5, 2);
        if (timer == (15 + roomdelay))
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("10 years of fan mail are past this door!", "obj_b1mailroom_intro_slash_Step_0_gml_32_0");
            scr_couchtalk(tetalk, "tenna", 2, 91 + adddelay);
        }
        checkskip(15 + roomdelay + adddelay, 105 + roomdelay + adddelay);
        if (timer == (105 + roomdelay + adddelay))
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("Ready!? Mike, open up that door!!!", "obj_b1mailroom_intro_slash_Step_0_gml_38_0");
            scr_couchtalk(tetalk, "tenna", 2, 60);
        }
        checkskip(105 + roomdelay + adddelay, 135 + roomdelay + adddelay);
        if (timer == (135 + roomdelay + adddelay))
        {
            with (obj_board_maildoor)
                con = 1;
        }
        if (camwatch == 0)
        {
            if (obj_board_camera.con == 0)
                camwatch = 1;
        }
        if (camwatch == 1)
        {
            if (obj_board_camera.shift == "up")
            {
                global.flag[1115] = 3;
                con = 2;
                camwatch = 2;
                timer = 0;
            }
            if (obj_board_camera.shift == "warp")
            {
                global.flag[1115] = 2;
                obj_b1pushpyramid.abandoncon = 1;
                with (obj_b1pushpyramid)
                    safe_delete(maildoor);
                con = 99;
                camwatch = 3;
                timer = 0;
            }
        }
    }
    if (con == 2 && obj_board_camera.shift == "none")
        con = 3;
    if (con == 3 && obj_board_camera.con == 0)
    {
        timer++;
        if (timer == 1)
        {
            ralsei.follow = true;
            leavecon = 1;
        }
        if (timer == 15)
        {
            scr_play_recording("susie", "0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D");
            with (obj_mainchara_board)
            {
                if (name == "susie")
                    sleepy = true;
            }
        }
        if (obj_board_camera.shift == "warp")
        {
            con = 99;
            timer = 0;
            with (obj_b1pushpyramid)
                safe_delete(maildoor);
        }
    }
}
else
{
    timer = 0;
}
if (leavecon == 1)
{
    leavetimer++;
    if (leavetimer == 15)
    {
        global.flag[1024] = 1;
        var sutalk = stringsetloc("Damn dude. I never got fanmail either.", "obj_b1mailroom_intro_slash_Step_0_gml_96_0");
        scr_couchtalk(sutalk, "susie", 2, 90);
        with (su_real)
        {
            fun = 1;
            sprite_index = rsprite;
        }
    }
    if (leavetimer == 105)
    {
        var ratalk = stringsetloc("Huh? I'll write you some, Susie!", "obj_b1mailroom_intro_slash_Step_0_gml_99_0");
        scr_couchtalk(ratalk, "ralsei", 2, 90);
        with (ra_real)
        {
            fun = 1;
            sprite_index = lsprite;
        }
    }
    if (leavetimer == 195)
    {
        leavecon = 0;
        global.flag[1024] = 0;
        scr_resetgameshowcharacter("susie");
        scr_resetgameshowcharacter("ralsei");
    }
}
