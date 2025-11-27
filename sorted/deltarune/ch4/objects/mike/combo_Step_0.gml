if (phase == 0)
{
    xs = 1 + lengthdir_x(0.1, current_time / 4);
    ys = 1 - lengthdir_y(0.1, current_time / 4);
}
if ((hp < (hp_max * 0.5) && rot_speed > 1) || phase == 2)
{
    var a = scr_afterimagefast();
    a.image_xscale = image_xscale * xs;
    a.image_yscale = image_yscale * ys;
    a.image_angle = image_angle;
    a.fadeSpeed = 0.4;
}
if (action > 0 || phase == 2 || (phase == 1 && action == 0))
{
    image_angle += rot_speed;
    image_xscale += (((2 * xs) - image_xscale) * 0.2);
    image_yscale = image_xscale;
    cooldown -= 1;
}
if (phase == 0)
{
    if (action > 2)
    {
        if (hp > 3 && hp < hp_max)
            hp = scr_approach(hp, 3, dot);
    }
    if (action == 0)
    {
        with (obj_mike_battle)
        {
            x += ((other.x - x) * 0.1);
            y += ((other.y - y) * 0.1);
            action = 3;
        }
        circle_scale = scr_approach(circle_scale, 200, 3);
        if (circle_scale == 200)
        {
            action = 1;
            with (obj_mike_battle)
            {
                visible = false;
                move = true;
                action = 0;
                var a = snd_play(snd_boost);
                sound_volume(a, 0.5, 0);
            }
        }
    }
    if (action == 1)
    {
        circle_scale += circle_speed;
        circle_speed += 1;
        circle_alpha -= 0.05;
        if (circle_alpha <= 0)
        {
            action = 2;
            with (obj_mike_attack_controller)
                wave = 1;
        }
    }
    if (action == 2)
    {
        timer += 1;
        if (timer > 15)
            y += (((cameray() + 100) - y) * 0.2);
        if (timer > 30)
        {
            action = 3;
            timer = 0;
            with (obj_mike_attack_controller)
                wave = 2;
        }
    }
    if (hp < 3)
    {
        timer = 0;
        action = 0;
        phase = 1;
        exit;
    }
    if (action == 3)
    {
        rot_speed2 = scr_approach(rot_speed2, 2 + ((1 - (hp / hp_max)) * 2), 1);
        rot_speed += ((rot_speed2 - rot_speed) * 0.2);
        counter += (0.05 + ((1 - (hp / hp_max)) * 0.2));
        xx = camerax() + (camerawidth() / 2) + (cos(counter) * 160);
        x += ((xx - x) * spd);
        spd = scr_approach(spd, 0.5, 0.01);
        timer += 1;
        if (timer >= attack_timer)
        {
            action = 4;
            timer = spin_timer;
            with (obj_mike_attack_controller)
            {
                counter = other.timer;
                x = other.x;
            }
        }
    }
    if (action == 4)
    {
        rot_speed += spin_speed;
        timer -= 1;
        if (timer <= 0)
        {
            action = 5;
            sound_play(snd_screenshake);
            active = true;
        }
    }
    if (action == 5)
    {
        timer += 1;
        if (timer > 45)
        {
            y += (((cameray() + 80) - y) * 0.2);
            if (timer > 60)
            {
                timer = 0;
                action = 3;
                active = false;
                attack_timer = irandom_range(30, 60);
            }
        }
        else
        {
            rot_speed = scr_approach(rot_speed, 0, 4);
            y = scr_approach(y, obj_mike_controller.y + 100, 16);
        }
    }
}
if (phase == 1)
{
    timer += 1;
    if (hp <= 0)
    {
        timer = 0;
        active = false;
    }
    if (action == 0)
    {
        vspeed += 1;
        if (y > (cameray() + cameraheight()))
        {
            if (timer > 10)
            {
                y = cameray() - 120;
                x = camerax() + (camerawidth() / 2);
                vspeed = 0;
                timer = attack_timer;
                action = 1;
                hp = 5;
                with (obj_mike_bigcat)
                    happiness_speed = 0.25;
                xs = 0.75;
                with (obj_mike_attack_controller)
                    wave = 3;
            }
        }
        else
        {
            timer = 0;
        }
    }
    if (action == 1)
    {
        if (timer >= attack_timer)
        {
            action = 2;
            timer = spin_timer;
            with (obj_mike_attack_controller)
            {
                counter = other.timer;
                x = other.x;
            }
        }
    }
    if (action == 2)
    {
        rot_speed += spin_speed;
        timer -= 2;
        if (timer <= 0)
        {
            action = 3;
            timer = 0;
            active = true;
            sound_play(snd_screenshake);
        }
    }
    if (action == 3)
    {
        if (hp == 5)
            vspeed += 3;
        else
            vspeed += (5 + (5 - hp));
        if (y > (cameray() + cameraheight()))
        {
            if (timer > (hp * 8))
            {
                rot_speed = 4;
                playsound = 0;
                vspeed = 0;
                action = 1;
                attack_timer = 5 + (hp * 2);
                y = cameray() - 120;
                side += 1;
                if (side < 3)
                {
                    if (choose(1, 0))
                        x = camerax() + (camerawidth() / 2);
                    else
                        x = obj_mike_controller.x;
                }
                else
                {
                    side = 0;
                    x = camerax() + (camerawidth() / 2) + (lastside * 100);
                    lastside = -lastside;
                }
            }
        }
        else if (y > cameray())
        {
            repeat (3)
            {
                var a = scr_afterimage_cat();
                a.image_speed = 1;
                with (a)
                {
                    motion_add(point_direction(other.x, other.y, x, y), 2);
                    vspeed = -2;
                }
            }
            scr_shakescreen();
        }
    }
}
if (phase == 2)
{
    if (action == 0)
    {
        timer += 1;
        if (timer > 90)
        {
            mus_volume(global.currentsong[1], 1, 100);
            shake = 0;
            with (obj_mike_attack_controller)
            {
                action = 16;
                wave = 0;
                timer = 0;
                mike = 3;
                txt_wait = 5;
                move_party = true;
            }
            with (obj_herokris)
                idlesprite = spr_krisb_idle;
            with (obj_herosusie)
            {
                idlesprite = spr_susieb_idle;
                if (global.charweapon[2] == 0)
                    idlesprite = spr_susieb_idle_unarmed;
            }
            with (obj_heroralsei)
            {
                y = ystart;
                state = 0;
                idlesprite = spr_ralsei_idle;
            }
            with (obj_heroparent)
                sprite_index = idlesprite;
            with (obj_mike_battle)
            {
                move = false;
                action = 0;
                visible = true;
                y = ystart;
            }
            instance_destroy();
        }
    }
}
