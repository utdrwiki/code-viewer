function scr_simple_menu(arg0, arg1, arg2, arg3, arg4, arg5 = 65535, arg6 = true, arg7 = 0, arg8 = true, arg9 = true)
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
    scr_draw_simple_menu(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg9);
    return arg0;
}

function scr_draw_simple_menu(arg0, arg1, arg2, arg3, arg4, arg5 = 65535, arg6 = true, arg7 = 0, arg8 = true)
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
        {
            if (arg8)
                draw_sprite(spr_heart_outline2, 0, arg1 - 20, arg2 + (arg3 * __i));
            draw_set_color(__col);
        }
    }
}

function scr_simple_menu_transformed(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7 = 65535, arg8 = true, arg9 = 0, arg10 = true, arg11 = true)
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
        if (arg0 != __new_index && arg10)
            snd_play(snd_menumove);
        arg0 = __new_index;
    }
    scr_draw_simple_menu_transformed(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg11);
    return arg0;
}

function scr_draw_simple_menu_transformed(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7 = 65535, arg8 = true, arg9 = 0, arg10 = true)
{
    var __options = array_length(arg4);
    var __col = draw_get_color();
    for (var __i = 0; __i < __options; __i++)
    {
        if (__i == arg0)
            draw_set_color(arg7);
        if (arg8)
            draw_text_transformed_outline(arg1, arg2 + (arg3 * __i), arg4[__i], arg5, arg6, arg9);
        else
            draw_text_transformed(arg1, arg2 + (arg3 * __i), arg4[__i], arg5, arg6, 0);
        if (__i == arg0)
        {
            if (arg10)
                draw_sprite(spr_heart_outline2, 0, arg1 - 20 - (arg5 - 1), arg2 + (arg3 * __i) + ((arg3 * ((arg6 - 1) / arg6)) / 2));
            draw_set_color(__col);
        }
    }
}
