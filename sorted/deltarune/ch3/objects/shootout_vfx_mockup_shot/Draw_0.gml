if (con == 2)
{
    if (hittarget && enemy == 0)
    {
        snd_play_x(snd_barrel_jump, 0.8, 1.8);
        var pointsmarker = instance_create(targetx, targety, obj_chefs_100pts);
        pointsmarker.sprite_index = spr_chefs_plus1;
    }
    instance_destroy();
}
if (con == 1)
{
    if (hittarget)
    {
        var impactfx = instance_create(targetx, targety, obj_animation);
        impactfx.sprite_index = spr_attack_slap2;
        impactfx.image_xscale = 2;
        impactfx.image_yscale = 2;
        impactfx.image_blend = c_white;
        impactfx.depth = depth - 10;
        impactfx = instance_create(targetx, targety, obj_animation);
        impactfx.sprite_index = spr_attack_slap2;
        impactfx.image_xscale = 3;
        impactfx.image_yscale = 3;
        impactfx.image_blend = c_white;
        impactfx.depth = depth - 10;
        impactfx.image_alpha = 0.5;
        if (!enemy)
        {
            snd_play_x(snd_equip, 1, 0.8);
            snd_play_x(snd_equip, 1, 1.2);
            snd_play_x(snd_bump, 1, 0.5);
        }
        else
        {
            snd_play_x(snd_hurt1_bc, 0.8, 1);
            snd_play_x(snd_bump, 1, 1);
            snd_play_x(snd_equip, 1, 0.8);
            scr_shakescreen();
        }
    }
    else
    {
        var smokefx = scr_marker(targetx, targety, sprite_index);
        smokefx.gravity_direction = 200;
        smokefx.gravity = 2 - random(0.4);
        smokefx.image_speed = 0.2;
        smokefx.hspeed = -6;
        smokefx.image_xscale = 1;
        smokefx.image_yscale = 1;
        smokefx.vspeed = random_range(-8, -4);
        smokefx.image_angle = random(360);
        scr_lerpvar_instance(smokefx, "image_alpha", 2, 0, 8);
        scr_doom(smokefx, 8);
        snd_play_x(snd_metal_hit_guard, 1, 1);
    }
    con = 2;
}
if (con == 0)
{
    for (i = 0; i < 40; i++)
        draw_sprite_ext(sprite_index, image_index, lerp(xstart, targetx, i / 40), lerp(ystart, targety, i / 40), image_xscale, image_yscale, image_angle, image_blend, 0.2 + (i / 80));
    if (enemy == 1)
        hittarget = 1;
    con = 1;
}
else if (con == 2)
{
    for (i = 0; i < 40; i++)
        draw_sprite_ext(sprite_index, image_index, lerp(xstart, targetx, i / 40), lerp(ystart, targety, i / 40), image_xscale, image_yscale, image_angle, image_blend, (0.2 + (i / 80)) * 0.5);
}
