function scr_draw_hard_outline(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
{
    var __surf = -1;
    if (!surface_exists(__surf))
        __surf = surface_create(arg2 * 2, arg2 * 2);
    surface_set_target(__surf);
    draw_clear_alpha(c_black, 0);
    var __xdirA = arg9;
    var __xdirB = 0;
    var __ydirA = 0;
    var __ydirB = arg9;
    draw_sprite_ext(arg0, arg1, arg2 + __xdirA, arg3 + __ydirA, arg4, arg5, 0, c_white, 1);
    draw_sprite_ext(arg0, arg1, arg2 - __xdirA, arg3 - __ydirA, arg4, arg5, 0, c_white, 1);
    draw_sprite_ext(arg0, arg1, arg2 + __xdirB, arg3 + __ydirB, arg4, arg5, 0, c_white, 1);
    draw_sprite_ext(arg0, arg1, arg2 - __xdirB, arg3 - __ydirB, arg4, arg5, 0, c_white, 1);
    surface_reset_target();
    gpu_set_fog(true, arg7, 0, 0);
    draw_surface_ext(__surf, arg2, arg3, 1, 1, arg6, c_white, arg8);
    gpu_set_fog(false, c_white, 0, 0);
    if (surface_exists(__surf))
        surface_free(__surf);
}

function scr_draw_battle_outline(arg0 = 255, arg1 = 1, arg2 = 2, arg3 = false)
{
    if (arg1 <= 0)
        exit;
    draw_set_blend_mode(bm_normal);
    var _xx = x;
    var _yy = y;
    var __surf;
    if (arg1 < 1 || arg3)
    {
        _xx = arg2;
        _yy = arg2;
        __surf = -1;
        if (!surface_exists(__surf))
            __surf = surface_create(sprite_width + (arg2 * 2), sprite_height + (arg2 * 2));
        surface_set_target(__surf);
        draw_clear_alpha(c_black, 0);
    }
    d3d_set_fog(true, arg0, 0, 1);
    draw_sprite_ext(sprite_index, image_index, _xx, _yy - arg2, image_xscale, image_yscale, 0, c_white, 1);
    draw_sprite_ext(sprite_index, image_index, _xx - arg2, _yy, image_xscale, image_yscale, 0, c_white, 1);
    draw_sprite_ext(sprite_index, image_index, _xx, _yy + arg2, image_xscale, image_yscale, 0, c_white, 1);
    draw_sprite_ext(sprite_index, image_index, _xx + arg2, _yy, image_xscale, image_yscale, 0, c_white, 1);
    if (arg3)
    {
        draw_set_blend_mode(bm_subtract);
        draw_sprite_ext(sprite_index, image_index, _xx, _yy, image_xscale, image_yscale, 0, c_white, 1);
        draw_set_blend_mode(bm_normal);
    }
    else
    {
        d3d_set_fog(true, #202020, 0, 1);
        draw_sprite_ext(sprite_index, image_index, _xx, _yy, image_xscale, image_yscale, 0, c_white, 1);
    }
    d3d_set_fog(false, c_white, 0, 0);
    if (arg1 < 1 || arg3)
    {
        surface_reset_target();
        draw_surface_ext(__surf, x - arg2, y - arg2, 1, 1, image_angle, c_white, arg1);
        if (surface_exists(__surf))
            surface_free(__surf);
    }
}
