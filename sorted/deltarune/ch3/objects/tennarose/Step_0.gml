if (init == 0)
{
    init = 1;
    fakegravity = jumpspeed / (jumptime * 0.5);
    falseendx = endx;
    falseendy = endy;
    con = 2;
}
if (con == 2)
{
    if (timer > 0)
    {
        jumpspeed -= fakegravity;
        jumpy += jumpspeed;
    }
    timer++;
    if (jumpspeed <= 0)
        jumpy = max(0, jumpy);
    x = lerp(startx, endx, timer / jumptime);
    y = lerp(starty, endy, timer / jumptime);
    if (timer >= jumptime)
    {
        x = endx;
        y = endy;
        timer = 0;
        con = 3;
        jumpy = 0;
    }
}
if (con == 3)
{
    timer++;
    if (timer == 10)
        instance_destroy();
}
