var knightsprite = 2128;
var drawline = 0;
if (con >= 1)
{
    for (var i = 0; i < yposcount; i++)
    {
        if (drawline)
            draw_line(x, ypos[i], box.x - (box.sprite_width / 2), ypos[i]);
    }
}
