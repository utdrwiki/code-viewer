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
var _bottom = 340;
var _vol = obj_mike_controller.microphone_volume / 50;
if (action == 1)
{
    image_angle = 0;
    thrown = 0;
    x = obj_mike_controller.mx;
    y = obj_mike_controller.my + 24;
    sprite_index = spr_mike_cat_hold;
    if (!grab_snd)
    {
        grab_snd = 1;
        var _s = snd_play(snd_item);
        snd_volume(_s, 0.25, 0);
    }
    image_xscale = 0.5;
    image_yscale = 1.5;
}
else
{
    image_xscale = 1;
    image_yscale = 1;
    grab_snd = -1;
    sprite_index = spr_mike_cat_dance;
}
if (action == 0)
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
    if (speed > 0 && gravity == 0)
    {
        var _a = scr_afterimage();
        _a.image_blend = merge_colour(c_gray, c_black, 0.75);
    }
}
image_angle -= hspeed;
if (action == 5)
    action = 0;
var _o = collision_circle(x, y, 10, obj_blue_cat, 1, 1);
if (_o)
{
    if (_o.action != 1)
    {
        var _h = lengthdir_x(1, point_direction(_o.x, _o.y, x, y));
        var _v = lengthdir_y(1, point_direction(_o.x, _o.y, x, y));
        hspeed += (_h / 2);
        vspeed += (_v / 2);
        x += _h;
        y += _v;
    }
}
buffer--;
score_buffer--;
fever_timer--;

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
