if (!i_ex(obj_growtangle))
    exit;
if (global.turntimer < 1)
{
    instance_destroy();
    exit;
}
timer++;
var pop = scr_monsterpop();
if (global.turntimer <= 12 && !skipme)
{
    if (instance_exists(turn))
    {
        with (turn)
            instance_destroy();
    }
    temp_x = anchor_x;
    temp_y = anchor_y;
    scr_lerpvar_instance(id, "x", x, initial_x, 12);
    scr_lerpvar_instance(id, "y", y, initial_y, 12);
    speed = 0;
    direction = 0;
    skipme = true;
    timer = 0;
}
if (skipme)
{
    image_angle = lerp(image_angle, 360, timer / 12);
    exit;
}
if (pop == sameattack)
{
    if (pop == 1)
    {
        range = 100;
        anchor_y = obj_growtangle.y;
    }
    if (pop == 2)
    {
        range = 50;
        switch (sameattacker)
        {
            case 0:
                anchor_y = obj_growtangle.y - 60;
                break;
            case 1:
                anchor_y = obj_growtangle.y + 60;
                break;
        }
    }
}
if (timer == 24)
{
    temp_x = anchor_x + irandom_range(-20, 60);
    temp_y = anchor_y + irandom_range(-range, range);
    if (sameattack < 2 || irandom(2))
        temp_angle = point_direction(temp_x, temp_y, obj_heart.x, obj_heart.y) + irandom_range(-6, 6);
    else
        temp_angle = point_direction(temp_x, temp_y, obj_growtangle.x - (obj_growtangle.sprite_width / 2), obj_growtangle.y);
    turn = scr_lerpvar_instance(id, "image_angle", image_angle, temp_angle + 90, 10);
}
if (timer == 19)
    save_angle = image_angle;
if (timer >= 19 && timer < 24 && first_turn == false)
    image_angle = lerp(image_angle, save_angle - 30, (timer - 19) / 5);
if (timer >= 24 && timer < 34)
{
    first_turn = true;
    image_angle = lerp(image_angle, temp_angle + 90, (timer - 24) / 10);
}
if (timer == 34)
    greenflash = 1;
