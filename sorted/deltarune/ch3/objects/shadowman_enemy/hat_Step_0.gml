if (con == 0)
{
    x = parentid.x;
    repeat (4)
    {
        if ((y - 4) < parentid.y)
        {
            y++;
        }
        else if (con == 0)
        {
            con = 1;
            scr_shakeobj();
            snd_play(snd_equip);
            image_index = 1;
            with (parentid)
            {
                idlesprite = spr_shadowman_idle_b_nothat;
                sparedsprite = spr_shadowman_idle_b_nothat;
            }
        }
    }
}
if (con == 1)
{
    if ((y - 4) < parentid.y)
        y++;
    timer++;
    if (timer == 11)
    {
        instance_destroy();
        with (parentid)
        {
            idlesprite = spr_shadowman_idle_b;
            sparedsprite = spr_shadowman_spare;
        }
    }
}
