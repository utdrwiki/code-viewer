var _center_x = (camerax() + (camerawidth() / 2)) - 20;
var _center_y = cameray() + 120;
reticle_over_good_shot = false;
if (place_meeting(x, y, obj_heroparent))
    reticle_over_good_shot = true;
switch (subact_state)
{
    case "init":
        subact_state = "intro";
        krs_time = -1;
        krs_duration = 0;
        krs_got_funny = false;
        pattern = 0;
        pattern_prev = -1;
        pattern_reverse = false;
        k_path = -1;
        s_path = -1;
        s_flip_h = -1;
        s_flip_v = -1;
        with (obj_herokris)
        {
            x = xstart;
            y = ystart;
        }
        with (obj_herosusie)
        {
            x = xstart;
            y = ystart;
        }
        with (obj_heroralsei)
        {
            x = xstart;
            y = ystart;
        }
        with (enemy)
        {
            x = xstart;
            y = ystart;
            sprite_index = spr_shutta_idle;
            image_speed = 0.16666666666666666;
            scr_move_to_point_over_time(x + 170, y, 8);
        }
        break;
    case "intro":
        krs_duration = 10;
        if (krs_time == 0)
        {
            scr_battle_sprite_set("kris", spr_krisr_dark, 0.5, true);
            with (obj_herokris)
                scr_move_to_point_over_time(_center_x, _center_y - 2, other.krs_duration);
            scr_battle_sprite_set("susie", spr_susie_walk_right_dw, 0.5, true);
            with (obj_herosusie)
                scr_move_to_point_over_time(_center_x - 50, _center_y - 12 - 6, other.krs_duration);
            scr_battle_sprite_set("ralsei", spr_ralsei_walk_right, 0.5, true);
            with (obj_heroralsei)
                scr_move_to_point_over_time(_center_x + 40, _center_y - 8, other.krs_duration);
        }
        if (krs_time >= krs_duration)
        {
            krs_got_funny = true;
            krs_time = -1;
            subact_state = "final_lerp";
            scr_battle_sprite_set("ralsei", spr_ralsei_funnyface, 0, true);
            obj_heroralsei.image_index = 2;
            scr_battle_sprite_set("kris", spr_krisd_dark, 0, true);
            scr_battle_sprite_set("susie", spr_susie_walk_down_dw, 0, true);
        }
        break;
    case "choose_pattern":
        break;
    case "lerp_to_pattern":
        krs_duration = 7;
        if (krs_time == 0)
        {
            var _k_px = (_center_x - 25) + path_get_x(k_path, pattern_reverse);
            var _k_py = _center_y + path_get_y(k_path, pattern_reverse);
            var _s_px = (_center_x - 25) + (path_get_x(s_path, pattern_reverse) * s_flip_h);
            var _s_py = (_center_y - 12) + (path_get_y(s_path, pattern_reverse) * s_flip_v);
            if (point_distance(obj_herokris.x, obj_herokris.y, _k_px, _k_py) < 5 && point_distance(obj_herosusie.x, obj_herosusie.y, _s_px, _s_py) < 5)
            {
                krs_time = krs_duration;
            }
            else
            {
                scr_battle_sprite_set("kris", spr_krisd_dark, 0, true);
                with (obj_herosusie)
                    scr_move_to_point_over_time(_s_px, _s_py, other.krs_duration);
            }
        }
        if (krs_time >= krs_duration)
        {
            krs_time = -1;
            subact_state = "pattern";
        }
        break;
    case "pattern":
        krs_duration = 15;
        if (s_path == 27)
            krs_duration = 15;
        if (s_path == 7)
            krs_duration = 30;
        if (s_path == 24)
            krs_duration = 45;
        if (s_path == 25)
            krs_duration = 15;
        var _path_pos = krs_time / krs_duration;
        if (pattern_reverse)
            _path_pos = 1 - _path_pos;
        obj_herosusie.x = (_center_x - 25) + (path_get_x(s_path, _path_pos) * s_flip_h);
        obj_herosusie.y = (_center_y - 12) + (path_get_y(s_path, _path_pos) * s_flip_v);
        if (krs_time >= krs_duration)
        {
            pattern_prev = pattern;
            subact_state = "pose";
            krs_time = -1;
        }
        break;
    case "pose":
        krs_duration = 10;
        if (krs_time == 0)
        {
            switch (pattern)
            {
                case 0:
                    scr_battle_sprite_set("susie", spr_susie_pose, 0, true);
                    break;
                case 1:
                    obj_herokris.x += 40;
                    obj_herokris.y += 2;
                    obj_herosusie.y += 2;
                    scr_battle_sprite_set("kris", spr_kris_susie_faceaway_flipped, 0, true);
                    scr_battle_sprite_set("susie", spr_nothing, 0, true);
                    break;
                case 2:
                    scr_battle_sprite_set("susie", spr_susie_dance, 0, true);
                    break;
                case 3:
                    scr_battle_sprite_set("susie", spr_susie_chomp, 0, true);
                    break;
            }
        }
        if (krs_time >= krs_duration)
            subact_state = "choose_pattern";
        break;
    case "final_lerp":
        krs_duration = 2;
        if (krs_time == 0)
        {
        }
        if (krs_time >= krs_duration)
        {
            with (obj_herokris)
                scr_move_to_point_over_time(_center_x - 6, _center_y, other.krs_duration);
            with (obj_herosusie)
                scr_move_to_point_over_time(_center_x - 54, _center_y - 14, other.krs_duration);
            krs_time = -1;
            subact_state = "final_pose";
        }
        break;
    case "final_pose":
        if (krs_time == 0)
        {
            scr_battle_sprite_set("ralsei", spr_ralsei_funnyface, 0, true);
            obj_heroralsei.image_index = 0;
            obj_heroralsei.image_index = 1;
            obj_herosusie.x -= 2;
            scr_battle_sprite_set("susie", spr_susie_funnyface, 0, true);
            obj_herosusie.depth = obj_heroralsei.depth + 1;
            obj_herosusie.image_index = 1;
            scr_battle_sprite_set("kris", spr_nothing, 0, true);
        }
        break;
    case "capture":
        if (krs_got_funny)
        {
            scr_battle_sprite_set("ralsei", spr_ralsei_funnyface2, 0, true);
            scr_battle_sprite_set("susie", spr_susie_funnyface, 0, true);
            obj_herosusie.image_index = 2;
        }
        if (got_kris && got_susie && got_ralsei)
        {
            enemy.photosuccessballoon = 1;
            enemy.endcon = 1;
            with (obj_battlecontroller)
                noreturn = 1;
            endmessage = message_splendidphoto;
            if (enemy.amiabossfight == true)
                obj_shutta_photo_controller.endmessage = stringsetloc("* Aw, the whole family! ... Mike, add me in there later!", "obj_shutta_photo_controller_slash_Other_11_gml_255_0");
            enemy.photosuccesscount++;
            if (enemy.amiabossfight == true)
            {
                if (powerphoto)
                    mercygained += 20;
                else
                    mercygained += 20;
            }
            else
            {
                mercygained += 100;
            }
            if (krs_got_funny)
            {
                var _comment = instance_create(x, y, obj_shutta_text);
                _comment.text = comment_center;
                _comment.color = c_yellow;
            }
        }
        else if ((got_kris && !got_susie && !got_ralsei) && global.flag[513] == 0)
        {
            enemy.photosuccesscount++;
            if (enemy.amiabossfight == true)
            {
                if (powerphoto)
                    mercygained += 12;
                mercygained += 12;
            }
            else
            {
                if (powerphoto)
                    mercygained += 50;
                mercygained += 50;
            }
            endmessage = message_nicephoto;
            if (enemy.amiabossfight == true)
            {
                obj_shutta_photo_controller.endmessage = message_kris;
                if (global.flag[513] > 0)
                    obj_shutta_photo_controller.endmessage = message_kris2;
            }
            global.flag[513] = 1;
        }
        else if ((!got_kris && got_susie && !got_ralsei) && global.flag[514] == 0)
        {
            enemy.photosuccesscount++;
            if (enemy.amiabossfight == true)
            {
                if (powerphoto)
                    mercygained += 12;
                mercygained += 12;
            }
            else
            {
                if (powerphoto)
                    mercygained += 50;
                mercygained += 50;
            }
            endmessage = message_nicephoto;
            if (enemy.amiabossfight == true)
            {
                obj_shutta_photo_controller.endmessage = message_susie;
                if (global.flag[514] > 0)
                    obj_shutta_photo_controller.endmessage = message_susie2;
            }
            global.flag[514] = 1;
        }
        else if ((!got_kris && !got_susie && got_ralsei) && global.flag[515] == 0)
        {
            enemy.photosuccesscount++;
            if (enemy.amiabossfight == true)
            {
                if (powerphoto)
                    mercygained += 12;
                mercygained += 12;
            }
            else
            {
                if (powerphoto)
                    mercygained += 50;
                mercygained += 50;
            }
            endmessage = message_nicephoto;
            if (enemy.amiabossfight == true)
            {
                if (global.flag[515] == 0)
                    obj_shutta_photo_controller.endmessage = message_ralsei;
                if (global.flag[515] > 0)
                    obj_shutta_photo_controller.endmessage = message_ralsei2;
            }
            global.flag[515] = 1;
        }
        else if ((got_kris && got_susie && !got_ralsei) || (got_kris && !got_susie && got_ralsei) || (!got_kris && got_susie && got_ralsei) || (got_kris && !got_susie && !got_ralsei) || (!got_kris && got_susie && !got_ralsei) || (!got_kris && !got_susie && got_ralsei))
        {
            enemy.photosuccesscount++;
            if (enemy.amiabossfight == true)
            {
                if (powerphoto)
                    mercygained += 12;
                mercygained += 12;
            }
            else
            {
                if (powerphoto)
                    mercygained += 50;
                mercygained += 50;
            }
            endmessage = message_nicephoto;
            if (enemy.amiabossfight == true)
                obj_shutta_photo_controller.endmessage = message_unposed;
        }
        else
        {
            endmessage = message_badphoto;
            if (enemy.amiabossfight == true)
                obj_shutta_photo_controller.endmessage = message_notcentered;
            enemy.photosuccesscount++;
            mercygained += 8;
            if (powerphoto)
                mercygained += 8;
        }
        with (enemy)
            scr_move_to_point_over_time(xstart, ystart, 8);
        break;
    case "post_capture":
        with (enemy)
        {
            scr_move_to_point_over_time(xstart, ystart, 8);
            x = xstart;
            y = ystart;
        }
        instance_destroy(obj_move_to_point);
        scr_battle_sprite_reset("susie");
        scr_battle_sprite_reset("kris");
        scr_battle_sprite_reset("ralsei");
        with (obj_herosusie)
        {
            x = xstart;
            y = ystart;
        }
        with (obj_herokris)
        {
            x = xstart;
            y = ystart;
        }
        with (obj_heroralsei)
        {
            x = xstart;
            y = ystart;
        }
        break;
}
krs_time++;
if (subact_state == "lerp_to_pattern" || subact_state == "pattern" || subact_state == "final_lerp")
{
    with (obj_herokris)
    {
        if (xprevious != x || yprevious != y)
        {
            var _spr;
            if ((abs(xprevious - x) + 2) > abs(yprevious - y))
                _spr = (xprevious < x) ? spr_krisr_dark : spr_krisl_dark;
            else
                _spr = (yprevious < y) ? spr_krisd_dark : spr_krisu_dark;
            if (sprite_index != _spr)
                scr_battle_sprite_set("kris", _spr, 0.25, true);
        }
        depth = obj_heroralsei.depth + (obj_heroralsei.y - y);
    }
    with (obj_herosusie)
    {
        if (xprevious != x || yprevious != y)
        {
            var _spr;
            if ((abs(xprevious - x) + 2) > abs(yprevious - y))
                _spr = (xprevious < x) ? spr_susie_walk_right_dw : spr_susie_walk_left_dw;
            else
                _spr = (yprevious < y) ? spr_susie_walk_down_dw : spr_susie_walk_up_dw;
            if (sprite_index != _spr)
                scr_battle_sprite_set("susie", _spr, 0.25, true);
        }
        depth = obj_heroralsei.depth + (obj_heroralsei.y - (y + 8));
    }
}
