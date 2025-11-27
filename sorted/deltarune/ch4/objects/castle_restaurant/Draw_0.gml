image_alpha = 0.5;
draw_sprite_ext(spr_castle_bakery_sign, 0, x + 138, y + 186, 2, 2, 0, c_white, 1);
var bouncespeed = 8;
var _amt = 24;
timer++;
bounceamt = 20 + abs(sin(timer / bouncespeed) * _amt);
bounceangle = sin(timer / bouncespeed) * _amt;
var bx = x + 82 + 1;
var by = y + 224;
var x1 = round((bx - 82 - bounceangle) / 2) * 2;
var x2 = round(((bx + 82) - bounceangle) / 2) * 2;
var x3 = round((bx + 82) / 2) * 2;
var x4 = round((bx - 82) / 2) * 2;
var y1 = round(((by - 224 - bounceamt) + 24) / 2) * 2;
var y2 = round(((by - 224 - bounceamt) + 24) / 2) * 2;
var y3 = round(by / 2) * 2;
var y4 = round(by / 2) * 2;
var mousadd = 0.7;
var _ymod = 54;
var mousx = (round(bx + lengthdir_x(bounceamt * mousadd, bounceangle + 90)) / 2) * 2;
var mousy = (round((by - _ymod) + lengthdir_y(bounceamt * mousadd, bounceangle + 90)) / 2) * 2;
var browadd = 1;
var _ymod2 = 120;
var browx = (round(bx + lengthdir_x(bounceamt * browadd, bounceangle + 90)) / 2) * 2;
var browy = (round((by - _ymod2) + lengthdir_y(bounceamt * browadd, bounceangle + 90)) / 2) * 2;
d3d_set_fog(true, #007DDF, 0, 0);
for (var i = 0; i < 3; i++)
{
    draw_sprite_pos(spr_castle_bakery_base, 0, x1 - i, y1, x2 - i, y2, x3 - i, y3, x4 - i, y4, 1);
    draw_sprite_ext(spr_castle_bakery_moustache, 0, mousx - i, mousy, 2, 2, mousangle, c_white, 1);
    draw_sprite_ext(spr_castle_bakery_eyebrows, 0, browx - i, browy, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_castle_bakery_moustache, 0, mousx - i, mousy - i, 2, 2, mousangle, c_white, 1);
    draw_sprite_ext(spr_castle_bakery_moustache, 0, mousx + i, mousy - i, 2, 2, mousangle, c_white, 1);
    draw_sprite_pos(spr_castle_bakery_base, 0, x1, y1 - i, x2, y2 - i, x3, y3 - i, x4, y4 - i, 1);
    draw_sprite_ext(spr_castle_bakery_moustache, 0, mousx, mousy - i, 2, 2, mousangle, c_white, 1);
    draw_sprite_ext(spr_castle_bakery_eyebrows, 0, browx, browy - i, 2, 2, 0, c_white, 1);
    draw_sprite_pos(spr_castle_bakery_base, 0, x1 + i, y1, x2 + i, y2, x3 + i, y3, x4 + i, y4, 1);
    draw_sprite_ext(spr_castle_bakery_moustache, 0, mousx + i, mousy, 2, 2, mousangle, c_white, 1);
    draw_sprite_ext(spr_castle_bakery_eyebrows, 0, browx + i, browy, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_castle_bakery_moustache, 0, mousx, mousy + i, 2, 2, mousangle, c_white, 1);
    draw_sprite_ext(spr_castle_bakery_eyebrows, 0, browx, browy + i, 2, 2, 0, c_white, 1);
}
d3d_set_fog(false, c_white, 0, 0);
draw_sprite_pos(spr_castle_bakery_base, 0, x1, y1, x2, y2, x3, y3, x4, y4, 1);
draw_sprite_ext(spr_castle_bakery_moustache, 0, mousx, mousy, 2, 2, mousangle, c_white, 1);
draw_sprite_ext(spr_castle_bakery_eyebrows, 0, browx, browy, 2, 2, 0, c_white, 1);
if ((timer % 750) == 0)
    scr_lerpvar("mousangle", 0, 360 * choose(1, -1), 14, 2, "out");
