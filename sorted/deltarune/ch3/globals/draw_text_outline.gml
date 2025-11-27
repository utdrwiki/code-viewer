function draw_text_outline(arg0, arg1, arg2, arg3 = 0, arg4 = 1)
{
    resetcolor = draw_get_color();
    var _s = arg4;
    draw_set_color(c_black);
    if (argument_count >= 4)
        draw_set_color(arg3);
    draw_text(arg0 - _s, arg1, arg2);
    draw_text(arg0 - _s, arg1 - _s, arg2);
    draw_text(arg0 - _s, arg1 + _s, arg2);
    draw_text(arg0 + _s, arg1, arg2);
    draw_text(arg0 + _s, arg1 + _s, arg2);
    draw_text(arg0 + _s, arg1 - _s, arg2);
    draw_text(arg0, arg1 + _s, arg2);
    draw_text(arg0, arg1 - _s, arg2);
    draw_set_color(resetcolor);
    draw_text(arg0, arg1, arg2);
}
