if (instance_exists(myd))
{
    depth = myd.depth + 1000;
    draw_set_color(c_black);
    draw_set_alpha(0.15);
    prevalpha[0] = 1;
    prevwx[0] = myd.writingx;
    prevwy[0] = myd.writingy;
    prevstringmax[0] = myd.stringmax;
    prevhspace[0] = myd.hspace;
    prevlinecount[0] = myd.linecount;
    prevvspace[0] = myd.vspace;
    for (i = 6; i > 0; i -= 1)
    {
        prevalpha[i] = prevalpha[i - 1];
        prevwx[i] = prevwx[i - 1];
        prevwy[i] = prevwy[i - 1];
        prevstringmax[i] = prevstringmax[i - 1];
        prevhspace[i] = prevhspace[i - 1];
        prevlinecount[i] = prevlinecount[i - 1];
        prevvspace[i] = prevvspace[i - 1];
        if (prevalpha[i] > 0)
            ossafe_fill_rectangle((camerax() + 30) - (10 - i), (cameray() + 20) - (10 - i), camerax() + 282 + (10 + i), cameray() + 70 + (10 + i), false);
    }
    draw_set_alpha(1);
}
