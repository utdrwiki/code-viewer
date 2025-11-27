if (!i_ex(obj_homealone_heart))
    exit;
if (!init)
{
    init = true;
    vent_cover_marker.depth = obj_homealone_heart.depth - 10;
    vent_panel_marker.depth = obj_homealone_heart.depth - 10;
}
if (!drink_finished && !grab_heart)
{
    drink_make_timer++;
    if (drink_make_timer == 60)
    {
        snd_play(snd_wing);
        with (kris_marker)
            image_index = 1;
    }
    if (drink_make_timer == 64)
    {
        with (kris_marker)
            image_index = 2;
    }
    if (drink_make_timer == 68)
    {
        snd_loop(snd_paper_surf);
        with (kris_marker)
        {
            sprite_index = spr_noellehouse_kitchen_kris_drink_make;
            image_index = 0;
            image_speed = 0.2;
        }
    }
    if (drink_make_timer == (60 + drink_start_pause))
    {
        snd_stop(snd_paper_surf);
        with (kris_marker)
        {
            image_speed = 0;
            image_index = 0;
            sprite_index = spr_noellehouse_kitchen_kris_choco_put_down;
            scr_animate(671, 2, 0.15);
        }
    }
    if (drink_make_timer == (64 + drink_start_pause))
        snd_play(snd_wing);
    if (drink_make_timer == (90 + drink_start_pause))
    {
        choco_marker.visible = 1;
        with (kris_marker)
        {
            sprite_index = spr_noellehouse_kitchen_kris_drink_take;
            image_speed = 0;
            image_index = 0;
        }
    }
    if (drink_make_timer == (94 + drink_start_pause))
    {
        with (kris_marker)
        {
            sprite_index = spr_noellehouse_kitchen_kris_drink_hold;
            image_speed = 0;
            image_index = 0;
        }
    }
    if (drink_make_timer == (98 + drink_start_pause))
    {
        snd_play(snd_swallow);
        with (kris_marker)
        {
            sprite_index = spr_noellehouse_kitchen_kris_drinking;
            image_speed = 0;
            image_index = 0;
        }
    }
    if (drink_make_timer == (162 + drink_start_pause))
    {
        drink_track = true;
        snd_play(snd_swallow);
        with (kris_marker)
        {
            sprite_index = spr_noellehouse_kitchen_kris_drink_left;
            image_speed = 0;
            image_index = 0;
        }
    }
    if (drink_make_timer == (220 + drink_start_pause))
    {
        snd_play(snd_swallow);
        with (kris_marker)
        {
            sprite_index = (sprite_index == spr_noellehouse_kitchen_kris_drink_left) ? spr_noellehouse_kitchen_kris_drink_finish_left : spr_noellehouse_kitchen_kris_drink_finish_right;
            image_index = 0;
        }
    }
    if (drink_make_timer == (280 + drink_start_pause))
    {
        drink_track = false;
        snd_play(snd_wing);
        with (kris_marker)
            sprite_index = spr_noellehouse_kitchen_kris_drink_hold_empty;
    }
    if (drink_make_timer == (320 + drink_start_pause))
    {
        with (kris_marker)
        {
            sprite_index = spr_noellehouse_kitchen_kris_drink_put_down;
            image_speed = 0;
            image_index = 0;
        }
    }
    if (drink_make_timer == (326 + drink_start_pause))
    {
        with (kris_marker)
            image_index = 1;
    }
    if (drink_make_timer == (336 + drink_start_pause))
    {
        snd_play_x(snd_wing, 0.5, 1.15);
        with (kris_marker)
            image_index = 2;
    }
    if (drink_make_timer == (342 + drink_start_pause))
    {
        with (kris_marker)
            image_index = 3;
    }
    if (drink_make_timer == (400 + drink_start_pause))
    {
        with (kris_marker)
            sprite_index = spr_noellehouse_kitchen_kris_look_phone;
        cup_marker.visible = 1;
        kris_drink_down = true;
        piano_sequence = scr_flag_get(737) > 0;
        drink_finished = scr_flag_get(737) > 0;
    }
    if (drink_make_timer == (500 + drink_start_pause))
    {
        with (kris_marker)
        {
            sprite_index = spr_noellehouse_kitchen_kris_sleep;
            image_index = 0;
        }
    }
    if (drink_make_timer == (1100 + drink_start_pause))
    {
        with (kris_marker)
            image_index = 1;
    }
    if (drink_make_timer == (1700 + drink_start_pause))
    {
        with (kris_marker)
            image_index = 2;
    }
    if (drink_make_timer == (2300 + drink_start_pause))
    {
        snd_play(snd_noise);
        with (kris_marker)
        {
            image_index = 3;
            scr_shakeobj();
        }
    }
    if (drink_make_timer == (2400 + drink_start_pause))
        drink_finished = true;
}
if (scr_flag_get(737) == 0)
{
    if (kris_throw)
    {
        kris_throw_timer++;
        if (!kris_drink_down)
        {
            if (kris_throw_timer == 1)
            {
                drink_finished = true;
                if (kris_marker.sprite_index == spr_noellehouse_kitchen_kris_drink_put_down)
                {
                    with (kris_marker)
                    {
                        image_index = 1;
                        image_speed = 0;
                    }
                    cup_marker.visible = 1;
                    kris_drink_down = true;
                    kris_throw_timer = 0;
                    exit;
                }
                with (kris_marker)
                {
                    snd_play(snd_noise);
                    sprite_index = spr_noellehouse_kitchen_kris_drink_hold_empty;
                }
            }
            if (kris_throw_timer == 4)
            {
                with (kris_marker)
                {
                    sprite_index = spr_noellehouse_kitchen_kris_drink_put_down;
                    scr_animate(4796, 1, 0.5);
                }
            }
            if (kris_throw_timer == 10)
            {
                snd_play(snd_bump);
                cup_marker.visible = 1;
                kris_drink_down = true;
                kris_throw_timer = 0;
            }
        }
        else
        {
            if (kris_throw_timer == 1)
            {
                with (choco_marker)
                    throw_choco = true;
            }
            if (kris_throw_timer == 2)
            {
                snd_play(snd_grab);
                with (kris_marker)
                {
                    sprite_index = spr_noellehouse_kitchen_kris_throw;
                    image_speed = 0;
                    image_index = 0;
                }
            }
            if (kris_throw_timer == 3)
            {
                with (kris_marker)
                    image_index = 1;
            }
            if (kris_throw_timer == 4)
            {
                kris_throw = false;
                with (kris_marker)
                    image_index = 2;
            }
        }
    }
    if (!is_noticed && !grab_heart && !kris_throw && !finished)
    {
        if (point_in_rectangle(obj_homealone_heart.x, obj_homealone_heart.y, 150, 75, 170, 80))
        {
            sink_notice_timer--;
            if (sink_marker.visible == 0)
                sink_marker.visible = 1;
            if (sink_notice_timer <= 0)
                is_noticed = true;
        }
        if (point_in_rectangle(obj_homealone_heart.x, obj_homealone_heart.y, 160 + room_offset_x, 80 + room_offset_y, 300 + room_offset_x, 200 + room_offset_y))
            is_noticed = true;
    }
    if (is_noticed)
    {
        notice_timer++;
        if (!finished)
        {
            var zone_type = 0;
            if (point_in_rectangle(obj_homealone_heart.x, obj_homealone_heart.y, 160 + room_offset_x, 80 + room_offset_y, 300 + room_offset_x, 200 + room_offset_y))
                zone_type = 1;
            if (point_in_rectangle(obj_homealone_heart.x, obj_homealone_heart.y, throw_threshold_x_a, throw_threshold_y_a, throw_threshold_xx_a, throw_threshold_yy_a))
                zone_type = 1;
            if (point_in_rectangle(obj_homealone_heart.x, obj_homealone_heart.y, throw_threshold_x_b, throw_threshold_y_b, throw_threshold_xx_b, throw_threshold_yy_b))
                zone_type = 1;
            if (point_in_rectangle(obj_homealone_heart.x, obj_homealone_heart.y, 205 + room_offset_x, 80 + room_offset_y, (235 + room_offset_x) - 10, (130 + room_offset_y) - 20))
                zone_type = 2;
            if (point_in_rectangle(obj_homealone_heart.x, obj_homealone_heart.y, 160 + room_offset_x, 95 + room_offset_y, (235 + room_offset_x) - 10, (130 + room_offset_y) - 20))
                zone_type = 3;
            if (zone_type == 0)
            {
                choco_marker.visible = 1;
                finished = true;
                kris_throw = true;
                is_noticed = false;
                with (obj_homealone_kitchen_phone)
                    stop_speech = true;
                exit;
            }
            else if (kris_drink_down)
            {
                if (zone_type > 1)
                {
                    drink_finished = true;
                    finished = true;
                    is_noticed = false;
                    with (obj_homealone_kitchen_phone)
                        stop_speech = true;
                    grab_heart = true;
                    exit;
                }
                else if (obj_homealone_heart.y >= 190)
                {
                    choco_marker.visible = 1;
                    finished = true;
                    kris_throw = true;
                    is_noticed = false;
                    with (obj_homealone_kitchen_phone)
                        stop_speech = true;
                    exit;
                }
            }
            else if (drink_track)
            {
                if (obj_homealone_heart.x > kris_turn_pos && kris_face_left)
                {
                    kris_face_left = false;
                    with (kris_marker)
                    {
                        if (sprite_index == spr_noellehouse_kitchen_kris_drink_left)
                            sprite_index = spr_noellehouse_kitchen_kris_drink_right;
                        else if (sprite_index == spr_noellehouse_kitchen_kris_drink_finish_left)
                            sprite_index = spr_noellehouse_kitchen_kris_drink_finish_right;
                    }
                }
                if (obj_homealone_heart.x < kris_turn_pos && !kris_face_left)
                {
                    kris_face_left = true;
                    with (kris_marker)
                    {
                        if (sprite_index == spr_noellehouse_kitchen_kris_drink_right)
                            sprite_index = spr_noellehouse_kitchen_kris_drink_left;
                        else if (sprite_index == spr_noellehouse_kitchen_kris_drink_finish_right)
                            sprite_index = spr_noellehouse_kitchen_kris_drink_finish_left;
                    }
                }
            }
        }
    }
    if (grab_heart)
    {
        grab_heart_timer++;
        var take = false;
        var turn_pos = kris_turn_pos;
        if (grab_heart_timer == 1)
        {
            global.interact = 1;
            kris_marker.sprite_index = ((obj_homealone_heart.x - 20) > kris_marker.x) ? spr_noellehouse_kitchen_kris_jump_catch_right : spr_noellehouse_kitchen_kris_jump_catch;
            kris_marker.image_index = 0;
            kris_marker.depth = 100000;
            obj_homealone_heart.depth = kris_marker.depth + 10;
            with (kris_marker)
                scr_jump_to_point(obj_homealone_heart.x - 20, obj_homealone_heart.y, 15, 8);
        }
        if (grab_heart_timer == 6)
            kris_marker.image_index = 1;
        if (grab_heart_timer == 7)
        {
            snd_play(snd_grab);
            snd_play(snd_hurt1);
            with (obj_homealone_heart)
                visible = 0;
        }
        if (grab_heart_timer == 10)
        {
            kris_marker.image_index = 2;
            with (kris_marker)
                scr_shakeobj();
            heart_take = true;
            grab_heart = false;
            drink_finished = true;
        }
    }
    if (hit_heart && !kris_get)
    {
        heart_fall_timer++;
        if (heart_fall_timer == 1)
        {
            global.interact = 1;
            heart_fall_ypos = obj_homealone_heart.y;
            with (obj_homealone_heart)
            {
                cutscene = 1;
                if (x >= 255)
                    image_angle -= 45;
                else
                    image_angle += 45;
                scr_shakeobj();
            }
        }
        if (heart_fall_timer == 4)
        {
            with (obj_homealone_heart)
            {
                if (x >= 255 && x < 555)
                {
                    gravity = 0.5;
                    hspeed = 2;
                    friction = 0.1;
                }
                else if (x >= 515)
                {
                    gravity = 0.5;
                    friction = 0.1;
                }
                else
                {
                    gravity = 0.5;
                    hspeed = -2;
                    friction = 0.1;
                }
            }
        }
        if (heart_fall_timer >= 4)
        {
            var start_ypos = heart_fall_ypos;
            var get = false;
            with (obj_homealone_heart)
            {
                var stop_ypos = 200;
                if (start_ypos < 130 && x < 270)
                    stop_ypos = 130;
                if (x > 555)
                    stop_ypos = 140;
                if (y >= stop_ypos)
                {
                    snd_play(snd_noise);
                    snd_play(snd_hurt1);
                    gravity = 0;
                    vspeed = 0;
                    get = true;
                    if (x >= 555)
                    {
                        with (obj_homealone_heart)
                            scr_jump_to_point(525, 200, 5, 10);
                    }
                    else if (image_angle < 0 && y > 190)
                    {
                        y -= 4;
                    }
                }
            }
            kris_get = get;
            hit_heart = !kris_get;
        }
    }
    if (kris_get)
    {
        kris_get_timer++;
        if (kris_get_timer == 60)
        {
            with (kris_marker)
            {
                sprite_index = spr_noellehouse_kitchen_kris_chase_dl;
                image_speed = 0.25;
                image_index = 0;
                scr_depth();
                if (y < ((obj_homealone_heart.y - sprite_height) + 2))
                    sprite_index = spr_noellehouse_kitchen_kris_chase_ul;
                else if (x < obj_homealone_heart.x)
                    sprite_index = spr_noellehouse_kitchen_kris_chase_dr;
            }
            move_towards_heart = true;
            kris_get = false;
            kris_get_timer = 0;
        }
    }
    if (move_towards_heart)
    {
        move_timer++;
        if (move_timer == 1)
        {
            snd_play(snd_noise);
            scr_script_repeat(snd_play, 150, 6, 348);
            scr_script_repeat(snd_play, 150, 12, 349);
            obj_homealone_heart.depth = kris_marker.depth + 1000;
            move_up = obj_homealone_heart.y < 134;
            move_right = obj_homealone_heart.y >= 150 && obj_homealone_heart.x > 154;
        }
        if (move_timer >= 1)
        {
            if (obj_homealone_heart.x < 275 && obj_homealone_heart.y < 150)
            {
                var take = false;
                var turn_pos = kris_turn_pos;
                with (kris_marker)
                {
                    obj_homealone_heart.depth = depth + 1000;
                    sprite_index = spr_noellehouse_kitchen_kris_chase_ul;
                    if (obj_homealone_heart.x < turn_pos)
                    {
                        if (x != (obj_homealone_heart.x - 8) || y != (obj_homealone_heart.y - sprite_height))
                        {
                            scr_obj_movetowards_obj(568, 10, -8, -sprite_height);
                        }
                        else
                        {
                            global.interact = 1;
                            take = true;
                        }
                    }
                    else if (x != (obj_homealone_heart.x - 30) || y != (obj_homealone_heart.y - sprite_height))
                    {
                        scr_obj_movetowards_obj(568, 10, -30, -sprite_height);
                    }
                    else
                    {
                        global.interact = 1;
                        take = true;
                    }
                }
                heart_take = take;
                move_towards_heart = !heart_take;
            }
            else
            {
                var first_xpos = (obj_homealone_heart.x < 154) ? 147 : 125;
                var target_ypos = obj_homealone_heart.y - kris_marker.sprite_height;
                if (obj_homealone_heart.image_angle < 0)
                    target_ypos += 6;
                if (!heart_aligned)
                {
                    if (kris_marker.x != first_xpos)
                    {
                        kris_marker.sprite_index = spr_noellehouse_kitchen_kris_chase_dl;
                        with (kris_marker)
                            x = scr_movetowards(x, first_xpos, 6);
                    }
                    else if (kris_marker.y != target_ypos)
                    {
                        if (move_up && kris_marker.sprite_index != spr_noellehouse_kitchen_kris_chase_ul)
                            kris_marker.sprite_index = spr_noellehouse_kitchen_kris_chase_ul;
                        with (kris_marker)
                        {
                            if (y >= 160)
                                depth = 97000;
                            y = scr_movetowards(y, target_ypos, 6);
                        }
                    }
                    else
                    {
                        heart_aligned = true;
                    }
                }
                else
                {
                    obj_homealone_heart.depth = kris_marker.depth + 1000;
                    var take = false;
                    if (move_right)
                    {
                        if (kris_marker.sprite_index != spr_noellehouse_kitchen_kris_chase_dr)
                            kris_marker.sprite_index = spr_noellehouse_kitchen_kris_chase_dr;
                        if (kris_marker.x != (obj_homealone_heart.x - 30))
                        {
                            with (kris_marker)
                                x = scr_movetowards(x, obj_homealone_heart.x - 30, 6);
                        }
                        else
                        {
                            take = true;
                        }
                    }
                    else if (kris_marker.x != (obj_homealone_heart.x - 8))
                    {
                        with (kris_marker)
                            x = scr_movetowards(x, obj_homealone_heart.x - 8, 6);
                    }
                    else
                    {
                        take = true;
                    }
                    heart_take = take;
                    move_towards_heart = !heart_take;
                }
            }
        }
    }
    if (heart_take)
    {
        kris_get = false;
        hit_heart = false;
        var pause = 42;
        heart_take_timer++;
        if (heart_take_timer == 1)
        {
            scr_script_repeat_stop();
            snd_play(snd_noise);
            with (kris_marker)
            {
                image_speed = 0;
                var flip = false;
                if (sprite_index == spr_noellehouse_kitchen_kris_chase_ur || sprite_index == spr_noellehouse_kitchen_kris_chase_dr || sprite_index == spr_noellehouse_kitchen_kris_jump_catch_right)
                    flip = true;
                sprite_index = spr_noellehouse_kitchen_kris_grab_lean;
                if (flip)
                {
                    scr_flip("x");
                    x += 8;
                }
                scr_shakeobj();
            }
        }
        if (heart_take_timer == (4 + pause))
        {
            with (obj_homealone_heart)
                visible = 0;
            snd_play(snd_grab);
            with (kris_marker)
            {
                sprite_index = spr_noellehouse_kitchen_kris_grab_hold;
                scr_shakeobj();
            }
        }
        if (heart_take_timer == (4 + pause + 60))
        {
            with (kris_marker)
            {
                sprite_index = spr_noellehouse_kitchen_kris_turn;
                image_index = 0;
                image_speed = 0;
            }
        }
        if (heart_take_timer == (4 + pause + 60 + 10))
        {
            with (kris_marker)
                image_index = 1;
        }
        if (heart_take_timer == (4 + pause + 60 + 10 + 10))
        {
            with (kris_marker)
                image_index = 2;
        }
        if (heart_take_timer == (4 + pause + 60 + 10 + 10 + 10))
        {
            with (kris_marker)
                image_index = 3;
        }
        if (heart_take_timer == (4 + pause + 60 + 10 + 10 + 10 + 10))
        {
            with (kris_marker)
                image_index = 4;
        }
        if (heart_take_timer >= (4 + pause + 60 + 10 + 10 + 10 + 10 + 30))
            screen_dark = true;
        if (heart_take_timer >= (4 + pause + 60 + 10 + 10 + 10 + 10 + 10 + 30 + 30))
        {
            heart_take = false;
            scr_flag_set(737, 1);
            global.interact = 3;
            global.entrance = 11;
            room_goto(room_lw_noellehouse_main);
            instance_create(0, 0, obj_persistentfadein);
        }
    }
    if (debug_reset)
    {
        debug_reset_timer++;
        if (debug_reset_timer >= 120)
        {
            debug_reset_timer = 0;
            debug_reset = false;
            heart_fall_timer = 0;
            notice_timer = 0;
            hit_heart = false;
            is_noticed = false;
            grab_heart = false;
            finished = false;
            kris_get = false;
            kris_get_timer = 0;
            move_towards_heart = false;
            heart_take = false;
            heart_take_timer = 0;
            move_timer = 0;
            walk_speed = 2;
            kris_face_left = false;
            if (move_right)
            {
                with (kris_marker)
                    scr_flip("x");
            }
            heart_aligned = false;
            move_up = false;
            move_right = false;
            global.interact = 0;
            with (obj_homealone_heart)
            {
                cutscene = 0;
                x = 120;
                y = 120;
                depth = 6000;
                image_angle = 0;
                gravity = 0;
                vspeed = 0;
                hspeed = 0;
                friction = 0;
                visible = 1;
            }
            with (choco_marker)
            {
                bounce_timer = 0;
                bounce = false;
                x = 244;
                y = 156;
                depth = 70000;
                visible = 0;
                image_angle = 0;
                gravity = 0;
                vspeed = 0;
                hspeed = 0;
                friction = 0;
                is_thrown = false;
                with (bounce_bottle)
                    instance_destroy();
            }
            drink_finished = false;
            drink_make_timer = 0;
            drink_track = false;
            cup_marker.visible = 0;
            kris_throw = false;
            kris_throw_timer = 0;
            kris_drink_down = false;
            kris_marker.depth = depth == 98000;
            kris_marker.x = 237;
            kris_marker.y = 129;
            kris_marker.image_xscale = 1;
            kris_marker.sprite_index = spr_noellehouse_kitchen_kris_choco_start_make;
            kris_marker.image_index = 0;
            kris_marker.image_speed = 0;
            screen_dark = false;
        }
    }
}
if (piano_sequence)
{
    if (drink_finished && !piano_play)
    {
        piano_pause_timer++;
        if (piano_pause_timer < 90)
            exit;
        if (!piano_aligned)
        {
            if (kris_marker.x != 140)
            {
                with (kris_marker)
                {
                    scr_depth();
                    if (sprite_index != spr_krisl)
                    {
                        scr_flag_set(787, 2);
                        sprite_index = spr_krisl;
                        x += 15;
                        image_speed = 0.15;
                    }
                    else
                    {
                        x = scr_movetowards(x, 140, 1);
                    }
                }
            }
            else if (kris_marker.y != 170)
            {
                with (kris_marker)
                {
                    if (sprite_index != spr_krisd)
                    {
                        scr_flag_set(787, 3);
                        sprite_index = spr_krisd;
                    }
                    depth = 97000;
                    y = scr_movetowards(y, 170, 1);
                }
            }
            else
            {
                piano_aligned = true;
            }
        }
        else
        {
            var play = false;
            if (kris_marker.sprite_index != spr_krisr)
            {
                scr_flag_set(787, 4);
                kris_marker.sprite_index = spr_krisr;
            }
            if (kris_marker.x != 460)
            {
                with (kris_marker)
                    x = scr_movetowards(x, 460, 1);
            }
            else
            {
                play = true;
            }
            piano_play = play;
        }
    }
    if (piano_play && scr_flag_get(738) < 8)
    {
        piano_timer++;
        if (piano_timer == 30)
        {
            scr_flag_set(738, piano_index + 1);
            var piano_track = piano_playlist[piano_index] + ".ogg";
            piano_song[0] = snd_init(piano_track);
            audio_emitter_position(emitter, -400, 0, 0);
            piano_song[1] = audio_play_sound_on(emitter, piano_song[0], false, 0);
            piano_time = (audio_sound_length(piano_song[1]) * 30) - 30;
        }
        if (piano_timer >= (30 + piano_time))
        {
            if (audio_exists(piano_song[0]))
            {
                if (audio_is_playing(piano_song[0]))
                    snd_free(piano_song[0]);
            }
            piano_index++;
            if (piano_index > (array_length_1d(piano_playlist) - 1))
            {
                scr_flag_set(738, 9);
                piano_play = false;
            }
            else
            {
                piano_timer = 0;
            }
        }
    }
}
