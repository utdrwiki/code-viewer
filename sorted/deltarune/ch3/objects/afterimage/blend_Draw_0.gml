var _bm = gpu_get_blendmode();
if (dest_blend != -4)
    gpu_set_blendmode_ext(blendmode, dest_blend);
else
    gpu_set_blendmode(blendmode);
draw_self();
gpu_set_blendmode(_bm);
