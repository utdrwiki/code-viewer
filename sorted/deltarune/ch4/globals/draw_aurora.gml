function scr_draw_aurora(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
    for (i = 0; i < sprite_get_height(arg2); i++)
    {
        draw_sprite_part_ext(arg2, arg3, 2, i, sprite_get_width(arg2) - 4, 1, ((arg0 + (sin(arg6) * arg4) + (sin(arg7 * 0.1) * 2)) - (sin(arg7 * 0.075) * 2)) + (sin(arg6 * 0.35) * 2), arg1 + i, 1, 1, c_white, 1);
        arg6 += arg5;
    }
}
