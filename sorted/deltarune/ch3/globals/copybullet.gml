function scr_copybullet(arg0 = 0, arg1 = true)
{
    if (arg0 == 0)
        arg0 = id;
    with (arg0)
    {
        bullet_values = 
        {
            gravity: gravity,
            speed: speed,
            direction: direction,
            gravity_direction: gravity_direction,
            friction: friction,
            image_blend: image_blend,
            destroyonhit: destroyonhit
        };
        if (arg1)
        {
            gravity = 0;
            speed = 0;
            friction = 0;
            gravity_direction = 270;
            direction = 0;
            destroyonhit = false;
        }
    }
}

function scr_pastebullet(arg0 = 0)
{
    if (arg0 == 0)
        arg0 = id;
    with (arg0)
    {
        if (v_ex("bullet_values"))
        {
            gravity = bullet_values.gravity;
            gravity_direction = bullet_values.gravity_direction;
            friction = bullet_values.friction;
            direction = bullet_values.direction;
            speed = bullet_values.speed;
            image_blend = bullet_values.image_blend;
            destroyonhit = bullet_values.destroyonhit;
        }
        else
        {
            debug_print("can't load values w/o saved values!!!!!");
        }
    }
}
