event_inherited();
timer++;
if ((timer % 6) == 0)
    grazed = 0;
with (obj_bullet_rain)
{
    if (other.y < y && !spent)
    {
        other.y = scr_approach_curve(other.y, obj_growtangle.y - 45, 35 + (15 * overpower));
        spent = true;
        repeat (2)
        {
            with (instance_create(x, y, obj_bulletparent))
            {
                hspeed = -2 + random(3);
                vspeed = -3 - random(2);
                gravity = 0.25;
                sprite_index = spr_ball;
                image_speed = 0;
                image_blend = c_gray;
                image_xscale = 0.1;
                image_yscale = 0.1;
                scr_lerpvar("image_alpha", 1, 0, 30);
            }
        }
    }
}
with (obj_bullet_submoon)
{
    if (!touched_water)
    {
        if (place_meeting(x, y, other.id))
        {
            image_xscale *= 0.96;
            image_yscale *= 0.96;
            repeat (9)
            {
                with (instance_create((x + random(16)) - 8, other.y, obj_bulletparent))
                {
                    hspeed = -2 + random(3) + other.hspeed;
                    vspeed = -3 - random(2);
                    gravity = 0.25;
                    sprite_index = spr_ball;
                    image_speed = 0;
                    image_blend = c_gray;
                    image_xscale = 0.1;
                    image_yscale = 0.1;
                    scr_lerpvar("image_alpha", 1, 0, 30);
                    scr_script_delayed(instance_destroy, 30);
                }
            }
            touched_water = true;
        }
    }
}
