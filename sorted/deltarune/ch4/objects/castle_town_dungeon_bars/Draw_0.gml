if (!sprite_exists(bg_sprite))
{
    if (!surface_exists(bg_surface))
        bg_surface = surface_create(room_width, room_height);
    surface_set_target(bg_surface);
    draw_clear_alpha(c_black, 0);
    draw_set_color(c_white);
    draw_tilemap(tile_map_id, 0, 0);
    surface_reset_target();
    bg_sprite = sprite_create_from_surface(bg_surface, 0, 0, room_width, room_height, false, true, 0, 0);
    surface_free(bg_surface);
    layer_set_visible("TILES_BARS", false);
}
else
{
    draw_sprite_ext(bg_sprite, 0, 0, 0, 1, 1, 0, c_white, tile_map_alpha);
}
