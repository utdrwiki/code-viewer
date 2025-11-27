if (trigger == 1)
{
    trigcount++;
    global.flag[1105] = trigcount;
    global.interact = 1;
    trigger = 2;
}
if (trigcount == 1)
{
    if (trigger == 2)
    {
        snd_play(snd_locker);
        var trash = instance_create(triggerer.x, triggerer.y, obj_dw_ch3_b3bs_trashcan);
        trash.itemflag = 1104;
        trash.flag = false;
        global.flag[1104] = 1;
        with (trash)
            event_user(0);
        with (triggerer)
            instance_destroy();
        triggerer = -1;
        trigger = 3;
    }
    if (trigger == 3 && !d_ex())
        trigger = 0;
}
if (trigcount == 2)
{
    if (trigger == 2)
    {
        snd_play(snd_locker);
        var trash = instance_create(triggerer.x, triggerer.y, obj_dw_ch3_b3bs_trashcan);
        trash.itemflag = 1104;
        trash.flag = false;
        trash.itemtype = "special";
        global.flag[1104] = 1;
        with (trash)
            event_user(0);
        with (triggerer)
            instance_destroy();
        triggerer = -1;
        trigger = 3;
    }
    if (trigger == 3 && !d_ex())
    {
        trigger = 0;
        snd_play(snd_impact);
        scr_shakescreen();
        door = scr_dark_marker(258, 46, spr_dw_ch3_b3bs_door);
        door.depth = 1000050;
        safe_delete(doorblocker);
    }
}
if (trigcount == 3 || trigcount == 4 || trigcount == 6)
{
    if (trigger == 2)
    {
        var trash = instance_create(triggerer.x, triggerer.y, obj_dw_ch3_b3bs_trashcan);
        trash.itemflag = 1104;
        global.flag[1104] = 0;
        trash.itemtype = "money";
        trash.itemidchest = 20;
        trash.flag = false;
        if (trigcount == 4)
            trash.itemidchest = 43;
        if (trigcount == 6)
            trash.itemidchest = 1;
        with (trash)
            event_user(0);
        with (triggerer)
            instance_destroy();
        triggerer = -1;
        trigger = 3;
    }
}
if (trigcount == 5)
{
    if (trigger == 2)
    {
        timer++;
        var falltime = 6;
        if (timer == 1)
        {
            triggerer.sprite_index = spr_dw_ch3_b3bs_trashcan_fall;
            with (triggerer)
                scr_lerpvar("image_index", 0, 4, falltime);
        }
        if (timer == (1 + falltime))
        {
            snd_play(snd_impact);
            ribbick = scr_dark_marker((triggerer.x + 80) - 20, triggerer.y, spr_ribbick_Idle);
            with (ribbick)
            {
                image_alpha = 0;
                scr_lerpvar("image_alpha", 0, 1, 4, 2, "out");
                scr_animate(2, 0, 0.125);
                hspeed = 6;
                friction = 0.5;
            }
        }
        if (timer == (1 + falltime + 10))
        {
            with (ribbick)
            {
                instance_create(x + 36, y, obj_excblcon);
                snd_play(snd_b);
            }
        }
        if (timer == (1 + falltime + 10 + 20))
        {
            encounterflag = 589;
            encounterno = 126;
            global.flag[54] = encounterflag;
            scr_battle(encounterno, 0, ribbick);
        }
        if (timer == (1 + falltime + 10 + 20 + 60))
        {
            safe_delete(triggerer);
            timer = 0;
            trigger = 0;
        }
    }
}
