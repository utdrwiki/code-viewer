if (init == 0)
{
    init = 1;
    var _stretch = instance_exists(obj_window_shadow_maker) ? obj_window_shadow_maker.stretch : 0;
    if (!wall)
    {
        if (_stretch > 1)
        {
            y += (sprite_height * (_stretch - 1));
            image_yscale *= _stretch;
        }
        var _ydiff = (sprite_height - abs(sprite_height)) / 2;
        var _lightCaster = instance_create(x, y + (_ydiff * 2) + 8, obj_darkness_window_light);
        _lightCaster.sprite_index = sprite_index;
        _lightCaster.image_index = 2;
        _lightCaster.image_xscale = image_xscale;
        _lightCaster.image_yscale = abs(image_yscale);
        _lightCaster.depth = depth;
    }
}
