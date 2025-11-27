if (variant == 0)
{
    rate = 32;
    ratedecay = 4;
    rateminimum = 16;
    maxswords = 99;
    multiswordmax = 0;
}
if (variant == 1)
{
    rate = 50;
    ratedecay = 10;
    rateminimum = 6;
    maxswords = 5;
    multiswordmax = 0;
    rate = 24;
    ratedecay = 0;
    rateminimum = 24;
    maxswords = 99;
    multiswordmax = 0;
}
if (variant == 2)
{
    rate = 24;
    ratedecay = 0;
    rateminimum = 24;
    maxswords = 99;
    multiswordmax = 2;
    multiswordframes = 4;
    setdirection[1] = 0;
    setdirection[2] = 45;
    setdirection[3] = 90;
    setdirection[4] = 135;
    setdirection[5] = 180;
    setdirection[6] = 225;
    setdirection[7] = 270;
    setdirection[8] = 315;
    setdirection[9] = 0;
    setdirection[10] = 45;
}
if (variant == 3)
{
    rate = 20;
    ratedecay = 4;
    rateminimum = 13;
    maxswords = 99;
    multiswordmax = 0;
}
with (obj_dbulletcontroller)
{
    if (type == 104)
    {
        with (obj_tracking_swords_manager)
        {
            rate = 55;
            ratedecay = 0;
            rateminimum = 24;
            maxswords = 99;
            multiswordmax = 0;
            multiswordframes = 0;
        }
    }
    if (type == 154)
    {
        with (obj_tracking_swords_manager)
        {
            rate = 24;
            ratedecay = 4;
            rateminimum = 16;
            maxswords = 99;
            multiswordmax = 0;
        }
    }
}
timer = rate - 5;
