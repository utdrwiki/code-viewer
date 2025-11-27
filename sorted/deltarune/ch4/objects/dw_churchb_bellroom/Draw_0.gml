var _cx = camerax();
var _cy = cameray();
draw_sprite_ext(spr_gradient20, 0, _cx - 10, _cy + 480, 33, 24, 0, c_black, 0.8);
for (var i = 0; i < 4; i++)
    draw_sprite_ext(spr_bells_parallax_02, 0, round((640 * i) - (_cx / 6)), 560 + (cos((timer + (i * 6)) / 12) * 4), 2, -2, 0, c_white, 1);
if (scr_debug())
{
    var count = 0;
    var space = 10;
    var border = 8;
}
