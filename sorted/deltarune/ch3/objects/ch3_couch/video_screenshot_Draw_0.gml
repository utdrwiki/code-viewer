if (!sprite_exists(screenshot_sprite))
    screenshot_sprite = sprite_create_from_surface(application_surface, 0, 0, view_wport[0], view_hport[0], false, true, 0, 0);
draw_sprite_ext(screenshot_sprite, 0, 0, 0, screen_scale_x, screen_scale_y, 0, c_white, image_alpha);
