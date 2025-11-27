scr_board_populatevars();
scr_gameshow_populatevars();
if (pip1 == 0)
{
    with (obj_b2pippinsislandnpc)
    {
        if (num == 0)
            other.pip1 = id;
    }
}
if (pip2 == 0)
{
    with (obj_b2pippinsislandnpc)
    {
        if (num == 1)
            other.pip2 = id;
    }
}
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (boattalk == 0)
        {
            boattalk = 1;
            if (tennahere())
            {
                with (obj_actor_tenna)
                    bounce = 1;
                var tetalk = stringsetloc("... HEY, you two aren't supposed to be here!", "obj_b2pippinsisland_slash_Step_0_gml_26_0");
                scr_couchtalk(tetalk, "tenna", 2, 70);
            }
        }
        with (obj_b2pippinsislandnpc)
        {
            if (myinteract >= 3)
            {
                global.interact = 1;
                obj_b2pippinsisland.con++;
            }
        }
    }
    if (con == 1)
    {
        if (tennahere())
        {
            scr_speaker("no_name");
            msgsetloc(0, "HEY^1, KRIS^1, WANT TO PLAY MONEY MAKING GAME?/%", "obj_b2pippinsisland_slash_Step_0_gml_35_0");
            b = bw_make();
            con = 2;
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "HEY KRIS^1, WANT TO PLAY MONEY --/", "obj_b2pippinsisland_slash_Step_0_gml_42_0");
            msgnextloc("WAIT^1, WHERE'S THE BOSS?/", "obj_b2pippinsisland_slash_Step_0_gml_43_0");
            msgnextloc("TIME TO TAKE AN UNSANCTIONED BREAK!/%", "obj_b2pippinsisland_slash_Step_0_gml_44_0");
            bw_make();
            con = 40;
        }
    }
    if (con == 2)
    {
        var _trig = 0;
        with (obj_board_writer)
        {
            with (writer)
            {
                if (reachedend)
                    _trig = 1;
            }
        }
        if (!instance_exists(obj_writer))
        {
            failsafe++;
            if (failsafe >= 15)
                _trig = 1;
        }
        if (_trig)
        {
            with (obj_actor_tenna)
                bounce = 1;
            var tetalk = stringsetloc("What the ---", "obj_b2pippinsisland_slash_Step_0_gml_56_0");
            scr_couchtalk(tetalk, "tenna", 2, 9999);
            con = 3;
            buff = 3;
        }
    }
    if (con == 3)
    {
        buff--;
        if (buff <= 0)
        {
            if (!bw_ex() || button1_p() || button3_h())
            {
                with (obj_board_writer)
                    instance_destroy();
                with (obj_couchwriter)
                    instance_destroy();
                with (obj_actor_tenna)
                    bounce = 1;
                var tetalk = stringsetloc("Who said you could do that on the job!?", "obj_b2pippinsisland_slash_Step_0_gml_75_0");
                scr_couchtalk(tetalk, "tenna", 2, 120);
                con = 4;
                buff = 3;
            }
        }
    }
    if (con == 4)
    {
        buff--;
        if (buff <= 0)
        {
            if (!i_ex(obj_couchwriter) || button1_p() || button3_h())
            {
                with (obj_couchwriter)
                    instance_destroy();
                scr_speaker("no_name");
                msgsetloc(0, "UH OH^1, GIG'S UP!/%", "obj_b2pippinsisland_slash_Step_0_gml_93_0");
                bw_make();
                con = 5;
            }
        }
    }
    if (con == 5 && !bw_ex())
    {
        timer++;
        if (timer == 5)
        {
            snd_play_x(snd_jump, 0.5, 1.3);
            snd_play_x(snd_jump, 0.5, 1.1);
            with (pip1)
                scr_jump_to_point(x - 32, y, 8, 15);
            with (pip2)
                scr_jump_to_point(x + 32, y, 8, 15);
        }
        if (timer == 20)
        {
            safe_delete(pip1);
            safe_delete(pip2);
            snd_play(snd_board_splash);
        }
        if (timer == 25)
        {
            kris.facing = 0;
            global.interact = 0;
            con++;
        }
    }
    if (con == 40 && bw_ex())
    {
        con = 5;
        timer = 0;
    }
    if (con == 99 && !bw_ex())
        global.interact = 0;
    if (kris.boat == true && boated == false)
        boated = true;
    if (kris.boat == false && boated == true)
    {
        boated = false;
        suwalktimer = 0;
        suwalk = 0;
    }
    if (suwalk == 0 && obj_board_camera.con == 0 && kris.boat == false)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = true;
        if (suwalktimer == 15)
        {
            scr_pathfind_to_point("susie", 6, 5, 0);
            susie.sleepy = true;
        }
    }
}
else
{
    suwalk = 0;
    suwalktimer = 0;
}
