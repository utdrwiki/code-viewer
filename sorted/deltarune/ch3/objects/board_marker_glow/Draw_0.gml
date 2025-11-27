draw_sprite_ext(sprite_index, image_index, scr_even(x), scr_even(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (active)
{
    timer++;
    if (glow)
    {
        var glowamt = round(sin(timer / glowspeed) * glowrate) / glowrate;
        glowamt = 1;
        gpu_set_fog(true, glowcolor, 0, 0);
        draw_sprite_ext(sprite_index, image_index, scr_even(x), scr_even(y), image_xscale, image_yscale, image_angle, image_blend, glowamt);
        gpu_set_fog(false, c_white, 0, 0);
    }
}
