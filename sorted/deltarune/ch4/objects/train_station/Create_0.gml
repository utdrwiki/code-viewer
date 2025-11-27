image_speed = 0;
image_index = 0;
pressed = 0;
depth = 999980;
heartontrain = false;
holdheart = false;
hearttimer = 0;
image_angle = (image_angle + 360) % 360;
switch (image_angle)
{
    case 0:
        heartx = x + 10;
        hearty = y;
        center_x = x + 15;
        center_y = y + 15;
        break;
    case 180:
        heartx = x - 20;
        hearty = y - 10;
        center_x = x - 15;
        center_y = y - 15;
        break;
    case 90:
        heartx = x;
        hearty = y - 20;
        center_x = x + 5;
        center_y = y - 15;
        break;
    case 270:
        heartx = x - 10;
        hearty = y + 10;
        center_x = x - 15;
        center_y = y + 15;
        break;
}
for (var i = 0; i < 3; i++)
{
    var _tx = (center_x + lengthdir_x((i - 1) * 10, image_angle)) - 5;
    var _ty = (center_y + lengthdir_y((i - 1) * 10, image_angle)) - 5;
    if ((image_angle % 180) == 0)
        track[i] = instance_create_depth(_tx, _ty, depth - 1, obj_traintrack_straight_horizontal);
    else
        track[i] = instance_create_depth(_tx, _ty, depth - 1, obj_traintrack_straight_vertical);
    track[i].visible = false;
}
