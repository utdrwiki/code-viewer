if (state == 0)
{
    surf = surface_create(room_width, room_height);
    surface_set_target(surf);
    draw_clear_alpha(c_white, 0);
    var lay_id = layer_get_id("TILES_BATTLEBORDER");
    var map_id = layer_tilemap_get_id(lay_id);
    draw_tilemap(map_id, 0, 0);
    spr_battleborder = sprite_create_from_surface(surf, 0, 0, room_width, room_height, 1, 0, 0, 0);
    surface_reset_target();
    surface_free(surf);
    state = 1;
}
if (state == 1)
{
    depth = 777777;
    draw_sprite_ext(spr_battleborder, 0, 0, 0, 1, 1, 0, c_white, myalpha);
}
