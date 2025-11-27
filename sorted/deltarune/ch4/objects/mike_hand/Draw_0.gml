with (obj_mike_controller)
{
    if (!__usable)
        exit;
    if (instance_number(obj_encountermike) == 0 && instance_number(obj_mike_minigame_start) == 0 && instance_number(obj_micmenu) == 0 && (instance_number(obj_mike_attack_controller) == 0 || (!obj_mike_attack_controller.talking && obj_mike_attack_controller.action < 17)) && global.interact != 5)
    {
        if (type == 2 || type == 4 || type == 5 || type >= 7)
        {
            var shake = 0;
            var dist = point_distance(mx, my, x, y) / (hand_distance / 2);
            draw_set_colour(merge_colour(c_lime, c_yellow, dist));
            if (point_distance(x, y, mx, my) >= (hand_distance / 2))
            {
                dist = (point_distance(mx, my, x, y) - (hand_distance / 2)) / hand_distance;
                draw_set_colour(merge_colour(c_yellow, c_red, dist));
            }
            var tx = scr_mouse_x();
            var ty = scr_mouse_y();
            if (!global.use_mic)
            {
                tx = mx;
                ty = my;
            }
            if (ceil(point_distance(x, y, tx, ty)) >= hand_distance)
            {
                shake = 1;
                draw_set_colour(c_red);
            }
            if (!battle_active)
            {
                size1 = 8;
                if (ty < obj_mainchara.y && tx > (x - 60) && tx < (x + 50))
                    size1 = 30;
            }
            for (i = 1; i < (point_distance(mx, my, x, y) / 16); i++)
            {
                if (point_distance(mx + lengthdir_x(i * 16, point_direction(mx, my, x, y)), my + lengthdir_y(i * 16, point_direction(mx, my, x, y)), x, y) > (size1 * 1.5))
                {
                    if (battle_active)
                    {
                        d_circle(mx + (irandom_range(1, -1) * shake) + lengthdir_x(i * 16, point_direction(mx, my, x, y)), my + (irandom_range(1, -1) * shake) + lengthdir_y(i * 16, point_direction(mx, my, x, y)), 2, 1);
                    }
                    else
                    {
                        var randx = irandom_range(1, -1);
                        var randy = irandom_range(1, -1);
                        draw_set_colour(c_black);
                        d_circle(mx + (randx * shake) + lengthdir_x(i * 16, point_direction(mx, my, x, y)), my + (randy * shake) + lengthdir_y(i * 16, point_direction(mx, my, x, y)), 3, 0);
                        draw_set_colour(c_white);
                        d_circle(mx + (randx * shake) + lengthdir_x(i * 16, point_direction(mx, my, x, y)), my + (randy * shake) + lengthdir_y(i * 16, point_direction(mx, my, x, y)), 2, 0);
                    }
                }
            }
            var angle = point_direction(mx, my, x, y) + 90 + hand_angle;
            if (hand_type == 1 || hand_type == 6)
            {
                if (my > y)
                    angle = 180;
                else
                    angle = 0;
            }
            if (hand_type == 2 || hand_type == 3 || hand_type == 4)
                angle = 0;
            var _spr = hand_sprite[hand_type];
            with (obj_mike_minigame_controller)
            {
                if (phase == 2 && action == 1)
                {
                    switch (_spr)
                    {
                        case spr_mike_grab1:
                            _spr = spr_mike_grab1_outlined;
                            break;
                        case spr_mike_grab2:
                            _spr = spr_mike_grab2_outlined;
                            break;
                        case spr_mike_grab3:
                            _spr = spr_mike_grab3_outlined;
                            break;
                        case spr_mike_hand:
                            _spr = spr_mike_hand_outlined;
                            break;
                    }
                }
            }
            draw_sprite_ext(_spr, 0, mx + msx, my + msy, hand_xscale * 0.5, 0.5, angle, c_white, hand_speed);
            fruit_scale += ((fruit_scale2 - fruit_scale) * 0.25);
            fruit_scale2 += ((fruit_scale3 - fruit_scale2) * 0.25);
            if (fruit_scale > 0 && hand_fruit != -1)
                draw_sprite_ext(hand_fruit, current_time / 100, (mx + msx) - 6, (my + msy) - (fruit_scale * 32), fruit_scale, fruit_scale, 0, c_white, 1);
            if (point_distance(mx + msx, my + msy, scr_mouse_x(), scr_mouse_y()) > 64 && !(global.is_console || onSteamDeck()))
                draw_sprite_ext(spr_mouse, 0, scr_mouse_x(), scr_mouse_y(), 1, 1, 0, c_white, 1);
        }
        hand_shake -= 1;
        if (hand_shake > 0)
        {
            msx = -random_range(-2, 2);
            msy = -random_range(-2, 2);
        }
        if (hand_shake == 0 && hand_type == 3)
        {
            hand_type = 4;
            msx = 0;
            msy = 0;
            fruit_scale3 = 2;
            switch (obj_mike_attack_controller.pet_current[0])
            {
                case 1:
                    hand_fruit = 1555;
                    break;
                case 2:
                    hand_fruit = 2555;
                    break;
                case 3:
                default:
                    hand_fruit = 2287;
                    break;
            }
        }
        if (hand_shake == 0 && hand_type == 5)
        {
            hand_type = 0;
            msx = 0;
            msy = 0;
        }
        if (hand_shake < -60)
        {
            if (hand_type == 4)
            {
                hand_type = 0;
                fruit_scale3 = 0;
                fruit_scale2 = 0;
                fruit_scale = 0;
                hand_fruit = -1;
            }
        }
        else
        {
            fruit_scale3 = scr_approach(fruit_scale3, 1, 0.1);
        }
    }
}
