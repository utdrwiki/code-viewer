function scr_simple_menu(arg0, arg1, arg2, arg3, arg4, arg5 = 65535, arg6 = true, arg7 = 0, arg8 = true)
{
    var __options = array_length(arg4);
    var __index_change = 0;
    if (up_p())
        __index_change -= 1;
    if (down_p())
        __index_change += 1;
    if (__index_change != 0)
    {
        var __new_index = clamp(arg0 + __index_change, 0, __options - 1);
        if (arg0 != __new_index && arg8)
            snd_play(snd_menumove);
        arg0 = __new_index;
    }
    scr_draw_simple_menu(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
    return arg0;
}

function scr_draw_simple_menu(arg0, arg1, arg2, arg3, arg4, arg5 = 65535, arg6 = true, arg7 = 0)
{
    var __options = array_length(arg4);
    var __col = draw_get_color();
    for (var __i = 0; __i < __options; __i++)
    {
        if (__i == arg0)
            draw_set_color(arg5);
        if (arg6)
            draw_text_outline(arg1, arg2 + (arg3 * __i), arg4[__i], arg7);
        else
            draw_text(arg1, arg2 + (arg3 * __i), arg4[__i]);
        if (__i == arg0)
            draw_set_color(__col);
    }
}
