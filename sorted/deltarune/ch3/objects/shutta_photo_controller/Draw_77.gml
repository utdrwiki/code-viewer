introtimer++;
var _continue = 0;
if (i_ex(obj_shutta_enemy) && (obj_shutta_enemy.photoactcount == 2 || obj_shutta_enemy.photoactcount == 6) && rotatingvar == false)
{
}
else if (image_alpha < 1)
{
    if (introtimer == 1)
    {
        x = camerax() + (camerawidth() / 2);
        y = cameray() + 160;
    }
    if (obj_shutta_enemy.photoactcount != 1 && obj_shutta_enemy.photoactcount != 5 && subact != "rotation")
        image_alpha += 0.1;
    else if (introtimer > 10)
        image_alpha += 0.1;
    else
        timer = 0;
    var _size_factor = ease_out_back(image_alpha, 0, 1, 1);
    width = lerp(min_width, max_width, _size_factor);
    height = lerp(min_height, max_height, _size_factor);
    mercygained = 0;
}
if (state == "aiming")
{
    timer++;
    if (i_ex(obj_shutta_nobyact_shutta) && obj_shutta_nobyact_shutta.con != 0 && obj_shutta_nobyact_shutta.con != 2 && timer > (timer_duration - 6))
        timer = timer_duration - 6;
    if (timer >= timer_duration)
    {
        if (subact != "tvs")
        {
            tookaphoto = false;
            state = "capture";
            snd_play(snd_error);
        }
        else
        {
            obj_tenna_enemy.minigamefailcount += obj_shutta_nobyacttest.smilecount;
            obj_shutta_nobyacttest.smilecount = 0;
        }
    }
    with (obj_shutta_shine)
        image_alpha = 0;
    if (button1_p() && subact != "tvs" && introtimer > 35)
    {
        state = "capture";
        endmessage = message_default;
        flash_alpha = 1.2;
        subjects = [];
        snd_play_volume(snd_camera_flash, 0.8);
        uncentered_subject = false;
        offside_subject = false;
        have_subject = false;
        var _comment = -4;
        if (got_kris || got_susie || got_ralsei)
        {
            have_subject = true;
            var _avg_x = 0;
            var _avg_y = 0;
            var _hero_num = 0;
            with (obj_heroparent)
            {
                if (!place_meeting(x, y, obj_shutta_photo_controller))
                    continue;
                var _cx = (x - sprite_xoffset) + (sprite_width / 2);
                var _cy = (y - sprite_yoffset) + (sprite_height / 2);
                _avg_x += _cx;
                _avg_y += _cy;
                with (obj_shutta_photo_controller)
                {
                    if (!point_in_rectangle(_cx, _cy, x - (width / 2), y - (height / 2), x + (width / 2), y + (height / 2)))
                        offside_subject = true;
                }
                _hero_num++;
            }
            _avg_x /= _hero_num;
            _avg_y /= _hero_num;
            if (got_kris && subact != "krs")
                scr_battle_sprite_set("kris", spr_kris_peace, 0, 0);
            if (got_susie && (subact != "susieitems" && subact != "krs"))
                scr_battle_sprite_set("susie", spr_susie_pose, 0, 0);
            if (got_ralsei && subact != "krs")
                scr_battle_sprite_set("ralsei", spr_ralsei_pose, 0, 0);
        }
        subact_state = "capture";
        switch (subact)
        {
            case "susieitems":
                event_user(0);
                break;
            case "krs":
                event_user(1);
                break;
            case "enemyjump":
                event_user(2);
                break;
            case "pipes":
                event_user(4);
                break;
            case "palms":
                event_user(5);
                break;
            case "free":
                event_user(6);
                break;
            case "lancer":
                event_user(7);
                break;
            case "rotation":
                event_user(8);
                break;
            case "ralsei":
                event_user(9);
                break;
            case "tvs":
                event_user(10);
                break;
            case "bullets":
                event_user(11);
                break;
        }
    }
}
switch (state)
{
    case "intro":
        if (introtimer == 10)
        {
            if (i_ex(obj_herosusie))
            {
                if (i_ex(obj_heroralsei))
                {
                    difficulty = 0;
                    if (obj_shutta_enemy.photoactcount == 1)
                        subact = "free";
                    if (obj_shutta_enemy.photoactcount == 2)
                        subact = "rotation";
                    if (obj_shutta_enemy.photoactcount == 3)
                        subact = "lancer";
                    if (obj_shutta_enemy.photoactcount == 4)
                        subact = "susieitems";
                    if (obj_shutta_enemy.photoactcount == 5)
                        subact = "ralsei";
                    if (obj_shutta_enemy.photoactcount == 6)
                    {
                        subact = "rotation";
                        if (obj_shutta_enemy.acedrotationphoto == true)
                            difficulty = 1;
                    }
                    if (obj_shutta_enemy.photoactcount == 7)
                        subact = "lancer";
                    if (obj_shutta_enemy.photoactcount == 8)
                        subact = "krs";
                }
            }
            else
            {
                subact = scr_weighted_choice("enemyjump", 1);
            }
            if (i_ex(obj_tenna_enemy))
                subact = "tvs";
            debug_message("chose subact: " + subact);
            subact_state = "init";
            state = "aiming";
            timer = 0;
        }
        break;
    case "aiming":
        break;
    case "capture":
        if (tookaphoto == true)
        {
            surface_free(photo_surface);
            if (!surface_exists(photo_surface))
                photo_surface = surface_create(photo_width, photo_height);
            surface_set_target(photo_surface);
            draw_clear_alpha(c_black, 1);
            surface_copy_part(photo_surface, 0, 0, application_surface, x - camerax() - (photo_width / 2), y - cameray() - (photo_height / 2), photo_width, photo_height);
            surface_reset_target();
            if (screenshot != -1)
                sprite_delete(screenshot);
            screenshot = sprite_create_from_surface(photo_surface, 0, 0, photo_width, photo_height, 0, 0, 0, 0);
        }
        scr_battle_sprite_reset("kris");
        scr_battle_sprite_reset("noelle");
        scr_battle_sprite_reset("ralsei");
        scr_battle_sprite_reset("susie");
        filter1.x = -9999;
        filter1.y = -9999;
        filter2.x = -9999;
        filter2.y = -9999;
        filter3.x = -9999;
        filter3.y = -9999;
        filter4.x = -9999;
        filter4.y = -9999;
        instance_destroy(obj_shutta_photo_sprite);
        subact_state = "post_capture";
        switch (subact)
        {
            case "susieitems":
                event_user(0);
                break;
            case "krs":
                event_user(1);
                break;
            case "enemyjump":
                event_user(2);
                break;
            case "pipes":
                event_user(4);
                break;
            case "palms":
                event_user(5);
                break;
            case "free":
                event_user(6);
                break;
            case "lancer":
                event_user(7);
                break;
            case "rotation":
                event_user(8);
                break;
            case "ralsei":
                event_user(9);
                break;
            case "tvs":
                event_user(10);
                break;
            case "bullets":
                event_user(11);
                break;
        }
        if (tookaphoto == true)
        {
            if (mercygained > 100)
                mercygained = 100;
            debug_message("mercy gained: " + string(mercygained));
            with (obj_monsterparent)
            {
                if (image_alpha != 0)
                    scr_mercyadd(myself, other.mercygained);
            }
        }
        if (tookaphoto == false)
        {
            with (obj_shutta_text)
                instance_destroy();
            endmessage = stringsetsubloc("* UUMM!! Maybe actually&press ~1 to take a photo&next time?", scr_get_input_name(4), "obj_shutta_photo_controller_slash_Draw_77_gml_175_0");
        }
        slide_time = 0;
        state = "result";
        break;
    case "result":
        if (slide_time == 0)
        {
            instance_destroy(obj_writer);
            if (global.mercymod[obj_shutta_enemy.myself] >= 100 && obj_shutta_enemy.amiabossfight)
            {
                msgset(0, endmessage + "/%");
                if (obj_shutta_enemy.amiabossfight)
                {
                    scr_speaker("tenna");
                    with (obj_face)
                        instance_destroy();
                    global.fc = 22;
                    global.typer = 80;
                    scr_battletext();
                }
                else
                {
                    scr_battletext_default();
                }
                obj_shutta_enemy.endcon = 1;
            }
            else
            {
                msgset(0, endmessage + "/%");
                if (obj_shutta_enemy.amiabossfight)
                {
                    scr_speaker("tenna");
                    with (obj_face)
                        instance_destroy();
                    global.fc = 22;
                    global.typer = 80;
                    scr_battletext();
                }
                else
                {
                    scr_battletext_default();
                }
            }
        }
        slide_duration = 20;
        if (slide_time < slide_duration)
            slide_time++;
        x = camerax() + (camerawidth() / 2);
        y = ease_out_back(slide_time, cameray() + cameraheight(), -280, slide_duration);
        angle = ease_out_back(slide_time, -50, 60, slide_duration);
        if (flash_alpha <= 0)
        {
            if (button1_p())
            {
                with (obj_shutta_text)
                    con = 2;
                state = "outro";
                slide_time = 0;
            }
        }
        break;
    case "outro":
        slide_duration = 10;
        if (slide_time < slide_duration)
        {
            slide_time++;
        }
        else
        {
            if (endmessage == message_ralsei && ralseicon == 0)
            {
                points_display = instance_create(0, 0, obj_dw_points_fake_ui);
                with (points_display)
                {
                    xx -= 0;
                    yy -= 60;
                    alarm[0] = 60;
                }
                with (points_display)
                    display_points(100);
                with (points_display)
                    show_point_increase();
                ralseicon = 1;
            }
            if (ralseicon == 1 && !i_ex(obj_dw_points_fake_ui))
                ralseicon = 2;
            if (endmessage == message_ralsei && ralseicon < 2)
                exit;
            instance_destroy();
            if (i_ex(obj_growtangle) && obj_growtangle.growcon != 3)
                obj_growtangle.growcon = 3;
        }
        x = camerax() + (camerawidth() / 2);
        y = ease_in_sine(slide_time, (cameray() + cameraheight()) - 280, 280, slide_duration);
        break;
}
image_xscale = width / 32;
image_yscale = height / 32;
if (state == "aiming")
{
    x += ((right_h() - left_h()) * 10);
    y += ((down_h() - up_h()) * 10);
    x = clamp(x, camerax() + 100, (camerax() + camerawidth()) - 100);
    y = clamp(y, cameray() + 80, cameray() + 256);
    switch (subact)
    {
        case "susieitems":
            event_user(0);
            break;
        case "krs":
            event_user(1);
            break;
        case "enemyjump":
            event_user(2);
            break;
        case "pipes":
            event_user(4);
            break;
        case "palms":
            event_user(5);
            break;
        case "free":
            event_user(6);
            break;
        case "lancer":
            event_user(7);
            break;
        case "rotation":
            event_user(8);
            break;
        case "ralsei":
            event_user(9);
            break;
        case "tvs":
            event_user(10);
            break;
        case "bullets":
            event_user(11);
            break;
    }
}
