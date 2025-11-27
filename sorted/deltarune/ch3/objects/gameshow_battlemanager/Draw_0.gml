if (i_ex(obj_battlecontroller))
{
    battleseconds = obj_battlecontroller.battleseconds;
    battleminutes = obj_battlecontroller.battleminutes;
}
if (con == 3)
{
    if (!updatehealth)
    {
        updatehealth = 1;
        scr_board_boardhealth();
    }
    draw_set_alpha(0.8);
    draw_set_color(c_black);
    ossafe_fill_rectangle(0, 0, 640, 480, 0);
    draw_set_color(c_white);
    draw_set_alpha(1);
    if (rcon == 0)
    {
        var dingtime = 10;
        var rep = 1;
        if (button1_h() || button3_h())
            rep = 5;
        repeat (rep)
        {
            if (!i_ex(obj_battleback))
                rtimer++;
            if (rtimer == (dingtime * 1) || rtimer == (dingtime * 2) || rtimer == (dingtime * 3) || rtimer == (dingtime * 4) || rtimer == (dingtime * 5))
                snd_play(snd_board_text_main);
            if (rtimer == (dingtime * 7))
                snd_play(snd_board_text_main_end);
        }
        if (rtimer >= (dingtime * 7))
        {
            if (button1_p())
            {
                con++;
                global.interact = 0;
                with (obj_mainchara_board)
                {
                    for (var i = 0; i < array_length(other.remmove); i++)
                    {
                        if (other.remmove[i][0] == name)
                            canfreemove = other.remmove[i][1];
                    }
                }
                scr_board_forcethrow();
                global.flag[1116] += real(totalstring);
            }
        }
        var timegradeblend = 255;
        var tpgradeblend = 8421504;
        var damagegradeblend = 255;
        var lettergradeblend = 255;
        var sectotal = battleseconds + (battleminutes * 60);
        var rank1time = global.rank1time;
        var rank1turns = global.rank1turns;
        var rank1tp = global.rank1tp;
        var timerank = 5;
        var tprank = 5;
        var damagerank = 5;
        var timegrade = stringsetloc("BAD CAR!", "obj_gameshow_battlemanager_slash_Draw_0_gml_82_0");
        if (turns > (rank1turns + 3) && turns <= (rank1turns + 10))
        {
            timegrade = stringsetloc("VERY SLOW!", "obj_gameshow_battlemanager_slash_Draw_0_gml_83_0");
            timegradeblend = 255;
        }
        if (turns <= (rank1turns + 3))
        {
            timegrade = stringsetloc("KINDA SLOW!", "obj_gameshow_battlemanager_slash_Draw_0_gml_84_0");
            timegradeblend = 16711935;
            timerank = 4;
        }
        if (turns <= (rank1turns + 2))
        {
            timegrade = stringsetloc("B! NOT BAD!", "obj_gameshow_battlemanager_slash_Draw_0_gml_85_0");
            timegradeblend = 65280;
            timerank = 3;
        }
        if (turns <= (rank1turns + 1))
        {
            timegrade = stringsetloc("A! AWESOME!", "obj_gameshow_battlemanager_slash_Draw_0_gml_86_0");
            timegradeblend = 16777215;
            timerank = 2;
        }
        if (turns <= rank1turns)
        {
            timegrade = stringsetloc("S! PERFECT!", "obj_gameshow_battlemanager_slash_Draw_0_gml_87_0");
            timegradeblend = 65535;
            timerank = 1;
        }
        var tpgrade = stringsetloc("SMALL NOSE!", "obj_gameshow_battlemanager_slash_Draw_0_gml_91_0");
        if (tpgained > (rank1tp * 0.2))
        {
            tpgrade = stringsetloc("SO THIRSTY!", "obj_gameshow_battlemanager_slash_Draw_0_gml_92_0");
            tpgradeblend = 16711935;
            tprank = 4;
        }
        if (tpgained > (rank1tp * 0.5))
        {
            tpgrade = stringsetloc("B! NOT BAD!", "obj_gameshow_battlemanager_slash_Draw_0_gml_93_0");
            tpgradeblend = 65280;
            tprank = 3;
        }
        if (tpgained > (rank1tp * 0.85))
        {
            tpgrade = stringsetloc("A! AWESOME!", "obj_gameshow_battlemanager_slash_Draw_0_gml_94_0");
            tpgradeblend = 16777215;
            tprank = 2;
        }
        if (tpgained > (rank1tp * 0.95))
        {
            tpgrade = stringsetloc("S! PERFECT!", "obj_gameshow_battlemanager_slash_Draw_0_gml_95_0");
            tpgradeblend = 65535;
            tprank = 1;
        }
        var _hitcount = hitcount;
        if (global.rank1hurtcount != 0)
        {
            _hitcount -= global.rank1hurtcount;
            if (_hitcount < 0)
                _hitcount = 0;
        }
        var damagegrade = stringsetloc("SALESMAN", "obj_gameshow_battlemanager_slash_Draw_0_gml_98_0");
        if (_hitcount > 7 || _hitcount < 20)
        {
            damagegrade = stringsetloc("BIG OUCH!", "obj_gameshow_battlemanager_slash_Draw_0_gml_99_0");
            damagegradeblend = 8421504;
        }
        if (_hitcount == 6 || _hitcount == 7)
        {
            damagegrade = stringsetloc("OUCH!", "obj_gameshow_battlemanager_slash_Draw_0_gml_100_0");
            damagegradeblend = 16711935;
            damagerank = 4;
        }
        if (_hitcount == 3 || _hitcount == 4 || _hitcount == 5)
        {
            damagegrade = stringsetloc("B! NOT BAD!", "obj_gameshow_battlemanager_slash_Draw_0_gml_101_0");
            damagegradeblend = 65280;
            damagerank = 3;
        }
        if (_hitcount == 1 || _hitcount == 2)
        {
            damagegrade = stringsetloc("A! AWESOME!", "obj_gameshow_battlemanager_slash_Draw_0_gml_102_0");
            damagegradeblend = 16777215;
            damagerank = 2;
        }
        if (_hitcount == 0)
        {
            damagegrade = stringsetloc("S! PERFECT!", "obj_gameshow_battlemanager_slash_Draw_0_gml_103_0");
            damagegradeblend = 65535;
            damagerank = 1;
        }
        if (turns <= rank1turns && _hitcount == 0 && tpgained > (rank1tp * 0.95))
        {
            timegrade = stringsetloc("T!ULTIMATE!", "obj_gameshow_battlemanager_slash_Draw_0_gml_88_0");
            timegradeblend = 4235519;
            timerank = 1;
            tpgrade = stringsetloc("T!ULTIMATE!", "obj_gameshow_battlemanager_slash_Draw_0_gml_106_0");
            tpgradeblend = 4235519;
            tprank = 1;
            damagegrade = stringsetloc("T!ULTIMATE!", "obj_gameshow_battlemanager_slash_Draw_0_gml_108_0");
            damagegradeblend = 4235519;
            damagerank = 1;
        }
        var graderank = (timerank + tprank + damagerank) / 3;
        lettergrade = "Z";
        if (graderank > 3.4 && graderank < 4)
        {
            lettergrade = "C";
            lettergradeblend = 16711935;
        }
        if (graderank > 2.4 && graderank <= 3.4)
        {
            lettergrade = "B";
            lettergradeblend = 65280;
        }
        if (graderank > 1.4 && graderank <= 2.4)
        {
            lettergrade = "A";
            lettergradeblend = 16777215;
        }
        if (graderank > 1 && graderank <= 1.4)
        {
            lettergrade = "S";
            lettergradeblend = 65535;
        }
        if (graderank <= 1)
        {
            lettergrade = "T";
            lettergradeblend = 4235519;
        }
        draw_set_font(fnt_8bit);
        hitbonustxt = stringsetloc("HIT BONUS:", "obj_gameshow_battlemanager_slash_Draw_0_gml_131_0");
        hitcounttxt = stringsetloc("HURT", "obj_gameshow_battlemanager_slash_Draw_0_gml_132_0");
        battletimetxt = stringsetloc("TURNS:", "obj_gameshow_battlemanager_slash_Draw_0_gml_133_0");
        timebonustxt = stringsetloc("TIME BONUS:", "obj_gameshow_battlemanager_slash_Draw_0_gml_134_0");
        tensionbonustxt = stringsetloc("TP", "obj_gameshow_battlemanager_slash_Draw_0_gml_135_0");
        totalbonustxt = stringsetloc("POINTS", "obj_gameshow_battlemanager_slash_Draw_0_gml_136_0");
        totalstring = round((5 - graderank) * 100 * 0.8);
        yougetstring = stringsetloc("YOU GET", "obj_gameshow_battlemanager_slash_Draw_0_gml_138_0");
        rankstring = stringsetloc("RANK", "obj_gameshow_battlemanager_slash_Draw_0_gml_139_0");
        var mspace = 24;
        var hspace = 8;
        var _xx = 360;
        var _yy = 104;
        draw_set_valign(fa_top);
        draw_sprite_ext(spr_shopicon, 0, _xx - 162, _yy + (-1 * mspace), -2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_shopicon, 0, _xx + 80, _yy + (-1 * mspace), 2, 2, 0, c_white, 1);
        draw_text(_xx - 150, _yy + (-1 * mspace) + 5, stringsetloc("BATTLE RESULTS", "obj_gameshow_battlemanager_slash_Draw_0_gml_148_0"));
        if (rtimer > (dingtime * 1))
            draw_text(_xx - 206, (_yy - 1) + (1 * mspace), stringsetloc("TURNS", "obj_gameshow_battlemanager_slash_Draw_0_gml_151_0"));
        draw_set_halign(fa_right);
        if (rtimer > (dingtime * 1))
            draw_text(_xx - 65, _yy + (1 * mspace), turns);
        if (rtimer > (dingtime * 2))
            draw_text(_xx - 65, _yy + (2 * mspace), string(hitcount) + "X");
        var tensionfinal = round(tpgained / 2.5);
        if (tensionfinal > 100)
            tensionfinal = 100;
        if (rtimer > (dingtime * 3))
            draw_text(_xx - 65, _yy + (3 * mspace), string(tensionfinal));
        if (rtimer > (dingtime * 1))
        {
            draw_text_color(_xx + 120, _yy + (1 * mspace), timegrade, timegradeblend, timegradeblend, timegradeblend, timegradeblend, 1);
            if (timegradeblend == 16777215 || timegradeblend == 65535 || timegradeblend == 4235519 || timegradeblend == 65280)
                draw_sprite_ext(spr_board_battle_results_exclamation, 0, _xx + 120, _yy + (1 * mspace), 2, 2, 0, c_white, 1);
        }
        if (rtimer > (dingtime * 2))
        {
            draw_text_color(_xx + 120, _yy + (2 * mspace), damagegrade, damagegradeblend, damagegradeblend, damagegradeblend, damagegradeblend, 1);
            if (damagegradeblend == 16777215 || damagegradeblend == 65535 || damagegradeblend == 4235519 || damagegradeblend == 65280)
                draw_sprite_ext(spr_board_battle_results_exclamation, 0, _xx + 120, _yy + (2 * mspace), 2, 2, 0, c_white, 1);
        }
        if (rtimer > (dingtime * 3))
        {
            draw_text_color(_xx + 120, _yy + (3 * mspace), tpgrade, tpgradeblend, tpgradeblend, tpgradeblend, tpgradeblend, 1);
            if (tpgradeblend == 16777215 || tpgradeblend == 65535 || tpgradeblend == 4235519 || tpgradeblend == 65280)
                draw_sprite_ext(spr_board_battle_results_exclamation, 0, _xx + 120, _yy + (3 * mspace), 2, 2, 0, c_white, 1);
        }
        draw_set_halign(fa_left);
        if (rtimer > (dingtime * 2))
            draw_text(_xx - 205, _yy + (2 * mspace), hitcounttxt);
        if (rtimer > (dingtime * 3))
            draw_text(_xx - 205, _yy + (3 * mspace), tensionbonustxt);
        draw_set_halign(fa_right);
        if (rtimer > (dingtime * 4))
            draw_text(_xx - 50, _yy + (4.5 * mspace) + 30, yougetstring);
        draw_set_halign(fa_center);
        if (rtimer > (dingtime * 4))
            draw_text_transformed_color(_xx - 25, _yy + (4 * mspace) + 28, lettergrade, 2, 2, 0, lettergradeblend, lettergradeblend, lettergradeblend, lettergradeblend, 1);
        draw_set_halign(fa_left);
        if (rtimer > (dingtime * 4))
            draw_text(_xx - 0, _yy + (4.5 * mspace) + 30, rankstring);
        draw_set_halign(fa_center);
        if (rtimer > (dingtime * 5))
            draw_text(_xx - 30, _yy + (6.5 * mspace) + 8, "+" + string(totalstring) + " " + totalbonustxt);
        draw_set_halign(fa_left);
        if (rtimer > ((dingtime * 6) + 10))
        {
            reachedend_draw_triangle_siner++;
            if (reachedend_draw_triangle_siner < 20)
                draw_sprite_ext(spr_custommenu_arrow_nooutline, 0, board_tilex(11.5), board_tiley(7.5), 2, 2, 0, c_white, 1);
            if (reachedend_draw_triangle_siner >= 30)
                reachedend_draw_triangle_siner = 0;
        }
    }
}
