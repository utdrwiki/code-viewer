if (loading > 0)
{
    if (loading == 9)
    {
        loopindex = sprite_get_number((sprite_index - 3))
        image_index = 2
        loopindex = 2
    }
    loading--
    if (loading == 0)
        image_index = 0
    else if ((loading % 3) == 0)
        image_index++
}
else if (loopindex > 1 && (!scr_queen_buffercheck()))
{
    animtimer++
    if (animtimer >= (loopindex * 4))
        animtimer = 0
    image_index = floor((animtimer / 4))
}
draw_self()
