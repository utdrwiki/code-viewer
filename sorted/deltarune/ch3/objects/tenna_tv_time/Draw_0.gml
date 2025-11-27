if (!is_active)
    exit;
if (!intro_mode)
    scr_dbox();
lights_anim += lights_anim_speed;
draw_sprite_ext(spr_dw_tv_time_lights, lights_anim, x_pos, y_pos, 1 * room_scale, 1 * room_scale, 0, c_white, 1);
draw_set_color(c_black);
if (lights_max == 4)
    ossafe_fill_rectangle(x_pos, y_pos, x_pos + (165 * room_scale), y_pos + (130 * room_scale));
if (lights_max >= 3)
    ossafe_fill_rectangle(x_pos + (165 * room_scale), y_pos, x_pos + (210 * room_scale), y_pos + (130 * room_scale));
if (lights_max >= 2)
    ossafe_fill_rectangle(x_pos + (210 * room_scale), y_pos, x_pos + (310 * room_scale), y_pos + (130 * room_scale));
if (lights_max >= 1)
    ossafe_fill_rectangle(x_pos + (310 * room_scale), y_pos, x_pos + (500 * room_scale), y_pos + (130 * room_scale));
for (var i = 0; i < tv_max; i++)
{
    tv_text[i][1].x = scr_movetowards(tv_text[i][1].x, 1 * room_scale, 0.4 * tv_pitch);
    tv_text[i][1].y = scr_movetowards(tv_text[i][1].y, 1 * room_scale, 0.4 * tv_pitch);
    draw_sprite_ext(tv_text[i][0], 0, tv_text[i][2].x, tv_text[i][2].y, tv_text[i][1].x, tv_text[i][1].y, 0, c_white, 1);
}
