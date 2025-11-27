gigachange = 1 - (0.2 * intensity);
timer++;
gigatimer += gigachange;
ultratimer++;
if (timer == 16)
{
    var spinny = choose(-2, 2);
    var sizy = 0.4 + random_range(-0.1, 0.1);
    var angly = irandom(360);
    var num = 10 - (intensity * 2);
    if (intensity == 4)
        num = 0;
    for (a = 0; a < num; a++)
    {
        var omega_angly = ((360 / num) * a) + random_range(-4, 4) + angly;
        with (scr_fire_bullet(x + lengthdir_x(24, omega_angly), y + lengthdir_y(24, omega_angly), obj_snowflake_ult_bullet, omega_angly, 1.5 + random_range(-0.5, 0.25), spr_elnina_snowflake))
        {
            spin = true;
            spinspeed = spinny;
            grazepoints = 2;
            element = 5;
            target = obj_dbulletcontroller.target;
            damage = 55;
            grazepoints = 3;
            image_xscale = sizy;
            image_yscale = sizy;
            depth = other.depth + 1;
            if (direction < 180)
                instance_destroy();
        }
    }
    timer = -intensity * 4;
}
if (gigatimer > -24)
{
    radius = scr_approach(radius, 60 - (15 * intensity), 0.5);
    x = scr_get_box(4) + (sin(gigatimer * 0.04) * radius);
}
if (gigatimer >= 0)
{
    if (gigatimer == 0)
        y_anchor = y;
    y = y_anchor + (sin(gigatimer * 0.15) * radius * 0.1);
}
if (ultratimer == 48)
{
    var num = 3;
    if (intensity > 1)
        num = 2;
    if (intensity > 2)
        num = 1;
    if (intensity < 4)
    {
        for (a = 0; a < (num + 1); a++)
        {
            var angliel = 37.5 + (a * (105 / num)) + irandom_range(-5, 5);
            with (scr_fire_bullet(x + lengthdir_x(16, angliel), y + lengthdir_y(16, angliel), obj_elnina_raindrop, angliel, 10, spr_elnina_raindrop))
            {
                image_xscale = 0.25;
                image_yscale = 0.5;
                target = obj_dbulletcontroller.target;
                damage = 55;
                grazepoints = 3;
                element = 5;
                scr_lerpvar("image_xscale", 0.25, 0.5, 8);
                image_angle = direction;
                mask_index = spr_elnina_raindrop_mask;
                target_x = obj_heart.x + 10;
                target_y = obj_heart.y + 10;
                if (other.a == 1 || other.a == 2)
                    speed = 12;
            }
        }
    }
    ultratimer = -intensity * 5;
}
with (obj_regularbullet)
{
    if (sprite_index == spr_elnina_raindrop)
    {
        with (obj_regularbullet)
        {
            if (sprite_index == spr_elnina_snowflake)
            {
                if (place_meeting(x, y, other.id))
                    instance_destroy();
            }
        }
    }
    if (sprite_index == spr_elnina_snowflake)
    {
        if (y > (scr_get_box(3) + 70))
            instance_destroy();
    }
}
