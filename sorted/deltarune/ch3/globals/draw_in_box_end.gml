function scr_draw_in_box_end()
{
    if (!instance_exists(obj_growtangle))
        exit;
    gpu_set_alphatestref(0);
    gpu_set_alphatestenable(false);
    gpu_set_blendmode(bm_normal);
}
