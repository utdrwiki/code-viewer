timer++;
if (timer == 30)
{
    gravity = 0.01;
    active = 1;
    image_alpha = 1;
}
var a = 200;
if (x < (obj_growtangle.x - a) || x > (obj_growtangle.x + a) || y < (obj_growtangle.y - a) || y > (obj_growtangle.y + a))
{
    image_alpha -= 0.1;
    if (image_alpha < 0.1)
        instance_destroy();
}
