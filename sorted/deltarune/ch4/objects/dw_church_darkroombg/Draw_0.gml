if (view_current == 0)
{
    var cx = camerax();
    var cy = cameray();
    timer++;
    siner++;
    var xspace = 80;
    var yspace = 120;
    var loopheight = (sprite_get_height(spr_dw_church_darksmallwindow) * 2) + yspace;
    if (keyboard_check_pressed(ord("P")))
        debug_print(string(loopheight));
    var bgx = -((cx / 6) % 80);
    var bgy = -((cy / 8) % 238);
    var bgcol = 1377280;
    draw_sprite_ext(spr_pxwhite, 0, cx - 5, cy - 5, 650, 490, 0, bgcol, 1);
    draw_sprite_ext(spr_whitegradientdown_40, 0, camerax(), cameray() + 240, 16, 6, 0, c_black, 0.5);
    for (var i = -2; i < 9; i++)
    {
        for (var ii = -2; ii < 8; ii++)
        {
            var yoff = 0;
            var xoff = 0;
            if ((ii % 2) == 0)
                xoff = 40;
            var sinstuff = sin(((siner + ((i + 3) * 8)) - ((ii + 3) * 16)) / 30) * 0.5;
            var darkcol = 4658956;
            var lightcol = 6765859;
            var mycol = merge_color(darkcol, lightcol, 0.5 + sinstuff);
            draw_sprite_ext(spr_dw_church_darksmallwindow, 0, cx + (i * xspace) + xoff + bgx, cy + (ii * yspace) + yoff + bgy, 2, 2, 0, mycol, 1);
        }
    }
    draw_set_color(c_white);
}
