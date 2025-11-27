if (init == 0)
{
    with (obj_ch4_DCB02_vfx_circle)
    {
        if (id != other.id)
            depth += 1;
    }
    scr_lerpvar("cursize", 0, maxsize, lifetime);
    scr_lerpvar("alpha", 1, 0, lifetime);
    scr_doom(id, lifetime + 1);
    init = 1;
}
var circledetail = 36;
var scale = cursize;
draw_set_color(color);
for (var i = 0; i < (ripplecount + 1); i++)
{
    for (var j = 0; j < (360 / circledetail); j++)
    {
        draw_set_alpha((alpha * i) / ripplecount);
        var lx1 = x + lengthdir_x((scale * i) / ripplecount, j * circledetail);
        var ly1 = y + lengthdir_y(((scale * i) / ripplecount) * 2, j * circledetail);
        var lx2 = x + lengthdir_x((scale * i) / ripplecount, (j - 1) * circledetail);
        var ly2 = y + lengthdir_y(((scale * i) / ripplecount) * 2, (j - 1) * circledetail);
        d_line_width(lx1, ly1, lx2, ly2, ripplethicc);
    }
}
draw_set_alpha(1);
draw_set_color(c_white);
