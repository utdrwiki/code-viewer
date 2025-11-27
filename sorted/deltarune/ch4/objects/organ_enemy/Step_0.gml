if (!audio_is_playing(snd_harmonize_act_b))
{
    harmon_sound = snd_play(snd_harmonize_act_b);
    snd_volume(harmon_sound, 0, 0);
}
if (global.turntimer < 2 && audio_is_playing(snd_harmonize_act_b))
    snd_volume(harmon_sound, 0, 0);
if (global.monster[myself] == 1)
{
    if (scr_isphase("enemytalk") && talked == 0)
    {
        scr_randomtarget();
        myattackchoice = 0;
        myattackpriority = 1;
        if (myattackchoice == 2)
            myattackpriority = 50;
        scr_attackpriority(myattackpriority - 1);
        if (!instance_exists(obj_darkener))
            instance_create(0, 0, obj_darkener);
        global.typer = 50;
        rr = choose(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12);
        if (rr == 0)
            msgsetloc(0, "I am the&philosopher.&Amen.", "obj_organ_enemy_slash_Step_0_gml_35_0");
        if (rr == 1)
            msgsetloc(0, "Listen!&The song of&legend plays.&Amen.", "obj_organ_enemy_slash_Step_0_gml_36_0");
        if (rr == 2)
            msgsetloc(0, "The truth&sung in&glass.&Amen.", "obj_organ_enemy_slash_Step_0_gml_37_0");
        if (rr == 3)
            msgsetloc(0, "The tale&which must&be followed.", "obj_organ_enemy_slash_Step_0_gml_38_0");
        if (rr == 4)
            msgsetloc(0, "The tail&which must&not be&followed.", "obj_organ_enemy_slash_Step_0_gml_39_0");
        if (rr == 5)
            msgsetloc(0, "Do re mii&Do re yuu&Do re mon.&Amen.", "obj_organ_enemy_slash_Step_0_gml_40_0");
        if (rr == 6)
            msgsetloc(0, "It was&glowing.&The voice&was glowing!", "obj_organ_enemy_slash_Step_0_gml_41_0");
        if (rr == 7)
            msgsetloc(0, "What is&DELTARUNE?", "obj_organ_enemy_slash_Step_0_gml_42_0");
        if (rr == 8)
            msgsetloc(0, "What isn't&DELTARUNE?", "obj_organ_enemy_slash_Step_0_gml_43_0");
        if (rr == 9)
            msgsetloc(0, "What am I?&Am I a butterfly?", "obj_organ_enemy_slash_Step_0_gml_44_0");
        if (rr == 10)
            msgsetloc(0, "What am I?&Am I a man?", "obj_organ_enemy_slash_Step_0_gml_45_0");
        if (rr == 11)
            msgsetloc(0, "Why are we&fighting?", "obj_organ_enemy_slash_Step_0_gml_46_0");
        if (rr == 12)
            msgsetloc(0, "How could we&ever make&peace?", "obj_organ_enemy_slash_Step_0_gml_47_0");
        if (global.mercymod[myself] >= 100)
            msgsetloc(0, "The answer...&... was LOVE?", "obj_organ_enemy_slash_Step_0_gml_48_0");
        scr_enemyblcon(x - 10, y + 54, 10);
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
            if (!instance_exists(obj_moveheart))
                scr_moveheart();
            global.mnfight = 2;
            scr_turntimer(220);
        }
    }
    if (scr_isphase("bullets") && attacked == 0)
    {
        rtimer += 1;
        if (rtimer == 12)
        {
            if (harmonize > 0 || chorus > 0)
            {
                with (obj_dbulletcontroller)
                {
                    if (type == 109)
                        type = 108;
                }
                myattackchoice = 1;
            }
            else
            {
                var bar_number = 0;
                with (obj_dbulletcontroller)
                {
                    if (type == 109)
                        bar_number++;
                }
                if (bar_number > 0)
                    myattackchoice = 0;
                else
                    myattackchoice = choose(0, 1);
            }
            if (myattackchoice == 0)
            {
                global.monsterattackname[myself] = "organnotes";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 108;
            }
            if (myattackchoice == 1)
            {
                global.monsterattackname[myself] = "organlongnote";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 109;
                if (harmonize == 1)
                    dc.difficulty = 1;
                if (chorus == 1)
                    dc.difficulty = 2;
            }
            scr_turntimer(220);
            if (harmonize > 0 || chorus > 0)
                scr_turntimer(220);
            turns += 1;
            global.typer = 6;
            global.fc = 0;
            rr = choose(0, 1, 2, 3);
            if (scr_messagepriority(random(2)))
            {
                var substring = string(myself);
                if (rr == 0)
                    global.battlemsg[0] = stringsetloc("* Organikk toots philosophically.", "obj_organ_enemy_slash_Step_0_gml_149_0");
                if (rr == 1)
                    global.battlemsg[0] = stringsetloc("* Organikk divinates through echolocation.", "obj_organ_enemy_slash_Step_0_gml_150_0");
                if (rr == 2)
                    global.battlemsg[0] = stringsetloc("* Organikk claps with one hand.", "obj_organ_enemy_slash_Step_0_gml_151_0");
                if (rr == 3)
                    global.battlemsg[0] = stringsetloc("* Organikk considers the meaning of the stars and sky.", "obj_organ_enemy_slash_Step_0_gml_152_0");
                if (irandom(100) < 3)
                    global.battlemsg[0] = stringsetloc("* Smells like brass and satin.", "obj_organ_enemy_slash_Step_0_gml_153_0");
            }
            if (global.monsterhp[myself] <= (global.monstermaxhp[myself] / 3))
            {
                if (scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Organikk extolls the virtues of having low HP.", "obj_organ_enemy_slash_Step_0_gml_158_0");
            }
            if (global.mercymod[myself] >= 100)
            {
                if (scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Organikk extolls the virtues of mercy.", "obj_organ_enemy_slash_Step_0_gml_163_0");
            }
            if (global.monsterstatus[myself] == 1)
            {
                if (scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Organikk extolls the virtues of naptime.", "obj_organ_enemy_slash_Step_0_gml_168_0");
            }
            attacked = 1;
        }
    }
    if (global.mnfight == 2 && global.turntimer > 1 && (harmonize == 1 || chorus == 1))
    {
    }
    if (global.mnfight == 2 && global.turntimer < 1)
    {
        scr_battle_sprite_reset("ralsei");
        if (mercygained > 0 && (harmonize == 1 || chorus == 1))
        {
            with (obj_organ_enemy)
            {
                if (chorus == 0 && harmonize == 0)
                {
                    if (mercygained > 50)
                        mercygained = 50;
                    if (other.chorus == 1 && global.monsterstatus[myself] != 1)
                        scr_monster_make_tired(myself);
                }
                global.mercymod[myself] += mercygained;
                if (global.mercymod[myself] < 0)
                    global.mercymod[myself] = 0;
                if (global.mercymod[myself] >= 100)
                    global.mercymod[myself] = 100;
            }
            with (obj_halo_enemy)
            {
                if (global.monsterstatus[myself] != 1)
                    scr_monster_make_tired(myself);
                if (mercygained > 50)
                    mercygained = 50;
                global.mercymod[myself] += mercygained;
                if (global.mercymod[myself] < 0)
                    global.mercymod[myself] = 0;
                if (global.mercymod[myself] >= 100)
                    global.mercymod[myself] = 100;
            }
            with (obj_bell_enemy)
            {
                if (other.chorus == 1 && global.monsterstatus[myself] != 1)
                    scr_monster_make_tired(myself);
                if (mercygained > 50)
                    mercygained = 50;
                global.mercymod[myself] += mercygained;
                if (global.mercymod[myself] < 0)
                    global.mercymod[myself] = 0;
                if (global.mercymod[myself] >= 100)
                    global.mercymod[myself] = 100;
            }
        }
        mercygained = 0;
        harmonize = 0;
        chorus = 0;
    }
}
if (global.myfight == 3)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    if (acting == 1 && actcon == 0)
    {
        actcon = 1;
        msgsetloc(0, "* Organikk - A philosopher. Why he's fighting you is one of life's questions./%", "obj_organ_enemy_slash_Step_0_gml_241_0");
        scr_battletext_default();
    }
    if (acting == 2 && actcon == 0)
    {
        performtimer++;
        if (performtimer == 1)
        {
            if (wicabell_tuning == false)
            {
                msgsetloc(0, "* You performed a tune! It was mildly effective!/%", "obj_organ_enemy_slash_Step_0_gml_252_0");
                scr_mercyadd(myself, 35);
                snd_play(snd_act_perform);
            }
            else
            {
                msgsetloc(0, "* You performed a tune! It was super effective!/%", "obj_organ_enemy_slash_Step_0_gml_258_0");
                scr_mercyadd(myself, 100);
                snd_play(snd_act_perform_better);
            }
            scr_battletext_default();
            scr_battle_sprite_set("kris", spr_krisb_act, 1, false);
        }
        if (performtimer == 3)
        {
            repeat (6)
                instance_create_depth(obj_herokris.x + 40, obj_herokris.y + 20 + irandom(40), obj_herokris.depth + 1, obj_dazzle_particle);
        }
        if (performtimer == 9)
        {
            scr_battle_sprite_reset("kris");
            performtimer = 0;
            actcon = 1;
        }
    }
    if ((acting == 3 || acting == 4) && actcon == 0)
    {
        msgsetloc(0, "* You tried to harmonize!&* Touch the GREEN!/%", "obj_organ_enemy_slash_Step_0_gml_282_0");
        scr_battletext_default();
        harmonize = 1;
        actcon = 1;
    }
    if (acting == 5 && actcon == 0)
    {
        msgsetloc(0, "* You and Ralsei attempted to harmonize!/%", "obj_organ_enemy_slash_Step_0_gml_292_0");
        scr_battletext_default();
        scr_battle_sprite_set("ralsei", spr_ralsei_sing, 1, true);
        chorus = 1;
        actcon = 1;
    }
    if (actingsus == 1 && actconsus == 1)
    {
        msgsetloc(0, "* Susie played random notes!/%", "obj_organ_enemy_slash_Step_0_gml_304_0");
        scr_mercyadd(myself, 20);
        scr_battletext_default();
        organsoundcon = 1;
        actingsus = 0;
        actconsus = 0;
    }
    if (actingral == 1 && actconral == 1)
    {
        msgsetloc(0, "* Ralsei sang sweetly!/%", "obj_organ_enemy_slash_Step_0_gml_319_0");
        scr_battletext_default();
        scr_battle_sprite_set("ralsei", spr_ralsei_sing, 1, 1);
        snd_pause(global.batmusic[1]);
        if (lullabied == 0)
        {
            singy = snd_play(snd_ralseising1);
            with (object_index)
                lullabied = 1;
        }
        else
        {
            singy = snd_play(snd_ralseising2);
            with (object_index)
                lullabied = 0;
        }
        actcon = 10;
        actingral = 0;
        actconral = 0;
    }
    if (actcon == 10)
    {
        lullatimer += 1;
        if (lullatimer >= 30)
            actcon = 11;
    }
    if (actcon == 11 && instance_exists(obj_writer) == false)
    {
        scr_battle_sprite_reset("ralsei");
        snd_stop(singy);
        snd_resume(global.batmusic[1]);
        scr_mercyadd(myself, 50);
        actcon = 1;
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
    {
        scr_battle_sprite_reset("kris");
        scr_nextact();
    }
}
if (organsoundcon == 1)
{
    organsoundtimer++;
    if (organsoundtimer == 1 || organsoundtimer == 8 || organsoundtimer == 15)
    {
        snd_stop(snd_organ_mi);
        snd_stop(snd_organ_re);
        snd_stop(snd_organ_so);
        snd_stop(snd_organ_ti);
        snd_stop(snd_organ_do);
        snd_stop(snd_organ_do_a);
        snd_stop(snd_organ_fa);
        snd_stop(snd_organ_la);
        var _rand = irandom(7);
        if (_rand == 0)
            snd_play(snd_organ_mi);
        if (_rand == 1)
            snd_play(snd_organ_re);
        if (_rand == 2)
            snd_play(snd_organ_so);
        if (_rand == 3)
            snd_play(snd_organ_ti);
        if (_rand == 4)
            snd_play(snd_organ_do);
        if (_rand == 5)
            snd_play(snd_organ_do_a);
        if (_rand == 6)
            snd_play(snd_organ_fa);
        if (_rand == 7)
            snd_play(snd_organ_la);
    }
    if (organsoundtimer == 16)
    {
        organsoundtimer = 0;
        organsoundcon = 0;
        con = 0;
        actcon = 1;
        actconsus = 0;
    }
}
if (state == 3)
{
    scr_enemyhurt_tired_after_damage(0.5);
    scr_enemy_hurt();
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
