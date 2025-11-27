if (global.turntimer > 1)
{
    image_alpha -= 0.1;
}
else
{
    timer++;
    if (timer < 10)
        image_alpha += 0.1;
    if (timer > 40)
        image_alpha -= 0.1;
}
if (image_alpha < 0)
    instance_destroy();
