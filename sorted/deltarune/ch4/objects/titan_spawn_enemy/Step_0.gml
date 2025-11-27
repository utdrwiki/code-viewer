if (global.monster[myself] == 1)
{
    if (scr_isphase("enemytalk") && talked == 0)
    {
        scr_randomtarget();
        event_user(0);
        if (!instance_exists(obj_darkener))
            instance_create(0, 0, obj_darkener);
        rtimer = 0;
        con = 0;
        var createballoon = false;
        if (createballoon == false)
        {
            global.mnfight = 1.5;
        }
        else
        {
            talked = 1;
            talktimer = 0;
        }
    }
    if (talked == 1 && scr_isphase("enemytalk"))
        scr_blconskip(15);
    if (global.mnfight == 1.5)
    {
        if (battlecontroller)
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
        if (rtimer == 12 && !i_ex(obj_dbulletcontroller) && battlecontroller)
        {
            if (myattackchoice == 0)
            {
                global.monsterattackname[myself] = "darkshapeswithred";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 450;
            }
            if (myattackchoice == 1)
            {
                global.monsterattackname[myself] = "darkshapescentipede";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 451;
            }
            if (myattackchoice == 2)
            {
                global.monsterattackname[myself] = "darkshapesbigshot";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 452;
            }
            if (myattackchoice == 3)
            {
                global.monsterattackname[myself] = "darkshapesbigshotdesperation";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 453;
            }
            if (myattackchoice == 4)
            {
                global.monsterattackname[myself] = "darkshapesbigshotaimed";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 454;
            }
            if (myattackchoice == 5)
            {
                global.monsterattackname[myself] = "darkshapescentipedehard";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 455;
            }
            if (myattackchoice == 6)
            {
                global.monsterattackname[myself] = "darkshapesintro";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 456;
            }
            if (myattackchoice == 7)
            {
                global.monsterattackname[myself] = "darkshapescentipedeintro";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 457;
            }
            if (myattackchoice == 8)
            {
                global.monsterattackname[myself] = "darkshapesmine";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 458;
            }
            if (myattackchoice == 9)
            {
                global.monsterattackname[myself] = "thehands";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 459;
            }
            if (myattackchoice == 10)
            {
                global.monsterattackname[myself] = "darkshapesspeedup";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 460;
            }
            scr_turntimer(360);
            turns += 1;
            global.typer = 6;
            global.fc = 0;
            rr = choose(0, 1, 2, 3);
            if (rr == 0)
                global.battlemsg[0] = stringsetloc("* You hear your heart beating in your ears.", "obj_titan_spawn_enemy_slash_Step_0_gml_130_0");
            if (rr == 1)
                global.battlemsg[0] = stringsetloc("* When did you start being yourself?", "obj_titan_spawn_enemy_slash_Step_0_gml_131_0");
            if (rr == 2)
                global.battlemsg[0] = stringsetloc("* It sputtered in a voice like crushed glass.", "obj_titan_spawn_enemy_slash_Step_0_gml_132_0");
            if (rr == 3)
                global.battlemsg[0] = stringsetloc("* Ralsei mutters to himself to stay calm.", "obj_titan_spawn_enemy_slash_Step_0_gml_133_0");
            if (irandom(100) < 4)
                global.battlemsg[0] = stringsetloc("* Smells like adrenaline.", "obj_titan_spawn_enemy_slash_Step_0_gml_134_0");
            attacked = 1;
        }
    }
    if (global.mnfight == 2 && global.turntimer <= 1)
    {
        brighten = 0;
        light_radius = 48;
        if (global.tension >= 160)
            global.battlemsg[0] = stringsetloc("* The atmosphere feels tense...&* (You can use \\cYBANISH\\c0!)", "obj_titan_spawn_enemy_slash_Step_0_gml_143_0");
    }
}
if (global.myfight == 3)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    if (acting == 1 && actcon == 0)
    {
        actcon = 1;
        msgsetloc(0, "* TITAN SPAWN - AT 30 DF 200&* A shard of fear. Appears in places of deep dark./", "obj_titan_spawn_enemy_slash_Step_0_gml_157_0");
        if (global.tension >= 160)
        {
            msgnextloc("* The atmosphere feels tense...&* (You can use \\cYBANISH\\c0!)/%", "obj_titan_spawn_enemy_slash_Step_0_gml_161_0");
        }
        else
        {
            msgnextloc("* Expose it to LIGHT... and gather COURAGE to gain TP./", "obj_titan_spawn_enemy_slash_Step_0_gml_158_0");
            msgnextloc("* Then, \"\\cYBANISH\\c0\" it!/%", "obj_titan_spawn_enemy_slash_Step_0_gml_159_0");
        }
        scr_battletext_default();
    }
    if (acting == 2 && actcon == 0)
    {
        actcon = 1;
        msgsetloc(0, "* Kris's SOUL shone brighter!/%", "obj_titan_spawn_enemy_slash_Step_0_gml_166_0");
        scr_battletext_default();
        brighten = 1;
        with (obj_titan_spawn_enemy)
            light_radius = 63;
        with (obj_heroralsei)
            scr_oflash();
        with (obj_herosusie)
            scr_oflash();
        with (obj_herokris)
            scr_oflash();
        snd_play(snd_boost);
        heartanim = instance_create(obj_herokris.x + 30, obj_herokris.y + 50, obj_animation);
        with (heartanim)
        {
            depth = -20;
            image_index = 0;
            image_xscale = 2;
            image_yscale = 2;
            image_speed = 1;
            sprite_index = spr_soulshining;
        }
    }
    if (acting == 3 && actcon == 0)
    {
        global.msg[0] = stringsetloc("* Your SOUL shined its power on RALSEI and SUSIE!/%", "obj_titan_enemy_slash_Step_0_gml_1759_0");
        scr_battletext_default();
        acting = 20;
        acttimer = 0;
    }
    if (acting == 20)
    {
        acttimer += 1;
        if (acttimer >= 10 || !instance_exists(obj_writer))
        {
            acttimer = 0;
            acting = 21;
        }
    }
    if (acting == 21)
    {
        scr_battle_sprite_set("susie", spr_susie_heal_charge, 1/3, 0);
        with (obj_herosusie)
        {
            x -= 28;
            y -= 25;
        }
        global.faceaction[1] = 2;
        global.faceaction[2] = 2;
        global.charaction[2] = 2;
        global.charspecial[2] = 6;
        global.chartarget[2] = 0;
        global.acting[2] = 0;
        snd_play(snd_boost);
        heartanim = instance_create(obj_herokris.x + 30, obj_herokris.y + 50, obj_animation);
        with (heartanim)
        {
            depth = -20;
            image_index = 0;
            image_xscale = 2;
            image_yscale = 2;
            image_speed = 1;
            sprite_index = spr_soulshining;
        }
        with (obj_heroralsei)
            scr_oflash();
        with (obj_herosusie)
            scr_oflash();
        with (obj_herokris)
            scr_oflash();
        acting = 22;
    }
    if (acting == 22)
    {
        acttimer += 1;
        if (acttimer >= 20)
        {
            with (obj_heroralsei)
                state = 0;
            scr_battle_sprite_set("susie", spr_susie_heal_charge_loop, 1/3, 1);
            global.faceaction[1] = 2;
            acting = 0;
            actcon = 1;
            dualhealcon = 1;
        }
    }
    if (acting == 4 && actcon == 0)
    {
        msgsetloc(0, "* Kris's SOUL emitted a brilliant light!/%", "obj_titan_spawn_enemy_slash_Step_0_gml_246_0");
        scr_battletext_default();
        acting = 4.1;
    }
    if (acting == 4.1 && actcon == 0 && !i_ex(obj_writer))
    {
        global.flag[1597] += 2;
        acting = 4.2;
        with (obj_herokris)
            scr_oflash();
        instance_create(obj_herokris.x + 30, obj_herokris.y + 50, obj_purify_event);
    }
    if (acting == 4.2 && actcon == 0 && !i_ex(obj_purify_event))
        scr_wincombat();
    if (actingsus == 1 && actconsus == 1)
    {
        sactcount++;
        var _str = "";
        if (sactcount > 1)
            _str = "%";
        msgsetsubloc(0, "* Susie used Wake Up!/~1", _str, "obj_titan_spawn_enemy_slash_Step_0_gml_268_0");
        if (sactcount == 1)
            msgnextloc("* Hey, dumbass! Get up!/%", "obj_titan_spawn_enemy_slash_Step_0_gml_269_0");
        scr_battletext_default();
        actingsus = 2;
    }
    if (actingsus == 2 && actconsus == 1 && !i_ex(obj_writer))
    {
        scr_battle_sprite_set("susie", spr_susie_attack_unarmed, 1/3, 0);
        snd_play(snd_smallswing);
        snd_play(snd_damage);
        actingsus = 3;
        alarm[4] = 15;
        attack = instance_create(obj_herokris.x + 30, obj_herokris.y + 40, obj_animation);
        attack.sprite_index = spr_attack_slap1_purple;
        attack.maxindex = 4;
        attack.image_speed = 0.5;
        with (obj_herokris)
            scr_shakeobj();
    }
    if (actingsus == 3 && actconsus == 1 && con == 1)
    {
        scr_battle_sprite_reset("susie");
        if (global.hp[1] <= 0)
        {
            var starthp = global.hp[1];
            star = 0;
            reviveamt = abs(global.hp[1]) + 1;
            scr_healitemspell(reviveamt);
            global.hp[1] = 1;
            with (obj_dmgwriter)
            {
                if (type == 3 && delay == 8)
                    damage = abs(starthp - global.hp[1]);
            }
            actingsus = 0;
            actcon = 1;
        }
        else
        {
            msgsetloc(0, "* (But, Kris wasn't DOWNed...)/%", "obj_titan_spawn_enemy_slash_Step_0_gml_308_0");
            scr_battletext_default();
            actingsus = 4;
        }
    }
    if (actingsus == 4 && actconsus == 1 && !i_ex(obj_writer))
    {
        actingsus = 0;
        actcon = 1;
    }
    if (actingral == 1 && actconral == 1)
    {
        ractcount++;
        msgsetloc(0, "* Ralsei used Reviver!/%", "obj_titan_spawn_enemy_slash_Step_0_gml_323_0");
        scr_battletext_default();
        actingral = 2;
    }
    if (actingral == 2 && actconral == 1 && !i_ex(obj_writer))
    {
        scr_battle_sprite_set("ralsei", spr_ralsei_spell, 0.5, 0);
        actingral = 2.5;
        instance_create(obj_herokris.x, obj_herokris.y, obj_ralsei_cherub);
    }
    if (actingral == 2.5)
    {
        racttimer++;
        if (racttimer == 58)
        {
            racttimer = 0;
            actingral = 3;
        }
    }
    if (actingral == 3 && actconral == 1)
    {
        scr_battle_sprite_reset("ralsei");
        var starthp = global.hp[1];
        star = 0;
        reviveamt = ceil(global.maxhp[1]) + abs(ceil(global.maxhp[1] / 3));
        ha = scr_healitemspell(reviveamt);
        if (starthp <= 0)
            global.hp[1] = ceil(global.maxhp[1] / 3);
        else
            global.hp[1] = starthp + ceil(global.maxhp[1] * 0.5);
        if (global.hp[1] > global.maxhp[1])
        {
            global.hp[1] = global.maxhp[1];
            with (obj_dmgwriter)
            {
                if (type == 3 && delay == 8 && mercytimer == 0)
                    specialmessage = 3;
            }
        }
        else
        {
            with (obj_dmgwriter)
            {
                if (type == 3 && delay == 8 && mercytimer == 0)
                    specialmessage = 0;
            }
        }
        with (obj_dmgwriter)
        {
            if (type == 3 && delay == 8 && mercytimer == 0)
                damage = abs(starthp - global.hp[1]);
        }
        actingral = 0;
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
        if (dualhealcon == 1)
            dualhealcon = 2;
        scr_nextact();
    }
}
if (dualhealcon == 2)
{
    dealhealtimer++;
    if (dealhealtimer >= 30)
    {
        dealhealtimer = 0;
        dualhealcon = 0;
        scr_battle_sprite_reset("susie");
        obj_herosusie.x = obj_herosusie.xstart;
        obj_herosusie.y = obj_herosusie.ystart;
    }
}
if (state == 3)
    scr_enemy_hurt();
if (obj_heroralsei.thissprite == spr_ralsei_spell && obj_herosusie.state == 8 && obj_heroralsei.image_index == 3)
    scr_battle_sprite_set("susie", spr_susie_heal_end, 1/3, 0);
if (obj_herosusie.sprite_index == spr_susie_heal_end && obj_herosusie.image_index > 13)
{
    scr_battle_sprite_reset("susie");
    obj_herosusie.x = obj_herosusie.xstart;
    obj_herosusie.y = obj_herosusie.ystart;
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
