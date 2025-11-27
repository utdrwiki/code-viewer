if (hover_active)
{
    if (current_y_pos == bottom_pos)
        hover_active = false;
    siner += 0.4;
}
else if ((current_y_pos - top_pos) < 0.5)
{
    hover_active = true;
}
if (type == 1)
{
    if (active)
        siner += siner_speed;
    draw_set_alpha(1);
    scr_draw_set_mask(true, true);
    ossafe_fill_rectangle(x, y - 60, (x + (20 * image_xscale)) - 1, (y + (sprite_get_height(spr_dw_teevie_camera_crowd) * 2) + 20) - 1, false);
    scr_draw_in_mask_begin();
    scr_draw_sprite_tiled_area(spr_dw_teevie_camera_crowd, 0, x, target_y_pos + sin(siner), x, target_y_pos + sin(siner), x + (20 * image_xscale), target_y_pos + sin(siner) + (sprite_get_height(spr_dw_teevie_camera_crowd) * 2), 2, 2, merge_color(c_white, c_black, 0.5), 1);
    scr_draw_sprite_tiled_area(spr_dw_teevie_camera_crowd, 0, x, 10 + target_y_pos + (sin(siner) * 4), x + x_offset, 10 + target_y_pos + (sin(siner) * 4), x + (20 * image_xscale), 10 + target_y_pos + (sin(siner) * 4) + (sprite_get_height(spr_dw_teevie_camera_crowd) * 2), 2, 2, c_white, 1);
    scr_draw_in_mask_end();
}
else
{
    var _type = 3;
    if (room == room_dw_tv_curtain)
        _type = 2;
    if (room == room_dw_teevie_intro)
        _type = 2;
    if (room == room_dw_teevie_large_01)
        _type = 2;
    if (_type == 2)
    {
        var lerpaway = 160;
        var popin = 60;
        if (room == room_dw_teevie_intro)
            lerpaway = 140;
        if (room == room_dw_teevie_large_01)
        {
            lerpaway = 1140;
            popin = 1060;
        }
        if (target_y_pos == lerpaway)
            current_y_pos = lerp(current_y_pos, target_y_pos, 0.2);
        if (target_y_pos == popin)
            current_y_pos = lerp(current_y_pos, target_y_pos, 0.4);
        var count = 2;
        if (room == room_dw_teevie_large_01)
            count = 1;
        var bgcol = merge_color(c_white, c_black, 0.5);
        for (var i = 0; i < count; i++)
            draw_sprite_ext(spr_dw_teevie_camera_crowd, 0, round(((x + (cos(siner / 4) * 8)) - 80) + (i * 640)), round(current_y_pos - abs(sin(siner / 4) * 4)), 2, 2, 0, bgcol, 1);
        for (var i = 0; i < count; i++)
            draw_sprite_ext(spr_dw_teevie_camera_crowd, 0, -8 + round(x + (i * 640) + (cos(siner / 3) * 6)), round(10 + current_y_pos + (sin(siner) * 4)), 2, 2, 0, c_white, 1);
    }
    if (_type == 3)
    {
        draw_set_alpha(1);
        scr_draw_set_mask(true, true);
        ossafe_fill_rectangle(x, y - 60, (x + (20 * image_xscale)) - 1, (y + (sprite_get_height(spr_dw_teevie_camera_crowd) * 2) + 20) - 1, false);
        scr_draw_in_mask_begin();
        current_y_pos = lerp(current_y_pos, target_y_pos, move_speed);
        scr_draw_sprite_tiled_area(spr_dw_teevie_camera_crowd, 0, x, current_y_pos + sin(siner), x, current_y_pos + sin(siner), x + (20 * image_xscale), current_y_pos + sin(siner) + (sprite_get_height(spr_dw_teevie_camera_crowd) * 2), 2, 2, merge_color(c_white, c_black, 0.5), 1);
        scr_draw_sprite_tiled_area(spr_dw_teevie_camera_crowd, 0, x, 10 + current_y_pos + (sin(siner) * 4), x + x_offset, 10 + current_y_pos + (sin(siner) * 4), x + (20 * image_xscale), 10 + current_y_pos + (sin(siner) * 4) + (sprite_get_height(spr_dw_teevie_camera_crowd) * 2), 2, 2, c_white, 1);
        scr_draw_in_mask_end();
    }
}
