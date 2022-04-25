if (!text_finish)
{
    if (text_alpha < 1)
        text_alpha += 0.05
    else
    {
        text_finish = 1
        alarm[0] = 30
    }
}
if text_fade
{
    if (text_alpha > 0)
        text_alpha -= 0.05
    else
        instance_destroy()
}
