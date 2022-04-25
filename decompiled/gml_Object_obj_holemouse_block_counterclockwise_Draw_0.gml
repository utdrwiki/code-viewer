draw_self()
if (flash == true)
{
    if (flashtimer == 0)
        flashalpha = 1
    flashtimer++
    if (flashtimer > 6)
    {
        flashalpha *= 0.9
        if (flashalpha < 0.01)
        {
            flash = false
            flashtimer = 0
        }
    }
    draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, flashalpha)
}
