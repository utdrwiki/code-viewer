if (i_ex(obj_shutta_palm_outoftree))
{
    if (obj_shutta_palm_outoftree.angle == 0)
    {
        if (x < (obj_shutta_palm_outoftree.x + 150) && x > (obj_shutta_palm_outoftree.x - 40) && y > (obj_shutta_palm_outoftree.y - 60) && y < (obj_shutta_palm_outoftree.y + 60))
        {
            if (obj_shutta_palm_outoftree.image_index >= 3)
                obj_shutta_palm_outoftree.goodphoto = true;
        }
        else
        {
            obj_shutta_palm_outoftree.goodphoto = false;
        }
    }
    if (obj_shutta_palm_outoftree.angle == 90)
    {
        if (x < (obj_shutta_palm_outoftree.x + 60) && x > (obj_shutta_palm_outoftree.x - 60) && y < (obj_shutta_palm_outoftree.y + 40) && y > (obj_shutta_palm_outoftree.y - 150))
        {
            if (obj_shutta_palm_outoftree.image_index >= 3)
                obj_shutta_palm_outoftree.goodphoto = true;
        }
        else
        {
            obj_shutta_palm_outoftree.goodphoto = false;
        }
    }
    if (obj_shutta_palm_outoftree.angle == 180)
    {
        if (x > (obj_shutta_palm_outoftree.x - 150) && x < (obj_shutta_palm_outoftree.x + 40) && y > (obj_shutta_palm_outoftree.y - 60) && y < (obj_shutta_palm_outoftree.y + 60))
        {
            if (obj_shutta_palm_outoftree.image_index >= 3)
                obj_shutta_palm_outoftree.goodphoto = true;
        }
        else
        {
            obj_shutta_palm_outoftree.goodphoto = false;
        }
    }
    if (obj_shutta_palm_outoftree.image_index < 3)
        obj_shutta_palm_outoftree.goodphoto = false;
}
reticle_over_good_shot = false;
if (place_meeting(x, y, obj_heroparent) || (i_ex(obj_shutta_palm_outoftree) && obj_shutta_palm_outoftree.goodphoto) || (i_ex(obj_shutta_car_outoftree) && place_meeting(x, y, obj_shutta_car_outoftree)))
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
        palm1 = instance_create_depth(camerax() + 250, cameray() + 250, depth + 20, obj_shutta_palm);
        palm2 = instance_create_depth(camerax() + 410, cameray() + 250, depth + 20, obj_shutta_palm);
        subact_state = "palms";
        break;
    case "palms":
        if (timer < (timer_duration - 70) && !i_ex(obj_shutta_palm_outoftree) && !i_ex(obj_shutta_car_outoftree))
        {
            var palm_chose = choose(0, 1);
            var angle = choose(0, 180);
            if (difficulty == 1)
                angle = choose(0, 90, 180);
            var type = choose(0, 0, 0, 0, 0, 1, 1, 2, 2, 3);
            count++;
            if (count == 1 && difficulty == 0)
            {
                if (choose(0, 1) == 0)
                {
                    palm_chose = 0;
                    angle = 0;
                    type = 0;
                    fun = 0;
                }
                else
                {
                    palm_chose = 1;
                    angle = 180;
                    type = 0;
                    fun = 1;
                }
            }
            if (count == 1 && difficulty == 1)
                angle = 90;
            if (count == 2)
            {
                if (fun == 1)
                {
                    palm_chose = 0;
                    angle = 0;
                    type = 0;
                }
                else
                {
                    palm_chose = 1;
                    angle = 180;
                    type = 0;
                }
            }
            if (count == 3)
            {
                palm_chose = choose(0, 1);
                type = 3;
            }
            if (count == 4)
                type = 2;
            if (difficulty == 1)
            {
                if (palm_chose == 0 && angle == 0)
                    angle = 180;
                if (palm_chose == 1 && angle == 180)
                    angle = 0;
            }
            if (type == 3)
            {
                if (palm_chose == 0)
                {
                    car = instance_create_depth(palm1.x - 20, obj_shutta_palm.y - 48, palm1.depth + 2, obj_shutta_car_outoftree);
                    car.side = 1;
                    car.destinationx = palm2.x - 30;
                    car.hspeed = 12;
                }
                if (palm_chose == 1)
                {
                    car = instance_create_depth(palm2.x + 20, obj_shutta_palm.y - 48, palm1.depth + 2, obj_shutta_car_outoftree);
                    car.side = -1;
                    car.image_xscale = -1.4;
                    car.destinationx = palm1.x + 30;
                    car.hspeed = -12;
                }
            }
            else
            {
                shutta = instance_create_depth(x, obj_shutta_palm.y - 48, obj_shutta_palm.depth + 10, obj_shutta_palm_outoftree);
                shutta.angle = angle;
                if (palm_chose == 0)
                {
                    shutta.x = palm1.xstart;
                    if (angle == 90)
                        shutta.y = palm1.ystart - 120;
                }
                if (palm_chose == 1)
                {
                    shutta.x = palm2.xstart;
                    if (angle == 90)
                        shutta.y = palm2.ystart - 120;
                }
            }
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
        else if ((i_ex(obj_shutta_palm_outoftree) && obj_shutta_palm_outoftree.goodphoto) || (i_ex(obj_shutta_car_outoftree) && place_meeting(x, y, obj_shutta_car_outoftree)))
        {
            enemy.photosuccessballoon = 1;
            if (enemy.amiabossfight == true)
            {
                if (fastphoto)
                    mercygained += 10;
                else
                    mercygained += 10;
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
                    mercygained += 3;
                else
                    mercygained += 3;
            }
            else if (fastphoto)
            {
                mercygained += 25;
            }
            else
            {
                mercygained += 25;
            }
            obj_shutta_photo_controller.endmessage = message_badphoto;
            if (enemy.amiabossfight == true)
                obj_shutta_photo_controller.endmessage = message_default;
            if (place_meeting(x, y, obj_shutta_palm_outoftree))
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
            palmtimer = 0;
            sprite_index = spr_shutta_idle;
            with (obj_shutta_pipe)
                con = 2;
        }
        break;
    case "post_capture":
        count = 0;
        with (obj_heroparent)
        {
            scr_move_to_point_over_time(xstart, y, 8);
            x = xstart;
            y = ystart;
        }
        with (enemy)
        {
            scr_move_to_point_over_time(xstart, ystart, 8);
            x = xstart;
            y = ystart;
            timerb = 0;
            palmtimer = 0;
            sprite_index = spr_shutta_idle;
            with (obj_shutta_palm)
                con = 2;
        }
        break;
}
