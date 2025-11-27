if (sprite_index == spr_snowflake && other.sprite_index == spr_sunbolt && active == true && false)
{
    instance_destroy();
    with (other)
        instance_destroy();
    snd_stop(snd_wing);
    snd_play(snd_wing);
    anim = instance_create_depth(x, y, depth - 1, obj_animation);
    anim.sprite_index = spr_shadow_mantle_cloud_white;
    anim.image_speed = 0.05;
    anim.image_xscale = 1.5;
    anim.image_yscale = 1.5;
    with (scr_fire_bullet((x - 18) + irandom(36), y + 6 + random(6), obj_rouxls_suncloud_bullets, 270, 0, spr_raindrop))
    {
        updateimageangle = 1;
        image_angle = 270;
        gravity_direction = 270;
        gravity = 0.1;
        image_xscale = 0.75;
        image_yscale = 0.75;
    }
}
