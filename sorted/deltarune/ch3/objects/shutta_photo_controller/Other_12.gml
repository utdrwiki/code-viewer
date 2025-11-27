var _center_x = (camerax() + (camerawidth() / 2)) - 20;
var _center_y = cameray() + 120;
switch (subact_state)
{
    case "init":
        with (enemy)
        {
            x = xstart;
            y = ystart;
            jumping = true;
            sprite_index = spr_shutta_idle;
            image_speed = 0.16666666666666666;
        }
        enemy_jump_side = 0;
        enemy_jump_height = 100;
        enemy_x = 0;
        enemy_y = 0;
        enemy_tx = 0;
        enemy_ty = 0;
        enemy_duration = 0;
        enemy_time = -1;
        subact_state = "intro";
        break;
    case "intro":
        enemy_duration = 15;
        timerb++;
        if (timerb <= enemy_duration)
        {
            enemy.x = ease_inout_sine(enemy_time, enemy.xstart, _center_x - 20 - enemy.xstart, enemy_duration);
            enemy.y = ease_inout_sine(enemy_time, enemy.ystart, _center_y - enemy.ystart, enemy_duration);
        }
        if (timerb >= (enemy_duration + 5))
        {
            posesiner++;
            if (posesiner == 1)
                savex = enemy.x;
            enemy.x = savex + (sin(posesiner / 6) * 80);
        }
        if (timerb == posemax)
        {
            enemy.sprite_index = spr_shutta_pose;
            enemy.image_index = 0;
            enemy.image_speed = 0.5;
            enemy_x = enemy.x;
            enemy_y = enemy.y;
            subact_state = "pose";
            enemy_time = -1;
            timerb = 0;
        }
        break;
    case "pose":
        timerb++;
        if (timerb == 14)
            instance_create(enemy.x + 12, enemy.y + 90, obj_shutta_shine);
        if (timerb == 30)
            enemy.image_speed = 0;
        if (timerb == 42)
        {
            enemy.sprite_index = spr_shutta_pose_return;
            enemy.image_index = 0;
            enemy.image_speed = 0.5;
        }
        if (timerb == 51)
        {
            subact_state = "posewait";
            enemy_time = -1;
            enemy.sprite_index = spr_shutta_idle;
            enemy.image_speed = 0.16666666666666666;
            timerb = 0;
        }
        break;
    case "posewait":
        break;
    case "capture":
        if (got_kris && closest_hero == "kris")
        {
            enemy.photosuccesscount++;
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
            enemy.photosuccesscount++;
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
            enemy.photosuccesscount++;
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
        else if (enemy.sprite_index == spr_shutta_pose && enemy.image_index >= 7 && place_meeting(x, y, enemy) && collision_circle(x, y, reticle_size, obj_shutta_shine, false, true))
        {
            if (enemy.amiabossfight == true)
            {
                if (fastphoto)
                    mercygained += 12;
                else
                    mercygained += 12;
            }
            else
            {
                mercygained += 100;
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
                if (fastphoto)
                    mercygained += 6;
                else
                    mercygained += 6;
            }
            else if (fastphoto)
            {
                mercygained += 50;
            }
            else
            {
                mercygained += 50;
            }
            obj_shutta_photo_controller.endmessage = message_badphoto;
            if ((place_meeting(x, y, enemy) && !collision_circle(x, y, reticle_size, obj_shutta_shine, false, true)) || !place_meeting(x, y, enemy))
            {
                if (enemy.amiabossfight == true)
                    obj_shutta_photo_controller.endmessage = message_notcentered;
            }
            else if (enemy.amiabossfight == true)
            {
                obj_shutta_photo_controller.endmessage = message_unposed;
            }
        }
        break;
    case "post_capture":
        with (enemy)
        {
            x = xstart;
            y = ystart;
            jumping = false;
            sprite_index = spr_shutta_idle;
            image_yscale = 2;
        }
        break;
}
enemy_time++;
