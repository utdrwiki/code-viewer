var cx = camerax();
var cy = cameray();
for (var i = 0; i < 14; i++)
{
    for (var ii = 0; ii < 15; ii++)
        draw_sprite_ext(spr_dw_ch3_gachapatternunk, 0, (cx / 2) + (i * 160), (cy / 2) + (ii * (roomheight / 21)), 2, 2, 0, c_white, 0.25);
}
