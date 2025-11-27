draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
timer++;
if ((timer % 3) == 0 && type == 1)
{
    fire = instance_create_depth(67, 210, depth + 10, obj_tenna_chef_marker_fire);
    fire.hspeed = -1.5 + random(3);
    fire.gravity = -0.5;
    fire.friction = 0;
    fire.image_speed = 1;
    fire = instance_create_depth(575, 210, depth + 10, obj_tenna_chef_marker_fire);
    fire.hspeed = -1.5 + random(3);
    fire.gravity = -0.5;
    fire.friction = 0;
    fire.image_speed = 1;
}
if ((timer % 4) == 0 && type == 1)
{
    snd_stop(snd_wing);
    snd_play_x(snd_wing, 0.35, 0.75 + random(0.1));
}
if (flamecon == 1)
{
    wave_siner++;
    flamesiner++;
    draw_set_alpha(flamealph);
    for (i = 0; i < wave_maxa; i += thickness)
    {
        draw_sprite_part(spr_gameshow_stage_fire_flip, 0, 0, i * thickness, 400, thickness + 2, -10 + (sin((wave_siner + (i * 8)) / 30) * 12), (i * thickness) + flameya + (sin(flamesiner / 16) * 3));
        draw_sprite_part(spr_gameshow_stage_fire_flip, 0, 0, i * thickness, 400, thickness + 2, 255 + (sin((wave_siner + (i * 8)) / 30) * 12), (i * thickness) + flameya + (sin(flamesiner / 16) * 3));
        draw_sprite_part(spr_gameshow_stage_fire_flip, 0, 0, i * thickness, 400, thickness + 2, 520 + (sin((wave_siner + (i * 8)) / 30) * 12), (i * thickness) + flameya + (sin(flamesiner / 16) * 3));
    }
    draw_set_alpha(1);
}
