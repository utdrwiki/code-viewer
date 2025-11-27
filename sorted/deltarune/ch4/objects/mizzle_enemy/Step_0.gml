if (init == 0)
{
    init = 1;
    if (global.flag[1544] == 0)
    {
        if (idlesprite == spr_holywater_idle)
        {
            global.monstercomment[myself] = stringsetloc("(Tired)", "scr_monster_make_tired_slash_scr_monster_make_tired_gml_1_0");
            global.monsterstatus[myself] = 1;
            startedtired = true;
            init = 1;
            global.battlemsg[0] = stringsetloc("* Mizzle is sleeping peacefully!", "obj_mizzle_enemy_slash_Step_0_gml_19_0");
        }
    }
}
if (global.monsterstatus[myself] == 1)
{
    idlesprite = spr_holywater_idle;
}
else
{
    idlesprite = spr_holywater_alarm;
    global.monstercomment[myself] = "";
    if (startedtired == true)
        global.flag[1544] = 1;
}
if (global.mercymod[myself] >= 100)
{
    if (global.monsterstatus[myself] == 1)
        idlesprite = spr_holywater_idle_pink;
    else
        idlesprite = spr_holywater_alarm_pink;
    hurtsprite = spr_holywater_hurt_pink;
}
sparedsprite = idlesprite;
if (global.monster[myself] == 1)
{
    if (scr_isphase("enemytalk") && talked == 0)
    {
        scr_randomtarget();
        setbattlemsg = false;
        myattackchoice = choose(0, 1);
        if (global.monsterstatus[myself] == 1)
            myattackchoice = 0;
        else
            myattackchoice = 1;
        myattackpriority = 1;
        if (myattackchoice == 2)
            myattackpriority = 50;
        scr_attackpriority(myattackpriority - 1);
        if (!instance_exists(obj_darkener))
            instance_create(0, 0, obj_darkener);
        global.typer = 50;
        rr = choose(0, 1, 2, 3);
        if (global.monsterstatus[myself] != 1)
        {
            if (rr == 0)
                msgsetloc(0, "Who's there?&Who's there?", "obj_mizzle_enemy_slash_Step_0_gml_76_0");
            if (rr == 1)
                msgsetloc(0, "Water you&doing?", "obj_mizzle_enemy_slash_Step_0_gml_77_0");
            if (rr == 2)
                msgsetloc(0, "What is it?&What is it?", "obj_mizzle_enemy_slash_Step_0_gml_78_0");
            if (rr == 3)
                msgsetloc(0, "Am I still&dreaming?", "obj_mizzle_enemy_slash_Step_0_gml_79_0");
            myblcon = scr_enemyblcon(x - 10, y + 42, 10);
            myblcon.creator = id;
        }
        else
        {
            msgsetloc(0, "", "obj_mizzle_enemy_slash_Step_0_gml_85_0");
            myblcon = scr_enemyblcon(x - 43, y + 42, 11);
            myblcon.creator = id;
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
            if (!instance_exists(obj_moveheart))
                scr_moveheart();
            global.mnfight = 2;
            scr_turntimer(90);
        }
    }
    if (scr_isphase("bullets") && attacked == 0)
    {
        rtimer += 1;
        if (rtimer == 12)
        {
            if (myattackchoice == 0)
            {
                global.monsterattackname[myself] = "newholywatereye";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 110.5;
                dc.special = difficulty;
            }
            else if (myattackchoice == 1)
            {
                global.monsterattackname[myself] = "holywaterC";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 111;
                dc.special = difficulty;
            }
            scr_turntimer(270);
            ruckus = 0;
            silence = 0;
            turns += 1;
            attacked = 1;
        }
    }
    if (global.mnfight == 2 && global.turntimer <= 1)
    {
        if (setbattlemsg == false)
        {
            global.typer = 6;
            global.fc = 0;
            rr = choose(0, 1, 2, 3);
            if (scr_messagepriority(random(2)))
            {
                var substring = string(myself);
                if (rr == 0)
                    global.battlemsg[0] = stringsetloc("* Mizzle sings effervescently.", "obj_mizzle_enemy_slash_Step_0_gml_186_0");
                if (rr == 1)
                    global.battlemsg[0] = stringsetloc("* Mizzle ho-hums, ho-hums.", "obj_mizzle_enemy_slash_Step_0_gml_187_0");
                if (rr == 2)
                    global.battlemsg[0] = stringsetloc("* Mizzle uses a ring left by a cup as a magic circle.", "obj_mizzle_enemy_slash_Step_0_gml_188_0");
                if (rr == 3)
                    global.battlemsg[0] = stringsetloc("* Mizzle contemplates going back in her container.", "obj_mizzle_enemy_slash_Step_0_gml_189_0");
                if (irandom(100) < 3)
                    global.battlemsg[0] = stringsetloc("* Smells like the rainbow made by the sprinkler.", "obj_mizzle_enemy_slash_Step_0_gml_190_0");
            }
            if (global.monsterstatus[myself] == 1)
            {
                if (scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Mizzle is dozing.", "obj_mizzle_enemy_slash_Step_0_gml_195_0");
            }
            if (global.monsterhp[myself] <= (global.monstermaxhp[myself] / 3))
            {
                if (scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Mizzle's hat is melting.", "obj_mizzle_enemy_slash_Step_0_gml_200_0");
            }
            if (global.mercymod[myself] >= 100)
            {
                if (scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Mizzle turns the hue of unsweetened caffeine-free pink lemonade.", "obj_mizzle_enemy_slash_Step_0_gml_205_0");
            }
            setbattlemsg = true;
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
        msgsetloc(0, "* MIZZLE - A sleepy water spirit. When TIRED, use Ralsei's PACIFY!/%", "obj_mizzle_enemy_slash_Step_0_gml_226_0");
        scr_battletext_default();
    }
    if (acting == 2 && actcon == 0)
    {
        acting = 2.1;
        msgsetloc(0, "* You DAZZLEd MIZZLE!/%", "obj_mizzle_enemy_slash_Step_0_gml_233_0");
        scr_battletext_default();
    }
    if (acting == 2.1 && actcon == 0)
    {
        dazzletimer++;
        if (dazzletimer == 1)
            scr_battle_sprite_set("kris", spr_krisb_act, 1, 1);
        if (dazzletimer == 1)
            snd_play_x(snd_bell_bounce_short, 1, 1);
        if (dazzletimer == 11)
            snd_play_x(snd_bell_bounce_short, 1, 1.1);
        if (dazzletimer == 21)
            snd_play_x(snd_bell_bounce_short, 1, 1.2);
        if (dazzletimer == 23)
        {
            repeat (6)
                instance_create_depth(obj_herokris.x + 40, obj_herokris.y + 20 + irandom(40), obj_herokris.depth + 1, obj_dazzle_particle);
        }
        if (dazzletimer >= 30)
        {
            if (global.monsterstatus[myself] == 1)
                scr_mercyadd(myself, 50);
            else
                scr_mercyadd(myself, 35);
            var offset = 0;
            if (object_index == obj_guei_enemy)
                offset = 20;
            if (global.monsterstatus[myself] == 1)
            {
                var __tiredwriter = instance_create(global.monsterx[myself], ((global.monstery[myself] - (global.hittarget[global.chartarget[myself]] * 20)) + 20) - offset, obj_dmgwriter);
                __tiredwriter.type = 14;
            }
            global.monsterstatus[myself] = 0;
            global.hittarget[global.chartarget[myself]] += 1;
            scr_battle_sprite_reset("kris");
            dazzletimer = 0;
            actcon = 1;
        }
    }
    if (acting == 3 && actcon == 0)
    {
        msgsetloc(0, "* Susie EMBEZZLED an item!/%", "obj_mizzle_enemy_slash_Step_0_gml_272_0");
        scr_battletext_default();
        scr_battle_sprite_set("susie", spr_susie_jump_back, 1, 1);
        obj_herosusie.vspeed = -40;
        snd_play(snd_jump);
        acting = 3.1;
    }
    if (acting == 3.1 && actcon == 0)
    {
        timer++;
        if (timer == 20)
        {
            obj_herosusie.x = x + 20;
            obj_herosusie.y = cameray() - 100;
            obj_herosusie.vspeed = 30;
            obj_herosusie.depth = depth - 1;
        }
        if ((obj_herosusie.y + obj_herosusie.vspeed) > (y - 40) && timer > 20)
        {
            obj_herosusie.y = y - 40;
            obj_herosusie.vspeed = 0;
            snd_play(snd_bump);
            scr_battle_sprite_set("susie", spr_susie_kneel_heal_alt_right, 0, 1);
            scr_shakeobj();
            with (obj_herosusie)
                scr_shakeobj();
            timer = 0;
            acting = 3.3;
        }
    }
    if (acting == 3.3 && actcon == 0)
    {
        scr_itemcheck_pocket(0);
        if (havestolenbefore)
        {
            snd_play(snd_cantselect);
            msgsetloc(0, "* But, there was nothing to steal!/%", "obj_mizzle_enemy_slash_Step_0_gml_321_0");
        }
        else if (scr_inventoryspace() == 0 && itemcount == 0)
        {
            snd_play(snd_cantselect);
            msgsetloc(0, "* But, your items are full!/%", "obj_mizzle_enemy_slash_Step_0_gml_326_0");
        }
        else if (global.monsterstatus[myself] == 0 && irandom(100) < 50)
        {
            snd_play(snd_cantselect);
            msgsetloc(0, "* But, she failed!/%", "obj_mizzle_enemy_slash_Step_0_gml_331_0");
        }
        else
        {
            snd_play(snd_item);
            havestolenbefore = true;
            var rand = irandom(100);
            if (rand <= 30)
            {
                msgsetloc(0, "* Stole 100 Dark Dollars!/%", "obj_mizzle_enemy_slash_Step_0_gml_342_0");
                scr_itemget_anytype(100, "money");
            }
            else if (rand > 30 && rand <= 60)
            {
                msgsetloc(0, "* Stole Scarlixir!/%", "obj_mizzle_enemy_slash_Step_0_gml_347_0");
                scr_itemget_anytype(62, "item");
            }
            else if (rand > 60 && rand <= 90)
            {
                msgsetloc(0, "* Stole Darker Candy!/%", "obj_mizzle_enemy_slash_Step_0_gml_352_0");
                scr_itemget_anytype(1, "item");
            }
            else
            {
                msgsetloc(0, "* Stole Revive Mint!/%", "obj_mizzle_enemy_slash_Step_0_gml_357_0");
                scr_itemget_anytype(2, "item");
            }
        }
        scr_monster_make_tired(myself);
        acting = 3.4;
        timer = 0;
        scr_mercyadd(myself, 35);
    }
    if (acting == 3.4 && actcon == 0)
    {
        timer++;
        if (timer == 20)
        {
            obj_herosusie.vspeed = -30;
            scr_battle_sprite_set("susie", spr_susie_jump_back, 1, 1);
            snd_stop(snd_jump);
            snd_play(snd_jump);
        }
        if (timer == 30)
        {
            obj_herosusie.x = obj_herosusie.xstart;
            obj_herosusie.vspeed = 30;
        }
        if (timer > 30 && (obj_herosusie.y + obj_herosusie.vspeed) > obj_herosusie.ystart)
        {
            obj_herosusie.vspeed = 0;
            obj_herosusie.x = obj_herosusie.xstart;
            obj_herosusie.y = obj_herosusie.ystart;
            scr_battle_sprite_reset("susie");
            with (obj_herosusie)
                scr_shakeobj();
            snd_play(snd_bump);
            acting = 3.5;
            timer = 0;
        }
    }
    if (acting == 3.5 && actcon == 0 && !i_ex(obj_writer))
    {
        scr_battletext_default();
        acting = 3.6;
    }
    if (acting == 3.6 && actcon == 0 && !i_ex(obj_writer))
    {
        acting = 0;
        actcon = 1;
    }
    if (acting == 4 && actcon == 0)
    {
        msgsetloc(0, "* Ralsei NUZZLEd MIZZLE!/%", "obj_mizzle_enemy_slash_Step_0_gml_413_0");
        scr_battletext_default();
        acting = 4.1;
    }
    if (acting == 4.1 && actcon == 0)
    {
        timer++;
        if (timer == 1)
        {
            obj_heroralsei.x = x - 40;
            obj_heroralsei.y = y + 20;
            obj_heroralsei.depth = depth - 1;
            scr_battle_sprite_set("ralsei", spr_ralsei_nuzzle3, 2, 1);
            snd_play_x(snd_magicmarker, 1, 1);
        }
        if (timer < 31)
            obj_heroralsei.x += 0.1;
        if (timer > 31)
        {
            scr_battle_sprite_reset("ralsei");
            obj_heroralsei.x = obj_heroralsei.xstart;
            obj_heroralsei.y = obj_heroralsei.ystart;
            obj_heroralsei.image_xscale = 2;
            timer = 0;
            acting = 4.2;
        }
    }
    if (acting == 4.2 && actcon == 0 && !i_ex(obj_writer))
    {
        if (global.monsterstatus[myself] == 0)
        {
            msgsetloc(0, "* MIZZLE became TIRED!/%", "obj_mizzle_enemy_slash_Step_0_gml_449_0");
            scr_battletext_default();
        }
        scr_mercyadd(myself, 35);
        scr_monster_make_tired(myself);
        actcon = 1;
    }
    if (acting == 5 && actcon == 0)
    {
        msgsetloc(0, "* Everyone sang a LULLABY!/%", "obj_mizzle_enemy_slash_Step_0_gml_459_0");
        scr_battletext_default();
        acting = 5.1;
        timer = 0;
    }
    if (acting == 5.1 && actcon == 0 && !i_ex(obj_writer))
    {
        timer++;
        if (timer == 1)
        {
            with (obj_heroralsei)
                x += 8;
            scr_battle_sprite_set("ralsei", spr_ralsei_sing, 1, 1);
            snd_play(snd_ralseising1);
        }
        if (timer == 61)
        {
            with (obj_herosusie)
            {
                x -= 36;
                y -= 12;
            }
            scr_battle_sprite_set("susie", spr_susie_sing, 1, 1);
            snd_play(snd_suslaugh);
        }
        if (timer == 75)
        {
            scr_battle_sprite_set("ralsei", spr_ralsei_shocked_right, 1, 1);
            snd_stop(snd_ralseising1);
            with (obj_heroralsei)
            {
                x += 10;
                y += 10;
                scr_shakeobj();
            }
        }
        if (timer > 120)
        {
            scr_battle_sprite_reset("ralsei");
            scr_battle_sprite_reset("susie");
            with (obj_herosusie)
            {
                x = xstart;
                y = ystart;
            }
            with (obj_heroralsei)
            {
                x = xstart;
                y = ystart;
            }
            timer = 0;
            acting = 5.2;
        }
    }
    if (acting == 5.2 && actcon == 0 && !i_ex(obj_writer))
    {
        var mizzles_asleep = 0;
        for (var i = 0; i < instance_number(obj_mizzle_enemy); i++)
        {
            mizzle[i] = instance_find(obj_mizzle_enemy, i);
            if (global.monsterstatus[mizzle[i].myself] == 1)
                mizzles_asleep++;
        }
        if (mizzles_asleep == 0)
        {
        }
        else
        {
            if (mizzles_asleep > 1)
                msgsetloc(0, "* MIZZLEs woke up!/%", "obj_mizzle_enemy_slash_Step_0_gml_514_0");
            else
                msgsetloc(0, "* MIZZLE woke up!/%", "obj_mizzle_enemy_slash_Step_0_gml_515_0");
            scr_battletext_default();
        }
        with (obj_monsterparent)
        {
            if (global.monsterstatus[myself] == 1)
            {
                global.monsterstatus[myself] = 0;
                global.monstercomment[myself] = "";
                var offset = 0;
                if (object_index == obj_guei_enemy)
                    offset = 20;
                var __tiredwriter = instance_create(global.monsterx[myself], ((global.monstery[myself] - (global.hittarget[global.chartarget[myself]] * 20)) + 20) - offset, obj_dmgwriter);
                __tiredwriter.type = 14;
                global.hittarget[global.chartarget[myself]] += 1;
                snd_play_x(snd_spellcast, 0.5, 1.2);
                scr_mercyadd(myself, 50);
            }
            else
            {
                scr_mercyadd(myself, 35);
            }
        }
        actcon = 1;
    }
    if (actingsus == 1 && actconsus == 1)
    {
        var rand = choose(0, 1, 2);
        if (rand == 0)
            msgsetloc(0, "* Susie gargles loudly!/%", "obj_mizzle_enemy_slash_Step_0_gml_542_0");
        if (rand == 1)
            msgsetloc(0, "* Susie breaks a wet floor sign!/%", "obj_mizzle_enemy_slash_Step_0_gml_543_0");
        if (rand == 2)
            msgsetloc(0, "* Susie snores while awake!/%", "obj_mizzle_enemy_slash_Step_0_gml_544_0");
        scr_mercyadd(myself, 20);
        scr_simultext("susie");
        if (simulordersus == 0)
            actconsus = 20;
        else
            actconsus = 0;
    }
    if (actingral == 1 && actconral == 1)
    {
        var rand = choose(0, 1, 2);
        if (rand == 0)
            msgsetloc(0, "* Ralsei sips politely!/%", "obj_mizzle_enemy_slash_Step_0_gml_555_0");
        if (rand == 1)
            msgsetloc(0, "* Ralsei puts a wet floor sign!/%", "obj_mizzle_enemy_slash_Step_0_gml_556_0");
        if (rand == 2)
            msgsetloc(0, "* Ralsei makes toothpaste!!!/%", "obj_mizzle_enemy_slash_Step_0_gml_557_0");
        scr_mercyadd(myself, 25);
        scr_simultext("ralsei");
        if (simulorderral == 0)
            actconral = 20;
        else
            actconral = 0;
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
