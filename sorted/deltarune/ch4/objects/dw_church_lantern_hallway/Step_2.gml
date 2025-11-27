if (roomloop)
{
    var offset = rightx - leftx;
    var voffset = heightdiffer;
    if (kris.x > rightx)
    {
        kris.x -= offset;
        kris.y += voffset;
        with (obj_caterpillarchara)
        {
            for (var i = 0; i < array_length(remx); i++)
            {
                remx[i] -= offset;
                remy[i] += voffset;
            }
        }
        if (loopcount > 0)
            loopcount--;
    }
    if (kris.x < leftx)
    {
        loopcount++;
        kris.x += offset;
        kris.y -= voffset;
        with (obj_caterpillarchara)
        {
            for (var i = 0; i < array_length(remx); i++)
            {
                remx[i] += offset;
                remy[i] -= voffset;
            }
        }
    }
}
