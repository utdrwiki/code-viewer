if (i_ex(obj_knight_lightorb) && distance_to_object(obj_knight_lightorb) > 176)
{
    image_alpha -= 0.2;
    if (image_alpha <= 0)
        instance_destroy();
}
if (i_ex(obj_knight_lightorb))
    depth = obj_knight_lightorb.depth - 10;
if (x < (obj_growtangle.xstart - 70))
    direction = 45;
if (x > (obj_growtangle.xstart + 52))
    direction = 225;
if (y < (obj_growtangle.y - 122))
    direction = 315;
if (y > (obj_growtangle.y + 100))
    direction = 135;
image_angle = direction;
visible = true;
if (timer == 40)
    instance_destroy();
timer++;
