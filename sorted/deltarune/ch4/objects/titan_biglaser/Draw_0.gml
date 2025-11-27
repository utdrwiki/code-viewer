if (timer > -1)
{
    if (!active)
    {
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale * sin(timer * 2), image_angle, image_blend, image_alpha);
    }
    else
    {
        draw_set_alpha(0.5);
        ossafe_fill_rectangle_color(__view_get(e__VW.XView, 0), __view_get(e__VW.YView, 0), __view_get(e__VW.XView, 0) + 640, __view_get(e__VW.YView, 0) + 480, c_black, c_black, c_black, c_black, false);
        draw_set_alpha(1);
        with (obj_darkshape_light_aura)
            radius = 24;
        with (obj_titan_enemy)
            draw_sprite_ext(spr_titan_charge, 2, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, image_angle, image_blend, image_alpha);
    }
}
else
{
    draw_self();
}

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
