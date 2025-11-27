var circledetail = 8;
if (scr_is_switch_os())
    circledetail = 24;
var scale = cursize / 2;
ripplethicc *= 0.95;
if (ripplethicc < 1)
    ripplethicc = 1;
draw_set_blend_mode(bm_add);
draw_set_color(color);
for (var i = 0; i < (ripplecount + 1); i++)
{
    for (var j = 0; j < (360 / circledetail); j++)
    {
        var amt = (clamp(alpha, 0, 1) * i) / ripplecount;
        draw_set_color(merge_color(c_black, color, clamp(amt, 0, 1)));
        var lx1 = x + lengthdir_x((scale * i) / ripplecount, j * circledetail);
        var ly1 = y + lengthdir_y((scale * i) / ripplecount, j * circledetail);
        var lx2 = x + lengthdir_x((scale * i) / ripplecount, (j - 1) * circledetail);
        var ly2 = y + lengthdir_y((scale * i) / ripplecount, (j - 1) * circledetail);
        d_line_width(lx1, ly1, lx2, ly2, ripplethicc);
    }
}
draw_set_blend_mode(bm_normal);
draw_set_alpha(1);
draw_set_color(c_white);
