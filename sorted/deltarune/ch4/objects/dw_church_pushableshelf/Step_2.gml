var xshift = x - beginx;
var yshift = y - beginy;
if (init == 1)
{
    for (var i = 0; i < array_length(myblock); i++)
    {
        if (i_ex(myblock[i]))
        {
            if (scr_debug())
                myblock[i].image_alpha = 0.5;
            myblock[i].x += xshift;
            myblock[i].y += yshift;
        }
    }
    for (var i = 0; i < array_length(marker); i++)
    {
        if (i_ex(marker[i]))
        {
            marker[i].x += xshift;
            marker[i].y += yshift;
            with (marker[i])
                scr_depth();
        }
    }
    for (var i = 0; i < array_length(upstairs); i++)
    {
        if (i_ex(upstairs[i]))
        {
            upstairs[i].x += xshift;
            upstairs[i].y += yshift;
            upstairs[i].visible = true;
        }
    }
}
