if (global.turntimer < 1)
    instance_destroy();
instance_destroy();
if (type == 1)
{
    if (image_xscale < 0)
    {
        gers = instance_create(x - 70, y - 23, obj_gerson_box_hit);
        if (first == 1)
            gers.timer = 10;
    }
    else
    {
        gers = instance_create(x + 70, y - 23, obj_gerson_box_hit);
        gers.image_xscale = -2;
        if (first == 1)
            gers.timer = 10;
    }
}
if (type == 2)
{
    if (swingdowntype == -4)
    {
        gers = instance_create(x + lengthdir_x(110, image_angle + 40), y + lengthdir_y(110, image_angle + 40), obj_gerson_swing_down);
        gers.swingdowntype = -1;
        gers.image_angle = image_angle - 90;
        gers.direction = image_angle + 180;
        if (special != 0)
            gers.special = special;
        with (gers)
            event_user(0);
    }
    else if (swingdowntype == -3 || swingdowntype == -5)
    {
        gers = instance_create(x + lengthdir_x(110, image_angle + 40), y + lengthdir_y(110, image_angle + 40), obj_gerson_swing_down);
        gers.swingdowntype = swingdowntype;
        gers.image_angle = image_angle - 90;
        gers.direction = image_angle + 180;
        with (gers)
            event_user(0);
    }
    else if (swingdowntype >= 10)
    {
        gers = instance_create(x + lengthdir_x(110, image_angle + 40), y + lengthdir_y(110, image_angle + 40), obj_gerson_swing_down);
        gers.swingdowntype = swingdowntype;
        gers.image_angle = image_angle - 90;
        gers.direction = image_angle + 180;
        with (gers)
            event_user(0);
    }
    else
    {
        gers = instance_create(x - 62, y - 112, obj_gerson_swing_down);
        if (x < obj_growtangle.x)
        {
            gers.image_xscale = -2;
            gers.x += 124;
        }
        gers.swingdowntype = swingdowntype;
        with (gers)
            event_user(0);
    }
}
if (type == 3)
{
    if (image_xscale < 0)
    {
        gers = instance_create(x - 130, y - 60, obj_gerson_bell_hit);
        gers.timer = -15;
    }
    else
    {
        gers = instance_create(x + 130 + 42, y - 60, obj_gerson_bell_hit);
        gers.image_xscale = -2;
        gers.timer = 6;
    }
}
if (type == 4)
    gers = instance_create(x + 60, y - 40, obj_gerson_hits_box);
if (type == 5)
{
    gers = instance_create(x - 60, y - 40, obj_gerson_hits_box);
    gers.image_xscale = 2;
}
if (type == 6)
    instance_create(x, y - 34, obj_gerson_speen);
if (type == 10)
{
    with (obj_hammer_of_justice_enemy)
        visible = true;
}
