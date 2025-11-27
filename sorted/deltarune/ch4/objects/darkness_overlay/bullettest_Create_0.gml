if (!i_ex(obj_lightsource_heartlight))
{
    heartlight = instance_create(obj_heart.x, obj_heart.y, obj_lightsource_heartlight);
    heartlight.radius = 40;
}
else
{
    heartlight = 130;
}
if (room == room_bullettest)
{
    darkness = instance_create(x, y, obj_darkness_overlay);
    darkness.sprite_index = spr_nothing;
    darkness.darkfight = true;
}
