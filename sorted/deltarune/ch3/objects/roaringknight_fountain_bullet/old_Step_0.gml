event_inherited();
if (speed_mult < 1)
{
    speed_mult += 0.02;
    if (!active && speed_mult >= 0.1)
        active = true;
    speed = speed_mult * top_speed;
}
