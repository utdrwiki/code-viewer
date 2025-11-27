var _sub = sub_index % sub_sprites;
if (_sub < 0)
    _sub += sub_sprites;
var _image = image_index % subframes;
if (_image < 0)
    _image += subframes;
draw_sprite_ext(sprite_index, _image + (floor(_sub) * subframes), x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
