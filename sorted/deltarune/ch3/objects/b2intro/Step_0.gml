scr_board_populatevars();
scr_gameshow_populatevars();
if (debuginit == 0)
{
    debuginit = 1;
    if (scr_debug())
    {
        switch (global.tempflag[89])
        {
            case 1:
                active = false;
                debug_print("reunite elnina");
                scr_board_instawarp(1664, 2624, 1840, 2848);
                obj_board_inventory.ninfriendo = 1;
                scr_play_recording("kris", "0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U");
                break;
            case 2:
                active = false;
                debug_print("reunite lanino");
                scr_board_instawarp(1664, 2624, 1840, 2848);
                obj_board_inventory.ninfriendo = 1;
                scr_play_recording("kris", "0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U");
                break;
            case 3:
                scr_board_instawarp(2432, 3392, 2496, 3584);
                obj_board_inventory.camera = 1;
                with (obj_mainchara_board)
                {
                    if (name == "kris")
                        camera = true;
                }
                debug_print("tenna leaves");
                scr_play_recording("kris", "0R0R0R0R0R0R0R0R0R0R0R0R0R0R0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0LU0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0LU0U0U0U0U0U0U0U0U");
                break;
            case 4:
                debug_message("Shuttah Battle");
                scr_board_instawarp(2432, 1600, 2464, 1664);
                with (obj_mainchara_board)
                {
                    if (name == "kris")
                        camera = true;
                }
                obj_board_inventory.ninfriendo = 1;
                scr_play_recording("kris", "0W0W0W0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0RD0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W010W0W0W0W0W0W0W0W0W0W0W0W0D0D0D0D0W0W0W0W0W0W0W0W0W0W0W0W0W0W0L0L0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W010W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W010W0W0W0W0W0W0W0W0W0W0W0W");
                break;
        }
        global.tempflag[89] = 0;
    }
}
if (active == 1)
{
    if (kris.boat == true)
    {
        suwalk = 1;
        boated = true;
    }
    if (boated == true && kris.boat == false && susie.canfreemove == true)
    {
        ralsei.follow = true;
        scr_board_caterpillar_interpolate_ralsei();
        scr_pathfind_to_point("susie", 4, 4, 0);
        boated = false;
    }
    if (obj_board_camera.con == 0 && makeboat == 1)
    {
        var startsnd = 492;
        var endsnd = 493;
        with (obj_mainchara_board)
            canfreemove = false;
        boat = instance_create(room_width, room_height, obj_board_boat);
        with (boat)
            setxy_board(1856, 3296);
        boat.visible = false;
        star1 = instance_create(320, 192, obj_board_startransition);
        star1.image_index = -3;
        star1.targx = boat.x;
        star1.targy = boat.y;
        star1.randim = 3;
        snd_stop(startsnd);
        snd_play(startsnd);
        with (boat)
            scr_delay_var("visible", true, other.star1.transitiontime);
        snd_play_delay(endsnd, star1.transitiontime);
        makeboat = -1;
        scr_delay_var("makeboat", 2, star1.transitiontime);
    }
    if (makeboat == 2)
    {
        makeboat = 3;
        with (obj_mainchara_board)
            canfreemove = true;
    }
    if (con == 0 && !init)
    {
        scr_resetgameshowcharacter("all");
        if (global.plot < 130)
            global.plot = 130;
        global.interact = 0;
        kris.visible = 0;
        susie.visible = 0;
        ralsei.visible = 0;
        kris.canfreemove = 0;
        ralsei.follow = 0;
        ralsei.x = kris.x - 32;
        susie.x = kris.x + 32;
        init = 1;
    }
    if (con == 0 && obj_board_camera.con == 0 && !i_ex(obj_board_transition))
    {
        con = 1;
        suwalk = 1;
    }
    if (con == 1)
    {
        var startsnd = 492;
        var endsnd = 493;
        var timespread = 15;
        timer++;
        if (timer == (1 + (timespread * 0)))
        {
            star1 = instance_create(320, 192, obj_board_startransition);
            star1.image_index = 0;
            star1.targx = kris.x;
            star1.targy = kris.y;
            with (kris)
                scr_delay_var("visible", true, other.star1.transitiontime);
            snd_play_delay(endsnd, star1.transitiontime);
            snd_stop(startsnd);
            snd_play(startsnd);
        }
        if (timer == (1 + (timespread * 1)))
        {
            star1 = instance_create(320, 192, obj_board_startransition);
            star1.image_index = 1;
            star1.targx = susie.x;
            star1.targy = susie.y;
            snd_stop(startsnd);
            snd_play(startsnd);
            with (susie)
                scr_delay_var("visible", true, other.star1.transitiontime);
            snd_play_delay(endsnd, star1.transitiontime);
            firstvisitcon = -1;
        }
        if (timer == (1 + (timespread * 2)))
        {
            snd_free_all();
            star1 = instance_create(320, 192, obj_board_startransition);
            star1.image_index = 2;
            star1.targx = ralsei.x;
            star1.targy = ralsei.y;
            snd_stop(startsnd);
            snd_play(startsnd);
            with (ralsei)
                scr_delay_var("visible", true, other.star1.transitiontime);
            snd_play_delay(endsnd, star1.transitiontime);
            timer = 0;
            con = 2;
        }
    }
    if (con == 2 && !i_ex(obj_board_startransition))
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
        ralsei.follow = true;
        mus_initloop(obj_ch3_gameshow.boardmusic);
        with (obj_actor_tenna)
            bounce = 1;
        var tetalk = stringsetloc("Welcome to KODAKODA ISLAND!", "obj_b2intro_slash_Step_0_gml_157_0");
        scr_couchtalk(tetalk, "tenna", 2, 90);
        con = 3;
    }
    if (con == 3)
    {
        if (introtalk == 0)
        {
            introtalktimer++;
            if (introtalktimer == 90)
            {
                suwalk = 0;
                var sutalk = stringsetloc("Alright Ralsei, turn into a surfboard.", "obj_b2intro_slash_Step_0_gml_170_0");
                scr_couchtalk(sutalk, "susie", 2, 90);
            }
            if (introtalktimer == 180)
            {
                var ratalk = stringsetloc("I can only be a block...", "obj_b2intro_slash_Step_0_gml_176_0");
                scr_couchtalk(ratalk, "ralsei", 2, 90);
            }
        }
    }
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = true;
        if (suwalktimer == 10)
        {
            suwalk = 1;
            susie.sleepy = true;
            ralsei.follow = 1;
            var randwalk = choose(0, 1);
            switch (randwalk)
            {
                case 0:
                    scr_pathfind_to_point("susie", 3, choose(4, 5, 6), 0);
                    break;
                case 1:
                    scr_pathfind_to_point("susie", choose(8, 9), choose(4, 5, 6), 0);
                    break;
            }
        }
    }
}
else
{
    suwalk = 0;
    suwalktimer = 0;
    timer = 0;
    introtalktimer = 99999;
    introtalk = 99;
}
