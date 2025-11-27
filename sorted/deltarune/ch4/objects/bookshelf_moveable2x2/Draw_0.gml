draw_self();
alpha = lerp(alpha, active, 0.125);
draw_sprite_ext(sprite_index, 1, x, y, 2, 2, 0, c_white, (abs(sin(siner / 15) * 0.2) + 0.8) * alpha);
var myicon = 0;
var mycol = 16777215;
var alt = 0;
switch (sprite_index)
{
    case spr_dw_church_2x2shelf_blue:
        myicon = 4912;
        mycol = 5711637;
        break;
    case spr_dw_church_2x2shelf_red:
        myicon = 5271;
        mycol = 1905236;
        break;
    case spr_dw_church_2x2shelf_green:
        myicon = 4601;
        mycol = 16896;
        break;
    case spr_dw_church_2x2shelf_pink:
        myicon = 3194;
        mycol = 9717932;
        break;
    case spr_dw_church_2x2shelf_purple:
        myicon = 1378;
        mycol = 5114958;
        break;
    case spr_dw_church_2x2shelf_orange:
        myicon = 1378;
        mycol = 77861;
        alt = 1;
        break;
}
if (myicon)
{
    var modifier = 1;
    if (alt)
        modifier = -1;
    draw_sprite_ext(myicon, 0, x + 40, y + 40, 2 * modifier, 2 * modifier, 0, mycol, 1 - (alpha * 2));
}
if (alpha > 0 && myicon)
{
    if (!left_h() && !down_h() && !right_h() && !up_h())
        soundtoplay = 0;
    if (left_h())
        soundtoplay = 1;
    if (down_h())
        soundtoplay = 3;
    if (right_h())
        soundtoplay = 5;
    if (up_h())
        soundtoplay = 7;
    var drawx = x + 40;
    var drawy = y + 40;
    var litblue = 16777215;
    var sprangle = 0;
    var scale = 2;
    var circlespr = myicon;
    var arrowspr = 4477;
    var _space = 24;
    var sinstrength = 0;
    var sintimevar = 15;
    var sintimevariance = 3;
    var afterimagemovespeed = 5;
    var afterimagefriction = -1;
    var basealpha = 0.35;
    var bonusalpha = 0;
    var xloc = drawx + _space;
    var sinmod = (1/3) * sintimevar;
    var yloc = drawy + (sin((siner + sinmod) / sintimevar) * sinstrength);
    var angle = 90;
    var xscale = 2;
    var yscale = 2;
    if (soundtoplay == 5)
        bonusalpha = 0.5;
    draw_sprite_ext(arrowspr, 0, xloc, yloc, xscale, yscale, angle, litblue, (basealpha + bonusalpha) * alpha);
    bonusalpha = 0;
    xloc = drawx - _space;
    sinmod = (2/3) * sintimevar;
    yloc = drawy + (sin((siner + sinmod) / sintimevar) * sinstrength);
    xscale = -2;
    yscale = 2;
    angle = 270;
    if (soundtoplay == 1)
        bonusalpha = 0.5;
    draw_sprite_ext(arrowspr, 0, xloc, yloc, -2, 2, angle, litblue, (basealpha + bonusalpha) * alpha);
    bonusalpha = 0;
    xloc = drawx;
    sinmod = 1 * sintimevar;
    yloc = (drawy - _space) + (sin((siner + sinmod) / sintimevar) * sinstrength);
    xscale = 2;
    yscale = 2;
    angle = 180;
    if (soundtoplay == 7)
        bonusalpha = 0.5;
    draw_sprite_ext(arrowspr, 0, xloc, yloc, 2, 2, angle, litblue, (basealpha + bonusalpha) * alpha);
    bonusalpha = 0;
    xloc = drawx;
    sinmod = (4/3) * sintimevar;
    yloc = drawy + _space + (sin((siner + sinmod) / sintimevar) * sinstrength);
    xscale = 2;
    yscale = 2;
    angle = 0;
    if (soundtoplay == 3)
        bonusalpha = 0.5;
    draw_sprite_ext(arrowspr, 0, xloc, yloc, xscale, yscale, angle, litblue, (basealpha + bonusalpha) * alpha);
    bonusalpha = 0;
    xloc = drawx;
    sinmod = 1.6666666666666667 * sintimevar;
    yloc = drawy + (sin((siner + sinmod) / sintimevar) * sinstrength);
    xscale = 2;
    yscale = 2;
    angle = 0;
    if (soundtoplay == 0)
        bonusalpha = 0.5;
    var modifier = 1;
    if (alt)
        modifier = -1;
    draw_sprite_ext(myicon, 0, xloc, yloc, xscale * modifier, yscale * modifier, 0, litblue, (basealpha + bonusalpha) * alpha);
}
