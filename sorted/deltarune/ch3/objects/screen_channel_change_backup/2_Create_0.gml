depth = 49000;
strength = 0;
active = false;
screen_sprite = -4;
old_screen_sprite = -4;
screen_surf = -4;
old_screen_surf = -4;
siner = 0;
helix = false;
wrap_around = true;
strength = 200;
timer = 0;
lifetime = 7;
noise_sprite = spr_perlin_noise_480;
scan_x = 0;
scroll_speed = 5;
scroll_dir = randomsign();
infinite = false;
init = false;
scroll = false;
shader = true;
precise = true;
static_noise = -1;
if (global.is_console)
    safe_mode = true;
else
    safe_mode = false;
if (safe_mode)
    debug_print("channel change safemode enabled");
siner = 0;
multa = 20;
multb = 30;
shader_check = 0;
