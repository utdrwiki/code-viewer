var pmode = gpu_get_blendmode();
gpu_set_blendmode(blendmode);
if (sprite_exists(sprite_index))
    draw_self();
gpu_set_blendmode(pmode);
