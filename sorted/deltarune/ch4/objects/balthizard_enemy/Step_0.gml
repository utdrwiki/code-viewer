if (global.monster[myself] == 1)
{
    if (gersonintro == 0 && gersonevent == true)
    {
        global.charturn = 3;
        talked = 0.1;
        gersontimer++;
        if (gersontimer == 1)
        {
            gerson = instance_create_depth(camerax() + 320 + 20, cameray() + 260, depth - 10, obj_marker);
            gerson.sprite_index = spr_gerson_outfit_idle;
            gerson.image_speed = 0;
            gerson.image_xscale = 2;
            gerson.image_yscale = 2;
            with (obj_balthizard_enemy)
                gerson = other.gerson;
        }
        gerson.y = lerp(gerson.y, cameray() + 220, gersontimer / 15);
        if (gersontimer == 15)
        {
            gersonintro = 0.1;
            gersontimer = 0;
        }
    }
    if (gersonintro == 0.1)
    {
        gersonintro = 0.2;
        global.typer = 86;
        msgsetloc(0, "Hm, what's&all this now?/%", "obj_balthizard_enemy_slash_Step_0_gml_38_0");
        scr_enemyblcon(gerson.x, gerson.y + 32, 10);
    }
    if (gersonintro == 0.2)
    {
        talktimer++;
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            talktimer = 0;
            gersonintro = 0.3;
            global.typer = 75;
            msgsetloc(0, "H-hey!!&We're fighting!!&Get out of here!!/%", "obj_balthizard_enemy_slash_Step_0_gml_53_0");
            scr_heroblcon("susie");
        }
    }
    if (gersonintro == 0.3)
    {
        talktimer++;
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            talktimer = 0;
            gersonintro = 0.4;
            global.typer = 86;
            msgsetloc(0, "I see, I see.&Well, you kids&have fun!/%", "obj_balthizard_enemy_slash_Step_0_gml_72_0");
            scr_enemyblcon(gerson.x, gerson.y + 32, 10);
        }
    }
    if (gersonintro == 0.4)
    {
        talktimer++;
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            talktimer = 0;
            gersonintro = 1;
        }
    }
    if (gersonintro == 1)
    {
        gersontimer++;
        if (gersontimer == 1)
        {
            with (obj_writer)
                instance_destroy();
            talktimer = 0;
            gerson.sprite_index = spr_gerson_outfit_walk;
            gerson.image_speed = 0.16666666666666666;
            gerson.image_xscale = -2;
            audio_pause_sound(global.batmusic[1]);
        }
        gerson.x = lerp(camerax() + 374 + 20, camerax() + camerawidth() + 100, gersontimer / 150);
        if (gersontimer <= 10)
        {
            with (obj_balthizard_enemy)
                eyesfollowgersonindex = lerp(headindex, 2, other.gersontimer / 10);
        }
        if (gersontimer > 10 && gersontimer < 140)
        {
            with (obj_balthizard_enemy)
                eyesfollowgersonindex = lerp(2, 18, (other.gersontimer - 10) / 140);
        }
        if (gersontimer > 140)
        {
            with (obj_balthizard_enemy)
            {
                eyesiner = 40;
                headindex = 7 + (sin(eyesiner / 12) * 5);
                eyesfollowgersonindex = lerp(18, headindex, (other.gersontimer - 140) / 10);
            }
        }
        if (gerson.sprite_index == spr_gerson_outfit_walk && gerson.image_index >= 0 && gerson.image_index < 0.8333333333333334 && walkvar == 0)
        {
            snd_play_pitch(snd_bump, 0.9);
            walkvar = 1;
        }
        if (gerson.sprite_index == spr_gerson_outfit_walk && gerson.image_index >= 2 && gerson.image_index < 2.8333333333333335 && walkvar == 1)
        {
            snd_play_pitch(snd_bump, 0.9);
            walkvar = 0;
        }
        if (gersontimer == 150)
        {
            talked = 0;
            gersonintro = 2;
            scr_speaker("none");
            gerson.sprite_index = spr_gerson_outfit_idle;
            gerson.image_speed = 0;
            talked = 0;
            audio_resume_sound(global.batmusic[1]);
            global.charturn = 0;
            with (obj_battlecontroller)
                incenseturtlegersoncon = 1;
            with (obj_balthizard_enemy)
            {
                eyesfollowgersonindex = -1;
                eyedelay = 10;
            }
        }
    }
    if (scr_isphase("enemytalk") && talked == 0)
    {
        with (obj_battlecontroller)
            skipsusieturn = false;
        scr_randomtarget();
        var sleepymizzle = false;
        with (obj_mizzle_enemy)
        {
            if (idlesprite == spr_holywater_idle)
                sleepymizzle = true;
        }
        if (scr_monsterpop() == 1)
        {
            myattackchoice = 0;
        }
        else if (attackselected == 0)
        {
            if (scr_monsterpop() == instance_number(object_index))
            {
                with (obj_balthizard_enemy)
                    myattackchoice = 1;
                myattackchoice = 0;
            }
            else if (sleepymizzle)
            {
                myattackchoice = 0;
            }
            else
            {
                with (obj_balthizard_enemy)
                    myattackchoice = 1;
            }
            if (lightup)
            {
                with (obj_balthizard_enemy)
                {
                    myattackchoice = 1;
                    attackselected = 1;
                }
                myattackchoice = 0;
            }
        }
        myattackpriority = 1;
        if (myattackchoice == 0)
            myattackpriority = 50;
        scr_attackpriority(myattackpriority - 1);
        if (!instance_exists(obj_darkener))
            instance_create(0, 0, obj_darkener);
        if (gersonvar == 1)
        {
            global.typer = 75;
            msgsetloc(0, "... anyone, uh,&got any left?", "obj_balthizard_enemy_slash_Step_0_gml_183_0");
            scr_heroblcon("susie");
            talked = 0.5;
            with (obj_balthizard_enemy)
                gersonvar = 2;
        }
        if (gersonvar == 0)
        {
            global.typer = 50;
            if (lightup == false)
            {
                rr = choose(0, 1, 2, 3);
                if (rr == 0)
                    msgsetloc(0, "Slow down.", "obj_balthizard_enemy_slash_Step_0_gml_195_0");
                if (rr == 1)
                    msgsetloc(0, "Take it easy.", "obj_balthizard_enemy_slash_Step_0_gml_196_0");
                if (rr == 2)
                    msgsetloc(0, "Glory,&memory.", "obj_balthizard_enemy_slash_Step_0_gml_197_0");
                if (rr == 3)
                    msgsetloc(0, "Sit back,&relax.", "obj_balthizard_enemy_slash_Step_0_gml_198_0");
                if (justshaked)
                    msgsetloc(0, "A nice&massage.", "obj_balthizard_enemy_slash_Step_0_gml_199_0");
                balloon = scr_enemyblcon(x - 16, y + 54, 10);
                balloon.mywriter.rate = 3;
            }
            else
            {
                rr = choose(0, 1, 2);
                if (rr == 0)
                    msgsetloc(0, "Let's burn&rubber!", "obj_balthizard_enemy_slash_Step_0_gml_206_0");
                if (rr == 1)
                    msgsetloc(0, "Strike while&the iron&is hot!", "obj_balthizard_enemy_slash_Step_0_gml_207_0");
                if (rr == 2)
                    msgsetloc(0, "Inferno,&Inferno!", "obj_balthizard_enemy_slash_Step_0_gml_208_0");
                if (lightupfirstturn)
                    msgsetloc(0, "Ah! That&wakes&me up!!!", "obj_balthizard_enemy_slash_Step_0_gml_209_0");
                if (justshaked)
                    msgsetloc(0, "What a&blast!&Hoh hoh!", "obj_balthizard_enemy_slash_Step_0_gml_210_0");
                scr_enemyblcon(x - 16, y + 54, 10);
            }
            talked = 1;
        }
        talktimer = 0;
        rtimer = 0;
    }
    if (talked == 0.5 && scr_isphase("enemytalk"))
    {
        talktimer++;
        if (talktimer > 15 && (button3_p() || button1_p()))
        {
            with (obj_writer)
                instance_destroy();
            with (obj_balthizard_enemy)
            {
                global.typer = 50;
                msgsetloc(0, "No.", "obj_balthizard_enemy_slash_Step_0_gml_233_0");
                scr_enemyblcon(x - 16, y + 54, 10);
                talked = 1;
                talktimer = 0;
                gersonvar = 0;
            }
        }
    }
    if (talked == 1 && scr_isphase("enemytalk"))
        scr_blconskip(15);
    if (global.mnfight == 1.5)
    {
        if (scr_attackpriority(myattackpriority))
        {
            if (!instance_exists(obj_growtangle))
            {
                inst = instance_create(__view_get(e__VW.XView, 0) + 320, __view_get(e__VW.YView, 0) + 240 + 18.75, obj_growtangle);
                inst.image_xscale = 1;
            }
            if (!instance_exists(obj_moveheart))
                scr_moveheart();
            global.mnfight = 2;
            scr_turntimer(90);
        }
    }
    if (scr_isphase("bullets") && attacked == 0)
    {
        attackselected = 0;
        if (myattackchoice == 0)
            state = 10;
        rtimer += 1;
        if (rtimer == 12)
        {
            global.monsterattackname[myself] = "turtleattack";
            dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
            dc.type = 105;
            dc.damage = 80;
            if (attackdown)
                dc.damage = round(dc.damage * 0.6);
            if (lightup == true)
                dc.difficulty = 1;
            if (myattackchoice == 0)
                dc.special = 0;
            else
                dc.special = 1;
            scr_turntimer(200);
            turns += 1;
            global.typer = 6;
            global.fc = 0;
            rr = choose(0, 1, 2, 3, 4);
            if (scr_messagepriority(random(2)))
            {
                var substring = string(myself);
                if (rr == 0)
                    global.battlemsg[0] = stringsetloc("* Balthizard clambers slowly.", "obj_balthizard_enemy_slash_Step_0_gml_288_0");
                if (rr == 1)
                    global.battlemsg[0] = stringsetloc("* Balthizard releases a plume of sickly sweet nostalgia.", "obj_balthizard_enemy_slash_Step_0_gml_289_0");
                if (rr == 2)
                    global.battlemsg[0] = stringsetloc("* Balthizard breathes a fog of sunbeam on warm wood.", "obj_balthizard_enemy_slash_Step_0_gml_290_0");
                if (rr == 3)
                    global.battlemsg[0] = stringsetloc("* Balthizard spins the scent of a rainy, grassy day.", "obj_balthizard_enemy_slash_Step_0_gml_291_0");
                if (rr == 4)
                    global.battlemsg[0] = stringsetloc("* Balthizard coughs plumes like old pillows on golden hair.", "obj_balthizard_enemy_slash_Step_0_gml_292_0");
            }
            if (global.monsterhp[myself] <= (global.monstermaxhp[myself] / 3))
            {
                if (scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Balthizard coughs scentlessly.", "obj_balthizard_enemy_slash_Step_0_gml_297_0");
            }
            if (global.mercymod[myself] >= 100)
            {
                if (scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Balthizard laughs plumes of heart-shaped gas.", "obj_balthizard_enemy_slash_Step_0_gml_302_0");
            }
            if (global.monsterstatus[myself] == 1)
            {
                if (scr_messagepriority(102 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Balthizard releases a scent of candles and chamomile.", "obj_balthizard_enemy_slash_Step_0_gml_307_0");
            }
            if (lightup == true)
            {
                if (scr_messagepriority(102 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Balthizard burns with taco-scented excitement.", "obj_balthizard_enemy_slash_Step_0_gml_312_0");
            }
            attacked = 1;
        }
    }
    if (global.mnfight == 2 && global.turntimer <= 1)
    {
        lightupfirstturn = 0;
        justshaked = 0;
    }
}
if (global.myfight == 3)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    var turtle_tired_text = stringsetloc("* Balthizard became TIRED!/%", "obj_balthizard_enemy_slash_Step_0_gml_336_0");
    if (acting == 1 && actcon == 0)
    {
        actcon = 1;
        msgsetloc(0, "* BALTHIZARD - An ancient aromancer. Punishes intruders with beautiful scent./%", "obj_balthizard_enemy_slash_Step_0_gml_342_0");
        scr_battletext_default();
    }
    if (acting == 2 && actcon == 0)
    {
        acting = 20;
        msgsetloc(0, "* Press Left and Right rapidly to shake!", "obj_balthizard_enemy_slash_Step_0_gml_349_0");
        scr_battletext_default();
        with (obj_writer)
            pos = 100;
        with (obj_dmgwriter)
            instance_destroy();
        shakex = 0;
        shakemercystart = global.mercymod[myself];
        shakehead.image_index = headindex;
        if (global.mercymod[myself] >= 100)
            shakestartsatmaxmercy = true;
    }
    if (acting == 20 && actcon == 0)
    {
        if (shakelastpress != 0)
        {
            if (shakex == 0)
                shaketimer += 3;
            shaketimer++;
        }
        var mercygained = 0;
        var _speed = 20;
        var _offset = 5;
        if (left_p())
        {
            shakehead.image_index = 2;
            if (shakelastpress == -1 || shakelastpress == 0)
            {
                headspeed -= _speed;
                headoffsetx -= _offset;
            }
            else
            {
                headspeed -= _speed;
                headoffsetx -= _offset;
            }
            if (shakex == 1)
                mercygained = 8;
            else
                mercygained = 4;
            shakelastpress = -1;
        }
        if (right_p())
        {
            shakehead.image_index = 16;
            if (shakelastpress == 1 || shakelastpress == 0)
            {
                headspeed += _speed;
                headoffsetx += _offset;
            }
            else
            {
                headspeed += _speed;
                headoffsetx += _offset;
            }
            if (shakex == 1)
                mercygained = 8;
            else
                mercygained = 3;
            shakelastpress = 1;
        }
        justshaked = 1;
        if (shakemercystart < 50 && (mercygained + global.mercymod[myself]) > 90)
            mercygained = 90 - global.mercymod[myself];
        if (mercygained > 0)
        {
            if (shakelastpress == 1)
            {
                smoke = instance_create((x + 26 + headoffsetx) - 14, y + 56 + headoffsety, obj_incense_turtle_shake_smoke);
                smoke.speed = choose(-3, -4, -5);
            }
            else
            {
                smoke = instance_create(x + 26 + headoffsetx + 20, y + 56 + headoffsety, obj_incense_turtle_shake_smoke);
                smoke.speed = choose(3, 4, 5);
            }
            snd_stop(snd_damage);
            snd_play(snd_damage);
            if (!i_ex(obj_dmgwriter) && shakemercystart < 100)
            {
                scr_mercyadd(myself, mercygained);
            }
            else
            {
                if (i_ex(obj_dmgwriter))
                    obj_dmgwriter.damage += mercygained;
                global.mercymod[myself] += mercygained;
                shakemaxmercyhp -= mercygained;
                if (global.mercymod[myself] < 0)
                    global.mercymod[myself] = 0;
                if (global.mercymod[myself] >= 100)
                {
                    global.mercymod[myself] = 100;
                    if (i_ex(obj_dmgwriter))
                        obj_dmgwriter.damage = global.mercymod[myself] - shakemercystart;
                }
                if (i_ex(obj_dmgwriter))
                    obj_dmgwriter.init = 0;
                if (shakemercystart >= 100)
                {
                    with (obj_dmgwriter)
                    {
                        y = -9999;
                        ystart = -9999;
                    }
                }
            }
            headflashtimer = 2;
        }
        with (obj_dmgwriter)
            killtimer = 33;
        if ((shakemercystart < 50 && global.mercymod[myself] >= 90 && shakemercystart < 100) || (shakemercystart >= 50 && shakemercystart < 100 && global.mercymod[myself] >= 100 && shakemercystart < 100) || (shakemercystart >= 100 && global.mercymod[myself] >= 100 && shakemaxmercyhp < 1) || shaketimer >= 180 || (shakemaxmercyhp < 1 && shakemercystart >= 100))
        {
            acting = 21;
            if (shakemaxmercyhp < 1 && shakemercystart >= 100)
            {
                event_user(10);
                for (var __i = 1; __i < 3; __i++)
                {
                    if (global.actingtarget[__i] == myself && global.char[__i] > 0)
                    {
                        global.acting[__i] = 0;
                        global.actingsimul[__i] = 0;
                        global.actingsingle[__i] = 0;
                        global.faceaction[__i] = 0;
                    }
                }
            }
            shakestartsatmaxmercy = false;
            shakemaxmercyhp = 30;
        }
    }
    if (acting == 21 && actcon == 0)
    {
        with (obj_writer)
            instance_destroy();
        shakelastpress = 0;
        shaketimer = 0;
        actcon = 1;
        if (global.mercymod[myself] > 50 && global.monsterstatus[myself] != 1)
        {
        }
    }
    if (acting == 3 && actcon == 0)
    {
        acting = 20;
        msgsetloc(0, "* Press Left and Right rapidly to shake!", "obj_balthizard_enemy_slash_Step_0_gml_490_0");
        scr_battletext_default();
        with (obj_writer)
            pos = 100;
        shakex = 1;
        shakemercystart = global.mercymod[myself];
    }
    if (acting == 4)
    {
        msgsetloc(0, "* Ralsei lit up!/%", "obj_balthizard_enemy_slash_Step_0_gml_499_0");
        scr_battletext_default();
        acting = 4.1;
    }
    if (acting == 4.1 && actcon == 0 && !i_ex(obj_writer))
    {
        if (lightuptimer == 0)
            scr_battle_sprite_set("ralsei", spr_ralsei_spell, 0.5, false);
        if (lightuptimer == 16)
            scr_battle_sprite_set("ralsei", spr_ralsei_spell_end, 1, true);
        if (lightuptimer == 16 || lightuptimer == 22 || lightuptimer == 28 || lightuptimer == 34)
        {
            var b = 0;
            var rand = irandom(30);
            snd_play(snd_wing);
            repeat (9)
            {
                inst = instance_create(obj_heroralsei.x + 62, obj_heroralsei.y + 22, obj_turtle_toriel_fire);
                inst.direction = (b * 45) + rand;
                inst.speed = 14;
                inst.gravity_direction = 270;
                inst.gravity = 0.4;
                inst.image_xscale = 1.5;
                inst.image_yscale = 1.5;
                b++;
            }
        }
        if (lightuptimer == 18)
            instance_create(x, y, obj_incense_turtle_screen_flash);
        if (lightuptimer == 38)
        {
            snd_play_x(snd_rocket, 0.9, 0.9);
            lightupfirstturn = 1;
            lightup = true;
            scr_battle_sprite_reset("ralsei");
        }
        lightuptimer++;
        if (lightuptimer == 50)
        {
            lightuptimer = 0;
            acting = 25;
            scr_mercyadd(myself, 50);
            var maketired = 0;
            var lightup_text1 = stringsetloc("* The room got smokey!", "obj_balthizard_enemy_slash_Step_0_gml_556_0");
            var lightup_text2 = stringsetloc("* Other enemies became TIRED!", "obj_balthizard_enemy_slash_Step_0_gml_557_0");
            for (var i = 0; i < instance_number(obj_monsterparent); i += 1)
            {
                enemy[i] = instance_find(obj_monsterparent, i);
                if (enemy[i].myself != myself && global.monsterstatus[enemy[i].myself] != 1)
                {
                    with (enemy[i])
                        scr_monster_make_tired(myself);
                    maketired = 1;
                }
            }
            if (maketired == 0)
                msgset(0, lightup_text1 + "/%");
            else
                msgset(0, lightup_text1 + "&" + lightup_text2 + "/%");
            scr_battletext_default();
        }
    }
    if (acting == 25 && !i_ex(obj_writer))
        actcon = 1;
    if (acting == 5 && actcon == 0)
    {
        gersontimer = 0;
        if (gersonactcount == 0 || gersonactcount == 1)
        {
            msgsetloc(0, "* You used Old Man./%", "obj_balthizard_enemy_slash_Step_0_gml_580_0");
            scr_battletext_default();
        }
        acting = 5.1;
    }
    if (acting == 5.1 && actcon == 0 && !i_ex(obj_writer))
    {
        if (gersonactcount == 0)
        {
            gersontimer++;
            if (gersontimer == 1)
            {
                gerson.image_xscale = -2;
                gerson.sprite_index = spr_gerson_outfit_walk;
                gerson.image_speed = 0.16666666666666666;
                audio_pause_sound(global.batmusic[1]);
            }
            gerson.x = lerp(camerax() + camerawidth() + 100, camerax() + 410, gersontimer / 120);
            if (gerson.sprite_index == spr_gerson_outfit_walk && gerson.image_index >= 0 && gerson.image_index < 0.8333333333333334 && walkvar == 0)
            {
                snd_play_pitch(snd_bump, 0.9);
                walkvar = 1;
            }
            if (gerson.sprite_index == spr_gerson_outfit_walk && gerson.image_index >= 2 && gerson.image_index < 2.8333333333333335 && walkvar == 1)
            {
                snd_play_pitch(snd_bump, 0.9);
                walkvar = 0;
            }
            if (gersontimer <= 30)
            {
                with (obj_balthizard_enemy)
                    eyesfollowgersonindex = lerp(headindex, 18, other.gersontimer / 30);
            }
            if (gersontimer > 30 && gersontimer < 110)
            {
                with (obj_balthizard_enemy)
                    eyesfollowgersonindex = lerp(18, 8, (other.gersontimer - 30) / 80);
            }
            if (gersontimer > 110)
            {
                with (obj_balthizard_enemy)
                {
                    eyesiner = 0;
                    headindex = 7 + (sin(eyesiner / 12) * 5);
                    eyesfollowgersonindex = lerp(8, headindex, (other.gersontimer - 110) / 10);
                }
            }
            if (gersontimer == 120)
            {
                audio_resume_sound(global.batmusic[1]);
                gerson.sprite_index = spr_gerson_outfit_idle;
                gerson.image_speed = 0;
                gerson.image_xscale = 2;
                gersontimer = 0;
                acting = 35;
                gerson.x -= 74;
                global.typer = 86;
                msgsetloc(0, "How's it going?&Ya winning, kids?/%", "obj_balthizard_enemy_slash_Step_0_gml_640_0");
                scr_enemyblcon(gerson.x, gerson.y + 32, 10);
                for (var i = 0; i < instance_number(obj_balthizard_enemy); i++)
                {
                    turtle[i] = instance_find(obj_balthizard_enemy, i);
                    turtle[i].gersonactcount++;
                }
                with (obj_balthizard_enemy)
                {
                    eyesfollowgersonindex = -1;
                    eyedelay = 10;
                }
            }
        }
        else if (gersonactcount == 1)
        {
            gersontimer++;
            if (gersontimer == 1)
            {
                gerson.image_xscale = -2;
                gerson.sprite_index = spr_gerson_outfit_walk;
                gerson.image_speed = 0.16666666666666666;
                audio_pause_sound(global.batmusic[1]);
            }
            gerson.x = lerp(camerax() - 100, camerax() + 410, gersontimer / 120);
            if (gerson.sprite_index == spr_gerson_outfit_walk && gerson.image_index >= 0 && gerson.image_index < 0.8333333333333334 && walkvar == 0)
            {
                snd_play_pitch(snd_bump, 0.9);
                walkvar = 1;
            }
            if (gerson.sprite_index == spr_gerson_outfit_walk && gerson.image_index >= 2 && gerson.image_index < 2.8333333333333335 && walkvar == 1)
            {
                snd_play_pitch(snd_bump, 0.9);
                walkvar = 0;
            }
            if (gersontimer == 120)
            {
                audio_resume_sound(global.batmusic[1]);
                gerson.sprite_index = spr_gerson_outfit_idle;
                gerson.image_speed = 0;
                gerson.image_xscale = 2;
                gersontimer = 0;
                acting = 40;
                gerson.x -= 74;
                global.typer = 86;
                msgsetloc(0, "You kids mus' be&getting hungry&battling.&Some candy?/%", "obj_balthizard_enemy_slash_Step_0_gml_679_0");
                scr_enemyblcon(gerson.x, gerson.y + 32, 10);
                for (var i = 0; i < instance_number(obj_balthizard_enemy); i++)
                {
                    turtle[i] = instance_find(obj_balthizard_enemy, i);
                    turtle[i].gersonactcount++;
                }
            }
        }
        else if (gersonactcount > 1)
        {
            msgsetloc(0, "* Called the OldMan! Nothing happened!/%", "obj_balthizard_enemy_slash_Step_0_gml_691_0");
            scr_battletext_default();
            actcon = 1;
        }
    }
    if (acting >= 35 && acting < 39)
        talktimer++;
    if (acting == 35 && actcon == 0)
    {
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            talktimer = 0;
            global.typer = 75;
            msgsetloc(0, "Not now, old&man! We're in&the middle of&this!/%", "obj_balthizard_enemy_slash_Step_0_gml_707_0");
            scr_heroblcon("susie");
            acting = 36;
        }
    }
    if (acting == 36 && actcon == 0)
    {
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            talktimer = 0;
            global.typer = 75;
            msgsetloc(0, "I was about to...&dang it, you&made me forget!/%", "obj_balthizard_enemy_slash_Step_0_gml_723_0");
            scr_heroblcon("susie");
            acting = 36.5;
        }
    }
    if (acting == 36.5 && actcon == 0)
    {
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            talktimer = 0;
            msgsetloc(0, "* (Susie forgot what she was about to do! Her move got cancelled!)/%", "obj_balthizard_enemy_slash_Step_0_gml_738_0");
            scr_battletext_default();
            obj_battlecontroller.skipsusieturn = true;
            global.faceaction[1] = 0;
            global.charaction[1] = 0;
            global.acting[1] = 0;
            global.actingsingle[1] = 0;
            actingsus = 0;
            acting = 37;
        }
    }
    if (acting == 37 && actcon == 0)
    {
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            talktimer = 0;
            gerson.x += 74;
            gerson.image_xscale = -2;
            global.typer = 86;
            msgsetloc(0, "Now you go easy&on them, you hear?&They're still&learnin'./%", "obj_balthizard_enemy_slash_Step_0_gml_762_0");
            scr_enemyblcon(gerson.x + 37, gerson.y + 32, 10);
            myblcon.side = -1;
            acting = 38;
        }
    }
    if (acting == 38 && actcon == 0)
    {
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            talktimer = 0;
            with (obj_balthizard_enemy)
            {
                scr_mercyadd(myself, 50);
                global.monsterat[myself] -= 1;
                attackdown = true;
            }
            msgsetloc(0, "* (The enemies' attack power went down!)/%", "obj_balthizard_enemy_slash_Step_0_gml_783_0");
            scr_battletext_default();
            acting = 39;
        }
    }
    if (acting == 39 && actcon == 0 && !i_ex(obj_writer))
    {
        gersontimer++;
        if (gersontimer == 1)
        {
            gerson.sprite_index = spr_gerson_outfit_walk;
            gerson.image_speed = 0.16666666666666666;
            gerson.image_xscale = 2;
            audio_pause_sound(global.batmusic[1]);
        }
        gerson.x = lerp((camerax() + 410) - 74, camerax() - 100, gersontimer / 120);
        if (gerson.sprite_index == spr_gerson_outfit_walk && gerson.image_index >= 0 && gerson.image_index < 0.8333333333333334 && walkvar == 0)
        {
            snd_play_pitch(snd_bump, 0.9);
            walkvar = 1;
        }
        if (gerson.sprite_index == spr_gerson_outfit_walk && gerson.image_index >= 2 && gerson.image_index < 2.8333333333333335 && walkvar == 1)
        {
            snd_play_pitch(snd_bump, 0.9);
            walkvar = 0;
        }
        if (gersontimer == 120)
        {
            audio_resume_sound(global.batmusic[1]);
            gerson.sprite_index = spr_gerson_outfit_idle;
            gerson.image_speed = 0;
            gersontimer = 0;
            actcon = 1;
        }
    }
    if (acting >= 40 && acting < 44)
        talktimer++;
    if (acting == 40 && actcon == 0)
    {
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            talktimer = 0;
            global.typer = 75;
            msgsetloc(0, "Hell yeah,&we'd --/%", "obj_balthizard_enemy_slash_Step_0_gml_829_0");
            scr_heroblcon("susie");
            acting = 41;
        }
    }
    if (acting == 41 && actcon == 0)
    {
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            talktimer = 0;
            global.typer = 75;
            msgsetloc(0, "No!&No way, we don't&need that now!/%", "obj_balthizard_enemy_slash_Step_0_gml_845_0");
            scr_heroblcon("susie");
            acting = 42;
        }
    }
    if (acting == 42 && actcon == 0)
    {
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            talktimer = 0;
            global.typer = 86;
            msgsetloc(0, "Suit yourself!/%", "obj_balthizard_enemy_slash_Step_0_gml_861_0");
            scr_enemyblcon(gerson.x, gerson.y + 32, 10);
            acting = 43;
        }
    }
    if (acting == 43 && actcon == 0)
    {
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            talktimer = 0;
            for (var i = 0; i < 3; i += 1)
            {
                if (i != 1)
                {
                    scr_heal(i, 50);
                    global.charinstance[i].healnum = 50;
                    with (global.charinstance[i])
                    {
                        ha = instance_create(x, y, obj_healanim);
                        ha.target = id;
                        dmgwr = scr_dmgwriter_selfchar();
                        with (dmgwr)
                        {
                            delay = 8;
                            type = 3;
                        }
                        if (global.hp[global.char[myself]] >= global.maxhp[global.char[myself]])
                        {
                            with (dmgwr)
                                specialmessage = 3;
                        }
                        dmgwr.damage = 50;
                    }
                }
            }
            with (obj_balthizard_enemy)
            {
                scr_mercyadd(myself, 50);
                ha = instance_create(x, y, obj_healanim);
                ha.target = id;
                dmgwr = instance_create(x, y, obj_dmgwriter);
                with (dmgwr)
                {
                    delay = 8;
                    type = 3;
                }
                global.monsterhp[myself] += 50;
                if (global.monsterhp[myself] > global.monstermaxhp[myself])
                {
                    global.monsterhp[myself] = global.monstermaxhp[myself];
                    with (dmgwr)
                        specialmessage = 3;
                }
                dmgwr.damage = 50;
            }
            msgsetloc(0, "* Everyone except Susie got candy!/%", "obj_balthizard_enemy_slash_Step_0_gml_914_0");
            scr_battletext_default();
            acting = 44;
        }
    }
    if (acting == 44 && actcon == 0 && !i_ex(obj_writer))
    {
        gersontimer++;
        if (gersontimer == 1)
        {
            gerson.sprite_index = spr_gerson_outfit_walk;
            gerson.image_speed = 0.16666666666666666;
            gerson.image_xscale = 2;
            audio_pause_sound(global.batmusic[1]);
        }
        gerson.x = lerp((camerax() + 410) - 74, camerax() - 100, gersontimer / 120);
        if (gerson.sprite_index == spr_gerson_outfit_walk && gerson.image_index >= 0 && gerson.image_index < 0.8333333333333334 && walkvar == 0)
        {
            snd_play_pitch(snd_bump, 0.9);
            walkvar = 1;
        }
        if (gerson.sprite_index == spr_gerson_outfit_walk && gerson.image_index >= 2 && gerson.image_index < 2.8333333333333335 && walkvar == 1)
        {
            snd_play_pitch(snd_bump, 0.9);
            walkvar = 0;
        }
        if (gersontimer == 120)
        {
            audio_resume_sound(global.batmusic[1]);
            gerson.sprite_index = spr_gerson_outfit_idle;
            gerson.image_speed = 0;
            gersontimer = 0;
            actcon = 1;
        }
        with (obj_balthizard_enemy)
            gersonvar = 1;
    }
    if (actingsus == 1 && actconsus == 1)
    {
        scr_mercyadd(myself, 30);
        var s_act_text = stringsetloc("* Susie shakes Balthizard!", "obj_balthizard_enemy_slash_Step_0_gml_959_0");
        if (simultotal == 1)
        {
            msgset(0, s_act_text + "/%");
            scr_battletext_default();
            actconsus = 20;
        }
        else
        {
            msgset(0, s_act_text);
            scr_simultext("susie");
            if (simulordersus == 0)
                actconsus = 20;
            else
                actconsus = 0;
        }
    }
    if (actingral == 1 && actconral == 1)
    {
        scr_mercyadd(myself, 30);
        var r_act_text = stringsetloc("* Ralsei shakes Balthizard!", "obj_balthizard_enemy_slash_Step_0_gml_979_0");
        if (simultotal == 1)
        {
            msgset(0, r_act_text + "/%");
            scr_battletext_default();
            actconral = 20;
        }
        else
        {
            msgset(0, r_act_text);
            scr_simultext("ralsei");
            if (simulorderral == 0)
                actconral = 20;
            else
                actconral = 0;
        }
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
if (global.turntimer < 1)
{
    with (obj_animation)
    {
        if (sprite_index == spr_incense_fire_explosion1c)
            instance_destroy();
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
