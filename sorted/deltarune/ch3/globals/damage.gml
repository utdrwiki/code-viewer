function scr_damage()
{
    if (global.inv < 0)
    {
        scr_damage_cache();
        if (global.chapter == 3)
        {
            with (obj_tennabattleconvo_controller)
            {
                damagecount++;
                damagecountthisturn++;
            }
            with (obj_tenna_enemy)
                gothit = true;
            with (obj_knight_enemy)
                progamer = false;
        }
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
        var truedamage = 0;
        if ((global.chapter == 3 && i_ex(obj_tenna_enemy) && obj_tenna_enemy.minigameinsanity) || i_ex(obj_knight_roaring2))
            truedamage = 1;
        chartarget = 3;
        if (global.chapter == 3 && i_ex(obj_knight_enemy) && truedamage == 0)
        {
            if (obj_knight_enemy.aoedamage == false)
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
                if (obj_knight_enemy.myattackchoice != 13)
                {
                    if (global.chararmor1[1] == 23 || global.chararmor2[1] == 23 || global.chararmor1[2] == 23 || global.chararmor2[2] == 23 || global.chararmor1[3] == 23 || global.chararmor2[3] == 23)
                    {
                        obj_knight_enemy.damagecounter++;
                        if (obj_knight_enemy.damagecounter < 3)
                        {
                            if (global.hp[1] > 0 && (global.chararmor1[1] == 23 || global.chararmor2[1] == 23))
                                target = 0;
                            if (global.hp[2] > 0 && (global.chararmor1[2] == 23 || global.chararmor2[2] == 23))
                                target = 1;
                            if (global.hp[3] > 0 && (global.chararmor1[3] == 23 || global.chararmor2[3] == 23))
                                target = 2;
                        }
                        else
                        {
                            target = choose(0, 1, 2);
                            repeat (2)
                            {
                                if (global.hp[1] < 1 && target == 0)
                                    target++;
                                if (global.hp[2] < 1 && target == 1)
                                    target++;
                                if (global.hp[3] < 1 && target == 2)
                                    target++;
                                if (target > 2)
                                    target = 0;
                            }
                            if ((target == 0 && global.chararmor1[1] == 23) || global.chararmor2[1] == 23)
                            {
                            }
                            else if ((target == 1 && global.chararmor1[2] == 23) || global.chararmor2[2] == 23)
                            {
                            }
                            else if ((target == 2 && global.chararmor1[3] == 23) || global.chararmor2[3] == 23)
                            {
                            }
                            else
                            {
                                obj_knight_enemy.damagecounter = 0;
                            }
                        }
                    }
                }
            }
        }
        if (global.chapter == 3 && i_ex(obj_rouxls_ch3_enemy))
        {
            if (global.hp[1] > global.hp[2] && global.hp[1] > global.hp[3])
                target = 0;
            if (global.hp[2] > global.hp[1] && global.hp[2] > global.hp[3])
                target = 1;
            if (global.hp[3] > global.hp[1] && global.hp[3] > global.hp[2])
                target = 2;
            if (i_ex(obj_dbulletcontroller) && i_ex(obj_rouxls_ch3_enemy) && obj_dbulletcontroller.type == 72 && obj_rouxls_ch3_enemy.ralseiyarnhp > 0 && global.hp[3] > 0)
                target = 2;
        }
        if (global.chapter == 3 && i_ex(obj_tenna_enemy) && obj_tenna_enemy.popularboy && global.hp[3] > 0)
            target = 2;
        tdamage = damage;
        var oldcalculation = 0;
        var shadowmantlereduction = false;
        if (target < 3)
        {
            if (global.chapter == 3 && truedamage == 1)
            {
            }
            else if (oldcalculation)
            {
                tdamage = ceil(tdamage - (global.battledf[target] * 3));
            }
            else
            {
                tdamage = scr_damage_calculation(tdamage, target);
            }
            chartarget = global.char[target];
            if (global.chapter == 3 && i_ex(obj_knight_enemy) && truedamage == 0)
            {
                if ((global.chararmor1[1] == 23 || global.chararmor2[1] == 23) && target == 0)
                {
                    tdamage = round(tdamage * 0.33);
                    shadowmantlereduction = true;
                }
                if ((global.chararmor1[2] == 23 || global.chararmor2[2] == 23) && target == 1)
                {
                    tdamage = round(tdamage * 0.33);
                    shadowmantlereduction = true;
                }
                if ((global.chararmor1[3] == 23 || global.chararmor2[3] == 23) && target == 2)
                {
                    tdamage = round(tdamage * 0.33);
                    shadowmantlereduction = true;
                }
            }
            if (global.chapter == 3 && truedamage == 1)
            {
            }
            else
            {
                if (global.charaction[target] == 10)
                    tdamage = ceil((2 * tdamage) / 3);
                if (shadowmantlereduction == false)
                    tdamage = ceil(tdamage * scr_element_damage_reduction(__element, global.char[target]));
            }
            debug_message("The element is: " + string(__element));
            if (tdamage < 1)
                tdamage = 1;
        }
        if (!instance_exists(obj_shake))
            instance_create(0, 0, obj_shake);
        with (global.charinstance[target])
        {
            hurt = 1;
            hurttimer = 0;
            if (sprite_index == spr_ralseib_yarn_2)
                scr_shakeobj();
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
        if (global.chapter == 3 && i_ex(obj_tenna_zoom) && i_ex(obj_elnina_umbrella) && i_ex(obj_tenna_enemy) && obj_tenna_enemy.minigameinsanitydamage == false && obj_tenna_zoom.con <= 1)
        {
            obj_tenna_enemy.minigamefailcount++;
        }
        else if (target < 3)
        {
            if (global.hp[chartarget] <= 0)
            {
                doomtype = 4;
                global.hp[chartarget] -= round(tdamage / 4);
                hpdiff = round(tdamage / 4);
            }
            else
            {
                if (global.chapter == 3 && i_ex(obj_knight_enemy) && obj_knight_enemy.myattackchoice == 2 && (obj_knight_enemy.difficulty == 1 || obj_knight_enemy.difficulty == 3))
                {
                    tdamage = round(tdamage * 0.66);
                    hpdiff = tdamage;
                }
                global.hp[chartarget] -= tdamage;
                if (global.hp[chartarget] <= 0)
                {
                    if (global.chapter == 3 && i_ex(obj_knight_enemy))
                    {
                        if (target == 0)
                        {
                            hpdiff = abs(global.hp[chartarget] - (global.maxhp[chartarget] / 2));
                            doomtype = 4;
                            global.hp[chartarget] = round(-global.maxhp[chartarget] / 2);
                            scr_dead(target);
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
                    if (global.chapter == 3 && i_ex(obj_knight_enemy))
                    {
                        if ((global.chararmor1[1] == 23 || global.chararmor2[1] == 23) && hpi == 0)
                        {
                            tdamage = round(tdamage * 0.33);
                            shadowmantlereduction = true;
                        }
                        if ((global.chararmor1[2] == 23 || global.chararmor2[2] == 23) && hpi == 1)
                        {
                            tdamage = round(tdamage * 0.33);
                            shadowmantlereduction = true;
                        }
                        if ((global.chararmor1[3] == 23 || global.chararmor2[3] == 23) && hpi == 2)
                        {
                            tdamage = round(tdamage * 0.33);
                            shadowmantlereduction = true;
                        }
                    }
                    if (shadowmantlereduction == false)
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
        if (global.chapter == 3 && (room == room_board_1 || room == room_board_2 || room == room_board_3))
            gameover = 0;
        if (global.chapter == 3 && i_ex(obj_knight_enemy))
            gameover = 0;
        if (global.chapter == 3 && i_ex(obj_tenna_board4_enemy))
            gameover = 0;
        if (gameover == 1)
            scr_gameover();
        if (__remtarget != -1)
            target = __remtarget;
    }
}
