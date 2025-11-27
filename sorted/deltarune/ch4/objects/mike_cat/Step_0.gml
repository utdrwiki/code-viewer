if (wall_destroy == 1)
{
    if (x < (__view_get(e__VW.XView, 0) - 80))
        instance_destroy();
    if (x > (__view_get(e__VW.XView, 0) + 760))
        instance_destroy();
    if (y < (__view_get(e__VW.YView, 0) - 80))
        instance_destroy();
    if (y > (__view_get(e__VW.YView, 0) + 580))
        instance_destroy();
}
else if (!scr_outside_camera(32))
{
    wall_destroy = 1;
}
scale += ((1 - scale) * 0.25);
image_xscale += ((scale - image_xscale) * 0.25);
image_yscale = image_xscale;
if (speed > max_speed)
    speed = max_speed;
if (action == 0)
{
    wait -= 1;
    if (wait < 0)
    {
        motion_add(point_direction(x, y, xstart, ystart), 0.25);
        if ((point_distance(x, y, obj_mike_attack_controller.x, obj_mike_controller.y) < mydist && !flip) || point_distance(x, y, xstart, ystart) < 10)
        {
            friction = 0.5;
            image_alpha = 1;
            active = true;
            action = 2;
            wait = wait_time;
            xx = x;
            yy = y;
            image_index = 0;
            image_speed = 0;
            if (flip)
                side = -side;
        }
    }
}
if (action == 2)
{
    x = clamp(x, 40, 600);
    y = clamp(y, -40, room_height - 40);
    wait -= 1;
    if (wait < (wait_time * 0.25))
    {
        x = xx + choose(-2, 2);
        y = yy + choose(-2, 2);
    }
    else
    {
        xx = x;
        yy = y;
    }
    image_blend = merge_colour(c_red, c_white, wait / wait_time);
    if (wait <= 0)
    {
        action = 3;
        wait = 15;
        image_speed = 0.5;
        sprite_index = spr_mike_cat_attack;
        direction = point_direction(x, y, obj_mike_controller.x, obj_mike_controller.y) - 180;
        instance_create_depth(x, y, depth - 1, obj_mike_hairball);
        meow = snd_play(snd_meow_angry);
        sound_pitch(meow, random_range(0.9, 1.1));
    }
}
if (action == 3)
{
    wait -= 1;
    if (wait < 0 && speed == 0)
    {
        sprite_index = spr_mike_cat_walk;
        image_speed = 1;
        friction = -0.5;
        direction = point_direction(x, y, obj_mike_controller.x, obj_mike_controller.y) - 180;
        motion_set(direction, 1);
        if (x > obj_mike_controller.x)
            side = 1;
        else
            side = -1;
    }
}
if (sprite_index == spr_mike_cat_dance)
    image_alpha -= 0.05;

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
