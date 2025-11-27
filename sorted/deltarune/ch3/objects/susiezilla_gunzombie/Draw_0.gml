draw_self_offset(recoil, -height);
if (redflashtimer > 0 && hurtCon == 0)
{
    redflashtimer--;
    if (redflashtimer == 1 || redflashtimer == 2 || redflashtimer == 5 || redflashtimer == 6 || redflashtimer == 9 || redflashtimer == 10)
    {
        gpu_set_fog(1, c_red, 0, 0);
        draw_self_offset(recoil, -height);
        gpu_set_fog(0, c_red, 0, 0);
    }
}
