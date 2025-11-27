siner++;
var col = 65535;
if (dir == 2)
{
    for (var i = 0; i < 3; i++)
    {
        var amt = clamp(sin((siner + (i * 10)) / 30) + 0.5, 0.05, 0.8);
        draw_sprite_ext(spr_arrow_6x3, 0, x + (14 * i), y + 2, 2, 2, 0, col, image_alpha * amt);
    }
}
