if (con == 4)
    draw_sprite_ext(spr_saucershadow, 0, x, y, 1.5, 3.5, 0, c_black, 0.5);
y += yoffset;
draw_sprite_ext(spr_dw_churchb_movingpianocarpet, 0, x, y, 1, 1, 0, c_white, 1);
x += (sin(shakex * 1.5) * (shakex / 2));
y += (sin(shakey * 1.5) * (shakey / 2));
draw_self();
x -= (sin(shakex * 1.5) * (shakex / 2));
y -= (sin(shakey * 1.5) * (shakey / 2));
y -= yoffset;
var count = 0;
var space = 10;
var border = 8;
var _cx = camerax();
var _cy = cameray();
