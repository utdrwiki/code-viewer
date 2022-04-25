scr_draw_in_box_end = function() //gml_Script_scr_draw_in_box_end
{
    if (!instance_exists(obj_growtangle))
        return;
    gpu_set_alphatestref(128)
    gpu_set_alphatestenable(0)
    gpu_set_blendmode(bm_normal)
    return;
}

