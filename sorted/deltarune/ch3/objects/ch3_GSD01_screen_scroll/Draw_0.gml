if (!screen_active)
    exit;
if (battle_screenshot == -4)
    battle_screenshot = sprite_create_from_surface(application_surface, 0, 0, view_wport[0], view_hport[0], false, true, 0, 0);
draw_enable_alphablend(false);
draw_sprite_ext(battle_screenshot, 0, screen_x_offset, cameray(), 1, 1, 0, c_white, 1);
draw_enable_alphablend(true);
