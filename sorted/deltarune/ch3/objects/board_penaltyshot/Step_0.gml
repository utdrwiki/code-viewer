if (hitbuff > 0)
    hitbuff--;
if (hit == 1)
{
    hit = 0;
    if (hitbuff <= 0)
    {
        hitbuff = 10;
        hit = 0;
        scr_shakeobj();
    }
}
if (hitbuff > 0 && (hitbuff % 2) == 0)
    image_index = 1 - image_index;
else
    image_index = 0;
