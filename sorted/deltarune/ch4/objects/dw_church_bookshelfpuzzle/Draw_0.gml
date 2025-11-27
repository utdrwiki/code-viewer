with (obj_solid_temp)
{
}
with (ranpc)
{
}
if (drawspotlight)
{
    var cx = camerax();
    var cy = cameray();
    var col = 0;
    draw_sprite_ext(spr_pxwhite, 0, cx, cy, 640, 160, 0, col, 1);
    draw_sprite_ext(spr_pxwhite, 0, cx, cy + 318, 640, 160, 0, col, 1);
    draw_sprite_ext(spr_pxwhite, 0, cx, cy, 240, 480, 0, col, 1);
    draw_sprite_ext(spr_pxwhite, 0, (cx + 640) - 240, cy, 240, 480, 0, col, 1);
    draw_sprite_ext(spr_dw_church_telescope_spotlight, 0, cx + 238, cy + 158, 2, 2, 0, col, 1);
}
