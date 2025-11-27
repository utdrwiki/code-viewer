if (!init)
{
    if (i_ex(obj_mainchara))
    {
        init = true;
        var loader = instance_create(0, 0, obj_homealone_vent_loader);
        loader.load_room = 233;
        loader.load_vent = "basement";
    }
    else
    {
        init = true;
    }
}
if (!i_ex(obj_homealone_heart))
    exit;
if (!init_heart)
{
    with (obj_homealone_heart)
        cutscene = 1;
    obj_homealone_heart.depth = overlay.depth + 10;
    init_heart = true;
    with (overlay)
        set_heart_target(568);
    if (scr_sideb_active() && global.plot == 63)
    {
        with (vent_block)
            instance_destroy();
        heart_vent_cover = scr_marker(469, 49, spr_noellehouse_vent_basement_cover);
        vent_cover.visible = 0;
        susie_alone_marker = scr_marker(354, 100, spr_susie_walk_left_lw_lookback);
        with (susie_alone_marker)
            scr_depth();
        susie_alone_anim = true;
        var x_offset = 80;
        var _present_pile = scr_marker(310 + x_offset, 50, spr_noellehouse_basement_present_pile);
        with (_present_pile)
            scr_depth();
        _present_pile = scr_marker(306 + x_offset, 90, spr_noellehouse_basement_present_pile);
        with (_present_pile)
            scr_depth();
        var _present_block = instance_create(338 + x_offset, 50, obj_homealone_solid);
        with (_present_block)
            image_yscale = 1.4;
        _present_block = instance_create(332 + x_offset, 76, obj_homealone_solid);
        with (_present_block)
            image_yscale = 1;
        _present_block = instance_create(336 + x_offset, 86, obj_homealone_solid);
        with (_present_block)
            image_yscale = 1.6;
        _present_block = instance_create(326 + x_offset, 110, obj_homealone_solid);
        with (_present_block)
            image_yscale = 1;
        _present_block = instance_create(332 + x_offset, 130, obj_homealone_solid);
        with (_present_block)
            image_yscale = 1.5;
        with (santa)
            instance_destroy();
        var _susie_convo = instance_create(0, 0, obj_homealone_basement_convo_susie);
        with (_susie_convo)
            start_convo();
        heart_vent_check = true;
        exit;
    }
    else
    {
        breaker_wait = true;
        with (obj_homealone_vent_hidden)
            instance_destroy();
        if (scr_flag_get(7) == 0)
            scr_flag_set(7, 1);
        if (scr_debug())
        {
            if (global.tempflag[90] == 1)
            {
                breaker_wait = false;
                heart_fall_marker.visible = 0;
                angel_marker.visible = 0;
                with (overlay)
                    set_alpha(0.5);
                overlay.angel_target = -4;
                overlay.angel_overlay.visible = 0;
                tree_marker.image_index = 8;
                susie_marker.visible = 0;
                noelle_marker.visible = 0;
                camera_pan = false;
                heart_catch_scene = true;
                global.interact = 1;
                with (convo_controller)
                    instance_destroy();
                camera_set_view_pos(view_get_camera(0), camera_x_pos_left, cameray());
                angel_marker.x = 122;
                angel_marker.y = 132;
            }
        }
    }
}
if (heart_vent_check)
{
    var vent_overlap = false;
    if (point_in_rectangle(obj_homealone_heart.x, obj_homealone_heart.y, 475, 66, 490, 80))
    {
        heart_vent_cover.depth = obj_homealone_heart.depth - 10;
        vent_loader.y = vent_loader.ystart;
        vent_block_top.y = vent_block_top.ystart;
        vent_block_left.y = vent_block_left.ystart;
        vent_block_right.y = vent_block_right.ystart;
    }
    if (point_in_rectangle(obj_homealone_heart.x, obj_homealone_heart.y, 460, 66, 474, 80))
    {
        heart_vent_cover.depth = obj_homealone_heart.depth + 10;
        vent_loader.y = vent_loader.ystart - 100;
        vent_block_top.y = vent_block_top.ystart + 106;
        vent_block_left.y = vent_block_left.ystart - 100;
        vent_block_right.y = vent_block_right.ystart - 100;
    }
    if (point_in_rectangle(obj_homealone_heart.x, obj_homealone_heart.y, 491, 40, 507, 80))
    {
        heart_vent_cover.depth = obj_homealone_heart.depth + 10;
        vent_loader.y = vent_loader.ystart - 100;
        vent_block_top.y = vent_block_top.ystart + 106;
        vent_block_left.y = vent_block_left.ystart - 100;
        vent_block_right.y = vent_block_right.ystart - 100;
    }
    if (susie_alone_anim)
    {
        susie_alone_anim_timer++;
        if (susie_alone_anim_timer < 288)
        {
            if ((susie_alone_anim_timer % 48) == 1)
            {
                susie_alone_marker.sprite_index = spr_susie_walk_left_lw;
                if ((susie_alone_anim_timer % 96) == 1)
                    susie_alone_marker.sprite_index = spr_susie_walk_left_lw_lookback;
            }
        }
        else
        {
            if (susie_alone_anim_timer == 288)
            {
                susie_alone_marker.sprite_index = spr_susie_head_scratch;
                susie_alone_marker.image_speed = 0;
                susie_alone_marker.y -= 2;
            }
            if ((susie_alone_anim_timer % 48) == 1)
            {
                susie_alone_marker.image_speed = 0;
                if ((susie_alone_anim_timer % 96) == 1)
                    susie_alone_marker.image_speed = 0.2;
            }
            if (susie_alone_anim_timer == 576)
            {
                susie_alone_anim_timer = 0;
                susie_alone_marker.sprite_index = spr_susie_walk_left_lw_lookback;
                susie_alone_marker.image_speed = 0;
                susie_alone_marker.image_index = 0;
                susie_alone_marker.y = susie_alone_marker.ystart;
            }
        }
    }
}
if (susie_alone)
{
    if (!d_ex())
        exit;
    susie_alone_timer--;
    if (susie_alone_timer <= 0)
    {
        susie_alone_timer = 900;
        var _convo = susie_convo[susie_convo_index];
        scr_speaker("susie");
        global.fc = 0;
        global.fe = 0;
        msgset(0, _convo);
        var d = d_make();
        d.zurasu = 1;
        d.stay = 5;
    }
    exit;
}
if (!drop_vent_blocked && obj_homealone_heart.y >= 70 && !heart_vent_check)
{
    drop_vent = true;
    drop_vent_blocked = true;
}
if (drop_vent)
{
    drop_vent = false;
    snd_play(snd_wing);
    with (vent_block_left)
        instance_destroy();
    with (vent_block_right)
        instance_destroy();
    with (vent_cover)
    {
        depth = 700000;
        image_index = 1;
        scr_lerpvar("y", y, y + 10, 8, 3, "in");
    }
    start_bgm();
}
if (camera_pan)
{
    camera_set_view_pos(view_get_camera(0), camera_x_pos, cameray());
    if (!camera_pan_active)
    {
        if (obj_homealone_heart.x < 320)
        {
            if (camera_x_pos != camera_x_pos_left)
            {
                camera_pan_active = true;
                scr_lerpvar("camera_x_pos", camera_x_pos, camera_x_pos_left, 30, 3, "out");
                scr_delay_var("camera_pan_active", false, 31);
            }
        }
        else if (camera_x_pos != camera_x_pos_right)
        {
            camera_pan_active = true;
            scr_lerpvar("camera_x_pos", camera_x_pos, camera_x_pos_right, 30, 3, "out");
            scr_delay_var("camera_pan_active", false, 31);
        }
    }
}
if (!convo_active && camera_x_pos == camera_x_pos_left)
{
    convo_timer++;
    if (lost_power || made_noise)
    {
        convo_active = true;
        exit;
    }
    if (convo_timer >= 90)
    {
        convo_active = true;
        with (convo_controller)
            start_convo();
    }
}
if (breaker_wait)
{
    if (present_pushable.x >= 166 || present_pushable.x <= 115)
    {
        breaker_wait_timer++;
        if (breaker_wait_timer == 1)
        {
            open_breaker();
            if (obj_homealone_heart.y < 77)
            {
                snd_play(snd_bump);
                global.interact = 1;
                with (obj_homealone_heart)
                {
                    scr_lerpvar("x", x, x + 60, 12, 3, "out");
                    scr_lerpvar("y", y, y + 30, 12, 3, "out");
                }
            }
        }
        if (breaker_wait_timer == 15)
        {
            if (global.interact == 1 && !flicker_lights)
                global.interact = 0;
            breaker_wait = false;
        }
    }
}
if (breaker_open)
{
    breaker_open_timer++;
    if (breaker_open_timer == 1)
    {
        snd_play(snd_wing);
        with (breaker_marker)
            scr_lerpvar("image_index", 0, 2, 6, 3, "out");
    }
    if (breaker_open_timer == 7)
    {
        breaker_open = false;
        var _breaker = instance_create(breaker_marker.x + 10, breaker_marker.y + 8, obj_homealone_basement_breaker);
        _breaker.image_index = 2;
        _breaker.depth = breaker_marker.depth + 10;
    }
}
if (flicker_lights)
{
    flicker_lights_timer++;
    if (flicker_lights_timer == 1)
    {
        with (overlay)
            set_alpha(0.5);
    }
    if (flicker_lights_timer == flicker_lights_time)
    {
        flicker_lights_count++;
        flicker_lights_time -= 2;
        if (flicker_lights_count > 3)
        {
            flight_lights = false;
        }
        else
        {
            flicker_lights_timer = 0;
            with (overlay)
                set_alpha(0);
        }
    }
}
if (leave_couch)
{
    if (!convo_controller.convo_wait)
        exit;
    leave_couch_timer++;
    if (leave_couch_timer == 1)
    {
        susie_marker.sprite_index = spr_susie_walk_down_lw;
        scr_lerp_var_instance(susie_marker, "y", susie_marker.y, susie_marker.y - 8, 3);
    }
    if (leave_couch_timer == 3)
    {
        noelle_marker.sprite_index = spr_noelle_walk_down_lw;
        scr_lerp_var_instance(noelle_marker, "y", noelle_marker.y, noelle_marker.y - 8, 3);
    }
    if (leave_couch_timer == 4)
    {
        snd_play(snd_wing);
        scr_lerp_var_instance(susie_marker, "y", susie_marker.y, susie_marker.y + 8, 7);
    }
    if (leave_couch_timer == 6)
    {
        snd_play(snd_wing);
        scr_lerp_var_instance(noelle_marker, "y", noelle_marker.y, noelle_marker.y + 9, 7);
    }
    if (leave_couch_timer == 11)
        susie_marker.sprite_index = spr_susie_walk_right_lw;
    if (leave_couch_timer == 13)
        noelle_marker.sprite_index = spr_noelle_walk_left_lw;
    if (leave_couch_timer == 40)
    {
        susie_marker.image_speed = 0.2;
        scr_lerp_var_instance(susie_marker, "x", susie_marker.x, view_wport[0] + 20, 160);
        noelle_marker.sprite_index = spr_noelle_walk_right_lw;
        noelle_marker.image_speed = 0.2;
        scr_lerp_var_instance(noelle_marker, "x", noelle_marker.x, view_wport[0] + 40, 160);
    }
    if (leave_couch_timer >= 105)
    {
        leave_couch = false;
        enable_tree_fall();
    }
}
if (tree_fall)
{
    if (obj_homealone_heart.x < 300)
        exit;
    if (!tree_heart_stop)
    {
        tree_heart_stop = true;
        tree_sprite_timer = 15;
        lose_control();
        with (overlay)
            heart_glow_hide();
        with (obj_homealone_heart)
            visible = 0;
        noelle_marker.sprite_index = spr_noelle_walk_left_flashlight;
        noelle_marker.x = 400;
        noelle_marker.y = 92;
        noelle_marker.depth = boombox.depth - 10;
        noelle_flashlight.x = noelle_marker.x;
        noelle_flashlight.y = noelle_marker.y + 30;
        var no_target = noelle_marker;
        with (noelle_flashlight)
            scr_stickto(no_target, -20);
        overlay.noelle_light_target = noelle_flashlight;
        overlay.noelle_light_mask = 5831;
        susie_marker.sprite_index = spr_susie_walk_left_flashlight;
        susie_marker.x = 394;
        susie_marker.y = 95;
        susie_marker.image_speed = 0;
        susie_flashlight.x = susie_marker.x;
        susie_flashlight.y = susie_marker.y + 26;
        overlay.susie_light_target = susie_flashlight;
        overlay.susie_light_mask = 5831;
        var su_target = susie_marker;
        with (susie_flashlight)
            scr_stickto(su_target, -1);
        susie_marker.image_speed = 0.2;
        scr_lerp_var_instance(susie_marker, "x", susie_marker.x, 354, 30);
        with (susie_marker)
        {
            scr_delay_var("image_index", 0, 31);
            scr_delay_var("image_speed", 0, 31);
            scr_delay_var("sprite_index", 4331, 31);
        }
    }
    tree_sprite_timer--;
    if (tree_sprite_timer <= 0)
    {
        tree_sprite_index++;
        if (tree_sprite_index < array_length(tree_sprite_timestamps))
        {
            tree_sprite_timer = tree_sprite_timestamps[tree_sprite_index] / tree_sprite_modifier;
            tree_marker.image_index = tree_sprite_index;
            var angles = [0, 0, 0, 12, 26];
            var x_offsets = [0, 4, 0, -8, -28];
            if (tree_sprite_index == 1)
                snd_play(snd_wing);
            if (tree_sprite_index < 5)
            {
                angel_marker.x = angel_marker.xstart + x_offsets[tree_sprite_index];
                angel_marker.image_angle = angles[tree_sprite_index];
            }
            else
            {
                heart_fall = true;
                angel_fall = true;
            }
        }
        else
        {
            tree_fall = false;
            start_basement_scene();
        }
    }
}
if (heart_fall)
{
    heart_fall_timer++;
    if (heart_fall_timer == 1)
    {
        snd_play(snd_jump);
        with (heart_fall_marker)
        {
            vspeed = -2;
            hspeed = -10;
            gravity = 1;
            image_angle = 45;
        }
        var _target = heart_fall_marker;
        with (overlay)
        {
            set_heart_target(_target);
            set_fall_mode(true);
        }
    }
    if (heart_fall_timer == 12)
    {
        snd_play(snd_bump);
        with (heart_fall_marker)
        {
            friction = 1;
            gravity = 0;
            vspeed = 0;
        }
    }
    if (heart_fall_timer == 90)
        heart_fall = false;
}
if (angel_fall)
{
    angel_fall_timer++;
    if (angel_fall_timer == 1)
    {
        with (angel_marker)
        {
            depth = 7000;
            vspeed = -4;
            hspeed = -8;
            gravity = 1;
        }
    }
    if (angel_fall_timer == 16)
    {
        with (angel_marker)
        {
            hspeed = -6;
            friction = 1;
        }
    }
    if (angel_fall_timer == 17)
    {
        with (heart_fall_marker)
            visible = 0;
        with (angel_marker)
        {
            gravity = 0;
            vspeed = 0;
            scr_lerpvar("image_angle", image_angle, 0, 12, -2, "out");
        }
        with (overlay)
        {
            set_fall_mode(false);
            set_heart_target(568);
        }
    }
    if (angel_fall_timer == 90)
        angel_fall = false;
}
if (basement_scene)
{
    basement_timer++;
    if (basement_timer == 1)
    {
        overlay.angel_overlay.visible = 0;
        overlay.angel_target = -4;
        noelle_marker.image_speed = 0.2;
        noelle_marker.depth = boombox.depth - 10;
        scr_lerp_var_instance(noelle_marker, "x", noelle_marker.x, 180, 100);
        with (noelle_marker)
        {
            scr_delay_var("image_index", 0, 101);
            scr_delay_var("image_speed", 0, 101);
            scr_delay_var("sprite_index", 1037, 116);
            scr_delay_var("image_speed", 0.1, 116);
        }
        susie_marker.sprite_index = spr_susie_walk_left_flashlight;
        susie_marker.image_speed = 0.2;
        susie_marker.depth = noelle_marker.depth - 10;
        scr_lerp_var_instance(susie_marker, "x", susie_marker.x, 85, 100);
        with (susie_marker)
        {
            scr_delay_var("image_index", 0, 101);
            scr_delay_var("image_speed", 0, 101);
            scr_delay_var("sprite_index", 5846, 131);
            scr_delay_var("image_speed", 0.04, 131);
        }
        angel_marker.depth = susie_marker.depth + 10;
    }
    if (basement_timer == 116)
    {
        with (obj_stickto)
            instance_destroy();
        with (noelle_flashlight)
        {
            scr_stickto_stop();
            image_angle = -25;
            x += 4;
            y -= 6;
        }
    }
    if (basement_timer == 131)
    {
        susie_interactable = instance_create(0, 0, obj_homealone_basement_actor);
        var _target = susie_marker;
        with (susie_interactable)
            init_actor(_target, "susie");
        susie_marker.visible = 0;
        noelle_interactable = instance_create(0, 0, obj_homealone_basement_actor);
        _target = noelle_marker;
        with (noelle_interactable)
            init_actor(_target, "noelle");
        noelle_marker.visible = 0;
        with (susie_flashlight)
        {
            scr_stickto_stop();
            x -= 3;
            y += 8;
        }
        obj_homealone_heart.x = angel_marker.x - 4;
        obj_homealone_heart.y = angel_marker.y - 2;
        obj_homealone_heart.sprite_index = angel_marker.sprite_index;
        obj_homealone_heart.angel_mode = true;
        obj_homealone_heart.visible = 1;
        angel_marker.visible = 0;
        regain_control();
        with (overlay)
            set_angel_mode();
    }
    if (susie_surprise)
    {
        susie_surprise_timer--;
        if (susie_surprise_timer <= 0)
        {
            susie_surprise_index++;
            if (susie_surprise_index < array_length(susie_surprise_timestamps))
            {
                susie_surprise_timer = susie_surprise_timestamps[susie_surprise_index] / 30;
                susie_marker.image_index = susie_surprise_index;
                if (susie_surprise_index == 1)
                {
                    snd_play(snd_sussurprise);
                    susie_flashlight.sprite_index = spr_flashlight_beam_wall_1;
                    susie_flashlight.visible = 1;
                    susie_flashlight.x = susie_marker.x - 2;
                    susie_flashlight.y = susie_marker.y + 34;
                    susie_flashlight.depth = 6010;
                    susie_flashlight.image_angle = 0;
                    overlay.susie_light_mask = 5831;
                }
                if (susie_surprise_index == 2)
                {
                    susie_flashlight.y -= 14;
                    susie_flashlight.x -= 4;
                    susie_flashlight.image_angle = -24;
                }
                if (susie_surprise_index == 3)
                {
                    susie_flashlight.y -= 2;
                    susie_flashlight.x += 2;
                    susie_flashlight.image_angle -= 8;
                }
                if (susie_surprise_index == 4)
                {
                    susie_flashlight.y += 2;
                    susie_flashlight.x -= 2;
                    susie_flashlight.image_angle += 8;
                    if (noelle_surprise)
                        susie_surprise = false;
                }
                if (susie_surprise_index == 5)
                {
                    susie_flashlight.x += 6;
                    susie_flashlight.image_angle -= 24;
                }
                if (susie_surprise_index == 6)
                    susie_flashlight.x += 10;
                if (susie_surprise_index == 7)
                {
                    susie_flashlight.x -= 1;
                    with (overlay)
                        heart_glow_hide();
                    snd_play(snd_hurt1);
                    snd_play(snd_jump);
                    with (obj_homealone_heart)
                        scr_jump_to_point(179, 128, 15, 12);
                    scr_delay_var("noelle_surprise", true, 13);
                }
                if (susie_surprise_index == 8)
                {
                    susie_flashlight.y -= 4;
                    susie_flashlight.x -= 4;
                }
            }
            else
            {
                susie_surprise = false;
            }
        }
    }
    if (susie_face_right)
    {
        susie_face_right = false;
        susie_marker.sprite_index = spr_susie_walk_right_flashlight;
        susie_marker.image_index = 0;
        susie_flashlight.sprite_index = spr_flashlight_beam_ground_right;
        susie_flashlight.x = susie_marker.x - 2;
        susie_flashlight.y = susie_marker.y + 34;
        susie_flashlight.x += 26;
        susie_flashlight.y -= 7;
        susie_flashlight.image_angle = 0;
        susie_flashlight.depth = 6010;
        overlay.susie_light_mask = 3678;
    }
    if (noelle_face_left)
    {
        noelle_face_left = false;
        noelle_marker.sprite_index = spr_noelle_walk_left_flashlight;
        noelle_marker.image_index = 0;
        noelle_flashlight_torch.visible = 0;
        noelle_flashlight.visible = 1;
        noelle_flashlight.sprite_index = spr_flashlight_beam_ground_left;
        noelle_flashlight.image_angle = 0;
        noelle_flashlight.x = noelle_marker.x;
        noelle_flashlight.y = noelle_marker.y + 30;
        overlay.noelle_light_mask = 1407;
    }
    if (noelle_surprise)
    {
        noelle_surprise_timer--;
        if (noelle_surprise_timer <= 0)
        {
            noelle_surprise_index++;
            if (noelle_surprise_index < array_length(noelle_surprise_timestamps))
            {
                if (noelle_surprise_index == 1)
                {
                    snd_play(snd_noelle_scared);
                    if (!leave_basement && susie_surprise_index == 0)
                    {
                        susie_surprise = true;
                        susie_marker.sprite_index = spr_susie_flashlight_surprise;
                        susie_marker.image_index = 0;
                        susie_marker.image_speed = 0;
                    }
                    noelle_marker.sprite_index = spr_noelle_jump_scare;
                    noelle_marker.image_index = 0;
                    noelle_marker.image_speed = 0;
                    noelle_flashlight.sprite_index = spr_flashlight_beam_wall_1;
                    noelle_flashlight.image_angle = 0;
                    noelle_flashlight.x = noelle_marker.x;
                    noelle_flashlight.y = noelle_marker.y + 30;
                    overlay.noelle_light_mask = 5831;
                    noelle_flashlight.depth = 6010;
                }
                noelle_surprise_timer = noelle_surprise_timestamps[noelle_surprise_index] / 30;
                noelle_marker.image_index = noelle_surprise_index;
                if (noelle_surprise_index == 2)
                {
                    if (!leave_basement)
                    {
                        with (overlay)
                            heart_glow_hide();
                        snd_play(snd_bump);
                        with (obj_homealone_heart)
                            scr_jump_to_point(143, 128, 12, 8);
                    }
                    noelle_flashlight.image_angle = -20;
                    noelle_flashlight.y -= 10;
                }
                if (noelle_surprise_index == 3)
                {
                    noelle_flashlight_torch.x = noelle_marker.x + 20;
                    noelle_flashlight_torch.y = noelle_marker.y - 10;
                    noelle_flashlight_torch.visible = 1;
                    noelle_flashlight.image_angle = 0;
                    noelle_flashlight.x = noelle_flashlight_torch.x;
                    noelle_flashlight.y = noelle_flashlight_torch.y;
                    if (!leave_basement)
                    {
                        with (noelle_flashlight)
                        {
                            vspeed = -6;
                            gravity = 1;
                            scr_lerpvar("hspeed", -3, 0, 8);
                            scr_lerpvar("image_angle", 0, -90, 8);
                            scr_delay_var("vspeed", 0, 16);
                            scr_delay_var("gravity", 0, 16);
                        }
                        with (noelle_flashlight_torch)
                        {
                            vspeed = -6;
                            gravity = 1;
                            scr_lerpvar("hspeed", -3, 0, 8);
                            scr_lerpvar("image_angle", 0, -90, 8);
                            scr_delay_var("vspeed", 0, 16);
                            scr_delay_var("gravity", 0, 16);
                        }
                    }
                    else
                    {
                        with (noelle_flashlight)
                        {
                            vspeed = -3;
                            gravity = 1;
                            scr_lerpvar("hspeed", -3, 0, 8);
                            scr_lerpvar("image_angle", 0, -180, 8);
                            scr_delay_var("vspeed", 0, 13);
                            scr_delay_var("gravity", 0, 13);
                            scr_delay_var("y", 136, 13);
                        }
                        with (noelle_flashlight_torch)
                        {
                            vspeed = -3;
                            gravity = 1;
                            scr_lerpvar("hspeed", -3, 0, 8);
                            scr_lerpvar("image_angle", 0, -180, 8);
                            scr_delay_var("vspeed", 0, 13);
                            scr_delay_var("gravity", 0, 13);
                            scr_delay_var("y", 136, 13);
                        }
                    }
                }
                if (noelle_surprise_index == 12)
                {
                    if (!leave_basement)
                    {
                        with (noelle_flashlight_torch)
                        {
                            x += 2;
                            y -= 2;
                        }
                    }
                }
            }
            else
            {
                noelle_surprise = false;
                noelle_surprise_timer = 0;
                noelle_surprise_index = 0;
                noelle_surprise_timer = -60;
                noelle_surprise_index = 0;
                if (!leave_basement)
                    scr_delay_var("progress_scene", true, 16);
            }
        }
    }
    if (progress_scene)
    {
        progress_scene_timer++;
        var _speed = 4;
        if (progress_scene_timer == 1)
        {
            noelle_marker.sprite_index = spr_noelle_jump_scare_transition;
            noelle_marker.image_index = 0;
            with (noelle_flashlight_torch)
                scr_delay_var("visible", 0, _speed);
            with (noelle_marker)
            {
                scr_delay_var("image_index", 1, _speed);
                scr_delay_var("image_index", 2, _speed + _speed);
            }
            with (noelle_flashlight)
            {
                scr_delay_var("image_angle", -60, _speed);
                scr_delay_var("image_angle", -34, _speed + _speed);
            }
        }
        if (progress_scene_timer == (1 + _speed + _speed + _speed))
        {
            progress_scene = false;
            susie_face_right = true;
            noelle_face_left = true;
            regain_control();
            with (overlay)
                set_angel_mode();
            move_wait = true;
            leave_basement = true;
            with (convo_controller)
                final_convo();
        }
    }
    if (leave_basement)
    {
        if (move_wait)
        {
            if (obj_homealone_heart.walk > 0)
            {
                move_count++;
                if (move_count >= 8)
                {
                    lose_control();
                    with (convo_controller)
                        interrupt_convo();
                    susie_marker.depth = obj_homealone_heart.depth - 10;
                    noelle_surprise = true;
                    snd_play(snd_sussurprise);
                    susie_marker.sprite_index = spr_susie_shocked_lw;
                    with (susie_marker)
                        scr_shakeobj();
                    susie_flashlight_torch.x = susie_marker.x + 12;
                    susie_flashlight_torch.y = susie_marker.y + 8;
                    susie_flashlight_torch.image_angle = -180;
                    susie_flashlight_torch.visible = 1;
                    with (susie_flashlight_torch)
                    {
                        scr_lerpvar("image_angle", -180, 0, 15);
                        hspeed = -1;
                        vspeed = -4;
                        gravity = 1;
                        scr_delay_var("hspeed", 0, 12);
                        scr_delay_var("vspeed", 0, 12);
                        scr_delay_var("gravity", 0, 12);
                    }
                    susie_flashlight.x = susie_flashlight_torch.x + 8;
                    susie_flashlight.y = susie_flashlight_torch.y;
                    susie_flashlight.sprite_index = spr_flashlight_beam_wall_1;
                    susie_flashlight.image_angle = -180;
                    with (susie_flashlight)
                    {
                        scr_lerpvar("image_angle", -180, 0, 15);
                        hspeed = -2;
                        vspeed = -4;
                        gravity = 1;
                        scr_delay_var("x", x - 8, 6);
                        scr_delay_var("hspeed", 0, 12);
                        scr_delay_var("vspeed", 0, 12);
                        scr_delay_var("gravity", 0, 12);
                    }
                    overlay.susie_light_mask = 5831;
                    move_wait = false;
                }
            }
        }
        else if (!noelle_surprise)
        {
            leave_basement = false;
            with (convo_controller)
                instance_destroy();
            susie_marker.sprite_index = spr_susie_walk_right_fast;
            susie_marker.image_speed = 0.4;
            scr_lerp_var_instance(susie_marker, "x", susie_marker.x, view_wport[0] + 20, 100);
            noelle_marker.sprite_index = spr_noelle_walk_look_back_right;
            noelle_marker.image_speed = 0.4;
            scr_lerp_var_instance(noelle_marker, "x", noelle_marker.x, view_wport[0] + 40, 100);
            angel_marker.x = obj_homealone_heart.x + 4;
            angel_marker.y = obj_homealone_heart.y + 2;
            angel_marker.visible = 1;
            obj_homealone_heart.visible = 0;
            scr_delay_var("heart_catch_scene", true, 8);
        }
    }
}
if (heart_catch_scene)
{
    if (heart_catch_con == 0)
    {
        heart_catch_con = 50;
        scr_losechar();
        cutscene_master = scr_cutscene_make();
        scr_maincharacters_actors();
        su = actor_count + 1;
        su_actor = instance_create(360, 96, obj_actor);
        scr_actor_setup(su, su_actor, "susie");
        su_actor.sprite_index = spr_susie_walk_left_candy_cane;
        no = actor_count + 2;
        no_actor = instance_create(340, 92, obj_actor);
        scr_actor_setup(no, no_actor, "noelle");
        no_actor.sprite_index = spr_noelle_walk_left_pan_hold;
        with (angel_marker)
            scr_jump_to_point(119, 128, 8, 12);
        angel_marker.depth = 98500;
        angel_marker.image_xscale = -1;
        with (overlay)
            heart_glow_hide();
        c_snd_play(snd_bump);
        c_wait(100);
        c_sel(su);
        c_autowalk(0);
        c_imagespeed(0.2);
        c_walkdirect(190, su_actor.ystart, 160);
        c_delaycmd(161, "imagespeed", 0);
        c_delaycmd(161, "imageindex", 0);
        c_sel(no);
        c_autowalk(0);
        c_imagespeed(0.2);
        c_walkdirect_wait(175, no_actor.ystart, 150);
        c_halt();
        c_wait(30);
        c_speaker("susie");
        c_msgsetloc(0, "\\El* Okay^1, ready to kill. I got a cane..^1. You.../", "obj_noellehouse_basement_slash_Step_0_gml_1269_0");
        c_msgnextloc("\\EC* ..^1. You're gonna beat it to death with a cookie pan?/", "obj_noellehouse_basement_slash_Step_0_gml_1270_0");
        c_facenext("noelle", 2);
        c_msgnextloc("\\E2* N-no^1! No^1, I'm just going to.../%", "obj_noellehouse_basement_slash_Step_0_gml_1272_0");
        c_talk_wait();
        c_sel(su);
        c_sprite(spr_susie_walk_left_candy_cane_surprise);
        c_sel(no);
        c_autowalk(0);
        c_imagespeed(0.2);
        c_walkdirect_wait(164, no_actor.ystart, 30);
        c_halt();
        c_wait(30);
        c_imagespeed(0.2);
        c_walkdirect_wait(144, no_actor.ystart, 30);
        c_halt();
        c_wait(30);
        c_imagespeed(0.1);
        c_walkdirect_wait(138, no_actor.ystart, 30);
        c_halt();
        c_wait(30);
        c_sprite(spr_noelle_walk_left_pan_hold_sigh);
        c_wait(30);
        c_sprite(spr_noelle_walk_left_pan_hold);
        c_imagespeed(0.4);
        c_walkdirect_wait(124, no_actor.ystart, 8);
        c_halt();
        c_snd_play(snd_wing);
        c_sel(no);
        c_autowalk(0);
        c_sprite(spr_noelle_pan_pick_up);
        c_imagespeed(0.2);
        c_wait(15);
        c_var_instance(angel_marker, "visible", 0);
        c_imagespeed(0);
        c_wait(30);
        c_sel(no);
        c_sprite(spr_noelle_angel_hold_walk_right);
        c_halt();
        c_sel(su);
        c_sprite(spr_susie_walk_left_candy_cane_surprise);
        c_walkdirect(202, su_actor.y, 16);
        c_imageindex(1);
        c_wait(4);
        c_imageindex(2);
        c_wait(4);
        c_imageindex(3);
        c_wait(4);
        c_imageindex(0);
        c_wait(4);
        c_speaker("susie");
        c_msgsetloc(0, "\\E7* Huh? Dude^1, you got guts!/", "obj_noellehouse_basement_slash_Step_0_gml_1337_0");
        c_facenext("noelle", 17);
        c_msgnextloc("\\EH* There's probably just like.../", "obj_noellehouse_basement_slash_Step_0_gml_1339_0");
        c_msgnextloc("\\EI* A mouse underneath it^1, right?/", "obj_noellehouse_basement_slash_Step_0_gml_1340_0");
        c_msgnextloc("\\E4* It's..^1. nothing to be afraid of./%", "obj_noellehouse_basement_slash_Step_0_gml_1341_0");
        c_talk_wait();
        c_sel(su);
        c_sprite(spr_susie_walk_left_candy_cane);
        c_walkdirect(190, su_actor.y, 16);
        c_imageindex(1);
        c_wait(4);
        c_imageindex(2);
        c_wait(4);
        c_imageindex(3);
        c_wait(4);
        c_imageindex(0);
        c_wait(4);
        c_speaker("susie");
        c_msgsetloc(0, "\\E6* Damn.../%", "obj_noellehouse_basement_slash_Step_0_gml_1357_0");
        c_talk_wait();
        c_wait(15);
        c_sel(no);
        c_sprite(spr_noelle_angel_hold_walk_right);
        c_imagespeed(0.2);
        c_walkdirect_speed(360, no_actor.ystart, 2);
        c_wait(4);
        c_sel(su);
        c_sprite(spr_susie_walk_right_candy_cane);
        c_imagespeed(0.2);
        c_walkdirect_speed(340, su_actor.ystart, 2);
        c_var_lerp_to_instance(blackall, "image_alpha", 1, 90);
        c_wait(120);
        c_waitcustom();
    }
    if (heart_catch_con == 50 && customcon == 1 && !d_ex())
    {
        heart_catch_con = -1;
        global.plot = 65;
        room_goto(room_lw_noellehouse_main);
    }
}
