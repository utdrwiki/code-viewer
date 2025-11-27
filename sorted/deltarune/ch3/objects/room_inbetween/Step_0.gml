if (zapper_move_start && !d_ex() && global.interact == 0)
{
    zapper_move = true;
    zapper_move_start = false;
}
if (zapper_move)
{
    zapper_move_timer++;
    if (zapper_move_timer == 1)
    {
        global.interact = 1;
        snd_play(snd_item);
        with (obj_mainchara)
            usprite = spr_krisu_dark;
    }
    if (zapper_move_timer == 15)
    {
        snd_play(snd_wing);
        scr_lerpvar_instance(zapper_npc, "x", zapper_npc.x, zapper_npc.x + 120, 15, 3, "out");
    }
    if (zapper_move_timer == 31)
    {
        global.interact = 0;
        zapper_move = false;
        zapper_move_timer = 0;
        with (zapper_npc)
            extflag = "zapper_moved";
        if (global.plot >= 120 && global.plot < 160)
        {
            if (scr_flag_get(1074) == 0)
                scr_flag_set(1074, 1);
        }
        if (global.plot >= 160)
        {
            if (scr_flag_get(1075) == 0)
                scr_flag_set(1075, 1);
        }
        if (scr_flag_get(1076) == 1)
            scr_flag_set(1076, 2);
        if (scr_flag_get(1077) == 1)
            scr_flag_set(1077, 2);
    }
}
