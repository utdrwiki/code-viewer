with (scr_fire_bullet(x, y, obj_darkshape, 0, 0))
{
    direction = other.direction;
    myspeed = other.speed * 0.5;
    xscale = 1.25;
    yscale = 1.25;
    image_alpha = 1.25;
}
instance_destroy();
