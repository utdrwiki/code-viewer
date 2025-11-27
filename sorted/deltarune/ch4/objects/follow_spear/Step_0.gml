image_alpha += 0.05;
image_angle -= rotspeed;
if (rotspeed > 0)
    rotspeed -= 2;
if (rotspeed == 0 && speed < 1)
{
    timer++;
    if (timer == 5)
    {
        speed = 8;
        friction = -0.3;
        direction = image_angle;
        image_angle = direction;
    }
}
if (fade == 1 && speed >= 7)
{
    timer++;
    if (timer >= 22)
        deactivate = 1;
}
if (deactivate == 1)
{
    image_alpha -= 0.25;
    if (image_alpha <= 0)
        instance_destroy();
}
if (global.turntimer < 1)
    instance_destroy();
