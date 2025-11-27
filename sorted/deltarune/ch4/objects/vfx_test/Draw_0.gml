draw_set_valign(fa_bottom);
draw_set_halign(fa_right);
var _string = "#FRAMES: " + string_format_zero(subtimer, 3, 0) + " / " + string(totaltimer) + "#SECONDS: " + string(subtimer / 30) + " / " + string(totaltimer / 30);
if (playing)
    _string = "Playing" + _string;
else if (totaltimer == 0)
    _string = "Stopped" + _string;
else
    _string = "Paused" + _string;
draw_text(camerawidth() - 20, cameraheight() - 20, string_hash_to_newline(_string));
draw_set_valign(fa_top);
draw_set_halign(fa_left);
if (count > 0)
    draw_text(camerax() + 20, cameray() + 10, string_hash_to_newline(timestamp_string));
