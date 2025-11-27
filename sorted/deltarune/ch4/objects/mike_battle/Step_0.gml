blush -= 1;
if (i_ex(obj_encountermike))
{
}
else if (i_ex(obj_mike_attack_controller) || i_ex(obj_mike_minigame_controller))
{
    if (!battle_start)
    {
        speed = 0;
        battle_start = true;
    }
    if (action == 2)
    {
        timer += 1;
        if (timer == 30)
        {
            action = 0;
            timer = 0;
        }
    }
    if (action == 0)
    {
        if (!sad)
        {
            if (move)
                x = scr_approach(x, xstart + 300, spd);
            else
                x = scr_approach(x, newx, spd);
        }
        else if (y > ystart)
        {
            vspeed = 0;
            y = ystart;
            gravity = 0;
        }
        if (x > (camerax() + camerawidth() + 64))
        {
            if (sprite_index == spr_mike_med_sad)
                sprite_index = spr_mike_med;
        }
        if (x == newx)
        {
            with (obj_mike_attack_controller)
                canclick = true;
        }
        else
        {
            with (obj_mike_attack_controller)
                canclick = false;
        }
    }
    if (action == 1)
    {
        x = scr_approach(x, xstart + 300, 16);
        if (x == (xstart + 300))
        {
            action = 2;
            phase += 1;
            switch (phase)
            {
                case 1:
                    sprite_index = spr_mike_med;
                    break;
                case 2:
                    sprite_index = spr_mike_big;
                    break;
                default:
                    sprite_index = spr_mike_small;
                    break;
            }
            if (type == 2 && instance_number(obj_mike_battle) == 1)
            {
                type = 0;
                sprite_index = spr_mike_small;
                obj_mike_attack_controller.mike_small = id;
                with (instance_create(xstart + 80, y + 25, obj_mike_battle))
                {
                    sprite_index = spr_mike_big;
                    x = xstart + 300;
                    image_xscale = 2;
                    image_yscale = 2;
                    type = 1;
                    depth = other.depth - 1;
                    obj_mike_attack_controller.mike_big = id;
                }
                with (instance_create(xstart + 80, y - 100, obj_mike_battle))
                {
                    sprite_index = spr_mike_med;
                    x = xstart + 300;
                    image_xscale = 2;
                    image_yscale = 2;
                    type = 1;
                    obj_mike_attack_controller.mike_medium = id;
                }
            }
        }
    }
    xscale2 = 1 + (sin(current_time / 120) * 0.01);
    yscale2 = 1 + (sin(32 + (current_time / 120)) * 0.01);
    if (act == 0)
    {
        xscale = scr_approach(xscale, 1, 0.01);
        yscale = scr_approach(yscale, 1, 0.01);
    }
    if (act == 1)
    {
        act = 2;
        timer = 0;
        xscale = 1;
        yscale = 1;
    }
    if (act == 2)
    {
        timer += 1;
        xscale += ((xscale2 - xscale) * 0.9);
        yscale += ((yscale2 - yscale) * 0.9);
        if (timer > 30)
        {
            act = 0;
            timer = 0;
        }
    }
}
