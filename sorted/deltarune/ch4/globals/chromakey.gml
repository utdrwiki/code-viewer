global.__shd_chromakey_u_key_color = shader_get_uniform(shd_chromakey, "key_color");
global.__shd_chromakey_u_similarity = shader_get_uniform(shd_chromakey, "similarity");
global.__chromakey_surface = -1;
global.__chromakey_mask_surface = -1;

function surface_check(arg0, arg1, arg2)
{
    if (!surface_exists(arg0))
    {
        return surface_create(arg1, arg2);
    }
    else if (surface_get_width(arg0) != arg1 || surface_get_height(arg0) != arg2)
    {
        surface_resize(arg0, arg1, arg2);
        return arg0;
    }
    return arg0;
}

function chromakey_mask_begin(arg0, arg1 = 0)
{
    global.__chromakey_mask_surface = surface_check(global.__chromakey_mask_surface, room_width, room_height);
    surface_set_target(global.__chromakey_mask_surface);
    draw_clear_alpha(c_black, 0);
    gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_one, bm_inv_src_alpha);
    shader_set(shd_chromakey);
    shader_set_uniform_f(global.__shd_chromakey_u_key_color, color_get_red(arg0) / 255, color_get_green(arg0) / 255, color_get_blue(arg0) / 255);
    shader_set_uniform_f(global.__shd_chromakey_u_similarity, arg1);
}

function chromakey_mask_end()
{
    shader_reset();
    surface_reset_target();
}

function chromakey_on()
{
    global.__chromakey_surface = surface_check(global.__chromakey_surface, room_width, room_height);
    surface_set_target(global.__chromakey_surface);
    draw_clear_alpha(c_black, 0);
    gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_one, bm_inv_src_alpha);
}

function chromakey_off()
{
    gpu_set_blendenable(false);
    gpu_set_colorwriteenable(0, 0, 0, 1);
    draw_surface(global.__chromakey_mask_surface, 0, 0);
    gpu_set_blendenable(true);
    gpu_set_colorwriteenable(1, 1, 1, 1);
    surface_reset_target();
    gpu_set_blendmode(bm_normal);
    draw_surface(global.__chromakey_surface, 0, 0);
}
