if loaded
{
    if (save_ready == true && image_alpha == 1)
    {
        scr_load_ch1()
        save_ready++
    }
    if (!alpha_set)
    {
        fadespeed = 0.08
        alpha_set = 1
        save_ready++
    }
    if (save_ready == 2)
    {
        fadespeed = -0.08
        save_ready++
    }
}
