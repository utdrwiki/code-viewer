angle += anglechange;
x = anchor_x + lengthdir_x(1200, angle);
y = anchor_y + lengthdir_y(1200, angle);
image_angle = point_direction(x, y, anchor_x, anchor_y) - 90;
if (angle >= 354)
    instance_destroy();
if (abs(angle - 270) <= 2 && !DESTROY)
{
    DESTROY = true;
    with (obj_susiezilla_statue)
        hp = 1;
    obj_susiezilla_statue.take_hit(-1, 9999, 8);
}
scr_afterimagefast();
