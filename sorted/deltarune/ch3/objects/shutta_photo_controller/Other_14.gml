reticle_over_good_shot = false;
if (place_meeting(x, y, obj_heroparent) || (place_meeting(x, y, obj_shutta_pipehand) && collision_circle(x, y, reticle_size + 60, obj_shutta_pipehand, false, true) && obj_shutta_pipehand.goodshot))
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
            scr_move_to_point_over_time(x + 170, y, 8);
        }
        with (obj_heroparent)
            scr_move_to_point_over_time(x - 170, y, 8);
        pipe1 = instance_create_depth(camerax() + 202, cameray() + 230, depth + 20, obj_shutta_pipe);
        pipe2 = instance_create_depth(camerax() + 322, cameray() + 230, depth + 20, obj_shutta_pipe);
        pipe3 = instance_create_depth(camerax() + 442, cameray() + 230, depth + 20, obj_shutta_pipe);
        if (difficulty == 1)
        {
            if (choose(0, 1) == 1)
            {
                pipe1.type = 1;
                pipe2.type = 2;
                pipe3.type = 1;
            }
            else
            {
                pipe1.type = 2;
                pipe2.type = 1;
                pipe3.type = 2;
            }
        }
        subact_state = "pipes";
        break;
    case "pipes":
        timerb++;
        pipetimer++;
        if ((pipetimer > 20 && difficulty == 0 && !i_ex(obj_shutta_pipehand)) || (pipetimer > 50 && difficulty == 1))
        {
            var pipe_chose = choose(0, 1, 2);
            var type = choose(0, 0, 0, 0, 0, 1, 1, 2, 2, 3);
            if (timerb > 100 && type3alreadyused == false && timer_duration == 200)
                type = 3;
            if (type3alreadyused == false && timer_duration == 100)
                type = 3;
            if (type == 3)
                type3alreadyused = true;
            if (difficulty == 1)
            {
                count++;
                type = 6;
                if (pipe_chose == 1)
                    type = 4;
            }
            hand = instance_create_depth(camerax() + 200, obj_shutta_pipe.y, obj_shutta_pipe.depth + 10, obj_shutta_pipehand);
            hand.type = type;
            if (pipe_chose == 0)
            {
                hand.x = pipe1.x;
                hand.target_pipe = pipe1;
            }
            if (pipe_chose == 1)
            {
                hand.x = pipe2.x;
                hand.target_pipe = pipe2;
            }
            if (pipe_chose == 2)
            {
                hand.x = pipe3.x;
                hand.target_pipe = pipe3;
            }
            pipetimer = -30 + irandom(30);
            if (difficulty == 1)
                pipetimer = -60;
        }
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
        else if (place_meeting(x, y, obj_shutta_pipehand) && collision_circle(x, y, reticle_size + 60, obj_shutta_pipehand, false, true) && obj_shutta_pipehand.goodshot)
        {
            enemy.photosuccessballoon = 1;
            if (obj_shutta_pipehand.type == 3)
            {
                if (enemy.amiabossfight == true)
                    mercygained += 16;
                else
                    mercygained += 75;
            }
            else if (enemy.amiabossfight == true)
            {
                mercygained += 12;
            }
            else
            {
                mercygained += 50;
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
                mercygained += 6;
            else
                mercygained += 25;
            obj_shutta_photo_controller.endmessage = message_badphoto;
            if (enemy.amiabossfight == true)
                obj_shutta_photo_controller.endmessage = message_default;
            if (place_meeting(x, y, obj_shutta_pipehand) && !collision_circle(x, y, reticle_size, obj_shutta_shine, false, true))
            {
                if (enemy.amiabossfight == true)
                    obj_shutta_photo_controller.endmessage = message_notcentered;
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
            with (obj_shutta_pipe)
                con = 2;
        }
        break;
    case "post_capture":
        count = 0;
        with (obj_heroparent)
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
            with (obj_shutta_pipe)
                con = 2;
        }
        break;
}
