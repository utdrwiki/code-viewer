if (speed != 0)
    image_angle += 5;
if (y > (ystart + 120))
{
    if (con == 0)
    {
        con = 1;
        speed = 0;
        y = ystart + 120;
    }
}
