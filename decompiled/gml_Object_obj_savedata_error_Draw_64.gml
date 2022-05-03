if is_active
{
    if (type == "auto")
    {
        auto_timer++
        if (auto_timer >= 120)
        {
            is_active = false
            global.savedata_pause = 0
            instance_destroy()
        }
    }
    xx = 0
    yy = 0
    draw_set_font(font_face)
    draw_set_alpha(1)
    draw_set_color(c_white)
    var left_x = (xx + 58)
    var top_y = (yy + 78)
    draw_rectangle((left_x * scale), (top_y * scale), ((left_x * scale) + (204 * scale)), ((top_y * scale) + (84 * scale)), false)
    draw_set_color(c_black)
    left_x = (xx + 60)
    top_y = (yy + 80)
    draw_rectangle((left_x * scale), (top_y * scale), ((left_x * scale) + (200 * scale)), ((top_y * scale) + (80 * scale)), false)
    draw_set_halign(fa_center)
    draw_set_color(c_white)
    draw_text_transformed(((left_x * scale) + (100 * scale)), (yy + (100 * scale)), string_hash_to_newline(window_text), scale, scale, 0)
    if (type == "default")
    {
        draw_sprite_ext(spr_heartsmall, 0, (xx + (138 * scale)), (yy + (139 * scale)), scale, scale, 0, c_white, 1)
        draw_set_color(c_yellow)
        draw_text_transformed(((left_x * scale) + (100 * scale)), ((yy * scale) + (135 * scale)), string_hash_to_newline("OK"), scale, scale, 0)
        draw_set_color(c_white)
    }
    draw_set_halign(fa_left)
}
