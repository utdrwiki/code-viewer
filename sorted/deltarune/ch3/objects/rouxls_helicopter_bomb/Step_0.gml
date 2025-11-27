siner += 0.85;
image_angle = (sin(siner / 6) * 14) - 2;
siner2 += 0.5;
x = xstart + (sin(siner2 / 6) * 3);
if (global.turntimer < 1)
    instance_destroy();
if (y > (obj_growtangle.y + 80))
    fade = 1;
if (fade == 1)
{
    image_alpha -= 0.1;
    if (image_alpha < 0)
        instance_destroy();
}
