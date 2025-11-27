if (global.turntimer < 1)
    instance_destroy();
if (!i_ex(parentid) || parentid == -1)
{
    instance_destroy();
    exit;
}
image_angle = parentid.image_angle;
depth = parentid.depth - 1;
x = parentid.x;
y = parentid.y;
