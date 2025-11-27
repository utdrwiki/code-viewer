var _f = clamp(0.5 + (sin(current_time / 200) * 0.5), 0, 1);
var _rainbow = scr_make_color_hsv(sin(current_time / 500) * 255, 255, 255);
var drawcat = 1;
switch (type)
{
    case 1:
        scr_dso(sprite_index, image_index, x, y, image_xscale * xscale, image_yscale, image_angle, merge_colour(c_blue, c_black, _f), 1, 2);
        break;
    case 2:
        scr_dso(sprite_index, image_index, x, y, image_xscale * xscale, image_yscale, image_angle, merge_colour(c_yellow, c_black, _f), 1, 2);
        break;
    case 3:
        scr_dso(sprite_index, image_index, x, y, image_xscale * xscale, image_yscale, image_angle, _rainbow, 1, 2);
        break;
    case 4:
        draw_sprite_ext(spr_cat_aura, current_time / 100, x, y, image_xscale, image_yscale, 0, _rainbow, 0.5);
        scr_dso(sprite_index, image_index, x, y, image_xscale * xscale, image_yscale, image_angle, _rainbow, 1, 2);
        break;
    case 5:
        var _a = scr_afterimagefast();
        _a.image_blend = _rainbow;
        draw_sprite_ext(spr_cat_wings, current_time / 100, x, y, image_xscale, image_yscale, image_angle, merge_colour(image_blend, c_white, _f), 0.5);
        break;
    case 6:
        var _a = scr_afterimagefast();
        _a.image_blend = c_white;
        draw_sprite_ext(spr_pxwhite, 0, x - 40, y - 500, 80 + (sin(current_time / 200) * 10), 1000 + sin(current_time / 200), 0, c_white, 0.2);
        d3d_set_fog(true, c_white, 0, 1);
        draw_sprite_ext(spr_cat_wings, current_time / 100, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
        d3d_set_fog(false, c_black, 0, 0);
        break;
    case 7:
        var _a = scr_afterimagefast();
        _a.image_blend = c_orange;
        draw_sprite_ext(spr_pxwhite, 0, x - 60, y - 500, 120 + (sin(current_time / 200) * 10), 1000 + sin(current_time / 200), 0, c_orange, 0.2);
        d3d_set_fog(true, c_white, 0, 1);
        draw_sprite_ext(spr_cat_wings, current_time / 100, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
        d3d_set_fog(false, c_black, 0, 0);
        break;
    case 8:
        drawcat = 0;
        draw_sprite_ext(IMAGE_FRIEND_W, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
        break;
}
if (drawcat)
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * xscale, image_yscale, image_angle, image_blend, 1);
