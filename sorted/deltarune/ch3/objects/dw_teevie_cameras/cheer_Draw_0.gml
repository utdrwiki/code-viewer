siner += siner_speed;
anim += anim_speed;
var _type = 0;
if (room == room_dw_tv_curtain || room == room_dw_teevie_intro || room == room_dw_teevie_large_01 || room == room_dw_teevie_shuttahmaze)
    _type = 1;
if (scr_debug())
{
    if (keyboard_check(ord("P")))
        _type = 0;
}
if (_type == 1)
{
    var _offset = 10;
    var count = 8;
    if (room == room_dw_teevie_intro)
        count = 4;
    if (room == room_dw_teevie_large_01)
        count = 3;
    if (room == room_dw_teevie_shuttahmaze)
    {
        if (extflag == "a")
        {
            count = 2;
            x = 28;
        }
        if (extflag == "b")
        {
            x = xstart + 64;
            count = 4;
        }
        if (extflag == "c")
            count = 2;
    }
    for (var i = 0; i < (count + 2); i++)
    {
        var _y_offset = ((i % 2) == 1) ? -20 : -10;
        var _xpos = x + (i * 126) + (cos((siner + (i * 80)) / 4) * 8);
        draw_sprite_ext(spr_gameshow_crowd_b, anim * 1.5, _xpos, y_base_pos + _y_offset + (sin(siner) * 8), 1.8 + (sin(siner) * 0.2), 2 + (sin(siner) * 0.1), 0, c_white, 1);
    }
    for (var i = 0; i < (count + 1); i++)
    {
        var _y_offset = ((i % 2) == 1) ? 20 : 0;
        draw_sprite_ext(spr_gameshow_crowd_a, anim, (x + 40 + (132 * i)) - (sin((siner * ((i * 6) + 1) * 6) / 400) * 2), y_base_pos + _y_offset + (sin(siner) * 8), 1.8 + (sin(siner + (30 * i)) * 0.1), 2 + (sin(siner + (30 * i)) * 0.1), 0, c_white, 1);
    }
    for (var i = 0; i < (count + 2); i++)
    {
        var _y_offset = ((i % 2) == 1) ? 0 : 30;
        var _x_pos = x + 40 + (i * 120);
        draw_sprite_ext(spr_gameshow_crowd_b, anim + 0.6, _x_pos, y_base_pos + _y_offset + (sin(siner + (i * 20)) * 8), 1.8 + (sin(siner) * 0.2), 2 + (sin(siner) * 0.1), 0, c_white, 1);
    }
    for (var i = 0; i < count; i++)
    {
        var _y_offset = ((i % 2) == 1) ? 30 : 10;
        var _x_pos = x + 88 + (i * 140);
        draw_sprite_ext(spr_gameshow_crowd_a, anim + 0.8 + (i * 2), _x_pos, y_base_pos + _y_offset + sin(siner), 1.8 + (sin(siner) * 0.2), 2 + (sin(siner) * 0.1), 0, c_white, 1);
    }
    var blackwidth = 64;
    if (room == room_dw_teevie_intro)
        blackwidth = 800;
    if (room == room_dw_teevie_large_01)
        blackwidth = 720;
    if (room != room_dw_teevie_shuttahmaze)
    {
        draw_sprite_ext(spr_gradient20, 0, x - 80, y + 320, blackwidth / 20, 2.3, 0, c_black, 1);
        draw_sprite_ext(spr_gradient20, 0, x - 80, y + 320, blackwidth / 20, 2.3, 0, c_black, 1);
    }
    if (room == room_dw_teevie_intro || room == room_dw_teevie_large_01)
        draw_sprite_ext(spr_pxwhite, 0, x - 80, y + 320, blackwidth, 80, 0, c_black, 1);
    if (room == room_dw_teevie_shuttahmaze)
    {
        var col = 0;
        var xoff = 0;
        var yhei = 400;
        var yoff = 280;
        if (extflag == "a")
        {
            xoff = 52;
            blackwidth = 480;
        }
        if (extflag == "b")
        {
            xoff = 12;
            blackwidth = 808;
        }
        if (extflag == "botRightCrowd")
        {
            xoff = 0;
            blackwidth = 720;
            yoff = 300;
        }
        if (extflag == "c")
        {
            xoff = 0;
            blackwidth = 560;
            yoff = 300;
        }
        draw_sprite_ext(spr_gradient20, 0, (xoff + x) - 80, y + yoff, blackwidth / 20, 2.3, 0, col, 1);
        draw_sprite_ext(spr_gradient20, 0, (xoff + x) - 80, y + yoff, blackwidth / 20, 2.3, 0, col, 1);
        draw_sprite_ext(spr_pxwhite, 0, (xoff + x) - 80, y + yoff, blackwidth, yhei, 0, col, 1);
    }
}
if (_type == 0)
{
    draw_set_alpha(1);
    scr_draw_set_mask(true, true);
    ossafe_fill_rectangle(x, (y + 200) - 60, (x + (20 * image_xscale)) - 1, (y + 300) - 1);
    scr_draw_in_mask_begin();
    var _offset = 10;
    var _max_width = (x + (20 * image_xscale)) - (x + _offset);
    var _max_amount = floor(_max_width / (sprite_get_width(spr_gameshow_crowd_b) * 2));
    for (var i = 0; i < _max_amount; i++)
    {
        var _y_offset = ((i % 2) == 1) ? -20 : -10;
        var _x_pos = x + _offset + 58 + (i * (_max_width / _max_amount));
        draw_sprite_ext(spr_gameshow_crowd_b, anim * 1.5, _x_pos, y_base_pos + _y_offset + (sin(siner) * 8), 1.8 + (sin(siner) * 0.2), 2 + (sin(siner) * 0.1), 0, c_white, 1);
    }
    _max_width = (x + (20 * image_xscale)) - x;
    _max_amount = floor(_max_width / (sprite_get_width(spr_gameshow_crowd_a) * 2));
    for (var i = 0; i < _max_amount; i++)
    {
        var _y_offset = ((i % 2) == 1) ? 20 : 0;
        var _x_pos = x + 88 + (i * (_max_width / _max_amount));
        draw_sprite_ext(spr_gameshow_crowd_a, anim, _x_pos, y_base_pos + _y_offset + (sin(siner) * 8), 1.8 + (sin(siner) * 0.2), 2 + (sin(siner) * 0.1), 0, c_white, 1);
    }
    _max_width = (x + (20 * image_xscale)) - x;
    _max_amount = floor(_max_width / (sprite_get_width(spr_gameshow_crowd_b) * 2));
    for (var i = 0; i < _max_amount; i++)
    {
        var _y_offset = ((i % 2) == 1) ? 20 : 0;
        var _x_pos = x + 58 + (i * (_max_width / _max_amount));
        draw_sprite_ext(spr_gameshow_crowd_b, anim + 0.6, _x_pos, y_base_pos + _y_offset + (sin(siner) * 8), 1.8 + (sin(siner) * 0.2), 2 + (sin(siner) * 0.1), 0, c_white, 1);
    }
    _offset = 60;
    _max_width = (x + (20 * image_xscale)) - (x + _offset);
    _max_amount = floor(_max_width / (sprite_get_width(spr_gameshow_crowd_a) * 2));
    for (var i = 0; i < _max_amount; i++)
    {
        var _y_offset = ((i % 2) == 1) ? 30 : 10;
        var _x_pos = x + _offset + 88 + (i * (_max_width / _max_amount));
        draw_sprite_ext(spr_gameshow_crowd_a, anim + 0.8, _x_pos, y_base_pos + _y_offset + sin(siner), 1.8 + (sin(siner) * 0.2), 2 + (sin(siner) * 0.1), 0, c_white, 1);
    }
    scr_draw_in_mask_end();
    for (var i = 0; i < 5; i++)
    {
        draw_set_alpha(i / 5);
        draw_set_color(c_black);
        ossafe_fill_rectangle(x, (y + 200 + 40 + (i * 10)) - 1, x + (20 * image_xscale), (y + 300) - 1);
        draw_set_alpha(1);
        draw_set_color(c_white);
    }
}
