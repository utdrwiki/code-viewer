if (instance_exists(obj_darkness_overlay) || !require_darkness)
{
    gpu_set_blendmode(bm_add);
    draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, sprite_blend_mode ? image_blend : lightfx_blend, lightfx_alpha * on_amount);
    gpu_set_blendmode(bm_normal);
}
if (!instance_exists(obj_lightbeamfx) && dustparticles_on)
    instance_create_depth(0, 0, 49999, obj_lightbeamfx);
