var speedrate = 1;
if (global.chapter == 3)
    speedrate = 2;
sleeptimer++;
if (movecon == 0 || movecon == 1)
{
    if (con == 0)
    {
        if (movecon == 0)
        {
            hspeed = -4 * speedrate;
            sprite_index = lsprite;
        }
        if (movecon == 1)
        {
            hspeed = 4 * speedrate;
            sprite_index = rsprite;
        }
        if ((camerax() + 320) > x && hspeed < 0)
            hspeed *= -1;
        if ((camerax() + 320) < x && hspeed > 0)
            hspeed *= -1;
        con = 1;
        contimer = 0;
        contimermax = 30 / speedrate;
        flipchance = choose(0, 1, 2);
        if (flipchance == 2)
        {
            sprite_index = choose(dsprite, spr_lancer_ut_flip);
            image_speed = 0.25;
        }
    }
    if (con == 1)
    {
        stop = 0;
        contimer++;
        if (x < minx)
            stop = 1;
        if (x > maxx)
            stop = 1;
        if (contimer > contimermax)
            stop = 1;
        if (stop == 1)
        {
            hspeed = 0;
            sprite_index = choose(dsprite, dsprite, spr_lancer_ut_flip);
            image_speed = 0.25;
            alarm[0] = 30 / speedrate;
            con = 2;
        }
    }
}
if (movecon == 2 || movecon == 3)
{
    if (con == 0)
    {
        if (movecon == 3)
        {
            vspeed = -8;
            gravity = 1;
            y -= 4;
            hspeed = choose(0, 3, 6);
        }
        if ((camerax() + 320) > x && hspeed < 0)
            hspeed *= -1;
        if ((camerax() + 320) < x && hspeed > 0)
            hspeed *= -1;
        spincount = 0;
        spintimer = 0;
        spinmax = 8;
        con = 1;
        sprite_index = dsprite;
    }
    if (con == 1)
    {
        if (y >= maxy)
        {
            gravity = 0;
            vspeed = 0;
        }
        if (x <= minx)
        {
            x += 4;
            hspeed = -hspeed;
        }
        if (x >= maxx)
        {
            x -= 4;
            hspeed = -hspeed;
        }
        spintimer++;
        if (spintimer >= 3)
        {
            if (sprite_index == dsprite)
                sprite_index = lsprite;
            else if (sprite_index == lsprite)
                sprite_index = usprite;
            else if (sprite_index == usprite)
                sprite_index = rsprite;
            else if (sprite_index == rsprite)
                sprite_index = dsprite;
            spincount++;
            spintimer = 0;
        }
        if (spincount >= 8)
        {
            hspeed = 0;
            vspeed = 0;
            gravity = 0;
            con = 2;
            alarm[0] = 30;
        }
    }
}
if (movecon == 4)
{
    if (con == 0)
    {
        sprite_index = spr_ch3_dw_shutta_lancer_wave_notongue;
        if (fake)
            sprite_index = spr_ch3_dw_shutta_lancer_wave_notongue_fake;
        image_index = 0;
        image_speed = 0.5;
        wavetimer = 0;
        con = 1;
        if (global.chapter == 3)
            image_speed = 0;
    }
    if (con == 1)
    {
        if (global.chapter == 3)
        {
            if (wavetimer < 6)
                image_index = 1;
            if (wavetimer == 6)
            {
                image_index = 2;
                image_speed = 0.5;
            }
        }
        wavetimer++;
        if (wavetimer >= 16)
            image_speed = 0;
        if (wavetimer >= 30)
        {
            alarm[0] = 2;
            con = 2;
        }
    }
}
if (movecon == 7)
{
    if (con == 0)
    {
        jumptimer = 0;
        sprite_index = spr_ch3_dw_shutta_lancer_wave_notongue;
        if (fake)
            sprite_index = spr_ch3_dw_shutta_lancer_wave_notongue_fake;
        image_speed = 0;
        image_index = 1;
        con = 1;
    }
    if (con == 1)
    {
        if (x >= maxx)
        {
            hspeed = 0;
            x -= 2;
        }
        if (x <= minx)
        {
            hspeed = 0;
            x += 2;
        }
        jumptimer++;
        if (jumptimer >= 10)
        {
            con = 2;
            jumptimer = 0;
            vspeed = -6 - random(8);
            hspeed = random_range(-4, 4);
            gravity = 0.5 + random(0.25);
            sprite_index = dsprite;
            spintimer = 0;
            spincount = 0;
        }
    }
    if (con == 2)
    {
        if (x >= maxx)
        {
            hspeed = 0;
            x -= 2;
        }
        if (x <= minx)
        {
            hspeed = 0;
            x += 2;
        }
        spintimer++;
        if (spintimer >= 3)
        {
            if (sprite_index == dsprite)
                sprite_index = lsprite;
            else if (sprite_index == lsprite)
                sprite_index = usprite;
            else if (sprite_index == usprite)
                sprite_index = rsprite;
            else if (sprite_index == rsprite)
                sprite_index = dsprite;
            spincount++;
            spintimer = 0;
        }
        if (vspeed >= 0)
        {
            hspeed = 0;
            vspeed = 0;
            gravity = 0;
            sprite_index = spr_ch3_dw_shutta_lancer_tongue;
            if (fake)
                sprite_index = spr_ch3_dw_shutta_lancer_tongue_fake;
            con = 3;
        }
    }
    if (con == 3)
    {
        jumptimer++;
        if (jumptimer >= 12)
        {
            jumptimer = 0;
            gravity = 1;
            sprite_index = dsprite;
            con = 4;
        }
    }
    if (con == 4)
    {
        if (y >= maxy)
        {
            hspeed = 0;
            vspeed = 0;
            gravity = 0;
            con = 5;
            alarm[0] = 3;
        }
    }
}
if (movecon == 10)
{
    sprite_index = spr_lancer_sleep;
    image_speed = 0.1;
    speed = 0;
    hspeed = 0;
    gravity = 0;
}
if (movecon == 11)
{
    sprite_index = spr_cutscene_20_lancer_stone;
    image_speed = 0;
    speed = 0;
    hspeed = 0;
    gravity = 0;
}
if (global.fighting != 1)
{
    if (global.submenu != 4 || global.interact != 5)
        instance_destroy();
}
delaydeath--;
if (delaydeath == 0)
    instance_destroy();
if (gravity > 0 && vspeed > 0 && (y + vspeed) > maxy)
{
    gravity = 0;
    vspeed = 0;
    y = maxy;
}
