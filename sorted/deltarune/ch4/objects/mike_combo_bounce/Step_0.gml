if (active)
    image_blend = c_white;
else
    image_blend = merge_colour(c_white, c_navy, 0.5);
if (hp < (hp_max * 0.75))
{
    var a = scr_afterimagefast();
    a.image_xscale = image_xscale * xscale * sc;
    a.image_yscale = image_yscale * yscale * sc;
    a.image_angle = angle;
    a.fadeSpeed = 0.25;
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
            x = xstart;
            y = ystart;
            visible = false;
            move = true;
            action = 0;
            var a = snd_play(snd_boost);
            sound_volume(a, 0.25, 0);
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
        tail = 15;
        sound_play(snd_screenshake);
        motion_set(point_direction(x, y, camerax() + 200, cameray() + cameraheight()), 8);
        timer = 0;
        with (obj_mike_attack_controller)
            wave = 2;
    }
}
if (action > 0)
{
    angle += (rot_speed + speed);
    xscale += ((2 - xscale) * 0.2);
    yscale = xscale;
    cooldown -= 1;
}
if (action == 3)
{
    speed = scr_approach(speed, maxspeed, 0.5);
    bounce -= 1;
    if (cooldown == 0)
        friction = 0;
    if (cooldown < 0)
    {
        if (hp > (hp_max * 0.75))
            active = true;
        rot_speed2 = scr_approach(rot_speed2, 2 + ((1 - (hp / hp_max)) * 2), 1);
        rot_speed += ((rot_speed2 - rot_speed) * 0.2);
    }
    else
    {
        rot_speed = scr_approach(rot_speed, 0, 4);
        active = false;
    }
}
if (hp <= 0 && action < 6)
{
    action = 6;
    timer = 0;
    active = false;
}
if (shake)
    scr_shakescreen();
if (action == 6)
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
if (hp > 1 && hp < hp_max)
    hp = scr_approach(hp, 1, dot);
