tile_map = layer_get_id("TILES_BARS");
tile_map_id = layer_tilemap_get_id(tile_map);
tile_map_alpha = 1;
bg_surface = -4;
bg_sprite = -4;

hide_bars = function()
{
    scr_lerp_var_instance(id, "tile_map_alpha", 1, 0, 30);
};

show_bars = function()
{
    scr_lerp_var_instance(id, "tile_map_alpha", 0, 1, 30);
};
