function scr_dso(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9 = 1)
{
    gpu_set_fog(true, arg7, 0, 0);
    draw_sprite_ext(arg0, arg1, arg2 - arg9, arg3, arg4, arg5, arg6, arg7, arg8);
    draw_sprite_ext(arg0, arg1, arg2 + arg9, arg3, arg4, arg5, arg6, arg7, arg8);
    draw_sprite_ext(arg0, arg1, arg2, arg3 - arg9, arg4, arg5, arg6, arg7, arg8);
    draw_sprite_ext(arg0, arg1, arg2, arg3 + arg9, arg4, arg5, arg6, arg7, arg8);
    draw_sprite_ext(arg0, arg1, arg2 - arg9, arg3 - arg9, arg4, arg5, arg6, arg7, arg8);
    draw_sprite_ext(arg0, arg1, arg2 + arg9, arg3 - arg9, arg4, arg5, arg6, arg7, arg8);
    draw_sprite_ext(arg0, arg1, arg2 - arg9, arg3 + arg9, arg4, arg5, arg6, arg7, arg8);
    draw_sprite_ext(arg0, arg1, arg2 + arg9, arg3 + arg9, arg4, arg5, arg6, arg7, arg8);
    gpu_set_fog(false, arg7, 0, 0);
}
