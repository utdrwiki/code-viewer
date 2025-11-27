var ymod = 0;
if (side == 1)
    ymod = 155;
var cxx = camerax() + xoff;
var cyy = cameray() + yoff;
if (drawbox)
{
    if (global.tempflag[19] == 0)
    {
        xxx = camerax() + xoff;
        yyy = cameray() + yoff;
        if (global.darkzone == 0)
        {
            var sidemod = side * 155;
            var boxwidth_real = 288;
            if (boxwidth != -1)
                boxwidth_real = boxwidth;
            draw_set_color(c_white);
            ossafe_fill_rectangle(xxx + 16, yyy + 5 + sidemod, xxx + 16 + boxwidth_real, ((yyy + 80) - 54) + (18 * boxheight) + sidemod);
            draw_set_color(c_black);
            ossafe_fill_rectangle(xxx + 19, yyy + 8 + sidemod, xxx + 13 + boxwidth, ((yyy + 77) - 54) + (18 * boxheight) + sidemod);
        }
        if (global.darkzone == 1)
        {
            var boxwidth_real = 592;
            if (boxwidth != -1)
                boxwidth_real = boxwidth;
            var sidemod = side * 310;
            scr_darkbox_black(xxx + 24, yyy + 2 + sidemod, xxx + 24 + boxwidth_real, ((yyy + 168) - 108) + (36 * boxheight) + sidemod);
            draw_set_alpha(1);
        }
    }
}
draw_set_color(txtcolor);
scr_84_set_draw_font("mainbig");
var txtspc = 30;
ymod = -310;
if (side == 1)
    ymod = 0;
var xx = ((camerax() + 314) - (round((numcount - 1) * txtspc) / 2)) + xoff;
var yy = cameray() + 378 + yoff + ymod;
for (var i = 0; i < numcount; i++)
{
    if (i == mpos && con == 0)
    {
        var col = 8421504;
        if (up_h())
            col = 16777215;
        draw_sprite_ext(spr_custommenu_arrow_nooutline, 0, xx + (txtspc * i) + 6, yy - 4, 2, 2, 180, col, 1);
        col = 8421504;
        if (down_h())
            col = 16777215;
        draw_sprite_ext(spr_custommenu_arrow_nooutline, 0, xx + (txtspc * i) + 6, yy + 38, 2, 2, 0, col, 1);
    }
    draw_text(xx + (txtspc * i), yy, string(num[i]));
}
draw_set_color(c_white);
