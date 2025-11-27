if (active)
{
    if (con == 0)
        image_index = abs(sin(siner / 15) * 3);
    if (!infinite)
    {
        if (con < 2)
            draw_self();
        if (con == 20)
            draw_self();
    }
    else
    {
        draw_self();
    }
}
