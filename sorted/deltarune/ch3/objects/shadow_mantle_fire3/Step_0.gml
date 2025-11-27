timer++;
if (timer == 100)
    instance_destroy();
if (_type == 0)
{
    if (timer <= activetimer)
    {
        if (image_alpha == 1)
            image_alpha = 0;
        else
            image_alpha = 1;
    }
    if (timer == activetimer)
        active = true;
}
for (i = 5; i > 0; i -= 1)
{
    remx[i] = remx[i - 1];
    remy[i] = remy[i - 1];
}
remx[0] = x;
remy[0] = y;
