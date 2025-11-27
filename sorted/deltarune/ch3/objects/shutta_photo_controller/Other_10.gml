reticle_over_good_shot = false;
if (place_meeting(x, y, obj_shutta_falling_item) && obj_shutta_falling_item.sprite_index == spr_realisticexplosion && obj_shutta_falling_item.image_index > 2 && obj_shutta_falling_item.image_index < 13)
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
        with (obj_monsterparent)
            scr_move_to_point_over_time(x + 180, y, 8);
        with (obj_heroparent)
        {
            if (object_index != obj_herosusie)
                scr_move_to_point_over_time(x - 180, y, 8);
        }
        last_item_x = 0;
        last_item_y = 0;
        last_item = -4;
        susie_walk_time = 0;
        susie_walk_duration = 0;
        subact_state = "create_item";
        obj_herosusie.state = 0;
        global.faceaction[obj_herosusie.myself] = 0;
        break;
    case "create_item":
        var _gap = 70;
        var _gap_width = 2;
        var _gap_height = 3;
        var _min_x = (camerax() + (camerawidth() / 2)) - 50;
        var _min_y = cameray() + 90;
        var _xx, _yy;
        do
        {
            _xx = _min_x + (irandom(_gap_width) * _gap);
            _yy = _min_y + (irandom(_gap_height) * _gap);
        }
        until ((_xx != last_item_x && _yy != last_item_y) && !position_meeting(_xx, _yy - 10, obj_herosusie));
        if (_yy < (cameray() + 140))
            _yy = cameray() + 140;
        last_item_x = _xx;
        last_item_y = _yy;
        last_item = instance_create_depth(last_item_x, last_item_y, depth, obj_shutta_falling_item);
        susie_target_x = last_item_x - 100;
        susie_target_y = last_item_y - 90;
        susie_walk_time = 0;
        susie_walk_duration = floor(point_distance(obj_herosusie.x, obj_herosusie.y, susie_target_x, susie_target_y) / 10);
        subact_state = "susie_move";
        break;
    case "susie_move":
        if (last_item.falling)
            break;
        if (susie_walk_time == 0)
        {
            if (last_item_x > obj_herosusie.x)
                scr_battle_sprite_set("susie", spr_susie_walk_right_dw, 0.5, true);
            else
                scr_battle_sprite_set("susie", spr_susie_walk_left_dw, 0.5, true);
            with (obj_herosusie)
                scr_move_to_point_over_time(other.susie_target_x, other.susie_target_y, other.susie_walk_duration);
        }
        susie_walk_time++;
        if (susie_walk_time == (susie_walk_duration - 2))
        {
            instance_create_depth(last_item.x - 20, last_item.y - 10, last_item.depth - 10, obj_shutta_shine);
            with (obj_shutta_shine)
                image_blend = c_red;
        }
        if (susie_walk_time == susie_walk_duration)
        {
            scr_battle_sprite_set("susie", spr_susie_attack, 0.5, false);
            with (last_item)
            {
                event_user(0);
                if (!i_ex(obj_shutta_shine))
                {
                    instance_create(x - 20, y - 10, obj_shutta_shine);
                    with (obj_shutta_shine)
                        image_blend = c_red;
                }
            }
            subact_state = "susie_attack";
        }
        break;
    case "susie_attack":
        if (obj_herosusie.sprite_index != spr_susie_attack)
            subact_state = "create_item";
        break;
    case "capture":
        with (obj_shutta_falling_item)
        {
            if (!place_meeting(x, y, obj_shutta_photo_controller))
            {
                if (other.got_kris && other.closest_hero == "kris")
                {
                    endmessage = other.message_nicephoto;
                    if (other.enemy.amiabossfight == true)
                    {
                        obj_shutta_photo_controller.endmessage = obj_shutta_photo_controller.message_kris;
                        if (global.flag[513] > 0)
                            obj_shutta_photo_controller.endmessage = obj_shutta_photo_controller.message_kris2;
                    }
                    global.flag[513] = 1;
                }
                else if (other.got_susie && other.closest_hero == "susie")
                {
                    endmessage = other.message_nicephoto;
                    if (other.enemy.amiabossfight == true)
                    {
                        obj_shutta_photo_controller.endmessage = obj_shutta_photo_controller.message_susie;
                        if (global.flag[514] > 0)
                            obj_shutta_photo_controller.endmessage = obj_shutta_photo_controller.message_susie2;
                    }
                    global.flag[514] = 1;
                }
                else if (other.got_ralsei && other.closest_hero == "ralsei")
                {
                    endmessage = other.message_nicephoto;
                    if (other.enemy.amiabossfight == true)
                    {
                        if (global.flag[515] == 0)
                            obj_shutta_photo_controller.endmessage = obj_shutta_photo_controller.message_ralsei;
                        if (global.flag[515] > 0)
                            obj_shutta_photo_controller.endmessage = obj_shutta_photo_controller.message_ralsei2;
                    }
                    global.flag[515] = 1;
                }
            }
            else if (sprite_index == spr_realisticexplosion && image_index > 2 && image_index < 13)
            {
                scr_battle_sprite_set("susie", spr_susie_attack, 0, false);
                obj_herosusie.image_index = 1;
                var _cx = x - 40;
                var _cy = y;
                with (obj_shutta_photo_controller)
                {
                    uncentered_subject = false;
                    offside_subject = false;
                    if (collision_circle(x, y, reticle_size + 60, obj_shutta_shine, false, true))
                    {
                        var _comment = instance_create(x, y, obj_shutta_text);
                        _comment.text = comment_center;
                        _comment.color = c_yellow;
                        endmessage = message_splendidphoto;
                        if (enemy.amiabossfight == true)
                            endmessage = message_toilet2;
                        if (enemy.amiabossfight == true)
                        {
                            if (powerphoto)
                                mercygained += 10;
                            mercygained += 10;
                        }
                        else
                        {
                            mercygained += 100;
                        }
                        enemy.photosuccessballoon = 1;
                    }
                    else
                    {
                        offside_subject = true;
                        endmessage = message_badphoto;
                        if (enemy.amiabossfight == true)
                            endmessage = message_unposed;
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
                    }
                }
                break;
            }
            else
            {
                if (sprite_index == spr_item_toilet)
                {
                    obj_shutta_photo_controller.endmessage = obj_shutta_photo_controller.message_unposed;
                    if (other.enemy.amiabossfight == true)
                        obj_shutta_photo_controller.endmessage = obj_shutta_photo_controller.message_toilet;
                }
                else
                {
                    obj_shutta_photo_controller.endmessage = obj_shutta_photo_controller.message_badphoto;
                    if (obj_shutta_photo_controller.enemy.amiabossfight == true)
                        obj_shutta_photo_controller.endmessage = obj_shutta_photo_controller.message_unposed;
                }
                if (other.enemy.amiabossfight == true)
                {
                    if (other.powerphoto)
                        other.mercygained += 6;
                    other.mercygained += 6;
                }
                else
                {
                    if (other.powerphoto)
                        other.mercygained += 20;
                    other.mercygained += 25;
                }
            }
        }
        with (obj_heroparent)
        {
            if (object_index == obj_heroralsei || object_index == obj_herokris)
            {
                x = xstart;
                y = ystart;
            }
        }
        with (enemy)
        {
            scr_move_to_point_over_time(xstart, ystart, 8);
            x = xstart;
            y = ystart;
        }
        break;
    case "post_capture":
        with (obj_heroparent)
        {
            if (object_index == obj_heroralsei || object_index == obj_herokris)
            {
                x = xstart;
                y = ystart;
            }
        }
        with (obj_monsterparent)
        {
            scr_move_to_point_over_time(xstart, ystart, 8);
            x = xstart;
            y = ystart;
        }
        instance_destroy(obj_shutta_falling_item);
        instance_destroy(obj_shutta_falling_item_piece);
        instance_destroy(obj_move_to_point);
        scr_battle_sprite_reset("susie");
        with (obj_herosusie)
        {
            x = xstart;
            y = ystart;
        }
        break;
}
