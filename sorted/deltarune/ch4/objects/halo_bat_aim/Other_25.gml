if (timer >= 34 && timer < 38)
{
    direction = temp_angle;
    speed -= 0.2;
}
if (timer == 38)
    speed = 24;
if (timer > 38)
    speed *= 0.65;
