if (global.turntimer < 1)
    instance_destroy();
timer++;
if (timer < 16)
    exit;
if (!i_ex(parentid) || parentid == -1)
{
    instance_destroy();
    exit;
}
x = parentid.x + lengthdir_x(parentid.len, parentid.image_angle);
y = parentid.y + lengthdir_y(parentid.len, parentid.image_angle);
image_angle = parentid.image_angle;
image_xscale = lerp(image_xscale, 1, 0.1);
