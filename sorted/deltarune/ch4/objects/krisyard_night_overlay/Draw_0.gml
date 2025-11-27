if (!is_init)
{
    if (i_ex(obj_mainchara))
        kr_target = 1049;
    if (i_ex(obj_caterpillarchara))
        su_target = 1235;
    if (kr_target != -4 && su_target != -4)
        is_init = true;
}
if (!is_init)
    exit;
if (!sprite_exists(overlay_sprite))
{
    if (!surface_exists(overlay_surface))
        overlay_surface = surface_create(room_width, room_height);
    surface_set_target(overlay_surface);
    draw_clear_alpha(merge_color(c_black, c_navy, 0.5), 0.6);
    draw_set_color(merge_color(c_black, c_navy, 0.5));
    draw_set_alpha(0.6);
    ossafe_fill_rectangle(-10, -10, room_width + 10, room_height + 10, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
    surface_reset_target();
    overlay_sprite = sprite_create_from_surface(overlay_surface, 0, 0, room_width, room_height, false, true, 0, 0);
}
else
{
    gpu_set_alphatestenable(true);
    gpu_set_blendenable(true);
    gpu_set_colorwriteenable(false, false, false, true);
    draw_set_alpha(0.2);
    ossafe_fill_rectangle(0, 0, room_width + 20, room_height + 20, false);
    ossafe_fill_rectangle(0, 0, room_width + 20, room_height + 20, false);
    ossafe_fill_rectangle(0, 0, room_width + 20, room_height + 20, false);
    ossafe_fill_rectangle(0, 0, room_width + 20, room_height + 20, false);
    ossafe_fill_rectangle(0, 0, room_width + 20, room_height + 20, false);
    ossafe_fill_rectangle(0, 0, room_width + 20, room_height + 20, false);
    draw_set_alpha(1);
    draw_sprite_ext(bg_building_krishouse_window_night, 0, 125, 236 + y_offset, 1, 1, 0, c_white, 1);
    draw_sprite_ext(bg_building_krishouse_window_night, 0, 199, 236 + y_offset, 1, 1, 0, c_white, 1);
    gpu_set_blendenable(true);
    gpu_set_colorwriteenable(true, true, true, true);
    gpu_set_blendmode_ext(bm_inv_src_alpha, bm_dest_alpha);
    draw_sprite_ext(overlay_sprite, 0, 0, 0, 1, 1, 0, c_white, 1);
    gpu_set_alphatestenable(false);
    gpu_set_blendmode(bm_normal);
    if (room == room_town_krisyard)
    {
        draw_set_alpha(1);
        scr_draw_set_mask(true, true);
        draw_sprite_ext(bg_building_krishouse_window_night, 0, 125, 236 + y_offset, 1, 1, 0, c_white, 0.6);
        draw_sprite_ext(bg_building_krishouse_window_night, 0, 199, 236 + y_offset, 1, 1, 0, c_white, 0.6);
        scr_draw_in_mask_begin();
        var su_x = su_target.x;
        var su_y = su_target.y;
        var kr_x = kr_target.x;
        var kr_y = kr_target.y;
        draw_sprite_ext(su_target.sprite_index, su_target.image_index, su_x, su_y, 1, 1, 0, c_black, 1);
        draw_sprite_ext(kr_target.sprite_index, kr_target.image_index, kr_x, kr_y, 1, 1, 0, c_black, 1);
        scr_draw_in_mask_end();
        draw_set_alpha(1);
    }
}
