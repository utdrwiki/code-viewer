if (global.chapter == 3)
{
    if (instance_exists(obj_rouxls_ch3_enemy) && obj_rouxls_ch3_enemy.intro < 2)
        exit;
    if (instance_exists(obj_tenna_board4_enemy) && obj_tenna_board4_enemy.intro < 2)
        exit;
    if (instance_exists(obj_elnina_lanino_controller) && obj_elnina_lanino_controller.intro < 4)
        exit;
    if (instance_exists(obj_tennabattleconvo_controller) && obj_tennabattleconvo_controller.introcon < 2)
        exit;
    if (instance_exists(obj_knight_enemy) && obj_knight_enemy.end_cutscene_version > 0)
        exit;
    if (i_ex(obj_susiezilla_gamecontroller))
        exit;
    if (i_ex(obj_chefs_game))
        exit;
    if (i_ex(obj_rhythmgame))
        exit;
    if (i_ex(obj_shootout_controller) && i_ex(obj_tenna_enemy))
        exit;
    if (i_ex(obj_shutta_enemy) && obj_shutta_enemy.amiabossfight && victory == 1 && victoried == 0)
        global.battletyper = 4;
}
if (victory == 1 && victoried == 0)
{
    global.faceaction[0] = 0;
    global.faceaction[1] = 0;
    global.faceaction[2] = 0;
    global.battleend = 1;
    global.mnfight = -1;
    global.myfight = 7;
    with (battlewriter)
        instance_destroy();
    with (obj_face)
        instance_destroy();
    with (obj_smallface)
        instance_destroy();
    for (i = 0; i < 5; i += 1)
    {
        if (global.hp[i] < 1)
            global.hp[i] = round(global.maxhp[i] / 8);
    }
    lastbattlewriter = 32482473284732;
    if (skipvictory == 0)
    {
        global.monstergold[3] += floor(global.tension / 10) * global.chapter;
        if (global.charweapon[1] == 8)
            global.monstergold[3] += floor(global.monstergold[3] / 20);
        global.monstergold[3] *= 1 + (scr_armorcheck_equipped_party(8) * 0.05);
        global.monstergold[3] *= 1 + (scr_armorcheck_equipped_party(21) * 0.3);
        global.monstergold[3] = floor(global.monstergold[3]);
        if (global.flag[37] == 1)
            global.monstergold[3] = 0;
        global.gold += global.monstergold[3];
        global.xp += global.monsterexp[3];
        if (global.gold < 0)
            global.gold = 0;
        global.fc = 0;
        global.fe = 0;
        global.battlemsg[0] = stringsetsubloc("* You won^1!&* Got ~1 EXP and ~2 D$./%", string(global.monsterexp[3]), string(global.monstergold[3]), "obj_battlecontroller_slash_Step_0_gml_42_0");
        if (global.flag[37] == 1)
            global.battlemsg[0] = stringsetloc("* You won the battle!/%", "obj_battlecontroller_slash_Step_0_gml_43_0");
        if (global.flag[63] == 1)
        {
            var gainedstats = scr_levelup();
            if (gainedstats)
            {
                global.battlemsg[0] = stringsetsubloc("* You won^1!&* Got ~1 D$^1.&* You became stronger./%", string(global.monstergold[3]), "obj_battlecontroller_slash_Step_0_gml_46_0");
                if (scr_havechar(4))
                    global.battlemsg[0] = stringsetsubloc("* You won^1!&* Got ~1 D$^1.&* Noelle became stronger./%", string(global.monstergold[3]), "obj_battlecontroller_slash_Step_0_gml_69_0");
                var lvsnd = snd_play_pitch(snd_dtrans_lw, 2);
                snd_volume(lvsnd, 0.7, 0);
            }
        }
        global.battletyper = 4;
        global.msg[0] = global.battlemsg[0];
        global.typer = global.battletyper;
        lastbattlewriter = scr_battletext();
        if (global.flag[38] == 1)
        {
            with (lastbattlewriter)
                instance_destroy();
        }
        for (i = 0; i < 3; i += 1)
        {
            with (global.charinstance[i])
            {
                state = 7;
                hurt = 0;
                hurttimer = 0;
            }
        }
    }
    victoried = 1;
    victortimer = 0;
    if (skipvictory == 1)
        victortimer = -20;
    if (global.chapter == 3 && i_ex(obj_tenna_board4_enemy) && skipvictory == 1)
        victortimer = 0;
    with (obj_tensionbar)
    {
        alarm[5] = 15;
        hspeed = -10;
        friction = -0.4;
    }
}
if (victoried == 1)
{
    victortimer += 1;
    if (victortimer == 15 && room == room_ch3_gameshowroom && i_ex(obj_tenna_board4_enemy))
        instance_create(x, y, obj_board4_battleend_wipe);
    if (i_ex(lastbattlewriter) == false && victortimer >= 10)
    {
        intro = 2;
        if (bp <= 0)
            scr_endcombat();
    }
}
if (global.myfight == 0)
{
    if (global.bmenuno == 0)
    {
        var can_input = true;
        if (i_ex(obj_board_battleintroduction))
            can_input = false;
        var play_battlemsg = true;
        if (spadesuccesscon == 1 || rouxlserrorcon == 1)
            can_input = false;
        if (global.chapter == 3 && i_ex(obj_rouxls_ch3_enemy))
        {
            with (obj_rouxls_ch3_enemy)
                dancecon = 1;
            if (obj_rouxls_ch3_enemy.intro == 2)
                can_input = false;
            play_battlemsg = false;
            if (obj_rouxls_ch3_enemy.intro == 3)
                play_battlemsg = true;
            if (oopsallacts == 1 && spadebuttonenabled == true && obj_rouxls_ch3_enemy.phase != 3 && global.charturn == 0 && dogcon == 0)
                dogtimer++;
            else
                dogtimer = 0;
            if (dogtimer == 1000)
                dogcon = 1;
        }
        if (((!i_ex(battlewriter) && play_battlemsg == true) || (global.chapter == 2 && !i_ex(battlewriter))) && play_battlemsg == true)
        {
            global.msg[0] = global.battlemsg[0];
            global.typer = global.battletyper;
            if ((global.chapter == 3 && i_ex(obj_tenna_enemy) && obj_tenna_enemy.turn == 0) || i_ex(obj_tennabattleconvo_controller))
            {
                scr_speaker("tenna");
                global.fc = 22;
                global.typer = 80;
            }
            if (global.chapter == 3 && global.encounterno == 123 && i_ex(obj_pippins_enemy) && obj_pippins_enemy.turns == 0)
            {
                scr_speaker("ralsei");
                global.fc = 2;
                global.typer = 45;
            }
            if (global.chapter == 3 && global.encounterno == 123 && i_ex(obj_pippins_enemy) && obj_pippins_enemy.turns == 1)
            {
                scr_speaker("susie");
                global.fc = 1;
                global.typer = 47;
            }
            if (global.chapter == 3 && global.encounterno == 123 && i_ex(obj_pippins_enemy) && obj_pippins_enemy.turns == 2)
            {
                scr_speaker("ralsei");
                global.fc = 2;
                global.typer = 45;
            }
            if (global.chapter == 3 && global.encounterno == 123 && i_ex(obj_pippins_enemy) && obj_pippins_enemy.turns == 3)
            {
                scr_speaker("susie");
                global.fc = 1;
                global.typer = 47;
            }
            if (global.chapter == 3 && global.encounterno == 123 && i_ex(obj_pippins_enemy) && obj_pippins_enemy.turns == 4)
            {
                scr_speaker("ralsei");
                global.fc = 2;
                global.typer = 45;
            }
            scr_battletext();
        }
        if (left_p() == 1 && lbuffer < 0 && can_input == true)
        {
            if (global.bmenucoord[0][global.charturn] == 0)
                global.bmenucoord[0][global.charturn] = 4;
            else
                global.bmenucoord[0][global.charturn] -= 1;
            movenoise = 1;
            rbuffer = 1;
            if (disablesusieact == 1 && global.charturn == 1 && global.bmenucoord[0][global.charturn] == 1)
                global.bmenucoord[0][global.charturn] = 0;
        }
        if (right_p() == 1 && rbuffer < 0 && can_input == true)
        {
            if (global.bmenucoord[0][global.charturn] == 4)
                global.bmenucoord[0][global.charturn] = 0;
            else
                global.bmenucoord[0][global.charturn] += 1;
            movenoise = 1;
            lbuffer = 1;
            if (disablesusieact == 1 && global.charturn == 1 && global.bmenucoord[0][global.charturn] == 1)
                global.bmenucoord[0][global.charturn] = 2;
        }
        if (button1_p() == 1 && rouxlserrorcon == 1 && dogcon < 1)
        {
        }
        else if (button1_p() == 1 && twobuffer < 0 && can_input == true)
        {
            onebuffer = 1;
            selnoise = 1;
            if (oopsallacts == 1)
            {
                norouxlsbutton = true;
                if (spadebuttonenabled == false)
                {
                    global.faceaction[global.charturn] = 6;
                    global.bmenucoord[0][0] = 2;
                    global.bmenucoord[0][1] = 2;
                    global.bmenucoord[0][2] = 2;
                    if (obj_battlecontroller.rouxlsgridenabled == true)
                    {
                        obj_battlecontroller.rouxlsbuttoncount_y = 4;
                        rouxlserrorcon = 0;
                        rouxlstelegraphtimer = 0;
                    }
                    if (i_ex(obj_tenna_board4_enemy))
                    {
                        onebuffer = 1;
                        global.bmenuno = 11;
                    }
                    else
                    {
                        scr_nexthero();
                    }
                    exit;
                }
                spadesuccesscon = 1;
                var ralseiyarn = false;
                if (global.charturn == 2 && (obj_heroralsei.sprite_index == spr_ralseib_yarn_1 || obj_heroralsei.sprite_index == spr_ralseib_yarn_2) && obj_rouxls_ch3_enemy.yarnendturn == 0)
                {
                    selnoise = 0;
                    global.bmenuno = 0;
                    obj_rouxls_ch3_enemy.yarnendturn = 1;
                    if (dogcon < 1)
                    {
                        rouxlsbuttonendcon = 0;
                        if ((spadebuttoncount - 1) == (global.bmenucoord[0][global.charturn] + (rouxlsbuttoncount_y * 5)) || recentlyhighlightingspade > 0)
                        {
                            snd_play(snd_coin);
                            global.faceaction[global.charturn] = 6;
                            spadesuccesscon = 1;
                            if (recentlyhighlightingspade > 0 && (spadebuttoncount - 1) != (global.bmenucoord[0][global.charturn] + (rouxlsbuttoncount_y * 5)))
                                spadebuttoncount = recentlyhighlightingspadevalue;
                        }
                        else
                        {
                            snd_play(snd_error);
                            spadesuccesscon = 1;
                            spadefail = true;
                        }
                    }
                    if (dogcon > 0)
                    {
                        snd_play(snd_pombark);
                        dogselectedcount++;
                        spadesuccesscon = 0;
                        if (global.charturn == 2 && dogselectedcount < 9)
                        {
                            global.charturn = 0;
                            global.bmenuno = 0;
                        }
                        else if (global.charturn == 2 && dogselectedcount >= 9)
                        {
                            scr_nexthero();
                            global.bmenucoord[0][0] = 2;
                            global.bmenucoord[0][1] = 2;
                            global.bmenucoord[0][2] = 2;
                            if (rouxlsgridenabled == true)
                            {
                                rouxlsbuttoncount_y = 4;
                                buttonorder = 0;
                                rouxlsbuttoncount = choose(0, -1, -3, -4);
                            }
                            obj_rouxls_ch3_enemy.dogtrigger = 1;
                        }
                        else
                        {
                            scr_nexthero();
                            global.bmenucoord[0][0] = 2;
                            global.bmenucoord[0][1] = 2;
                            global.bmenucoord[0][2] = 2;
                            if (rouxlsgridenabled == true)
                            {
                                rouxlsbuttoncount_y = 4;
                                buttonorder = 0;
                                rouxlsbuttoncount = choose(0, -1, -3, -4);
                            }
                        }
                    }
                    exit;
                }
                if (spadebuttonenabled == true && ralseiyarn == false)
                {
                    selnoise = 0;
                    if (dogcon > 0)
                    {
                        if ((spadebuttoncount - 1) == (global.bmenucoord[0][global.charturn] + (rouxlsbuttoncount_y * 5)) || recentlyhighlightingspade > 0 || dogcon == 2)
                        {
                            buttonspeed++;
                            snd_play(snd_pombark);
                            dogselectedcount++;
                            if (dogcon == 1)
                                dogcon = 2;
                            if (recentlyhighlightingspade > 0 && (spadebuttoncount - 1) != (global.bmenucoord[0][global.charturn] + (rouxlsbuttoncount_y * 5)))
                                spadebuttoncount = recentlyhighlightingspadevalue;
                        }
                        else
                        {
                            snd_play(snd_error);
                            dogcon = -1;
                            spadefail = true;
                        }
                    }
                    else if ((spadebuttoncount - 1) == (global.bmenucoord[0][global.charturn] + (rouxlsbuttoncount_y * 5)) || recentlyhighlightingspade > 0)
                    {
                        buttonspeed++;
                        with (obj_rouxls_ch3_enemy)
                            spadepower++;
                        snd_play(snd_coin);
                        global.faceaction[global.charturn] = 6;
                        spadesuccesscon = 1;
                        if (recentlyhighlightingspade > 0 && (spadebuttoncount - 1) != (global.bmenucoord[0][global.charturn] + (rouxlsbuttoncount_y * 5)))
                            spadebuttoncount = recentlyhighlightingspadevalue;
                    }
                    else if ((heartbuttoncount - 1) == (global.bmenucoord[0][global.charturn] + (rouxlsbuttoncount_y * 5)))
                    {
                        buttonspeed++;
                        snd_play(snd_coin);
                        heartsuccesscon = 1;
                        spadebuttontimer = 0;
                    }
                    else
                    {
                        snd_play(snd_error);
                        spadesuccesscon = 1;
                        spadefail = true;
                    }
                    if (obj_rouxls_ch3_enemy.phase > 1)
                    {
                    }
                }
                rouxlsbuttonendcon = 0;
                rouxlsbuttonendcon = 0;
                if (dogcon < 1)
                    rouxlsbuttonendcon = 0;
                if (dogcon > 0)
                {
                    dogselectedcount++;
                    if (global.charturn == 2 && dogselectedcount < 9)
                    {
                        rouxlsbuttonendcon = 1;
                    }
                    else if (global.charturn == 2 && dogselectedcount >= 9)
                    {
                        rouxlsbuttonendcon = 0;
                        obj_rouxls_ch3_enemy.dogtrigger = 1;
                    }
                    else
                    {
                        rouxlsbuttonendcon = 0;
                    }
                }
                exit;
            }
            if (global.bmenucoord[0][global.charturn] == 0)
                global.bmenuno = 1;
            if (global.bmenucoord[0][global.charturn] == 1 && global.char[global.charturn] != 1)
            {
                onebuffer = 1;
                global.bmenuno = 2;
            }
            else if (global.bmenucoord[0][global.charturn] == 1)
            {
                onebuffer = 1;
                global.bmenuno = 11;
            }
            if (global.bmenucoord[0][global.charturn] == 2 && tempitem[0][global.charturn] != 0)
            {
                onebuffer = 1;
                global.bmenuno = 4;
                scr_iteminfo_temp(global.charturn);
                for (i = 0; i < 12; i += 1)
                {
                    if (tempitem[global.bmenucoord[4][global.charturn]][global.charturn] == 0 && global.bmenucoord[4][global.charturn] > 0)
                        global.bmenucoord[4][global.charturn] -= 1;
                }
            }
            if (global.bmenucoord[0][global.charturn] == 3)
            {
                onebuffer = 1;
                global.bmenuno = 12;
            }
            if (global.bmenucoord[0][global.charturn] == 4)
            {
                scr_tensionheal(40);
                if (global.chapter == 3)
                    idefendedthisturn++;
                global.faceaction[global.charturn] = 4;
                global.charaction[global.charturn] = 10;
                scr_nexthero();
            }
        }
        var rouxlsbattle = false;
        if (global.chapter == 3 && i_ex(obj_rouxls_ch3_enemy))
            rouxlsbattle = true;
        if (button2_p() == 1 && onebuffer < 0 && global.charturn > 0 && rouxlsbattle == false)
        {
            twobuffer = 1;
            movenoise = 1;
            scr_prevhero();
        }
        with (battlewriter)
            depth = 3;
        with (obj_face_parent)
            depth = 3;
        with (obj_smallface)
            depth = 3;
    }
    if (global.bmenuno == 2 && global.flag[34] == 1)
    {
        with (battlewriter)
            skipme = 1;
        with (battlewriter)
            depth = 10;
        with (obj_face_parent)
            depth = 10;
        with (obj_smallface)
            depth = 10;
        thischar = global.char[global.charturn];
        if (right_p() || left_p())
        {
            cango = 1;
            spellcoord = global.bmenucoord[2][global.charturn];
            if (spellcoord < 11)
            {
                if (global.spell[thischar][global.bmenucoord[2][global.charturn] + 1] == 0)
                {
                    cango = 0;
                    if ((spellcoord % 2) == 1 && spellcoord > 0)
                        global.bmenucoord[2][global.charturn] -= 1;
                }
            }
            else
            {
                global.bmenucoord[2][global.charturn] -= 1;
                cango = 0;
            }
            if (cango == 1)
            {
                if ((spellcoord % 2) == 0)
                    global.bmenucoord[2][global.charturn] += 1;
                else
                    global.bmenucoord[2][global.charturn] -= 1;
            }
        }
        if (down_p())
        {
            spellcoord = global.bmenucoord[2][global.charturn];
            cango = 1;
            if (spellcoord >= 10)
            {
                cango = 0;
            }
            else
            {
                if (global.spell[thischar][spellcoord + 2] == 0)
                    cango = 0;
                if (spellcoord == 5 && global.spell[thischar][6] != 0 && global.spell[thischar][7] == 0)
                    cango = 2;
            }
            if (cango != 0)
            {
                if (cango == 1)
                    global.bmenucoord[2][global.charturn] += 2;
                if (cango == 2)
                    global.bmenucoord[2][global.charturn] = 6;
            }
        }
        if (up_p())
        {
            spellcoord = global.bmenucoord[2][global.charturn];
            cango = 1;
            if (spellcoord <= 1)
                cango = 0;
            if (cango == 1)
                global.bmenucoord[2][global.charturn] -= 2;
        }
        global.tensionselect = global.spellcost[thischar][global.bmenucoord[2][global.charturn]];
        if (button1_p() && global.spell[thischar][global.bmenucoord[2][global.charturn]] != 0 && onebuffer < 0)
        {
            if (global.spellcost[thischar][global.bmenucoord[2][global.charturn]] <= global.tension)
            {
                onebuffer = 2;
                global.bmenuno = 0;
                selnoise = 1;
                scr_spellinfo(global.spell[thischar][global.bmenucoord[2][global.charturn]]);
                if (spelltarget == 0)
                    scr_spellconsumeb();
                if (spelltarget == 1)
                    global.bmenuno = 8;
                if (spelltarget == 2)
                    global.bmenuno = 3;
            }
        }
        if (button2_p() && onebuffer < 0)
        {
            global.tensionselect = 0;
            twobuffer = 1;
            global.bmenuno = 0;
            movenoise = 1;
        }
    }
    if (global.bmenuno == 2 && global.flag[34] == 0)
    {
        with (battlewriter)
            skipme = 1;
        with (battlewriter)
            depth = 10;
        with (obj_face_parent)
            depth = 10;
        with (obj_smallface)
            depth = 10;
        thischar = global.charturn;
        if (right_p() || left_p())
        {
            cango = 1;
            spellcoord = global.bmenucoord[2][global.charturn];
            if (spellcoord < 11)
            {
                if (global.battlespell[thischar][global.bmenucoord[2][global.charturn] + 1] == 0)
                {
                    cango = 0;
                    if ((spellcoord % 2) == 1 && spellcoord > 0)
                        global.bmenucoord[2][global.charturn] -= 1;
                }
            }
            else
            {
                global.bmenucoord[2][global.charturn] -= 1;
                cango = 0;
            }
            if (cango == 1)
            {
                if ((spellcoord % 2) == 0)
                    global.bmenucoord[2][global.charturn] += 1;
                else
                    global.bmenucoord[2][global.charturn] -= 1;
            }
        }
        if (down_p())
        {
            spellcoord = global.bmenucoord[2][global.charturn];
            cango = 1;
            if (spellcoord >= 10)
            {
                cango = 0;
            }
            else
            {
                if (global.battlespell[thischar][spellcoord + 2] == 0)
                    cango = 0;
                if (spellcoord == 5 && global.battlespell[thischar][6] != 0 && global.battlespell[thischar][7] == 0)
                    cango = 2;
            }
            if (cango != 0)
            {
                if (cango == 1)
                    global.bmenucoord[2][global.charturn] += 2;
                if (cango == 2)
                    global.bmenucoord[2][global.charturn] = 6;
            }
        }
        if (up_p())
        {
            spellcoord = global.bmenucoord[2][global.charturn];
            cango = 1;
            if (spellcoord <= 1)
                cango = 0;
            if (cango == 1)
                global.bmenucoord[2][global.charturn] -= 2;
        }
        global.tensionselect = global.battlespellcost[thischar][global.bmenucoord[2][global.charturn]];
        var _confirm = true;
        var havejeviltail = false;
        if (global.chararmor1[1] == 7 || global.chararmor2[1] == 7 || global.chararmor1[2] == 7 || global.chararmor2[2] == 7 || global.chararmor1[3] == 7 || global.chararmor2[3] == 7)
            havejeviltail = true;
        if (i_ex(obj_pippins_enemy) && global.battlespellname[thischar][global.bmenucoord[2][global.charturn]] == global.actname[obj_pippins_enemy.myself][3] && global.flag[1044] < 150)
            _confirm = false;
        if (!havejeviltail && i_ex(obj_tenna_enemy_bg) && i_ex(obj_tenna_enemy) && obj_tenna_enemy_bg.myscore < 20 && global.battlespellname[thischar][global.bmenucoord[2][global.charturn]] == global.actnamesus[obj_tenna_enemy.myself][1])
            _confirm = false;
        if (havejeviltail && i_ex(obj_tenna_enemy_bg) && i_ex(obj_tenna_enemy) && obj_tenna_enemy_bg.myscore < 30 && global.battlespellname[thischar][global.bmenucoord[2][global.charturn]] == global.actnamesus[obj_tenna_enemy.myself][1])
            _confirm = false;
        if (button1_p() && global.battlespell[thischar][global.bmenucoord[2][global.charturn]] != 0 && onebuffer < 0 && _confirm == true)
        {
            if (global.battlespellcost[thischar][global.bmenucoord[2][global.charturn]] <= global.tension)
            {
                onebuffer = 2;
                global.bmenuno = 0;
                selnoise = 1;
                if (global.battlespell[thischar][global.bmenucoord[2][global.charturn]] != -1)
                {
                    scr_spellinfo(global.battlespell[thischar][global.bmenucoord[2][global.charturn]]);
                    if (spelltarget == 0)
                        scr_spellconsumeb();
                    if (spelltarget == 1)
                        global.bmenuno = 8;
                    if (spelltarget == 2)
                        global.bmenuno = 3;
                    if (spelltarget == 3)
                        global.bmenuno = 99;
                }
                else
                {
                    global.bmenuno = 13;
                }
            }
        }
        if (button2_p() && onebuffer < 0)
        {
            global.tensionselect = 0;
            twobuffer = 1;
            global.bmenuno = 0;
            movenoise = 1;
        }
    }
    if (global.bmenuno == 4)
    {
        with (battlewriter)
            skipme = 1;
        with (battlewriter)
            depth = 10;
        with (obj_face_parent)
            depth = 10;
        with (obj_smallface)
            depth = 10;
        if (tempitem[global.bmenucoord[4][global.charturn]][global.charturn] == 0)
            global.bmenucoord[4][global.charturn] -= 1;
        if (right_p())
        {
            cango = 1;
            itemcoord = global.bmenucoord[4][global.charturn];
            if (itemcoord < 11)
            {
                if (tempitem[global.bmenucoord[4][global.charturn] + 1][global.charturn] == 0)
                {
                    cango = 0;
                    if ((itemcoord % 2) == 1 && itemcoord > 0)
                        global.bmenucoord[4][global.charturn] -= 1;
                }
            }
            else
            {
                global.bmenucoord[4][global.charturn] -= 1;
                cango = 0;
            }
            if (cango == 1)
            {
                if ((itemcoord % 2) == 0)
                    global.bmenucoord[4][global.charturn] += 1;
                else
                    global.bmenucoord[4][global.charturn] -= 1;
            }
        }
        if (left_p())
        {
            cango = 1;
            itemcoord = global.bmenucoord[4][global.charturn];
            if (tempitem[1][global.charturn] != 0)
            {
                if ((itemcoord % 2) == 0)
                    global.bmenucoord[4][global.charturn] += 1;
                else
                    global.bmenucoord[4][global.charturn] -= 1;
            }
        }
        if (down_p())
        {
            itemcoord = global.bmenucoord[4][global.charturn];
            cango = 1;
            if (itemcoord >= 10)
            {
                cango = 0;
            }
            else
            {
                if (tempitem[itemcoord + 2][global.charturn] == 0)
                    cango = 0;
                if (itemcoord == 5 && tempitem[6][global.charturn] != 0 && tempitem[7][global.charturn] == 0)
                    cango = 2;
            }
            if (cango != 0)
            {
                if (cango == 1)
                    global.bmenucoord[4][global.charturn] += 2;
                if (cango == 2)
                    global.bmenucoord[4][global.charturn] = 6;
            }
        }
        if (up_p())
        {
            itemcoord = global.bmenucoord[4][global.charturn];
            cango = 1;
            if (itemcoord <= 1)
                cango = 0;
            if (cango == 1)
                global.bmenucoord[4][global.charturn] -= 2;
        }
        if (tempitem[global.bmenucoord[4][global.charturn]][global.charturn] == 0)
            global.bmenucoord[4][global.charturn] -= 1;
        if (button1_p() && tempitem[global.bmenucoord[4][global.charturn]][global.charturn] != 0 && onebuffer < 0)
        {
            onebuffer = 2;
            global.bmenuno = 0;
            selnoise = 1;
            scr_iteminfo(tempitem[global.bmenucoord[4][global.charturn]][global.charturn]);
            if (itemtarget == 0 || itemtarget == 2)
            {
                var item_use = false;
                var _tensionhealed = 0;
                if (tempitem[global.bmenucoord[4][global.charturn]][global.charturn] == 27)
                {
                    scr_tensionheal(80);
                    _tensionhealed = 1;
                    item_use = true;
                }
                if (tempitem[global.bmenucoord[4][global.charturn]][global.charturn] == 28)
                {
                    scr_tensionheal(ceil(global.maxtension / 2));
                    _tensionhealed = 1;
                    item_use = true;
                }
                if (tempitem[global.bmenucoord[4][global.charturn]][global.charturn] == 29)
                {
                    scr_tensionheal(ceil(global.maxtension));
                    _tensionhealed = 1;
                    item_use = true;
                }
                if (_tensionhealed)
                {
                    var _drivenoise = snd_play(snd_cardrive);
                    snd_pitch(_drivenoise, 1.4);
                    snd_volume(_drivenoise, 0.8, 0);
                    with (global.charinstance[global.charturn])
                    {
                        ha = instance_create(x, y, obj_healanim);
                        ha.target = id;
                        ha.particlecolor = c_orange;
                    }
                    scr_itemshift_temp(global.bmenucoord[4][global.charturn], global.charturn);
                    scr_nexthero();
                }
                if (!_tensionhealed)
                    scr_itemconsumeb();
                if (item_use == true)
                {
                    with (obj_event_manager)
                        trigger_event(UnknownEnum.Value_0, get_consumer_trophy());
                }
            }
            if (itemtarget == 1)
                global.bmenuno = 7;
        }
        if (button2_p() && onebuffer < 0)
        {
            twobuffer = 1;
            global.bmenuno = 0;
            movenoise = 1;
        }
    }
    if (global.bmenuno == 9)
    {
        thisenemy = global.bmenucoord[11][global.charturn];
        scr_actinfo_temp(thisenemy);
        if (right_p())
        {
            cango = 1;
            actcoord = global.bmenucoord[9][global.charturn];
            if (actcoord < 5)
            {
                if (canact[global.bmenucoord[9][global.charturn] + 1] == 0)
                {
                    cango = 0;
                    if ((actcoord % 2) == 1 && actcoord > 0)
                        global.bmenucoord[9][global.charturn] -= 1;
                }
            }
            else
            {
                global.bmenucoord[9][global.charturn] -= 1;
                cango = 0;
            }
            if (cango == 1)
            {
                if ((actcoord % 2) == 0)
                    global.bmenucoord[9][global.charturn] += 1;
                else
                    global.bmenucoord[9][global.charturn] -= 1;
            }
        }
        if (left_p())
        {
            cango = 1;
            actcoord = global.bmenucoord[9][global.charturn];
            if ((actcoord % 2) == 0)
            {
                if (canact[actcoord + 1] != 0)
                    global.bmenucoord[9][global.charturn] += 1;
            }
            else
            {
                global.bmenucoord[9][global.charturn] -= 1;
            }
        }
        if (down_p())
        {
            actcoord = global.bmenucoord[9][global.charturn];
            cango = 1;
            if (actcoord >= 4)
                cango = 0;
            else if (canact[actcoord + 2] == 0)
                cango = 0;
            if (cango != 0)
            {
                if (cango == 1)
                    global.bmenucoord[9][global.charturn] += 2;
            }
        }
        if (up_p())
        {
            actcoord = global.bmenucoord[9][global.charturn];
            cango = 1;
            if (actcoord <= 1)
                cango = 0;
            if (cango == 1)
                global.bmenucoord[9][global.charturn] -= 2;
        }
        global.tensionselect = acttpcost[global.bmenucoord[9][global.charturn]];
        canpress = 1;
        if (global.char[global.charturn] == 1)
        {
            if (global.actactor[global.bmenucoord[11][global.charturn]][global.bmenucoord[9][global.charturn]] == 2 || global.actactor[global.bmenucoord[11][global.charturn]][global.bmenucoord[9][global.charturn]] == 4)
            {
                if (havechar[1] == 0 || global.hp[2] <= 0)
                    canpress = 0;
            }
            if (global.actactor[global.bmenucoord[11][global.charturn]][global.bmenucoord[9][global.charturn]] == 3 || global.actactor[global.bmenucoord[11][global.charturn]][global.bmenucoord[9][global.charturn]] == 4)
            {
                if (havechar[2] == 0 || global.hp[3] <= 0)
                    canpress = 0;
            }
            if (global.actactor[global.bmenucoord[11][global.charturn]][global.bmenucoord[9][global.charturn]] == 5)
            {
                if (havechar[3] == 0 || global.hp[4] <= 0)
                    canpress = 0;
            }
        }
        var _confirm = true;
        if (global.flag[1044] < 150 && i_ex(obj_pippins_enemy) && global.actname[thisenemy][global.bmenucoord[9][global.charturn]] == global.actname[obj_pippins_enemy.myself][3])
            _confirm = false;
        var havejeviltail = false;
        if (global.chararmor1[1] == 7 || global.chararmor2[1] == 7 || global.chararmor1[2] == 7 || global.chararmor2[2] == 7 || global.chararmor1[3] == 7 || global.chararmor2[3] == 7)
            havejeviltail = true;
        if (!havejeviltail)
        {
            if (i_ex(obj_tenna_enemy_bg) && i_ex(obj_tenna_enemy) && obj_tenna_enemy_bg.myscore < 20 && global.actname[thisenemy][global.bmenucoord[9][global.charturn]] == global.actnamesus[obj_tenna_enemy.myself][1])
                _confirm = false;
        }
        if (havejeviltail)
        {
            if (i_ex(obj_tenna_enemy_bg) && i_ex(obj_tenna_enemy) && obj_tenna_enemy_bg.myscore < 30 && global.actname[thisenemy][global.bmenucoord[9][global.charturn]] == global.actnamesus[obj_tenna_enemy.myself][1])
                _confirm = false;
        }
        if (canpress == 1)
        {
            if (button1_p() && global.canact[thisenemy][global.bmenucoord[9][global.charturn]] == 1 && global.tension >= global.tensionselect && _confirm && onebuffer < 0)
            {
                onebuffer = 2;
                global.bmenuno = 0;
                selnoise = 1;
                global.actingchoice[global.charturn] = global.bmenucoord[9][global.charturn];
                global.tension -= acttpcost[global.bmenucoord[9][global.charturn]];
                global.tensionselect = 0;
                scr_actselect(thisenemy, global.bmenucoord[9][global.charturn]);
                global.bmenucoord[9][global.charturn] = 0;
                scr_nexthero();
            }
        }
        if (button2_p() && onebuffer < 0)
        {
            global.bmenucoord[9][global.charturn] = 0;
            global.tensionselect = 0;
            twobuffer = 1;
            global.bmenuno = 11;
            movenoise = 1;
        }
    }
    if (global.bmenuno == 7 || global.bmenuno == 1 || global.bmenuno == 8 || global.bmenuno == 3 || global.bmenuno == 11 || global.bmenuno == 12 || global.bmenuno == 13)
    {
        with (battlewriter)
            skipme = 1;
        with (battlewriter)
            depth = 10;
        with (obj_face_parent)
            depth = 10;
        with (obj_smallface)
            depth = 10;
        if (button2_p() && onebuffer < 0)
        {
            twobuffer = 1;
            if (global.bmenuno == 1 || global.bmenuno == 11 || global.bmenuno == 12)
                global.bmenuno = 0;
            if (global.bmenuno == 7)
                global.bmenuno = 4;
            if (global.bmenuno == 8 || global.bmenuno == 3 || global.bmenuno == 13)
                global.bmenuno = 2;
            movenoise = 1;
        }
        if (global.bmenuno == 7 || global.bmenuno == 1 || global.bmenuno == 8 || global.bmenuno == 3 || global.bmenuno == 11 || global.bmenuno == 12 || global.bmenuno == 13)
        {
            if (global.bmenuno == 7 || global.bmenuno == 8)
            {
                for (i = 0; i < 3; i += 1)
                {
                    ht[i] = 0;
                    if (global.char[i] > 0)
                        ht[i] = 1;
                }
            }
            if (global.bmenuno == 1 || global.bmenuno == 3 || global.bmenuno == 11 || global.bmenuno == 12 || global.bmenuno == 13)
            {
                for (i = 0; i < 3; i += 1)
                    ht[i] = global.monster[i];
            }
            if (global.bmenucoord[global.bmenuno][global.charturn] == 2 && ht[2] == 0)
                global.bmenucoord[global.bmenuno][global.charturn] = 0;
            if (global.bmenucoord[global.bmenuno][global.charturn] == 0 && ht[0] == 0)
                global.bmenucoord[global.bmenuno][global.charturn] = 1;
            if (global.bmenucoord[global.bmenuno][global.charturn] == 1 && ht[1] == 0)
                global.bmenucoord[global.bmenuno][global.charturn] = 0;
            if (global.bmenucoord[global.bmenuno][global.charturn] == 0 && ht[0] == 0)
                global.bmenucoord[global.bmenuno][global.charturn] = 2;
            if (down_p() == 1)
            {
                if (global.bmenucoord[global.bmenuno][global.charturn] == 0)
                {
                    if (ht[1] == 1)
                    {
                        movenoise = 1;
                        global.bmenucoord[global.bmenuno][global.charturn] = 1;
                    }
                    else if (ht[2] == 1)
                    {
                        movenoise = 1;
                        global.bmenucoord[global.bmenuno][global.charturn] = 2;
                    }
                }
                else if (global.bmenucoord[global.bmenuno][global.charturn] == 1)
                {
                    if (ht[2] == 1)
                    {
                        movenoise = 1;
                        global.bmenucoord[global.bmenuno][global.charturn] = 2;
                    }
                    else if (ht[0] == 1)
                    {
                        movenoise = 1;
                        global.bmenucoord[global.bmenuno][global.charturn] = 0;
                    }
                }
                else if (global.bmenucoord[global.bmenuno][global.charturn] == 2)
                {
                    if (ht[0] == 1)
                    {
                        movenoise = 1;
                        global.bmenucoord[global.bmenuno][global.charturn] = 0;
                    }
                    else if (ht[1] == 1)
                    {
                        movenoise = 1;
                        global.bmenucoord[global.bmenuno][global.charturn] = 1;
                    }
                }
            }
            if (up_p() == 1)
            {
                if (global.bmenucoord[global.bmenuno][global.charturn] == 0)
                {
                    if (ht[2] == 1)
                    {
                        movenoise = 1;
                        global.bmenucoord[global.bmenuno][global.charturn] = 2;
                    }
                    else if (ht[1] == 1)
                    {
                        movenoise = 1;
                        global.bmenucoord[global.bmenuno][global.charturn] = 1;
                    }
                }
                else if (global.bmenucoord[global.bmenuno][global.charturn] == 1)
                {
                    if (ht[0] == 1)
                    {
                        movenoise = 1;
                        global.bmenucoord[global.bmenuno][global.charturn] = 0;
                    }
                    else if (ht[2] == 1)
                    {
                        movenoise = 1;
                        global.bmenucoord[global.bmenuno][global.charturn] = 2;
                    }
                }
                else if (global.bmenucoord[global.bmenuno][global.charturn] == 2)
                {
                    if (ht[1] == 1)
                    {
                        movenoise = 1;
                        global.bmenucoord[global.bmenuno][global.charturn] = 1;
                    }
                    else if (ht[0] == 1)
                    {
                        movenoise = 1;
                        global.bmenucoord[global.bmenuno][global.charturn] = 0;
                    }
                }
            }
            if (button1_p() && onebuffer < 0)
            {
                onebuffer = 1;
                selnoise = 1;
                if (global.bmenuno == 1)
                {
                    global.chartarget[global.charturn] = global.bmenucoord[global.bmenuno][global.charturn];
                    global.faceaction[global.charturn] = 1;
                    global.charaction[global.charturn] = 1;
                    scr_nexthero();
                }
                if (global.bmenuno == 7)
                {
                    global.chartarget[global.charturn] = global.bmenucoord[global.bmenuno][global.charturn];
                    scr_itemconsumeb();
                }
                if (global.bmenuno == 8 || global.bmenuno == 3)
                {
                    global.chartarget[global.charturn] = global.bmenucoord[global.bmenuno][global.charturn];
                    scr_spellconsumeb();
                }
                if (global.bmenuno == 11)
                {
                    global.bmenuno = 9;
                    actcoord = global.bmenucoord[9][global.charturn];
                    thisenemy = global.bmenucoord[11][global.charturn];
                    if (global.char[global.charturn] == 1)
                    {
                        for (i = 0; i < 6; i += 1)
                        {
                            if (global.canact[thisenemy][actcoord] == 0)
                            {
                                if (actcoord > 0)
                                    global.bmenucoord[9][global.charturn] -= 1;
                            }
                        }
                    }
                    if (global.char[global.charturn] == 2)
                    {
                        for (i = 0; i < 6; i += 1)
                        {
                            if (global.canactsus[thisenemy][actcoord] == 0)
                            {
                                if (actcoord > 0)
                                    global.bmenucoord[9][global.charturn] -= 1;
                            }
                        }
                    }
                    if (global.char[global.charturn] == 3)
                    {
                        for (i = 0; i < 6; i += 1)
                        {
                            if (global.canactral[thisenemy][actcoord] == 0)
                            {
                                if (actcoord > 0)
                                    global.bmenucoord[9][global.charturn] -= 1;
                            }
                        }
                    }
                    if (global.char[global.charturn] == 4)
                    {
                        for (i = 0; i < 6; i += 1)
                        {
                            if (global.canactnoe[thisenemy][actcoord] == 0)
                            {
                                if (actcoord > 0)
                                    global.bmenucoord[9][global.charturn] -= 1;
                            }
                        }
                    }
                    onebuffer = 1;
                }
                if (global.bmenuno == 12)
                {
                    global.faceaction[global.charturn] = 10;
                    global.chartarget[global.charturn] = global.bmenucoord[global.bmenuno][global.charturn];
                    global.charaction[global.charturn] = 2;
                    global.charspecial[global.charturn] = 100;
                    scr_nexthero();
                }
                if (global.bmenuno == 13)
                {
                    onebuffer = 2;
                    global.bmenuno = 0;
                    selnoise = 1;
                    global.actingchoice[global.charturn] = global.bmenucoord[2][global.charturn];
                    global.tension -= global.battlespellcost[thischar][global.bmenucoord[2][global.charturn]];
                    global.tensionselect = 0;
                    scr_actinfo_temp(global.bmenucoord[13][global.charturn]);
                    scr_actselect(global.bmenucoord[13][global.charturn], global.bmenucoord[2][global.charturn]);
                    scr_nexthero();
                }
            }
        }
    }
}
if (movenoise == 1)
{
    snd_play(snd_menumove);
    movenoise = 0;
}
if (grazenoise == 1)
{
    snd_play(snd_graze);
    grazenoise = 0;
}
if (selnoise == 1)
{
    snd_play(snd_select);
    selnoise = 0;
}
if (damagenoise == 1)
{
    snd_play(snd_damage);
    damagenoise = 0;
}
if (laznoise == 1)
{
    snd_play(snd_laz_c);
    laznoise = 0;
}
onebuffer -= 1;
twobuffer -= 1;
lbuffer -= 1;
rbuffer -= 1;
if (global.mnfight == 2 && timeron == 1)
{
    global.turntimer -= 1;
    if (global.turntimer <= 0 && reset == 0)
    {
        with (obj_bulletparent)
            instance_destroy();
        with (obj_bulletgenparent)
            instance_destroy();
        with (obj_darkener)
            darken = 0;
        with (obj_heart)
        {
            instance_create(x, y, obj_returnheart);
            instance_destroy();
        }
        reset = 1;
        if (noreturn == 0)
            alarm[2] = 15;
    }
}
if (global.myfight == 3)
{
    if (scr_monsterpop() == 0 && !instance_exists(obj_writer))
    {
        scr_wincombat();
        if (global.myfight == 3)
            scr_endturn();
    }
}
if (global.myfight == 5)
{
    myfightreturntimer--;
    if (myfightreturntimer <= 0)
    {
        scr_mnendturn();
        global.spelldelay = 10;
        with (obj_heroparent)
        {
            attacktimer = 0;
            image_index = 0;
            index = 0;
            itemed = 0;
            acttimer = 0;
            defendtimer = 0;
            state = 0;
            flash = 0;
            siner = 0;
            fsiner = 0;
            alarm[4] = -1;
        }
        with (obj_spellphase)
        {
            with (spellwriter)
                instance_destroy();
            instance_destroy();
        }
    }
}
if (global.charweapon[4] == 13)
{
    if ((t_siner % 6) == 0)
    {
        if (global.hp[4] > round(global.maxhp[4] / 3))
            global.hp[4]--;
    }
}
t_siner++;
if (scr_debug())
{
    scr_turn_skip();
    if (scr_debug_keycheck(vk_f2))
        scr_debug_fullheal();
    if (scr_debug_keycheck(vk_f3))
        scr_raise_party();
    if (scr_debug_keycheck(vk_f5))
        scr_wincombat();
    if (scr_debug_keycheck(vk_f6))
        scr_weaken_enemies();
    if (scr_debug_keycheck(vk_f8))
        scr_weaken_party(true);
    if (scr_debug_keycheck(vk_f9))
    {
        global.tension = 0;
        scr_debug_print("TP set to 0%");
    }
    if (scr_debug_keycheck(vk_f10))
    {
        global.tension = 250;
        scr_debug_print("TP maxed out!!");
    }
}
var dolose = false;
if (scr_debug())
{
    if (keyboard_check_pressed(vk_f11))
        dolose = true;
}
if (global.chapter == 3)
{
    if (room == room_board_1 || room == room_board_2 || room == room_board_3)
    {
        if (dolose || (global.mnfight == 2 && global.hp[1] < 1 && global.hp[2] < 1 && global.hp[3] < 1 && boardend == 0))
        {
            with (obj_heroparent)
                sprite_index = defeatsprite;
            global.specialbattle = 3;
            boardend = 1;
            alarm[11] = 1;
            with (obj_dmgwriter)
                instance_destroy();
        }
    }
}

enum UnknownEnum
{
    Value_0
}
