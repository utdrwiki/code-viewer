function scr_draw_in_box_begin()
{
    if (!instance_exists(obj_growtangle))
        exit;
    gpu_set_blendenable(false);
    gpu_set_colorwriteenable(false, false, false, true);
    draw_set_alpha(0);
    ossafe_fill_rectangle(camerax(), cameray(), camerax() + 640, cameray() + 480);
    draw_set_alpha(1);
    ossafe_fill_rectangle(gt_minx() + 5, gt_miny() + 5, gt_maxx() - 4, gt_maxy() - 4);
    gpu_set_blendenable(true);
    gpu_set_colorwriteenable(true, true, true, true);
    gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
    gpu_set_alphatestenable(true);
    gpu_set_alphatestref(1);
}

function scr_draw_in_box_ext_begin(arg0, arg1)
{
    if (!instance_exists(obj_growtangle))
        exit;
    gpu_set_blendenable(false);
    gpu_set_colorwriteenable(false, false, false, true);
    draw_set_alpha(0);
    ossafe_fill_rectangle(camerax(), cameray(), camerax() + 640, cameray() + 480);
    draw_set_alpha(1);
    ossafe_fill_rectangle((gt_minx() + 5) - arg0, (gt_miny() + 5) - arg1, (gt_maxx() - 4) + arg0, (gt_maxy() - 4) + arg1);
    gpu_set_blendenable(true);
    gpu_set_colorwriteenable(true, true, true, true);
    gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
    gpu_set_alphatestenable(true);
    gpu_set_alphatestref(1);
}
