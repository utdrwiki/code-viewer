if (timer < 16)
{
    timer++;
    speed = lerp(speed, 4, timer / 15);
}
if (timer < 11)
    y = lerp(ystart, ypos[pos], timer / 10);
if (timer > 15)
{
    timer++;
    speed = lerp(4, 20, (timer - 15) / 40);
}
if (direction == 180 && x < (obj_growtangle.x - 75))
    image_alpha -= 0.1;
if (direction == 0 && x > (obj_growtangle.x + 75))
    image_alpha -= 0.1;
if (image_alpha < 0)
    instance_destroy();
if (global.turntimer < 1)
    instance_destroy();
