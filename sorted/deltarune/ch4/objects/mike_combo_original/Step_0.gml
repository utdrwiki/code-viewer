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
        y += (((cameray() + 120) - y) * 0.2);
    if (timer > 30)
    {
        action = 3;
        timer = 0;
        with (obj_mike_attack_controller)
            wave = 2;
    }
}
if (action > 0)
{
    image_angle += rot_speed;
    image_xscale += ((2 - image_xscale) * 0.2);
    image_yscale = image_xscale;
    cooldown -= 1;
}
if (action == 3)
{
    if (hp > 1 && hp < hp_max)
        hp = scr_approach(hp, 1, dot);
    rot_speed2 = scr_approach(rot_speed2, 2 + ((1 - (hp / hp_max)) * 2), 1);
    rot_speed += ((rot_speed2 - rot_speed) * 0.2);
    counter += (0.05 + ((1 - (hp / hp_max)) * 0.1));
    xx = camerax() + (camerawidth() / 2) + (cos(counter) * 180);
    x += ((xx - x) * 0.5);
    timer += 1;
    if (timer >= attack_timer)
    {
        action = 4;
        timer = 60;
        with (obj_mike_attack_controller)
        {
            counter = other.timer;
            x = other.x;
        }
    }
}
if (action == 4)
{
    rot_speed += 1;
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
    if (timer > 30)
    {
        y += (((cameray() + 120) - y) * 0.2);
        if (timer > 60)
        {
            timer = 0;
            action = 3;
            active = false;
            attack_timer = irandom_range(30, 120);
        }
    }
    else
    {
        rot_speed = scr_approach(rot_speed, 0, 4);
        y = scr_approach(y, obj_mike_controller.y + 60, 16);
    }
}
if (hp <= 0 && action < 6)
{
    action = 6;
    timer = 0;
}
if (action == 6)
{
    y = scr_approach(y, obj_mike_controller.y - 150, 4);
    rot_speed = scr_approach(rot_speed, 0, 1);
    timer += 1;
    if (timer > 90)
    {
        sound_play(snd_pombark);
        with (obj_mike_attack_controller)
            action = 16;
        instance_destroy();
    }
}
