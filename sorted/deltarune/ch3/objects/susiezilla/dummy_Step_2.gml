event_inherited();
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
