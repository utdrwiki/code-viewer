var _blendState = gpu_get_blendmode();
draw_set_blend_mode(bm_add);
image_blend = c_black;
draw_self();
draw_set_blend_mode(_blendState);
