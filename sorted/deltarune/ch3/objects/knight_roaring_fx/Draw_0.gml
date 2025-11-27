var px = x + (sprite_width * 0.42);
var py = y + (sprite_height * 0.5);
if (bar)
{
    draw_line_width_color(px, py - (bar * 40), px, py + (bar * 40), bar, c_white, c_white);
    bar *= 0.65;
    if (bar < 0.5)
        bar = 0;
}
if (sprite_index == spr_roaringknight_shift_ol)
{
    var xoff = 0;
    var yoff = 0;
    if (shudder)
    {
        xoff = irandom_range(-1, 1);
        yoff = irandom_range(-1, 1);
    }
    draw_sprite_ext(sprite_index, image_index, (x - 20) + xoff, y + 20 + yoff, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (whiteout)
    {
        gpu_set_fog(true, c_white, 0, 0);
        draw_sprite_ext(sprite_index, image_index, (x - 20) + xoff, y + 20 + yoff, image_xscale, image_yscale, image_angle, image_blend, whiteout_counter);
        gpu_set_fog(false, c_black, 0, 0);
    }
}
else
{
    draw_sprite_ext(sprite_index, image_index, x, y + (sin(global.time * 0.2) * 2), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
