if (active == true)
{
    if (stepped == false)
    {
        with (obj_glowtilepuzz_ch1)
            stepnoise = true
        sprite_index = spr_glowtile_on_ch1
    }
    stepped = true
    stepbuffer = 3
}
