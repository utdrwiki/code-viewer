if (obj_growtangle.customBox)
    exit;
var _newyscale = 3.3333333333333335;
with (obj_growtangle)
{
    customBox = true;
    image_yscale = _newyscale;
    var _boxhalf = 37;
    maxyscale = _newyscale;
    var _tempxscale = maxxscale / 2;
    var _tempyscale = maxyscale / 2;
    var _halfsplit = 50;
    var surf = surface_create(75 * _tempxscale, 75 * _tempyscale);
    var _halfwidth = 75 * _tempxscale;
    var _halfheight = 75 * _tempyscale;
    surface_set_target(surf);
    draw_clear_alpha(c_black, 0);
    draw_sprite_part_ext_rot(2819, 0, 0, 0, _halfwidth, _boxhalf, floor(_halfwidth / 2), floor(_halfheight / 2) - (_halfsplit / 2), 1, 1, 0, 16777215, 1);
    draw_sprite_part_ext_rot(2819, 0, 0, 0, _halfwidth, _boxhalf, floor(_halfwidth / 2), floor(_halfheight / 2) + (_halfsplit / 2), 1, 1, 180, 16777215, 1);
    draw_set_color(c_white);
    ossafe_fill_rectangle(0, floor(_halfheight / 2) - (_halfsplit / 2), _halfwidth, floor(_halfheight / 2) - (_halfsplit / 2));
    ossafe_fill_rectangle(0, floor(_halfheight / 2) + (_halfsplit / 2), _halfwidth, floor(_halfheight / 2) + (_halfsplit / 2));
    spr_custom_box = sprite_create_from_surface(surf, 0, 0, _halfwidth, _halfheight, false, false, round(_halfwidth / 2), round(_halfheight / 2));
    surface_reset_target();
    surface_free(surf);
}
