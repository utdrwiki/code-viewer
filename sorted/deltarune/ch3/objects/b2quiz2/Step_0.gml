scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (made == 0)
    {
        var krisissusie = false;
        if (global.flag[1190] == 0)
            krisissusie = true;
        if (obj_b2bombfun.visited == 1)
            krisissusie = false;
        with (shellgrab)
            setxy(room_width, room_height);
        with (shellint)
            setxy(room_width, room_height);
        if (krisissusie)
        {
            with (shellgrab)
                setxy_board(3072, 2944);
        }
        else
        {
            with (shellint)
                setxy_board(3072, 2944);
        }
        made = 1;
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        var krcon = 0;
        if (global.flag[1190] == 1 || obj_b2bombfun.visited == 1)
            krcon = 1;
        if (krcon == 0)
        {
            kris.controlled = 0;
            susie.controlled = 1;
            ralsei.follow = 0;
            kris.camera = true;
            con = 1;
            timer = 0;
        }
        else
        {
            con = 5;
        }
    }
    if (con == 1)
    {
        timer++;
        if (timer == 1)
            scr_pathfind_to_point("kris", 7, 2, 2);
        if (timer == 18)
            scr_pathfind_to_point("ralsei", 2, 4, 0);
        if (timer == 15)
        {
            var ratalk = stringsetloc("I'm just used to following, haha.", "obj_b2quiz2_slash_Step_0_gml_27_0");
            scr_couchtalk(ratalk, "ralsei", 2, 90);
        }
        checkskip(15, 105);
        if (timer == 105)
        {
            var ratalk = stringsetloc("I'm not normally...", "obj_b2quiz2_slash_Step_0_gml_40_0");
            scr_couchtalk(ratalk, "ralsei", 2, 90);
        }
        if (timer == 175)
            kris.facing = 1;
        checkskip(105, 195);
        if (timer == 195)
        {
            var ratalk = stringsetloc("Supposed to be... a player one.", "obj_b2quiz2_slash_Step_0_gml_49_0");
            scr_couchtalk(ratalk, "ralsei", 2, 90);
        }
        checkskip(195, 285);
        if (timer == 285)
        {
            kris.susierecordcon = 0;
            scr_pathfind_to_point("kris", 0, 3);
            con++;
            timer = 0;
        }
    }
    if (con == 2)
    {
        if (scr_board_checklocation("kris", 0, 3, 4))
        {
            timer++;
            if (timer == 2)
            {
                scr_pathfind_end("kris");
                global.interact = 1;
                with (obj_mainchara_board)
                    controlled = 0;
                kris.controlled = 1;
                obj_board_camera.shift = "left";
                timer = 0;
                con++;
            }
        }
    }
    if (con == 5)
    {
        if (suwalk == 0 && obj_board_camera.con == 0)
        {
            suwalktimer++;
            if (suwalktimer == 1)
                ralsei.follow = true;
            if (suwalktimer == 14)
            {
                var rand = choose(0, 1);
                if (rand == 0)
                    scr_pathfind_to_point("susie", 7, 2, 2);
                if (rand == 1)
                    scr_pathfind_to_point("susie", choose(2, 3), 4, 0);
                suwalktimer = 0;
                suwalk = 1;
                susie.sleepy = true;
            }
        }
    }
}
else
{
    if (made == 1)
        made = 0;
    suwalk = 0;
    suwalktimer = 0;
    if (con == 3)
        con = 5;
}
