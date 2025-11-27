scr_board_populatevars();
scr_gameshow_populatevars();
visible = true;
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        var withercheck = 0;
        var battlestart = 0;
        with (obj_board_oasis)
        {
            if (wither > 1)
                withercheck = 1;
        }
        if (withercheck == 1)
        {
            with (obj_mainchara_board)
            {
                if (controlled == 1)
                {
                    if (place_meeting(x, y, obj_board_trigger))
                    {
                        var trig = instance_place(x, y, obj_board_trigger);
                        if (trig.extflag == "oasisBattle")
                            battlestart = 1;
                    }
                }
            }
            if (force == 1)
            {
                battlestart = 1;
                force = 0;
            }
            if (battlestart == 1)
            {
                global.interact = 1;
                with (obj_mainchara_board)
                    canfreemove = false;
                con = 1;
            }
        }
    }
    if (con == 1 && !bw_ex())
    {
        global.interact = 1;
        timer++;
        if (timer == 1)
        {
            mus_volume(global.currentsong[1], 0, 15);
            snd_play(snd_b);
            with (obj_board_npc)
            {
                if (extflag == "elnina1")
                    sprite_index = spr_board_elnina_glasses_mad_left;
                if (extflag == "lanino1")
                    sprite_index = spr_board_lanino_glasses_mad_right;
                var checkme = id;
                with (obj_script_delayed)
                {
                    if (target == checkme)
                        instance_destroy();
                }
            }
            var excl = instance_create(board_tilex(3), board_tiley(3), obj_board_marker);
            excl.sprite_index = spr_board_exclaim;
            excl.image_speed = 0;
            excl.image_index = 0;
            excl.vspeed = -2.8;
            excl.gravity = 0.2;
            excl.depth = depth - 100;
            if (excl.y <= 64)
                excl.y = 64;
            scr_darksize(excl);
            scr_doom(excl, 20);
            with (excl)
                scr_delay_var("gravity", 0, 15);
            with (excl)
                scr_delay_var("vspeed", 0, 15);
            excl = instance_create(board_tilex(8), board_tiley(3), obj_board_marker);
            excl.sprite_index = spr_board_exclaim;
            excl.image_speed = 0;
            excl.image_index = 1;
            excl.vspeed = -2.8;
            excl.gravity = 0.2;
            excl.depth = depth - 100;
            if (excl.y <= 64)
                excl.y = 64;
            scr_darksize(excl);
            scr_doom(excl, 20);
            with (excl)
                scr_delay_var("gravity", 0, 15);
            with (excl)
                scr_delay_var("vspeed", 0, 15);
        }
        if (timer == 30)
        {
            global.firstboardbattle = 2;
            scr_speaker("no_name");
            if (plugged == 1)
                msgsetloc(0, "OH^1, OH^1, YOU CLOGGED THE OASIS./", "obj_board_event_ninfight_slash_Step_0_gml_103_0");
            else
                msgsetloc(0, "OH^1, OH^1, YOU SUCKED THE WATER DRY./", "obj_board_event_ninfight_slash_Step_0_gml_107_0");
            msgnextloc("YOU DARE END OUR SEASON OF LOVE?/", "obj_board_event_ninfight_slash_Step_0_gml_111_0");
            if (retry == 1)
                msgsetloc(0, "OH^1, OH^1, WE JUST MADE UP AND YOU DARE COME INTO OUR SIGHT!?/", "obj_board_event_ninfight_slash_Step_0_gml_115_0");
            msgnextloc("I PREDICT A LOT OF PAIN IN YOUR FUTURE.../%", "obj_board_event_ninfight_slash_Step_0_gml_118_0");
            bw_make();
            con = 2;
        }
    }
    if (con == 2 && !bw_ex())
    {
        global.flag[9] = 2;
        battler = instance_create(x, y, obj_gameshow_battlemanager);
        battler.encounterno = 113;
        con = 2.1;
        timer = 0;
    }
    if (con == 2.1)
    {
        if (battler.con == 2)
        {
            var obj_board_event_ninfight_doheal = true;
            if (obj_board_event_ninfight_doheal == true)
            {
                with (obj_mainchara_board)
                    myhealth = maxhealth;
                for (var i = 0; i < 4; i++)
                    global.hp[i] = global.maxhp[i];
            }
            con = 2.2;
        }
    }
    if (con == 2.2 && global.fighting)
        con = 2.5;
    if (con == 2.5 && !global.fighting)
    {
        debug_print("Fighting over?");
        snd_free(global.batmusic[0]);
        if (global.boardbattleresult == "won")
        {
            debug_print("battle won!");
            var elnina = 0;
            var lanino = 0;
            with (obj_board_npc)
            {
                if (extflag == "elnina1")
                    instance_destroy();
                if (extflag == "lanino1")
                    instance_destroy();
            }
            sunmoonstone = instance_create_board(1072, 720, obj_board_pickup);
            with (sunmoonstone)
                setxy_board(1072, 720);
            with (kris)
            {
                facing = 0;
                setxy_board(1072, 688);
            }
            with (susie)
            {
                scr_pathfind_end("susie");
                scr_play_recording("susie", "00");
                facing = 0;
            }
            with (ralsei)
            {
                facing = 0;
                scr_board_caterpillar_interpolate();
                setxy_board(1072, 682);
            }
            sunmoonstone.type = "sunmoonstone";
            con = 3;
        }
        else
        {
            debug_print("battle LOST!");
            con = -1;
        }
    }
    if (con == 3)
        global.interact = 1;
    if (con == 3 && !i_ex(obj_gameshow_battlemanager))
    {
        timer = 0;
        con = 4;
    }
    if (con == 4)
    {
        kris.canfreemove = true;
        global.interact = 0;
        with (sunmoonstone)
            event_user(0);
        global.flag[1022] = 0;
        con = 5;
    }
    if (con == 5 && !i_ex(sunmoonstone))
    {
        with (obj_mainchara_board)
            canfreemove = true;
        with (susie)
        {
            scr_pathfind_end("susie");
            scr_play_recording("susie", "00");
            facing = 0;
        }
        with (ralsei)
        {
            facing = 0;
            follow = 1;
            scr_board_caterpillar_interpolate();
        }
        con = 6;
    }
}
