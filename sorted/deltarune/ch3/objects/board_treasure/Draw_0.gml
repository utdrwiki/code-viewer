draw_self();
draw_set_color(c_black);
ossafe_fill_rectangle(128, 64, 512, 64 + boxy, false);
side = 0;
if (i_ex(obj_mainchara) && obj_mainchara.y < 192)
    side = 1;
if (side == 0)
{
    if (drawblack == 1)
    {
        if (boxy <= 120)
            boxy += 12;
        if (boxy >= 128)
            boxy = 128;
    }
    else if (myinteract > 0)
    {
        if (boxy >= 0)
            boxy -= 12;
        if (boxy <= 0)
            boxy = 0;
    }
}
