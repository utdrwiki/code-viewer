draw_sprite_ext(spr_pxwhite, 0, x + 2, y, 4, -960, 0, c_black, 1);
draw_sprite_ext(sprite_index, 0, x, y, 2, 2, 0, c_black, image_alpha);
if (scr_debug())
{
    draw_set_color(-1);
    var drawrect = false;
    if (drawrect)
    {
        var xx = x - 32;
        var yy = y;
        ossafe_fill_rectangle(xx, yy, xx + 68, yy + 36, 1);
        with (obj_mainchara)
            ossafe_fill_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1);
    }
}
draw_set_color(-1);
