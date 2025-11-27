if (active && enabled)
{
    if (wasactive == false)
    {
        if (!kindaactive)
        {
            for (var i = 0; i < array_length(actualcat); i++)
            {
                if (i_ex(actualcat[i]))
                {
                    catmarker[i].visible = true;
                    actualcat[i].visible = false;
                    catmarker[i].x = actualcat[i].x;
                    catmarker[i].y = actualcat[i].y;
                }
            }
        }
        if (kindaactive == true)
            kindaactive = false;
        susie.visible = true;
        ralsei.visible = true;
        with (obj_caterpillarchara)
        {
            visible = false;
            if (name == "susie")
            {
                other.susie.x = x;
                other.susie.y = y;
            }
            if (name == "ralsei")
            {
                other.ralsei.x = x;
                other.ralsei.y = y;
            }
        }
        wasactive = true;
    }
    if (global.interact == 0)
    {
        if (right_h())
            dir = 0;
        if (left_h())
            dir = 1;
    }
    su_xoff = 12;
    su_yoff = -22;
    ra_xoff = -24;
    ra_yoff = -4;
    kris.fun = true;
    kris.canrun = false;
    kris.sprite_index = spr_krisd_dark_stealth;
    ralsei.sprite_index = spr_ralsei_d_stealth;
    susie.sprite_index = spr_susied_dark_stealth;
    for (var i = 0; i < 20; i++)
    {
        if (i_ex(catmarker[i]))
            catmarker[i].image_xscale = 2;
    }
    if (dir == 1)
    {
        su_xoff = -4;
        ra_xoff = 16;
        kris.sprite_index = spr_krisd_dark_stealth_left;
        ralsei.sprite_index = spr_ralsei_d_stealth_left;
        susie.sprite_index = spr_susied_dark_stealth_left;
        for (var i = 0; i < 20; i++)
        {
            if (i_ex(catmarker[i]))
                catmarker[i].image_xscale = -2;
        }
    }
    kris.runtimer = 0;
    stealthspeed = 16;
    if (room == room_dw_b3bs_zapper_a && global.flag[1184] == 0)
        stealthspeed = 2;
    if (room == room_dw_teevie_stealth_d && global.flag[1230] == 2)
        stealthspeed = 24;
    stealthtimer++;
    if (stealthtimer > 6)
        stealthtimer = 6;
    kris.bwspeed = max(2, (stealthspeed * stealthtimer) / 6);
    kris.wspeed = max(2, (stealthspeed * stealthtimer) / 6);
    lerpstrength = lerp(lerpstrength, 0.5, 0.2);
    if (global.interact == 0 || alert)
    {
        if (i_ex(susie) && i_ex(kris))
        {
            susie.x = lerp(susie.x, kris.x + su_xoff, lerpstrength);
            susie.y = lerp(susie.y, kris.y + su_yoff, lerpstrength * 1.5);
            with (susie)
                scr_depth();
        }
        if (i_ex(ralsei) && i_ex(susie))
        {
            ralsei.x = lerp(ralsei.x, susie.x + ra_xoff, lerpstrength);
            ralsei.y = lerp(ralsei.y, susie.y + ra_yoff, lerpstrength * 1.5);
            with (ralsei)
                scr_depth();
            ralsei.depth += 40;
        }
        for (var i = 0; i < array_length(actualcat); i++)
        {
            if (i_ex(actualcat[i]))
            {
                myxoff = 0;
                myyoff = 0;
                switch (i)
                {
                    case 1:
                        myxoff = -10;
                        myyoff = -2;
                        if (dir == 1)
                            myxoff = 50;
                        break;
                    case 2:
                        myxoff = -20;
                        myyoff = -30;
                        if (dir == 1)
                            myxoff = 60;
                        break;
                    case 3:
                        myxoff = 54;
                        myyoff = -42;
                        if (dir == 1)
                            myxoff = -14;
                        break;
                    case 4:
                        myxoff = 82;
                        myyoff = -2;
                        if (dir == 1)
                            myxoff = 50;
                        break;
                    case 5:
                        myxoff = -40;
                        myyoff = -64;
                        if (dir == 1)
                            myxoff = 80;
                        break;
                }
                catmarker[i].x = lerp(catmarker[i].x, ralsei.x + myxoff, lerpstrength);
                catmarker[i].y = (ralsei.y + myyoff) - abs(sin(catsiner[i] / 40) * 8);
                catmarker[i].depth = ralsei.depth + (i * 4);
            }
        }
        if (point_distance(krx, kry, kris.x, kris.y) > 1)
            kris.image_index += 0.125;
        if (point_distance(sux, suy, susie.x, susie.y) > 1)
            susie.image_index += 0.125;
        if (point_distance(rax, ray, ralsei.x, ralsei.y) > 1)
            ralsei.image_index += 0.125;
        if (point_distance(krx, kry, kris.x, kris.y) > 2)
            kris.image_index += 0.0625;
        if (point_distance(sux, suy, susie.x, susie.y) > 2)
            susie.image_index += 0.0625;
        if (point_distance(rax, ray, ralsei.x, ralsei.y) > 2)
            ralsei.image_index += 0.0625;
        for (var i = 0; i < 20; i++)
        {
            if (i_ex(catmarker[i]))
            {
                if (point_distance(catmarker[i].x, catmarker[i].y, genx[i], geny[i]) > 2)
                {
                    catmarker[i].image_index += 0.125;
                    if (i == 5)
                        catmarker[i].image_index += 0.125;
                    buff[i] = 6;
                }
                else
                {
                    buff[i]--;
                    if (buff[i] <= 0)
                        catmarker[i].image_index = 0;
                }
            }
        }
        krx = kris.x;
        kry = kris.y;
        rax = ralsei.x;
        ray = ralsei.y;
        sux = susie.x;
        suy = susie.y;
        for (var i = 0; i < 20; i++)
        {
            if (i_ex(catmarker[i]))
            {
                catsiner[i] += abs(genx[i] - catmarker[i].x);
                genx[i] = catmarker[i].x;
                geny[i] = catmarker[i].y;
            }
        }
        kris.mask_index = spr_krisd_dark;
        with (obj_caterpillarchara)
        {
            follow = false;
            if (name == "susie")
            {
                x = other.susie.x;
                y = other.susie.y;
            }
            if (name == "ralsei")
            {
                x = other.ralsei.x;
                y = other.ralsei.y;
            }
        }
    }
    with (kris)
    {
        if (!place_meeting(x, y, obj_b3bs_stealtharea))
            other.active = false;
    }
}
else
{
    if (wasactive == true)
    {
        wasactive = false;
        ralsei.visible = false;
        susie.visible = false;
        kris.fun = 0;
        kris.canrun = true;
        stealthtimer = 0;
        with (kris)
        {
            bwspeed = 4;
            wspeed = 4;
        }
        ralsei.x = scr_even(ralsei.x);
        ralsei.y = scr_even(ralsei.y);
        susie.x = scr_even(susie.x);
        susie.y = scr_even(susie.y);
        with (obj_caterpillarchara)
        {
            if (name == "susie")
            {
                x = other.susie.x;
                y = other.susie.y;
            }
            if (name == "ralsei")
            {
                x = other.ralsei.x;
                y = other.ralsei.y;
            }
            follow = true;
            scr_caterpillar_interpolate();
            visible = true;
        }
        for (var i = 0; i < array_length(actualcat); i++)
        {
            if (i_ex(actualcat[i]))
            {
                catmarker[i].visible = false;
                actualcat[i].visible = true;
                switch (i)
                {
                    case 1:
                        myxoff = -10;
                        myyoff = -2;
                        if (dir == 1)
                            myxoff = 50;
                        break;
                    case 2:
                        myxoff = -20;
                        myyoff = -30;
                        if (dir == 1)
                            myxoff = 60;
                        break;
                    case 3:
                        myxoff = 54;
                        myyoff = -42;
                        if (dir == 1)
                            myxoff = -14;
                        break;
                    case 4:
                        myxoff = 82;
                        myyoff = -2;
                        if (dir == 1)
                            myxoff = 50;
                        break;
                    case 5:
                        myxoff = -40;
                        myyoff = -64;
                        if (dir == 1)
                            myxoff = 80;
                        break;
                }
                actualcat[i].x = ralsei.x + myxoff;
                actualcat[i].y = ralsei.y + myyoff;
                actualcat[i].interpolate = true;
            }
        }
    }
    lerpstrength = lerp(lerpstrength, 0.1, 0.1);
    with (kris)
    {
        if (place_meeting(x, y, obj_b3bs_stealtharea))
            other.active = true;
    }
}
if (alert == 1)
{
    alerttimer++;
    if (alerttimer == 1)
    {
        enabled = true;
        with (susie)
            setxy(scr_even(x), scr_even(y));
        with (ralsei)
            setxy(scr_even(x), scr_even(y));
        with (obj_mainchara)
            setxy(scr_even(x), scr_even(y));
        with (obj_caterpillarchara)
            setxy(scr_even(x), scr_even(y));
        var centeredx = alerter.x + ((sprite_get_width(alerter.sprite_index) * alerter.image_xscale) / 2);
        var centeredy = alerter.bbox_bottom + 20;
        var lightxoff = -42;
        var lightyoff = 0;
        with (alertlight)
        {
            scr_lerpvar("x", x, obj_mainchara.x + lightxoff, 16, -1, "out");
            scr_lerpvar("y", y, obj_mainchara.y + 60 + lightyoff, 16, -1, "out");
        }
    }
    if (alerttimer == 16)
    {
        alerttimer = 0;
        alert = 2;
    }
}
ralsei.image_alpha = 1;
susie.image_alpha = 1;
kris.image_alpha = 1;
