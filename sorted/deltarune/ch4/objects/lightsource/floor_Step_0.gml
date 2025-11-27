if (init == 0)
{
    init = 1;
    if (!i_ex(obj_window_shadow_maker))
        instance_create(0, 0, obj_window_shadow_maker);
    var _stretch = instance_exists(obj_window_shadow_maker) ? obj_window_shadow_maker.stretch : 0;
    if (_stretch > 1)
    {
        y += (sprite_height * (_stretch - 1));
        image_yscale *= _stretch;
    }
    var _lightCaster = instance_create(x, 0, obj_darkness_floorArea_light);
    _lightCaster.sprite_index = sprite_index;
    _lightCaster.image_index = 2;
    _lightCaster.image_xscale = image_xscale;
    _lightCaster.image_yscale = room_height;
    _lightCaster.depth = depth;
}
