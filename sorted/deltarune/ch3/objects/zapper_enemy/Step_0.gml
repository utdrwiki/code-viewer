if (init == 0)
{
    init = 1;
    if (i_ex(obj_tenna_board4_enemy))
    {
        global.actactor[0][0] = 4;
        global.actactor[0][1] = 4;
        global.actactor[0][2] = 4;
        scr_spellmenu_setup();
    }
}
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
        if (!i_ex(obj_tenna_board4_enemy))
        {
            global.typer = 50;
            rr = choose(0, 1, 2, 3);
            if (rr == 0)
                msgsetloc(0, "Hoofah&doofah.", "obj_zapper_enemy_slash_Step_0_gml_41_0");
            if (rr == 1)
                msgsetloc(0, "Yeah, yeah,&Mr. Tenna's&orders.", "obj_zapper_enemy_slash_Step_0_gml_42_0");
            if (rr == 2)
                msgsetloc(0, "Yeah, yeah,&show your ID!", "obj_zapper_enemy_slash_Step_0_gml_43_0");
            if (rr == 3)
                msgsetloc(0, "Deez buttons&ain't for&show, twerps.", "obj_zapper_enemy_slash_Step_0_gml_44_0");
            if (ractused)
            {
                ractused = false;
                msgsetloc(0, "Hey, I can&see da music.!", "obj_zapper_enemy_slash_Step_0_gml_45_0");
            }
            if (sactused)
            {
                sactused = false;
                msgsetloc(0, "D-don't touch&that, you's!", "obj_zapper_enemy_slash_Step_0_gml_46_0");
            }
            if (sharpshootballoon == true)
            {
                sharpshootballoon = false;
                msgsetloc(0, "My buttons... pushed.", "obj_zapper_enemy_slash_Step_0_gml_51_0_b");
            }
            if (volumeused)
            {
                volumeused = false;
                if (myself == 0)
                    msgsetloc(0, "CAN SOMEONE&TURN THAT&BACK DOWN?", "obj_zapper_enemy_slash_Step_0_gml_50_0");
                if (myself == 1)
                    msgsetloc(0, "WHAT? I CAN'T&HEAR YOU!!!", "obj_zapper_enemy_slash_Step_0_gml_51_0");
                if (myself == 2)
                    msgsetloc(0, "TURN IT UP??&OKAY, YOU DA BOSS!", "obj_zapper_enemy_slash_Step_0_gml_52_0");
            }
            if (mutedlastturn)
            {
                mutedlastturn = false;
                msgsetloc(0, "       ", "obj_zapper_enemy_slash_Step_0_gml_54_0");
            }
            scr_enemyblcon(x - 0, y + 36, 10);
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
            if (i_ex(obj_tenna_board4_enemy))
                myattackchoice = 0;
            if (i_ex(obj_shutta_enemy))
                myattackchoice = 1;
            if (i_ex(obj_shadowman_enemy) && i_ex(obj_volumeup))
                myattackchoice = 1;
            if (i_ex(obj_pippins_enemy) && i_ex(obj_volumeup))
                myattackchoice = 0;
            if (myattackchoice == 0)
            {
                global.monsterattackname[myself] = "zapper laser";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 65;
            }
            else if (myattackchoice == 1)
            {
                global.monsterattackname[myself] = "zapper cannon";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 66;
            }
            else if (myattackchoice == 2)
            {
                global.monsterattackname[myself] = "volume control";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 67;
            }
            scr_turntimer(200);
            turns += 1;
            if (!i_ex(obj_tenna_board4_enemy))
            {
                global.typer = 6;
                global.fc = 0;
                rr = choose(0, 1, 2, 3);
                if (scr_messagepriority(random(2)))
                {
                    if (rr == 0)
                        global.battlemsg[0] = stringsetloc("* Zapper clicks and clacks, zip and zaps.", "obj_zapper_enemy_slash_Step_0_gml_124_0");
                    if (rr == 1)
                        global.battlemsg[0] = stringsetloc("* Zapper quickly presses the buttons on its chest.", "obj_zapper_enemy_slash_Step_0_gml_125_0");
                    if (rr == 2)
                        global.battlemsg[0] = stringsetloc("* Zapper keeps just popping all night long.", "obj_zapper_enemy_slash_Step_0_gml_126_0");
                    if (rr == 3)
                        global.battlemsg[0] = stringsetloc("* Zapper checks if Tenna is watching.", "obj_zapper_enemy_slash_Step_0_gml_127_0");
                }
                if (global.monsterhp[myself] <= (global.monstermaxhp[myself] / 3))
                {
                    if (scr_messagepriority(100 + random(2)))
                        global.battlemsg[0] = stringsetloc("* Zapper's buttons feel mushy.", "obj_zapper_enemy_slash_Step_0_gml_133_0");
                }
                if (global.monsterstatus[myself] == 1)
                {
                    if (scr_messagepriority(100 + random(2)))
                        global.battlemsg[0] = stringsetloc("* Zapper's seeing visions of Lanino.", "obj_zapper_enemy_slash_Step_0_gml_139_0");
                }
                if (global.mercymod[myself] >= 100)
                {
                    if (scr_messagepriority(100 + random(2)))
                        global.battlemsg[0] = stringsetloc("* Zapper blushes in infrared, too.", "obj_zapper_enemy_slash_Step_0_gml_145_0");
                }
            }
            attacked = 1;
        }
    }
    if (global.mnfight == 2 && global.turntimer < 1)
    {
        muted = false;
        closedcaptioncon = 0;
        if (volumecountdestination > 10)
        {
            volumecountdestination = 10;
            displayvolumetimer = 20;
            snd_volume(global.batmusic[1], 1, 1);
        }
        with (obj_volumeup)
            instance_destroy();
        with (obj_volumeup2)
            instance_destroy();
    }
}
if (global.myfight == 3)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    if (acting == 1 && actcon == 0)
    {
        actcon = 1;
        if (!i_ex(obj_tenna_board4_enemy))
            msgsetsubloc(0, "* ZAPPER - \"Hoofer\", \"Clicker-Clacker\", any name, it'll do the work./%", string(global.monsterat[myself]), string(global.monsterdf[myself]), "obj_zapper_enemy_slash_Step_0_gml_183_0");
        else
            msgsetsubloc(0, "* ZAPPER - When it changes channels, who knows where you'll end up?/%", string(global.monsterat[myself]), string(global.monsterdf[myself]), "obj_zapper_enemy_slash_Step_0_gml_184_0");
        scr_battletext_default();
    }
    if (acting == 2 && actcon == 0)
    {
        volumeused = true;
        audio_resume_sound(global.batmusic[1]);
        scr_mercyadd(myself, 25);
        VolumeUpcount++;
        if (VolumeUpcount == 1)
        {
            msgsetloc(0, "* You turned up the volume!/%", "obj_zapper_enemy_slash_Step_0_gml_198_0");
            scr_battletext_default();
            acting = 20;
            if (i_ex(obj_tenna_board4_enemy))
                closedcaptioncon2 = 1;
            instance_create(x, y, obj_volumeup);
        }
        else if (VolumeUpcount > 1)
        {
            msgsetloc(0, "* The bullets increased in volume! Try getting close to gather TP!/%", "obj_zapper_enemy_slash_Step_0_gml_207_0");
            scr_battletext_default();
            instance_create(x, y, obj_volumeup);
            actcon = 1;
            volumecountdestination = 15;
            displayvolumetimer = 60;
            snd_volume(global.batmusic[1], 1.4, 1);
        }
    }
    if (acting == 20 && actcon == 0 && !i_ex(obj_writer))
    {
        volumecountdestination = 15;
        displayvolumetimer = 60;
        snd_volume(global.batmusic[1], 1.4, 1);
        msgsetloc(0, "* .../%", "obj_zapper_enemy_slash_Step_0_gml_230_0");
        scr_battletext_default();
        acting = 21;
    }
    if (acting == 21 && actcon == 0 && !i_ex(obj_writer))
    {
        msgsetloc(0, "* The bullets increased in volume, too...!&(But, they'll give more TP!)/%", "obj_zapper_enemy_slash_Step_0_gml_236_0");
        scr_battletext_default();
        instance_create(x, y, obj_volumeup);
        actcon = 1;
        if (i_ex(obj_tenna_board4_enemy))
            closedcaptioncon2 = 0;
    }
    if (acting == 3 && actcon == 0)
    {
        msgsetloc(0, "* You hit the MUTE button!/%", "obj_zapper_enemy_slash_Step_0_gml_246_0");
        scr_battletext_default();
        acting = 30;
    }
    if (acting == 30 && actcon == 0 && !i_ex(obj_writer))
    {
        volumecountdestination = 0;
        displayvolumetimer = 60;
        audio_pause_sound(global.batmusic[1]);
        msgsetloc(0, "* .../%", "obj_zapper_enemy_slash_Step_0_gml_256_0");
        scr_battletext_default();
        acting = 31;
        with (obj_zapper_enemy)
        {
            muted = true;
            mutedlastturn = true;
        }
    }
    if (acting == 31 && actcon == 0 && !i_ex(obj_writer))
    {
        with (obj_monsterparent)
        {
            if (global.monsterstatus[myself] != 1 && object_index != obj_tenna_board4_enemy)
                scr_monster_make_tired(myself);
        }
        scr_mercyadd(myself, 75);
        msgsetloc(0, "* All foes became TIRED!/%", "obj_zapper_enemy_slash_Step_0_gml_269_0");
        scr_battletext_default();
        actcon = 1;
    }
    if (acting == 4 && actcon == 0)
    {
        msgsetloc(0, "* You hit the OFF button!/%", "obj_zapper_enemy_slash_Step_0_gml_276_0");
        scr_battletext_default();
        acting = 40;
    }
    if (acting == 40 && actcon == 0 && !i_ex(obj_writer))
    {
        if (i_ex(obj_tenna_board4_enemy))
            snd_free_all();
        instance_create(x, y, obj_tvturnoff_manager);
        acting = 41;
    }
    if (acting == 41 && actcon == 0 && !i_ex(obj_tvturnoff_manager))
    {
        if (!i_ex(obj_tenna_board4_enemy))
        {
            with (obj_monsterparent)
                scr_spare(myself);
            actcon = 1;
        }
        else
        {
            talktimer = 0;
            acting = 42;
        }
    }
    if (acting == 42 && actcon == 0)
    {
        talktimer++;
        if (talktimer == 60)
        {
            with (obj_writer)
                instance_destroy();
            global.fc = 22;
            global.typer = 81;
            msgsetloc(0, "H-huh!?", "obj_zapper_enemy_slash_Step_0_gml_317_0");
            with (scr_enemyblcon(obj_tenna_board4_enemy.tenna_actor.x - 56, obj_tenna_board4_enemy.tenna_actor.y - 140, 10))
            {
            }
            myblcon.depth = depth - 10;
            talktimer = 0;
            acting = 42.5;
            obj_tenna_board4_enemy.tenna_actor.sprite_index = spr_tenna_point_up_b;
        }
    }
    if (acting == 42.5 && actcon == 0)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            obj_tenna_board4_enemy.tenna_actor.preset = 12;
            with (obj_tenna_board4_enemy.tenna_actor)
                scr_move_to_point_over_time(x - 250, y, 10);
            acting = 43;
            talktimer = 0;
        }
    }
    if (acting == 43 && actcon == 0)
    {
        talktimer++;
        if (talktimer == 15)
        {
            with (obj_writer)
                instance_destroy();
            global.fc = 22;
            global.typer = 81;
            msgsetloc(0, "Susie...?&Kris...?&Hey...?&HEY!!!", "obj_zapper_enemy_slash_Step_0_gml_343_0");
            with (scr_enemyblcon(obj_tenna_board4_enemy.tenna_actor.x + 90, obj_tenna_board4_enemy.tenna_actor.y - 140, 10))
                side = -1;
            myblcon.depth = depth - 10;
            talktimer = 0;
            acting = 44;
        }
    }
    if (acting == 44 && actcon == 0)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            global.fc = 22;
            global.typer = 81;
            msgsetloc(0, "DON'T TELL ME&YOU DIDN'T LIKE&YOUR CUSTOM MADE&TOY BALLS!?", "obj_zapper_enemy_slash_Step_0_gml_358_0");
            with (scr_enemyblcon(obj_tenna_board4_enemy.tenna_actor.x + 90, obj_tenna_board4_enemy.tenna_actor.y - 140, 10))
                side = -1;
            myblcon.depth = depth - 10;
            talktimer = 0;
            acting = 45;
            obj_tenna_board4_enemy.tenna_actor.image_speed = 1.5;
        }
    }
    if (acting == 45 && actcon == 0)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            global.fc = 22;
            global.typer = 81;
            msgsetloc(0, "Hey, Mike?", "obj_zapper_enemy_slash_Step_0_gml_373_0_b");
            with (scr_enemyblcon(obj_tenna_board4_enemy.tenna_actor.x + 90, obj_tenna_board4_enemy.tenna_actor.y - 140, 10))
                side = -1;
            myblcon.depth = depth - 10;
            talktimer = 0;
            acting = 46;
            with (obj_tenna_board4_enemy.tenna_actor)
                scr_lerpvar("image_speed", 2, 0, 60, 2, "out");
        }
    }
    if (acting == 46 && actcon == 0)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            global.fc = 22;
            global.typer = 81;
            msgsetloc(0, "Could you, uh, cancel&my 4am shock therapy&session?", "obj_zapper_enemy_slash_Step_0_gml_392_0");
            with (scr_enemyblcon(obj_tenna_board4_enemy.tenna_actor.x + 90, obj_tenna_board4_enemy.tenna_actor.y - 140, 10))
                side = -1;
            myblcon.depth = depth - 10;
            talktimer = 0;
            acting = 47;
            with (obj_tenna_board4_enemy.tenna_actor)
            {
                wobblestate = 0;
                wobbletime = 0;
                wobbleamt = 0;
            }
        }
    }
    if (acting == 47 && actcon == 0)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            global.fc = 22;
            global.typer = 81;
            msgsetloc(0, "'Cause it looks&like it's&happening right&now.", "obj_zapper_enemy_slash_Step_0_gml_412_0");
            with (scr_enemyblcon(obj_tenna_board4_enemy.tenna_actor.x + 90, obj_tenna_board4_enemy.tenna_actor.y - 140, 10))
                side = -1;
            myblcon.depth = depth - 10;
            talktimer = 0;
            acting = 48;
            obj_tenna_board4_enemy.tenna_actor.sprite_index = spr_tenna_whisper;
        }
    }
    if (acting == 48 && actcon == 0)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            global.fc = 22;
            global.typer = 81;
            msgsetloc(0, "ALL HANDS ON DECK!!!&EVERYONE FIND THE&LIGHTNERS!!!", "obj_zapper_enemy_slash_Step_0_gml_427_0");
            with (scr_enemyblcon(obj_tenna_board4_enemy.tenna_actor.x + 90, obj_tenna_board4_enemy.tenna_actor.y - 140, 10))
                side = -1;
            myblcon.depth = depth - 10;
            talktimer = 0;
            acting = 49;
            with (obj_lerpvar)
                instance_destroy();
            obj_tenna_board4_enemy.tenna_actor.preset = 12;
            snd_loop(snd_tv_alarm);
            depth = obj_tenna_board4_enemy.depth - 100;
            redalarm = true;
        }
    }
    if (acting >= 48)
    {
        with (obj_zapper_enemy)
        {
            if (i_ex(obj_battleblcon))
                depth = obj_battleblcon.depth + 1;
        }
        with (obj_actor_tenna)
        {
            if (preset == 12)
                image_speed = 0.35;
        }
    }
    if (acting == 49 && actcon == 0)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            talktimer = 0;
            acting = 49.5;
            obj_tenna_board4_enemy.tenna_actor.hspeed = 20;
        }
    }
    if (acting == 49.5 && actcon == 0)
    {
        talktimer++;
        if (talktimer == 20)
        {
            talktimer = 0;
            acting = 50;
        }
    }
    if (acting == 50 && actcon == 0)
    {
        talktimer++;
        if (talktimer >= 40)
            lightfade += 0.05;
        with (obj_tenna_board4_enemy)
            battleresult = 1;
        if (!i_ex(obj_ch3_GSD01_screen_scroll))
            instance_create(0, 0, obj_ch3_GSD01_screen_scroll);
    }
    if (actingsus == 1 && actconsus == 1)
    {
        msgsetloc(0, "* Susie mashed random buttons!/%", "obj_zapper_enemy_slash_Step_0_gml_396_0");
        scr_mercyadd(myself, 25);
        scr_battletext_default();
        snd_play(snd_damage);
        shakex = 9;
        state = 3;
        hurttimer = 30;
        actingsus = 30;
        sactused = true;
    }
    if (actingsus == 30)
    {
        if (!audio_is_playing(snd_fountain_make))
            snd_play(snd_fountain_make);
        if (changecolorcon == 0)
        {
            colortarget2 = make_color_hsv(irandom(255), 250, 255);
            if (changecolorcount == 5)
                colortarget2 = 16777215;
            pitchtarget2 = 1 + random(2);
            changecolorcon = 1;
        }
        if (changecolorcon == 1)
        {
            changecolortimer++;
            image_blend = merge_color(colortarget, colortarget2, changecolortimer / 3);
            pitch = lerp(pitchtarget, pitchtarget2, changecolortimer / 3);
            snd_pitch(snd_fountain_make, pitch);
            if (changecolortimer == 3)
            {
                colortarget = colortarget2;
                pitchtarget = pitchtarget2;
                changecolorcount++;
                changecolorcon = 0;
                changecolortimer = 0;
            }
        }
        if (changecolorcount == 6)
        {
            snd_stop(snd_fountain_make);
            image_blend = c_white;
            changecolorcount = 0;
            actcon = 1;
            actingsus = 0;
        }
    }
    if (actingral == 1 && actconral == 1)
    {
        msgsetloc(0, "* Ralsei enabled captions!/%", "obj_zapper_enemy_slash_Step_0_gml_455_0");
        scr_mercyadd(myself, 25);
        scr_battletext_default();
        actconral = 2;
        ractused = true;
    }
    if (actingral == 1 && actconral == 2 && !i_ex(obj_writer))
    {
        actconral = 3;
        alarm[4] = 70;
        if (muted == false)
            closedcaptioncon = 1;
        else
            alarm[4] = 1;
    }
    if (actconral == 3 && con == 1)
    {
        con = 0;
        actcon = 1;
        actconral = 0;
        closedcaptioncon = 0;
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
