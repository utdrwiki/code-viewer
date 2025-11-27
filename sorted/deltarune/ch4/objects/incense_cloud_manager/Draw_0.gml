if (!surface_exists(cloud_surface))
    cloud_surface = surface_create(600, 600);
surface_set_target(cloud_surface);
draw_clear_alpha(c_black, 0);
with (obj_incense_cloud)
{
    if (con == 0)
        draw_sprite_ext(sprite_index, image_index, x - (obj_growtangle.x - 300), y - (obj_growtangle.y - 300), image_xscale, image_yscale, image_angle, image_blend, 0.95);
}
surface_reset_target();
for (aa = 0; aa < 150; aa++)
    draw_surface_part(cloud_surface, 0, aa * 4, 600, 2, obj_growtangle.x - 300, (obj_growtangle.y - 300) + (aa * 4));
