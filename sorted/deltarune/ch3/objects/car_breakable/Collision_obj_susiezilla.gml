if (hitted == 0)
{
    if (other.height > 4)
        exit;
    event_user(0);
    if (other.x < x)
        hspeed = 12;
    else
        hspeed = -12;
}
