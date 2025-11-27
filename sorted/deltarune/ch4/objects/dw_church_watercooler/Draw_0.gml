var watalph = 1 - haswater;
if (i_ex(mizzle))
{
    watalph = mizzle.image_alpha;
    if (watalph != 0)
        dodrain = true;
}
if (dodrain)
    drain = lerp(drain, 0, 0.125);
draw_sprite_ext(spr_pxwhite, 0, x + 4, y + howfull, 30, 40, 0, merge_color(#2D9BD7, c_white, clamp(sin(siner / 30) * 0.5, 0, 1)), (1 - watalph) * drain);
draw_sprite_ext(sprite_index, 0, x, y, 2, 2, 0, c_white, 1);
draw_sprite_ext(sprite_index, 1, x, y, 2, 2, 0, #2D9BD7, 0.25);
draw_sprite_ext(sprite_index, 2, x, y, 2, 2, 0, #99D9EA, 0.5);
if (scr_debug())
{
    var showcol = false;
    if (showcol)
    {
        var dist = point_distance(x + 20, y + 78, obj_mainchara.x + 20, obj_mainchara.y + 70);
        d_circle(x + 20, y + 38, alertrad, 1);
    }
}
