if (crt == 0)
    crt = 629;
if (boss == 0)
    boss = 584;
if (i_ex(crt))
{
    if (i_ex(boss))
    {
        if (boss.phase == 1)
        {
            with (crt)
                chromStrength = lerp(chromStrength, 4, 0.01);
            siner = 0;
        }
        if (boss.phase == 2)
        {
            with (crt)
                chromStrength = lerp(chromStrength, 6, 0.01);
            siner = 0;
        }
        if (boss.phase == 3)
        {
            siner++;
            var sinmod = sin(siner / 15) * 2;
            with (crt)
                chromStrength = lerp(chromStrength, 6 + sinmod, 0.5);
        }
        if (boss.phase == 4)
        {
            siner++;
            var sinmod = sin(siner / 10) * 4;
            with (crt)
                chromStrength = lerp(chromStrength, 6 + sinmod, 0.5);
        }
    }
    else
    {
        siner = lerp(siner, 0, 0.05);
        var sinmod = sin(siner / 15) * 4;
        with (crt)
            chromStrength = lerp(chromStrength, 0.5 + (sinmod * 2), 0.5);
    }
}
