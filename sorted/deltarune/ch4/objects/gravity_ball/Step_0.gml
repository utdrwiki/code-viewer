var _bottom = 340;
var _vol = obj_mike_controller.microphone_volume / 50;
if (action == 1)
{
    thrown = 0;
    x = obj_mike_controller.mx;
    y = obj_mike_controller.my + 24;
    if (!grab_snd)
    {
        grab_snd = 1;
        var _s = snd_play(snd_item);
        snd_volume(_s, 0.25, 0);
    }
}
else
{
    grab_snd = -1;
}
if (!place_meeting(x, y, obj_gravity_hoop))
    can_score = true;
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
    if (y > (cameray() + _bottom))
    {
        y = cameray() + _bottom;
        vspeed = -abs(vspeed * irandom_range(0.7, 0.9));
        hspeed *= 0.5;
        action = 2;
    }
}
if (action == 2)
{
    if (y >= (cameray() + _bottom))
    {
        y = cameray() + _bottom;
        vspeed = -abs(vspeed * irandom_range(0.8, 0.9));
        hspeed -= 0.2;
        if (x > 140)
        {
            if (hspeed > -2)
                hspeed = -2;
        }
        else
        {
            hspeed *= 0.5;
        }
    }
}
image_angle -= hspeed;
if (action == 5)
    action = 0;
var lbound = camerax() + 10;
var rbound = camerax() + 900;
var ubound = cameray() - 200;
var dbound = cameray() + _bottom;
if (x < lbound)
{
    hspeed = abs(hspeed);
    x = lbound + 1;
}
if (x > rbound)
{
    hspeed = -abs(hspeed);
    x = rbound - 1;
}
if (y < ubound)
{
    if (vspeed < 1)
        vspeed = 1;
    y = ubound + 1;
}
if (y > dbound)
{
    vspeed = -abs(vspeed);
    y = dbound - 1;
}
if (x < (lbound + 50) && y > (dbound - 50))
{
    x = lbound + 50;
    y = dbound - 50;
}
var _o = collision_circle(x, y, 10, obj_gravity_ball, 1, 1);
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
if (action != 1)
{
    if (_vol > 0.2)
    {
        gravity = _vol;
        friction = 0.1;
        hspeed -= lengthdir_x(_vol / 5, point_direction(obj_mike_controller.mx, obj_mike_controller.my + 24, obj_heart.x + 10, obj_heart.y + 10));
    }
    else
    {
        gravity = 0;
        friction = 0;
    }
}
if (fever_timer >= 0)
{
    var _a = instance_create(x, y, obj_animation);
    _a.sprite_index = spr_realisticexplosion;
    _a.image_speed = 1;
    _a.depth = depth + 1;
    with (_a)
        scr_lerpvar("image_alpha", 1, 0, 16);
}
score_buffer--;
fever_timer--;
