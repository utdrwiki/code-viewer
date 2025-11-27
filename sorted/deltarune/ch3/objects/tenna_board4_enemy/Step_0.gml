if (!i_ex(obj_herosusie) || !i_ex(obj_heroralsei))
{
    if (debugvar == false && scr_debug())
    {
        scr_debug_print("You need Susie and Ralsei for this battle");
        debugvar = true;
    }
    exit;
}
if (intro >= 1)
    obj_battlecontroller.oopsallacts = 1;
if (gachainit == 0)
{
    kris_gacha = instance_create(0, 0, obj_tenna_board4_gacha);
    kris_gacha.actor_target = 1409;
    kris_gacha.mode = 3;
    kris_gacha.depth = obj_herokris.depth - 1;
    susie_gacha = instance_create(0, 0, obj_tenna_board4_gacha);
    susie_gacha.actor_target = 1411;
    susie_gacha.mode = 3;
    susie_gacha.depth = obj_herosusie.depth - 1;
    ralsei_gacha = instance_create(0, 0, obj_tenna_board4_gacha);
    ralsei_gacha.actor_target = 1412;
    ralsei_gacha.mode = 3;
    ralsei_gacha.depth = obj_heroralsei.depth - 1;
    gachainit = 1;
}
if (ilovetvcount > 3)
{
    with (obj_actor_tenna)
        preset = -3;
}
if (global.monster[myself] == 1)
{
    if (intro == 0 && tenna_actor.y < ((cameray() + 300) - tenna_actor.vspeed))
    {
        tenna_actor.y = cameray() + 300;
        tenna_actor.vspeed = 0;
        snd_play(snd_impact);
        instance_create(x, y, obj_shake);
        with (obj_writer)
            instance_destroy();
        global.fc = 22;
        global.typer = 81;
        msgsetloc(0, "We've got a very&special battle for you&today, folks!", "obj_tenna_board4_enemy_slash_Step_0_gml_43_0");
        with (scr_enemyblcon(tenna_actor.x + 86, tenna_actor.y - 140, 10))
            side = -1;
        myblcon.depth = depth - 10;
        intro = 0.1;
    }
    if (intro == 0.1)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            global.fc = 22;
            global.typer = 81;
            msgsetloc(0, "Very SPECIAL indeed,&hahaha.", "obj_tenna_board4_enemy_slash_Step_0_gml_54_0");
            with (scr_enemyblcon(tenna_actor.x + 86, tenna_actor.y - 140, 10))
                side = -1;
            myblcon.depth = depth - 10;
            talktimer = 0;
            intro = 0.2;
        }
    }
    if (intro == 0.2)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            global.fc = 22;
            global.typer = 81;
            msgsetloc(0, "All you have to&do to win.", "obj_tenna_board4_enemy_slash_Step_0_gml_67_0");
            with (scr_enemyblcon(tenna_actor.x + 86, tenna_actor.y - 140, 10))
                side = -1;
            myblcon.depth = depth - 10;
            talktimer = 0;
            intro = 0.3;
        }
    }
    if (intro == 0.3)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            global.fc = 22;
            global.typer = 81;
            msgsetloc(0, "Is say \"I LOVE TV.\"", "obj_tenna_board4_enemy_slash_Step_0_gml_80_0");
            with (scr_enemyblcon(tenna_actor.x + 86, tenna_actor.y - 140, 10))
                side = -1;
            myblcon.depth = depth - 10;
            ilovetv_increase = 1;
            talktimer = 0;
            intro = 0.4;
        }
    }
    if (intro == 0.4 && ilovetv_increase == 0)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            global.fc = 22;
            global.typer = 81;
            msgsetloc(0, "And, hahaha, don't&think you'll be able&to try anything funny.", "obj_tenna_board4_enemy_slash_Step_0_gml_94_0");
            with (scr_enemyblcon(tenna_actor.x + 86, tenna_actor.y - 140, 10))
                side = -1;
            myblcon.depth = depth - 10;
            talktimer = 0;
            intro = 0.5;
        }
    }
    if (intro == 0.5)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            global.fc = 22;
            global.typer = 81;
            msgsetloc(0, "Because I've... got THIS.", "obj_tenna_board4_enemy_slash_Step_0_gml_107_0");
            with (scr_enemyblcon(tenna_actor.x + 86, tenna_actor.y - 140, 10))
                side = -1;
            myblcon.depth = depth - 10;
            intro = 0.6;
        }
    }
    if (intro == 0.6)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            tenna_actor.sprite_index = spr_tenna_pose_podium;
            tenna_actor.image_index = 2;
            with (obj_writer)
                instance_destroy();
            global.fc = 22;
            global.typer = 81;
            msgsetloc(0, "Ever read this&CONTRACT? Hmm,&says you guys&are my ACTORs...", "obj_tenna_board4_enemy_slash_Step_0_gml_121_0");
            with (scr_enemyblcon(tenna_actor.x + 86, tenna_actor.y - 140, 10))
                side = -1;
            myblcon.depth = depth - 10;
            talktimer = 0;
            intro = 0.7;
        }
    }
    if (intro == 0.7)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            global.fc = 22;
            global.typer = 81;
            msgsetloc(0, "And that means...&You've gotta ACT!", "obj_tenna_board4_enemy_slash_Step_0_gml_134_0");
            with (scr_enemyblcon(tenna_actor.x + 86, tenna_actor.y - 140, 10))
                side = -1;
            myblcon.depth = depth - 10;
            talktimer = 0;
            intro = 0.8;
        }
    }
    if (intro == 0.8)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            talktimer = 0;
            intro = 1;
        }
    }
    if (intro == 1)
    {
        talktimer++;
        if (softintro == true)
        {
            tenna_actor.sprite_index = spr_tenna_pose_podium;
            tenna_actor.image_index = 2;
            snd_stop(snd_petrify);
        }
        if (talktimer == 1)
        {
            if (obj_battlecontroller.rouxlsgridenabled == true)
                obj_battlecontroller.rouxlsbuttoncount_y = 0;
            snd_play(snd_boost);
            anim = instance_create(x - 200, y + 74 + 40, obj_animation);
            with (anim)
            {
                depth = other.depth + 1;
                image_index = 0;
                image_xscale = 4;
                image_yscale = 4;
                image_speed = 1;
                sprite_index = spr_lancer_card_shine4;
                if (i_ex(obj_zapper_enemy))
                {
                    x += 214;
                    y -= 207;
                }
                if (i_ex(obj_shadowman_enemy))
                {
                    x += 120;
                    y -= 210;
                }
            }
        }
        if (talktimer == 18 && softintro == false)
        {
            tenna_actor.vspeed = -22;
            tenna_actor.hspeed = 10.5;
            tenna_actor.gravity = 2;
            tenna_actor.sprite_index = spr_tenna_attack;
            tenna_actor.image_xscale = -2;
            snd_play(snd_jump);
        }
        if ((tenna_actor.y > tenna_actor.ystart && tenna_actor.vspeed > 0) || (softintro == true && talktimer == 30))
        {
            tenna_actor.sprite_index = spr_tenna_point_up;
            tenna_actor.image_index = 0;
            tenna_actor.vspeed = 0;
            tenna_actor.hspeed = 0;
            tenna_actor.gravity = 0;
            tenna_actor.image_xscale = 2;
            tenna_actor.x = tenna_actor.xstart;
            tenna_actor.y = tenna_actor.ystart;
            if (softintro == false)
            {
                snd_play(snd_impact);
                scr_shakescreen();
            }
            intro = 2;
            talked = 0;
        }
    }
    if (scr_isphase("enemytalk") && talked == 0)
    {
        scr_randomtarget();
        if (attackchosen == false)
        {
            event_user(0);
            attackchosen = true;
        }
        if (!instance_exists(obj_darkener))
            instance_create(0, 0, obj_darkener);
        with (obj_face)
            instance_destroy();
        global.fc = 22;
        global.typer = 81;
        msgset(0, stringsetloc("IT'S!&TV!&TIME!", "obj_tenna_board4_enemy_slash_Step_0_gml_242_0"));
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
        else if (instance_number(obj_monsterparent) == 1 || (i_ex(obj_shadowman_enemy) && obj_shadowman_enemy.image_alpha == 0))
        {
            scr_enemyblcon(tenna_actor.x - 80, tenna_actor.y - 90, 10);
        }
        else if (i_ex(obj_shadowman_enemy))
        {
            scr_enemyblcon(tenna_actor.x - 60, tenna_actor.y - 30, 10);
        }
        else
        {
            scr_enemyblcon(tenna_actor.x - 80, tenna_actor.y - 10, 10);
        }
        myblcon.depth = depth - 100;
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
    if (talked == 0.5)
    {
        talktimer++;
        if ((button3_p() || button1_p()) && talktimer > 15)
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
                msgsetloc(0, "BUT DON'T THINK&IT'S GONNA&BE EASY!!&BECAUSE TODAY.../%", "obj_tenna_board4_enemy_slash_Step_0_gml_291_0");
                ballooncon = 2;
            }
            else if (ballooncon == 2)
            {
                msgsetloc(0, "WE'VE GOT AN&ALL-STAR CAST!/%", "obj_tenna_board4_enemy_slash_Step_0_gml_292_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 3)
            {
                msgsetloc(0, "BLUR!/%", "obj_tenna_board4_enemy_slash_Step_0_gml_293_0");
                ballooncon = 4;
            }
            talked = 0.7;
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
                global.fc = 22;
                global.typer = 81;
                scr_enemyblcon(x + 40, global.monstery[myself] - 60, 10);
            }
            myblcon.depth = depth - 100;
            ralseitalks = 0;
            susietalks = 0;
            alarm[6] = 1;
        }
    }
    if (talked == 1 && scr_isphase("enemytalk") && !i_ex(obj_writer))
    {
        global.mnfight = 1.5;
        attackchosen = false;
    }
    if (global.mnfight == 1.5)
    {
        if (!instance_exists(obj_growtangle))
            instance_create(__view_get(e__VW.XView, 0) + 320, __view_get(e__VW.YView, 0) + 170, obj_growtangle);
        if (!instance_exists(obj_moveheart) && !i_ex(obj_heart))
            scr_moveheart();
        global.mnfight = 2;
        scr_turntimer(90);
    }
    if (scr_isphase("bullets") && attacked == 0)
    {
        rtimer += 1;
        if (rtimer == 12)
        {
            with (tenna_actor)
                scr_rememberxy();
            if (instance_number(obj_monsterparent) == 1 || (i_ex(obj_shadowman_enemy) && obj_shadowman_enemy.image_alpha == 0))
            {
                global.monsterattackname[myself] = "rimshot lensflare";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 125;
                scr_turntimer(300);
            }
            else
            {
                with (tenna_actor)
                    scr_move_to_point_over_time(x + 170, y, 10);
            }
            turns += 1;
            global.fc = 22;
            global.typer = 81;
            rr = choose(0, 1, 2, 3);
            if (rr == 0)
                global.battlemsg[0] = stringsetloc("* All you have#to do is speak#your mind!", "obj_tenna_board4_enemy_slash_Step_0_gml_353_0");
            if (rr == 1)
                global.battlemsg[0] = stringsetloc("* Look me in#the nose and#SAY IT!", "obj_tenna_board4_enemy_slash_Step_0_gml_354_0");
            if (rr == 2)
                global.battlemsg[0] = stringsetloc("* Sorry, what was#that?! Couldn't#hear you!!", "obj_tenna_board4_enemy_slash_Step_0_gml_355_0");
            if (rr == 3)
                global.battlemsg[0] = stringsetloc("* Our contestants#have been very#naughty!", "obj_tenna_board4_enemy_slash_Step_0_gml_356_0");
            attacked = 1;
        }
    }
    if (global.mnfight == 2 && global.turntimer <= 1)
    {
        with (tenna_actor)
            scr_move_to_point_over_time(___myrememberx, ___myremembery, 10);
    }
    if (endcon == 0)
    {
        if (((global.hp[1] < 1 && global.hp[2] < 1 && global.hp[3] < 1) && global.turntimer > 0) || ((global.hp[1] < 1 || global.hp[2] < 1 || global.hp[3] < 1) && global.turntimer < 2))
        {
            with (obj_battlecontroller)
                noreturn = 1;
            global.turntimer = 0;
            endcon = 1;
        }
    }
    if (endcon == 1)
    {
        endtimer++;
        if (endtimer == 1)
        {
            snd_stop(snd_hurt1);
            snd_play(snd_hurt1);
        }
        if (endtimer == 1)
            tenna_actor.sprite_index = spr_tenna_evil;
        if (endtimer == 15)
        {
            global.fc = 22;
            global.typer = 81;
            msgsetloc(0, "HEY! Fainting&isn't part of&the SCRIPT!/%", "obj_tenna_board4_enemy_slash_Step_0_gml_383_0");
            scr_enemyblcon(tenna_actor.x - 80, tenna_actor.y - 30, 10);
            endcon = 2;
            endtimer = 0;
        }
    }
    if (endcon == 2 && !i_ex(obj_writer))
    {
        endcon = 3;
        global.fc = 22;
        global.typer = 81;
        msgsetloc(0, "Eat some&TV Dinner and&GET UP!!!/%", "obj_tenna_board4_enemy_slash_Step_0_gml_395_0");
        scr_enemyblcon(tenna_actor.x - 80, tenna_actor.y - 30, 10);
        with (obj_dmgwriter)
        {
            if (delaytimer >= 1)
                killactive = 1;
        }
        for (i = 0; i < 3; i++)
        {
            if (global.hp[i + 1] <= 0)
            {
                var _hltarget = global.char[i];
                var _curhp = global.hp[_hltarget];
                if (_curhp <= 0)
                    var _healpower = -_curhp + 5;
                else
                    var _healpower = 1;
                scr_heal(i, 100);
                with (global.charinstance[i])
                {
                    ha = instance_create(x, y, obj_healanim);
                    ha.target = id;
                    dmgwr = scr_dmgwriter_selfchar();
                    with (dmgwr)
                    {
                        delay = 8;
                        type = 3;
                        damage = 100;
                    }
                    if (global.hp[global.char[myself]] >= global.maxhp[global.char[myself]])
                    {
                        with (dmgwr)
                            specialmessage = 3;
                    }
                    tu += 1;
                }
            }
        }
        for (i = 0; i < 3; i++)
        {
            with (global.charinstance[i])
                tu--;
        }
    }
    if (endcon == 3 && !i_ex(obj_writer))
    {
        endcon = 0;
        obj_battlecontroller.alarm[2] = 1;
        with (obj_battlecontroller)
            noreturn = 0;
        tenna_actor.sprite_index = spr_tenna_point_up;
    }
    if (global.mnfight == 2 && global.turntimer < 1 && endcon == 3 && !i_ex(obj_writer))
    {
        endcon = 4;
        global.fighting = 0;
        obj_battlecontroller.noreturn = 1;
        obj_battlecontroller.intro = 2;
        with (obj_tensionbar)
        {
            alarm[5] = 15;
            hspeed = -10;
            friction = -0.4;
        }
        snd_stop(global.batmusic[1]);
        if (global.turntimer > 0)
            global.turntimer = 0;
        global.fighting = 0;
        with (obj_dbulletcontroller)
            instance_destroy();
        with (obj_heart)
            instance_destroy();
        with (obj_growtangle)
            instance_destroy();
        with (obj_writer)
            instance_destroy();
        with (obj_face)
            instance_destroy();
        with (obj_lerpvar)
            instance_destroy();
        with (obj_script_delayed)
            instance_destroy();
        with (obj_afterimage_grow)
            instance_destroy();
        with (obj_darkener)
            instance_destroy();
        scr_endcombat();
    }
}
if (global.myfight == 3)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    if (acting == 1 && actcon == 0)
    {
        msgsetloc(0, "* Everyone said I Love TV to Tenna!/%", "obj_tenna_board4_enemy_slash_Step_0_gml_410_0");
        scr_battletext_default();
        acting = 1.1;
    }
    if (acting == 1.1 && actcon == 0 && !i_ex(obj_writer))
    {
        ilovetv_increase = 3;
        ilovetvcount += 3;
        if (ilovetvcount == 2)
        {
            scr_wincombat();
            with (obj_battlecontroller)
                skipvictory = 1;
        }
        else
        {
            acting = 1.2;
        }
    }
    if (acting == 1.2 && actcon == 0)
    {
        with (obj_writer)
            instance_destroy();
        global.typer = 81;
        if (global.board4ilovetvcount == 0)
            msgsetloc(0, "That's right.", "obj_tenna_board4_enemy_slash_Step_0_gml_431_0");
        if (global.board4ilovetvcount == 1)
            msgsetloc(0, "That's CORRECT!", "obj_tenna_board4_enemy_slash_Step_0_gml_432_0");
        if (global.board4ilovetvcount == 2)
            msgsetloc(0, "Haha, that's right!!!", "obj_tenna_board4_enemy_slash_Step_0_gml_433_0");
        if (global.board4ilovetvcount >= 3)
            msgsetloc(0, "...", "obj_tenna_board4_enemy_slash_Step_0_gml_434_0");
        if (instance_number(obj_monsterparent) == 1 || (i_ex(obj_shadowman_enemy) && obj_shadowman_enemy.image_alpha == 0))
            scr_enemyblcon(tenna_actor.x - 80, tenna_actor.y - 90, 10);
        else if (i_ex(obj_shadowman_enemy))
            scr_enemyblcon(tenna_actor.x - 60, tenna_actor.y - 30, 10);
        else
            scr_enemyblcon(tenna_actor.x - 80, tenna_actor.y - 10, 10);
        talktimer = 0;
        acting = 1.3;
    }
    if (acting == 1.3 && actcon == 0)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            global.typer = 81;
            if (global.board4ilovetvcount == 0)
                msgsetloc(0, "You love TV...&don't you?", "obj_tenna_board4_enemy_slash_Step_0_gml_453_0");
            if (global.board4ilovetvcount == 1)
                msgsetloc(0, "Sorry, just needed&to hear it again!&Haha!", "obj_tenna_board4_enemy_slash_Step_0_gml_454_0");
            if (global.board4ilovetvcount == 2)
                msgsetloc(0, "... but did you&really mean it?", "obj_tenna_board4_enemy_slash_Step_0_gml_455_0");
            if (global.board4ilovetvcount == 3)
                msgsetloc(0, "No...", "obj_tenna_board4_enemy_slash_Step_0_gml_456_0");
            if (global.board4ilovetvcount > 3)
                msgsetloc(0, "Mike, get another&take ready.", "obj_tenna_board4_enemy_slash_Step_0_gml_457_0");
            if (instance_number(obj_monsterparent) == 1 || (i_ex(obj_shadowman_enemy) && obj_shadowman_enemy.image_alpha == 0))
                scr_enemyblcon(tenna_actor.x - 80, tenna_actor.y - 90, 10);
            else if (i_ex(obj_shadowman_enemy))
                scr_enemyblcon(tenna_actor.x - 60, tenna_actor.y - 30, 10);
            else
                scr_enemyblcon(tenna_actor.x - 80, tenna_actor.y - 10, 10);
            talktimer = 0;
            acting = 1.4;
            if (global.board4ilovetvcount == 3)
                acting = 1.33;
        }
    }
    if (acting == 1.33 && actcon == 0)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            global.typer = 81;
            msgsetloc(0, "It's NOT GOOD ENOUGH!!!", "obj_tenna_board4_enemy_slash_Step_0_gml_477_0");
            if (instance_number(obj_monsterparent) == 1 || (i_ex(obj_shadowman_enemy) && obj_shadowman_enemy.image_alpha == 0))
                scr_enemyblcon(tenna_actor.x - 80, tenna_actor.y - 90, 10);
            else if (i_ex(obj_shadowman_enemy))
                scr_enemyblcon(tenna_actor.x - 60, tenna_actor.y - 30, 10);
            else
                scr_enemyblcon(tenna_actor.x - 80, tenna_actor.y - 10, 10);
            talktimer = 0;
            acting = 1.36;
        }
    }
    if (acting == 1.36 && actcon == 0)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            global.typer = 81;
            msgsetloc(0, "This game's never&going to end&until you mean it!", "obj_tenna_board4_enemy_slash_Step_0_gml_556_0_b");
            if (instance_number(obj_monsterparent) == 1 || (i_ex(obj_shadowman_enemy) && obj_shadowman_enemy.image_alpha == 0))
                scr_enemyblcon(tenna_actor.x - 80, tenna_actor.y - 90, 10);
            else if (i_ex(obj_shadowman_enemy))
                scr_enemyblcon(tenna_actor.x - 60, tenna_actor.y - 30, 10);
            else
                scr_enemyblcon(tenna_actor.x - 80, tenna_actor.y - 10, 10);
            talktimer = 0;
            acting = 1.4;
        }
    }
    if (acting == 1.4 && actcon == 0)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            global.board4ilovetvcount++;
            with (obj_writer)
                instance_destroy();
            with (obj_battlecontroller)
                skipvictory = 1;
            talktimer = 0;
            scr_wincombat();
        }
    }
    if (acting == 2 && actcon == 0)
    {
        msgsetloc(0, "* Everyone resisted!", "obj_tenna_board4_enemy_slash_Step_0_gml_522_0");
        scr_battletext_default();
        resistcount++;
        if (resistcount == 1)
            acting = 2.01;
        if (resistcount == 2)
            acting = 2.11;
        if (resistcount == 3)
            acting = 2.11;
        if (resistcount > 3)
            acting = 2.21;
    }
    if (acting == 2.01 && actcon == 0)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            global.typer = 81;
            msgsetloc(0, "Uh oh,&our contestants...", "obj_tenna_board4_enemy_slash_Step_0_gml_483_0");
            with (scr_enemyblcon(tenna_actor.x - 56, tenna_actor.y - 140, 10))
            {
            }
            myblcon.depth = depth - 10;
            talktimer = 0;
            acting = 2.02;
        }
    }
    if (acting == 2.02 && actcon == 0)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            global.typer = 81;
            msgsetloc(0, "Seem to have&chosen the&WRONG ANSWER!", "obj_tenna_board4_enemy_slash_Step_0_gml_497_0");
            with (scr_enemyblcon(tenna_actor.x - 56, tenna_actor.y - 140, 10))
            {
            }
            myblcon.depth = depth - 10;
            talktimer = 0;
            acting = 2.03;
        }
    }
    if (acting == 2.03 && actcon == 0)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            global.typer = 81;
            msgsetloc(0, "You know what&THAT MEANS!", "obj_tenna_board4_enemy_slash_Step_0_gml_511_0");
            with (scr_enemyblcon(tenna_actor.x - 56, tenna_actor.y - 140, 10))
            {
            }
            myblcon.depth = depth - 10;
            talktimer = 0;
            acting = 2.04;
        }
    }
    if (acting == 2.04 && actcon == 0)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            talktimer = 0;
            acting = 0;
            actcon = 1;
        }
    }
    if (acting == 2.11 && actcon == 0)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            global.typer = 81;
            msgsetloc(0, "WRONG ANSWER!", "obj_tenna_board4_enemy_slash_Step_0_gml_540_0");
            with (scr_enemyblcon(tenna_actor.x - 56, tenna_actor.y - 140, 10))
            {
            }
            myblcon.depth = depth - 10;
            talktimer = 0;
            acting = 2.04;
        }
    }
    if (acting == 2.21 && actcon == 0)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            global.typer = 81;
            msgsetloc(0, "ENOUGH ALREADY!", "obj_tenna_board4_enemy_slash_Step_0_gml_556_0");
            with (scr_enemyblcon(tenna_actor.x - 56, tenna_actor.y - 140, 10))
            {
            }
            myblcon.depth = depth - 10;
            talktimer = 0;
            acting = 2.22;
        }
    }
    if (acting == 2.22 && actcon == 0)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            global.typer = 81;
            msgsetloc(0, "Seems our contestants&aren't ready to&admit it yet.", "obj_tenna_board4_enemy_slash_Step_0_gml_570_0");
            with (scr_enemyblcon(tenna_actor.x - 56, tenna_actor.y - 140, 10))
            {
            }
            myblcon.depth = depth - 10;
            talktimer = 0;
            acting = 2.23;
        }
    }
    if (acting == 2.23 && actcon == 0)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            global.typer = 81;
            msgsetloc(0, "Mike! Back&to the board!", "obj_tenna_board4_enemy_slash_Step_0_gml_584_0");
            with (scr_enemyblcon(tenna_actor.x - 56, tenna_actor.y - 140, 10))
            {
            }
            myblcon.depth = depth - 10;
            talktimer = 0;
            acting = 2.24;
        }
    }
    if (acting == 2.24 && actcon == 0)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            with (obj_battlecontroller)
                skipvictory = 1;
            scr_wincombat();
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
    hurttimer -= 1;
    if (hurttimer < 0 && !i_ex(obj_shadowman_sharpshoot_target))
    {
        state = 0;
        tenna_actor.x = camerax() + 526;
        if (global.encounterno == 134 || global.encounterno == 135)
            tenna_actor.x = camerax() + 566;
        tenna_actor.y = cameray() + 260;
    }
    else
    {
        if (global.monster[myself] == 0)
            scr_defeatrun();
        hurtshake += 1;
        if (hurtshake > 1)
        {
            if (shakex > 0)
                shakex -= 1;
            if (shakex < 0)
                shakex += 1;
            shakex = -shakex;
            hurtshake = 0;
        }
    }
}
if (i_ex(tenna_actor))
    tenna_actor.flash = flash;
if (ilovetv_increase > 0 && digit_flash_timer == 0)
{
    if (ilovetv < 99)
    {
        ilovetv_increased = true;
        if (ilovetv < 98)
            snd_play_pitch(snd_scissorbell, ilovetv_pitch);
        else
            snd_play(snd_sparkle_glock);
        if (ilovetv_increase == 99)
        {
            ilovetv += 1;
            ilovetv = min(ilovetv, 99);
            ilovetv_pitch = 1 + (ilovetv / 100);
        }
        else
        {
            ilovetv++;
            ilovetv_increase--;
            ilovetv_pitch += 0.1;
        }
        digit_flash_timer = digit_flash_duration;
    }
    if (ilovetv_increase == 0)
        ilovetv_pitch = 1;
}
if (tietimer > 0)
{
    tietimer++;
    if (tietimer == 2)
        tenna_actor.sprite_index = spr_tenna_tie_adjust_a;
    if (tietimer == 5)
        tenna_actor.sprite_index = spr_tenna_tie_adjust_b;
    if (tietimer == 8)
        tietimer = 1;
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
