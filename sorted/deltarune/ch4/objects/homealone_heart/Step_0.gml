wallcheck = 0;
nowx = x;
nowy = y;
if (press_d == 0 && press_l == 0 && press_u == 0 && press_r == 0)
    nopress = 1;
press_l = 0;
press_r = 0;
press_d = 0;
press_u = 0;
bkx = 0;
bky = 0;
bkxy = 0;
if (!roomenterfreezeend)
{
    if (global.interact == 3)
    {
        if (global.flag[21] > 0)
        {
            global.flag[21]--;
        }
        else
        {
            roomenterfreezeend = 1;
            global.interact = 0;
            global.flag[21] = -10;
        }
    }
}
if (global.interact == 0 && freeze == 0)
{
    if (run == 0)
        wspeed = bwspeed;
    if (left_h())
        press_l = 1;
    if (right_h())
        press_r = 1;
    if (up_h())
        press_u = 1;
    if (down_h())
        press_d = 1;
    px = 0;
    py = 0;
    pressdir = -1;
    if (press_r == 1)
    {
        px = wspeed;
        pressdir = 1;
    }
    if (press_l == 1)
    {
        px = -wspeed;
        pressdir = 3;
    }
    if (press_d == 1)
    {
        py = wspeed;
        pressdir = 0;
    }
    if (press_u == 1)
    {
        py = -wspeed;
        pressdir = 2;
    }
    if (nopress == 1 && pressdir != -1)
        global.facing = pressdir;
    if (global.facing == 2)
    {
        if (press_d == 1)
            global.facing = 0;
        if (press_u == 0 && pressdir != -1)
            global.facing = pressdir;
    }
    if (global.facing == 0)
    {
        if (press_u == 1)
            global.facing = 2;
        if (press_d == 0 && pressdir != -1)
            global.facing = pressdir;
    }
    if (global.facing == 3)
    {
        if (press_r == 1)
            global.facing = 1;
        if (press_l == 0 && pressdir != -1)
            global.facing = pressdir;
    }
    if (global.facing == 1)
    {
        if (press_l == 1)
            global.facing = 3;
        if (press_r == 0 && pressdir != -1)
            global.facing = pressdir;
    }
    nopress = 0;
    xmeet = 0;
    ymeet = 0;
    xymeet = 0;
    var slow_down = false;
    var type = 0;
    var wall_check = false;
    var pushable = collision_rectangle(x + px, y, x + sprite_width + -1 + px, (y + sprite_height) - 5, obj_homealone_pushable, false, true);
    if (pushable != -4)
    {
        type = 1;
        px = (px * pushable.movespeed) / 8;
        var _px = px;
        with (pushable)
        {
            if (pushable.object_index == obj_train_snowball)
                event_user(0);
            if (place_meeting(x + (_px * 0.5), y, obj_solidblock))
            {
                can_push = false;
            }
            else
            {
                can_push = true;
                x += (_px * 0.5);
                if (_px != 0)
                    shake = true;
            }
            wall_check = !can_push;
            slow_down = can_push;
        }
    }
    if (collision_rectangle(x, y, x + sprite_width + px, (y + sprite_height) - 5, obj_homealone_pushable, false, true))
    {
        var stopped = false;
        if (wall_check)
        {
            for (i = px; i >= 0; i -= 1)
            {
                if (!place_meeting(x + i, y, obj_homealone_pushable))
                {
                    stopped = true;
                    px = i;
                    break;
                }
            }
            if (!stopped)
                px = 0;
        }
    }
    if (collision_rectangle(x + px, y, x, (y + sprite_height) - 5, obj_homealone_pushable, false, true))
    {
        var stopped = false;
        if (wall_check)
        {
            for (i = px; i <= 0; i += 1)
            {
                if (!place_meeting(x + i, y, obj_homealone_pushable))
                {
                    stopped = true;
                    px = i;
                    break;
                }
            }
            if (!stopped && px < 0)
                px = 0;
        }
    }
    if (collision_rectangle(x, y, (x + sprite_width) - 1, y + py, obj_homealone_pushable, false, true))
    {
        if (py <= 0)
        {
            var stopped = false;
            for (i = py; i <= 0; i += 1)
            {
                if (!place_meeting(x, y + i, obj_homealone_pushable))
                {
                    stopped = true;
                    py = i;
                    break;
                }
            }
            if (!stopped)
                py = 0;
        }
    }
    if (collision_rectangle(x, y, (x + sprite_width) - 1, y + sprite_height + py, obj_homealone_pushable, false, true))
    {
        if (py >= 0)
        {
            var stopped = false;
            for (i = py; i >= 0; i -= 1)
            {
                if (!place_meeting(x, y + i, obj_homealone_pushable))
                {
                    stopped = true;
                    py = i;
                    break;
                }
            }
            if (!stopped)
                py = 0;
        }
    }
    var airflow_area = collision_rectangle(x, y, x + sprite_width, (y + sprite_height) - 1, obj_homealone_vent_airflow, false, true);
    if (airflow_area != -4)
    {
        if (airflow_area.image_index == 0)
        {
            var bottom_area = collision_rectangle(x, y + 8, x + sprite_width, y + sprite_height + 4, obj_homealone_vent_airflow, false, true);
            if (bottom_area != -4 && bottom_area.image_index == 2)
                py -= 4;
            px += 4;
        }
        if (airflow_area.image_index == 1)
        {
            var top_area = collision_rectangle(x, y - 4, x + sprite_width, y + 4, obj_homealone_vent_airflow, false, true);
            if (top_area != -4 && top_area.image_index == 3)
                py += 4;
            px -= 4;
        }
        if (airflow_area.image_index == 2)
            py -= 4;
        if (airflow_area.image_index == 3)
            py += 4;
    }
    if (place_meeting(x + px, y + py, obj_homealone_solid))
        xymeet = 1;
    if (place_meeting(x + px, y, obj_homealone_solid))
    {
        if (place_meeting(x + px, y, obj_homealone_solid))
        {
            for (g = wspeed; g > 0; g -= 1)
            {
                mvd = 0;
                if (press_d == 0 && !place_meeting(x + px, y - g, obj_homealone_solid))
                {
                    y -= g;
                    py = 0;
                    break;
                    mvd = 1;
                }
                if (press_u == 0 && mvd == 0 && !place_meeting(x + px, y + g, obj_homealone_solid))
                {
                    y += g;
                    py = 0;
                    break;
                }
            }
        }
        xmeet = 1;
        bkx = 0;
        if (px > 0)
        {
            for (i = px; i >= 0; i -= 1)
            {
                if (!place_meeting(x + i, y, obj_homealone_solid))
                {
                    px = i;
                    bkx = 1;
                    break;
                }
            }
        }
        if (px < 0)
        {
            for (i = px; i <= 0; i += 1)
            {
                if (!place_meeting(x + i, y, obj_homealone_solid))
                {
                    px = i;
                    bkx = 1;
                    break;
                }
            }
        }
        if (bkx == 0)
            px = 0;
    }
    if (place_meeting(x, y + py, obj_homealone_solid))
    {
        ymeet = 1;
        bky = 0;
        if (place_meeting(x, y + py, obj_homealone_solid))
        {
            for (g = wspeed; g > 0; g -= 1)
            {
                mvd = 0;
                if (press_r == 0 && !place_meeting(x - g, y + py, obj_homealone_solid))
                {
                    x -= g;
                    px = 0;
                    break;
                    mvd = 1;
                }
                if (mvd == 0 && press_l == 0 && !place_meeting(x + g, y + py, obj_homealone_solid))
                {
                    x += g;
                    px = 0;
                    break;
                }
            }
        }
        if (py > 0)
        {
            for (i = py; i >= 0; i -= 1)
            {
                if (!place_meeting(x, y + i, obj_homealone_solid))
                {
                    py = i;
                    bky = 1;
                    break;
                }
            }
        }
        if (py < 0)
        {
            for (i = py; i <= 0; i += 1)
            {
                if (!place_meeting(x, y + i, obj_homealone_solid))
                {
                    py = i;
                    bky = 1;
                    break;
                }
            }
        }
        if (bky == 0)
            py = 0;
    }
    if (place_meeting(x + px, y + py, obj_homealone_solid))
    {
        xymeet = 1;
        bkxy = 0;
        i = px;
        j = py;
        while (j != 0 || i != 0)
        {
            if (!place_meeting(x + i, y + j, obj_homealone_solid))
            {
                px = i;
                py = j;
                bkxy = 1;
                break;
            }
            if (abs(j) >= 1)
            {
                if (j > 0)
                    j -= 1;
                if (j < 0)
                    j += 1;
            }
            else
            {
                j = 0;
            }
            if (abs(i) >= 1)
            {
                if (i > 0)
                    i -= 1;
                if (i < 0)
                    i += 1;
            }
            else
            {
                i = 0;
            }
        }
        if (bkxy == 0)
        {
            px = 0;
            py = 0;
        }
    }
    runmove = 0;
    if (run == 1 && xmeet == 0 && ymeet == 0 && xymeet == 0)
    {
        if (abs(px) > 0 || abs(py) > 0)
        {
            runmove = 1;
            runtimer += 1;
            runcounter += 1;
        }
        else
        {
            runtimer = 0;
        }
    }
    else
    {
        runtimer = 0;
    }
    px = slow_down ? (px * 0.5) : px;
    if (angel_mode)
    {
        px *= 0.1;
        py = 0;
    }
    x += px;
    y += py;
}
if (fun == 0)
{
    walk = 0;
    if (x != nowx && nopress == 0)
        walk = 1;
    if (y != nowy && nopress == 0)
        walk = 1;
    if (angel_mode)
        shake = false;
    if (walk == 1)
    {
        walkbuffer = 6;
        if (angel_mode)
            shake = true;
    }
    if (walkbuffer > 3 && fun == 0)
    {
        walktimer += 1.5;
        if (runmove == 1 || (run == 1 && climbing == 1))
            walktimer += 1.5;
        if (climbing == 1)
        {
            with (obj_rotating_tower_caterpillar)
                index += 0.15;
        }
        if (walktimer >= 40)
            walktimer -= 40;
        if (walktimer < 10)
            image_index = 0;
        if (walktimer >= 10)
            image_index = 1;
        if (walktimer >= 20)
            image_index = 2;
        if (walktimer >= 30)
            image_index = 3;
    }
    if (walkbuffer <= 0 && fun == 0 && climbing == 0)
    {
        if (walktimer < 10)
            walktimer = 9.5;
        if (walktimer >= 10 && walktimer < 20)
            walktimer = 19.5;
        if (walktimer >= 20 && walktimer < 30)
            walktimer = 29.5;
        if (walktimer >= 30)
            walktimer = 39.5;
        image_index = 0;
    }
    walkbuffer -= 0.75;
}
if (onebuffer < 0)
{
    if (global.interact == 0)
    {
        if (!interacted)
        {
            thisinteract = 0;
            d = global.darkzone + 1;
            var right_check = x + sprite_width + 1;
            var left_check = x - (1 * d);
            if (global.facing == 1)
            {
                if (collision_rectangle((x + sprite_width) - 1, y, x + sprite_width + 1, (y + sprite_height) - 5, obj_homealone_interactable, false, true))
                    thisinteract = 1;
            }
            if (collision_rectangle(x, y, (x + sprite_width) - 1, (y + sprite_height) - 5, obj_homealone_pushable, false, true))
                thisinteract = 2;
            if (thisinteract > 0)
            {
                if (thisinteract == 1)
                    interactedobject = collision_rectangle((x + sprite_width) - 1, y, x + sprite_width + 1, (y + sprite_height) - 5, obj_homealone_interactable, false, true);
                if (thisinteract == 2)
                    interactedobject = collision_rectangle(x, y, (x + sprite_width) - 1, (y + sprite_height) - 5, obj_homealone_pushable, false, true);
                if (interactedobject != -4)
                {
                    if (thisinteract == 1)
                    {
                        interacted = true;
                        with (interactedobject)
                            interact_event = true;
                    }
                    if (thisinteract == 2)
                    {
                        var _px = px;
                        with (interactedobject)
                        {
                            if (can_push && _px != 0)
                            {
                                shake = true;
                                x += _px;
                            }
                        }
                    }
                }
            }
            thisinteract = 0;
            if (global.facing == 3)
            {
                if (collision_rectangle(x, y, left_check, (y + sprite_height) - 5, obj_homealone_interactable, false, true))
                    thisinteract = 1;
            }
            if (thisinteract > 0)
            {
                if (thisinteract == 1)
                    interactedobject = collision_rectangle(x, y, left_check, (y + sprite_height) - 5, obj_homealone_interactable, false, true);
                if (interactedobject != -4)
                {
                    if (thisinteract == 1)
                    {
                        interacted = true;
                        with (interactedobject)
                            interact_event = true;
                    }
                }
            }
            thisinteract = 0;
            if (global.facing == 0)
            {
                if (collision_rectangle(x + (4 * d), y + (1 * d), (x + sprite_width) - (4 * d), y + (sprite_height * d), obj_homealone_interactable, false, true))
                    thisinteract = 1;
            }
            if (thisinteract > 0)
            {
                if (thisinteract == 1)
                    interactedobject = collision_rectangle(x + (4 * d), y + (1 * d), (x + sprite_width) - (4 * d), y + (sprite_height * d), obj_homealone_interactable, false, true);
                if (thisinteract == 1)
                {
                    interacted = true;
                    with (interactedobject)
                        interact_event = true;
                }
            }
            thisinteract = 0;
            if (global.facing == 2)
            {
                if (collision_rectangle(x, y, (x + sprite_width) - 1, y + py, obj_homealone_interactable, false, true))
                    thisinteract = 1;
                if (collision_rectangle(x + 3, y, (x + sprite_width) - (5 * d), y - (5 * d), obj_homealone_vent, false, true))
                    thisinteract = 2;
            }
            if (thisinteract > 0)
            {
                if (thisinteract == 1)
                    interactedobject = collision_rectangle(x, y, (x + sprite_width) - 1, y + py, obj_homealone_interactable, false, true);
                if (thisinteract == 2)
                    interactedobject = collision_rectangle(x + (3 * d), y, (x + sprite_width) - (5 * d), y * d, obj_homealone_vent, false, true);
                if (interactedobject != -4)
                {
                    if (thisinteract == 1)
                    {
                        interacted = true;
                        with (interactedobject)
                            interact_event = true;
                    }
                }
            }
        }
        else
        {
            var still_interacting = false;
            var right_check = x + sprite_width + (1 * d);
            var left_check = x - (1 * d);
            if (global.facing == 1)
            {
                if (collision_rectangle((x + sprite_width) - 1, y, x + sprite_width + 1, (y + sprite_height) - 1, obj_homealone_interactable, false, true))
                    still_interacting = true;
            }
            if (global.facing == 3)
            {
                if (collision_rectangle(x, y, left_check, y + sprite_height, obj_homealone_interactable, false, true))
                    still_interacting = true;
            }
            if (global.facing == 0)
            {
                if (collision_rectangle(x + (4 * d), y + (1 * d), (x + sprite_width) - (4 * d), y + sprite_height + (1 * d), obj_homealone_interactable, false, true))
                    still_interacting = true;
            }
            if (global.facing == 2)
            {
                if (collision_rectangle(x, y, (x + sprite_width) - 1, y + py, obj_homealone_interactable, false, true))
                    still_interacting = true;
            }
            if (!still_interacting)
            {
                var interacted_objects = 0;
                if (interacted_objects == 0 || px == 0)
                {
                    interacted = false;
                    interactedobject = -4;
                }
            }
        }
    }
}
onebuffer -= 1;
twobuffer -= 1;
threebuffer -= 1;
with (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_homealone_vent, 0, 0))
    alarm[0] = 1;
if (scr_debug())
{
}
