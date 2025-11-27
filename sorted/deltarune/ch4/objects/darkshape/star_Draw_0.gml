if (sprite_index == spr_darkshape_transform)
{
    draw_self();
}
else
{
    if (!i_ex(obj_heart))
        gpu_set_blendmode(bm_add);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale + ((global.time % 2) * 0.2), image_yscale + ((global.time % 2) * 0.2), image_angle, image_blend, 1);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale + 0.1 + ((global.time % 2) * 0.2), image_yscale + 0.1 + ((global.time % 2) * 0.2), image_angle, image_blend, 0.5);
    gpu_set_blendmode(bm_normal);
}
