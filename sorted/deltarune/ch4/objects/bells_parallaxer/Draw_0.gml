if (!sprite_exists(bell_sprite_01))
{
    if (!surface_exists(bg_surface))
        bg_surface = surface_create(room_width * 2, 320);
    surface_set_target(bg_surface);
    draw_clear_alpha(c_black, 0);
    draw_sprite_tiled_ext(spr_bells_parallax_02, 0, 0, 0, 2, 2, c_white, 1);
    surface_reset_target();
    bell_sprite_02 = sprite_create_from_surface(bg_surface, 0, 0, room_width * 2, 320, false, false, 0, 0);
    surface_set_target(bg_surface);
    draw_clear_alpha(c_black, 0);
    draw_sprite_tiled_ext(spr_bells_parallax_01, 0, 0, 0, 2, 2, c_white, 1);
    surface_reset_target();
    bell_sprite_01 = sprite_create_from_surface(bg_surface, 0, 0, room_width * 2, 240, false, false, 0, 0);
    surface_free(bg_surface);
}
else
{
    draw_sprite_ext(bell_sprite_01, 0, camerax() * 0.3, -40, 1, 1, 0, merge_color(c_white, c_black, 0.5), 1);
    draw_sprite(bell_sprite_02, 0, camerax() * 0.2, -80);
    draw_sprite(bell_sprite_01, 0, camerax() * 0.1, -80);
}
