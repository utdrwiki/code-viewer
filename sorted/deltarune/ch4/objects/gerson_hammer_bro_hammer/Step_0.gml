timer++;
if (!gigahammer)
{
    if (y > (obj_growtangle.y + 120))
        image_alpha -= 0.3;
    if (image_alpha < 0.8)
        active = 0;
}
if (image_alpha < 0)
    instance_destroy();
anim_index++;
if (gigahammer)
{
    if (fakevspeed < 0)
        image_angle += 60;
    else
        image_angle = 202.5;
}
else if (anim_index == 3)
{
    image_angle += 40;
    anim_index = 0;
}
if (!(gigahammer && fakevspeed >= 0))
{
    x += fakehspeed;
    y += fakevspeed;
    fakevspeed += fakegravity;
}
if (gigahammer && fakevspeed >= 0 && !drop)
{
    hspeed = 0;
    vspeed = 0;
    drop = true;
    fakevspeed = 0;
    fakehspeed = 0;
    fakegravity = 0;
    gravity = 0;
    alarm[0] = 12;
}
if (fakevspeed > 11)
    fakevspeed = 11;
if (!drop)
{
    if (y < (cameray() + 20))
    {
        x += 1;
        y += 2;
    }
}
