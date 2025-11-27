with (obj_mike_controller)
{
    if (!__usable)
        exit;
    with (obj_juggle_collision)
    {
        var angle = point_direction(other.mx, other.my, obj_mike_controller.x, obj_mike_controller.y);
        x = other.mx + lengthdir_x(20, angle + 180);
        y = other.my + lengthdir_y(20, angle + 180);
    }
    if (!battle_active)
        other.depth = 200;
    else
        other.depth = -6;
    if (global.interact > 0 && !battle_active)
    {
        if (scr_mouse_leftrelease())
            obj_mike_hand.buffered_release = true;
        else if (scr_mouse_leftclick())
            obj_mike_hand.buffered_release = false;
    }
    if (global.interact == 2)
        exit;
    if (!battle_active && instance_number(obj_micmenu) == 0 && !i_ex(obj_dialoguer))
    {
        var ob = -1;
        var ob2 = -1;
        if (i_ex(obj_mouse_drawer) && mx > obj_mouse_drawer.bbox_left && mx < obj_mouse_drawer.bbox_right && my > obj_mouse_drawer.bbox_top && my < obj_mouse_drawer.bbox_bottom && obj_mouse_drawer.act < 3)
            ob2 = 651;
        if (i_ex(obj_mouse_hat))
        {
            var _li = ds_list_create();
            ob = -4;
            collision_rectangle_list(mx - 10, my - 30, mx + 10, my + 10, obj_mouse_hat, false, true, _li, false);
            for (var i = 0; i < ds_list_size(_li); i++)
            {
                if (ds_list_find_value(_li, i).pickable && (ob == -4 || ob.depth > ds_list_find_value(_li, i).depth))
                    ob = ds_list_find_value(_li, i);
            }
            ds_list_destroy(_li);
            if (i_ex(ob))
            {
                with (ob)
                {
                    if (!can_hat)
                    {
                        var _check = 0;
                        switch (sprite_index)
                        {
                            case spr_mike_s:
                                _check = 1;
                                break;
                            case spr_mike_l:
                                _check = 2;
                                break;
                            case spr_mike_m:
                                _check = 3;
                                break;
                        }
                        with (obj_mike_minigame_tv)
                        {
                            lastmike = _check;
                            minigame = _check;
                        }
                    }
                }
            }
        }
        with (obj_treasure_room)
        {
            if (image_index == 1 && global.interact == 0)
            {
                var _o = instance_create(x, y, obj_mouse_hat);
                with (_o)
                {
                    linked_char = -1;
                    speed = 0;
                    gravity = 0;
                    sprite_index = other.sprite_index;
                    image_index = 1;
                    scr_depth();
                }
                instance_destroy();
            }
        }
        if (ob && global.interact == 0)
        {
            if (!scr_mouse_left() && !scr_mouse_leftclick())
            {
                if (my > (ob.y + 30 + ob.yoff))
                    hand_type = 6;
                else
                    hand_type = 6;
            }
            else
            {
                hand_type = 2;
            }
            if (scr_mouse_leftclick())
            {
                with (ob)
                    ob = unstack_hat(ob);
                with (ob)
                {
                    act = 1;
                    linked_char = -1;
                    speed = 0;
                    gravity = 0;
                }
                hand_type = 2;
                hand_target = ob;
            }
        }
        else if (ob2 && global.interact == 0)
        {
            if (my < (ob2.y + (20 + ob2.yy)) && my > ((ob2.y + ob2.yy) - 20))
            {
                if (ob2.act == 2)
                {
                    with (obj_mike_controller)
                    {
                        if (scr_mouse_left())
                            hand_type = 6;
                        else
                            hand_type = 6;
                    }
                }
                else if (ob2.act < 2)
                {
                    hand_type = 1;
                }
                if (scr_mouse_leftclick())
                {
                    with (ob2)
                    {
                        if (act == 2)
                        {
                            act = 3;
                            snd_play(snd_item);
                            var bighat = instance_create(obj_mike_controller.mx, obj_mike_controller.my, obj_mouse_hat);
                            with (bighat)
                            {
                                type = 0;
                                scale = 1;
                                act = 1;
                                image_index = 5;
                            }
                            with (obj_mike_controller)
                            {
                                hand_type = 2;
                                hand_target = bighat;
                            }
                        }
                    }
                }
            }
            else if (ob2.act < 2 && my < (ob2.y + (100 + ob2.yy)) && my > (ob2.y + (50 + ob2.yy)))
            {
                if (hand_type != 2)
                {
                    if (ob2.act == 0)
                        hand_type = 1;
                }
                if ((hand_type != 2 || hand_target == ob2) && (scr_mouse_left() || obj_mike_hand.buffered_release))
                {
                    with (ob2)
                    {
                        act = 1;
                        other.hand_type = 2;
                    }
                }
            }
            else
            {
                ob2 = false;
            }
        }
        if (!ob && !ob2)
        {
            if ((room == room_dw_castle_tv_zone_3 && obj_mouse_drawer.act != 1) || room != room_dw_castle_tv_zone_3)
            {
                if (hand_type == 1 || hand_type == 6)
                    hand_type = 0;
            }
        }
        with (obj_mouse_hat)
        {
            if (act == 1)
            {
                depth = obj_mike_hand.depth + 1;
                x = other.mx - (10 * image_xscale);
                y = other.my;
            }
        }
        if ((scr_mouse_leftrelease() || obj_mike_hand.buffered_release) && global.interact == 0)
        {
            obj_mike_hand.buffered_release = false;
            with (obj_mouse_drawer)
            {
                if (act == 1)
                    act = 0;
            }
            with (obj_mouse_hat)
            {
                ob = -4;
                if (act == 1)
                {
                    with (obj_caterpillarchara)
                    {
                        var yy = 0;
                        with (obj_mouse_hat)
                        {
                            if (linked_char == other.id)
                                yy = 20 * array_length(spritestack);
                        }
                        if (collision_rectangle(bbox_left, y - yy, bbox_right, bbox_bottom, other, 0, 0))
                        {
                            if (ob == -4 || ob.depth > depth)
                                ob = id;
                        }
                    }
                    with (obj_mainchara)
                    {
                        var yy = 0;
                        with (obj_mouse_hat)
                        {
                            if (linked_char == other.id)
                                yy = 20 * array_length(spritestack);
                        }
                        if (collision_rectangle(bbox_left, y - yy, bbox_right, bbox_bottom, other, 0, 0))
                        {
                            if (ob == -4 || ob.depth > depth)
                                ob = id;
                        }
                    }
                    if (can_hat)
                    {
                        if (ob)
                        {
                            snd_play(snd_item);
                            with (other)
                                hand_type = 2;
                            with (obj_mouse_hat)
                            {
                                if (linked_char == ob)
                                {
                                    stack_hat(other.sprite_index, other.image_index);
                                    with (other)
                                        instance_destroy();
                                    exit;
                                }
                            }
                            act = 2;
                            linked_char = ob;
                        }
                        else
                        {
                            event_user(5);
                        }
                    }
                    else
                    {
                        var xpad = 10;
                        var ypad = 10;
                        ob = collision_rectangle(bbox_left + xoff + xpad, bbox_top + yoff + ypad, (bbox_right + xoff) - xpad, (bbox_bottom + yoff) - ypad, obj_mike_slot, 1, 0);
                        if (ob && ob.act == 0)
                        {
                            act = 3;
                            global.interact = 2;
                            x = (ob.x + 80) - (sprite_width / 2);
                            y = (ob.y - sprite_height) + 3;
                            ob.act = 1;
                            alarm[0] = 15;
                            switch (sprite_index)
                            {
                                case spr_mike_l:
                                    ob.col = 255;
                                    break;
                                case spr_mike_m:
                                    ob.col = 127999;
                                    break;
                                case spr_mike_s:
                                    ob.col = 13217535;
                                    break;
                            }
                            scr_depth(undefined, 34);
                            scr_shakescreen(2, 6);
                            snd_play(snd_equip);
                            with (obj_mike_slot)
                            {
                                repeat (16)
                                    instance_create(x + (random_range(10, 70) * 2), y + 30, obj_mike_smoke_small);
                            }
                        }
                        else
                        {
                            event_user(5);
                        }
                    }
                }
            }
        }
    }
}
