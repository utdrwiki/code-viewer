function draw_sprite_ext_skew()
{
    var sprite = argument0;
    var subimg = argument1;
    var _x = argument2;
    var _y = argument3;
    var scalex = argument4;
    var scaley = argument5;
    var rot = argument6;
    var alpha = argument7;
    var skew_kx = argument8;
    var skew_ky = argument9;
    var skew_sx = argument10;
    var skew_sy = argument11;
    var rcos = dcos(rot);
    var rsin = -dsin(rot);
    var x1 = -sprite_get_xoffset(sprite) * scalex;
    var x2 = x1 + (sprite_get_width(sprite) * scalex);
    var y1 = -sprite_get_yoffset(sprite) * scaley;
    var y2 = y1 + (sprite_get_height(sprite) * scaley);
    for (var c = 0; c < 4; c++)
    {
        var lx;
        if (c & 1)
            lx = x2;
        else
            lx = x1;
        var ly;
        if (c & 2)
            ly = y2;
        else
            ly = y1;
        var rx = (lx * rcos) - (ly * rsin);
        var ry = (lx * rsin) + (ly * rcos);
        global._draw_sprite_ext_skew_x[c] = _x + ((rx + (ry * skew_kx)) * skew_sx);
        global._draw_sprite_ext_skew_y[c] = _y + ((ry + (rx * skew_ky)) * skew_sy);
    }
    draw_sprite_pos(sprite, subimg, global._draw_sprite_ext_skew_x[0], global._draw_sprite_ext_skew_y[0], global._draw_sprite_ext_skew_x[1], global._draw_sprite_ext_skew_y[1], global._draw_sprite_ext_skew_x[3], global._draw_sprite_ext_skew_y[3], global._draw_sprite_ext_skew_x[2], global._draw_sprite_ext_skew_y[2], alpha);
}
