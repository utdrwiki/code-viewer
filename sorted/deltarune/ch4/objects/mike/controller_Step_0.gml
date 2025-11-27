var gpind = 0;
with (obj_gamecontroller)
    gpind = gamepad_id;
if (!global.use_mic)
{
    with (obj_mike_minigame_controller)
    {
        if (inv_mic)
            other.microphone_volume = 100 - other.microphone_volume;
    }
    var new_vol = 0;
    if (global.input_g[4] != gp_shoulderrb)
        new_vol = scr_shoulder_rb() * 100;
    else if (obj_gamecontroller.gamepad_shoulderlb_reassign)
        new_vol = scr_shoulder_lb() * 100;
    microphone_volume += ((new_vol - microphone_volume) * 0.25);
    with (obj_mike_minigame_controller)
    {
        if (inv_mic)
            other.microphone_volume = 100 - other.microphone_volume;
    }
}
if (global.right_click_mic)
{
    if (global.right_click_mic == 1)
    {
        if (device_mouse_check_button(0, mb_right))
            microphone_volume = 100;
        else
            microphone_volume = 0;
    }
    if (global.right_click_mic == 2)
    {
        if (button2_h())
            microphone_volume = 100;
        else
            microphone_volume = 0;
    }
    microphone_volume = clamp(microphone_volume, 0, 100);
    with (obj_mike_minigame_controller)
    {
        if (inv_mic)
            other.microphone_volume = 101 - other.microphone_volume;
    }
}
if (!__usable)
    exit;
