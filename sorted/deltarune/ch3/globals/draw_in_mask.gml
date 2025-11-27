function scr_draw_set_mask(arg0, arg1 = false)
{
    gpu_set_blendenable(false);
    gpu_set_colorwriteenable(false, false, false, true);
    if (arg1)
    {
        draw_set_alpha(1);
        ossafe_fill_rectangle(camerax(), cameray(), camerax() + 640, cameray() + 480, false);
    }
    draw_set_alpha(0);
    if (arg0)
    {
        ossafe_fill_rectangle(camerax(), cameray(), camerax() + 640, cameray() + 480, false);
        draw_set_alpha(1);
    }
}

function scr_draw_in_mask_begin()
{
    draw_set_alpha(1);
    gpu_set_blendenable(true);
    gpu_set_colorwriteenable(true, true, true, true);
    gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
    gpu_set_alphatestenable(true);
    gpu_set_alphatestref(1);
}

function scr_draw_in_mask_end(arg0 = true)
{
    gpu_set_alphatestref(0);
    gpu_set_alphatestenable(false);
    gpu_set_blendmode(bm_normal);
    if (arg0)
        scr_draw_mask_reset();
}

function scr_draw_mask_reset()
{
    gpu_set_blendenable(false);
    gpu_set_colorwriteenable(false, false, false, true);
    ossafe_fill_rectangle(camerax(), cameray(), camerax() + 640, cameray() + 480, false);
    gpu_set_blendenable(true);
    gpu_set_colorwriteenable(true, true, true, true);
}
