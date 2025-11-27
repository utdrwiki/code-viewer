if (active && scr_debug())
{
    if (obj_board_camera.shift == "none")
        var count = 0;
}
if (sunk == 0)
{
    draw_self_board();
}
else
{
    var _amt = abs(sin(sunk / 25)) * 3;
    sunk++;
    draw_sprite_ext(sprite_index, image_index, scr_even(x), scr_even(y + _amt), image_xscale, image_yscale, 0, image_blend, image_alpha);
}
