image_xscale -= 0.4;
if (image_xscale < 0)
    instance_destroy();
if (o == 1)
    dir += 4;
else
    dir -= 4;
if (i_ex(obj_knight_lightorb))
{
    x = xstart + lengthdir_x(len, dir);
    y = ystart + lengthdir_y(len, dir);
    image_angle = dir;
}
else
{
    instance_destroy();
}
