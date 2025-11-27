if (scr_debug())
{
    if (keyboard_check_pressed(vk_backspace))
        global.flag[1044] = 150;
}
if (global.monster[myself] == 1)
{
    if (scr_isphase("enemytalk") && talked == 0)
    {
        scr_randomtarget();
        myattackpriority = 1;
        scr_attackpriority(myattackpriority - 1);
        if (!instance_exists(obj_darkener))
            instance_create(0, 0, obj_darkener);
        global.typer = 50;
        if (cheat && noballoon == -1)
        {
            with (obj_pippins_enemy)
            {
                if (myself == 0)
                {
                    msgsetloc(0, "(You do know&that makes my&attack stronger...)", "obj_pippins_enemy_slash_Step_0_gml_26_0");
                    scr_enemyblcon(x - 10, global.monstery[myself] - 10, 10);
                    noballoon = true;
                }
            }
            with (obj_pippins_enemy)
            {
                if (myself == 1)
                {
                    msgsetloc(0, "(This girl...&she boggles&the mind.)", "obj_pippins_enemy_slash_Step_0_gml_28_0");
                    scr_enemyblcon(x - 10, global.monstery[myself] - 10, 10);
                    noballoon = true;
                }
            }
            with (obj_pippins_enemy)
            {
                if (myself == 2)
                {
                    msgsetloc(0, "(What have you&done, you&yatzy!?)", "obj_pippins_enemy_slash_Step_0_gml_29_0");
                    scr_enemyblcon(x - 10, global.monstery[myself] - 10, 10);
                    noballoon = true;
                }
            }
        }
        else if (noballoon == 0)
        {
            rr = choose(0, 1, 2);
            if (irandom(100) < 10)
                rr = 4;
            if (instance_number(obj_pippins_enemy) == 3 && myself == 0)
                rr = choose(0, 1, 2, 3, 3);
            if (bet || fixedbet)
            {
                if (choose(0, 1) == 1)
                    msgsetloc(0, "YEAH! Touch&these 4's and&taste the THRILL!", "obj_pippins_enemy_slash_Step_0_gml_38_0");
                else
                    msgsetloc(0, "Put it all on&Green 4! Alright!!", "obj_pippins_enemy_slash_Step_0_gml_39_0");
                rr = -1;
            }
            if (rr == 0)
                msgsetloc(0, "Will I win?&Or will I win... BIG?", "obj_pippins_enemy_slash_Step_0_gml_42_0");
            if (rr == 1)
                msgsetloc(0, "Raise the stakes and&ROLL ROLL ROLL!", "obj_pippins_enemy_slash_Step_0_gml_43_0");
            if (rr == 2)
                msgsetloc(0, "Rock me, spill me,&shock and thrill me!", "obj_pippins_enemy_slash_Step_0_gml_44_0");
            if (rr == 3)
            {
                msgsetloc(0, "It's a lucky's world!&Do or die!", "obj_pippins_enemy_slash_Step_0_gml_47_0");
                with (obj_pippins_enemy)
                {
                    if (myself == 1)
                    {
                        msgsetloc(0, "Does or dice!", "obj_pippins_enemy_slash_Step_0_gml_48_0");
                        scr_enemyblcon(x - 10, global.monstery[myself] - 10, 10);
                        noballoon = true;
                    }
                }
                with (obj_pippins_enemy)
                {
                    if (myself == 2)
                    {
                        msgsetloc(0, "Don't or dien't!", "obj_pippins_enemy_slash_Step_0_gml_49_0");
                        scr_enemyblcon(x - 10, global.monstery[myself] - 10, 10);
                        noballoon = true;
                    }
                }
            }
            if (rr == 4)
                msgsetloc(0, "Life is a numbers game...&You ever heard that?", "obj_pippins_enemy_slash_Step_0_gml_51_0");
            if (sharpshootballoon)
            {
                msgsetloc(0, "Ya, what a rush!", "obj_pippins_enemy_slash_Step_0_gml_58_0");
                sharpshootballoon = false;
            }
            scr_enemyblcon(x - 10, global.monstery[myself] - 10, 10);
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
            var diceattackexists = false;
            for (var i = 0; i < instance_number(obj_dbulletcontroller); i++)
            {
                dbullet_controller[i] = instance_find(obj_dbulletcontroller, i);
                if (dbullet_controller[i].type == 11.5)
                    diceattackexists = true;
            }
            if (diceattackexists == false)
            {
                global.monsterattackname[myself] = "Dice Attack";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 112.5;
            }
            scr_turntimer(230);
            attackanim = true;
            turns += 1;
            noballoon = false;
            global.typer = 6;
            global.fc = 0;
            rr = choose(0, 1, 2, 3, 4);
            if (scr_monsterpop() > 1)
                rr = choose(0, 1, 2, 3, 4, 5, 5);
            if (scr_messagepriority(random(2)))
            {
                var substring = string(myself);
                if (rr == 0)
                    global.battlemsg[0] = stringsetloc("* Pippins attempts to engage you in a life or death rock paper scissors match.", "obj_pippins_enemy_slash_Step_0_gml_118_0");
                if (rr == 1)
                    global.battlemsg[0] = stringsetloc("* Pippins bounces like popcorn.", "obj_pippins_enemy_slash_Step_0_gml_119_0");
                if (rr == 2)
                    global.battlemsg[0] = stringsetloc("* Pippins' existence ambiently makes the scene become Rated T.", "obj_pippins_enemy_slash_Step_0_gml_120_0");
                if (rr == 3)
                    global.battlemsg[0] = stringsetloc("* Pippins scratches off tickets made of toilet paper.", "obj_pippins_enemy_slash_Step_0_gml_121_0");
                if (rr == 4)
                    global.battlemsg[0] = stringsetloc("* Pippins regrets mortgaging its 2 green houses.", "obj_pippins_enemy_slash_Step_0_gml_122_0");
                if (rr == 5)
                    global.battlemsg[0] = stringsetloc("* Pippins is betting the other enemies they'll lose.", "obj_pippins_enemy_slash_Step_0_gml_123_0");
            }
            if (irandom(100) < 4)
                global.battlemsg[0] = stringsetloc("* Smells like bad luck.", "obj_pippins_enemy_slash_Step_0_gml_125_0");
            if (global.monsterhp[myself] <= (global.monstermaxhp[myself] / 3))
            {
                if (scr_messagepriority(100 + random(2)))
                {
                    var substring = string(myself);
                    global.battlemsg[0] = stringsetloc("* Pippins seems down on its luck.", "obj_pippins_enemy_slash_Step_0_gml_130_0");
                }
            }
            if (board2event == true)
            {
                if (turns == 1)
                    global.battlemsg[0] = stringsetloc("\\E2What's the problem? Kris likes playing as me better anyway.", "obj_pippins_enemy_slash_Step_0_gml_134_0");
                if (turns == 2)
                    global.battlemsg[0] = stringsetloc("\\EDK... Kris? Likes... playing as Susie? ... but won't it be confusing?", "obj_pippins_enemy_slash_Step_0_gml_135_0");
                if (turns == 3)
                    global.battlemsg[0] = stringsetloc("\\E9Confusing Ralsei's the best part of the game so far, right, Kris?", "obj_pippins_enemy_slash_Step_0_gml_136_0");
                if (turns == 4)
                    global.battlemsg[0] = stringsetloc("\\EO* Well, if it's fun! ... But, I still think... Kris should be Kris.", "obj_pippins_enemy_slash_Step_0_gml_137_0");
            }
            attacked = 1;
        }
    }
    if (global.mnfight == 2 && global.turntimer <= 1)
    {
        bribe = false;
        bet = false;
        fixedbet = false;
        cheat = false;
    }
}
if (global.myfight == 3)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    if (acting == 1 && actcon == 0)
    {
        actcon = 1;
        global.writerimg[0] = spr_bullet_dice_6;
        global.writerimg[1] = spr_bullet_dice_3;
        msgsetloc(0, "* PIPPINS - This crooked gambler from Card Castle always bets it all!/%", "obj_pippins_enemy_slash_Step_0_gml_170_0");
        scr_battletext_default();
    }
    if (acting == 2 && actcon == 0)
    {
        if (simultotal == 1)
        {
            msgsetloc(0, "* You bet you could touch the Dice when it's a GREEN 4!/%", "obj_pippins_enemy_slash_Step_0_gml_185_0");
            scr_battletext_default();
            actcon = 1;
        }
        else
        {
            msgsetloc(0, "* Bet: Touch the GREEN 4's!", "obj_pippins_enemy_slash_Step_0_gml_191_0");
            scr_simultext("kris");
            if (simulorderkri == 0)
                actcon = 20;
            else
                actcon = -1;
        }
        bet = true;
    }
    if (acting == 3 && actcon == 0)
    {
        with (obj_monsterparent)
            scr_monster_make_tired(myself);
        cheatcount++;
        if (cheatcount == 1)
        {
            msgsetloc(0, "* Susie drew 4 dots on all the dice! The enemies got TIRED!/%", "obj_pippins_enemy_slash_Step_0_gml_217_0");
            scr_battletext_default();
            acting = 3.1;
            cheat = true;
        }
        else
        {
            var ran = choose(0, 1);
            if (krismarker == true && ralseimarker == false)
                ran = 0;
            if (krismarker == false && ralseimarker == true)
                ran = 1;
            if (ran == 0)
            {
                msgsetloc(0, "* Susie got bored of cheating and drew a mustache on Ralsei!/%", "obj_pippins_enemy_slash_Step_0_gml_229_0");
                if (instance_number(obj_pippins_marker) < 3)
                {
                    inst = instance_create(obj_heroralsei.x, obj_heroralsei.y, obj_pippins_marker);
                    inst.sprite_index = spr_ralsei_mustache2;
                    inst.image_xscale = 2;
                    inst.image_yscale = 2;
                }
                ralseimarker = false;
            }
            else
            {
                msgsetloc(0, "* Susie got bored of cheating and drew dead eyes on Kris!/%", "obj_pippins_enemy_slash_Step_0_gml_241_0");
                if (instance_number(obj_pippins_marker) < 3)
                {
                    inst = instance_create(obj_herokris.x, obj_herokris.y, obj_pippins_marker);
                    inst.sprite_index = spr_krisb_eye_x;
                    inst.image_xscale = 2;
                    inst.image_yscale = 2;
                }
                krismarker = true;
            }
            scr_battletext_default();
            actcon = 1;
        }
        with (obj_pippins_enemy)
            global.flag[510]++;
    }
    if (acting >= 3.1 && acting < 3.6)
        talktimer++;
    if (acting == 3.1 && actcon == 0 && !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        talktimer = 0;
        with (obj_pippins_enemy)
            idlesprite = spr_npc_pippins_sad;
        global.typer = 75;
        msgsetloc(0, "Who's the highroller&now, idiot!?/%", "obj_pippins_enemy_slash_Step_0_gml_271_0");
        scr_heroblcon("susie");
        acting = 3.2;
    }
    if (acting == 3.2 && actcon == 0 && talktimer > 15 && (button3_p() || button1_p()))
    {
        with (obj_writer)
            instance_destroy();
        talktimer = 0;
        with (obj_pippins_enemy)
            noballoon = -1;
        actcon = 1;
    }
    if (acting == 4 && actcon == 0)
    {
        if (global.flag[1044] >= 150)
        {
            global.flag[1044] -= 150;
            bribe = true;
            msgsetloc(0, "* You and Ralsei used 150 POINTs to BRIBE the enemy!/%", "obj_pippins_enemy_slash_Step_0_gml_296_0");
            scr_battletext_default();
            if (global.flag[509] == 0)
                acting = 4.1;
            else
                acting = 4.51;
            with (obj_pippins_enemy)
                global.flag[509]++;
        }
    }
    if (acting == 4.1 && actcon == 0 && !i_ex(obj_writer))
    {
        global.typer = 74;
        msgsetloc(0, "B-Bribe? Umm, no, I...&This is just a peace&offering!", "obj_pippins_enemy_slash_Step_0_gml_317_0");
        var heroballoon = scr_enemyblcon(obj_heroralsei.x + 120, obj_heroralsei.y + 60, 10);
        heroballoon.side = -1;
        obj_heroralsei.x += 40;
        scr_battle_sprite_set("ralsei", spr_ralsei_shocked_right, 0, 1);
        acting = 4.11;
    }
    if (acting >= 4.11 && acting < 4.6)
        talktimer++;
    if (acting == 4.11 && actcon == 0 && talktimer > 15 && (button3_p() || button1_p()))
    {
        with (obj_writer)
            instance_destroy();
        talktimer = 0;
        global.typer = 50;
        with (obj_pippins_enemy)
        {
            msgsetloc(0, "Bribe, wow, is this legal?", "obj_pippins_enemy_slash_Step_0_gml_337_0");
            scr_enemyblcon(x, global.monstery[myself] - 10, 10);
        }
        acting = 4.12;
    }
    if (acting == 4.12 && actcon == 0 && talktimer > 15 && (button3_p() || button1_p()))
    {
        with (obj_writer)
            instance_destroy();
        talktimer = 0;
        global.typer = 75;
        msgsetloc(0, "That's dirty, dude.", "obj_pippins_enemy_slash_Step_0_gml_349_0");
        scr_heroblcon("susie");
        acting = 4.13;
    }
    if (acting == 4.13 && actcon == 0 && talktimer > 15 && (button3_p() || button1_p()))
    {
        with (obj_writer)
            instance_destroy();
        talktimer = 0;
        global.typer = 74;
        snd_play(snd_bump);
        msgsetloc(0, "W-wait, maybe&I shouldn't...", "obj_pippins_enemy_slash_Step_0_gml_363_0");
        var heroballoon = scr_enemyblcon(obj_heroralsei.x + 80, obj_heroralsei.y + 55, 10);
        with (obj_heroralsei)
            scr_shakeobj();
        heroballoon.side = -1;
        acting = 4.14;
    }
    if (acting == 4.14 && actcon == 0 && talktimer > 15 && (button3_p() || button1_p()))
    {
        with (obj_writer)
            instance_destroy();
        talktimer = 0;
        if (scr_monsterpop() == 1)
        {
            scr_spare(myself);
            scr_wincombat();
        }
        else
        {
            with (obj_pippins_enemy)
            {
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
            image_alpha = 0;
            scr_spareanim();
            scr_recruit();
            scr_monsterdefeat();
            with (obj_heroralsei)
                scr_shakeobj();
            snd_play(snd_bump);
            msgsetloc(0, "WAIT!!!", "obj_pippins_enemy_slash_Step_0_gml_390_0");
            var heroballoon = scr_enemyblcon(obj_heroralsei.x + 80, obj_heroralsei.y + 55, 10);
            heroballoon.side = -1;
            acting = 4.15;
        }
    }
    if (acting == 4.15 && actcon == 0 && talktimer > 15 && (button3_p() || button1_p()))
    {
        obj_heroralsei.x -= 40;
        scr_battle_sprite_reset("ralsei");
        with (obj_writer)
            instance_destroy();
        talktimer = 0;
        instance_destroy();
        scr_nextact();
    }
    if (acting == 4.51 && actcon == 0 && !i_ex(obj_writer))
    {
        obj_heroralsei.x += 40;
        scr_battle_sprite_set("ralsei", spr_ralsei_shocked_right, 0, 1);
        with (obj_heroralsei)
            scr_shakeobj();
        snd_play(snd_bump);
        global.typer = 74;
        msgsetloc(0, "It's, it's not a...", "obj_pippins_enemy_slash_Step_0_gml_416_0");
        var heroballoon = scr_enemyblcon(obj_heroralsei.x + 80, obj_heroralsei.y + 55, 10);
        heroballoon.side = -1;
        acting = 4.52;
    }
    if (acting == 4.52 && actcon == 0 && talktimer > 15 && (button3_p() || button1_p()))
    {
        obj_heroralsei.x -= 40;
        scr_battle_sprite_reset("ralsei");
        with (obj_writer)
            instance_destroy();
        talktimer = 0;
        with (obj_pippins_enemy)
        {
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
        scr_spare(myself);
        actcon = 1;
    }
    if (actingsus == 1 && actconsus == 1)
    {
        scr_mercyadd(myself, 50);
        snd_play(snd_wing);
        scr_shakeobj();
        if (simultotal == 1)
        {
            msgsetloc(0, "* Susie shook Pippins around! They kind of liked it!/%", "obj_pippins_enemy_slash_Step_0_gml_446_0");
            scr_battletext_default();
            actconsus = 20;
        }
        else
        {
            msgsetloc(0, "* Susie shook Pippins!!", "obj_pippins_enemy_slash_Step_0_gml_452_0");
            scr_simultext("susie");
            if (simulordersus == 0)
                actconsus = 20;
            else
                actconsus = 0;
        }
    }
    if (actingral == 1 && actconral == 1)
    {
        scr_mercyadd(myself, 50);
        if (simultotal == 1)
        {
            msgsetloc(0, "* Ralsei swore not to cheat!/", "obj_pippins_enemy_slash_Step_0_gml_464_0");
            msgnextloc("* Susie swore to cheat! (That didn't help...)/%", "obj_pippins_enemy_slash_Step_0_gml_465_0");
            scr_battletext_default();
            actconral = 20;
        }
        else
        {
            msgsetloc(0, "* Ralsei swore not to cheat!", "obj_pippins_enemy_slash_Step_0_gml_471_0");
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
