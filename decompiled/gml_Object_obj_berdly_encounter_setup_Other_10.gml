if (state == 0)
    return;
if (fightcon == 1)
{
    if (global.flag[9] == 1)
        snd_pause(global.currentsong[1])
    counttimer += 1
    if (counttimer < 10)
    {
        for (i = 0; i < (count + 1); i += 1)
        {
        }
    }
    if (counttimer >= 10)
    {
        for (i = 0; i < (count + 1); i += 1)
        {
        }
        fightcon = 2
        counttimer = 0
    }
}
if (fightcon == 2)
{
    counttimer += 1
    if (counttimer >= 15)
    {
        counttimer = 0
        fightcon = 3
        for (i = 0; i < (count + 1); i += 1)
        {
        }
        instance_create(0, 0, obj_battlecontroller)
        instance_destroy()
    }
}
