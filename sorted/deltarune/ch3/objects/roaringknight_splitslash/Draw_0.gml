if (slash)
{
    draw_self();
}
else
{
    gpu_set_blendmode(bm_add);
    var _ease = scr_ease_out(clamp01(timer / 30), 3);
    var _spin = ((_ease * 15) - 15) * flip;
    var _backing = merge_color(c_black, c_red, 0.5);
    var _growtangle = obj_roaringknight_boxsplitter_attack.growtangle;
    var _size = lerp(4, 0, _ease);
    var _length = _ease * 180;
    draw_sprite_ext(spr_pxwhite10_center, 0, _growtangle.x + xoffset, _growtangle.y + yoffset, _length, _size, _spin + image_angle + angleoffset, _backing, 1);
    gpu_set_blendmode(bm_normal);
}
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
