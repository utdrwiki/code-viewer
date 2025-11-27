if (scr_debug())
{
    if (active && obj_board_camera.con == 0)
    {
        if (global.flag[1055] < 2)
            global.flag[1055] = 2;
    }
}
if (kris == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.kris = id;
    }
}
if (kr_real == 0)
{
    with (obj_mainchara)
        other.kr_real = id;
}
if (active == 1)
{
    if (musinit == 0 && obj_board_camera.con == 0)
    {
        north = snd_init("northernlight.ogg");
        music = mus_loop_ext(north, 1, 1/3);
        mus_volume(music, 0, 0);
        mus_volume(music, 1, 90);
        with (obj_gameshow_swordroute)
            scr_lerpvar_instance(id, "screenalpha", 1, 0, 15);
        var memx = kris.x - board_tilex(0);
        var memy = kris.y - board_tiley(0);
        scr_board_instawarp(4160, 4672, 4160 + memx, 4672 + memy);
        kris.cantleave = 0;
        musinit = 1;
    }
    if (con == 0)
    {
        if (campancon == 0 && obj_board_camera.con == 0)
            campancon++;
        if (campancon == 1 && obj_board_camera.con != 0)
            campancon++;
        if (campancon == 2 && obj_board_camera.con == 0)
            campancon++;
        if (campancon == 3 && obj_board_camera.con != 0)
            campancon++;
        if (campancon == 4 && obj_board_camera.con == 0)
        {
            if (collision_rectangle(board_tilex(4), board_tiley(3), board_tilex(8), board_tiley(5), obj_mainchara_board, 0, 0))
            {
                global.interact = 1;
                campancon = 5;
                scr_speaker("no_name");
                msgsetloc(0, "Well done./", "obj_b2d_dungeonend_slash_Step_0_gml_100_0");
                msgnextloc("You found my secret hiding place./", "obj_b2d_dungeonend_slash_Step_0_gml_101_0");
                msgnextloc("But there's nothing here.../", "obj_b2d_dungeonend_slash_Step_0_gml_59_0");
                msgnextloc("...is there?/%", "obj_b2d_dungeonend_slash_Step_0_gml_60_0");
                with (bw_make())
                    skip = true;
            }
        }
        if (campancon == 5 && !bw_ex())
        {
            campancon = 6;
            var memx = kris.x - board_tilex(0);
            var memy = kris.y - board_tiley(0);
            scr_board_instawarp(4160, 4672, 4160 + memx, 4672 + memy);
        }
        if (campancon == 6 && obj_board_camera.con == 0)
            campancon++;
        if (campancon == 7 && obj_board_camera.con != 0)
            campancon++;
        if (campancon == 8 && obj_board_camera.con == 0)
        {
            var memx = kris.x - board_tilex(0);
            var memy = kris.y - board_tiley(0);
            scr_board_instawarp(4160, 4672, 4160 + memx, 4672 + memy);
            sparkle[0] = instance_create(4352, 4544, obj_board_interactable);
            sparkle[1] = instance_create(4736, 4800, obj_board_interactable);
            sparkle[2] = instance_create(3968, 4800, obj_board_interactable);
            sparkle[3] = instance_create(4352, 5056, obj_board_interactable);
            for (var i = 0; i < array_length(sparkle); i++)
            {
                with (sparkle[i])
                {
                    scr_darksize();
                    visible = false;
                    scr_delay_var("visible", true, 15);
                    setxy_board();
                    sprite_index = spr_board_sparkle;
                    depth = 999990;
                    image_speed = 0.125;
                }
            }
            campancon++;
        }
        if (campancon == 8 && obj_board_camera.con == 0)
            campancon++;
        if (campancon == 9 && obj_board_camera.con != 0)
        {
            campancon++;
            kris.cantleave = true;
        }
        if (campancon == 10 && obj_board_camera.con == 0)
        {
            kris.cantleave = true;
            var trig = false;
            if (collision_rectangle(board_tilex(5.75), board_tiley(3.75), board_tilex(6.25), board_tiley(4.25), obj_mainchara_board, 0, 0))
                trig = true;
            for (var i = 0; i < array_length(sparkle); i++)
            {
                with (sparkle[i])
                {
                    if (myinteract == 3)
                        trig = true;
                }
            }
            if (trig)
            {
                for (var i = 0; i < array_length(sparkle); i++)
                {
                    with (sparkle[i])
                        instance_destroy();
                }
                global.interact = 1;
                con = 2;
                timer = 0;
            }
        }
    }
    if (con == 2 && !bw_ex())
    {
        timer++;
        if (timer == 15)
        {
            scr_speaker("no_name");
            msgsetloc(0, "YOU GOT THE\n\\cSSHELTER KEY\\cW", "obj_b2d_dungeonend_slash_Step_0_gml_114_0");
            d = bw_make();
            d.skippable = false;
            d.reachedend_draw_triangle = false;
            d.rate = 6;
            d.textsound = snd_silent;
            d.reachedend_sound_play = false;
            d.boardopensound = false;
            timer = 0;
            con++;
        }
    }
    if (con == 3)
    {
        if (d.halt)
        {
            global.flag[1055] = 3;
            snd_play(snd_link_sfx_itemget_bad);
            timer = 0;
            con++;
        }
    }
    if (con == 4)
    {
        timer++;
        if (timer == 30)
        {
            safe_delete(obj_writer);
            safe_delete(obj_board_writer);
            scr_speaker("no_name");
            msgsetloc(0, "Oh^1, you found that^1, too!/", "obj_b2d_dungeonend_slash_Step_0_gml_145_0");
            msgnextloc("Perfect^1, just perfect.../", "obj_b2d_dungeonend_slash_Step_0_gml_146_0");
            msgnextloc("Thanks for all your hard work^1, Kris!/%", "obj_b2d_dungeonend_slash_Step_0_gml_147_0");
            bw_make();
            con = 5;
            timer = 0;
        }
    }
    if (scr_debug())
    {
        if (keyboard_check_pressed(ord("1")))
        {
        }
    }
    if (con == 5 && !bw_ex())
    {
        timer++;
        if (timer == 15)
        {
            snd_free_all();
            scr_speaker("no_name");
            msgsetloc(0, "YOU WERE USED UP.", "obj_b2d_dungeonend_slash_Step_0_gml_168_0");
            d = bw_make();
            d.skippable = false;
            d.reachedend_draw_triangle = false;
            d.rate = 6;
            d.textsound = snd_silent;
            d.reachedend_sound_play = false;
            d.boardopensound = false;
            timer = 0;
            con++;
        }
    }
    if (con == 6)
    {
        if (d.halt == 1)
        {
            timer++;
            if (timer == 10)
            {
                kris.image_alpha = 0;
                snd_play_x(snd_board_kill_ominous, 0.5, 0.5);
                snd_play_x(snd_board_torch, 0.8, 1.2);
                timer = 0;
                con++;
            }
        }
    }
    if (con == 7)
    {
        audio_stop_all();
        safe_delete(obj_writer);
        safe_delete(obj_board_writer);
        depth = 100000;
        draw_static = 1;
        obj_gameshow_swordroute.drawui = false;
        drawblack = true;
        with (obj_mainchara_board)
            controlled = 0;
        timer = 0;
        con++;
    }
    if (con == 8)
    {
        timer++;
        if (timer == 1)
            snd_play(snd_tv_static);
        if (timer == 30)
        {
            snd_stop(snd_tv_static);
            draw_static = 0;
            obj_board_controller.drawcrt = false;
        }
        if (timer == 90)
            obj_mainchara.sprite_index = spr_krisu_holdcontroller_slightright;
        if (timer == 150)
            obj_mainchara.sprite_index = spr_krisu_kneel;
        if (timer == 210)
        {
            obj_mainchara.facing = 2;
            obj_mainchara.fun = false;
            obj_mainchara.freeze = false;
            con++;
        }
    }
    if (con == 9)
    {
        con++;
        global.flag[7] = 0;
        with (obj_gameshow_swordroute)
        {
            depth = 999980;
            bg.depth = 999994;
            gameconsole.depth = 999985;
        }
        with (obj_mainchara_board)
            ignoredepth = 1;
        with (obj_board_controller)
            depth = 999980;
        with (obj_marker)
        {
            if (x == 0 && y == 380)
                depth = 999979;
        }
        with (obj_mainchara)
        {
            ignoredepth = 1;
            depth = 999979;
        }
        with (obj_board_parent)
            depth += 500;
        with (obj_mainchara_board)
            visible = false;
        global.interact = 0;
    }
}
