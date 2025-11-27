if (timer > 10 || timer % 2)
{
    for (var n = 0; n < bullets; n++)
    {
        with (bullet[n])
            draw_self();
    }
}
