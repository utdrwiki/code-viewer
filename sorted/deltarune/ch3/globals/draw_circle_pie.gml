function draw_circle_pie(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
{
    if (arg2 > 0)
    {
        var numofsections = 60;
        var sizeofsection = 360 / numofsections;
        var val = (arg2 / arg3) * numofsections;
        if (val > 1)
        {
            draw_set_colour(arg4);
            draw_set_alpha(arg6);
            draw_primitive_begin(pr_trianglefan);
            draw_vertex(arg0, arg1);
            for (var i = 0; i <= val; i++)
            {
                var len = (i * sizeofsection) + 90;
                var tx = lengthdir_x(arg5, len);
                var ty = lengthdir_y(arg5, len);
                draw_vertex(arg0 + tx, arg1 + ty);
            }
            draw_primitive_end();
        }
        draw_set_alpha(1);
    }
}
