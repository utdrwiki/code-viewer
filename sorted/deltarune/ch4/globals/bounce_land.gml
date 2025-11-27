function scr_bounce_land(arg0)
{
    bounce_land = instance_create(x, y, obj_bounce_land);
    bounce_land.target = id;
    bounce_land.strength = arg0;
}
