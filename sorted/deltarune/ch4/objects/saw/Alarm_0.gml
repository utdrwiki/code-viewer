if (abs((x + ((sprite_width / 2) * sign(hspeed))) - (obj_growtangle.x + 10)) <= 85)
{
    with (scr_fire_bullet(x + ((sprite_width / 2) * sign(hspeed)), y, obj_regularbullet, 100 + random(30), 1.25 + random(1.25), spr_spark))
    {
        spinspeed = -vspeed;
        spin = true;
        scr_script_delayed(instance_destroy, 45);
        scr_script_delayed(scr_var, 30, "image_blend", 8421504);
        scr_script_delayed(scr_var, 30, "active", false);
        scr_script_delayed(scr_lerpvar, 30, "image_xscale", 1, 0, 15);
        scr_script_delayed(scr_lerpvar, 30, "image_yscale", 1, 0, 15);
    }
    with (scr_fire_bullet(x + ((sprite_width / 2) * sign(hspeed)), y, obj_regularbullet, 260 - random(30), 1.25 + random(1.25), spr_spark))
    {
        spinspeed = vspeed;
        spin = true;
        scr_script_delayed(instance_destroy, 45);
        scr_script_delayed(scr_var, 30, "image_blend", 8421504);
        scr_script_delayed(scr_var, 30, "active", false);
        scr_script_delayed(scr_lerpvar, 30, "image_xscale", 1, 0, 15);
        scr_script_delayed(scr_lerpvar, 30, "image_yscale", 1, 0, 15);
    }
    alarm[0] = delay + irandom(3);
}
else
{
    alarm[0] = 1;
}
