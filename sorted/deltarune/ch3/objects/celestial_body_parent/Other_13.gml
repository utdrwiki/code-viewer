if (overpower > 1)
{
    with (obj_precipitation_bullet_parent)
    {
        if (y > (obj_growtangle.y - 90 - random(10)) && image_alpha > 0.8)
        {
            instance_destroy();
            with (instance_create(x, y, obj_regularbullet))
            {
                active = false;
                spin = 1;
                spinspeed = random(5) - 0.25;
                direction = 70 + random(40);
                speed = 1 + random(1);
                image_xscale = 0.5;
                image_yscale = 0.5;
                sprite_index = spr_cakesmoke;
                scr_lerpvar("image_alpha", 1, 0, 30);
                scr_script_delayed(instance_destroy, 30);
            }
        }
    }
}
