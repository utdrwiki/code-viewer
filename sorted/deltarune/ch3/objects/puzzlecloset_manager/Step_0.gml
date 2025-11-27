if (caterinit == 0)
{
    with (obj_caterpillarchara)
    {
        x = obj_mainchara.x - halign;
        y = obj_mainchara.y;
        for (_iaia = target; _iaia > -1; _iaia -= 1)
        {
            remx[_iaia] = x;
            remy[_iaia] = y;
            facing[_iaia] = global.facing;
        }
    }
    caterinit = 1;
    if (global.flag[1228] > 0)
    {
        if (room == room_dw_puzzlecloset_2)
        {
            with (obj_doorAny)
            {
                doorDelay = -1;
                doorFadeMusicTime = 14;
                debug_print("done");
            }
        }
    }
}
with (obj_board_controller)
    drawcrt = false;
if (wrapchar == true)
{
    with (obj_mainchara_board)
    {
        if (x < 732)
            x += 604;
        if (x > 1348)
            x -= 604;
        if (y < 164)
            y += 292;
        if (y > 444)
            y -= 292;
    }
}
if (room == room_dw_puzzlecloset_2)
{
    if (keycon == 0)
    {
        with (obj_board_trigger)
        {
            if (place_meeting(x, y, obj_b3bs_chasekey))
                other.keycon = 1;
        }
    }
    if (keycon == 1)
    {
        with (doorsolid)
        {
            scr_board_marker(x, y, spr_board_stairs, 0, 999999);
            instance_create(x, y, obj_board_smokepuff);
            instance_destroy();
            snd_play(snd_board_door_close);
        }
        with (obj_b3bs_chasekey)
            instance_destroy();
        keycon = 2;
    }
}
if (room == room_dw_puzzlecloset_3)
{
    with (obj_mainchara_board)
        freeroam = false;
    with (obj_board_parent)
        active = true;
}
if (nextloc == 0)
{
    with (obj_dw_puzzlecloset_warp)
    {
        if (con == 2)
        {
            other.nextloc = 1;
            timer = 0;
            con = 3;
        }
    }
}
if (nextloc == 1)
{
    with (obj_b3bs_console)
    {
        playx = 3088;
        playy = 688;
    }
    wrapchar = 0;
    nextloc++;
    var xloc = 3008;
    var yloc = 608;
    var yspace = 128;
    var camwid = 160;
    var camhei = 128;
    camera_set_view_pos(view_camera[1], xloc + (vwid * 0), yloc + (yspace * 0));
    camera_set_view_pos(view_camera[2], xloc + (vwid * 1), yloc + (yspace * 0));
    camera_set_view_pos(view_camera[3], xloc + (vwid * 2), yloc + (yspace * 0));
    camera_set_view_pos(view_camera[4], xloc + (vwid * 0), yloc + (yspace * 1));
    camera_set_view_pos(view_camera[5], xloc + (vwid * 1), yloc + (yspace * 1));
    camera_set_view_pos(view_camera[6], xloc + (vwid * 2), yloc + (yspace * 1));
    with (obj_mainchara_board)
        setxy(3040, 640);
}
if (scr_debug())
{
    if (keyboard_check_pressed(ord("P")))
    {
        shuffle = !shuffle;
        debug_print("P: shuffle=" + string(shuffle));
    }
}
if (room == room_dw_puzzlecloset_3)
{
    if (pc3fuzzinit == 0)
    {
        if (global.flag[1245] >= 8)
        {
            with (obj_board_playercamera)
            {
                snd_stop(snd_camera_flash);
                snd_play_x(snd_noise, 0.8, 1);
                snd_play_x(snd_noise, 0.5, 1.4);
                snd_play_x(snd_noise, 0.5, 0.6);
                instance_destroy();
                with (scr_marker_ext(524, 32, spr_pxwhite, 384, 256, 0, 0, c_white, 999998))
                {
                    var timedie = 60;
                    scr_lerpvar("image_alpha", 1.1, 0, timedie, 2, "in");
                    scr_doom(id, timedie + 1);
                }
            }
            with (obj_board_parent)
                instance_destroy();
            with (obj_b3bs_console)
            {
                endplay = 3;
                cantuse = true;
                scr_marker_ext(x, y, sprite_index, 2, 2, undefined, undefined, undefined, 1000100);
                y = -800;
            }
            fuzzsnd = snd_loop(snd_tv_static);
            pc3fuzzinit = 1;
            pc3check = instance_create(690, 342, obj_trigger_interact);
            with (pc3check)
                scr_size(3.5, 1);
            instance_create(524, 32, obj_dw_ch3_pc3fuzz);
        }
    }
    if (pc3fuzzinit)
    {
        if (audio_exists(fuzzsnd))
        {
            var x1 = obj_b3bs_console.x + 32;
            var x2 = obj_mainchara.x;
            var maxdist = 200;
            var amt2 = clamp((maxdist - abs(x1 - x2)) / maxdist, 0, 0.35);
            if (global.flag[1231] == 1)
                amt2 = 0;
            snd_volume(fuzzsnd, amt2, 0);
        }
        with (pc3check)
        {
            if (myinteract == 3 && global.flag[1231] == 0)
            {
                global.interact = 1;
                scr_speaker("no_name");
                msgsetloc(0, "* The console is unresponsive./%", "obj_puzzlecloset_manager_slash_Step_0_gml_172_0");
                myinteract = 4;
                d_make();
            }
            if (myinteract == 4 && !d_ex())
            {
                myinteract = 0;
                global.interact = 0;
            }
        }
    }
    if (global.flag[1233] == 0)
    {
        with (obj_doorAny)
        {
            if (x > 640)
            {
                if (touched)
                    global.flag[1233] = 1;
            }
        }
    }
}
if (endcon == 1)
{
    if (obj_b3bs_console.swordinteract == 1)
    {
        endcon = 2;
        global.interact = 1;
        global.msc = 1411;
        scr_text(global.msc);
        d_make();
    }
}
if (endcon == 2 && !d_ex())
{
    endcon = 1;
    obj_b3bs_console.swordinteract = 0;
    global.interact = 0;
}
