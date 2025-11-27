if (con < 1)
{
    if (show_overlay)
    {
        draw_set_color(c_black);
        ossafe_fill_rectangle(camerax(), cameray(), room_width, room_height, false);
        draw_set_color(c_white);
    }
    exit;
}
if (podium_sprite == -4)
{
    if (podium_surface == -4)
        podium_surface = surface_create(camera_get_view_width(0), camera_get_view_height(0));
    surface_set_target(podium_surface);
    draw_surface_ext(application_surface, 0, 0, 1, 1, 0, c_white, 1);
    surface_reset_target();
    podium_sprite = sprite_create_from_surface(podium_surface, 0, 0, room_width, room_height, false, true, 0, 0);
    surface_free(podium_surface);
}
else if (con == 2)
{
    depth = 600000;
    if (color_changing)
    {
        red_siner += 0.1;
        palette_index = clamp(palette_index + (sin(red_siner) * 0.02), 0.8, 1);
    }
    if (podium_vfx == -4)
    {
        podium_vfx = instance_create(0, 0, obj_ch3_GSC07_podiums);
        podium_vfx.podium_sprite = podium_sprite;
    }
    else
    {
        podium_vfx.con = con;
        podium_vfx.palette_index = palette_index;
    }
    gpu_set_blendenable(false);
    gpu_set_colorwriteenable(false, false, false, true);
    draw_sprite_ext(spr_dw_gameshow_tv_bg_mask, 0, 0, 0, 2, 2, 0, c_white, 1);
    gpu_set_blendenable(true);
    gpu_set_colorwriteenable(true, true, true, true);
    gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
    gpu_set_alphatestenable(true);
    pal_swap_set(spr_gameshow_palette, palette_index, false);
    draw_sprite_ext(spr_dw_gameshow_bg, 0, 0, 0, 2, 2, 0, c_white, 0);
    draw_sprite_ext(spr_dw_gameshow_curtain, 0, 20, 20, 2, 2, 0, c_white, 0);
    pal_swap_reset();
    gpu_set_alphatestenable(false);
    gpu_set_blendmode(bm_normal);
    pal_swap_set(spr_gameshow_palette, palette_index, false);
    draw_sprite_ext(spr_gameshow_screen_lights, 0, 48, 0, 1, 1, 0, c_white, 1);
    draw_sprite_ext(spr_dw_gameshow_curtain, 0, 0, 0, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_gameshow_screen_lights, 0, 592, 0, -1, 1, 0, c_white, 1);
    draw_sprite_ext(spr_dw_gameshow_curtain, 0, 640, 0, -2, 2, 0, c_white, 1);
    pal_swap_reset();
    for (var i = 0; i < 6; i++)
    {
        draw_set_alpha(i / 6);
        draw_set_color(merge_color(c_black, #90407F, 0.15));
        ossafe_fill_rectangle(0, 338 + (i * 16), room_width, 428, false);
        draw_set_alpha(1);
        draw_set_color(c_white);
    }
    ossafe_fill_rectangle_color(0, 420, room_width, cameray() + view_hport[0], merge_color(c_black, #90407F, 0.15), merge_color(c_black, #90407F, 0.15), merge_color(c_black, #90407F, 0.15), merge_color(c_black, #90407F, 0.15), false);
}
if (show_overlay)
{
    draw_set_color(c_black);
    ossafe_fill_rectangle(camerax(), cameray(), room_width, room_height, false);
    draw_set_color(c_white);
}
