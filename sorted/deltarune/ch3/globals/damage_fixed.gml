function scr_damage_fixed(arg0 = -1, arg1 = false)
{
    if (global.inv < 0)
    {
        scr_damage_cache();
        if (arg0 == -1 && v_ex("damage"))
            arg0 = damage;
        var __element = 0;
        if (variable_instance_exists(id, "element"))
        {
            if (is_real(element))
                __element = element;
        }
        if (target < 3)
        {
            if (global.hp[global.char[target]] <= 0)
            {
                scr_randomtarget_old();
                target = mytarget;
                with (global.charinstance[target])
                {
                    image_blend = c_white;
                    darkify = 0;
                }
            }
        }
        var __remtarget = -1;
        if (target == 4)
        {
            __remtarget = 4;
            scr_randomtarget_old();
            target = mytarget;
            if ((global.hp[global.char[target]] / global.maxhp[global.char[target]]) < (scr_party_hpaverage() / 2))
            {
                scr_randomtarget_old();
                target = mytarget;
            }
            if ((global.hp[global.char[target]] / global.maxhp[global.char[target]]) < (scr_party_hpaverage() / 2))
            {
                scr_randomtarget_old();
                target = mytarget;
            }
            if (target == 0 && (global.hp[global.char[target]] / global.maxhp[global.char[target]]) < 0.35)
            {
                scr_randomtarget_old();
                target = mytarget;
            }
            with (global.charinstance[target])
            {
                image_blend = c_white;
                darkify = 0;
            }
        }
        chartarget = 3;
        if (global.chapter == 3 && i_ex(obj_knight_enemy))
        {
            if (target == 0)
            {
                if (global.hp[2] > 0 && global.hp[3] > 0)
                    target = choose(1, 2);
                else if (global.hp[2] > 0)
                    target = 1;
                else if (global.hp[3] > 0)
                    target = 2;
            }
        }
        tdamage = arg0;
        var oldcalculation = 0;
        chartarget = global.char[target];
        if (global.charaction[target] == 10 && !arg1)
            tdamage = ceil((2 * tdamage) / 3);
        if (!instance_exists(obj_shake))
            instance_create(0, 0, obj_shake);
        with (global.charinstance[target])
        {
            hurt = 1;
            hurttimer = 0;
        }
        hpdiff = tdamage;
        with (obj_dmgwriter)
        {
            if (delaytimer >= 1)
                killactive = 1;
        }
        doomtype = -1;
        with (obj_heart)
            dmgnoise = 1;
        if (target < 3)
        {
            if (global.hp[chartarget] <= 0)
            {
                doomtype = 4;
                global.hp[chartarget] -= round(tdamage / 4);
                hpdiff = round(tdamage / 4);
            }
            else
            {
                global.hp[chartarget] -= tdamage;
                if (global.hp[chartarget] <= 0)
                {
                    if (global.chapter == 3 && i_ex(obj_knight_enemy))
                    {
                        if (global.hp[1] < 0)
                        {
                            global.hp[1] = 1;
                            hpdiff = round(global.hp[chartarget] - 1);
                            doomtype = 4;
                            scr_battle_sprite_set("kris", spr_kris_fallen_dark, 0.25, true);
                        }
                        else
                        {
                            doomtype = 12;
                            hpdiff = round(global.hp[chartarget] + 999);
                            global.hp[chartarget] = -999;
                            scr_dead(target);
                        }
                    }
                    else
                    {
                        hpdiff = abs(global.hp[chartarget] - (global.maxhp[chartarget] / 2));
                        doomtype = 4;
                        global.hp[chartarget] = round(-global.maxhp[chartarget] / 2);
                        scr_dead(target);
                    }
                }
            }
            dmgwriter = instance_create(global.charinstance[target].x, (global.charinstance[target].y + global.charinstance[target].myheight) - 24, obj_dmgwriter);
            dmgwriter.damage = hpdiff;
            dmgwriter.type = doomtype;
        }
        if (target == 3)
        {
            for (hpi = 0; hpi < 3; hpi += 1)
            {
                chartarget = global.char[hpi];
                if (global.hp[chartarget] >= 0)
                {
                    if (oldcalculation)
                        tdamage = ceil(tdamage - (global.battledf[hpi] * 3));
                    else
                        tdamage = scr_damage_calculation(tdamage, hpi);
                    tdamage = ceil(tdamage * scr_element_damage_reduction(__element, chartarget));
                    if (global.charaction[hpi] == 10)
                        global.hp[chartarget] -= ceil((3 * tdamage) / 4);
                    else
                        global.hp[chartarget] -= tdamage;
                    if (global.hp[chartarget] <= 0)
                        global.hp[chartarget] = round(-global.maxhp[0] / 2);
                }
            }
        }
        global.inv = global.invc * 30;
        scr_damage_check();
        gameover = 1;
        if (global.char[0] != 0 && global.hp[global.char[0]] > 0)
            gameover = 0;
        if (global.char[1] != 0 && global.hp[global.char[1]] > 0)
            gameover = 0;
        if (global.char[2] != 0 && global.hp[global.char[2]] > 0)
            gameover = 0;
        if (gameover == 1)
            scr_gameover();
        if (__remtarget != -1)
            target = __remtarget;
    }
}
