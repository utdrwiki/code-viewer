if scr_queen_buffercheck()
    return;
else
{
    image_alpha -= 0.04
    if (image_alpha < 0)
        instance_destroy()
}
