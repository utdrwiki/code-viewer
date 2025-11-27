if (dashcon == 1)
{
    direction = point_direction(x, y + 16, 170 + irandom(295), 270);
    if (global.shadow_mantle_losses < 7)
        gravity = 0.24;
    else
        gravity = 0.2;
    gravity_direction = direction;
    speed = 2;
    dashtimer = 28;
    dashcon = 2;
    snd_stop(snd_board_mantle_dash_slow);
    snd_play_pitch(snd_board_mantle_dash_slow, 0.95 + random(0.1));
}
if (dashcon == 2)
{
    dashtimer++;
    if (dashtimer >= 30 && (dashtimer % 2) == 0 && i_ex(obj_shadow_mantle_enemy))
    {
        if (global.shadow_mantle_losses < 7)
            gravity += 0.03;
        else if (global.shadow_mantle_losses < 14)
            gravity += 0.023;
        else
            gravity += 0.017;
        instance_create_depth(x + 16, y + 16, depth + 1, obj_shadow_mantle_groundfire);
    }
    instance_create_depth(x + 16 + lengthdir_x(speed, direction), y + 16 + lengthdir_y(speed, direction), depth - 1, obj_shadow_mantle_dash_hitbox);
    if (y > (cameray() + cameraheight()) || y < (cameray() - 100) || x < (camerax() + 32) || x > (camerax() + camerawidth()))
        instance_destroy();
}
