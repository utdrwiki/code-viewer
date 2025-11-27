if (init == 0)
{
    if (kind == 0)
        persistent = false;
    if (kind == 1)
        global.interact = 1;
    init = 1;
}
if (con == 0)
{
    timer++;
    _alpha1 = lerp(0, 1, timer / 5);
    draw_sprite_ext(spr_zapper_tvturnoff1, 0, camerax() + 320, cameray() + 240 + yoff, 6, 10, 0, c_white, _alpha1);
    if (timer == 5)
    {
        con = 1;
        timer = 0;
    }
    if (i_ex(obj_tenna_board4_enemy))
    {
        with (obj_zapper_enemy)
            image_alpha = 0;
        with (obj_tenna_board4_enemy)
            hidetvcount = true;
        with (obj_actor_tenna)
            preset = 0;
    }
}
if (con == 1)
{
    timer++;
    if (timer == 4)
        snd_play(snd_tvturnoff);
    _yscale1 = lerp(_yscale1, 0.05, timer / 8);
    draw_sprite_ext(spr_zapper_tvturnoff1, 0, camerax() + 320, cameray() + 240 + yoff, 6, _yscale1, 0, c_white, 1);
    draw_sprite_ext(spr_zapper_tvturnoff2, 2, camerax() + 320, cameray() + 240 + yoff, 0.1, 0.1, 0, c_white, 1);
    if (timer == 8)
    {
        con = 2;
        timer = 0;
        snd_play(snd_tvturnoff2);
        if (kind == 0)
            audio_pause_sound(global.batmusic[1]);
        if (kind == 1 || kind == 2)
            audio_pause_sound(global.currentsong[1]);
    }
}
if (con == 2)
{
    timer++;
    var timing = 10;
    if (timer <= timing)
    {
        _xscale1 = lerp(_xscale1, 0, timer / timing);
        _yscale1 = lerp(_yscale1, 0.01, timer / timing);
    }
    timer2++;
    var timing2 = 5;
    if (timer2 <= timing2)
    {
        _xscale2 = lerp(_xscale2, 0.4, timer2 / timing2);
        _yscale2 = lerp(_yscale2, 0.4, timer2 / timing2);
    }
    else
    {
        _xscale2 = lerp(_xscale2, 0, (timer2 - timing2) / timing2);
        _yscale2 = lerp(_yscale2, 0, (timer2 - timing2) / timing2);
    }
    draw_sprite_ext(spr_zapper_tvturnoff1, 0, camerax() + 320, cameray() + 240 + yoff, _xscale1, _yscale1, 0, c_white, 1);
    draw_sprite_ext(spr_zapper_tvturnoff2, 2, camerax() + 320, cameray() + 240 + yoff, _xscale2, _yscale2, 0, c_white, 1);
    if (timer == 30 && tennaending == true)
    {
        image_alpha = 6;
        if (i_ex(obj_tenna_enemy))
        {
            scr_wincombat();
            with (obj_battlecontroller)
                skipvictory = 1;
            with (obj_shadowman_sharpshoot_target)
                instance_destroy();
            with (obj_screen_channel_change)
                instance_destroy();
            with (obj_lightemup_controller)
                instance_destroy();
            with (obj_shadowman_sharpshoot_heart)
                instance_destroy();
            with (obj_tenna_enemy)
                instance_destroy();
        }
        with (obj_actor_tenna)
            darkenalpha = 1;
    }
    if (timer == 30 && tennaending == false)
    {
        con = 3;
        timer = 0;
        if (kind == 1)
        {
            if (entrance != "none")
                global.entrance = entrance;
            if (facing != -1)
                global.facing = facing;
            if (room_exists(roomtarg))
            {
                global.interact = 3;
                if (roomtarg == room_dw_b3bs_zapper_d)
                    scr_setparty(0, 0, 0);
                else
                    scr_setparty(1, 1, 0);
                room_goto(roomtarg);
            }
        }
        if (kind == 2)
        {
            obj_mainchara.x = scr_even(targx);
            obj_mainchara.y = scr_even(targy);
            if (kind == 2)
                global.facing = 1;
            with (obj_caterpillarchara)
            {
                setxy(scr_even(obj_mainchara.x - 10), scr_even(obj_mainchara.y - 16));
                if (name == "susie")
                {
                    x -= 12;
                    y -= 16;
                }
                else
                {
                    x -= 20;
                    y += 14;
                }
                scr_caterpillar_interpolate();
                scr_caterpillar_facing(1);
            }
        }
    }
}
if (con == 3)
{
    timer++;
    if (i_ex(obj_tenna_board4_enemy))
    {
        with (obj_heroparent)
            x = -9999;
    }
    if ((i_ex(obj_tenna_board4_enemy) && timer > 60) || !i_ex(obj_tenna_board4_enemy))
    {
        if (image_alpha == 1 && muted == 0)
        {
            if (kind == 0)
                audio_resume_sound(global.batmusic[1]);
            if (kind == 1)
            {
                mus_volume(global.currentsong[1], 0, 0);
                audio_resume_sound(global.currentsong[1]);
                mus_volume(global.currentsong[1], 1, 10);
            }
        }
        if (tennaending == true)
        {
        }
        else
        {
            image_alpha -= 0.1;
            if (image_alpha < 0)
            {
                snd_stop(snd_tvturnoff2);
                instance_destroy();
                if (kind == 1 || kind == 2)
                    global.interact = 0;
            }
        }
    }
}
