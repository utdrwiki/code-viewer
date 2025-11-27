function scr_draw_self_silhouette(arg0, arg1, arg2, arg3)
{
    scr_draw_sprite_silhouette_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, arg0, arg1, image_angle, arg2, arg3 * image_alpha);
}

function scr_draw_silhouette(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
    scr_draw_sprite_silhouette_ext(arg0, arg1, arg2, arg3, 1, 1, arg4, arg5, image_angle, arg6, arg7);
}

function scr_draw_sprite_silhouette_ext(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10)
{
    gpu_set_blendenable(false);
    gpu_set_colorwriteenable(false, false, false, true);
    draw_sprite_ext(arg0, arg1, arg2 + arg6, arg3 + arg7, arg4, arg5, arg8, c_white, 0);
    draw_sprite_ext(arg0, arg1, arg2, arg3, arg4, arg5, arg8, arg9, arg10);
    gpu_set_blendenable(true);
    gpu_set_colorwriteenable(true, true, true, true);
    gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
    gpu_set_alphatestenable(true);
    draw_sprite_ext(arg0, arg1, arg2 + arg6, arg3 + arg7, arg4, arg5, arg8, arg9, 1);
    gpu_set_alphatestenable(false);
    gpu_set_blendmode(bm_normal);
}
