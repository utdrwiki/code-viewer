if (instance_number(object_index) > 1)
    instance_destroy();
surf_circle = surface_create(320, 240);

draw_func = function(arg0, arg1, arg2, arg3, arg4)
{
    var _writestate = gpu_get_colorwriteenable();
    var _blendstate = gpu_get_blendenable();
    var _alpha = draw_get_alpha();
    var _col = draw_get_color();
    gpu_set_colorwriteenable(true, true, true, true);
    gpu_set_blendenable(true);
    draw_set_alpha(1);
    if (!surface_exists(surf_circle))
        surf_circle = surface_create(320, 240);
    var _camx = camerax();
    var _camy = cameray();
    surface_set_target(surf_circle);
    draw_clear_alpha(c_black, arg4 ? 1 : 0);
    draw_set_color(_col);
    draw_set_alpha(arg4 ? 0 : 1);
    if (arg4)
        gpu_set_blendenable(false);
    var _off = 0;
    if (os_type == os_switch)
        _off = 1;
    d_circle((arg0 - _camx) + _off, (arg1 - _camy) + _off, arg2, arg3);
    draw_set_alpha(1);
    surface_reset_target();
    gpu_set_blendenable(_blendstate);
    draw_set_alpha(_alpha);
    gpu_set_colorwriteenable(_writestate);
    draw_surface(surf_circle, _camx, _camy);
};
