var _str1 = stringsetloc("* Guei looks \\cBTIRED\\c0. Perhaps Ralsei's MAGIC, \\cBPACIFY\\c0 would be effective...", "obj_guei_enemy_slash_Step_0_gml_3_0");
var _str2 = stringsetloc("* Guei looks \\cBTIRED\\c0. \\cYDEFEND\\c0 to gain \\cYTP\\c0, then try Ralsei's MAGIC, \\cBPACIFY\\c0...!", "obj_guei_enemy_slash_Step_0_gml_4_0");
if (global.monster[myself] == 1)
{
    if (scr_isphase("enemytalk") && talked == 0)
    {
        scr_randomtarget();
        myattackchoice = choose(0, 1);
        myattackpriority = 1;
        if (myattackchoice == 2)
            myattackpriority = 50;
        scr_attackpriority(myattackpriority - 1);
        if (!instance_exists(obj_darkener))
            instance_create(0, 0, obj_darkener);
        balloon = instance_create(x, y + 60, obj_guei_balloon);
        if (exercism == 1)
        {
            balloon.image_index = 6;
        }
        else
        {
            if (balloonorder == 0)
                balloon.image_index = 0;
            if (balloonorder == 1)
                balloon.image_index = 1;
            if (balloonorder == 2)
                balloon.image_index = 2;
            if (balloonorder == 3)
                balloon.image_index = 3;
            if (balloonorder == 4)
                balloon.image_index = 4;
            if (balloonorder == 5)
                balloon.image_index = 5;
            balloonorder++;
            if (balloonorder == 6)
                balloonorder = 0;
        }
        talked = 1;
        talktimer = 0;
        rtimer = 0;
    }
    if (talked == 1 && scr_isphase("enemytalk"))
        scr_blconskip(15);
    if (global.mnfight == 1.5)
    {
        if (scr_attackpriority(myattackpriority))
        {
            if (!instance_exists(obj_growtangle))
                instance_create(__view_get(e__VW.XView, 0) + 320, __view_get(e__VW.YView, 0) + 170, obj_growtangle);
            if (myattackchoice == 2)
            {
            }
            if (!instance_exists(obj_moveheart))
                scr_moveheart();
            global.mnfight = 2;
            scr_turntimer(90);
            gothitthisturn = false;
        }
    }
    if (scr_isphase("bullets") && attacked == 0)
    {
        rtimer += 1;
        if (rtimer == 12)
        {
            if (i_ex(obj_gerson_cane_bullet) && !i_ex(obj_dbulletcontroller))
            {
                global.monsterattackname[myself] = "gueigersoncane";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 101.5;
            }
            else if (i_ex(obj_gerson_cane_bullet) && i_ex(obj_dbulletcontroller))
            {
            }
            else if (myattackchoice == 0)
            {
                global.monsterattackname[myself] = "hauntedflames";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 100;
            }
            else if (myattackchoice == 1)
            {
                global.monsterattackname[myself] = "clawdrop";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 101;
            }
            exercism = 0;
            scr_turntimer(200);
            if (i_ex(obj_gerson_cane_bullet))
                scr_turntimer(400);
            turns += 1;
            global.typer = 6;
            global.fc = 0;
            rr = choose(0, 1, 2, 3);
            if (scr_messagepriority(random(2)))
            {
                if (rr == 0)
                    global.battlemsg[0] = stringsetloc("* Guei turns its head like a bird.", "obj_guei_enemy_slash_Step_0_gml_127_0");
                if (rr == 1)
                    global.battlemsg[0] = stringsetloc("* Guei rattles its claws.", "obj_guei_enemy_slash_Step_0_gml_128_0");
                if (rr == 2)
                    global.battlemsg[0] = stringsetloc("* Guei wags its tail.", "obj_guei_enemy_slash_Step_0_gml_129_0");
                if (rr == 3)
                    global.battlemsg[0] = stringsetloc("* Guei howls hauntingly.", "obj_guei_enemy_slash_Step_0_gml_130_0");
                if (irandom(100) < 3)
                    global.battlemsg[0] = stringsetloc("* Smells like teens.&* Smells like spirits.", "obj_guei_enemy_slash_Step_0_gml_131_0");
            }
            if (global.monsterhp[myself] <= (global.monstermaxhp[myself] / 3))
            {
                if (scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Guei's flames flicker weakly.", "obj_guei_enemy_slash_Step_0_gml_137_0");
            }
            if (global.mercymod[myself] >= 100)
            {
                if (scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Guei looks satisfied in some odd way.", "obj_guei_enemy_slash_Step_0_gml_142_0");
            }
            if (global.monsterstatus[myself] == 1)
            {
                if (scr_messagepriority(103 + random(2)))
                {
                    global.battlemsg[0] = _str1;
                    if (global.tension < 40)
                        global.battlemsg[0] = _str2;
                }
            }
            attacked = 1;
        }
    }
    if (global.mnfight == 2 && global.turntimer <= 1)
        gersonvar = 0;
    if (global.mnfight == 2 && global.turntimer <= 1 && postenemyturnevent == 0)
    {
        postenemyturnevent = 1;
        scr_monster_make_tired(myself);
        if (global.monsterstatus[myself] == 1)
        {
            if (scr_messagepriority(103 + random(2)))
            {
                global.battlemsg[0] = _str1;
                if (global.tension < 40)
                    global.battlemsg[0] = _str2;
            }
        }
    }
}
if (global.myfight == 3)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    if (acting == 1 && actcon == 0)
    {
        actcon = 1;
        msgsetloc(0, "* GUEI - A strange spirit said to appear when the moon waxes./%", "obj_guei_enemy_slash_Step_0_gml_189_0");
        scr_battletext_default();
    }
    if (acting == 2 && actcon == 0)
    {
        actcon = 1;
        msgsetloc(0, "* You started the exercism!&* You encouraged Guei to exercise!/%", "obj_guei_enemy_slash_Step_0_gml_196_0");
        scr_mercyadd(myself, 20);
        scr_battletext_default();
        exercism = 1;
        postenemyturnevent = 0;
    }
    if (acting == 3 && actcon == 0)
    {
        msgsetloc(0, "* Everyone encouraged Guei to exercise!/%", "obj_guei_enemy_slash_Step_0_gml_206_0");
        scr_mercyadd(myself, 60);
        scr_battletext_default();
        actcon = 1;
        exercism = 1;
        postenemyturnevent = 0;
    }
    if (acting == 4 && actcon == 0)
    {
        if (gersonactcount == 0)
        {
            gersontimer++;
            if (gersontimer == 1)
            {
                gerson = instance_create_depth(camerax() - 100, cameray() + 230, depth - 10, obj_marker);
                gerson.sprite_index = spr_gerson_outfit_walk_cane;
                gerson.image_speed = 0.16666666666666666;
                gerson.image_xscale = -2;
                gerson.image_yscale = 2;
                createdgerson = true;
                with (obj_guei_enemy)
                    gerson = other.gerson;
                audio_pause_sound(global.batmusic[1]);
            }
            gerson.x = lerp(camerax() - 100, camerax() + 400, gersontimer / 120);
            if (gerson.sprite_index == spr_gerson_outfit_walk_cane && gerson.image_index >= 0 && gerson.image_index < 0.8333333333333334 && walkvar == 0)
            {
                snd_play_pitch(snd_bump, 0.9);
                walkvar = 1;
            }
            if (gerson.sprite_index == spr_gerson_outfit_walk_cane && gerson.image_index >= 2 && gerson.image_index < 2.8333333333333335 && walkvar == 1)
            {
                snd_play_pitch(snd_bump, 0.9);
                walkvar = 0;
            }
            if (gersontimer == 120)
            {
                audio_resume_sound(global.batmusic[1]);
                gerson.sprite_index = spr_gerson_outfit_walk_cane;
                gerson.image_speed = 0;
                gerson.image_xscale = 2;
                gersontimer = 0;
                acting = 35;
                gerson.x -= 74;
                global.typer = 86;
                msgsetloc(0, "How's it goin'?/%", "obj_guei_enemy_slash_Step_0_gml_251_0");
                scr_enemyblcon(gerson.x, gerson.y + 32, 10);
                for (var i = 0; i < instance_number(obj_guei_enemy); i++)
                {
                    guei[i] = instance_find(obj_guei_enemy, i);
                    guei[i].gersonactcount++;
                }
            }
        }
        else if (gersonactcount == 1)
        {
            var b = 0;
            for (var i = 0; i < instance_number(obj_guei_enemy); i++)
            {
                guei[i] = instance_find(obj_guei_enemy, i);
                if (global.monstermaxhp[guei[i].myself] != global.monsterhp[guei[i].myself])
                    b = 1;
            }
            if (b == 1)
            {
                msgsetloc(0, "* Called the OldMan! Nothing happened!/%", "obj_guei_enemy_slash_Step_0_gml_273_0");
                scr_battletext_default();
                actcon = 1;
            }
            else
            {
                gersontimer++;
                if (gersontimer == 1)
                {
                    if (gerson == -1)
                    {
                        gerson = instance_create_depth(camerax() - 100, cameray() + 140, depth - 10, obj_marker);
                        gerson.sprite_index = spr_gerson_outfit_walk;
                        gerson.image_speed = 0.16666666666666666;
                        gerson.image_yscale = 2;
                    }
                    gerson.visible = true;
                    gerson.y = cameray() + 40;
                    gerson.depth = obj_herokris.depth + 10;
                    gerson.image_xscale = -2;
                    gerson.sprite_index = spr_gerson_outfit_walk;
                    gerson.image_speed = 0.16666666666666666;
                    audio_pause_sound(global.batmusic[1]);
                }
                gerson.x = lerp(camerax() - 100, camerax() + 450, gersontimer / 120);
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
                    acting = 41;
                    gerson.x -= 74;
                    global.typer = 86;
                    msgsetloc(0, "Hmm, you called&it a battle,&but I don't&see much fightin'./%", "obj_guei_enemy_slash_Step_0_gml_314_0");
                    scr_enemyblcon(gerson.x, gerson.y + 32, 10);
                }
            }
        }
    }
    if (acting >= 35 && acting < 50)
        talktimer++;
    if (acting == 35 && actcon == 0)
    {
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            talktimer = 0;
            global.typer = 75;
            msgsetloc(0, "Get out of here!!&These guys are tough!!/%", "obj_guei_enemy_slash_Step_0_gml_332_0");
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
            global.typer = 86;
            msgsetloc(0, "Alright,&alright.../%", "obj_guei_enemy_slash_Step_0_gml_347_0");
            scr_enemyblcon(gerson.x, gerson.y + 32, 10);
            gersontimer = 0;
            acting = 37;
        }
    }
    if ((acting == 37 && actcon == 0 && gersontimer == 0 && ((button3_p() && talktimer > 15) || !i_ex(obj_writer))) || (acting == 37 && gersontimer > 0))
    {
        gersontimer++;
        if (gersontimer == 1)
        {
            with (obj_writer)
                instance_destroy();
            talktimer = 0;
            gerson.sprite_index = spr_gerson_outfit_walk_cane;
            gerson.image_speed = 0.16666666666666666;
            gerson.image_xscale = 2;
            audio_pause_sound(global.batmusic[1]);
        }
        gerson.x = lerp((camerax() + 400) - 74, camerax() - 100, gersontimer / 120);
        if (gerson.sprite_index == spr_gerson_outfit_walk_cane && gerson.image_index >= 0 && gerson.image_index < 0.8333333333333334 && walkvar == 0)
        {
            snd_play_pitch(snd_bump, 0.9);
            walkvar = 1;
        }
        if (gerson.sprite_index == spr_gerson_outfit_walk_cane && gerson.image_index >= 2 && gerson.image_index < 2.8333333333333335 && walkvar == 1)
        {
            snd_play_pitch(snd_bump, 0.9);
            walkvar = 0;
        }
        if (gersontimer == 40)
        {
            gerson.sprite_index = spr_gerson_outfit_idle;
            gerson.image_speed = 0;
            acting = 38;
        }
    }
    if (acting == 38 && actcon == 0)
    {
        gerson.x += 74;
        gerson.image_xscale = -2;
        global.typer = 86;
        msgsetloc(0, "Whoops,&dropped my cane./%", "obj_guei_enemy_slash_Step_0_gml_387_0");
        scr_enemyblcon(gerson.x + 37, gerson.y + 32, 10);
        myblcon.side = -1;
        with (gerson)
            scr_shakeobj();
        instance_create(gerson.x, gerson.y, obj_gerson_cane_bullet);
        with (object_index)
            gothitthisturn = false;
        acting = 39;
    }
    if (acting == 39 && actcon == 0)
    {
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            talktimer = 0;
            global.typer = 86;
            msgsetloc(0, "Ya mind getting&that for me?/%", "obj_guei_enemy_slash_Step_0_gml_406_0");
            scr_enemyblcon(gerson.x + 37, gerson.y + 32, 10);
            myblcon.side = -1;
            with (obj_guei_enemy)
                gersonvar = 1;
            acting = 40;
        }
    }
    if ((acting == 40 && actcon == 0 && gersontimer == 40 && ((button3_p() && talktimer > 15) || !i_ex(obj_writer)) && !i_ex(obj_jump_to_point)) || (acting == 40 && gersontimer > 40))
    {
        gersontimer += 3;
        if (gersontimer == 43)
        {
            with (obj_writer)
                instance_destroy();
            talktimer = 0;
            gerson.sprite_index = spr_gerson_outfit_genki;
            gerson.image_speed = 0.25;
            gerson.x -= 74;
            gerson.image_xscale = 2;
        }
        if (gerson.sprite_index == spr_gerson_outfit_genki && gerson.image_index >= 0 && gerson.image_index < 0.8333333333333334 && walkvar == 0)
        {
            snd_play_pitch(snd_bump, 0.9);
            walkvar = 1;
        }
        if (gerson.sprite_index == spr_gerson_outfit_genki && gerson.image_index >= 2 && gerson.image_index < 2.8333333333333335 && walkvar == 1)
        {
            snd_play_pitch(snd_bump, 0.9);
            walkvar = 0;
        }
        gerson.x = lerp((camerax() + 400) - 74, camerax() - 100, gersontimer / 120);
        if (gersontimer >= 120)
        {
            audio_resume_sound(global.batmusic[1]);
            gerson.sprite_index = spr_gerson_outfit_idle;
            gerson.image_speed = 0;
            gersontimer = 0;
            gerson.visible = false;
            actcon = 1;
        }
    }
    if (acting == 41 && actcon == 0)
    {
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            talktimer = 0;
            global.typer = 74;
            msgsetloc(0, "We don't hurt&the enemies,&we SPARE them!/%", "obj_guei_enemy_slash_Step_0_gml_451_0");
            scr_heroblcon("ralsei");
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
            msgsetloc(0, "Spare, huh?&Like this?/%", "obj_guei_enemy_slash_Step_0_gml_466_0");
            scr_enemyblcon(gerson.x, gerson.y + 32, 10);
            acting = 43;
        }
    }
    if ((acting == 43 && actcon == 0 && gersontimer == 0 && ((button3_p() && talktimer > 15) || !i_ex(obj_writer))) || (acting == 43 && gersontimer > 0))
    {
        global.flag[868] = 1;
        gersontimer++;
        if (gersontimer == 1)
        {
            gerson.sprite_index = spr_gerson_spare;
            gerson.image_speed = 0.5;
            with (obj_writer)
                instance_destroy();
            talktimer = 0;
            gerson.x += 74;
            gerson.image_xscale = -2;
            with (obj_guei_enemy)
            {
                visible = false;
                snd_play(snd_sparkle_gem);
                spareanim = instance_create(x, y, obj_spareanim);
                spareanim.sprite_index = sprite_index;
                spareanim.sprite_index = sparedsprite;
                spareanim.image_index = 0;
                spareanim.image_xscale = image_xscale;
                spareanim.image_yscale = image_yscale;
                _recruitanim = instance_create(global.monsterx[myself] + 20, global.monstery[myself] - 40, obj_recruitanim);
                _recruitanim.sprite_index = spr_recruited_by_oldman;
                if (global.lang == "ja")
                    _recruitanim.sprite_index = spr_recruited_by_oldman_ja;
            }
        }
        if (gersontimer == 28)
        {
            gerson.sprite_index = spr_gerson_outfit_idle;
            gerson.image_speed = 0;
        }
        if (gersontimer == 60)
        {
            acting = 44;
            gersontimer = 0;
        }
    }
    if (acting == 44 && actcon == 0)
    {
        with (obj_writer)
            instance_destroy();
        talktimer = 0;
        scr_battle_sprite_set("susie", spr_susie_shock_r, 0, 1);
        scr_battle_sprite_set("ralsei", spr_ralsei_shocked_right, 0, 1);
        with (obj_herosusie)
            scr_shakeobj();
        with (obj_heroralsei)
            scr_shakeobj();
        global.typer = 74;
        msgsetloc(0, "Y... you&recruited them!?/%", "obj_guei_enemy_slash_Step_0_gml_530_0");
        scr_heroblcon("ralsei");
        acting = 45;
    }
    if (acting == 45 && actcon == 0)
    {
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            talktimer = 0;
            global.typer = 86;
            msgsetloc(0, "Huh,&whaddya know,&it works!/%", "obj_guei_enemy_slash_Step_0_gml_544_0");
            scr_enemyblcon(gerson.x + 22, gerson.y + 32, 10);
            myblcon.side = -1;
            acting = 46;
        }
    }
    if (acting == 46 && actcon == 0)
    {
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            talktimer = 0;
            global.typer = 86;
            msgsetloc(0, "I'll let you&kids finish&your battle!&Geh heh heh!/%", "obj_guei_enemy_slash_Step_0_gml_560_0");
            scr_enemyblcon(gerson.x + 22, gerson.y + 32, 10);
            myblcon.side = -1;
            acting = 47;
        }
    }
    if ((acting == 47 && actcon == 0 && gersontimer == 0 && ((button3_p() && talktimer > 15) || !i_ex(obj_writer))) || (acting == 47 && gersontimer > 0))
    {
        gersontimer++;
        if (gersontimer == 1)
        {
            with (obj_writer)
                instance_destroy();
            talktimer = 0;
            gerson.sprite_index = spr_gerson_outfit_walk;
            gerson.image_speed = 0.16666666666666666;
            gerson.image_xscale = 2;
            audio_pause_sound(global.batmusic[1]);
        }
        gerson.x = lerp((camerax() + 450) - 74, camerax() - 100, gersontimer / 120);
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
            gerson.sprite_index = spr_gerson_outfit_idle;
            gerson.image_speed = 0;
            gersontimer = 0;
            acting = 48;
        }
    }
    if (acting == 48 && actcon == 0)
    {
        scr_battle_sprite_reset("susie");
        scr_battle_sprite_reset("ralsei");
        gerson.visible = false;
        msgsetloc(0, "* (But, the battle was already over.)/%", "obj_guei_enemy_slash_Step_0_gml_603_0");
        scr_battletext_default();
        acting = 49;
    }
    if (acting == 49 && actcon == 0 && !i_ex(obj_writer))
    {
        msgsetloc(0, "* (The Old Man received 438 Dark Dollars.)/%", "obj_guei_enemy_slash_Step_0_gml_611_0");
        scr_battletext_default();
        acting = 50;
    }
    if (acting == 50 && actcon == 0 && !i_ex(obj_writer))
    {
        obj_battlecontroller.skipvictory = 1;
        scr_wincombat();
    }
    if (actingsus == 1 && actconsus == 1)
    {
        if (simultotal == 1)
            msgsetloc(0, "* Susie told a story about the living dead!/%", "obj_guei_enemy_slash_Step_0_gml_626_0");
        else
            msgsetloc(0, "* Susie told a ghost story!/%", "obj_guei_enemy_slash_Step_0_gml_627_0");
        scr_mercyadd(myself, 40);
        scr_simultext("susie");
        if (simulordersus == 0)
            actconsus = 20;
        else
            actconsus = 0;
        if (room == room_dw_church_intro_guei)
            global.flag[1639] = 1;
    }
    if (actingral == 1 && actconral == 1)
    {
        if (simultotal == 1)
            msgsetloc(0, "* Ralsei told a family-friendly story about a lovable yet lonely ghost!/%", "obj_guei_enemy_slash_Step_0_gml_638_0");
        else
            msgsetloc(0, "* Ralsei quoted a holy book!/%", "obj_guei_enemy_slash_Step_0_gml_639_0");
        scr_mercyadd(myself, 40);
        scr_simultext("ralsei");
        if (simulorderral == 0)
            actconral = 20;
        else
            actconral = 0;
        if (room == room_dw_church_intro_guei)
            global.flag[1639] = 1;
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
if (gersonevent == true)
{
    with (obj_battlecontroller)
        gueigersoncon = 1;
}
if (gersonvar == 1 && gothitthisturn)
{
    global.battlemsg[0] = stringsetloc("* Damn, that stupid cane made us get hit!", "obj_guei_enemy_slash_Step_0_gml_677_0");
    with (obj_battlecontroller)
        facevar = 2;
    global.fe = 5;
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
