function scr_damage()
{
    if (global.inv < 0)
    {
        scr_damage_cache();
        var __element = 0;
        if (variable_instance_exists(id, "element") && is_real(element))
            __element = element;
        if (global.chapter == 4 && i_ex(obj_hammer_of_justice_enemy))
            obj_hammer_of_justice_enemy.gothitlastturn++;
        if (global.chapter == 4 && i_ex(obj_sound_of_justice_enemy))
            obj_sound_of_justice_enemy.gothitlastturn++;
        if (global.chapter == 4 && i_ex(obj_guei_enemy))
            obj_guei_enemy.gothitthisturn = true;
        if (global.chapter == 4 && global.encounterno == 157 && !i_ex(obj_herosusie) && !i_ex(obj_heroralsei))
            damage = round(damage * 0.7);
        if (global.chapter == 4 && i_ex(obj_jackenstein_enemy) && obj_jackenstein_enemy.scaredycat)
            damage = round(damage * 1.5);
        with (obj_mike_minigame_controller)
            hurt = true;
        if (target < 3)
        {
            var skipthis = false;
            if (global.chapter == 4)
            {
                if (i_ex(obj_climb_kris))
                    skipthis = true;
            }
            if (!skipthis)
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
        }
        var __remtarget = -1;
        if (target == 4)
        {
            __remtarget = 4;
            scr_randomtarget_old();
            target = mytarget;
            var getList = array_length(global.char);
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
        if (global.chapter == 4 && i_ex(obj_titan_enemy) && obj_titan_enemy.forcehitralsei)
        {
            damage *= 0.5;
            if (global.hp[3] > 0)
                target = 2;
        }
        if (global.chapter == 4 && i_ex(obj_sound_of_justice_enemy) && obj_sound_of_justice_enemy.phase == 2)
        {
            if (global.hp[1] > 0 && global.hp[2] < (global.maxhp[2] * 0.4))
                target = 0;
        }
        if (i_ex(obj_titan_enemy) || i_ex(obj_titan_spawn_enemy))
        {
            if ((target == 0 && (global.chararmor1[1] == 23 || global.chararmor2[1] == 23)) || (target == 1 && (global.chararmor1[2] == 23 || global.chararmor2[2] == 23)) || (target == 2 && (global.chararmor1[3] == 23 || global.chararmor2[3] == 23)))
                damage = round(damage * 0.5);
        }
        tdamage = damage;
        var oldcalculation = 0;
        if (target < 3)
        {
            if (oldcalculation)
                tdamage = ceil(tdamage - (global.battledf[target] * 3));
            else
                tdamage = scr_damage_calculation(tdamage, target);
            chartarget = global.char[target];
            if (global.charaction[target] == 10)
                tdamage = ceil((2 * tdamage) / 3);
            tdamage = ceil(tdamage * scr_element_damage_reduction(__element, global.char[target]));
            debug_message("The element is: " + string(__element));
            if (tdamage < 1)
                tdamage = 1;
        }
        if (i_ex(obj_dw_churchc_darkswords))
            tdamage = max(1, ceil(damage));
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
                if (global.chapter == 4 && i_ex(obj_hammer_of_justice_enemy) && (global.hp[chartarget] - tdamage) <= 0)
                    hpdiff = round(global.hp[chartarget]);
                if (global.chapter == 4 && i_ex(obj_hammer_of_justice_enemy) && tdamage < 5)
                    tdamage = 5;
                if (global.chapter == 4 && i_ex(obj_hammer_of_justice_enemy) && hpdiff < 5)
                    hpdiff = 5;
                global.hp[chartarget] -= tdamage;
                if (global.hp[chartarget] <= 0)
                {
                    if (global.chapter == 4 && i_ex(obj_titan_enemy) && obj_titan_enemy.phase == 8 && chartarget == 1)
                    {
                        if (global.hp[1] < 1)
                            global.hp[1] = 1;
                    }
                    else if (global.chapter == 4 && i_ex(obj_hammer_of_justice_enemy))
                    {
                        if (global.hp[2] < 1)
                        {
                            global.hp[2] = global.maxhp[2];
                            scr_battle_sprite_set("susie", spr_susie_dw_landed, 0, true);
                            with (obj_hammer_of_justice_enemy)
                            {
                                attackcon = 0;
                                talked = -1;
                                endcon = 1;
                                global.flag[36] = 1;
                                mus_volume(global.batmusic[1], 0, 90);
                                event_user(14);
                            }
                            global.turntimer = 0;
                            obj_battlecontroller.noreturn = 1;
                            obj_battlecontroller.intro = 2;
                            with (obj_tensionbar)
                            {
                                alarm[5] = 15;
                                hspeed = -10;
                                friction = -0.4;
                            }
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
            var __targx = -1;
            var __targy = -1;
            if (global.chapter == 4 && i_ex(obj_climb_kris))
            {
                __targx = obj_climb_kris.x;
                __targy = obj_climb_kris.y;
                snd_stop(snd_hurt1);
                snd_play(snd_hurt1);
            }
            if (__targx == -1 && i_ex(obj_dw_churchc_darkswords))
            {
                __targx = obj_mainchara.x;
                __targy = obj_mainchara.y;
                snd_stop(snd_hurt1);
                snd_play(snd_hurt1);
            }
            if (__targx == -1)
            {
                __targx = global.charinstance[target].x;
                __targy = (global.charinstance[target].y + global.charinstance[target].myheight) - 24;
            }
            if (global.chapter == 4 && i_ex(obj_hammer_of_justice_enemy) && tdamage < 5)
                tdamage = 5;
            if (global.chapter == 4 && i_ex(obj_hammer_of_justice_enemy) && hpdiff < 5)
                hpdiff = 5;
            dmgwriter = instance_create(__targx, __targy, obj_dmgwriter);
            if (i_ex(obj_mike_attack_controller))
            {
                dmgwriter.x = obj_heart.x;
                dmgwriter.y = obj_heart.y;
                dmgwriter.xstart = dmgwriter.x;
                dmgwriter.ystart = dmgwriter.y;
                if (global.char[1] != 0 && global.char[2] != 0)
                    doomtype = target;
                dmgwriter.depth = obj_heart.depth - 1000;
            }
            dmgwriter.damage = hpdiff;
            dmgwriter.type = doomtype;
            if (global.chapter == 4)
            {
                if (i_ex(obj_climb_kris))
                {
                    dmgwriter.type = -1;
                    dmgwriter.damage = tdamage;
                    if (obj_climb_kris.onrotatingtower)
                        dmgwriter.x = camerax() + (camerawidth() / 2);
                }
            }
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
        global.inv = global.invc * 40;
        if (global.chapter == 4)
        {
            var cantdie = false;
            if (i_ex(obj_overworld_knight_sword_manager) && global.hp[1] < 1)
                global.hp[1] = 1;
            if (i_ex(obj_dw_church_trueclimbadventure))
                cantdie = true;
            if (i_ex(obj_titan_enemy) && obj_titan_enemy.phase == 8)
                cantdie = true;
            if (i_ex(obj_dw_churchc_darkswords) && obj_dw_churchc_darkswords.cantdie)
            {
                for (var _i = 1; _i < 4; _i++)
                    global.hp[_i] = clamp(global.hp[_i], 1, global.maxhp[_i]);
            }
            if (cantdie)
                global.hp[1] = clamp(global.hp[1], 1, global.maxhp[1]);
            if (i_ex(obj_climb_kris))
            {
                if (global.hp[1] <= 0 && !cantdie)
                {
                    scr_damage_check();
                    scr_gameover();
                    gameover = 1;
                }
            }
            if (i_ex(obj_sound_of_justice_enemy) && obj_sound_of_justice_enemy.phase == 1 && global.hp[2] < 1)
            {
                obj_sound_of_justice_enemy.susiedown = true;
                global.hp[2] = 1;
                global.turntimer = 0;
                snd_stop(snd_hurt1);
                snd_play(snd_hurt1);
            }
        }
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
