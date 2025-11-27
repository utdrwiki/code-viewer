var _width = 50 + (obj_mike_controller.line_width / 2) + (obj_mike_controller.hand_distance / 2);
vspeed = clamp(vspeed, -12, 6 + min(3, max(0, obj_mike_attack_controller.difficulty - 3)));
x = clamp(x, (room_width / 2) - _width, (room_width / 2) + _width);
var _o = collision_circle(x, y, 10, obj_mike_ball, 1, 1);
if (_o)
{
    if (_o.sprite_index == sprite_index)
    {
        wobble = 4;
        x += lengthdir_x(1, point_direction(_o.x, _o.y, x, y));
        y += lengthdir_y(1, point_direction(_o.x, _o.y, x, y));
    }
}
if (act == 0)
{
    gravity = lerp(gravity, 1, 0.01);
    hspeed *= 0.99;
}
if (act == 1)
{
    if (y < cameray())
        vspeed *= 0.5;
    if (y < (cameray() + 120))
    {
        vspeed *= 0.95;
        hspeed *= 0.99;
        if (vspeed == 0)
        {
            gravity = 0.1;
            alarm[0] = -1;
            act = 0;
        }
    }
}
if (act == 2)
{
    gravity = 1;
    gravity_direction = 90;
    if (y < -32)
        instance_destroy();
}
if (y > room_height)
{
    scr_sparkle(8);
    with (obj_mike_minigame_controller)
        game_over = true;
    instance_destroy();
}
