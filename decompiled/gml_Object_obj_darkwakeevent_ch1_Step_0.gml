if (con == 1)
{
    waketimer += 1
    canclick = false
    if (waketimer < 50)
        canclick = true
    if (waketimer < 110 && waketimer > 65)
        canclick = true
    if (waketimer > 125 && waketimer < 170)
        canclick = true
    if (canclick == true)
    {
        if left_p_ch1()
            waketimer += 2
        if right_p_ch1()
            waketimer += 2
        if down_p_ch1()
            waketimer += 2
        if up_p_ch1()
            waketimer += 2
    }
    if (waketimer == 60 || waketimer == 62)
    {
        with (k)
        {
            sprite_index = spr_kris_fallen_dark_ch1
            x = (xstart + choose(-2, 2))
            y = (ystart + choose(-2, 2))
        }
    }
    if (waketimer == 63)
    {
        with (k)
        {
            x = xstart
            y = ystart
        }
    }
    if (waketimer == 120 || waketimer == 121 || waketimer == 122 || waketimer == 123)
    {
        with (k)
        {
            x = (xstart + choose(-2, 2, 0))
            y = (ystart + choose(-2, 2, 0))
        }
    }
    if (waketimer >= 180 && waketimer <= 184)
    {
        with (k)
        {
            x = (xstart + choose(-2, 2, 0))
            y = (ystart + choose(-2, 2, 0))
        }
    }
    if (waketimer == 185)
    {
        with (k)
            instance_destroy()
        with (obj_mainchara_ch1)
            visible = true
        global.interact = 0
        con = 2
        if (global.plot < 11)
            global.plot = 11
        scr_tempsave_ch1()
        instance_destroy()
    }
}
