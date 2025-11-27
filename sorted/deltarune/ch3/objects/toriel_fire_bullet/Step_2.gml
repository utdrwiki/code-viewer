if (paused)
    exit;
hspeed = sin(siner / 10) * dir * 3;
siner++;
if (gravity != 0 && y > maxy)
{
    y = maxy;
    vspeed = 0;
    gravity = 0;
}
