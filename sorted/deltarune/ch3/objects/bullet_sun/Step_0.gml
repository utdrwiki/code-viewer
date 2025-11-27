event_inherited();
timer++;
if (timer == 180)
{
    instance_destroy();
    exit;
}
if (interval > 0)
{
    if ((timer % (36 - (4 * overpower))) == 0)
    {
        scr_lerpvar("image_xscale", image_xscale * 2, image_xscale, 9);
        scr_lerpvar("image_yscale", image_xscale * 2, image_xscale, 9);
        scr_lerpvar("image_xscale", image_xscale, image_xscale * 1.8, 3);
        scr_lerpvar("image_yscale", image_xscale, image_xscale * 1.8, 3);
        var basedir = random(360);
        for (n = 0; n < (6 + (2 * (overpower > 0))); n++)
        {
            with (scr_fire_bullet(x, y, obj_bullet_homing, basedir + (n * (45 + (15 * (overpower == 0)))), 3 + ((n % 2) * 1.25) + random(0.35), spr_sunspark))
            {
                image_xscale = 3;
                image_yscale = 3;
                home_level = 4;
                var lifetime = 6 + irandom(6);
                overpower = other.overpower;
                target = other.target;
                damage = 55;
                grazepoints = 6;
                with (obj_precipitation_bullet_parent)
                {
                    if (overpower == 2)
                        other.active = false;
                }
                if (active == false)
                {
                    scr_lerpvar("image_xscale", 3, 0, lifetime);
                    scr_lerpvar("image_yscale", 3, 0, lifetime);
                    scr_doom(id, lifetime);
                }
                else
                {
                    scr_lerpvar("image_xscale", 3, 1.85, 24);
                    scr_lerpvar("image_yscale", 3, 1.85, 24);
                }
            }
        }
    }
}
event_user(3);
