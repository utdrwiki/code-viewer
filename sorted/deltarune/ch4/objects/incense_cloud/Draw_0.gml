if (type == 0)
{
    if (con == 1)
    {
        dietimer++;
        if (dietimer == 1)
        {
            fx = instance_create(x, y, obj_incense_cloud_destroyed);
            fx.image_xscale = image_xscale;
            fx.image_yscale = image_yscale;
            fx.image_angle = image_angle;
        }
        if (dietimer == 3)
            instance_destroy();
    }
}
if (type == 1)
{
    if (con == 1)
    {
        dietimer++;
        if (dietimer == 1)
        {
            snd_stop(snd_wing);
            snd_play(snd_wing);
            alpha1 = 1.5;
        }
        alpha2 += 0.2;
        if (dietimer == 4)
        {
            repeat (4)
            {
                var dir = 0 + random(180);
                var len = 10 + random(10);
                fireanim = instance_create_depth(-9999, -9999, depth - 1, obj_incense_fire_anim);
                fireanim.sprite_index = spr_turtle_cloud_fire1;
                fireanim.image_speed = 0.5;
                fireanim.parentid = id;
                fireanim.len = len;
                fireanim.dir = dir;
            }
        }
        if (dietimer == 15)
        {
            fx = instance_create(x, y, obj_incense_cloud_destroyed);
            fx.image_xscale = image_xscale;
            fx.image_yscale = image_yscale;
            fx.image_angle = image_angle;
            fx.type = 2;
        }
        if (dietimer == 15)
            instance_destroy();
        var col = merge_color(c_white, c_orange, 0.7);
        draw_sprite_ext(spr_incense_could_fuzzy2, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, alpha2);
    }
}
if (type == 2)
{
    if (con == 1)
    {
        dietimer++;
        if (dietimer == 1)
        {
            snd_play(snd_wing);
            alpha1 = 1;
        }
        alpha1 -= 0.2;
        alpha2 += 0.05;
        if (dietimer == 5)
        {
            fx = instance_create(x, y, obj_incense_cloud_destroyed);
            fx.image_xscale = image_xscale;
            fx.image_yscale = image_yscale;
            fx.image_angle = image_angle;
            fx.type = 2;
        }
        if (dietimer == 8)
            instance_destroy();
        var col = merge_color(c_white, c_orange, 0.7);
        draw_sprite_ext(spr_incense_could_fuzzy2, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1);
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, alpha1);
    }
}
grazetimer++;
if (grazetimer == 10)
{
    grazetimer = 0;
    grazed = 0;
}
