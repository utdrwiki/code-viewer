if (state == 3)
{
    hurttimer -= 1;
    if (hurttimer < 0)
    {
        state = 0;
    }
    else
    {
        hurtshake += 1;
        if (hurtshake > 1)
        {
            if (shakex > 0)
                shakex -= 1;
            if (shakex < 0)
                shakex += 1;
            shakex = -shakex;
            hurtshake = 0;
        }
    }
}
