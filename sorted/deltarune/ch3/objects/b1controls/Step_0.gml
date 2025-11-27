if (su == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "susie")
            other.su = id;
    }
}
scr_board_populatevars();
if (init == 0)
{
    if (i_ex(obj_board_tree_static))
    {
        var image_ind = obj_board_tree_static.image_index;
        tree[0] = instance_create(x + 192, y + 64, obj_board_tree_static);
        tree[1] = instance_create(x + 192, y + 96, obj_board_tree_static);
        tree[0].image_index = image_ind;
        tree[1].image_index = image_ind;
        key = instance_create(1184, 512, obj_board_pickup);
        with (key)
            setxy_board(x, y);
        init = 1;
    }
}
if (init == 1)
{
    if (!i_ex(key) && global.interact == 0 && !bw_ex())
    {
        for (var i = 0; i < array_length(tree); i++)
        {
            with (tree[i])
            {
                instance_create(x, y, obj_board_smokepuff);
                instance_destroy();
            }
            snd_play(snd_board_splash);
        }
        scr_board_gridreset();
        with (obj_board_grabbleObject)
            cangrab = true;
        potsaresafe = true;
        with (su)
            scr_delay_var("graballpots", true, 15);
        init = 2;
    }
}
if (kris_real == 0)
    kris_real = 1185;
if (susie_real == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            other.susie_real = id;
    }
}
if (ralsei_real == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "ralsei")
            other.ralsei_real = id;
    }
}
if (tenna == 0)
{
    with (obj_actor_tenna)
        other.tenna = id;
}
if (active == 1)
{
    if (obj_board_camera.con == 0)
        timer++;
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 1)
        {
            scr_pathfind_end("ralsei");
            scr_pathfind_end("susie");
            with (obj_mainchara_board)
            {
                if (name == "ralsei")
                    follow = true;
            }
        }
        if (suwalktimer == 8)
        {
            visit++;
            su.sleepy = true;
            su.graballpots = false;
            var config = -2;
            var canlift = global.flag[1020];
            var quizdone = obj_board_event_sphinx_tenna.solved;
            var blockslifted = !i_ex(tree[0]);
            if (su.x < 364)
                config = 0;
            else
                config = 1;
            var potsfound = 0;
            with (obj_board_grabbleObject)
            {
                if (other.potsaresafe == false)
                {
                    if (config == 0)
                    {
                        if (x > 364)
                            cangrab = false;
                    }
                    if (config == 1)
                    {
                        if (x < 364)
                            cangrab = false;
                    }
                }
                if (scr_board_onscreen() && cangrab)
                    potsfound++;
            }
            grabset = true;
            if (potsfound && canlift)
                su.graballpots = true;
            if (su.y == 64)
            {
                if (visit == 1)
                {
                    scr_play_recording("susie", "0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0D0D0D0D0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0LD0LD0D0D0D0D0D0D0D0D0W0W0W0W0W0U0U0U0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0RD0RD0RD0D0D0D0D0D0D0D0D0D0D0D0LD0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0R0R0R0R0R0R0RD0RD0D0D0D0D0D0D0D0D0D0LD0LD0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0D0D0D0D0D0D0D0D0D0D0D0LD0LD0L0L0L0L0L0L0L0U0U0U0U0U0U0U0U0W0W0W0W0W0W0W0W0W0W0W0W0W0D0D0D0D0D0D0D0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R");
                }
                else
                {
                    var suwalk1 = "0W0W0W0W0W0W0W0D0D0D0D0D0D0D0D0D0D0LD0LD0LD0LD0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0LD0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0RD0RD0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W";
                    var suwalk2 = "0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0LD0LD0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0LD0LD0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0R0R0R0R0R0R0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W";
                    scr_play_recording("susie", choose(suwalk1, suwalk2));
                }
            }
            if (su.y == 288)
            {
                var suwalk1 = "0W0W0W00W0W0W0L0L0L0L0L0L0L0L0U0U0U0U0U0U0U0U0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0U0W0W0W00W0W0W00W0W0W00W0W0W0W0W0W0W0W0R0R0R0R0R0R0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0W0W0W0W0W0R0R0R0R0R0R0W0W0W0W0D0D0D0D0D0D0D0D0D0D0D0W0W0W0W00W0W0W00W0W0W00W0W0W0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0W0W0W0W0W0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0W0W0W0W0W0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0R0R0R0R0W0W0W0W0W0W0W0W0W";
                scr_play_recording("susie", suwalk1);
            }
            if (su.x == 128)
            {
                var su_east3 = "0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0W0R0R0R0R0R0R0R0R0R0R0W0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0W0W0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W";
                var su_east1 = "0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0D0D0D0D0D0D0RD0RD0RD0RD0RD0RD0RD0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0RD0RD0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W";
                var su_east2 = "0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0RU0RU0RU0RU0RU0RU0R0R0R0RU0U0U0U0U0U0U0U0U0U0U0U0U0U0U0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W";
                scr_play_recording("susie", choose(su_east1, su_east2, su_east3));
            }
        }
    }
    if (suwalk == 480)
    {
        scr_pathfind_to_point("susie", choose(8, 9, 10), choose(1, 2, 3), 0);
        suwalk++;
    }
    if (suwalk == 490)
    {
        var dopots = false;
        with (obj_board_grabbleObject)
        {
            if (x >= 320 && x < 512 && y >= 64 && y <= 320)
                dopots++;
        }
        if (!dopots && !i_ex(obj_board_grabobject))
        {
            su.graballpots = false;
            suwalk = 480;
        }
    }
    if (talkcon == 0 && obj_board_camera.con == 0 && visit == 1)
    {
        if (global.interact == 0)
            talktimer++;
        if (talktimer == 190)
        {
            var sutalk = stringsetloc("Dude, I can't kill the pots.", "obj_b1controls_slash_Step_0_gml_174_0");
            scr_couchtalk(sutalk, "susie", 2, 90);
            talkcon = 1;
        }
    }
    if (visit > 1)
        talkcon = 1;
}
else
{
    if (grabset == true)
    {
        grabset = false;
        with (obj_board_grabbleObject)
            cangrab = true;
    }
    if (talkcon > 0)
        talkcon = -1;
    con = 0;
    timer = 0;
    suwalk = 0;
    suwalktimer = 0;
    talktimer = 0;
    specialpots = false;
    sugetpotplz = 0;
}
if (active && obj_board_camera.con == 0)
{
    if (nothrow == 1)
    {
        var trig = 0;
        with (obj_board_trigger)
        {
            if (extflag == "nothrow")
            {
                if (place_meeting(x, y, obj_mainchara_board))
                    trig = 1;
            }
        }
        if (trig)
        {
            var tetalk = stringsetloc("Your prize awaits beyond these pots! If only you had a special skill!", "obj_b1controls_slash_Step_0_gml_204_0");
            scr_couchtalk(tetalk, "tenna", 2, 90);
            tenna.bounce = 1;
            nothrow = 2;
        }
    }
}
