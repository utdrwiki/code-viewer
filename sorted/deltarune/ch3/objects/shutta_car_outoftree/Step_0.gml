image_index += 1;
var peekoutspeed = 4;
var waittime = 4;
if ((side == 1 && x > destinationx) || (side == -1 && x < destinationx))
    instance_destroy();
if (side == 1)
{
    if (con == 0)
    {
        if (image_xscale < 1.4)
            image_xscale += 0.2;
    }
    if (con == 1)
    {
        if (image_xscale > 0)
            image_xscale -= 0.2;
    }
}
if (side == -1)
{
    if (con == 0)
    {
        if (image_xscale > -1.4)
            image_xscale -= 0.2;
    }
    if (con == 1)
    {
        if (image_xscale < 0)
            image_xscale += 0.2;
    }
}
