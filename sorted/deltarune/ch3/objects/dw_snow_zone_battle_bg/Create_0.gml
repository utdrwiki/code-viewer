y_offset = -10;
bg_height = sprite_get_height(spr_dw_snow_zone_bg_parallax_layer_1) * 2;
fountain_speed = 0.2;
split_screen = false;
bg_surface = -4;
bg_sprite_left = -4;
bg_sprite_right = -4;
bg_pos_offset = 0;
is_active = true;

clean_up = function()
{
    split_screen = false;
    if (surface_exists(bg_surface))
        surface_free(bg_surface);
    if (sprite_exists(bg_sprite_left))
        sprite_delete(bg_sprite_left);
    if (sprite_exists(bg_sprite_right))
        sprite_delete(bg_sprite_right);
    if (persistent)
        persistent = false;
    instance_destroy();
};
