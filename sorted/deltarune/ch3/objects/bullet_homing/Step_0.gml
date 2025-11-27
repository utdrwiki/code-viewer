mask_index = spr_sunspark;
event_inherited();
if (i_ex(obj_heart))
{
    if (home_level && home_timer >= home_delay)
    {
        direction += scr_anglechange(direction, point_direction(x, y, obj_heart.x + 10, obj_heart.y + 10), home_level / speed);
        speed = min(speed, speed_limit);
        home_level = scr_approach(home_level, home_floor, home_decay);
    }
}
home_timer++;
if (overpower && global.turntimer > 2)
{
    with (obj_precipitation_bullet_parent)
    {
        if (point_distance(x, y, other.x, other.y) < (15 * other.overpower))
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
timer++;
if (timer > 50)
    image_alpha -= 0.1;
