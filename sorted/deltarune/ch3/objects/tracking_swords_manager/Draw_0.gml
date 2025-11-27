if (!surface_exists(hell_surface))
    hell_surface = surface_create(150, 150);
surface_set_target(hell_surface);
draw_clear_alpha(c_black, 0);
draw_set_blend_mode(bm_add);
with (obj_tracking_sword_slash)
    draw_sprite_ext(sprite_index, image_index, x - gt_minx(), y - gt_miny(), image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_set_blend_mode(bm_normal);
surface_reset_target();
draw_surface(hell_surface, gt_minx(), gt_miny());
