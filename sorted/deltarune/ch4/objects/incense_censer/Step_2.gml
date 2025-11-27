creatorid.x = x - 60;
creatorid.y = y - 40;
creatorid.image_angle = image_angle;
if (global.turntimer < 1)
    instance_destroy();
if (global.turntimer < 3)
{
    with (obj_animation)
    {
        if (sprite_index == spr_incense_fire_explosion1 || sprite_index == spr_incense_fire_explosion1c)
            instance_destroy();
    }
}
timer++;
if (depthinit == 0)
{
    depthinit = 1;
    creatordepthsave = creatorid.depth;
    creatorid.depth = obj_heart.depth - 100;
}
if (global.turntimer <= 12 && !do_return)
    do_return = true;
acceleration_val = scr_approach(acceleration_val, 0.25, 0.01);
if (do_return)
{
    cur_angle = scr_approach(cur_angle, 270, abs(cur_angle - 270) * 0.25);
    hang_x = scr_approach(hang_x, anchor_x, abs(hang_x - anchor_x) * acceleration_val);
    height = scr_approach(height, anchor_y - hang_y, abs(height - (anchor_y - hang_y)) * 0.25);
}
else
{
    cur_angle = hangle + (sin(timer * 0.1) * swing_max);
    hang_x = scr_approach(hang_x, obj_growtangle.x, abs(hang_x - obj_growtangle.x) * acceleration_val);
    height = scr_approach(height, height_goal, abs(height - height_goal) * 0.25);
}
x = hang_x + lengthdir_x(height, cur_angle);
y = hang_y + lengthdir_y(height, cur_angle);
if (timer < 20 || do_return)
    exit;
if ((((scr_monsterpop() > 1 && (timer % (13 + floor(15 * ratio))) == 0) || (timer % (13 + floor(15 * ratio))) == 5) && (instance_number(obj_balthizard_enemy) > 1 || lightup == false)) || (scr_monsterpop() == 3 && (timer % 7) == 0 && lightup == true && instance_number(obj_balthizard_enemy) == 1) || (scr_monsterpop() == 2 && (timer % 7) == 0 && lightup == true && instance_number(obj_balthizard_enemy) == 1) || (scr_monsterpop() == 1 && (timer % 3) == 0 && lightup == true) || (scr_monsterpop() == 1 && (timer % 10) == 0 && lightup == false))
{
    var rng_angle = irandom_range(-15, 15);
    if (lightup == true)
    {
        d = instance_create(x, y, obj_incense_bullet);
        d.sprite_index = spr_bullet_ghostfire_turtle;
        d.direction = 270 + rng_angle;
        d.speed = 1.5;
        d.gravity_direction = direction;
        d.friction = -0.2;
        d.depth = obj_heart.depth - 1;
        d.image_angle = 0;
        d.image_speed = 0.25;
        d.image_xscale = 0.75;
        d.image_yscale = 0.75;
        d.damage = damage;
        d.grazepoints = 2.5;
        d.target = target;
    }
    else
    {
        d = instance_create(x, y, obj_incense_bullet);
        d.sprite_index = spr_incense_turtle_smoke_bullet;
        d.direction = 270 + rng_angle;
        d.speed = 1.5;
        d.gravity_direction = direction;
        d.friction = -0.05;
        d.depth = obj_heart.depth - 1;
        d.spin = 1;
        d.spinspeed = 1;
        d.grazepoints = 2;
        d.damage = damage;
        d.target = target;
        d = instance_create(x, y, obj_incense_bullet);
        d.sprite_index = spr_incense_turtle_smoke_bullet;
        d.direction = (270 + rng_angle) - 15;
        d.speed = 3.5;
        d.gravity_direction = direction - 90;
        d.friction = -0.05;
        d.depth = obj_heart.depth - 1;
        d.spin = 1;
        d.spinspeed = 1;
        d.damage = damage;
        d.target = target;
        d.grazepoints = 2;
        d = instance_create(x, y, obj_incense_bullet);
        d.sprite_index = spr_incense_turtle_smoke_bullet;
        d.direction = 270 + rng_angle + 15;
        d.speed = 3.5;
        d.gravity_direction = direction + 90;
        d.friction = -0.05;
        d.depth = obj_heart.depth - 1;
        d.spin = 1;
        d.spinspeed = -1;
        d.damage = damage;
        d.target = target;
        d.grazepoints = 2;
    }
    if (con == 0)
        con = 1;
    else
        con = 0;
}
