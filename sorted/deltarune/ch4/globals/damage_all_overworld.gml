function scr_damage_all_overworld()
{
    if (global.inv < 0)
    {
        gameover = 1;
        if (global.char[0] != 0 && global.hp[global.char[0]] > 1)
            gameover = 0;
        if (global.char[1] != 0 && global.hp[global.char[1]] > 1)
            gameover = 0;
        if (global.char[2] != 0 && global.hp[global.char[2]] > 1)
            gameover = 0;
        if (gameover == 1)
        {
            with (obj_event_manager)
                trigger_event(UnknownEnum.Value_1);
            scr_gameover();
        }
        scr_damage_cache();
        remdamage = damage;
        remtarget = target;
        if (!instance_exists(obj_shake))
            instance_create(0, 0, obj_shake);
        with (obj_dmgwriter)
            killactive = 1;
        snd_stop(snd_hurt1);
        snd_play(snd_hurt1);
        for (ti = 0; ti < 3; ti += 1)
        {
            global.inv = -1;
            damage = remdamage;
            target = ti;
            tdamage = damage;
            with (global.charinstance[target])
            {
                hurt = 1;
                hurttimer = 0;
            }
            hpdiff = tdamage;
            if (hpdiff >= global.hp[global.char[target]])
                hpdiff = global.hp[global.char[target]] - 1;
            d_cancel = 0;
            if (hpdiff <= 1)
            {
                if (global.hp[global.char[target]] <= 0)
                {
                    hpdiff = 0;
                    d_cancel = 1;
                }
                else
                {
                    hpdiff = 1;
                }
            }
            if (d_cancel == 0)
            {
                doomtype = -1;
                global.hp[global.char[target]] -= hpdiff;
                if ((instance_exists(global.charinstance[target]) && global.charinstance[target].visible == true) || i_ex(obj_climb_kris))
                {
                    dmgwriter = instance_create(x, y, obj_dmgwriter);
                    dmgwriter.damage = hpdiff;
                    dmgwriter.type = doomtype;
                    if (i_ex(obj_climb_kris))
                    {
                        dmgwriter.x = obj_climb_kris.x;
                        dmgwriter.y = obj_climb_kris.y;
                        dmgwriter.ystart = obj_climb_kris.y;
                        dmgwriter.depth = obj_climb_kris.depth - 100;
                        if (obj_climb_kris.onrotatingtower == true)
                            dmgwriter.x = camerax() + (camerawidth() / 2);
                    }
                    else
                    {
                        dmgwriter.x = global.charinstance[target].x;
                        dmgwriter.y = (global.charinstance[target].y + global.charinstance[target].myheight) - 24;
                    }
                }
                if (global.hp[global.char[target]] < 1)
                    global.hp[global.char[target]] = 1;
            }
        }
        scr_damage_check();
        target = remtarget;
        global.inv = global.invc * 40;
    }
}

enum UnknownEnum
{
    Value_1 = 1
}
