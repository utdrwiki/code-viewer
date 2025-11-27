scr_board_populatevars();
if (tennanpc == 0)
{
    with (obj_board_npc)
    {
        if (extflag == "intro")
            other.tennanpc = id;
    }
}
if (realsusie == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            other.realsusie = id;
    }
}
if (realralsei == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "ralsei")
            other.realralsei = id;
    }
}
if (debuginit == 0)
{
    debuginit = 1;
    if (scr_debug())
    {
        switch (global.tempflag[89])
        {
            case 1:
                with (obj_board_transition)
                    instance_destroy();
                active = false;
                debug_print("Push2 Sequence");
                scr_board_instawarp(1280, 1088, 1456, 1088);
                global.currentsong[0] = snd_init("board_zelda.ogg");
                global.currentsong[1] = mus_loop(global.currentsong[0]);
                break;
        }
        global.tempflag[89] = 0;
    }
}
if (active == 1)
{
    if (firstvisitcon == 0)
    {
        global.interact = 0;
        kris.visible = false;
        kris.sword = false;
        susie.visible = false;
        ralsei.visible = false;
        ralsei.follow = false;
        kris.x += 16;
        susie.x += 16;
        ralsei.x += 16;
        with (obj_mainchara_board)
            canfreemove = false;
        firstvisitcon++;
    }
    var startsnd = 492;
    var endsnd = 493;
    var timespread = 15;
    if (firstvisitcon == 1 && !i_ex(obj_board_transition))
    {
        star1 = instance_create(320, 192, obj_board_startransition);
        star1.image_index = 0;
        star1.targx = kris.x;
        star1.targy = kris.y;
        scr_delay_var("firstvisitcon", firstvisitcon + 1, timespread);
        with (kris)
            scr_delay_var("visible", true, other.star1.transitiontime);
        snd_play_delay(endsnd, star1.transitiontime);
        snd_stop(startsnd);
        snd_play(startsnd);
        firstvisitcon = -1;
    }
    if (firstvisitcon == 2)
    {
        star1 = instance_create(320, 192, obj_board_startransition);
        star1.image_index = 1;
        star1.targx = susie.x;
        star1.targy = susie.y;
        snd_stop(startsnd);
        snd_play(startsnd);
        scr_delay_var("firstvisitcon", firstvisitcon + 1, timespread);
        with (susie)
            scr_delay_var("visible", true, other.star1.transitiontime);
        snd_play_delay(endsnd, star1.transitiontime);
        firstvisitcon = -1;
    }
    if (firstvisitcon == 3)
    {
        snd_free_all();
        global.currentsong[0] = snd_init("board_zelda.ogg");
        global.currentsong[1] = mus_loop(global.currentsong[0]);
        star1 = instance_create(320, 192, obj_board_startransition);
        star1.image_index = 2;
        star1.targx = ralsei.x;
        star1.targy = ralsei.y;
        snd_stop(startsnd);
        snd_play(startsnd);
        with (ralsei)
            scr_delay_var("visible", true, other.star1.transitiontime);
        snd_play_delay(endsnd, star1.transitiontime);
        firstvisitcon = 4;
    }
    if (firstvisitcon == 4 && !i_ex(obj_board_startransition))
    {
        ralsei.follow = true;
        scr_board_caterpillar_interpolate_ralsei();
        with (ralsei)
        {
            for (i = 0; i < 10; i += 1)
                facingdir[i] = 1;
            facingdir[10] = 0;
        }
        with (obj_mainchara_board)
            canfreemove = true;
        with (obj_mainchara_board)
        {
            if (name == "susie")
                sleepy = true;
        }
        scr_play_susie_recording("0W0W0W0W0W0W0W0D0D0D0D0D0D0D0D0D0D0D0D0D0LD0LD0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0W0W0W0W0W0W0W0W0W0W0U0U0U0U0U0U0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0D0D0D0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0U0U0U0U0U0U0U0U0U0U0U0U0W0W0W0W0W0W0W0W0W0W0W0W0D0D0D0D0D0D0D0D0D0D0D0D0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0RU0RU0RU0RU0RU0U0U0U0U0U0LU0LU0L0L0W0W0W0W0W0D0D0D0D0D0D0D0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W");
        with (obj_actor_tenna)
            bounce = 1;
        var tetalk = stringsetloc("Welcome to DESERT! \"Talk\" to me for hints!", "obj_b1intro_slash_Step_0_gml_113_0");
        scr_couchtalk(tetalk, "tenna", 2, 110);
        firstvisitcon = 100;
    }
    if (firstvisitcon == 100)
    {
        if (i_ex(tennanpc))
        {
            if (tennanpc.read > 0 && !bw_ex())
            {
                firstvisitcon = 101;
                scr_delay_var("firstvisitcon", 102, 15);
            }
        }
    }
    if (firstvisitcon == 102 && (ralseitoot == 0 || ralseitoot == 200))
    {
        var sutalk = stringsetloc("Where's the \"shut up\" button?", "obj_b1intro_slash_Step_0_gml_131_0");
        scr_couchtalk(sutalk, "susie", 2, 90);
        scr_delay_var("firstvisitcon", 104, 60);
        realsusie.sprite_index = spr_susie_walk_right_dw_unhappy;
        with (realsusie)
            scr_delay_var("sprite_index", 406, 55);
        firstvisitcon++;
    }
    if (firstvisitcon == 104)
    {
        with (obj_actor_tenna)
            bounce = 1;
        var tetalk = stringsetloc("Sorry kid, that's premium!", "obj_b1intro_slash_Step_0_gml_141_0");
        scr_couchtalk(tetalk, "tenna", 2, 90);
        firstvisitcon++;
    }
    if (i_ex(obj_couchwriter))
        bubblebuff = 30;
    else
        bubblebuff--;
    if (con == 0 && obj_board_camera.con == 0 && firstvisitcon >= 100)
    {
        ralsei.follow = true;
        timer++;
        if (timer == 3)
        {
            susie.sleepy = 1;
            con = 1;
            timesvisited++;
            timer = 0;
        }
    }
    if (con == 1)
    {
        with (obj_mainchara_board)
        {
            if (name == "susie")
                sleepy = true;
        }
        if (susie.x == 320)
        {
            scr_play_susie_recording("0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0D0D0D0D0D0D0D0D0D0D0D0D0D0LD0LD0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0W0W0W0W0W0W0W0W0W0W0U0U0U0U0U0U0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0D0D0D0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0U0U0U0U0U0U0U0U0U0U0U0U0W0W0W0W0W0W0W0W0W0W0W0W0D0D0D0D0D0D0D0D0D0D0D0D0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0RU0RU0RU0RU0RU0U0U0U0U0U0LU0LU0L0L0W0W0W0W0W0D0D0D0D0D0D0D0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W");
            con++;
        }
        else if (susie.y == 288)
        {
            scr_pathfind_to_point("susie", 304, susie.y);
            con = 10;
        }
        else if (susie.x == 432)
        {
            scr_play_susie_recording("0W0W0W0W0W0W0W0W0W0W0W0W0W0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0LD0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0U0U0U0U0U0U0U0U0RU0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0RD0RD0RD0D0D0D0D0D0LD0LD0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W");
            con = -999;
        }
        else
        {
            con = -999;
        }
    }
    if (con == 10)
    {
        with (obj_mainchara_board)
        {
            if (name == "susie")
                sleepy = true;
        }
        if (susie.x == 304)
        {
            var wander1 = "0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0U0U0U0U0U0U0U0U0U0U0U0U0U0LU0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0U0U0U0U0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0D0D0D0D0D0D0W0W0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0LU0LU0LU0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0W0L0L0L0W0W0W0W0W0W0W0W0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0W0W0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0D0D0W0W0W0W0W0W0W0W0W0W0W0W0W0D0D0D0D0D0D0D0D0D0D0LD0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0D0D0D0D0D0D0D0W0W0W0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0R0R0R0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W";
            var wander2 = "0W0W0W0W0W0W0U0U0U0U0U0U0U0U0U0U0U0U0U0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0L0L0L0L0L0LU0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0RU0R0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0D0D0D0D0D0D0D0D0D0D0RD0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0RD0RD0D0D0D0D0D0D0D0D0D0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W";
            var wander3 = "0W0W0W0W0W0W0W0W0W0U0U0U0U0LU0LU0LU0LU0U0LU0LU0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0RU0RU0RU0RU0RU0RU0U0U0U0U0U0U0U0U0U0LU0LU0LU0L0L0L0L0L0L0L0LU0LU0U0U0U0U0U0U0U0RU0R0R0R0R0R0R0R0W0W0L0L0L0L0L0L0L0L0L0W0W0W0W0W0R0R0R0R0R0R0R0R0R0W0L0L0L0L0L0L0L0L0L0W0W0W0U0DU0DU0DU0DU0W0D0D0D0D0D0D0D0D0D0D0D0D0D0D0RD0RD0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0RD0RD0D0D0D0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0LU0LU0U0U0U0RU0R0R0R0R0R0R0R0R0R0R0R0R0R0R0RD0RD0RD0D0D0D0LD0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0LU0LU0U0U0U0RU0R0R0R0R0R0R0R0R0R0R0R0RD0RD0RD0D0LD0LD0LD0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0LD0LD0D0D0D0D0D0R0R0R0R0R0R0R0R0R0R0R0R0R0R0W0W0W0W0W0W0W0W0W0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W";
            scr_pathfind_end("susie");
            scr_play_susie_recording(choose(wander1, wander2, wander3));
            con++;
        }
    }
}
else
{
    con = 0;
    if (firstvisitcon > 1 && firstvisitcon < 100)
        firstvisitcon = 100;
    if (firstvisitcon > 100)
        firstvisitcon = 110;
    if (ralseitoot != 0)
        ralseitoot = 200;
}
