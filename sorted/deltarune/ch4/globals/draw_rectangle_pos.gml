function draw_rectangle_pos(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
    var _x1 = arg0;
    var _y1 = arg1;
    var _x2 = arg2;
    var _y2 = arg3;
    var _x3 = arg4;
    var _y3 = arg5;
    var _x4 = arg6;
    var _y4 = arg7;
    var remcolor = draw_get_color();
    var remalpha = draw_get_alpha();
    if (argument_count > 8)
    {
        if (argument8 != -1)
            draw_set_color(argument8);
    }
    if (argument_count > 9)
        draw_set_alpha(argument9);
    d_triangle(_x1, _y1, _x2, _y2, _x3, _y3, 0);
    d_triangle(_x1, _y1, _x3, _y3, _x4, _y4, 0);
    draw_set_color(remcolor);
    draw_set_alpha(remalpha);
}
