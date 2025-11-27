extimer++;
if (con == 1)
{
    window_timer = max(window_timer, 1);
    con = 0;
}
if (con == 2)
{
    roomglow.active = true;
    roomglow.shadows = false;
    with (obj_sprhighlight)
        yoffset = -2;
    con = 0;
}
if (con == 3)
{
    timer++;
    with (obj_sprhighlight)
        yoffset = lerp(-2, 2, other.timer / 3);
    if (timer == 3)
    {
        con = 0;
        timer = 0;
    }
}
if (con == 4)
{
    roomglow.active = false;
    con = 0;
}
