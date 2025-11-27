scr_depth_offset(48);
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
