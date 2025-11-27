image_angle = direction;
var a = 115;
if (i_ex(obj_growtangle))
{
    if (x < (obj_growtangle.x - a) || x > (obj_growtangle.x + a) || y < (obj_growtangle.y - a) || y > (obj_growtangle.y + a))
    {
        image_alpha -= 0.1;
        if (image_alpha < 0)
            instance_destroy();
    }
}
else
{
    instance_destroy();
}
