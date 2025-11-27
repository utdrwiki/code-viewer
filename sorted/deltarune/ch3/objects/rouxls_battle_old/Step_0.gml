if (oopsallacts == 1)
{
    with (obj_rouxls_ch3_enemy)
        dancecon = 1;
    if (spadebuttonenabled == true)
    {
        selnoise = 0;
        if (obj_rouxls_ch3_enemy.phase == 1)
        {
            if ((spadebuttoncount == 1 && global.bmenucoord[0][global.charturn] == 0) || (spadebuttoncount == 2 && global.bmenucoord[0][global.charturn] == 1) || (spadebuttoncount == 3 && global.bmenucoord[0][global.charturn] == 2) || (spadebuttoncount == 4 && global.bmenucoord[0][global.charturn] == 3) || (spadebuttoncount == 5 && global.bmenucoord[0][global.charturn] == 4))
            {
                with (obj_rouxls_ch3_enemy)
                    spadepower++;
                snd_play(snd_coin);
            }
            else
            {
                snd_play(snd_error);
            }
        }
        if (obj_rouxls_ch3_enemy.phase == 2)
        {
            if ((spadebuttoncount == 1 && global.bmenucoord[0][global.charturn] == 0) || (spadebuttoncount == 2 && global.bmenucoord[0][global.charturn] == 1) || (spadebuttoncount == 3 && global.bmenucoord[0][global.charturn] == 2) || (spadebuttoncount == 4 && global.bmenucoord[0][global.charturn] == 3) || (spadebuttoncount == 5 && global.bmenucoord[0][global.charturn] == 4))
            {
                with (obj_rouxls_ch3_enemy)
                    spadepower++;
                snd_play(snd_coin);
            }
            else if ((heartbuttoncount == 1 && global.bmenucoord[0][global.charturn] == 0) || (heartbuttoncount == 2 && global.bmenucoord[0][global.charturn] == 1) || (heartbuttoncount == 3 && global.bmenucoord[0][global.charturn] == 2) || (heartbuttoncount == 4 && global.bmenucoord[0][global.charturn] == 3) || (heartbuttoncount == 5 && global.bmenucoord[0][global.charturn] == 4))
            {
                with (obj_writer)
                    instance_destroy();
                var healamount = 30;
                if (global.tension < 16)
                {
                    msgsetloc(0, "* Healed with Heart!/%", "obj_rouxls_battle_old_slash_Step_0_gml_43_0");
                }
                else
                {
                    healamount = 60;
                    msgsetloc(0, "* Used TP to heal with Heart!/%", "obj_rouxls_battle_old_slash_Step_0_gml_48_0");
                }
                scr_battletext_default();
                var healtarget = 0;
                if (global.hp[1] < 1)
                {
                    scr_heal(0, healamount);
                }
                else if (global.hp[2] < 1)
                {
                    scr_heal(1, healamount);
                    healtarget = 1;
                }
                else if (global.hp[3] < 1)
                {
                    scr_heal(2, healamount);
                    healtarget = 2;
                }
                else
                {
                    healtarget = global.charturn;
                    scr_heal(global.charturn, healamount);
                }
                ha = instance_create(global.charinstance[healtarget].x, global.charinstance[healtarget].y, obj_healanim);
                ha.target = global.charinstance[healtarget].id;
                dmgwr = instance_create(global.charinstance[healtarget].x, (global.charinstance[healtarget].y + global.charinstance[healtarget].myheight) - 24, obj_dmgwriter);
                with (dmgwr)
                {
                    delay = 8;
                    type = 3;
                    damage = healamount;
                }
                if (global.hp[global.char[global.charinstance[healtarget].myself]] >= global.maxhp[global.char[global.charinstance[healtarget].myself]])
                {
                    with (dmgwr)
                        specialmessage = 3;
                }
            }
            else if ((rouxlsbuttoncount == 1 && global.bmenucoord[0][global.charturn] == 0) || (rouxlsbuttoncount == 2 && global.bmenucoord[0][global.charturn] == 1) || (rouxlsbuttoncount == 3 && global.bmenucoord[0][global.charturn] == 2) || (rouxlsbuttoncount == 4 && global.bmenucoord[0][global.charturn] == 3) || (rouxlsbuttoncount == 5 && global.bmenucoord[0][global.charturn] == 4))
            {
                with (obj_writer)
                    instance_destroy();
                msgsetloc(0, "* Diamond powers up foes!/%", "obj_rouxls_battle_old_slash_Step_0_gml_80_0");
                scr_battletext_default();
                if (i_ex(obj_rouxls_ch3_enemy))
                    obj_rouxls_ch3_enemy.powerup = true;
                snd_play(snd_error);
            }
            else
            {
                with (obj_writer)
                    instance_destroy();
                msgsetloc(0, "* ACT was useless!/%", "obj_rouxls_battle_old_slash_Step_0_gml_90_0");
                scr_battletext_default();
                snd_play(snd_error);
            }
        }
        if (obj_rouxls_ch3_enemy.phase == 3)
        {
            if ((spadebuttoncount == 1 && global.bmenucoord[0][global.charturn] == 0) || (spadebuttoncount == 2 && global.bmenucoord[0][global.charturn] == 1) || (spadebuttoncount == 3 && global.bmenucoord[0][global.charturn] == 2) || (spadebuttoncount == 4 && global.bmenucoord[0][global.charturn] == 3) || (spadebuttoncount == 5 && global.bmenucoord[0][global.charturn] == 4))
            {
                with (obj_rouxls_ch3_enemy)
                    spadepower++;
                snd_play(snd_coin);
            }
            else
            {
                msgsetloc(0, "* Diamond powers up foes!/%", "obj_rouxls_battle_old_slash_Step_0_gml_110_0");
                scr_battletext_default();
                if (i_ex(obj_rouxls_ch3_enemy))
                    obj_rouxls_ch3_enemy.powerup = true;
                snd_play(snd_error);
            }
        }
    }
    global.bmenuno = 0;
    scr_nexthero();
    exit;
}
