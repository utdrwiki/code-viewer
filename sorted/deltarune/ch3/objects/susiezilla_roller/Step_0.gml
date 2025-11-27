if (con == -1)
    speed = px;
if (con == 1)
{
    if (timer == 0)
        timer = 5;
    timer--;
    if (timer == 0)
    {
        con = 2;
        speed = px;
    }
}
if (con == 2)
{
}
scr_depth_alt();
if ((x < (camerax() - 80) && speed < 0) || (x > (camerax() + 720) && speed > 0))
    instance_destroy();