if (timer >= 34 && timer < 39)
{
    direction = temp_angle;
    speed -= 0.2;
    savex = x;
    savey = y;
    targetx = x + lengthdir_x(100, direction);
    targtey = y + lengthdir_y(100, direction);
}
if (timer >= 39 && timer <= 42)
{
    speed = 0;
    timer2++;
    x = lerp(savex, targetx, timer2 / 4);
    y = lerp(savey, targtey, timer2 / 4);
    if (timer >= 39 && timer <= 41)
    {
        a = scr_afterimage();
        a.fadeSpeed = 0.1;
    }
    if (timer == 39)
        snd_play(motor_upper_quick_high);
}
else
{
    timer2 = 0;
}
if (timer == 42)
{
    var t_x = x + lengthdir_x(48, temp_angle);
    var t_y = y + lengthdir_y(48, temp_angle);
    if (pop == sameattack)
    {
        with (scr_fire_bullet(t_x, t_y, obj_regularbullet, temp_angle, (3.75 - (0.5 * pop)) + (0.25 * sameattacker), spr_bullet_batstab))
        {
            damage = other.damage;
            target = other.target;
            grazepoints = 2.5;
            image_angle = other.temp_angle;
            gravity_direction = direction;
            friction = -0.035;
            if (pop > other.sameattack)
                friction += 0.015;
        }
        with (scr_fire_bullet(t_x + lengthdir_x(40, temp_angle - 155), t_y + lengthdir_y(40, temp_angle - 155), obj_regularbullet, temp_angle - 3 - (pop * 3), (7.25 - (0.5 * pop)) + (0.25 * sameattacker), spr_bullet_batstab))
        {
            damage = other.damage;
            target = other.target;
            grazepoints = 2.5;
            image_angle = other.temp_angle;
            gravity_direction = direction;
            friction = -0.035;
            if (pop > other.sameattack)
                friction += 0.015;
        }
        with (scr_fire_bullet(t_x + lengthdir_x(80, temp_angle - 155), t_y + lengthdir_y(80, temp_angle - 155), obj_regularbullet, temp_angle - 6 - (pop * 3), (10.75 - (0.5 * pop)) + (0.25 * sameattacker), spr_bullet_batstab))
        {
            damage = other.damage;
            target = other.target;
            grazepoints = 2.5;
            image_angle = other.temp_angle;
            gravity_direction = direction;
            friction = -0.035;
            if (pop > other.sameattack)
                friction += 0.015;
        }
        with (scr_fire_bullet(t_x + lengthdir_x(40, temp_angle + 155), t_y + lengthdir_y(40, temp_angle + 155), obj_regularbullet, temp_angle + 3 + (pop * 3), (7.25 - (0.5 * pop)) + (0.25 * sameattacker), spr_bullet_batstab))
        {
            damage = other.damage;
            target = other.target;
            grazepoints = 2.5;
            image_angle = other.temp_angle;
            gravity_direction = direction;
            friction = -0.035;
            if (pop > other.sameattack)
                friction += 0.015;
        }
        with (scr_fire_bullet(t_x + lengthdir_x(80, temp_angle + 155), t_y + lengthdir_y(80, temp_angle + 155), obj_regularbullet, temp_angle + 6 + (pop * 3), (10.75 - (0.5 * pop)) + (0.25 * sameattacker), spr_bullet_batstab))
        {
            damage = other.damage;
            target = other.target;
            grazepoints = 2.5;
            image_angle = other.temp_angle;
            gravity_direction = direction;
            friction = -0.035;
            if (pop > other.sameattack)
                friction += 0.015;
        }
    }
    else
    {
        with (scr_fire_bullet(t_x, t_y, obj_regularbullet, temp_angle, (3.75 - (0.5 * pop)) + (0.25 * sameattacker), spr_bullet_batstab))
        {
            damage = other.damage;
            target = other.target;
            grazepoints = 2.5;
            image_angle = other.temp_angle;
            gravity_direction = direction;
            friction = -0.035;
            if (pop > other.sameattack)
                friction += 0.015;
        }
        with (scr_fire_bullet(t_x + lengthdir_x(80, temp_angle - 170), t_y + lengthdir_y(80, temp_angle - 170), obj_regularbullet, temp_angle - 3 - (pop * 3), (7.25 - (0.5 * pop)) + (0.25 * sameattacker), spr_bullet_batstab))
        {
            damage = other.damage;
            target = other.target;
            grazepoints = 2.5;
            image_angle = other.temp_angle;
            gravity_direction = direction;
            friction = -0.035;
            if (pop > other.sameattack)
                friction += 0.015;
        }
        with (scr_fire_bullet(t_x + lengthdir_x(80, temp_angle + 170), t_y + lengthdir_y(80, temp_angle + 170), obj_regularbullet, temp_angle + 3 + (pop * 3), (7.25 - (0.5 * pop)) + (0.25 * sameattacker), spr_bullet_batstab))
        {
            damage = other.damage;
            target = other.target;
            grazepoints = 2.5;
            image_angle = other.temp_angle;
            gravity_direction = direction;
            friction = -0.035;
            if (pop > other.sameattack)
                friction += 0.015;
        }
    }
}
if (speed < 0.1)
{
    if (timer > 42)
    {
        y = scr_approach_curve(y, y + (sin(timer * 0.1) * 8), 12);
    }
    else
    {
        x = scr_approach_curve(x, temp_x, 8);
        y = scr_approach_curve(y, temp_y, 8);
    }
}
if (sameattack == pop)
{
    if (pop == 1)
        timer_limit = 48 * ratio;
    else
        timer_limit = 40 + (24 * ratio);
}
else
{
    timer_limit = 34 * ratio;
}
if (timer >= timer_limit)
{
    speed = 0;
    timer = 20;
}
