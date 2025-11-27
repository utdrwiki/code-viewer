if (shooting_enabled == false)
    cursor_alpha -= 0.1;
cursor_siner++;
if (!i_ex(obj_tvturnoff_manager))
{
    draw_sprite_ext(spr_shadowman_sharpshoot_cursor, 0, cursor_x + (sin(cursor_siner / 4) * 2), cursor_y + (cos(cursor_siner / 4) * 2), cursor_xscale + 0.5, cursor_yscale + 0.5, cursor_angle, c_white, cursor_alpha / 4);
    draw_sprite_ext(spr_shadowman_sharpshoot_cursor, 0, cursor_x, cursor_y, cursor_xscale, cursor_yscale, cursor_angle, c_white, cursor_alpha / 3);
    draw_sprite_ext(spr_shadowman_sharpshoot_cursor, 0, cursor_x, cursor_y, cursor_xscale - 0.5, cursor_yscale - 0.5, cursor_angle, c_white, cursor_alpha / 1.5);
}
