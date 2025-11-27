scr_board_populatevars();
scr_gameshow_populatevars();
if (active)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        with (obj_board_trigger)
        {
            if (extflag == "tennaleave1")
            {
                var ____kris = instance_place(x, y, obj_mainchara_board);
                if (i_ex(____kris) && ____kris.name == "kris")
                {
                    other.con = 1;
                    global.flag[1022] = 1;
                    global.flag[1024] = 1;
                }
            }
        }
    }
    if (con == 2 && obj_board_camera.con == 0)
    {
        if (kris.x > 356)
        {
            kris.controlled = 0;
            susie.controlled = 1;
            ralsei.follow = 1;
            con = 3;
        }
    }
    if (con == 3)
    {
        timer++;
        if (timer == 1)
            ralsei.follow = true;
        if (timer == 30)
            scr_pathfind_to_point("kris", 7, 6);
        if (timer == 55)
        {
            scr_pathfind_to_point("ralsei", 7, 6);
            con = 4;
        }
    }
    if (con == 5)
    {
        kris.controlled = 0;
        susie.controlled = 1;
        ralsei.follow = 0;
        timer = 0;
        con = 6;
    }
    if (con == 6)
    {
        timer++;
        if (timer == 5)
        {
            scr_pathfind_to_point("kris", 11, 3, 1);
            scr_resetgameshowcharacter("ralsei", 10);
            ra_real.sprite_index = spr_ralsei_walk_left_sad;
            global.flag[1024] = 0;
            var ratalk = stringsetloc("... Wait a second... Your controllers are...", "obj_b2tennaleave1_slash_Step_0_gml_77_0");
            scr_couchtalk(ratalk, "ralsei", 2, 90);
            con = 7;
            timer = 0;
        }
    }
    if (con == 7)
    {
        if (scr_board_checklocation("kris", board_tilex(11), board_tiley(3), 10))
        {
            timer++;
            if (timer == 6)
            {
                with (obj_mainchara_board)
                    controlled = 0;
                kris.controlled = 1;
                global.interact = 1;
                obj_board_camera.shift = "right";
            }
        }
    }
    if (con != 72)
    {
        if (suwalk == 0 && obj_board_camera.con == 0 && susie.controlled == false)
        {
            suwalktimer++;
            if (suwalktimer == 15)
            {
                susie.sleepy = true;
                if (susie.x < 300)
                {
                    if (susie.y > 140)
                        scr_pathfind_to_point("susie", 1, 1, 2);
                    else
                        scr_pathfind_to_point("susie", 4, 1, 3);
                }
            }
        }
    }
    if (con == 72)
    {
        if (suwalk == 0 && obj_board_camera.con == 0)
        {
            suwalktimer++;
            if (suwalktimer == 1)
                ralsei.follow = true;
            if (suwalktimer == 16)
            {
                if (scr_board_checklocation("susie", board_tilex(0), board_tiley(3.5), 80))
                {
                    debug_print("left");
                    var pos = choose([4, 1], [4, 2], [5, 5], [5, 6], [1, 6]);
                    scr_pathfind_to_point("susie", pos[0], pos[1], 0);
                }
                if (scr_board_checklocation("susie", board_tilex(1), board_tiley(0), 80))
                {
                    debug_print("top left");
                    var pos = choose([4, 1], [4, 2], [5, 5], [5, 6], [1, 6]);
                    scr_pathfind_to_point("susie", pos[0], pos[1], 0);
                }
                if (scr_board_checklocation("susie", board_tilex(10), board_tiley(0), 80))
                {
                    debug_print("top right");
                    var pos = choose([6, 1], [7, 1], [6, 3], [7, 3], [6, 2]);
                    scr_pathfind_to_point("susie", pos[0], pos[1], 0);
                }
                if (scr_board_checklocation("susie", board_tilex(11), board_tiley(3.5), 80))
                {
                    debug_print("right");
                    var pos = choose([10, 6], [10, 5], [9, 6], [8, 5], [8, 4]);
                    scr_pathfind_to_point("susie", pos[0], pos[1], 0);
                }
                if (scr_board_checklocation("susie", board_tilex(8), board_tiley(6), 80))
                {
                    debug_print("warpdoor");
                    var pos = choose([8, 4], [8, 5], [9, 5], [9, 6], [10, 5], [10, 6]);
                    scr_pathfind_to_point("susie", pos[0], pos[1], 0);
                }
                susie.sleepy = true;
            }
        }
    }
}
else
{
    suwalk = 0;
    suwalktimer = 0;
    if (global.flag[1190] == 1)
    {
        suwalktimer = 0;
        suwalk = 0;
        con = 72;
    }
}
if (con == 1)
{
    timer++;
    if (timer == 1)
    {
        tenna.communication = 1;
        with (obj_b2bridgeintro)
            dodelete = true;
    }
    if (timer == 30)
    {
        tenna.bounce = true;
        var tetalk = stringsetloc("Huh? My antennas are...", "obj_b2tennaleave1_slash_Step_0_gml_204_0");
        scr_couchtalk(tetalk, "tenna", 2, 80, tenna.x, 256);
    }
    if (timer == 110)
    {
        tenna.bounce = true;
        scr_shakeobj(tenna);
        var tetalk = stringsetloc("Sorry, be right back, kids!", "obj_b2tennaleave1_slash_Step_0_gml_215_0");
        bubbletrack = scr_couchtalk(tetalk, "tenna", 2, 80, tenna.x, 256);
    }
    var tetime = 30;
    if (timer == 150)
    {
        tenna.communication = 0;
        with (tenna)
            scr_lerpvar("x", x, x + 300, tetime, -1, "in");
        with (bubbletrack)
            scr_lerpvar("x", x, x + 300, tetime, -1, "in");
        snd_play_delay(snd_slidewhistle, 4);
    }
    if (timer == (190 + tetime))
    {
        timer = 0;
        con = 2;
        global.flag[1024] = 0;
    }
}
if (beeper)
{
    var beeperpause = 10;
    beepertime++;
    if (beepertime == 1 || beepertime == (1 + beeperpause))
        beep = snd_play_x(snd_phone, 1, 1.3);
    if (beepertime == 3 || beepertime == (3 + beeperpause))
        snd_stop(beep);
    if (beepertime == 5 || beepertime == (5 + beeperpause))
        beep = snd_play_x(snd_phone, 1, 1.6);
    if (beepertime == 7 || beepertime == (7 + beeperpause))
        snd_stop(beep);
    if (beepertime > (7 + beeperpause))
    {
        beepertime = 0;
        beeper = 0;
    }
}
if (active)
{
    if (con == 8)
    {
        if (suwalk == 0 && obj_board_camera.con == 0)
        {
            suwalktimer++;
            if (suwalktimer == 1)
                ralsei.follow = true;
            if (suwalktimer == 8)
            {
                if (susie.x > 300)
                {
                    var pl = choose(0);
                    if (pl == 0)
                        scr_pathfind_to_point("susie", choose(8, 9, 10), choose(5, 6), 0);
                }
            }
        }
    }
}
if (con == 4 && !active && obj_board_camera.con == 0)
    con = 5;
if (!active)
{
    if (con == 7)
        con = 8;
    suwalk = 0;
    suwalktimer = 0;
}
