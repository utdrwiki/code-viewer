if (!wall)
{
    var _blendState = gpu_get_blendmode();
    draw_set_blend_mode(bm_add);
    image_blend = c_gray;
    draw_self();
    draw_set_blend_mode(_blendState);
}
else
{
    draw_self();
}
