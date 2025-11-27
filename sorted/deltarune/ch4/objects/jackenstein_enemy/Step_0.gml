if (init == false)
{
    init = true;
    with (obj_heroparent)
        visible = false;
}
if (scr_debug() && keyboard_check_pressed(ord("T")))
{
    phaseturn = 8;
    scr_debug_print("phaseturn = " + string(phaseturn));
}
if (i_ex(obj_battlecontroller) && obj_battlecontroller.victory == 1 && obj_battlecontroller.victoried == 0)
{
    with (susiemarker)
        instance_destroy();
    with (ralseimarker)
        instance_destroy();
    x = -9999;
    y = -9999;
    with (obj_npc_jackenstein)
        visible = true;
    if (fader != -1 && i_ex(fader))
    {
        with (fader)
        {
            scr_script_delayed(scr_lerp_var_instance, 45, id, "image_alpha", 1, 0, 30);
            scr_script_delayed(scr_doom, 45, id, 30, true);
        }
    }
    global.charinstance[0].x = 2256;
    global.charinstance[0].y = 1961;
    global.charinstance[1].x = 2208;
    global.charinstance[1].y = 1945;
    global.charinstance[2].x = 2172;
    global.charinstance[2].y = 1950;
    with (obj_afterimage)
        instance_destroy();
    with (obj_battlecontroller)
        dancing_jackolantern_con = 0;
    if (i_ex(obj_ch4_DCA08D))
    {
        with (obj_ch4_DCA08D.jackenstein)
            stopdrawing = true;
    }
    obj_battlecontroller.skipvictory = 1;
    global.flag[39] = 1;
    global.turntimer = 0;
    with (obj_lightsource_heartlight)
        instance_destroy();
}
if (global.monster[myself] == 1)
{
    if (scr_isphase("enemytalk") && talked == 0 && global.monsterhp[myself] <= 1)
    {
        talked = -1;
        endcon = 1;
        end_cutscene_version = 1;
    }
    if (scr_isphase("enemytalk") && talked == 0)
    {
        rs_rand = choose(0, 1, 2, 3, 4);
        scr_randomtarget();
        if (!instance_exists(obj_darkener))
        {
            if (unleash == 1)
                myattackchoice = 9;
            else
                event_user(0);
            instance_create(0, 0, obj_darkener);
            fun = 0;
            global.typer = 88;
            var rand = choose(0, 1);
            if (rand == 0)
                msgsetloc(0, "GO... BACK.../%", "obj_jackenstein_enemy_slash_Step_0_gml_72_0");
            if (rand == 1)
                msgsetloc(0, "DARK ZONE!&BABY YEAH!/%", "obj_jackenstein_enemy_slash_Step_0_gml_73_0");
            if (unleashfirstused == 0 || myattackchoice == 9)
            {
                if (myattackchoice == 0)
                {
                    msgsetloc(0, "... GHO HO HO...&THERE'S NO ESCAIPE&FROM THE [DARK ZONE]/%", "obj_jackenstein_enemy_slash_Step_0_gml_77_0");
                    ballooncon = 1;
                    balloonend = 0;
                }
                else if (myattackchoice == 1)
                {
                    msgsetloc(0, "...GO BACK...&... YOUR TAKING...&TOO LONG.../%", "obj_jackenstein_enemy_slash_Step_0_gml_78_0");
                    ballooncon = 2;
                    balloonend = 0;
                }
                else if (myattackchoice == 2)
                {
                    msgsetloc(0, "WHAT THE HEACK&WAS THAT PUMKIN&THAT WAS SCAIRY!!!/%", "obj_jackenstein_enemy_slash_Step_0_gml_79_0");
                    ballooncon = 2.5;
                    balloonend = 0;
                }
                else if (myattackchoice == 3)
                {
                    msgsetloc(0, "OH NO!!! I CAN'T&FIND MY PUMKIN...!!&BUT MAYBE...&IT WILL FIND.../%", "obj_jackenstein_enemy_slash_Step_0_gml_80_0");
                    ballooncon = 3;
                    balloonend = 0;
                }
                else if (myattackchoice == 4)
                {
                    msgsetloc(0, "GO... BACK...&BEFORE LONG.../%", "obj_jackenstein_enemy_slash_Step_0_gml_81_0");
                    ballooncon = 4;
                    balloonend = 0;
                }
                else if (myattackchoice == 5)
                {
                    msgsetloc(0, "YOU DIDN'T GO BACK/%", "obj_jackenstein_enemy_slash_Step_0_gml_82_0");
                    ballooncon = 5;
                    balloonend = 0;
                }
                else if (myattackchoice == 6)
                {
                    msgsetloc(0, "NO MOIRE MISTER&NAICE GUIY.../%", "obj_jackenstein_enemy_slash_Step_0_gml_83_0");
                    ballooncon = 6;
                    balloonend = 0;
                }
                else if (myattackchoice == 7)
                {
                    msgsetloc(0, "ENOUGH!!! MY&PATIANCE RUNS THIN/%", "obj_jackenstein_enemy_slash_Step_0_gml_84_0");
                    ballooncon = 9;
                    balloonend = 0;
                }
                else if (myattackchoice == 8)
                {
                    msgsetloc(0, "... FOOL THAT YOU ARE...&YOU REALIZE NOT WHAT&FRAIGHTFUL FOARCES&AWAIT YOU.../%", "obj_jackenstein_enemy_slash_Step_0_gml_85_0");
                    ballooncon = 10;
                    balloonend = 0;
                }
                else if (myattackchoice == 10 && finalattackballoon == 0)
                {
                    msgsetloc(0, "YOAR STILL HEAR...?&INTERESTING.../%", "obj_jackenstein_enemy_slash_Step_0_gml_86_0");
                    ballooncon = 12;
                    balloonend = 0;
                    finalattackballoon = 1;
                }
                else if (myattackchoice == 10 && finalattackballoon == 1)
                {
                    msgsetloc(0, "FINE... BE TRAPPED&IN THE [DARK ZONE]...&FOAREVER!!!/%", "obj_jackenstein_enemy_slash_Step_0_gml_87_0");
                    ballooncon = 0;
                    balloonend = 1;
                }
                else if (myattackchoice == 9)
                {
                    unleashcount++;
                    if (unleashcount == 1)
                    {
                        msgsetloc(0, "YOU DAIRE BRING&LAIGHTS TO MY&LAIRE!? HA HA.../%", "obj_jackenstein_enemy_slash_Step_0_gml_92_0");
                        ballooncon = 13;
                        balloonend = 0;
                        unleashfirstused = 1;
                    }
                    if (unleashcount == 2)
                    {
                        msgsetloc(0, "NO!!! NOT THE&LAIGHT!!! IT&BURNS!!!/%", "obj_jackenstein_enemy_slash_Step_0_gml_93_0");
                        ballooncon = 15;
                        balloonend = 0;
                    }
                    if (unleashcount == 3)
                    {
                        msgsetloc(0, "NO!!! THE LAIGHT!!&DON'T BROING IT&CLOASE TO MY FAICE!!!/%", "obj_jackenstein_enemy_slash_Step_0_gml_94_0");
                        ballooncon = 0;
                        balloonend = 1;
                    }
                    if (unleashcount > 3)
                    {
                        msgsetloc(0, "NO!!! NOT THE&LAIGHT!!!/%", "obj_jackenstein_enemy_slash_Step_0_gml_95_0");
                        ballooncon = 0;
                        balloonend = 1;
                    }
                }
            }
            else
            {
                msgsetloc(0, "NO!!! THE LAIGHT!!!&IT HAS EFFECTS&ON ME!!!/%", "obj_jackenstein_enemy_slash_Step_0_gml_98_0");
                ballooncon = 17;
                balloonend = 0;
                unleashfirstused = 0;
            }
            unleash = 0;
            if (ralseitalks == 1 && instance_exists(obj_heroralsei))
            {
                global.typer = 74;
                scr_enemyblcon(obj_heroralsei.x + 75, obj_heroralsei.y + 15, 7);
                scr_guardpeek(obj_heroralsei);
            }
            else if (susietalks == 1 && instance_exists(obj_herosusie))
            {
                global.typer = 75;
                scr_enemyblcon(obj_herosusie.x + 75, obj_herosusie.y + 15, 7);
                scr_guardpeek(obj_herosusie);
            }
            else
            {
                scr_enemyblcon(x, global.monstery[myself] - 20, 10);
            }
            ralseitalks = 0;
            susietalks = 0;
            if (ballooncon == 0)
            {
                talked = 0.5;
                talktimer = 0;
            }
            else
            {
                talked = 0.6;
                talktimer = 0;
            }
            rtimer = 0;
        }
    }
    if (talked == 0.5)
    {
        talktimer++;
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            alarm[6] = 1;
        }
    }
    if (talked == 0.6)
    {
        talktimer++;
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            if (ballooncon == 1)
            {
                msgsetloc(0, "UNLESS... &YOU LEAVE/%", "obj_jackenstein_enemy_slash_Step_0_gml_141_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 2)
            {
                msgsetloc(0, "YOUR TAKING...&TOO LONG...!!!/%", "obj_jackenstein_enemy_slash_Step_0_gml_142_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 2.5)
            {
                msgsetloc(0, "JUST KIDDING &THAT WAS MINE :)/%", "obj_jackenstein_enemy_slash_Step_0_gml_143_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 3)
            {
                msgsetloc(0, "... YOU/%", "obj_jackenstein_enemy_slash_Step_0_gml_144_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 4)
            {
                msgsetloc(0, "... GO BACK!!!&BEFORE LONG!!!/%", "obj_jackenstein_enemy_slash_Step_0_gml_145_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 5)
            {
                msgsetloc(0, ":(/%", "obj_jackenstein_enemy_slash_Step_0_gml_146_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 6)
            {
                msgsetloc(0, "INSTEAD./%", "obj_jackenstein_enemy_slash_Step_0_gml_147_0");
                ballooncon = 7;
                balloonend = 0;
            }
            else if (ballooncon == 7)
            {
                msgsetloc(0, "MR. VERY&NAICE GUY/%", "obj_jackenstein_enemy_slash_Step_0_gml_148_0");
                ballooncon = 8;
                balloonend = 0;
            }
            else if (ballooncon == 8)
            {
                msgsetloc(0, "LEAVE :)/%", "obj_jackenstein_enemy_slash_Step_0_gml_149_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 9)
            {
                msgsetloc(0, "NO MORE KEYS!!!&DRESS IN HUMILIATION/%", "obj_jackenstein_enemy_slash_Step_0_gml_150_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 10)
            {
                msgsetloc(0, "TONAIGHT, ON THE MOST&HAUNTED OF NAIGHTS...&I SHALL INFLICT YOU WITH&MY GRAITEST CURSE.../%", "obj_jackenstein_enemy_slash_Step_0_gml_151_0");
                ballooncon = 11;
                balloonend = 0;
            }
            else if (ballooncon == 11)
            {
                msgsetloc(0, "THE SAME THING I WAS&USING THE WHOLE TIME/%", "obj_jackenstein_enemy_slash_Step_0_gml_152_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 12)
            {
                msgsetloc(0, "INTERESTING...&BUT IT SUCKS... :(/%", "obj_jackenstein_enemy_slash_Step_0_gml_153_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 13)
            {
                msgsetloc(0, "IN THIS PLAICE&OF TRUE DARK.../%", "obj_jackenstein_enemy_slash_Step_0_gml_154_0");
                ballooncon = 14;
                balloonend = 0;
            }
            else if (ballooncon == 14)
            {
                msgsetloc(0, "LAIGHT HAS NO&AFFECT ON ME!!!/%", "obj_jackenstein_enemy_slash_Step_0_gml_155_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 15)
            {
                msgsetloc(0, "TO THINK MY&OWN PELLETS&WOULD BE USED&AGAINST ME/%", "obj_jackenstein_enemy_slash_Step_0_gml_156_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 17)
            {
                msgsetloc(0, "STOP USING THAT!!!&TEARRIBLE!!!&GO TO [DARK]!!!/%", "obj_jackenstein_enemy_slash_Step_0_gml_157_0");
                ballooncon = 0;
                balloonend = 1;
            }
            talked = 0.7;
            global.typer = 88;
            if (ralseitalks == 1 && instance_exists(obj_heroralsei))
            {
                global.typer = 74;
                scr_heroblcon("ralsei");
                scr_guardpeek(obj_heroralsei);
            }
            else if (susietalks == 1 && instance_exists(obj_herosusie))
            {
                global.typer = 75;
                scr_heroblcon("susie");
                scr_guardpeek(obj_herosusie);
            }
            else
            {
                scr_enemyblcon(x, global.monstery[myself] - 20, 10);
            }
            ralseitalks = 0;
            susietalks = 0;
            alarm[6] = 1;
        }
    }
    if (talked == 1 && scr_isphase("enemytalk") && !i_ex(obj_writer))
    {
        if (flashcon == 0)
        {
            fadeaway = 1;
            flashcon = 1;
            flashtimer = 14;
            image_alpha = 0;
            with (obj_afterimage)
                instance_destroy();
        }
        if (flashtimer == 1)
            global.mnfight = 1.5;
    }
    if (global.mnfight == 1.5)
    {
        if (!instance_exists(obj_growtangle))
        {
            if (myattackchoice == 0)
                instance_create((__view_get(e__VW.XView, 0) + 320) - 112, __view_get(e__VW.YView, 0) + 170 + 21, obj_growtangle);
            if (myattackchoice == 1)
                instance_create(__view_get(e__VW.XView, 0) + 320 + 92, __view_get(e__VW.YView, 0) + 170 + 28, obj_growtangle);
            if (myattackchoice == 2)
                instance_create((__view_get(e__VW.XView, 0) + 320) - 5, (__view_get(e__VW.YView, 0) + 170) - 5, obj_growtangle);
            if (myattackchoice == 3)
                instance_create(__view_get(e__VW.XView, 0) + 320 + 92, __view_get(e__VW.YView, 0) + 170 + 64, obj_growtangle);
            if (myattackchoice == 4)
                instance_create((__view_get(e__VW.XView, 0) + 320) - 5, __view_get(e__VW.YView, 0) + 170 + 90, obj_growtangle);
            if (myattackchoice == 5)
                instance_create((__view_get(e__VW.XView, 0) + 320) - 109, __view_get(e__VW.YView, 0) + 170 + 83, obj_growtangle);
            if (myattackchoice == 6)
                instance_create(__view_get(e__VW.XView, 0) + 320 + 70, __view_get(e__VW.YView, 0) + 170 + 61, obj_growtangle);
            if (myattackchoice == 7)
                instance_create(__view_get(e__VW.XView, 0) + 320 + 95, __view_get(e__VW.YView, 0) + 170 + 55, obj_growtangle);
            if (myattackchoice == 8)
                instance_create((__view_get(e__VW.XView, 0) + 320) - 161, __view_get(e__VW.YView, 0) + 170 + 101, obj_growtangle);
            if (myattackchoice == 9)
                instance_create(__view_get(e__VW.XView, 0) + 320, __view_get(e__VW.YView, 0) + 170 + 90, obj_growtangle);
            if (myattackchoice == 10)
                instance_create(__view_get(e__VW.XView, 0) + 320, __view_get(e__VW.YView, 0) + 170 + 24, obj_growtangle);
        }
        with (obj_growtangle)
        {
            visible = false;
            image_xscale = 2;
            image_yscale = 2;
            image_alpha = 1;
            depth = 15;
            timer = 15;
        }
        instance_create_depth(0, 0, -15, obj_ghosthouse_fadein);
        obj_growtangle.visible = false;
        if (!instance_exists(obj_moveheart) && !i_ex(obj_heart))
            scr_moveheart();
        with (obj_growtangle)
        {
            image_xscale = 2;
            image_yscale = 2;
            timer = maxtimer;
            x = __view_get(e__VW.XView, 0) + 320;
            y = __view_get(e__VW.YView, 0) + 170;
        }
        global.mnfight = 2;
        scr_turntimer(90);
    }
    if (scr_isphase("bullets") && attacked == 0)
    {
        rtimer += 1;
        if (rtimer == 8)
        {
            with (obj_darkness_overlay)
                scr_lerpvar("fade_in", 1, 0.75, 30, 1, "out");
            with (obj_lightsource_heartlight)
            {
                current_radius = 0;
                if (other.ract)
                {
                    radius += 10;
                    biggerrad += 12;
                }
            }
            if (myattackchoice == 0)
            {
                global.monsterattackname[myself] = "jack 1";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 146;
            }
            else if (myattackchoice == 1)
            {
                global.monsterattackname[myself] = "jack 2";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 147;
            }
            else if (myattackchoice == 2)
            {
                global.monsterattackname[myself] = "jack 3";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 151;
            }
            else if (myattackchoice == 3)
            {
                global.monsterattackname[myself] = "jack 4";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 150;
            }
            else if (myattackchoice == 4)
            {
                global.monsterattackname[myself] = "jack 5";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 148;
            }
            else if (myattackchoice == 5)
            {
                global.monsterattackname[myself] = "jack 6";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 153;
            }
            else if (myattackchoice == 6)
            {
                global.monsterattackname[myself] = "jack 7";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 149;
            }
            else if (myattackchoice == 7)
            {
                global.monsterattackname[myself] = "jack 8";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 152;
            }
            else if (myattackchoice == 8)
            {
                global.monsterattackname[myself] = "jack 9";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 154;
            }
            else if (myattackchoice == 9)
            {
                global.monsterattackname[myself] = "jack lightup";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 155;
            }
            else if (myattackchoice == 10)
            {
                global.monsterattackname[myself] = "jack 10";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 156;
            }
            scr_turntimer(200);
            turns += 1;
            global.typer = 6;
            global.fc = 0;
            rr = choose(0, 1, 2, 3, 4, 5, 6, 7);
            if (rr == 0)
                global.battlemsg[0] = stringsetloc("* You are in the DARK ZONE.", "obj_jackenstein_enemy_slash_Step_0_gml_307_0");
            if (rr == 1)
                global.battlemsg[0] = stringsetloc("* Everything seems OK.", "obj_jackenstein_enemy_slash_Step_0_gml_308_0");
            if (rr == 2)
                global.battlemsg[0] = stringsetloc("* Too dark to see near the walls.", "obj_jackenstein_enemy_slash_Step_0_gml_309_0");
            if (rr == 3)
                global.battlemsg[0] = stringsetloc("* Too dark to see near the walls.&* There's a pit here!", "obj_jackenstein_enemy_slash_Step_0_gml_310_0");
            if (rr == 4)
            {
                var small_text = stringsetloc("K... Kris?", "obj_jackenstein_enemy_slash_Step_0_gml_313_0");
                scr_smallface(0, "ralsei", 13, "right", "bottom", small_text);
                var _str1 = "";
                if (global.hp[3] > 0)
                    _str1 = "\\f0";
                global.battlemsg[0] = stringsetsubloc("* Too dark to see near the walls.&* There's something fluffy in here!~1", _str1, "obj_jackenstein_enemy_slash_Step_0_gml_316_0");
            }
            if (rr == 5)
            {
                var small_text = stringsetloc("That's ME, dumbass!", "obj_jackenstein_enemy_slash_Step_0_gml_321_0");
                var loc = ["right", "bottom"];
                if (global.lang == "ja")
                    loc[0] = 380;
                scr_smallface(0, "susie", 5, loc[0], loc[1], small_text);
                var _str2 = "";
                if (global.hp[2] > 0)
                    _str2 = "\\f0";
                global.battlemsg[0] = stringsetsubloc("* Too dark to see near the walls.&* There's something very Susie-like in here!~1", _str2, "obj_jackenstein_enemy_slash_Step_0_gml_323_0");
            }
            if (rr == 6)
                global.battlemsg[0] = stringsetloc("* Too dark to see near the walls.&* There's a texture of a dog playing maracas in here!", "obj_jackenstein_enemy_slash_Step_0_gml_325_0");
            if (rr == 7)
                global.battlemsg[0] = stringsetloc("* Too dark to see near the walls.&* There's something miniboss-shaped in here!", "obj_jackenstein_enemy_slash_Step_0_gml_326_0");
            var rand = irandom(99);
            if (rand < 3 && global.flag[456] == 1)
                global.battlemsg[0] = stringsetloc("* You can imagine Berdly in your head warning you about Grues.&* Smells like rotting fruit.", "obj_jackenstein_enemy_slash_Step_0_gml_329_0");
            attacked = 1;
        }
    }
    if (global.turntimer > 1)
    {
        with (obj_dmgwriter_boogie)
        {
            killtimer = 0;
            killactive = 0;
            kill = 0;
        }
    }
    if (global.mnfight == 2 && global.turntimer <= 1)
    {
        scaredycat = false;
        if (global.tension >= 150)
            global.battlemsg[0] = stringsetloc("* The atmosphere feels tense... (You can use \\cYUNLEASH\\c0!)", "obj_jackenstein_enemy_slash_Step_0_gml_340_0");
        sact = false;
        ract = false;
        fadeaway = 0;
        if (myattackchoice == 2)
            obj_battlecontroller.dancing_jackolantern_con = 1;
        rr = -1;
    }
    if (i_ex(obj_battlecontroller) && i_ex(obj_battlecontroller.battlewriter))
    {
        if (obj_battlecontroller.battlewriter.reachedend == 1 && rr == 6 && fun == 0)
        {
            snd_play(snd_pombark);
            fun = 1;
        }
        if (obj_battlecontroller.battlewriter.reachedend == 1 && rr == 7 && fun == 0)
        {
            msgsetloc(0, "H-HEY!/%", "obj_jackenstein_enemy_slash_Step_0_gml_351_0");
            global.typer = 88;
            scr_enemyblcon(x, global.monstery[myself] - 20, 10);
            fun = 2;
        }
    }
    if (fun == 2)
    {
        funtimer++;
        if (funtimer == 60)
        {
            with (myblcon)
                instance_destroy();
        }
    }
}
if (global.myfight == 3)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    if (acting == 1 && actcon == 0)
    {
        checkcount++;
        if (checkcount == 1)
        {
            msgsetloc(0, "* JACKENSTEIN - An unsightly beast that lives in total darkness./", "obj_jackenstein_enemy_slash_Step_0_gml_370_0");
            msgnextloc("* Gather \\cYTREASURE\\cW to gain TP, and use \"UNLEASH\" to light him up!/%", "obj_jackenstein_enemy_slash_Step_0_gml_371_0");
        }
        else
        {
            msgsetloc(0, "* You CHECKed Jackenstein...&* You remember that \\cYDEFEND\\c0ing gives you TP!/", "obj_jackenstein_enemy_slash_Step_0_gml_377_0");
            msgnextloc("* You remember Susie and Ralsei might have their own ACTs as well...!/%", "obj_jackenstein_enemy_slash_Step_0_gml_378_0");
        }
        scr_battletext_default();
        actcon = 1;
    }
    if (acting == 2 && actcon == 0)
    {
        msgsetloc(0, "* Kris's SOUL emitted a brilliant light!/%", "obj_jackenstein_enemy_slash_Step_0_gml_379_0");
        scr_battletext_default();
        acting = 2.1;
    }
    if (acting == 2.1 && actcon == 0 && !i_ex(obj_writer))
    {
        acting = 2.2;
        with (obj_herokris)
            scr_oflash();
        heart = instance_create_depth(obj_herokris.x + 30, obj_herokris.y + 50, ralseimarker.depth - 1999, obj_purify_event);
        heart.faster = true;
    }
    if (acting == 2.2 && actcon == 0 && !i_ex(obj_purify_event))
    {
        unleash = 1;
        acting = 0;
        actcon = 1;
    }
    if (acting == 3 && actcon == 0)
    {
        scaredycatcount++;
        scaredycat = true;
        if (scaredycatcount == 1)
            msgsetloc(0, "* Your heart pumped nervously!&* SPEED increased for 1 turn!&* Everyone's DEFENSE down!/%", "obj_jackenstein_enemy_slash_Step_0_gml_405_0");
        else
            msgsetloc(0, "* Scared! SPEED up, DEF down!/%", "obj_jackenstein_enemy_slash_Step_0_gml_406_0");
        scr_battletext_default();
        snd_play(snd_drive);
        actcon = 1;
    }
    if (actingsus == 1 && actconsus == 1)
    {
        if (global.actsimulsus[myself][0] == 0)
        {
            msgsetloc(0, "* Susie sniffs out treasure! It's easier to pick stuff up!/%", "obj_jackenstein_enemy_slash_Step_0_gml_418_0");
            scr_battletext_default();
            actconsus = 20;
            global.actsimulsus[myself][0] = 1;
        }
        else
        {
            msgsetloc(0, "* Susie sniffs out treasure!", "obj_jackenstein_enemy_slash_Step_0_gml_425_0");
            scr_simultext("susie");
            if (simulordersus == 0)
                actconsus = 20;
            else
                actconsus = 0;
        }
        actingsus = 0;
        sact = true;
    }
    if (actingral == 1 && actconral == 1)
    {
        if (global.actsimulral[myself][0] == 0)
        {
            msgsetloc(0, "* Ralsei lit up! The light grew larger and stronger!/%", "obj_jackenstein_enemy_slash_Step_0_gml_439_0");
            scr_battletext_default();
            actconral = 20;
            global.actsimulral[myself][0] = 1;
        }
        else
        {
            msgsetloc(0, "* Ralsei lit up! Light grew!", "obj_jackenstein_enemy_slash_Step_0_gml_446_0");
            scr_simultext("ralsei");
            if (simulorderral == 0)
                actconral = 20;
            else
                actconral = 0;
        }
        actingral = 0;
        ract = true;
    }
    if (actcon == 20 || actconsus == 20 || actconral == 20)
    {
        if (scr_terminate_writer())
        {
            actconsus = -1;
            actconral = -1;
            actcon = 1;
        }
    }
    if (actcon == 1 && !instance_exists(obj_writer))
        scr_nextact();
}
if (state == 3)
{
    scr_enemyhurt_tired_after_damage(0.5);
    scr_enemy_hurt();
}
if (i_ex(obj_herosusie) && i_ex(susiemarker))
{
    if (susiemarker.sprite_index == spr_susie_eyes_idle || susiemarker.sprite_index == spr_nothing)
    {
        susieblinktimer++;
        if (susieblinktimer == 140)
        {
            susieblinktimer = choose(40, 75, 90);
            susiemarker.sprite_index = spr_susie_eyes_blink;
            susietimer = 0;
        }
    }
    if (susiemarker.sprite_index == spr_susie_eyes_blink)
    {
        susietimer++;
        if (susietimer == 12)
        {
            susiemarker.sprite_index = spr_susie_eyes_idle;
            susietimer = 0;
        }
    }
    if (obj_herosusie.thissprite == obj_herosusie.defendsprite)
        susiemarker.sprite_index = spr_susie_eyes_defend;
    if (obj_herosusie.thissprite != obj_herosusie.defendsprite && susiemarker.sprite_index == spr_susie_eyes_defend)
        susiemarker.sprite_index = spr_susie_eyes_idle;
    if (obj_herosusie.thissprite == obj_herosusie.defeatsprite)
        susiemarker.sprite_index = spr_susie_eyes_defeat;
    if (obj_herosusie.thissprite != obj_herosusie.defeatsprite && susiemarker.sprite_index == spr_susie_eyes_defeat)
        susiemarker.sprite_index = spr_susie_eyes_idle;
    if (obj_herosusie.thissprite == obj_herosusie.spellsprite)
    {
        susiemarker.sprite_index = spr_susie_eyes_spell;
        if (global.faceaction[obj_herosusie.myself] == 10)
            susiemarker.sprite_index = spr_susie_eyes_spare;
    }
    if (obj_herosusie.thissprite != obj_herosusie.spellsprite && susiemarker.sprite_index == spr_susie_eyes_spell)
        susiemarker.sprite_index = spr_susie_eyes_idle;
    if (obj_herosusie.thissprite != obj_herosusie.spellsprite && susiemarker.sprite_index == spr_susie_eyes_spare)
        susiemarker.sprite_index = spr_susie_eyes_idle;
    if (obj_herosusie.thissprite == obj_herosusie.actsprite)
        susiemarker.sprite_index = spr_susie_eyes_act;
    if (obj_herosusie.thissprite != obj_herosusie.actsprite && susiemarker.sprite_index == spr_susie_eyes_act)
        susiemarker.sprite_index = spr_susie_eyes_idle;
    if (obj_herosusie.thissprite == obj_herosusie.itemsprite)
        susiemarker.sprite_index = spr_susie_eyes_item;
    if (obj_herosusie.thissprite != obj_herosusie.itemsprite && susiemarker.sprite_index == spr_susie_eyes_item)
        susiemarker.sprite_index = spr_susie_eyes_idle;
    if (obj_herosusie.thissprite == obj_herosusie.attacksprite)
        susiemarker.sprite_index = spr_susie_eyes_attack;
    if (obj_herosusie.thissprite != obj_herosusie.attacksprite && susiemarker.sprite_index == spr_susie_eyes_attack)
        susiemarker.sprite_index = spr_susie_eyes_idle;
    if (obj_herosusie.hurt == 1 && global.hp[global.char[obj_herosusie.myself]] > 0)
        susiemarker.sprite_index = spr_susie_eyes_hurt;
    else if (susiemarker.sprite_index == spr_susie_eyes_hurt)
        susiemarker.sprite_index = spr_susie_eyes_idle;
}
if (i_ex(obj_heroralsei) && i_ex(ralseimarker))
{
    if (ralseimarker.sprite_index == spr_ralsei_eyes_idle || ralseimarker.sprite_index == spr_nothing)
    {
        ralseiblinktimer++;
        if (ralseiblinktimer == 140)
        {
            ralseiblinktimer = choose(40, 75, 90);
            ralseimarker.sprite_index = spr_ralsei_eyes_blink;
            ralseitimer = 0;
        }
    }
    if (ralseimarker.sprite_index == spr_ralsei_eyes_blink)
    {
        ralseitimer++;
        if (ralseitimer == 12)
        {
            ralseimarker.sprite_index = spr_ralsei_eyes_idle;
            ralseitimer = 0;
        }
    }
    if (obj_heroralsei.thissprite == obj_heroralsei.defendsprite)
        ralseimarker.sprite_index = spr_ralsei_eyes_defend;
    if (obj_heroralsei.thissprite != obj_heroralsei.defendsprite && ralseimarker.sprite_index == spr_ralsei_eyes_defend)
        ralseimarker.sprite_index = spr_ralsei_eyes_idle;
    if (obj_heroralsei.thissprite == obj_heroralsei.defeatsprite)
        ralseimarker.sprite_index = spr_ralsei_eyes_defeated;
    if (obj_heroralsei.thissprite != obj_heroralsei.defeatsprite && ralseimarker.sprite_index == spr_ralsei_eyes_defeated)
        ralseimarker.sprite_index = spr_ralsei_eyes_idle;
    if (obj_heroralsei.thissprite == obj_heroralsei.spellsprite)
        ralseimarker.sprite_index = spr_ralsei_eyes_spell;
    if (obj_heroralsei.thissprite != obj_heroralsei.spellsprite && ralseimarker.sprite_index == spr_ralsei_eyes_spell)
        ralseimarker.sprite_index = spr_ralsei_eyes_idle;
    if (obj_heroralsei.thissprite == obj_heroralsei.actsprite)
        ralseimarker.sprite_index = spr_ralsei_eyes_act;
    if (obj_heroralsei.thissprite != obj_heroralsei.actsprite && ralseimarker.sprite_index == spr_ralsei_eyes_act)
        ralseimarker.sprite_index = spr_ralsei_eyes_idle;
    if (obj_heroralsei.thissprite == obj_heroralsei.itemsprite)
        ralseimarker.sprite_index = spr_ralsei_eyes_item;
    if (obj_heroralsei.thissprite != obj_heroralsei.itemsprite && ralseimarker.sprite_index == spr_ralsei_eyes_item)
        ralseimarker.sprite_index = spr_ralsei_eyes_idle;
    if (obj_heroralsei.thissprite == obj_heroralsei.attacksprite)
        ralseimarker.sprite_index = spr_ralsei_eyes_attack;
    if (obj_heroralsei.thissprite != obj_heroralsei.attacksprite && ralseimarker.sprite_index == spr_ralsei_eyes_attack)
        ralseimarker.sprite_index = spr_ralsei_eyes_idle;
    if (obj_heroralsei.hurt == 1 && global.hp[global.char[obj_heroralsei.myself]] > 0)
        ralseimarker.sprite_index = spr_ralsei_eyes_hurt;
    else if (ralseimarker.sprite_index == spr_ralsei_eyes_hurt)
        ralseimarker.sprite_index = spr_ralsei_eyes_idle;
}
if (!fadeaway)
{
    if (image_alpha < 1)
        image_alpha += 0.1;
    juststartedbulletphase = true;
    eyeflashtimer = 0;
}
else
{
    if (juststartedbulletphase == true)
    {
        juststartedbulletphase = false;
        eyeflashtimer++;
    }
    if (eyeflashtimer > 0)
        eyeflashtimer++;
    if (image_alpha > 0)
        image_alpha -= 0.1;
}
if (image_alpha == 1)
{
    if (global.mercymod[myself] <= 20 && (jackotimer % 4) == 0)
    {
        inst = scr_afterimage();
        inst.fadeSpeed = 0.15;
        inst.image_index = siner;
        inst.y = y + (sin(siner / 1.35) * 8);
    }
    if (global.mercymod[myself] >= 20 && global.mercymod[myself] <= 50 && (jackotimer % 4) == 0)
    {
        inst = scr_afterimage();
        inst.fadeSpeed = 0.07;
        inst.image_index = siner;
        inst.y = y + (sin(siner / 1.35) * 8);
    }
    if (global.mercymod[myself] >= 50 && (jackotimer % 4) == 0)
    {
        inst = scr_afterimage();
        inst.fadeSpeed = 0.04;
        inst.image_index = siner;
        inst.y = y + (sin(siner / 1.35) * 8);
    }
}

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
