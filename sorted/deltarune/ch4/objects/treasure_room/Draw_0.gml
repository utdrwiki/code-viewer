draw_self();
if (scr_debug())
{
    var count = 0;
    if (noflag && !tempchest)
        draw_text_debug(x, y + (count * 10), "needs flag");
    count++;
    if (needsitem)
        draw_text_debug(x, y + (count * 10), "needs item");
    count++;
}
