scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        var krcont = 0;
        if (global.flag[1190] == 1 || obj_b2bombfun.visited == 1)
            krcont = 1;
        if (krcont == 0)
        {
            with (obj_mainchara_board)
                controlled = false;
            susie.controlled = true;
            ralsei.follow = false;
            kris.camera = true;
            con = 1;
            timer = 0;
        }
        else if (obj_board_camera.con == 0)
        {
            suwalktimer++;
            if (susolve == 0)
            {
                if (suwalktimer == 15)
                {
                    with (obj_board_resettile)
                    {
                        if (puzzleid == 2)
                            pressed = 2;
                    }
                    scr_pathfind_to_point("susie", 8, 2, 2);
                }
                if (suwalktimer > 15)
                {
                    if (scr_board_checklocation("susie", 8, 2, 4))
                    {
                        kris.cantleave = true;
                        suwalktimer = 0;
                        con = 0.1;
                        timer = 0;
                        susolve = 1;
                    }
                }
            }
            else
            {
                suwalktimer++;
                if (suwalktimer == 16)
                {
                    var rand = choose(0, 1, 2);
                    rand = 0;
                    switch (rand)
                    {
                        case 0:
                            scr_pathfind_to_point("susie", choose(2, 3, 4), 2, 0);
                            break;
                        case 1:
                            scr_pathfind_to_point("susie", choose(8, 9, 10), 5, 0);
                            break;
                        case 2:
                            scr_pathfind_to_point("susie", choose(8, 9, 10), 1, 0);
                            break;
                    }
                    susie.sleepy = true;
                }
            }
        }
    }
    if (con == 0.1)
    {
        timer++;
        if (timer == 1)
        {
            var sutalk = stringsetloc("Can't believe I have to do this.", "obj_b2bridgepuzzle2_alt_slash_Step_0_gml_82_0");
            scr_couchtalk(sutalk, "susie", 2, 70);
            scr_play_recording("susie", "0W010W0W0W0W0W0W0W0W0W0D0D0D0D0D0D0L0L0L0W0W0W0W0W0W0W010W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0W0U0U0U0U0U0U0U0U010W0W0W0W0W0D0D0D0D0D0D0D0D0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0W0W0W010W0W");
        }
        if (timer > 1)
        {
            var trig = 0;
            with (obj_board_event_bridgepuzzle)
            {
                if (puzzleid == 2 && solved)
                    trig = 1;
            }
            if (trig == 1)
            {
                kris.cantleave = false;
                scr_board_gridreset();
                timer = 0;
                con = 0;
                suwalktimer = 0;
                susie.sleepy = true;
                var ratalk = stringsetloc("Nice solve, Susie!", "obj_b2bridgepuzzle2_alt_slash_Step_0_gml_100_0");
                scr_script_delayed(scr_couchtalk, 15, ratalk, "ralsei", 2, 70);
            }
        }
    }
    if (con == 1)
    {
        timer++;
        if (timer == 5)
            scr_pathfind_to_point("kris", 9, 4, 0);
        if (timer == 15)
            scr_pathfind_to_point("ralsei", 10, 4, 0);
        if (timer == 45)
        {
            su_real.sprite_index = spr_susie_walk_right_dw_unhappy;
            var sutalk = stringsetloc("Hey, why don't we just stay as these characters?", "obj_b2bridgepuzzle2_alt_slash_Step_0_gml_35_0");
            scr_couchtalk(sutalk, "susie", 2, 100);
        }
        if (timer == 140)
        {
            ra_real.sprite_index = spr_ralsei_walk_left_unhappy;
            su_real.sprite_index = spr_susie_walk_right_dw;
            var sutalk = stringsetloc("Until I find something cool I wanna throw.", "obj_b2bridgepuzzle2_alt_slash_Step_0_gml_40_0");
            scr_couchtalk(sutalk, "susie", 2, 90);
        }
        if (timer == 230)
        {
            ra_real.sprite_index = spr_ralsei_walk_left;
            scr_pathfind_end("ralsei");
            ralsei.susierecordcon = 0;
            ralsei.sleepy = true;
            var ratalk = stringsetloc("... if it's okay! Haha.", "obj_b2bridgepuzzle2_alt_slash_Step_0_gml_45_0");
            scr_couchtalk(ratalk, "ralsei", 2, 90);
        }
        if (timer == 320)
        {
            scr_resetgameshowcharacter("susie");
            scr_resetgameshowcharacter("ralsei");
            con++;
        }
    }
    if (con == 2)
    {
        var proceed = false;
        with (obj_board_event_bridgepuzzle)
        {
            if (puzzleid == 2 && solved)
                proceed = true;
        }
        if (proceed)
        {
            timer = 0;
            con = 3;
            scr_board_gridreset();
        }
    }
    if (con == 3)
    {
        timer++;
        if (timer == 15)
        {
            var ratalk = stringsetloc("Oh! Nice solve, Kris!", "obj_b2bridgepuzzle2_alt_slash_Step_0_gml_88_0");
            scr_couchtalk(ratalk, "ralsei", 2, 60);
            scr_pathfind_to_point("kris", 2, 6, 0);
            con = 4;
            timer = 0;
        }
    }
    if (con == 100 && obj_board_camera.con == 0)
    {
        if (suwalk == 0)
        {
            suwalktimer++;
            if (suwalktimer == 15)
            {
                suwalk = 1;
                scr_pathfind_to_point("susie", choose(2, 3, 4), choose(2, 3), 0);
            }
        }
    }
}
else
{
    if (con == 4)
        con = 100;
    if (con == 100 || global.flag[1190] == 1)
    {
        suwalk = 0;
        suwalktimer = 0;
    }
}
if (con == 99)
    con = 100;
