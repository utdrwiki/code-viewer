scr_84_set_draw_font("main");
draw_set_halign(fa_center);
if (credits_mode)
{
    draw_set_color(#660600);
    draw_text_ext_transformed(x_pos + 1, y_pos_base + 1, text_header, 4, 9999, 2, 2, text_angle);
    draw_set_color(c_white);
    draw_text_ext_transformed(x_pos, y_pos_base, text_header, 4, 9999, 2, 2, text_angle);
    for (var i = 0; i < array_length_1d(text_title); i++)
    {
        draw_set_color(#660600);
        draw_text_ext_transformed(x_pos + 1, y_pos_base + 80 + (i * 120) + 1, text_title[i], 4, 9999, 2, 2, text_angle);
        draw_set_color(c_white);
        draw_text_ext_transformed(x_pos, y_pos_base + 80 + (i * 120), text_title[i], 4, 9999, 2, 2, text_angle);
    }
    for (var i = 0; i < array_length_1d(text_line); i++)
    {
        draw_set_color(#660600);
        draw_text_ext_transformed(x_pos + 1, y_pos_base + 110 + (i * 120) + 1, text_line[i], 4, 9999, 2, 2, text_angle);
        draw_set_color(c_white);
        draw_text_ext_transformed(x_pos, y_pos_base + 110 + (i * 120), text_line[i], 4, 9999, 2, 2, text_angle);
    }
}
if (word_mode)
{
    if (blackall.image_alpha == 1)
        draw_sprite_ext(scr_84_get_sprite("spr_dw_screen_word"), 0, camerax() + (view_wport[0] / 2), cameray() + (view_hport[0] / 2), 1, 1, 0, c_white, 1);
}
if (rouxls_mode)
{
    if (blackall.image_alpha == 1)
    {
        if (!rouxls_worm)
        {
            rouxls_worm = true;
            for (var i = 0; i < 3; i++)
            {
                var worm_x = (camerax() + (view_wport[0] / 2)) - (i * 40);
                var worm = scr_dark_marker(worm_x, cameray() + (view_hport[0] / 2) + 30 + (i * 10), spr_rouxls_worm);
                if (i == 0)
                    worm.y = cameray() + (view_hport[0] / 2) + 30 + 20;
                worm.image_speed = 0.1;
                worm.depth = depth - 10;
                scr_lerp_instance_var(worm, "x", worm_x, worm_x - 20, 30, 2, "out");
                scr_script_delayed(scr_lerp_instance_var, 31, worm, "x", worm_x - 20, worm_x - 40, 30, 2, "out");
            }
        }
        rouxls_anim += 0.2;
        draw_sprite_ext(spr_npc_rouxls_cry, rouxls_anim, camerax() + (view_wport[0] / 2) + 50, (cameray() + (view_hport[0] / 2)) - 40, 2, 2, 0, c_white, 1);
    }
}
draw_set_halign(fa_left);
