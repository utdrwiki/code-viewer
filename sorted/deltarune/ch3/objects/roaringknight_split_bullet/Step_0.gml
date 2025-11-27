event_inherited();
grazepoints = 3;
if (speed_mult < 1)
{
    speed_mult += 0.2;
    if (!active && speed_mult >= 0.1)
        active = true;
    speed = speed_mult * top_speed;
}
image_xscale = 1;
image_yscale = 1;
if (image_xscale != 1)
    image_xscale = scr_movetowards(image_xscale, 1, 0.1);
if (image_yscale != 1)
    image_yscale = scr_movetowards(image_yscale, 1, 0.1);
distance += speed;
