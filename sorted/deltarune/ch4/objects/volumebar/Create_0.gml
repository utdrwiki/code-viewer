if (instance_number(obj_micmenu) == 0)
{
    y = cameray() + 40;
    x = camerax() - 40;
    hspeed = 13;
    friction = 1;
}
else
{
    y = cameray() + 80;
    x = camerax() - 40;
    hspeed = 23;
    friction = 1;
}
volume_surf = surface_create(96, 250);
