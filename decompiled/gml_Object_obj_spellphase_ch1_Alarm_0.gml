for (xyz = 0; xyz < 3; xyz += 1)
{
    using[xyz] = 0
    gotspell[xyz] = 0
    gotitem[xyz] = 0
    if (global.charaction[xyz] == 2)
    {
        spelltotal += 1
        using[xyz] = 1
        gotspell[xyz] = 1
        if (castyet == 0)
        {
            with (global.charinstance[xyz])
            {
                state = 2
                attacktimer = 0
            }
            castyet = 1
            char = (xyz + 1)
            scr_spelltext_ch1(global.charspecial[xyz], xyz)
            spellwriter = scr_battletext_default_ch1()
        }
    }
    if (global.charaction[xyz] == 4)
    {
        spelltotal += 1
        using[xyz] = 1
        gotitem[xyz] = 1
        if (castyet == 0)
        {
            with (global.charinstance[xyz])
            {
                state = 4
                attacktimer = 0
            }
            castyet = 1
            char = (xyz + 1)
            scr_spelltext_ch1(global.charspecial[xyz], xyz)
            spellwriter = scr_battletext_default_ch1()
        }
    }
}
active = true
global.spelldelay = 90
