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

function scr_draw_self_silhouette_plus(arg0 = 0, arg1 = 4)
{
    gpu_set_blendenable(false);
    gpu_set_colorwriteenable(false, false, false, true);
    draw_set_alpha(0);
    draw_set_color(c_black);
    var _tl = scr_get_sprite_point(id, 0, 0, false);
    var _br = scr_get_sprite_point(id, 1, 1, false);
    draw_rectangle(_tl.x + arg0, _tl.y + arg1, _br.x + arg0, _br.y + arg1, false);
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_sprite_ext(sprite_index, image_index, x, y, 2, 2, 0, c_white, 0.9);
    gpu_set_blendenable(true);
    gpu_set_colorwriteenable(true, true, true, true);
    gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
    gpu_set_alphatestenable(true);
    draw_sprite_ext(sprite_index, image_index, x + arg0, y + arg1, 2, 2, 0, c_black, 1);
    gpu_set_alphatestenable(false);
    gpu_set_blendmode(bm_normal);
}

function scr_draw_self_silhouette_plus_mask_start(arg0 = 0, arg1 = 4)
{
    gpu_set_blendenable(false);
    gpu_set_colorwriteenable(false, false, false, true);
    draw_set_alpha(0);
    draw_set_color(c_black);
    var _tl = scr_get_sprite_point(id, 0, 0, false);
    var _br = scr_get_sprite_point(id, 1, 1, false);
    draw_rectangle(_tl.x + arg0, _tl.y + arg1, _br.x + arg0, _br.y + arg1, false);
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_sprite_ext(sprite_index, image_index, x, y, 2, 2, 0, c_white, 0.9);
}

function scr_draw_self_silhouette_plus_mask_end(arg0 = 0, arg1 = 4)
{
    gpu_set_blendenable(true);
    gpu_set_colorwriteenable(true, true, true, true);
    gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
    gpu_set_alphatestenable(true);
    draw_sprite_ext(sprite_index, image_index, x + arg0, y + arg1, 2, 2, 0, c_black, 1);
    gpu_set_alphatestenable(false);
    gpu_set_blendmode(bm_normal);
    draw_set_alpha(1);
}
