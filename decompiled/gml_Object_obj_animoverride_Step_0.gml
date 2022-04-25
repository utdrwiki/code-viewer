if (init == false)
{
    source.image_alpha = 0
    init = true
}
if animdone
{
    timer++
    if (timer >= endtime)
    {
        if (source != noone)
            source.image_alpha = 1
        instance_destroy()
    }
}
