hh += 10;
xx = x + (sin(hh / 200) * (9 * abs(vspeed)));
timer++;
if (timer > timer_max)
{
    image_alpha -= 0.1;
    if (image_alpha <= 0)
        instance_destroy();
}
