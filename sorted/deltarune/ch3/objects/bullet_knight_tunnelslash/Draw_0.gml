if (!surface_exists(spear_surface))
    spear_surface = surface_create(100, 100);
surface_set_target(spear_surface);
draw_clear_alpha(c_black, 0);
draw_sprite_ext(sprite_index, image_index, 50, 50, image_xscale + (sin(timer * 2) * 0.2), image_yscale + (sin(timer * 2) * 0.05), image_angle, c_gray, image_alpha);
draw_sprite_ext(sprite_index, image_index, 50, 50, (image_xscale * 0.85) + (sin(timer * 2) * 0.1), image_yscale + (sin(timer * 2) * 0.05), image_angle, image_blend, image_alpha);
surface_reset_target();
if (y > (scr_get_box(1) + 8) && y < (scr_get_box(3) - 8))
{
    var cut = max((scr_get_box(2) + 7) - (x - 50), 0);
    draw_surface_part(spear_surface, cut, 0, 100 - cut, 100, (x - 50) + cut, y - 50);
}
else
{
    draw_surface_part(spear_surface, 0, 0, 100, 100, x - 50, y - 50);
}
