var _trueshutta = -1;
if (i_ex(obj_shutta_nobyact_shutta) && image_alpha >= 1)
{
    for (var i = 0; i < instance_number(obj_shutta_nobyact_shutta); i++)
    {
        _lg[i] = instance_find(obj_shutta_nobyact_shutta, i);
        if (_lg[i].facing == 1 && _lg[i].sprite_index == spr_shutta_jump)
            _trueshutta = _lg[i];
    }
}
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
        rotating_controller = instance_create(x, y - 60, obj_shutta_nobyacttest);
        rotating_controller.difficulty = difficulty;
        rotating_controller.type = 2;
        subact_state = "rotate";
        break;
    case "rotate":
        timerb++;
        pipetimer++;
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
        else if (_trueshutta != -1 && place_meeting(x, y, _trueshutta) && collision_circle(x, y, reticle_size + 40, _trueshutta, false, true))
        {
            with (obj_shutta_enemy)
                acedrotationphoto = true;
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
                obj_shutta_photo_controller.endmessage = stringsetloc("* Wrong! No! I need a picture of Shutta's SMILE!!", "obj_shutta_photo_controller_slash_Other_18_gml_125_0");
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
        with (obj_shutta_nobyacttest)
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
        with (obj_shutta_nobyacttest)
            delaydeath = 2;
        break;
}
