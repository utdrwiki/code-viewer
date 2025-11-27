reticle_over_good_shot = false;
if (place_meeting(x, y, obj_heroparent) || (place_meeting(x, y, obj_shutta_enemy) && collision_circle(x, y, reticle_size + 40, obj_shutta_enemy, false, true)))
    reticle_over_good_shot = true;
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
        subact_state = "wait";
        break;
    case "wait":
        break;
    case "capture":
        subact_state = "post_capture";
        obj_shutta_photo_controller.endmessage = message_default;
        if (got_kris && closest_hero == "kris")
        {
            enemy.photosuccessballoon = 1;
            if (enemy.amiabossfight == true)
            {
                obj_shutta_photo_controller.endmessage = message_kris;
                if (global.flag[513] > 0)
                    obj_shutta_photo_controller.endmessage = message_kris2;
            }
            global.flag[513] = 1;
            if (powerphoto)
                mercygained += 10;
            mercygained += 10;
            if (!i_ex(obj_shutta_text))
            {
                var _comment = instance_create(x, y, obj_shutta_text);
                _comment.text = comment_center;
                _comment.color = c_yellow;
            }
        }
        else if (got_susie && closest_hero == "susie")
        {
            enemy.photosuccessballoon = 1;
            if (enemy.amiabossfight == true)
            {
                obj_shutta_photo_controller.endmessage = message_susie;
                if (global.flag[514] > 0)
                    obj_shutta_photo_controller.endmessage = message_susie2;
            }
            global.flag[514] = 1;
            if (powerphoto)
                mercygained += 10;
            mercygained += 10;
            if (!i_ex(obj_shutta_text))
            {
                var _comment = instance_create(x, y, obj_shutta_text);
                _comment.text = comment_center;
                _comment.color = c_yellow;
            }
        }
        else if (got_ralsei && closest_hero == "ralsei")
        {
            enemy.photosuccessballoon = 1;
            if (enemy.amiabossfight == true)
            {
                if (global.flag[515] == 0)
                    obj_shutta_photo_controller.endmessage = message_ralsei;
                if (global.flag[515] > 0)
                    obj_shutta_photo_controller.endmessage = message_ralsei2;
            }
            global.flag[515] = 1;
            if (powerphoto)
                mercygained += 10;
            mercygained += 10;
            if (!i_ex(obj_shutta_text))
            {
                var _comment = instance_create(x, y, obj_shutta_text);
                _comment.text = comment_center;
                _comment.color = c_yellow;
            }
        }
        else if (place_meeting(x, y, obj_shutta_enemy) && collision_circle(x, y, reticle_size + 40, obj_shutta_enemy, false, true))
        {
            enemy.photosuccessballoon = 1;
            if (obj_shutta_enemy.amiabossfight == true)
            {
                if (powerphoto)
                    mercygained += 10;
                mercygained += 10;
            }
            else
            {
                if (powerphoto)
                    mercygained += 25;
                mercygained += 25;
            }
            if (!i_ex(obj_shutta_text))
            {
                var _comment = instance_create(x, y, obj_shutta_text);
                _comment.text = comment_center;
                _comment.color = c_yellow;
            }
            obj_shutta_photo_controller.endmessage = message_nicephoto;
            if (obj_shutta_enemy.amiabossfight == true)
                obj_shutta_photo_controller.endmessage = message_nicephoto2;
        }
        else
        {
            mercygained += 6;
        }
        break;
    case "post_capture":
        break;
}
