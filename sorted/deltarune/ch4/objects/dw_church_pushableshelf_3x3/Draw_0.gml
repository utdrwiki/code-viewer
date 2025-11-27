draw_self();
var drawnumbers = scr_debug() * 0;
if (drawnumbers == 1)
{
    with (obj_heightfloor)
    {
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, image_blend, 0.2);
        draw_text(x, y, string(floorheight));
    }
}
