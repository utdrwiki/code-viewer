buffer--;
if (sword)
{
    with (obj_mainchara_board)
        sword = true;
}
if (kris == 0)
{
    with (obj_mainchara)
        other.kris = id;
}
if (susie == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            other.susie = id;
    }
}
if (ralsei == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "ralsei")
            other.ralsei = id;
    }
}
if (room == room_dw_b3bs_rouxls_lanina)
{
    if (cantuse)
    {
        if (scr_keyitemcheck(16))
            cantuse = false;
    }
}
if (skipcrt)
    obj_board_controller.drawcrt = false;
if (con == 0.1)
{
    with (obj_puzzlecloset_manager)
        camcontrol = false;
    con = 99;
    global.interact = 1;
    kris.cutscene = true;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    if (camx != -1)
        camcon = 1;
    c_sel(kr);
    c_walkdirect(controlxpos, controlypos, 15);
    if (i_ex(ralsei))
    {
        c_sel(ra);
        c_walkdirect(controlxpos - 27 - 8, controlypos + 30 + 2 + 1, 15);
    }
    if (i_ex(susie))
    {
        c_sel(su);
        c_walkdirect(controlxpos + 30, controlypos + 30, 15);
    }
    c_wait(16);
    c_var_instance(id, "con", 0.2);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 0.2 && !i_ex(cutscene_master))
{
    global.interact = 0;
    global.facing = 2;
    with (obj_caterpillarchara)
    {
        for (i = 0; i < 75; i += 1)
            facing[i] = 2;
        x = scr_even(x);
        y = scr_even(y);
    }
    with (obj_mainchara)
    {
        freeze = true;
        fun = 1;
        sprite_index = spr_krisu_holdcontroller;
        if (scr_flag_get(1076) == 1 || scr_flag_get(1077) == 1)
            sprite_index = spr_krisu_holdcontroller_cool;
    }
    global.flag[7] = 1;
    con = 1;
    if (room == room_dw_puzzlecloset_2)
    {
        if (global.flag[1134] == 0)
        {
            global.flag[1134] = 1;
            tv[1].turnon = 1;
            with (tv[4])
                scr_delay_var("turnon", 1, 3);
            with (tv[5])
                scr_delay_var("turnon", 1, 6);
            with (tv[2])
                scr_delay_var("turnon", 1, 9);
            with (tv[0])
                scr_delay_var("turnon", 1, 12);
            with (tv[3])
                scr_delay_var("turnon", 1, 15);
            snd = snd_play_x(snd_tv_poweron, 0.2, 0.5);
            snd_volume(snd, 0, 15);
            snd = snd_play_x(snd_tv_poweron, 0.4, 2);
            snd_volume(snd, 0, 15);
            con = 27;
            scr_delay_var("con", 1, 30);
        }
    }
    if (room == room_dw_puzzlecloset_3)
    {
        if (global.flag[1150] == 0)
        {
            global.flag[1150] = 1;
            tv1.turnon = 1;
            snd = snd_play_x(snd_tv_poweron, 0.2, 0.5);
            snd_volume(snd, 0, 15);
            snd = snd_play_x(snd_tv_poweron, 0.4, 2);
            snd_volume(snd, 0, 15);
            con = 27;
            scr_delay_var("con", 1, 15);
        }
    }
}
if (con == 1)
{
    if (!i_ex(player))
    {
        usecount++;
        snd_play_x(snd_board_splash, 1, 0.8);
        player = instance_create(playx, playy, obj_mainchara_board);
        player.freeroam = true;
        player.dontteam = true;
        player.canfreemove = true;
        player.controlled = 1;
        player.name = playerid[characterIndex];
        with (player)
            instance_create(x, y, obj_board_smokepuff);
    }
    else
    {
        snd_play_pitch(snd_item, 1.1);
        player.controlled = 1;
    }
    con = 2;
}
if (con == 2)
{
    if (button3_p() && buffer <= 0 && canswitch && global.interact == 0)
    {
        var blocked = 0;
        if (i_ex(obj_board_playercamera))
            blocked = true;
        if (i_ex(obj_pushableblock_board))
        {
            with (obj_pushableblock_board)
            {
                if (sprite_index == spr_ralsei_board_stoolforme)
                    blocked = true;
            }
        }
        if (i_ex(obj_board_grabobject))
            blocked = true;
        if (i_ex(obj_board_writer))
            blocked = true;
        buffer = 3;
        if (!blocked)
        {
            characterIndex++;
            buffer = 3;
            var remplayer = player;
            player = instance_create(remplayer.x, remplayer.y, obj_mainchara_board);
            player.freeroam = true;
            player.dontteam = true;
            player.canfreemove = true;
            player.controlled = 1;
            if (characterIndex == array_length(playerid))
                characterIndex = 0;
            player.name = playerid[characterIndex];
            safe_delete(remplayer);
            with (player)
                instance_create(x, y, obj_board_smokepuff);
            snd_play_x(snd_board_text_main, 1, 1.1 + (characterIndex / 10));
            snd_play_x(snd_board_text_main, 1, 0.2 + (characterIndex / 10));
            snd_play_x(snd_board_splash, 0.4, 0.8);
        }
        else
        {
            debug_print("switch blocked");
        }
    }
    var canceltimerprogress = button2_h();
    if (canceltimerprogress)
    {
        if (global.interact != 0)
            canceltimerprogress = false;
        if (button1_h() || left_h() || right_h() || down_h() || up_h() || left_p() || right_p() || down_p() || up_p() || d_ex() || bw_ex())
            canceltimerprogress = false;
        if (room == room_dw_puzzlecloset_3)
        {
            with (obj_mainchara_board)
            {
                if (place_meeting(x, y, obj_board_camsolid))
                    canceltimerprogress = false;
            }
        }
        with (obj_mainchara_board)
        {
            if (controlled == 1)
            {
                if (canfreemove == false)
                    canceltimerprogress = false;
            }
        }
        with (obj_board_camera)
        {
            if (shift != "none" || con != 0)
                canceltimerprogress = false;
        }
    }
    if (button2_h())
    {
        canceltimer++;
        if (canceltimerprogress == false)
            canceltimer = min(canceltimer, canceltime - 2);
    }
    else
    {
        canceltimer = 0;
    }
    if (i_ex(obj_board_grabobject))
    {
        if (canceltimer >= (canceltime - 2))
            canceltimer = canceltime - 2;
    }
    if (canceltimer >= canceltime || endplay > 0)
    {
        if (camerax() == 0)
            skipcamreset = true;
        global.flag[7] = 0;
        if (dontdelete == false)
        {
            with (player)
                instance_create(x, y, obj_board_smokepuff);
            if (!nostartchange)
            {
                if (i_ex(player))
                {
                    playx = player.x;
                    playy = player.y;
                }
            }
            safe_delete(player);
            if (!endplay)
            {
                snd_stop(snd_board_splash);
                snd_play_x(snd_board_splash, 1, 0.8);
            }
        }
        else
        {
            if (!endplay)
                snd_play_pitch(snd_item, 0.9);
            player.controlled = false;
        }
        with (obj_pushableblock_board)
        {
            if (sprite_index == spr_ralsei_board_stoolforme)
                instance_destroy();
        }
        with (obj_board_grayregion)
            instance_destroy();
        with (obj_board_playercamera)
            instance_destroy();
        if (skipcamreset == false)
        {
            con = 3;
            var desx = (obj_mainchara.x - 320) + 11 + 8;
            var desy = 0;
            scr_lerpvar("camxoverride", camerax(), desx, 4);
            scr_lerpvar("camyoverride", cameray(), desy, 4);
            scr_delay_var("con", 4, 8);
        }
        else
        {
            con = 4;
        }
    }
}
if (con == 4)
{
    con = 0;
    timer = 0;
    buffer = 6;
    canceltimer = 0;
    obj_mainchara.freeze = false;
    obj_mainchara.fun = 0;
    kris.cutscene = false;
    global.facing = 0;
    if (endplay > 0)
        global.facing = endplay - 1;
    endplay = false;
    kris.cutscene = false;
    camcon = 0;
    with (obj_puzzlecloset_manager)
        camcontrol = true;
    if (room == room_dw_puzzlecloset_1)
    {
        if (global.flag[1091] == 1)
        {
            global.flag[1091] = 2;
            global.interact = 1;
            con = 20;
            stime = 0;
        }
    }
}
if (con == 20)
{
    stime++;
    if (stime == 15)
    {
        with (obj_caterpillarchara)
        {
            if (name == "susie")
            {
                fun = 1;
                sprite_index = lsprite;
            }
        }
    }
    if (stime == 20)
    {
        stime = 0;
        con = 21;
        scr_speaker("susie");
        msgsetloc(0, "\\EA* Where'd you get the sword? That's badass./%", "obj_b3bs_console_slash_Step_0_gml_327_0");
        d_make();
    }
}
if (con == 21 && !d_ex())
{
    global.interact = 0;
    stime = 0;
    with (obj_caterpillarchara)
        fun = 0;
    con = 0;
}
if (camcon == 1)
{
    kris.cutscene = true;
    camxoverride = camerax();
    camyoverride = cameray();
    scr_lerpvar("camxoverride", camerax(), camx, 15);
    scr_lerpvar("camyoverride", cameray(), camy, 15);
    camcon = 2;
}
if (camcon == 2)
{
    kris.cutscene = true;
    camera_set_view_pos(view_camera[0], scr_even(camxoverride), scr_even(camyoverride));
}
