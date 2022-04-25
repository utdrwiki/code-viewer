if (image_alpha < 1)
    image_alpha += 0.05
if (image_alpha < 0)
    return;
if image_play
{
    timer++
    if (timer == 3)
    {
        timer = 0
        image_index++
        if (image_index == max_index)
            image_play = 0
    }
}
draw_self()
if (image_alpha < 1)
    return;
af = scr_afterimage()
af.fadeSpeed = 0.25
if ((image_index - frame_offset) >= 0)
{
    draw_sprite_ext(headsprite, (image_index - frame_offset), x, y, image_xscale, image_yscale, 0, c_black, 1)
    af = scr_afterimage()
    af.image_index = (image_index - frame_offset)
    af.sprite_index = headsprite
    af.fadeSpeed = 0.25
}
if (max_index == 11)
{
    if (timer < 15)
        timer++
    y = lerp(ystart, (ystart + 120), scr_ease_out((timer / 15), 1))
}
