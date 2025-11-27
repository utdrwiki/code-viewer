if (zoom_lerp != 0)
{
    surface_set_target(zoom_surf);
    draw_clear(c_black);
    surface_reset_target();
    surface_copy(zoom_surf, 0, 0, application_surface);
    var _zoom_x = zoom_x;
    var _zoom_y = zoom_y;
    if (focus && focus_target != -4)
    {
        _zoom_x += focus_target.x;
        _zoom_y += focus_target.y;
    }
    var _zoom_lerp = zoom_lerp;
    if (ease_in && ease_out)
        _zoom_lerp = scr_ease_inout(_zoom_lerp, pow);
    else if (ease_in)
        _zoom_lerp = scr_ease_in(_zoom_lerp, pow);
    else if (ease_out)
        _zoom_lerp = scr_ease_out(_zoom_lerp, pow);
    scr_draw_surface_zoom(zoom_surf, _zoom_x, _zoom_y, zoom, zoom, _zoom_lerp, 0, 16777215, 1, true);
}
