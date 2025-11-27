if (scr_debug())
{
    if (keyboard_check_pressed(ord("V")))
        dodraw = !dodraw;
    if (dodraw)
    {
        for (var i = 0; i < image_xscale; i++)
        {
            for (var j = 0; j < image_yscale; j++)
                draw_sprite_ext(sprite_index, 0, x + (i * 40), y + (j * 40), 1, 1, 0, c_white, 0.5);
        }
    }
}