if (battle_active && instance_number(obj_micmenu) == 0)
{
    if (grazenoise == 1)
    {
        snd_play(snd_graze);
        grazenoise = 0;
        with (obj_mike_minigame_controller)
        {
            if (phase == 2 && action == 1)
                myscore++;
        }
    }
    if (type != last_type)
    {
        if (type != 5)
        {
            if (type < 3)
                x = camerax() + (camerawidth() / 2);
            if (type > 2)
                y = cameray() + (cameraheight() / 2) + line_ypos;
        }
        else
        {
            phase = 0;
        }
        if (type == 15)
            x_target = camerax() + (camerawidth() / 2);
        if (type == 15)
            y_target = (cameray() + (cameraheight() / 2)) - 32;
        circle_width = 0;
        circle_height = 0;
        gravity = 0;
        speed = 0;
        size2 = 30;
        size3 = 13;
        mx = x;
        my = y;
        line_side = choose(1, -1);
        line_xpos = 0;
        hand_speed = 0;
        last_type = type;
    }
    if (phase == 0)
    {
        with (obj_heart)
        {
        }
        x += ((newx - x) * 0.25);
        y += ((newy - y) * 0.25);
        x = scr_approach(x, newx, 1);
        y = scr_approach(y, newy, 1);
        if (x == newx && y == newy)
        {
            size2 = 30;
            size3 = 13;
            phase = 1;
            type = 5;
        }
    }
    if (sign_action == 0)
    {
        sign_y = scr_approach(sign_y, sign_ystart, 12);
        if (instance_number(obj_mike_crowd) > 0 || instance_number(obj_mike_pipe) > 0)
            sign_action = 1;
    }
    if (sign_action == 1)
    {
        sign_vspeed += 0.25;
        sign_y += sign_vspeed;
        if (sign_y > -1)
        {
            sign_vspeed *= -0.4;
            sign_bounce += 1;
        }
        if (sign_bounce >= 3)
        {
            sign_vspeed = 0;
            sign_bounce = 0;
            sign_y = 0;
            sign_action = 2;
            if ((sign_col == 65280 || sign_col == 65535) && obj_mike_attack_controller.wave != 0.1)
                sign_sound = snd_play_x(snd_crowd, 1, 1);
            if (sign_col == 255)
            {
                sign_sound = snd_play(snd_shh);
                mus_volume(global.batmusic[1], 0, 0);
            }
        }
    }
    if (sign_action == 2)
    {
        if (instance_number(obj_mike_crowd) == 0 && instance_number(obj_mike_pipe) == 0 && obj_mike_attack_controller.wave != 0.1)
        {
            sign_action = 0;
            sign_col = 8421504;
            snd_stop(sign_sound);
            sign_sound = -1;
        }
    }
    if (sign_action2 == 0)
        sign_y2 = scr_approach(sign_y2, sign_ystart, 12);
    if (sign_action2 == 1)
    {
        sign_y2 = scr_approach(sign_y2, 0, 4);
        if (sign_y2 == 0)
        {
            sign_action2 = 2;
            snd_play(snd_shh);
            snd_stop(sign_sound);
            sign_sound = -1;
            mus_volume(global.batmusic[1], 0, 0);
        }
    }
    if (sign_action2 == 2)
    {
        if (instance_number(obj_mike_quiet) == 0)
        {
            sign_action2 = 0;
            mus_volume(global.batmusic[1], 1, 50);
        }
    }
    if (type == 1 || type == 2)
    {
        var my_gravity = 1;
        var ymax = [];
        ymax[0] = cameray() + 32;
        ymax[1] = cameray() + 300;
        ymax[2] = cameray() + 64;
        wait -= 1;
        var new_volume = min(12, microphone_volume / 6);
        if (room == room_dw_castle_tv_zone_minigame)
        {
            ymax[1] = cameray() + 340;
            if (i_ex(obj_mike_quiet))
                my_gravity = 2;
            else
                my_gravity = 0.25;
        }
        if (i_ex(obj_mike_quiet))
            my_gravity = 2;
        if (wait > 0)
            new_volume = 0;
        if (new_volume > wingbox_volume_thereshold)
        {
            y -= lerp(1, 11, (new_volume - wingbox_volume_thereshold) / (12 - wingbox_volume_thereshold));
            gravity = 0;
            vspeed = 0;
        }
        else
        {
            gravity = my_gravity;
            vspeed = max(vspeed, 2);
        }
        reload += 1;
        if (reload > (max(1, (100 - microphone_volume) * 0.1) * 2) && microphone_volume > (wingbox_volume_thereshold * 6))
        {
            reload = 0;
            wing_angle1 = 10;
            wing_angle2 = 270;
            size2 = 21;
        }
        vspeed = clamp(vspeed, -10, 10);
        y = max(y, ymax[0]);
        if (y <= ymax[0])
            wait = 1;
        if (y > ymax[1])
        {
            vspeed = 0;
            y = ymax[1];
        }
        if (vspeed > 0)
        {
            wing_angle3 = 90;
            wing_angle2 = 90;
        }
        if (vspeed == 0 && new_volume <= 1)
        {
            wing_angle3 = 270;
            wing_angle2 = 270;
            wing_angle1 = 270;
        }
        wing_angle1 += ((wing_angle2 - wing_angle1) * 0.2);
        wing_angle2 += ((wing_angle3 - wing_angle2) * 0.01);
    }
    if (type == 3 || type == 4)
    {
        var new_volume = min(12, microphone_volume / 8);
        if (new_volume > 1)
            line_xpos += (line_side * new_volume);
        if (line_side == 1 && line_xpos >= line_width)
        {
            line_side = -1;
            line_xpos = line_width;
            size2 = 20;
        }
        else if (line_side == -1 && line_xpos <= -line_width)
        {
            line_side = 1;
            line_xpos = -line_width;
            size2 = 20;
        }
        if (room == room_dw_castle_tv_zone_minigame)
        {
            if (abs(x - scr_mouse_x()) > 60)
            {
                if (scr_mouse_x() > x)
                    line_side = 1;
                else
                    line_side = -1;
            }
        }
        x = camerax() + (camerawidth() / 2) + line_xpos;
    }
    if (type == 6)
    {
        circle_width = scr_approach(circle_width, 75, 8);
        circle_height = scr_approach(circle_height, 75, 8);
    }
    if (type == 7)
    {
        circle_width = scr_approach(circle_width, 50, 8);
        circle_height = scr_approach(circle_height, 50, 8);
    }
    if (type >= 5 && type <= 7)
    {
        var new_volume = min(12, microphone_volume / 4);
        if (new_volume > 1)
            new_dir -= new_volume;
        dir += ((new_dir - dir) * 0.25);
        if (type == 5)
        {
            size2 = max(13, new_volume * 2);
        }
        else
        {
            x = camerax() + (camerawidth() / 2) + lengthdir_x(circle_width, dir);
            y = cameray() + (cameraheight() / 2) + lengthdir_y(circle_height, dir) + circle_offset;
        }
    }
}
if (type == 9)
{
    var new_volume = min(12, microphone_volume / 8);
    line_width = 200;
    if (new_volume > 1)
        line_xpos += (line_side * new_volume);
    if (line_side == 1 && line_xpos >= line_width)
    {
        line_side = -1;
        line_xpos = line_width;
        size2 = 20;
    }
    else if (line_side == -1 && line_xpos <= -line_width)
    {
        line_side = 1;
        line_xpos = -line_width;
        size2 = 20;
    }
    if (room == room_dw_castle_tv_zone_minigame)
    {
        if (abs(y - mouse_y) > 30)
        {
            if (mouse_y > y)
                line_side = 1;
            else
                line_side = -1;
        }
    }
    y = 90 + line_xpos;
}
if ((type == 2 || type == 4 || type == 5 || type >= 7) && global.interact != 5)
{
    var _y_offset = 0;
    if (type == 8 && hand_type == 2)
        _y_offset = -30;
    var hd = hand_distance;
    if (type == 15)
        hd = 100;
    if (type == 8)
        y = lerp(y, clamp(my - _y_offset, 90, 290), 0.5);
    if (global.is_console || onSteamDeck())
    {
        var _dist = point_distance(0, 0, gamepad_axis_value(gpind, gp_axislh), gamepad_axis_value(gpind, gp_axislv)) * hd;
        var _dir = scr_joystick(gamepad_axis_value(gpind, gp_axislh), gamepad_axis_value(gpind, gp_axislv));
        if ((abs(gamepad_axis_value(gpind, gp_axislh)) + abs(gamepad_axis_value(gpind, gp_axislv))) > 0.1)
        {
            mx += (((x + lengthdir_x(_dist, _dir)) - mx) * 0.2);
            my += (((y + lengthdir_y(min(_dist, 200), _dir)) - my) * 0.2);
        }
        hand_speed = scr_approach(hand_speed, 0.999, 0.1);
    }
    else
    {
        var _dist = min(hd, point_distance(x, y, scr_mouse_x(), scr_mouse_y()));
        var _dir = point_direction(x, y, scr_mouse_x(), scr_mouse_y());
        hand_speed = scr_approach(hand_speed, 0.999, 0.1);
        mx += (((x + lengthdir_x(_dist, _dir)) - mx) * hand_speed);
        my += (((y + lengthdir_y(min(_dist, 200), _dir) + _y_offset) - my) * hand_speed);
    }
    if (type == 15)
    {
        hspeed *= 0.75;
        hspeed = clamp(hspeed + ((mx - x) / 50), -14, 14);
        x = clamp(x, 0, 640);
        x_target = x + hspeed;
        y = lerp(y, cameray() + (0.5 * cameraheight()) + clamp(0, -200, 8), 0.15);
        vspeed *= 0.9;
        y_target = y + vspeed;
        x = lerp(x, x_target, 0.3);
        y = lerp(y, y_target, 0.3);
    }
    if (scr_mouse_leftclick() && instance_number(obj_micmenu) == 0 && !i_ex(obj_dialoguer) && global.interact != 1 && hand_wait < 0 && hand_type == 0 && instance_number(obj_battleblcon) == 0 && (instance_number(obj_mike_attack_controller) == 0 || !obj_mike_attack_controller.talking))
    {
        hand_wait = hand_anim;
        with (instance_create(mx + lengthdir_x(16, point_direction(x, y, mx, my)), my + lengthdir_y(16, point_direction(x, y, mx, my)), obj_hand_collision))
            scr_doom(id, other.hand_wait);
        var _juggle = 0;
        if (collision_circle(mx, my, 24, obj_mike_ball, 0, 0))
            _juggle = true;
        if (!_juggle)
        {
            var _sfx = snd_play(snd_wing);
            snd_volume(_sfx, 0.5, 0);
            snd_pitch(_sfx, random_range(0.95, 1.05));
            with (obj_mike_hand)
                alarm[0] = 6;
        }
        if (i_ex(obj_mike_ball))
        {
            with (obj_hand_collision)
            {
                image_xscale = 0.33;
                image_yscale = 0.33;
            }
        }
        if (i_ex(obj_mike_combo) && scr_mouse_x() > 180 && scr_mouse_x() < 480)
        {
            with (obj_hand_collision)
            {
                image_xscale = 1;
                image_yscale = 1.5;
            }
        }
        var ob = instance_create(mx + lengthdir_x(16, point_direction(x, y, mx, my)), my + lengthdir_y(16, point_direction(x, y, mx, my)), obj_hand_shake);
        with (ob)
        {
            dir = point_direction(other.x, other.y, other.mx, other.my) - 90;
            x = xstart + lengthdir_x(8, dir);
            y = ystart + lengthdir_y(8, dir);
            motion_set(dir, 2);
            image_angle = direction;
            depth = obj_mike_hand.depth;
        }
        ob = instance_create(mx + lengthdir_x(16, point_direction(x, y, mx, my)), my + lengthdir_y(16, point_direction(x, y, mx, my)), obj_hand_shake);
        with (ob)
        {
            dir = point_direction(other.x, other.y, other.mx, other.my) + 90;
            x = xstart + lengthdir_x(8, dir);
            y = ystart + lengthdir_y(8, dir);
            motion_set(dir, 2);
            image_angle = direction;
            depth = obj_mike_hand.depth;
        }
    }
    if (!i_ex(obj_dialoguer))
    {
        var ob = collision_circle(mx, my, 24, obj_mike_grabcat, 1, 0);
        var ob2 = collision_circle(mx, my, 24, obj_gravity_ball, 1, 0);
        var ob3 = collision_circle(mx, my, 24, obj_mike_grabcat_pluey, 1, 0);
        if (ob || ob3)
        {
            if (hand_type == 0)
                hand_type = 1;
            if (scr_mouse_leftclick())
            {
                if (ob == -4)
                    ob = ob3;
                with (ob)
                {
                    action = 1;
                    speed = 0;
                    gravity = 0;
                    xscale = 1;
                    if (ob == ob3)
                    {
                        var li = ds_list_create();
                        instance_place_list(x, y, 594, li, false);
                        for (var i = 0; i < ds_list_size(li); i++)
                            instance_destroy(ds_list_find_value(li, i));
                        ds_list_destroy(li);
                        sprite_index = spr_mike_cat_hold_outline_smallhitbox;
                    }
                    else
                    {
                        sprite_index = spr_mike_cat_hold;
                    }
                }
                hand_type = 2;
                hand_target = ob;
            }
        }
        else if (ob2)
        {
            if (hand_type == 0)
                hand_type = 1;
            if (scr_mouse_leftclick())
            {
                with (ob2)
                {
                    action = 1;
                    speed = 0;
                    gravity = 0;
                    xscale = 1;
                }
                hand_type = 2;
                hand_target = ob2;
            }
        }
        else if (battle_active)
        {
            if (hand_type == 1)
                hand_type = 0;
        }
        if (hand_target != -1)
        {
            hand_type = 2;
            if (!instance_exists(hand_target))
            {
                hand_type = 0;
                hand_target = -1;
            }
        }
        if (hand_type == 2 && !scr_mouse_left())
        {
            hand_type = 0;
            with (hand_target)
            {
                action = 5;
                if (object_index == obj_mike_grabcat_pluey)
                {
                    var _averagex2frame = (x + xprevious) / 2;
                    var _averagey2frame = (y + yprevious) / 2;
                    var _averagex4frame = (last_x[1] + last_x[2]) / 2;
                    var _averagey4frame = (last_y[1] + last_y[2]) / 2;
                    var aag2 = abs(_averagex2frame) + abs(_averagey2frame);
                    var aag4 = abs(_averagex4frame) + abs(_averagey4frame);
                    if (aag4 < 350)
                    {
                        _averagex4frame = _averagex2frame;
                        _averagey4frame = _averagey2frame;
                        aag4 = aag2;
                    }
                    var _spd = max(2, point_distance(_averagex4frame, _averagey4frame, _averagex2frame, _averagey2frame) / 4);
                    var _dir = point_direction(_averagex4frame, _averagey4frame, _averagex2frame, _averagey2frame);
                    var mult = 1;
                    if (aag2 > 500 && aag2 >= aag4)
                        mult = 1.5;
                    hspeed = lengthdir_x(_spd, _dir) * mult;
                    vspeed = lengthdir_y(_spd, _dir) * mult;
                }
            }
            hand_target = -1;
        }
    }
}
with (obj_hand_collision)
{
    x = other.mx + lengthdir_x(24, point_direction(other.x, other.y, other.mx, other.my));
    y = other.my + lengthdir_y(24, point_direction(other.x, other.y, other.mx, other.my));
}
if (hand_wait > 0)
    hand_angle = sin(current_time / 20) * 15;
else
    hand_angle = scr_approach(hand_angle, 0, 2);
hand_wait -= 1;
if (room == room_dw_castle_tv_zone_3 && i_ex(obj_actor))
{
    x = obj_room_castle_tv_zone_3.kr_actor.x + 20;
    y = obj_room_castle_tv_zone_3.kr_actor.y + 48;
}
else if (!battle_active && instance_number(obj_mainchara) == 1)
{
    x = obj_mainchara.x + 20;
    y = obj_mainchara.y + 48;
}
