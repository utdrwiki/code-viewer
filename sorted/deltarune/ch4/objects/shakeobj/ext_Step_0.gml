if (active == 0)
    instance_destroy();
if (active == 1)
{
    if (i_ex(target))
    {
        timer++;
        if (timer >= shakespeed)
        {
            shakexamt -= shakereduct;
            shakeyamt -= shakereduct;
            on *= -1;
            if (shakexamt < 0)
                shakexamt = 0;
            if (shakeyamt < 0)
                shakeyamt = 0;
            target.x = nowx + (shakexamt * on);
            target.y = nowy + (shakeyamt * on);
            if (shakexamt <= 0 && shakeyamt <= 0)
                instance_destroy();
            timer = 0;
        }
    }
    else
    {
        instance_destroy();
    }
}
