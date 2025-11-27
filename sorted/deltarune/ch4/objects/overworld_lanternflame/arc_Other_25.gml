timer += 1;
siner += sineradder;
active = 0;
if (i_ex(obj_mainchara))
{
    if (obj_mainchara.battlemode == 1)
        active = 1;
}
if (active == 0)
{
    image_alpha = lerp(image_alpha, -1, 0.125);
    if (image_alpha < 0)
        instance_destroy();
}
if (timer >= 2)
{
    if (image_alpha < 1)
        image_alpha += 0.1;
    if (image_alpha == 1)
        active = 1;
}
if (sining == 1)
{
    y = ystart + (sin(siner / 6) * 60);
    if (room == room_dw_church_lantern1 && x < 160)
    {
        image_alpha = lerp(image_alpha, -1, 0.125);
        if (image_alpha < 0)
            instance_destroy();
    }
}
if (i_ex(mylight))
{
    mylight.smallerLight = 120 * image_alpha;
    mylight.biggerLight = mylight.smallerLight * 1.15;
}
if (x < 0)
    instance_destroy();
