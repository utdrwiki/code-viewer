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
    for (var i = 0; i < array_length(upstairs); i++)
    {
        if (i_ex(upstairs[i]))
        {
            upstairs[i].x += xshift;
            upstairs[i].y += yshift;
        }
    }
    if (ladder != 0)
    {
        ladder.x += xshift;
        ladder.y += yshift;
        ladder.image_alpha = 0.5;
    }
    if (climbpoint != 0)
    {
        climbpoint.x += xshift;
        climbpoint.y += yshift;
    }
    if (resetblocks == true)
    {
        resetblocks = false;
        setxy(xstart, ystart);
        if (ladder != 0)
        {
            with (ladder)
                setxy(xstart, ystart);
        }
        if (climbpoint != 0)
        {
            with (climbpoint)
                setxy(xstart, ystart);
        }
        for (var i = 0; i < array_length(myblock); i++)
        {
            if (i_ex(myblock[i]))
            {
                with (myblock[i])
                    setxy(xstart, ystart);
            }
        }
        for (var i = 0; i < array_length(upstairs); i++)
        {
            if (i_ex(upstairs[i]))
            {
                with (upstairs[i])
                    setxy(xstart, ystart);
            }
        }
    }
}
