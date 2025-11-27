if (bgm != -1)
    bgm_pos = audio_sound_get_track_position(bgm);
if (!files_exist && !debug_force_nofiles)
{
    if (con == 0)
    {
        con = 1;
        bgm = mus_play(snd_init("ch4_first_intro.ogg"));
        scr_lerp_instance_var(logo_heart, "image_alpha", 0, 1, 120);
    }
    if (con == 1)
    {
        if (bgm_pos >= 4)
            con = 2;
    }
    if (con == 2)
    {
        con = 3;
        scr_lerp_instance_var(logo_all, "image_alpha", 0, 1, 90);
    }
    if (con == 3)
    {
        if (bgm_pos >= 7.5)
        {
            con = 4;
            scr_lerp_instance_var(prophecy_effect, "image_alpha", 0, 1, 70);
        }
    }
    if (con == 4)
    {
        if (bgm_pos >= 8)
        {
            con = 5;
            scr_lerp_instance_var(id, "chapter4_text_alpha", 0, 1, 90);
        }
    }
    if (con == 5)
    {
        if (bgm_pos >= 15)
        {
            con = 6;
            scr_lerp_instance_var(prophecy_effect, "scroll_speed", prophecy_effect_scroll_speed, 0, 60);
        }
    }
    if (con == 6)
    {
        if (bgm_pos == 0)
        {
            con = 7;
            timer = 0;
        }
    }
    if (con == 7)
    {
        con = 8;
        timer = 0;
        with (prophecy_effect)
            image_alpha = 0;
        with (logo_all)
            sprite_index = IMAGE_LOGO_CENTER_SHATTER;
        chapter4_text_alpha = 0;
        var _delay_sound_time = 20;
        var snd = snd_play_complex(0, 0, undefined);
        snd_add_complex(snd, 4, 321, 1, 0.95, 0, -1, 0);
        snd_add_complex(snd, 0, 236, 0.6, 0.4, (_delay_sound_time - 1) + 2, -1, 0);
        snd_add_complex(snd, 3, 269, 0.7, 0.95, (_delay_sound_time - 1) + 0, -1, 0);
        snd_play_delay(break_noise, _delay_sound_time, 0.5, 1);
        snd_play_delay(break_noise, _delay_sound_time, 0.5, 0.94);
        var _shattersprite = 4671;
        var _fragments = sprite_get_number(_shattersprite);
        var _delay = 20;
        for (var i = 0; i < _fragments; i++)
        {
            with (scr_marker_ext(room_center_x, room_center_y, _shattersprite, 2, 2, undefined, i, undefined, 19800))
            {
                direction = random(360);
                scr_delay_var("gravity", 0.4 + random(0.12), _delay);
                scr_delay_var("friction", 0, _delay);
                scr_delay_var("speed", 4, _delay);
                scr_doom(id, 120);
            }
        }
        with (logo_all)
            instance_destroy();
    }
    if (con == 8)
    {
        if (timer++ >= 20)
        {
            timer = 0;
            con = 9;
            var sparklecount = 15;
            for (var i = 0; i < sparklecount; i++)
            {
                with (instance_create((room_center_x - 199) + ((i * 398) / sparklecount) + random_range(-30, 30), room_center_y + random(60), obj_dw_church_prophecy_groundshards))
                {
                    ytarg = 10000;
                    scr_doom(self, 280);
                }
            }
        }
    }
    if (con == 9)
    {
        if (timer++ >= 45)
        {
            timer = 0;
            con = 10;
            scr_lerp_instance_var(logo_heart, "image_alpha", 1, 0, 120);
        }
    }
    if (con == 10)
    {
        if (timer++ >= 120)
        {
            timer = 0;
            con = 99;
        }
    }
}
else
{
    skip_safety++;
    if (con == 0)
    {
        con = 0.5;
        timer = 0;
        black_all.visible = true;
        black_all.image_alpha = 0;
        prophecy_effect.tile_object = logo_prophecy;
        with (prophecy_effect)
            image_alpha = 1;
        with (logo_prophecy)
            image_alpha = 1;
    }
    if (button1_p() && con < 3 && skip_safety > 3)
        con = 3;
    if (con == 0.5)
    {
        if (timer++ >= 75)
        {
            con = 1;
            timer--;
            scr_lerp_instance_var(prophecy_effect, "scroll_speed", prophecy_effect_scroll_speed, 0, 52);
        }
    }
    if (con == 1)
    {
        if (timer++ > 135)
        {
            con = 2;
            timer = 0;
            with (logo_prophecy)
                image_alpha = 0;
            var _delay_sound_time = 20;
            var snd = snd_play_complex(0, 0, undefined);
            snd_add_complex(snd, 4, 321, 1, 0.95, 0, -1, 0);
            snd_add_complex(snd, 0, 236, 0.6, 0.4, (_delay_sound_time - 1) + 2, -1, 0);
            snd_add_complex(snd, 3, 269, 0.7, 0.95, (_delay_sound_time - 1) + 0, -1, 0);
            snd_play_delay(break_noise, _delay_sound_time, 0.5, 0.5);
            snd_play_delay(break_noise, _delay_sound_time, 0.5, 0.44);
            var _shattersprite = 5773;
            var _fragments = sprite_get_number(_shattersprite);
            var _delay = 20;
            for (var i = 0; i < _fragments; i++)
            {
                with (scr_marker_ext(logo_prophecy.x, logo_prophecy.y, _shattersprite, 2, 2, undefined, i, undefined, 19800))
                {
                    direction = random(360);
                    scr_delay_var("gravity", 0.4 + random(0.12), _delay);
                    scr_delay_var("friction", 0, _delay);
                    scr_delay_var("speed", 4, _delay);
                    scr_doom(id, 120);
                }
            }
        }
    }
    if (con == 2)
    {
        if (timer++ >= 20)
        {
            timer = 0;
            con = 4;
            var sparklecount = 15;
            for (var i = 0; i < sparklecount; i++)
            {
                var _width = 90;
                var _xx = (room_center_x - _width) + (i * ((_width * 2) / sparklecount)) + random_range(-30, 30);
                var _yy = room_center_y + random(70);
                if (i == 0)
                    _xx = room_center_x - _width;
                if (i == (sparklecount - 1))
                    _xx = room_center_x + _width;
                with (instance_create(_xx, _yy, obj_dw_church_prophecy_groundshards))
                {
                    ytarg = 10000;
                    scr_doom(self, 280);
                }
            }
        }
    }
    if (con == 3)
    {
        con = 5;
        timer = 0;
        scr_lerp_instance_var(black_all, "image_alpha", black_all.image_alpha, 1, skip_time);
    }
    if (con == 4)
    {
        if (timer++ >= 120)
        {
            timer = 0;
            con = 99;
        }
    }
    if (con == 5)
    {
        if (timer++ > skip_time)
        {
            timer = 0;
            con = 99;
        }
    }
}
if (con == 99)
    room_goto(PLACE_MENU);
