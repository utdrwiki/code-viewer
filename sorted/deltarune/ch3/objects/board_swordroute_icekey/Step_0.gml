if (init == 0)
{
    if (place_meeting(x, y, obj_board_tree))
    {
        with (instance_place(x, y, obj_board_tree))
        {
            other.init = 1;
            instance_destroy();
        }
    }
}
if (active == 1)
{
    if (con == 0)
    {
        mus_volume(global.currentsong[1], 0, 60);
        with (obj_mainchara_board)
            cantleave = true;
        con = 1;
        timer = 0;
    }
    if (killoutertrees == false && obj_board_camera.con == 0)
    {
        with (obj_board_tree)
        {
            if (x > 480 || y > 288 || x < 128 || y < 64)
                instance_destroy();
        }
        killoutertrees = true;
    }
}
if (con == 2)
{
    timer++;
    if (timer == 1)
    {
        snd_play(snd_impact);
        image_index = 1;
    }
    if (timer == 45)
    {
        scr_speaker("no_name");
        msgsetloc(0, "YOU GOT THE \\cIICE KEY\\cW", "obj_board_swordroute_icekey_slash_Step_0_gml_59_0");
        d = bw_make();
        d.skippable = false;
        d.reachedend_draw_triangle = false;
        d.rate = 6;
        d.textsound = snd_silent;
        d.reachedend_sound_play = false;
        d.boardopensound = false;
    }
    if (i_ex(d))
    {
        if (i_ex(d.writer))
        {
            if (d.writer.reachedend == 1)
            {
                timer = 0;
                con++;
            }
        }
    }
}
if (con == 3)
{
    timer++;
    var soundlength = 330;
    if (timer == 30)
    {
        global.flag[1055] = 1;
        snd_play(snd_link_get_key);
    }
    if (timer == (soundlength + 90))
    {
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
        with (obj_treasure_room)
            depth = 999990;
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
        with (instance_create_depth(x, y, 999995, obj_tvturnoff_manager))
            yoff = -64;
        audio_stop_all();
        safe_delete(obj_writer);
        safe_delete(obj_board_writer);
        depth = 1000000;
        obj_gameshow_swordroute.drawui = false;
        obj_board_controller.drawcrt = false;
        drawblack = true;
        with (obj_mainchara_board)
            controlled = 0;
    }
    if (timer == (soundlength + 90 + 30))
    {
        global.hp[1] = global.maxhp[1];
        global.hp[2] = global.maxhp[2];
        global.hp[3] = global.maxhp[3];
        scr_marker_ext(0, 0, spr_pxwhite, 640, 480, undefined, undefined, c_black, 999995);
        global.interact = 0;
        obj_mainchara.freeze = false;
        obj_mainchara.fun = false;
        global.facing = 0;
    }
}
