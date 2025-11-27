var _x1 = x + x1;
var _x2 = x + x2;
var _x3 = x + x3;
var _x4 = x + x4;
var _y1 = y + y1;
var _y2 = y + y2;
var _y3 = y + y3;
var _y4 = y + y4;
if (drawtype == 0)
{
    if (xscale != 2)
    {
        _x1 = x + ((_x1 - x) * (xscale / 2));
        _x2 = x + ((_x2 - x) * (xscale / 2));
        _x3 = x + ((_x3 - x) * (xscale / 2));
        _x4 = x + ((_x4 - x) * (xscale / 2));
    }
    if (yscale != 2)
    {
        _y1 = y + ((_y1 - y) * (yscale / 2));
        _y2 = y + ((_y2 - y) * (yscale / 2));
        _y3 = y + ((_y3 - y) * (yscale / 2));
        _y4 = y + ((_y4 - y) * (yscale / 2));
    }
    if (outline)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_pos(sprite_index, image_index, _x1 - 2, _y1, _x2 - 2, _y2, _x3 - 2, _y3, _x4 - 2, _y4, image_alpha);
        draw_sprite_pos(sprite_index, image_index, _x1, _y1 - 2, _x2, _y2 - 2, _x3, _y3 - 2, _x4, _y4 - 2, image_alpha);
        draw_sprite_pos(sprite_index, image_index, _x1, _y1 + 2, _x2, _y2 + 2, _x3, _y3 + 2, _x4, _y4 + 2, image_alpha);
        draw_sprite_pos(sprite_index, image_index, _x1 + 2, _y1, _x2 + 2, _y2, _x3 + 2, _y3, _x4 + 2, _y4, image_alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (dropshadow)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_pos(sprite_index, image_index, _x1 + dropdist, _y1 + dropdist, _x2 + dropdist, _y2 + dropdist, _x3 + dropdist, _y3 + dropdist, _x4 + dropdist, _y4 + dropdist, image_alpha);
        d3d_set_fog(false, c_white, 0, 0);
    }
    draw_sprite_pos(sprite_index, image_index, _x1, _y1, _x2, _y2, _x3, _y3, _x4, _y4, image_alpha);
}
if (drawtype == 1)
{
    if (dropshadow)
        draw_sprite_ext(sprite_index, image_index, x + dropdist, y + dropdist, image_xscale, image_yscale, image_angle, c_black, image_alpha);
    draw_self();
}
