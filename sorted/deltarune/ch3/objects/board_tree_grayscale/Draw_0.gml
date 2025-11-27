if (con == 0.1)
{
    timer = irandom(10);
    colorindex = irandom(6);
    con = 1;
}
if (con == 1)
{
    var nextcolor = colorindex + 1;
    if (nextcolor > 6)
        nextcolor = 0;
    timer++;
    if ((timer % 3) == 0)
        image_blend = merge_color(color[colorindex], color[nextcolor], timer / 10);
    if (timer >= 10)
    {
        timer = 0;
        colorindex++;
        if (colorindex > 6)
            colorindex = 0;
    }
}
draw_self_board();
