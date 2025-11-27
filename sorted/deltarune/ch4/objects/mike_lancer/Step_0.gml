var _width = 64 + (obj_mike_controller.line_width / 2);
vspeed = clamp(vspeed, -12, 7 + hits);
x = clamp(x, (room_width / 2) - _width, (room_width / 2) + _width);
if (act == 0)
{
    gravity = lerp(gravity, 1 + (hits * 0.5), 0.1);
    sprite_index = spr_lancer_ball;
}
if (act == 1)
{
    hspeed *= 0.99;
    sprite_index = spr_lancer_wave;
    image_index = max(4, image_index);
    if (y < 200)
        vspeed *= 0.95;
}
if (image_index > 8)
    image_index = 4;
if (y > room_height)
{
    scr_sparkle(8);
    with (obj_mike_minigame_controller)
        game_over = true;
    instance_destroy();
}
if (hits >= max_hits)
{
    act = 2;
    gravity_direction = 90;
}
if (act == 2)
{
    sprite_index = spr_lancer_wave;
    image_index = max(4, image_index);
    if (y < -32)
        instance_destroy();
}
