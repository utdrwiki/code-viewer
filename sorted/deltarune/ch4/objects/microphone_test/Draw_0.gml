var cx = camerax();
var cy = cameray();
if (scr_debug())
{
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(room_width / 2, room_height * 0.75, "press [Enter] to start game");
    draw_set_halign(fa_left);
    draw_text(32, 8, "Microphone Sensitivity: " + string(round(global.mic_sensitivity * 100)) + "% \n(left/right arrow to adjust)");
    draw_set_color(c_dkgray);
    draw_text(32, 40, "Microphones: " + string(audio_get_recorder_count()));
}
microphone_volume2 += ((microphone_volume - microphone_volume2) * 0.35);
var vol_x = 32;
var vol_y = 64;
var vol_w = 16;
var vol_h = 480 - (vol_y * 4);
draw_set_colour(merge_colour(c_red, c_black, 0.75));
ossafe_fill_rectangle(cx + vol_x, cy + vol_y, cx + vol_x + vol_w, cy + vol_y + (vol_h * 0.1), 0);
draw_set_colour(merge_colour(c_yellow, c_black, 0.75));
ossafe_fill_rectangle(cx + vol_x, cy + vol_y + (vol_h * 0.1), cx + vol_x + vol_w, cy + vol_y + (vol_h * 0.4), 0);
draw_set_colour(merge_colour(c_green, c_black, 0.75));
ossafe_fill_rectangle(cx + vol_x, cy + vol_y + (vol_h * 0.4), cx + vol_x + vol_w, cy + vol_y + (vol_h * 0.9), 0);
draw_set_colour(merge_colour(c_aqua, c_black, 0.75));
ossafe_fill_rectangle(cx + vol_x, cy + vol_y + (vol_h * 0.9), cx + vol_x + vol_w, cy + vol_y + vol_h, 0);
var vol_colour = 16776960;
if (microphone_volume2 > 10)
    vol_colour = 65280;
if (microphone_volume2 > 60)
    vol_colour = 65535;
if (microphone_volume2 > 90)
    vol_colour = 255;
draw_set_colour(vol_colour);
ossafe_fill_rectangle(cx + vol_x, cy + vol_y + 1 + vol_h, cx + vol_x + vol_w, (((cy + vol_y) - 2) + vol_h) - min(vol_h, (microphone_volume2 / 100) * vol_h), 0);
draw_set_color(c_black);
ossafe_fill_rectangle(cx + vol_x, cy + vol_y, cx + vol_x + vol_w, cy + vol_y + vol_h, 1);
d_triangle(cx + vol_x, (cy + vol_y) - 1, cx + vol_x + vol_w, (cy + vol_y) - 1, cx + vol_x + vol_w, ((cy + vol_y) - 1) + (vol_h * 0.1), 0);
d_triangle((cx + vol_x) - 1, cy + vol_y + vol_h, (cx + vol_x + vol_w) - 1, cy + vol_y + vol_h, (cx + vol_x) - 1, (cy + vol_y + vol_h) - (vol_h * 0.1), 0);
for (var i = 0; i < mic_max; i++)
{
    var _str = "";
    if (i == current)
    {
        draw_set_color(c_yellow);
        _str = ">";
    }
    else
    {
        draw_set_color(c_white);
    }
    if (i == (mic_max - 1))
        draw_text(120, 132 + (i * 12), string(_str) + "Use Gamepad");
    else
        draw_text(120, 120 + (i * 12), string(_str) + string(ds_map_find_value(mic_name[i], "name")));
}
if (scr_debug() && drawing)
{
    draw_set_color(c_white);
    if (current == (mic_max - 1))
        draw_set_color(c_red);
    for (var i = 0; i < ds_list_size(graph); i++)
    {
        if ((i / 8) <= window_get_width())
            d_point(i / 8, (cy + 480) - 10 - ds_list_find_value(graph, i));
        else
            ds_list_delete(graph, i);
    }
}
