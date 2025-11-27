if (i_ex(obj_dmgwriter))
    depth = obj_dmgwriter.depth + 1;
if (global.turntimer < 1)
{
    instance_destroy();
    exit;
}
if (instance_exists(obj_shutta_rotation_attack) && obj_shutta_rotation_attack.freeze)
{
    freeze = true;
    image_speed = 0;
}
if (freeze)
    exit;
speed_approach = scr_approach(speed_approach, 0.5, 0.125);
if ((y + 58) > (scr_get_box(3) - 24))
    dir = 1;
if ((y + 58) < (scr_get_box(1) + 24))
    dir = 0;
if (!skipme && sameattacker != 2)
{
    if (dir == 0)
        current_speed = scr_approach(current_speed, 6, speed_approach);
    else
        current_speed = scr_approach(current_speed, -6, speed_approach);
}
if (global.turntimer <= 16 && !skipme)
    skipme = true;
if (skipme)
    current_speed = scr_approach(current_speed, 0, 0.5);
timer++;
if (sameattacker == 2)
{
    if (bullet_timer)
    {
        bullet_timer--;
    }
    else
    {
        if (bullet_counter == 0)
            shot_angle = scr_at_player(x, y + 54);
        var tommybullet = scr_fire_bullet(x, y + 54, obj_regularbullet, shot_angle, 7, spr_tommygun_bullet);
        if (!instance_exists(obj_shutta_rotation_attack))
        {
            with (tommybullet)
                scr_script_delayed(scr_lerpvar_instance, abs(x - scr_get_box(2)) / abs(hspeed), id, "image_alpha", 1, 0, 10);
        }
        tommybullet.image_angle = tommybullet.direction;
        with (obj_regularbullet)
            target = 0;
        if (i_ex(obj_volumeup))
        {
            tommybullet.image_xscale = 2;
            tommybullet.image_yscale = 2;
            tommybullet.grazepoints += 1;
            tommybullet.x += 30;
        }
        bullet_timer = 6;
        bullet_counter++;
        if (bullet_counter == 4)
        {
            bullet_counter = 0;
            bullet_timer += 8;
        }
    }
}
else if ((timer - (sameattacker * 12)) >= 16 && !skipme)
{
    if (bullet_timer)
    {
        bullet_timer--;
    }
    else
    {
        var tommybullet = scr_fire_bullet(x, y + 54, obj_regularbullet, 180, 5.5 + random(3.5), spr_tommygun_bullet);
        if (!instance_exists(obj_shutta_rotation_attack))
        {
            with (tommybullet)
                scr_script_delayed(scr_lerpvar_instance, abs(x - scr_get_box(2)) / abs(hspeed), id, "image_alpha", 1, 0, 10);
        }
        with (obj_regularbullet)
            target = 0;
        bullet_timer = irandom_range(8, 10) - (sameattack * 2);
        tommybullet.image_angle = tommybullet.direction;
        bullet_counter++;
        if (i_ex(obj_volumeup))
        {
            tommybullet.image_xscale = 2;
            tommybullet.image_yscale = 2;
            tommybullet.grazepoints += 1;
            tommybullet.x += 30;
        }
        if (bullet_counter == 4)
        {
            bullet_counter = 0;
            bullet_timer += (10 + (irandom(1) * 5) + (4 * sameattack));
        }
    }
}
