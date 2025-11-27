if (draw_in_box)
{
    if (!surface_exists(my_surface))
        my_surface = surface_create(75 * obj_growtangle.image_xscale, 75 * obj_growtangle.image_yscale);
    surface_set_target(my_surface);
    color_2 = make_color_rgb(r, g, b);
    draw_circle_color(x - scr_get_box(2), y - scr_get_box(1), circle_size, color_1, color_2, false);
    surface_reset_target();
    gpu_set_blendmode(bm_add);
    draw_surface(my_surface, scr_get_box(2), scr_get_box(1));
    gpu_set_blendmode(bm_normal);
}
else
{
    color_2 = make_color_rgb(r, g, b);
    gpu_set_blendmode(bm_add);
    draw_set_alpha(image_alpha);
    draw_circle_color(x, y, circle_size, color_1, color_2, false);
    gpu_set_blendmode(bm_normal);
}
