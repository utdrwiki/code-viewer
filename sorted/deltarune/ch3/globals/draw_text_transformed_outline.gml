function draw_text_transformed_outline(arg0, arg1, arg2, arg3, arg4, arg5 = 0, arg6 = true)
{
    var _oldcolor = draw_get_color();
    draw_set_color(arg5);
    draw_text_transformed(arg0 - arg3, arg1, arg2, arg3, arg4, 0);
    draw_text_transformed(arg0 + arg3, arg1, arg2, arg3, arg4, 0);
    draw_text_transformed(arg0, arg1 + arg4, arg2, arg3, arg4, 0);
    draw_text_transformed(arg0, arg1 - arg4, arg2, arg3, arg4, 0);
    if (arg6)
    {
        draw_text_transformed(arg0 - arg3, arg1 - arg4, arg2, arg3, arg4, 0);
        draw_text_transformed(arg0 + arg3, arg1 + arg4, arg2, arg3, arg4, 0);
        draw_text_transformed(arg0 - arg3, arg1 + arg4, arg2, arg3, arg4, 0);
        draw_text_transformed(arg0 + arg3, arg1 - arg4, arg2, arg3, arg4, 0);
    }
    draw_set_color(_oldcolor);
    draw_text_transformed(arg0, arg1, arg2, arg3, arg4, 0);
}
