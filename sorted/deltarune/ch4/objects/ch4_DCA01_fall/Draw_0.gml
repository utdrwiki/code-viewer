if (window_timer <= 0)
    exit;
window_timer += delta;
var _window = (delta > 0.5) ? 2295 : 1258;
for (var i = 0; i < 6; i++)
{
    draw_sprite_ext(_window, 0, camerax() + 40, (cameray() + 500) - (((window_timer * 40) - (i * 200)) % 600), 2, 2, 0, c_white, 1);
    draw_sprite_ext(_window, 0, (camerax() + 640) - 62 - 40, (cameray() + 500) - (((window_timer * 40) - (i * 200)) % 600), 2, 2, 0, c_white, 1);
}
