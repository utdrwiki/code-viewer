if (con == 0)
{
    image_index += 0.5;
    if (image_index > 4.75)
    {
        sprite_index = spr_laser_building;
        image_index = 0;
        image_speed = 0;
        con = 1;
    }
}
if (con == 1)
{
    timer++;
    if (timer == 18)
        eyeflashtimer = 11;
    if (timer == 31)
    {
        if (image_xscale < 0)
        {
            lsr = instance_create(x - 26, y + 72, obj_susiezilla_laser_building_bullet);
            lsr.depth = depth - 1;
            lsr.image_angle = 0;
            lsr.hspeed = 8;
            lsr.height = 30;
            lsr.friction = -2;
        }
        else
        {
            lsr = instance_create(x + 26, y + 72, obj_susiezilla_laser_building_bullet);
            lsr.depth = depth - 1;
            lsr.hspeed = -8;
            lsr.friction = -2;
            lsr.height = 30;
        }
        timer = 0;
    }
}
if (con == 2)
{
    timer++;
    if (timer == 12)
    {
        con = 1;
        timer = 0;
        sprite_index = spr_laser_building;
    }
}
