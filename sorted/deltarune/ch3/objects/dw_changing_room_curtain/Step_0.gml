if (curtain_start && !d_ex() && global.interact == 0)
{
    curtain_open = true;
    curtain_start = false;
}
if (curtain_open)
{
    curtain_open_timer++;
    if (curtain_open_timer == 1)
    {
        global.interact = 1;
        if (curtain_disabled)
            shadowman_marker.visible = 0;
        snd_play(snd_wing);
        curtain_marker.image_index = 1;
        if (!curtain_disabled)
        {
            with (shadowman_marker)
                scr_animate(0, 2, 0.2);
        }
    }
    if (!curtain_disabled && curtain_open_timer == 30)
    {
        snd_play(snd_scream);
        with (shadowman_marker)
        {
            sprite_index = spr_npc_shadowman_sock_reveal;
            if (global.plot >= 150)
                sprite_index = spr_npc_shadowman_sock_reveal_other;
            scr_shakeobj();
        }
    }
    if (curtain_open_timer >= 45)
    {
        curtain_open_timer = 0;
        curtain_open = false;
        curtain_close = true;
        snd_play(snd_wing);
        curtain_marker.image_index = 0;
        if (!curtain_disabled)
        {
            with (shadowman_marker)
            {
                sprite_index = (global.plot >= 150) ? spr_npc_shadowman_sock_other : spr_npc_shadowman_sock;
                image_index = 0;
            }
        }
    }
}
if (curtain_close)
{
    curtain_close = false;
    global.interact = 0;
}
