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
else if (!scr_outside_camera(32) && action == 4)
{
    wall_destroy = 1;
}
if (action != 2.5)
    image_speed = abs(speed) * 0.33;
if (action == 0)
{
    if (point_distance(x, y, xstart, ystart) > 25)
        motion_add(point_direction(x, y, xstart, ystart), 0.25);
    else
        friction = 0.3;
    if (instance_number(obj_mike_catbasket) == 0)
        action = 4;
}
if (action == 1)
{
    thrown = 0;
    x = obj_mike_controller.mx;
    y = obj_mike_controller.my + 24;
}
if (action == 2)
{
    if (speed == 0)
    {
        action = 3;
        wait = wait_max;
        xx = x;
        yy = y;
        image_index = 0;
        image_speed = 0;
    }
}
if (action == 3)
{
    wait -= 1;
    if (wait <= 0)
    {
        action = 2.5;
        image_speed = 1;
        sprite_index = spr_mike_cat_dance;
    }
}
if (action == 4)
{
    wait -= 1;
    if (wait < 0 && speed == 0)
    {
        sprite_index = spr_mike_cat_walk;
        image_speed = 2;
        friction = -0.25;
        xscale = -xscale;
        motion_set(direction, 0.25);
    }
}
if (action > 1)
{
    x = clamp(x, 40, 600);
    y = clamp(y, -40, room_height - 40);
    if (y < 0)
        vspeed += 2;
}
if (action == 5)
{
    if (thrown == 0)
    {
        var _averagex2frame = (x + xprevious) / 2;
        var _averagey2frame = (y + yprevious) / 2;
        var _averagex4frame = (last_x[1] + last_x[2]) / 2;
        var _averagey4frame = (last_y[1] + last_y[2]) / 2;
        var _spd = max(2, point_distance(_averagex4frame, _averagey4frame, _averagex2frame, _averagey2frame) / 4);
        motion_set(point_direction(_averagex4frame, _averagey4frame, _averagex2frame, _averagey2frame), _spd);
        if (_spd > 2)
        {
            thrown = 1;
            var _s = snd_play_pitch(snd_meow, random_range(0.8, 1));
            snd_volume(_s, 0.25, 0);
        }
    }
    throwing--;
    if (abs(hspeed) > 0 && throwing > 0)
    {
        var _a = scr_afterimage();
        _a.image_blend = merge_colour(c_aqua, c_black, 0.8);
    }
    hspeed *= 0.9;
    if (y < -sprite_height)
        vspeed = 4;
    var yadd = 290;
    if (i_ex(obj_mike_minigame_controller))
        yadd = 330;
    if (y >= ((cameray() + yadd) - 10))
    {
        vspeed = 0;
        y = cameray() + yadd;
        gravity = 0;
        if (x < (camerax() + (camerawidth() / 2)))
            side = 1;
        else
            side = -1;
        xscale = side;
        sprite_index = spr_mike_cat_walk;
        hspeed = 0;
        friction = 0.25;
        action = 2;
    }
    else
    {
        gravity = 1;
    }
}

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
