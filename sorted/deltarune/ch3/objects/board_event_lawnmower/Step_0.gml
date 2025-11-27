scr_board_populatevars();
if (tenna == 0)
{
    with (obj_actor_tenna)
        other.tenna = id;
}
if (susiereal == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            other.susiereal = id;
    }
}
if (ralseireal == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "ralsei")
            other.ralseireal = id;
    }
}
if (krisreal == 0)
{
    with (obj_mainchara)
        other.krisreal = id;
}
if (lawnmower == 0)
{
    with (obj_board_lawnmower)
        other.lawnmower = id;
}
if (active == 1 && obj_board_camera.con == 0)
{
    if (gamestart == 0 && global.flag[1022] == 0)
    {
        if (obj_board_lawnmower.movingtimer > 0)
        {
            kris.cantleave = true;
            mus_fade(global.currentsong[1], 10);
            var lawnmusic_snd = snd_init("ch3_south_of_the_border.ogg");
            lawnmusic = mus_loop(lawnmusic_snd);
            scr_lerpvar("scorey", scorey, 0, 10, 2, "out");
            gamestart = 1;
        }
    }
    if (tutcon == 0 && obj_board_camera.con == 0 && global.flag[1022] == 0)
    {
        tuttimer++;
        if (tuttimer == 1)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("The secret lawnmower game! Everybody's favorite!", "obj_board_event_lawnmower_slash_Step_0_gml_37_0");
            scr_couchtalk(tetalk, "tenna", 2, 80);
        }
        if (tuttimer == 80)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("Push the lawnmower and it will fly! The grass will grow as you mow!", "obj_board_event_lawnmower_slash_Step_0_gml_43_0");
            scr_couchtalk(tetalk, "tenna", 2, 80);
        }
        if (tuttimer == 160)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("Cut as much grass as you can before the timer runs out to get some points!!!", "obj_board_event_lawnmower_slash_Step_0_gml_49_0");
            scr_couchtalk(tetalk, "tenna", 2, 80);
        }
        if (tuttimer < 240 && gamestart == 1)
        {
            tutcon = 1;
            tenna.bounce = 1;
            var tetalk = stringsetloc("Sure, yeah. I was done. Go ahead.", "obj_board_event_lawnmower_slash_Step_0_gml_56_0");
            scr_couchtalk(tetalk, "tenna", 2, 60);
        }
        if (tuttimer == 240)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("When you're ready, push the lawn mower to start!", "obj_board_event_lawnmower_slash_Step_0_gml_62_0");
            scr_couchtalk(tetalk, "tenna", 2, 80);
            tutcon = 1;
        }
    }
    if (suwalk == 0)
    {
        suwalk = 1;
        ralsei.follow = false;
        scr_pathfind_to_point("susie", 4 - choose(0, 1, 2), 6, 2);
        scr_pathfind_to_point("ralsei", 7 + choose(0, 1), 6, 2);
    }
    if (gamestart == 1)
        timer++;
    else
        timer = -1;
    if (gamestart == 1)
    {
        gametimer--;
        if (gametimer == 30)
            mus_volume(lawnmusic, 0, 30);
        if (gametimer <= 0)
        {
            gametimer = 0;
            gamestart = -1;
            with (obj_board_lawnmower)
            {
                instance_create(x, y, obj_board_smokepuff);
                snd_play(snd_board_bomb);
                instance_destroy();
            }
            scr_delay_var("gamestart", 2, 30);
        }
    }
    if (gamestart == 2)
    {
        with (obj_board_weedmow)
        {
            var doomtime = irandom(15);
            scr_script_delayed(instance_create, doomtime, x, y, 283);
            scr_script_delayed(snd_stop, doomtime, 458);
            scr_script_delayed(snd_play, doomtime, snd_board_bomb);
            scr_doom(id, doomtime);
        }
        scr_delay_var("gamestart", 3, 16);
        gamestart = -1;
    }
    if (gamestart == 3)
    {
        snd_stop(lawnmusic);
        mus_volume(global.currentsong[1], 1, 30);
        with (obj_board_weedmow)
        {
            instance_create(x, y, obj_board_smokepuff);
            snd_stop(snd_board_bomb);
            snd_play(snd_board_bomb);
            instance_destroy();
        }
        scr_board_score(round(mowscore * 10));
        kris.cantleave = false;
        scr_lerpvar("scorey", 0, -22, 10, 2, "out");
        var amt = string(mowscore * 10);
        if (global.flag[1267] == 0)
            global.flag[1267] = 1;
        if ((mowscore * 10) > global.flag[1267])
            global.flag[1267] = mowscore * 10;
        var tetalk = stringsetsubloc("A score of ~1?! IMPRESSIVE!", amt, "obj_board_event_lawnmower_slash_Step_0_gml_130_0");
        scr_couchtalk(tetalk, "tenna", 2, 60);
        gamestart = -1;
        scr_delay_var("gamestart", 4, 30);
    }
    if (gamestart == 4)
    {
        kris.cantleave = false;
        gamestart = 5;
    }
    var weedcount = instance_number(obj_board_weedmow);
    if ((timer % 15) == 0 && weedcount < 32)
    {
        var weed = instance_create(x, y, obj_board_weedmow);
        with (weed)
        {
            var safe = 0;
            var failsafe = 0;
            while (safe == 0)
            {
                setxy(board_tilex(irandom_range(2, 9)), board_tiley(irandom_range(2, 5)));
                safe = 1;
                if (place_meeting(x, y, obj_board_lawnmower))
                    safe = 0;
                if (place_meeting(x, y, obj_board_solidenemy))
                    safe = 0;
                if (place_meeting(x, y, obj_board_weedmow))
                    safe = 0;
                with (obj_board_lawnmower)
                {
                    if (x == other.x)
                        safe = 0;
                }
                with (obj_board_lawnmower)
                {
                    if (y == other.y)
                        safe = 0;
                }
                failsafe++;
                if (failsafe > 10)
                {
                    safe = 1;
                    instance_destroy();
                }
            }
        }
    }
}
else
{
    suwalk = 0;
}
