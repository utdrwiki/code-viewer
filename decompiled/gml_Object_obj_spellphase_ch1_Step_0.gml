if (active == true)
{
    spelltimer += 1
    if (spelltimer >= global.spelldelay && instance_exists(spellwriter) == 0)
    {
        if (char >= 3 || spelltotal == 1)
        {
            scr_attackphase_ch1()
            with (spellwriter)
                instance_destroy()
            instance_destroy()
        }
        else if (scr_monsterpop_ch1() > 0)
        {
            if (gotitem[char] == 1)
            {
                re_castyet = 1
                with (global.charinstance[char])
                    state = 4
                with (spellwriter)
                    instance_destroy()
                scr_spelltext_ch1(global.charspecial[char], char)
                spellwriter = scr_battletext_default_ch1()
            }
            if (gotspell[char] == 1)
            {
                re_castyet = 1
                with (global.charinstance[char])
                    state = 2
                with (spellwriter)
                    instance_destroy()
                scr_spelltext_ch1(global.charspecial[char], char)
                spellwriter = scr_battletext_default_ch1()
            }
            global.spelldelay = 90
            if (re_castyet == 0)
                global.spelldelay = 1
            char += 1
            repeat (2)
            {
                if (char < 3)
                {
                    if (using[char] == 0)
                        char += 1
                }
            }
            spelltimer = 0
            re_castyet = 0
        }
        else
        {
            scr_attackphase_ch1()
            with (spellwriter)
                instance_destroy()
            instance_destroy()
        }
    }
}
