var targcount = 16;
targcount = 8;
var resetNPCs = false;
if (loopactive == 1)
{
    var offset = abs(rightx - leftx);
    if (kris.x > rightx)
    {
        loopcount++;
        resetNPCs = true;
        if (loopcount == 1)
        {
            with (npc[0])
            {
                setxy(xstart, ystart);
                dontreset = true;
            }
        }
        if (loopcount == 4)
        {
            with (npc[1])
            {
                setxy(xstart, ystart);
                dontreset = true;
            }
        }
        if (loopcount == 5)
        {
            with (npc[2])
            {
                setxy(xstart, ystart);
                dontreset = true;
            }
        }
        if (loopcount == 7)
        {
            with (npc[3])
            {
                setxy(xstart, ystart);
                dontreset = true;
            }
        }
        if (loopcount < targcount)
        {
            debug_message("LOOP" + string(loopcount));
            kris.x -= offset;
            with (obj_caterpillarchara)
            {
                for (var i = 0; i < array_length(remx); i++)
                    remx[i] -= offset;
            }
        }
        else
        {
            loopactive = 2;
        }
    }
    if (loopcount > 0)
    {
        if (kris.x < leftx)
        {
            debug_message("LOOP" + string(loopcount));
            loopcount = 0;
            resetNPCs = true;
        }
    }
}
if (loopactive == 2)
{
    if (kris.x > goback1)
    {
        debug_message("LOOP" + string(loopcount));
        loopactive = 3;
    }
    if (kris.x < rightx)
    {
        loopactive = 1;
        loopcount = 0;
        resetNPCs = true;
        debug_message("LOOP" + string(loopcount));
    }
}
if (loopactive == 3)
{
    if (kris.x < goback1)
    {
        var offset = abs(goback1 - rightx);
        kris.x -= offset;
        with (obj_caterpillarchara)
        {
            for (var i = 0; i < array_length(remx); i++)
                remx[i] -= offset;
        }
        loopactive = 1;
        loopcount = 0;
        resetNPCs = true;
    }
    if (kris.x > goback2)
        loopactive = 4;
}
if (loopactive == 4)
{
    if (kris.x < goback2)
    {
        var offset = abs(goback2 - rightx);
        kris.x -= offset;
        with (obj_caterpillarchara)
        {
            for (var i = 0; i < array_length(remx); i++)
                remx[i] -= offset;
        }
        resetNPCs = true;
        loopactive = 1;
        loopcount = 0;
    }
}
if (resetNPCs)
{
    for (var i = 0; i < array_length(npc); i++)
    {
        with (npc[i])
        {
            if (!dontreset)
                y = -200;
            dontreset = false;
        }
    }
}
