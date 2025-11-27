if (!sprite_exists(battle_screenshot))
{
    battle_screenshot = sprite_create_from_surface(application_surface, 0, 0, view_wport[0], view_hport[0], false, true, 0, 0);
    sprite_set_offset(battle_screenshot, sprite_get_width(battle_screenshot) / 2, sprite_get_height(battle_screenshot) / 2);
}
if (screen_active)
{
    draw_enable_alphablend(false);
    draw_sprite_ext(battle_screenshot, 0, 320, 240, screen_scale_x, screen_scale_y, 0, c_white, 1);
    draw_enable_alphablend(true);
}
draw_set_alpha(screen_alpha);
draw_set_color(c_black);
ossafe_fill_rectangle(camerax(), cameray(), view_wport[0], view_hport[0], false);
draw_set_color(c_white);
draw_set_alpha(1);
