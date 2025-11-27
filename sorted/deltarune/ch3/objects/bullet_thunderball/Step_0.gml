if (freeze)
    exit;
if (alarm[3])
{
    image_alpha = scr_approach(image_alpha, 0, 0.125);
    image_xscale = scr_approach(image_xscale, 4, 0.5);
    image_yscale = scr_approach(image_yscale, 0, 0.125);
    exit;
}
image_alpha = scr_approach(image_alpha, 1, 0.1);
timer += timerup;
if (!alarm[4])
    y += -sin(timer * 0.5);
if (image_alpha == 1)
    active = true;
if (y >= (obj_heart.y - 36) && !alarm[4])
    alarm[4] = 24;
if (y >= obj_heart.y && alarm[4] > 6)
    alarm[4] = 6;
if (alarm[4])
{
    timerup = scr_approach(timerup, 2.5, 0.25);
    if (alarm[4] > 4)
        speed *= 0.95;
    else
        speed *= 0.5;
}
