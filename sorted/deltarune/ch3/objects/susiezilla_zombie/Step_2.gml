event_inherited();
depth = 100000 - ((y + 30) * 10);
if (attackcon == 2)
    depth = 100000 - ((y + 80) * 10);
if (attackcon == 3 && image_index == 11)
    depth = -999999;
if (height > 0 || fall_speed != 0)
{
    shadow.visible = true;
    shadow.x = x;
    shadow.y = y;
    shadow.depth = depth + 1000;
}
else
{
    shadow.visible = false;
}
