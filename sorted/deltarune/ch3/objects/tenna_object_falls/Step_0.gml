if (type == 0)
{
    if (x < (camerax() + 40))
        x = cameray() + 40;
    if (x > (cameray() + 600))
        x = cameray() + 600;
}
if (y < (cameray() + 240))
    y = cameray() + 240;
if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.con >= 2 && obj_tenna_zoom.minigameinsanity == false)
    instance_destroy();
if (con == 0)
{
    timer++;
    image_xscale = lerp(image_xscale, 0.7, 0.2);
    image_yscale = lerp(image_yscale, 0.7, 0.2);
    image_alpha = lerp(image_alpha, 0.5, 0.2);
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
        if (type == 0)
            obj = instance_create(x, y, obj_tenna_object_falls2);
        if (type == 1)
        {
            obj = instance_create(x + 52, cameray() + 200, obj_tenna_object_falls2);
            obj = instance_create(x + 52, cameray() + 250, obj_tenna_object_falls2);
            obj = instance_create(x + 52, cameray() + 300, obj_tenna_object_falls2);
        }
    }
    if (timer == 20)
        instance_destroy();
}
