active = 0;
if (i_ex(obj_mainchara) && obj_mainchara.battlemode == 1)
    active = 1;
if (active == 0)
    disappear = true;
timer++;
if (timer < 11)
{
    if ((floor(timer / 2) % 2) == 0)
        image_alpha = 0.5;
    else
        image_alpha = 1;
}
if (fakeheight > 0 && speed != 0)
    fakeheight -= 1.5;
else
    siner++;
fakey = -10 - (sin(siner / 4) * 4) - fakeheight;
if (global.inv < 0 && obj_mainchara.battlemode == 1)
{
    if (collision_rectangle(x - 6, (y - 10) + fakey, x, y + 12 + fakey, obj_mainchara, true, true))
        event_user(5);
}
if (hitwall == 1)
{
    active = 0;
    speed = 0;
    image_xscale = lerp(image_xscale, -1, 0.07);
    image_yscale = lerp(image_yscale, -1, 0.07);
}
if (disappear)
    image_alpha = lerp(image_alpha, -1, 0.07);
if (image_alpha < 0)
    instance_destroy();
if (x < 0)
    instance_destroy();
if (x > room_width)
    instance_destroy();
if (y > room_height)
    instance_destroy();
if (y < 0)
    instance_destroy();
