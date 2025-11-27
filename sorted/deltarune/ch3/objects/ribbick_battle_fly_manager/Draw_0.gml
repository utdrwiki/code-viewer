if (!surface_exists(my_surface))
    my_surface = surface_create(142, 142);
surface_set_target(my_surface);
draw_clear_alpha(c_black, 0);
with (obj_ribbick_battle_fly)
    draw_sprite(sprite_index, image_index, x - (scr_get_box(2) + 5), y - (scr_get_box(1) + 5));
surface_reset_target();
draw_surface(my_surface, scr_get_box(2) + 5, scr_get_box(1) + 5);
