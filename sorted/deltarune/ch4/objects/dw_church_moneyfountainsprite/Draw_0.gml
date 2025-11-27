siner++;
animindex = siner / 6;
if (kind == 1)
{
    animindex = (24 - siner) / 6;
    if (siner > 24)
        siner = 0;
}
if (kind == 2)
    animindex = 0;
for (var i = 0; i < 6; i++)
{
    for (var ii = 0; ii < 2; ii++)
        draw_sprite_ext(spr_dw_church_watertile, animindex, x + (i * 40), y + (ii * 40), 2, 2, 0, c_white, 1);
}
draw_sprite_ext(sprite_index, 0, x, y, 2, 2, 0, c_white, 1);
