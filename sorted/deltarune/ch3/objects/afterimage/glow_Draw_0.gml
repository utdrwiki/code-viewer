gpu_set_blendmode(bm_add);
if (solidcolor != -1)
    d3d_set_fog(true, solidcolor, 0, 0);
draw_self();
if (solidcolor != -1)
    d3d_set_fog(false, c_white, 0, 0);
gpu_set_blendmode(bm_normal);
