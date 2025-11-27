if (!show_debug)
    exit;
var _rain_data = "[Q-/W+] Rain style: " + string_char_at(rain_letters, rain_style + 1);
_rain_data += ("#[T-/Y+] Rain gen speed: " + string(genspeed));
_rain_data += ("#[U-/I+] Rain fall speed: " + string(speed_mul));
_rain_data += "#[H] Flip rain direction";
_rain_data += ("#[E] Splash sounds: " + (rainsplash ? "on" : "off"));
_rain_data += ("#[O] Color overlay: " + (color_overlay ? "on" : "off"));
_rain_data += "#[P] Toggle rain debug";
_rain_data += ("#Raindrop count: " + string(dropcount) + " (Max: " + string(max_particles) + ")");
scr_debug_print_persistent("Rainshader", _rain_data);
