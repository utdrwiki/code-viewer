function scr_spearpattern_reset()
{
    attackcount = 0;
    attackcountmax = 0;
    for (i = 0; i < 100; i++)
    {
        list_attackdirection[i] = 0;
        list_attackspeed[i] = 0;
        list_attackframes[i] = 0;
        list_attackspecial[i] = 0;
        list_attackspecial2[i] = 0;
        list_attackwait[i] = 5;
    }
}
