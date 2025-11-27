if (!surface_exists(default_surface))
    default_surface = surface_create(camera_get_view_width(0), camera_get_view_height(0));
surface_set_target(default_surface);
draw_clear(c_black);
pal_swap_set(spr_lw_church_palette, palette_index, false);
if (room == room_lw_church_entrance)
    draw_sprite(bg_church_entrance, 0, 0, 0);
else if (room == room_lw_church_choir)
    draw_sprite(bg_church_choir, 0, 0, 0);
else if (room == room_lw_church_office)
    draw_sprite(bg_church_office, 0, 0, 0);
pal_swap_reset();
surface_reset_target();
draw_surface_ext(default_surface, 0, 0, 1, 1, 0, c_white, 1);
