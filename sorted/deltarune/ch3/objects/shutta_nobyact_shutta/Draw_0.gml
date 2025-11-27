image_alpha += 0.2;
var _color = 16776960;
if (tutorial && tutorialtimer < 70)
{
    tutorialtimer++;
    if (obj_shutta_photo_controller.fastphoto == true)
        tutorialtimer += 0.5;
    var _tutorialtimer = tutorialtimer;
    if (_tutorialtimer >= 50)
    {
        _color = merge_color(c_red, c_aqua, (_tutorialtimer - 50) / 20);
        if (sprite_index == spr_shutta_jump || mysprite == 4375)
            _color = merge_color(c_lime, c_aqua, (_tutorialtimer - 50) / 20);
    }
    else
    {
        _color = 255;
        if (sprite_index == spr_shutta_jump || mysprite == 4375)
            _color = 65280;
    }
}
var _image_xscale = image_xscale;
if (_image_xscale >= 0 && _image_xscale < 0.3)
    _image_xscale = 0.3;
if (_image_xscale < 0 && _image_xscale > -0.3)
    _image_xscale = -0.3;
if (facing == 0)
{
    draw_sprite_ext_flash(sprite_index, image_index, x - 4, y - 4, _image_xscale, image_yscale, image_angle, _color, image_alpha);
    draw_sprite_ext(sprite_index, image_index, x, y, _image_xscale, image_yscale, image_angle, c_black, image_alpha);
}
if (facing == 1)
    draw_sprite_ext(sprite_index, image_index, x, y, _image_xscale, image_yscale, image_angle, image_blend, image_alpha);
