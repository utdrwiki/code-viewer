event_inherited();
if (obj_heart.press_u || obj_heart.press_d || obj_heart.press_l || obj_heart.press_r)
{
    if (!active)
    {
        instance_destroy();
        if (creatorid != -1)
        {
            with (creatorid)
            {
                idlesprite = spr_holywater_alarm;
                awake = true;
            }
        }
        snd_play(snd_rocket);
        global.turntimer = 180;
        with (obj_dbulletcontroller)
        {
            if (variable_instance_exists(id, "alm_activated"))
                alm_activated = true;
        }
        var eye_list = ds_list_create();
        with (obj_bullet_almond)
        {
            active = true;
            activated = true;
            image_blend = c_white;
            image_alpha = 1;
            if (irandom(1))
                my_dir = scr_at_player(x, y) + irandom_range(-30, 30);
            else
                my_dir = point_direction(x, y, obj_growtangle.x + irandom_range(-70, 70), obj_growtangle.y + irandom_range(-70, 70));
            direction = my_dir;
            speed = 0.5;
            alarm[0] = 3;
            gravity_direction = my_dir;
            friction = -0.15;
            ds_list_add(eye_list, id);
        }
        ds_list_shuffle(eye_list);
        if (ds_list_size(eye_list) > (5 + danger_level))
        {
            repeat (ds_list_size(eye_list) - (5 + danger_level))
            {
                with (ds_list_find_value(eye_list, 0))
                {
                    my_dir = scr_at_player(x, y) + 180 + irandom_range(-30, 30);
                    direction = my_dir;
                    gravity_direction = my_dir;
                }
                ds_list_delete(eye_list, 0);
            }
        }
        if (ds_list_size(eye_list))
        {
            ds_list_find_value(eye_list, 0).my_dir = scr_at_player(ds_list_find_value(eye_list, 0).x, ds_list_find_value(eye_list, 0).y);
            ds_list_find_value(eye_list, 0).direction = ds_list_find_value(eye_list, 0).my_dir;
            ds_list_find_value(eye_list, 0).gravity_direction = ds_list_find_value(eye_list, 0).my_dir;
        }
        ds_list_destroy(eye_list);
    }
}
if (active)
    event_user(1);
