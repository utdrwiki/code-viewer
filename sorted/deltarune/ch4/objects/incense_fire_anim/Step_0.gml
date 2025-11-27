if (parentid != -1 && i_ex(parentid))
{
}
else
{
    instance_destroy();
    exit;
}
x = parentid.x + lengthdir_x(len, dir + parentid.image_angle);
y = parentid.y + lengthdir_y(len, dir + parentid.image_angle);
