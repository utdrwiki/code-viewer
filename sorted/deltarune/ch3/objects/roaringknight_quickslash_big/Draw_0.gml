if (slash)
    draw_self();
if (playerstrike == 1)
{
    with (obj_heart)
    {
        var _xx = irandom(2) - 1;
        var _yy = irandom(2) - 1;
        var _fade = remap_clamped(45, 55, 1, 0, other.timer);
        draw_sprite(sprite_index, image_index, x + _xx, y + _yy);
        draw_sprite_ext(spr_rk_slash_heartslice, other.cuty, x + _xx, y + _yy, 1, 1, 0, c_white, _fade);
    }
}
