scr_populatechars();
if (!i_ex(krlight))
{
    krlight = instance_create(kris.x, kris.y, obj_light_following);
}
else
{
    krlight.target = kris;
    krlight.xoff = 18;
    krlight.size = 96;
    krlight.yoff = 38;
    if (i_ex(obj_climb_kris))
    {
        krlight.target = 27;
        krlight.xoff = 0;
        krlight.yoff = 0;
    }
}
