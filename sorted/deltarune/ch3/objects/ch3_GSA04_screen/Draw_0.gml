if (con < 0)
{
    if (show_overlay)
    {
        draw_set_color(c_black);
        ossafe_fill_rectangle(camerax(), cameray(), room_width, room_height);
        draw_set_color(c_white);
    }
    exit;
}
if (bg_sprite == -4)
{
    if (bg_surface == -4)
        bg_surface = surface_create(camera_get_view_width(0), camera_get_view_height(0));
    surface_set_target(bg_surface);
    draw_surface_ext(application_surface, 0, 0, 1, 1, 0, c_white, 1);
    surface_reset_target();
    bg_sprite = sprite_create_from_surface(bg_surface, 0, 0, room_width, room_height, false, true, 0, 0);
    surface_free(bg_surface);
}
else if (con == 2)
{
    draw_set_color(c_black);
    ossafe_fill_rectangle(camerax(), cameray(), room_width, room_height);
    draw_set_color(c_white);
    draw_sprite_ext(bg_sprite, 0, screen_pos_list[screen_pos_index].x, screen_pos_list[screen_pos_index].y, 3, 3, 0, c_white, 1);
}
if (show_overlay)
{
    draw_set_color(c_black);
    ossafe_fill_rectangle(camerax(), cameray(), room_width, room_height);
    draw_set_color(c_white);
}
