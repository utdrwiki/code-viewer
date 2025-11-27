if (!on_fire)
    hspeed = clamp_gradual(hspeed, 0, 0, 1);
if (obj_ch3_b4_chef_controller.gameover)
{
    speed = 0;
    exit;
}
if (y >= floor_y && falling)
{
    y = floor_y;
    instance_destroy();
    exit;
}
if (!falling && y < -16)
{
    falling = true;
    vspeed = fallspeed;
    x = 320 + (irandom(124) * choose(-1, 1));
    y = -16;
}
if (falling)
{
    fallspeed = 3 + (1 * ((90 - obj_ch3_b4_chef_controller.timer) / 60));
    vspeed = fallspeed;
}
