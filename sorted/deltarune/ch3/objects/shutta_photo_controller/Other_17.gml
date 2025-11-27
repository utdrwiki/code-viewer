var _lancer = -1;
if (i_ex(obj_lancergotchi))
    _lancer = 1543;
switch (subact_state)
{
    case "init":
        with (enemy)
        {
            x = xstart;
            y = ystart;
            sprite_index = spr_shutta_idle;
            image_speed = 0.16666666666666666;
        }
        with (obj_monsterparent)
            scr_move_to_point_over_time(x + 180, y, 8);
        with (obj_heroparent)
            scr_move_to_point_over_time(x - 180, y, 8);
        if (difficulty == 0)
        {
            lancer = instance_create(camerax() + 300, cameray() + 300, obj_lancergotchi);
            lancer.depth = depth + 1;
            lancer.y = cameray() + 180;
        }
        if (difficulty == 1)
        {
            var rand = choose(0, 1, 2, 3);
            lancer = instance_create(camerax() + 100, cameray() + 300, obj_lancergotchi);
            lancer.depth = depth + 1;
            lancer.y = cameray() + 180;
            if (rand != 0)
            {
                with (lancer)
                    event_user(0);
            }
            lancer = instance_create(camerax() + 200, cameray() + 300, obj_lancergotchi);
            lancer.depth = depth + 1;
            if (rand != 1)
            {
                with (lancer)
                    event_user(0);
            }
            lancer = instance_create(camerax() + 300, cameray() + 300, obj_lancergotchi);
            lancer.depth = depth + 1;
            if (rand != 2)
            {
                with (lancer)
                    event_user(0);
            }
            lancer = instance_create(camerax() + 400, cameray() + 300, obj_lancergotchi);
            lancer.depth = depth + 1;
            if (rand != 3)
            {
                with (lancer)
                    event_user(0);
            }
            with (obj_lancergotchi)
                x = camerax() + 100 + random(300);
        }
        subact_state = "lancer";
        break;
    case "lancer":
        timerb++;
        if (timer == timer_duration)
        {
            subact_state = "post_capture";
            enemy.sprite_index = spr_shutta_idle;
            enemy.image_speed = 0.16666666666666666;
            timerb = 0;
        }
        break;
    case "capture":
        subact_state = "post_capture";
        if (got_kris && closest_hero == "kris")
        {
            endmessage = message_nicephoto;
            if (enemy.amiabossfight == true)
            {
                obj_shutta_photo_controller.endmessage = message_kris;
                if (global.flag[513] > 0)
                    obj_shutta_photo_controller.endmessage = message_kris2;
            }
            global.flag[513] = 1;
        }
        else if (got_susie && closest_hero == "susie")
        {
            endmessage = message_nicephoto;
            if (enemy.amiabossfight == true)
            {
                obj_shutta_photo_controller.endmessage = message_susie;
                if (global.flag[514] > 0)
                    obj_shutta_photo_controller.endmessage = message_susie2;
            }
            global.flag[514] = 1;
        }
        else if (got_ralsei && closest_hero == "ralsei")
        {
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
        else if (place_meeting(x, y, _lancer) && collision_circle(x, y, reticle_size + 33, _lancer, false, true) && _lancer.sprite_index == spr_ch3_dw_shutta_lancer_tongue)
        {
            enemy.photosuccessballoon = 1;
            if (enemy.amiabossfight == true)
            {
                if (powerphoto)
                    mercygained += 10;
                mercygained += 10;
            }
            else
            {
                if (powerphoto)
                    mercygained += 20;
                mercygained += 80;
            }
            if (!i_ex(obj_shutta_text))
            {
                var _comment = instance_create(x, y, obj_shutta_text);
                _comment.text = comment_center;
                _comment.color = c_yellow;
            }
            obj_shutta_photo_controller.endmessage = message_nicephoto;
            if (enemy.amiabossfight == true)
                obj_shutta_photo_controller.endmessage = message_nicephoto2;
        }
        else
        {
            if (enemy.amiabossfight == true)
            {
                if (powerphoto)
                    mercygained += 6;
                mercygained += 6;
            }
            else
            {
                if (powerphoto)
                    mercygained += 25;
                mercygained += 25;
            }
            obj_shutta_photo_controller.endmessage = message_badphoto;
            if (enemy.amiabossfight == true)
                obj_shutta_photo_controller.endmessage = message_unposed;
            if (!collision_circle(x, y, reticle_size + 35, _lancer, false, true))
            {
                if (enemy.amiabossfight == true)
                    obj_shutta_photo_controller.endmessage = message_default;
            }
        }
        count = 0;
        with (obj_heroparent)
            scr_move_to_point_over_time(xstart, y, 3);
        with (enemy)
        {
            scr_move_to_point_over_time(xstart, ystart, 3);
            timerb = 0;
            pipetimer = 0;
            sprite_index = spr_shutta_idle;
        }
        with (obj_lancergotchi)
            delaydeath = 2;
        break;
    case "post_capture":
        count = 0;
        with (obj_heroparent)
        {
            x = xstart;
            y = ystart;
        }
        with (obj_monsterparent)
        {
            x = xstart;
            y = ystart;
        }
        with (enemy)
        {
            x = xstart;
            y = ystart;
            timerb = 0;
            pipetimer = 0;
            sprite_index = spr_shutta_idle;
        }
        with (obj_lancergotchi)
            delaydeath = 2;
        break;
        with (obj_lancergotchi)
            delaydeath = 2;
}
