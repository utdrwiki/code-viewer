if (bgdraw == 1)
{
    rate *= (20/21)
    if (rate <= 0.01)
        rate = 0
    rate_alpha -= 0.02
    draw_sprite_ext(spr_krisandsusie_fall_ch1, 0, (__view_get((0 << 0), 0) + 160), ((__view_get((1 << 0), 0) - (rate * 84)) + 200), rate, rate, 0, c_white, rate_alpha)
}
draw_self()
