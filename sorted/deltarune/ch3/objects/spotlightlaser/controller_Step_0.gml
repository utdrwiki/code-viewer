if (con == 0)
{
    timer++;
    if (side == "below" && timer == 1)
        y = (cameray() + cameraheight()) - 140;
    if (timer <= 20)
        x = lerp(xstart, 0, timer / 20);
    if (timer == 30)
    {
        timer = 0;
        con = 1;
    }
}
if (con == 1)
{
    timer++;
    if (timer == 1)
    {
        snd_play(snd_spearappear);
        if (side == "above")
        {
            laser1 = instance_create_depth(x + spot1x, y + 50, depth - 1, obj_spotlightlaser);
            laser1.image_angle = spot1angle;
            laser2 = instance_create_depth(x + spot2x, y + 50, depth - 1, obj_spotlightlaser);
            laser2.image_angle = spot2angle;
            laser3 = instance_create_depth(x + spot3x, y + 50, depth - 1, obj_spotlightlaser);
            laser3.image_angle = spot3angle;
        }
        else
        {
            laser1 = instance_create_depth(x + spot1x, y - 12, depth - 1, obj_spotlightlaser);
            laser1.image_angle = spot1angle + 180;
            laser2 = instance_create_depth(x + spot2x, y - 12, depth - 1, obj_spotlightlaser);
            laser2.image_angle = spot2angle + 180;
            laser3 = instance_create_depth(x + spot3x, y - 12, depth - 1, obj_spotlightlaser);
            laser3.image_angle = spot3angle + 180;
        }
    }
    if (timer > 1 && !i_ex(obj_spotlightlaser))
    {
        timer = 0;
        con = 2;
    }
}
if (con == 2)
{
    timer++;
    if (side == "above")
        y -= 20;
    else
        y += 20;
    if (timer == 10)
        instance_destroy();
}
