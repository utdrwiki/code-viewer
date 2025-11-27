function draw_text_darkshadow(arg0, arg1, arg2, arg3 = 4210752, arg4 = 8388608, arg5 = 16777215, arg6 = 16777215)
{
    var memfont = draw_get_font();
    scr_84_set_draw_font("mainbig");
    draw_text_color(arg0 + 1, arg1 + 1, arg2, arg3, arg3, arg4, arg4, 1);
    draw_text_color(arg0, arg1, arg2, arg5, arg5, arg6, arg6, 1);
    draw_set_font(memfont);
}
