scr_populatechars();
if (!init)
    init = 1;
if (con == 0)
{
    with (obj_mainchara)
    {
        var trigger = instance_place(x, y, obj_trigger);
        if (trigger != -4 && trigger.extflag == "startpart2")
            other.con = 1;
    }
}
if (con == 1)
{
    timer += 1;
    if (timer == 55)
    {
        if (lightsequence == 0)
        {
            layer_set_visible(layer_get_id("OBJECTS_TOPHALF"), false);
            layer_set_visible(layer_get_id("TILES_TOPHALF"), false);
            layer_set_visible(layer_get_id("TILES_BATTLEBORDER"), false);
        }
        if (lightsequence < 6)
        {
            var count = lightsequence + 1;
            for (var i = 0; i < count; i++)
            {
                var siner = (pi / count) + ((pi / (0.5 * count)) * i) + random_range(-3.141592653589793 / (2 * count), pi / (2 * count));
                var xx = obj_mainchara.x + (sin(siner) * 260);
                var yy = obj_mainchara.y + (cos(siner) * 180);
                instance_create(xx, yy, obj_dw_church_waterfallchaser_churchc);
            }
        }
    }
    if (lightsequence == 6 && timer == 70)
    {
        var diffX = obj_mainchara.x - 1540 - 150;
        var diffY = (obj_mainchara.y - 2900) + 40;
        obj_mainchara.x -= diffX;
        obj_mainchara.y -= diffY;
        with (obj_overworld_bulletarea)
            instance_destroy();
        with (obj_church_ripple)
        {
            x -= diffX;
            y -= diffY;
        }
        with (obj_lightsource_shrinking)
        {
            x -= diffX;
            y -= diffY;
        }
    }
    if (timer > 70)
    {
        if (lightsequence < 6)
        {
            lightsequence++;
            var siner = 4.71238898038469 + ((lightsequence * pi) / 4) + random_range(-0.3141592653589793, 0.3141592653589793);
            var xx = obj_mainchara.x + (sin(siner) * 320);
            var yy = obj_mainchara.y + (cos(siner) * 240);
            nextlight = instance_create(xx, yy, obj_lightsource_shrinking);
            nextlight.radius = 0;
            nextlight.shrinkspeed = 1 + (1 * lightsequence);
            timer = -60;
        }
        else if ((timer % 15) == 0 && timer <= 290)
        {
            lightsequence++;
            var xx = 1540 + (160 * (lightsequence - 6));
            var yy = 2900;
            var light = instance_create(xx, yy, obj_lightsource_static);
            light.radius = 0;
        }
    }
    if (nextlight != -4)
    {
        if (nextlight.con == 0)
        {
            timer = 0;
        }
        else
        {
            nextlight = -4;
            with (obj_dw_church_waterfallchaser_churchc)
                instance_destroy();
        }
    }
}
