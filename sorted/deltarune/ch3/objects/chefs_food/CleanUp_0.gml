if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.con == 2)
    exit;
if (!eaten && firedie)
{
    with (instance_create(x, y, obj_chefs_fire))
    {
        falling = false;
        speed = 0;
        alarm[0] = 12;
        stationary = true;
    }
}
if (eaten)
{
    repeat (eaten)
    {
        with (instance_create(x, y, obj_vfx_twinkle))
        {
            image_speed = 1;
            image_xscale = other.image_xscale * choose(1, -1);
            image_yscale = other.image_yscale;
            speed = 4 + random(3);
            direction = irandom(270) - 45;
        }
    }
    exit;
}
with (instance_create(x, y, obj_flickerdie))
{
    sprite_index = other.sprite_index;
    image_index = other.image_index;
    image_speed = 0;
    image_xscale = other.image_xscale;
    image_yscale = other.image_yscale;
}
