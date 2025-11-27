if (global.turntimer < 2)
{
    instance_destroy();
    exit;
}
image_angle += 10;
timer++;
if (angled)
{
    if (timer == 5)
    {
        var bullet = instance_create(x, y, obj_regularbullet);
        scr_bullet_inherit(bullet);
        if (i_ex(bullet))
        {
            bullet.direction = point_direction(bullet.x, bullet.y, obj_growtangle.x, obj_growtangle.y) + turnvar;
            bullet.image_angle = bullet.direction;
            bullet.sprite_index = spr_holydropletbullet2;
            bullet.visible = false;
            bullet.image_alpha = 0;
            bullet.image_xscale = 0;
            bullet.image_yscale = 0;
            bullet.updateimageangle = true;
            bullet.speed = 4;
            bullet.grazepoints = 1/3;
            if (i_ex(obj_holywatercooler_enemy))
                bullet.grazepoints = 0.5;
        }
        var lifetime = 48;
        scr_lerpvar_instance(bullet, "image_alpha", 0, 1, 8);
        scr_lerpvar_instance(bullet, "image_xscale", 0, 0.75, 14);
        scr_lerpvar_instance(bullet, "image_yscale", 0, 0.75, 14);
        with (bullet)
            scr_script_delayed(scr_var, lifetime, "speed", 0);
        with (bullet)
            scr_script_delayed(scr_var, lifetime, "active", false);
        with (bullet)
            scr_script_delayed(scr_lerpvar_instance, lifetime, id, "image_xscale", 1, 0, 5);
        with (bullet)
            scr_script_delayed(scr_lerpvar_instance, lifetime, id, "image_yscale", 1, 0, 5);
        with (bullet)
            scr_script_delayed(scr_lerpvar_instance, lifetime, id, "image_alpha", 1, 0, 5);
        with (bullet)
            scr_script_delayed(instance_destroy, lifetime + 5);
        if (turnvar != 0)
        {
            with (bullet)
                scr_lerpvar_instance(bullet, "direction", direction, direction - (other.turnvar * 1.75), lifetime * 0.85);
        }
    }
    if (timer == 7)
    {
        scr_lerpvar_instance(id, "image_xscale", 1, 0, 18);
        scr_lerpvar_instance(id, "image_yscale", 1, 0, 18);
    }
    if (timer == 30)
        instance_destroy();
}
else
{
    if (timer == 5)
    {
        var bullet = instance_create(x, y, obj_regularbullet);
        scr_bullet_inherit(bullet);
        if (i_ex(bullet))
        {
            bullet.direction = point_direction(bullet.x, bullet.y, obj_growtangle.x, obj_growtangle.y);
            bullet.image_angle = bullet.direction;
            bullet.sprite_index = spr_holydropletbullet2;
            bullet.visible = false;
            bullet.image_alpha = 0;
            bullet.image_xscale = 0;
            bullet.image_yscale = 0;
            bullet.grazepoints = 1/3;
            if (i_ex(obj_holywatercooler_enemy))
                bullet.grazepoints = 0.5;
        }
        scr_lerpvar_instance(bullet, "image_alpha", 0, 1, 8);
        scr_lerpvar_instance(bullet, "image_xscale", 0, 0.75, 14);
        scr_lerpvar_instance(bullet, "image_yscale", 0, 0.75, 14);
        with (bullet)
            scr_script_delayed(scr_var, 5, "speed", point_distance(bullet.x, bullet.y, obj_growtangle.x, obj_growtangle.y) / 48);
        with (bullet)
            scr_script_delayed(scr_var, 52, "speed", 0);
        with (bullet)
            scr_script_delayed(scr_var, 52, "active", false);
        with (bullet)
            scr_script_delayed(scr_lerpvar_instance, 52, id, "image_xscale", 1, 0, 16);
        with (bullet)
            scr_script_delayed(scr_lerpvar_instance, 52, id, "image_yscale", 1, 0, 16);
        with (bullet)
            scr_script_delayed(scr_lerpvar_instance, 52, id, "image_alpha", 1, 0, 16);
        with (bullet)
            scr_script_delayed(scr_coathanger_fadeout, 52);
    }
    if (timer == 7)
    {
        scr_lerpvar_instance(id, "image_xscale", 1, 0, 18);
        scr_lerpvar_instance(id, "image_yscale", 1, 0, 18);
    }
    if (timer == 30)
        instance_destroy();
}
