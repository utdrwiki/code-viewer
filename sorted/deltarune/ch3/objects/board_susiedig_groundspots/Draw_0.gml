if (con == 0)
{
    if (active)
    {
        siner++;
        image_index = abs(sin(siner / 15) * 3);
    }
}
if (con < 2)
    draw_self();
if (con == 20)
    draw_self();
