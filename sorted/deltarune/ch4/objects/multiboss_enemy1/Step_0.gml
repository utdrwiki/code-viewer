if (global.monster[myself] == 1)
{
    if (scr_isphase("enemytalk") && talked == 0 && !i_ex(obj_writer))
    {
        scr_randomtarget();
        myattackchoice = choose(0, 1);
        if (taunt == 1)
            myattackchoice = 2;
        taunt = 0;
        susienotactingalone = 0;
        if (!instance_exists(obj_darkener))
            instance_create(0, 0, obj_darkener);
        var _text = "";
        global.typer = 50;
        if (myattackchoice == 0)
            _text = "HOMING&DIAMONDS!";
        if (myattackchoice == 1)
            _text = "RISING&DIAMONDS!";
        if (myattackchoice == 2)
            _text = "SWORD&THROW!";
        msgset(0, _text);
        scr_enemyblcon(x - 160, y, 3);
        msgset(0, _text);
        scr_enemyblcon(obj_multiboss_enemy2.x - 160, obj_multiboss_enemy2.y, 3);
        msgset(0, _text);
        scr_enemyblcon(obj_multiboss_enemy3.x - 160, obj_multiboss_enemy3.y, 3);
        talked = 1;
        talktimer = 0;
        rtimer = 0;
        if ((instance_exists(obj_multiboss_enemy1) && global.monsterhp[obj_multiboss_enemy1.myself] <= (global.monstermaxhp[obj_multiboss_enemy1.myself] * 0.5)) || (instance_exists(obj_multiboss_enemy2) && global.monsterhp[obj_multiboss_enemy2.myself] <= (global.monstermaxhp[obj_multiboss_enemy2.myself] * 0.5)) || (instance_exists(obj_multiboss_enemy3) && global.monsterhp[obj_multiboss_enemy3.myself] <= (global.monstermaxhp[obj_multiboss_enemy3.myself] * 0.5)))
            healcon = 0.5;
    }
    if (talked == 1 && scr_isphase("enemytalk"))
        scr_blconskip(15);
    if (global.mnfight == 1.5)
    {
        if (healcon == 0)
        {
            if (!instance_exists(obj_growtangle))
                instance_create(__view_get(e__VW.XView, 0) + 320, __view_get(e__VW.YView, 0) + 170, obj_growtangle);
            if (myattackchoice == 2)
            {
                with (obj_growtangle)
                {
                    x = camerax() + 240;
                    maxxscale = 1.5;
                }
            }
            if (!instance_exists(obj_moveheart))
                scr_moveheart();
        }
        global.mnfight = 2;
        scr_turntimer(90);
    }
    if (scr_isphase("bullets") && attacked == 0)
    {
        rtimer += 1;
        if (rtimer == 12)
        {
            if (healcon == 0.5)
            {
                healcon = 1;
            }
            else
            {
                if (myattackchoice == 0)
                {
                    global.monsterattackname[myself] = "HomingDiamonds";
                    dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                    dc.type = 0;
                }
                else if (myattackchoice == 1)
                {
                    global.monsterattackname[myself] = "RisingDiamonds";
                    dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                    dc.type = 1;
                }
                else if (myattackchoice == 2)
                {
                    global.monsterattackname[myself] = "SwordThrow";
                    dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                    dc.type = 3;
                    with (obj_multiboss_enemy2)
                    {
                        global.monsterattackname[myself] = "SwordThrow";
                        dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                        dc.type = 3;
                    }
                    with (obj_multiboss_enemy3)
                    {
                        global.monsterattackname[myself] = "SwordThrow";
                        dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                        dc.type = 3;
                    }
                }
                scr_turntimer(140);
                turns += 1;
                global.typer = 6;
                global.fc = 0;
                rr = choose(0, 1, 2, 3);
                var substring = string(myself);
                if (rr == 0)
                    global.battlemsg[0] = stringsetsubloc("* Team Message A~1.", substring, "obj_multiboss_enemy1_slash_Step_0_gml_137_0");
                if (rr == 1)
                    global.battlemsg[0] = stringsetsubloc("* Team Message B~1.", substring, "obj_multiboss_enemy1_slash_Step_0_gml_138_0");
                if (rr == 2)
                    global.battlemsg[0] = stringsetsubloc("* Team Message C~1.", substring, "obj_multiboss_enemy1_slash_Step_0_gml_139_0");
                if (rr == 3)
                    global.battlemsg[0] = stringsetsubloc("* Team Message D~1.", substring, "obj_multiboss_enemy1_slash_Step_0_gml_140_0");
                attacked = 1;
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
        taunt = 1;
        msgsetloc(0, "* You taunted the enemy. It will now throw swords this turn!/%", "obj_baseenemy_slash_Step_0_gml_127_0");
        scr_battletext_default();
    }
    if (acting == 2 && actcon == 0)
    {
        msgsetloc(0, "* Kris's simul act!", "obj_baseenemy_slash_Step_0_gml_146_0");
        if (simultotal == 1)
            msgsetloc(0, "* Kris decided to have a really long message when acting alone.", "obj_baseenemy_slash_Step_0_gml_147_0");
        scr_mercyadd(myself, 35);
        scr_simultext("kris");
        if (simulorderkri == 0)
            actcon = 20;
        else
            actcon = -1;
    }
    if (acting == 3 && actcon == 0)
    {
        if (obj_multiboss_enemy1.krisflattercount == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* You flattered (multiple lines)!/", "obj_multiboss_enemy1_slash_Step_0_gml_182_0");
            msgnextloc("* And the first time you flatter/", "obj_multiboss_enemy1_slash_Step_0_gml_183_0");
            msgnextloc("* The text is way longer/%", "obj_multiboss_enemy1_slash_Step_0_gml_184_0");
            scr_battletext_default();
            with (obj_multiboss_enemy1)
                global.actsimul[myself][2] = 1;
            with (obj_multiboss_enemy2)
                global.actsimul[myself][2] = 1;
            with (obj_multiboss_enemy3)
                global.actsimul[myself][2] = 1;
            actcon = 1;
        }
        else
        {
            if (simultotal == 1)
            {
                msgsetloc(0, "* You made a memorable and charming flatter!/%", "obj_multiboss_enemy1_slash_Step_0_gml_196_0");
                scr_battletext_default();
            }
            else
            {
                msgsetloc(0, "* You flatter!", "obj_multiboss_enemy1_slash_Step_0_gml_201_0");
                scr_simultext("kris");
            }
            if (simulorderkri == 0)
                actcon = 20;
            else
                actcon = -1;
        }
        obj_multiboss_enemy1.krisflattercount++;
    }
    if (actingsus == 1 && actconsus == 1)
    {
        msgsetloc(0, "* Susie's unique act A!./%", "obj_baseenemy_slash_Step_0_gml_172_0");
        scr_mercyadd(myself, 35);
        scr_battletext_default();
        actcon = 1;
        actconsus = 0;
    }
    if (actingsus == 2 && actconsus == 1)
    {
        msgsetloc(0, "* Susie's simul act!", "obj_baseenemy_slash_Step_0_gml_181_0");
        scr_mercyadd(myself, 35);
        scr_simultext("susie");
        if (simulordersus == 0)
            actconsus = 20;
        else
            actconsus = 0;
    }
    if (actingsus == 3 && actconsus == 1)
    {
        if (obj_multiboss_enemy1.susieflattercount == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Susie flatter (multiple lines)!/", "obj_multiboss_enemy1_slash_Step_0_gml_232_0");
            msgnextloc("* And the first time susie flatters/", "obj_multiboss_enemy1_slash_Step_0_gml_233_0");
            msgnextloc("* The text is way longer/%", "obj_multiboss_enemy1_slash_Step_0_gml_234_0");
            scr_battletext_default();
            with (obj_multiboss_enemy1)
                global.actsimulsus[myself][2] = 1;
            with (obj_multiboss_enemy2)
                global.actsimulsus[myself][2] = 1;
            with (obj_multiboss_enemy3)
                global.actsimulsus[myself][2] = 1;
            actcon = 1;
            actconsus = 0;
        }
        else
        {
            if (simultotal == 1)
            {
                msgsetloc(0, "* Susie made an offensive flatter!/%", "obj_multiboss_enemy1_slash_Step_0_gml_246_0");
                scr_battletext_default();
            }
            else
            {
                msgsetloc(0, "* Susie flatter!", "obj_multiboss_enemy1_slash_Step_0_gml_251_0");
                scr_simultext("susie");
            }
            if (simulordersus == 0)
                actconsus = 20;
            else
                actconsus = 0;
        }
        obj_multiboss_enemy1.susieflattercount++;
    }
    if (susienotactingalone == 0)
    {
        if (global.actingsingle[0] == 1 || global.actingsingle[2] == 1)
            susienotactingalone = 1;
    }
    if (actingsus == 4 && actconsus == 1)
    {
        if (simultotal == 1 && susienotactingalone == 0)
        {
            msgsetloc(0, "* Susie acted alone!/%", "obj_multiboss_enemy1_slash_Step_0_gml_268_0");
            scr_battletext_default();
            actingsus = 10;
        }
        else if (simultotal != 1)
        {
            msgsetloc(0, "* Susie couldn't act alone!", "obj_multiboss_enemy1_slash_Step_0_gml_274_0");
            scr_simultext("susie");
            if (simulordersus == 0)
                actconsus = 20;
            else
                actconsus = 0;
        }
        else
        {
            msgsetloc(0, "* Susie couldn't act alone!/%", "obj_multiboss_enemy1_slash_Step_0_gml_280_0");
            scr_battletext_default();
            actcon = 1;
            actconsus = 0;
        }
    }
    if (actingsus == 10 && actconsus == 1 && !i_ex(obj_writer))
    {
        scr_battle_sprite_set("susie", spr_susie_chomp, 0.25, 1);
        scr_mercyadd(myself, 35);
        msgsetloc(0, "* Susie was able to execute arbitrary code alone!/%", "obj_multiboss_enemy1_slash_Step_0_gml_291_0");
        scr_battletext_default();
        actingsus = 11;
    }
    if (actingsus == 11 && actconsus == 1 && !i_ex(obj_writer))
    {
        global.typer = 50;
        msgsetloc(0, "What the!?/%", "obj_multiboss_enemy1_slash_Step_0_gml_299_0");
        scr_enemyblcon(obj_herosusie.x + 105, obj_herosusie.y, 7);
        actingsus = 12;
        talktimer = 0;
    }
    if (actingsus == 12 && actconsus == 1)
    {
        talktimer++;
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            scr_battle_sprite_reset("susie");
            with (obj_writer)
                instance_destroy();
            actcon = 1;
            actconsus = 0;
        }
    }
    if (actingral == 1 && actconral == 1)
    {
        msgsetloc(0, "* Ralsei's unique act A!./%", "obj_baseenemy_slash_Step_0_gml_190_0");
        scr_mercyadd(myself, 35);
        scr_battletext_default();
        actcon = 1;
        actconral = 0;
    }
    if (actingral == 2 && actconral == 1)
    {
        msgsetloc(0, "* Ralsei's simul act!", "obj_baseenemy_slash_Step_0_gml_199_0");
        scr_mercyadd(myself, 35);
        scr_simultext("ralsei");
        if (simulorderral == 0)
            actconral = 20;
        else
            actconral = 0;
    }
    if (actingral == 3 && actconral == 1)
    {
        if (obj_multiboss_enemy1.ralseiflattercount == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Ralsei flatter (multiple lines)!/", "obj_multiboss_enemy1_slash_Step_0_gml_340_0");
            msgnextloc("* And the first time Ralsei flatters/", "obj_multiboss_enemy1_slash_Step_0_gml_341_0");
            msgnextloc("* The text is way longer/%", "obj_multiboss_enemy1_slash_Step_0_gml_342_0");
            scr_battletext_default();
            with (obj_multiboss_enemy1)
                global.actsimulral[myself][2] = 1;
            with (obj_multiboss_enemy2)
                global.actsimulral[myself][2] = 1;
            with (obj_multiboss_enemy3)
                global.actsimulral[myself][2] = 1;
            actcon = 1;
            actconral = 0;
        }
        else
        {
            if (simultotal == 1)
            {
                msgsetloc(0, "* Ralsei made a slightly cringeworthy flatter!/%", "obj_multiboss_enemy1_slash_Step_0_gml_354_0");
                scr_battletext_default();
            }
            else
            {
                msgsetloc(0, "* Ralsei flatter!", "obj_multiboss_enemy1_slash_Step_0_gml_359_0");
                scr_simultext("ralsei");
            }
            if (simulorderral == 0)
                actconral = 20;
            else
                actconral = 0;
        }
        obj_multiboss_enemy1.ralseiflattercount++;
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
if (healcon == 1)
    healcon = 1.5;
if (healcon == 1.5 && !instance_exists(obj_writer))
{
    global.turntimer = 999;
    with (obj_writer)
        instance_destroy();
    global.typer = 50;
    whohealed = 0;
    if (instance_exists(obj_multiboss_enemy1) && global.monsterhp[obj_multiboss_enemy1.myself] <= (global.monstermaxhp[obj_multiboss_enemy1.myself] * 0.5))
        whohealed = 1;
    else if (instance_exists(obj_multiboss_enemy2) && global.monsterhp[obj_multiboss_enemy2.myself] <= (global.monstermaxhp[obj_multiboss_enemy2.myself] * 0.5))
        whohealed = 2;
    else if (instance_exists(obj_multiboss_enemy3) && global.monsterhp[obj_multiboss_enemy3.myself] <= (global.monstermaxhp[obj_multiboss_enemy3.myself] * 0.5))
        whohealed = 3;
    else if (instance_exists(obj_multiboss_enemy1) && instance_exists(obj_multiboss_enemy2) && global.monsterhp[obj_multiboss_enemy1.myself] <= (global.monstermaxhp[obj_multiboss_enemy1.myself] * 0.5) && global.monsterhp[obj_multiboss_enemy2.myself] <= (global.monstermaxhp[obj_multiboss_enemy2.myself] * 0.5))
        whohealed = 4;
    else if (instance_exists(obj_multiboss_enemy1) && instance_exists(obj_multiboss_enemy3) && global.monsterhp[obj_multiboss_enemy1.myself] <= (global.monstermaxhp[obj_multiboss_enemy1.myself] * 0.5) && global.monsterhp[obj_multiboss_enemy3.myself] <= (global.monstermaxhp[obj_multiboss_enemy3.myself] * 0.5))
        whohealed = 5;
    else if (instance_exists(obj_multiboss_enemy3) && instance_exists(obj_multiboss_enemy2) && global.monsterhp[obj_multiboss_enemy3.myself] <= (global.monstermaxhp[obj_multiboss_enemy3.myself] * 0.5) && global.monsterhp[obj_multiboss_enemy2.myself] <= (global.monstermaxhp[obj_multiboss_enemy2.myself] * 0.5))
        whohealed = 6;
    if (whohealed == 1)
    {
        with (obj_multiboss_enemy1)
        {
            msgsetloc(0, "I'm at my acoustic limit...", "obj_musical_controller_slash_Step_0_gml_52_0");
            scr_enemyblcon(x - 10, global.monstery[myself], 10);
        }
        with (obj_multiboss_enemy2)
        {
            msgsetloc(0, "Have a sip.", "obj_musical_controller_slash_Step_0_gml_57_0");
            scr_enemyblcon(x - 10, global.monstery[myself], 10);
        }
    }
    if (whohealed == 2)
    {
        with (obj_multiboss_enemy2)
        {
            msgsetloc(0, "Mmm... I'm thirsty.", "obj_musical_controller_slash_Step_0_gml_66_0");
            scr_enemyblcon(x - 10, global.monstery[myself], 10);
        }
        with (obj_multiboss_enemy3)
        {
            msgsetloc(0, "(Don't ya mean&you're WOUNDED!?)", "obj_musical_controller_slash_Step_0_gml_71_0");
            scr_enemyblcon(x - 10, global.monstery[myself], 10);
        }
    }
    if (whohealed == 3)
    {
        with (obj_multiboss_enemy3)
        {
            msgsetloc(0, "Owww, my hat!! They&scuffed my hat!!", "obj_musical_controller_slash_Step_0_gml_80_0");
            scr_enemyblcon(x - 10, global.monstery[myself], 10);
        }
        with (obj_multiboss_enemy1)
        {
            msgsetloc(0, "(Stop being dramatic&and heal!!)", "obj_musical_controller_slash_Step_0_gml_85_0");
            scr_enemyblcon(x - 10, global.monstery[myself], 10);
        }
    }
    if (whohealed == 4)
    {
        with (obj_multiboss_enemy1)
        {
            msgsetloc(0, "Even if we're all beat, we...", "obj_musical_controller_slash_Step_0_gml_94_0");
            scr_enemyblcon(x - 10, global.monstery[myself], 10);
        }
        with (obj_multiboss_enemy2)
        {
            msgsetloc(0, "Can all drink from one milk.)", "obj_musical_controller_slash_Step_0_gml_99_0");
            scr_enemyblcon(x - 10, global.monstery[myself], 10);
        }
    }
    if (whohealed == 5)
    {
        with (obj_multiboss_enemy1)
        {
            msgsetloc(0, "Even if we're all beat, we...", "obj_musical_controller_slash_Step_0_gml_108_0");
            scr_enemyblcon(x - 10, global.monstery[myself], 10);
        }
        with (obj_multiboss_enemy3)
        {
            msgsetloc(0, "Can all drink from one milk.)", "obj_musical_controller_slash_Step_0_gml_113_0");
            scr_enemyblcon(x - 10, global.monstery[myself], 10);
        }
    }
    if (whohealed == 6)
    {
        with (obj_multiboss_enemy2)
        {
            msgsetloc(0, "Even if we're all beat, we...", "obj_musical_controller_slash_Step_0_gml_122_0");
            scr_enemyblcon(x - 10, global.monstery[myself], 10);
        }
        with (obj_multiboss_enemy3)
        {
            msgsetloc(0, "Can all drink from one milk.)", "obj_musical_controller_slash_Step_0_gml_127_0");
            scr_enemyblcon(x - 10, global.monstery[myself], 10);
        }
    }
    healcon = 1.6;
    healtimer = 0;
}
if (healcon == 1.6)
{
    global.turntimer = 999;
    healtimer++;
    if (healtimer >= 60)
    {
        healcon = 1.7;
        healtimer = 0;
    }
}
if (healcon == 1.7)
{
    with (obj_writer)
        instance_destroy();
    var yyy = 180;
    if (whohealed == 1)
        yyy = 90;
    if (whohealed == 3)
        yyy = 240;
    snd_play(snd_magicsprinkle);
    milk = scr_dark_marker(x - 100, cameray() + yyy, spr_checkers_milk);
    with (milk)
    {
        image_speed = 0;
        image_xscale = 4;
        image_yscale = 4;
        image_alpha = 0;
    }
    milk.depth = depth - 1;
    healtimer = 0;
    healcon = 2;
}
if (healcon == 2)
{
    with (milk)
    {
        image_xscale -= 0.2;
        image_yscale -= 0.2;
        image_alpha += 0.1;
    }
    healtimer += 1;
    if (healtimer >= 10)
    {
        healcon = 3;
        healtimer = 0;
        with (milk)
            image_alpha = 1.4;
    }
}
if (healcon == 3)
{
    healtimer += 1;
    if (healtimer >= 25)
    {
        healcon = 4;
        healtimer = 0;
    }
}
if (healcon == 4)
{
    with (milk)
    {
        hspeed += 2;
        image_alpha -= 0.1;
    }
    healtimer += 1;
    if (healtimer == 10)
    {
        if (whohealed == 1 || whohealed == 4 || whohealed == 5)
        {
            with (obj_multiboss_enemy1)
            {
                global.monsterhp[myself] = global.monstermaxhp[myself];
                healamt = instance_create(global.monsterx[myself], global.monstery[myself], obj_dmgwriter);
                with (healamt)
                {
                    delay = 8;
                    type = 3;
                    damage = global.monstermaxhp[obj_multiboss_enemy1.myself];
                    specialmessage = 3;
                }
                hanim = instance_create(x, y, obj_healanim);
                hanim.target = id;
            }
        }
        if (whohealed == 2 || whohealed == 4 || whohealed == 6)
        {
            with (obj_multiboss_enemy2)
            {
                global.monsterhp[myself] = global.monstermaxhp[myself];
                healamt = instance_create(global.monsterx[myself], global.monstery[myself], obj_dmgwriter);
                with (healamt)
                {
                    delay = 8;
                    type = 3;
                    damage = global.monstermaxhp[obj_multiboss_enemy2.myself];
                    specialmessage = 3;
                }
                hanim = instance_create(x, y, obj_healanim);
                hanim.target = id;
            }
        }
        if (whohealed == 3 || whohealed == 5 || whohealed == 6)
        {
            with (obj_multiboss_enemy3)
            {
                global.monsterhp[myself] = global.monstermaxhp[myself];
                healamt = instance_create(global.monsterx[myself], global.monstery[myself], obj_dmgwriter);
                with (healamt)
                {
                    delay = 8;
                    type = 3;
                    damage = global.monstermaxhp[obj_multiboss_enemy3.myself];
                    specialmessage = 3;
                }
                hanim = instance_create(x, y, obj_healanim);
                hanim.target = id;
            }
        }
    }
    if (healtimer >= 15)
    {
        with (milk)
            instance_destroy();
        healcon = 5;
        healtimer = 0;
    }
}
if (healcon == 5)
{
    healtimer += 1;
    if (healtimer >= 30)
    {
        with (obj_writer)
            instance_destroy();
        healcon = 6;
        if (whohealed == 1)
            msgsetloc(0, "* obj_multiboss_enemy1's HP went up!/%", "obj_musical_controller_slash_Step_0_gml_260_0");
        if (whohealed == 2)
            msgsetloc(0, "* obj_multiboss_enemy2's HP went up!/%", "obj_musical_controller_slash_Step_0_gml_261_0");
        if (whohealed == 3)
            msgsetloc(0, "* obj_multiboss_enemy3's HP went up!/%", "obj_musical_controller_slash_Step_0_gml_262_0");
        if (whohealed == 4)
            msgsetloc(0, "* obj_multiboss_enemy1's and obj_multiboss_enemy2's HP went up!/%", "obj_musical_controller_slash_Step_0_gml_263_0");
        if (whohealed == 5)
            msgsetloc(0, "* obj_multiboss_enemy1's and obj_multiboss_enemy3's HP went up!/%", "obj_musical_controller_slash_Step_0_gml_264_0");
        if (whohealed == 6)
            msgsetloc(0, "* obj_multiboss_enemy2's and obj_multiboss_enemy3's HP went up!/%", "obj_musical_controller_slash_Step_0_gml_265_0");
        scr_battletext_default();
    }
}
if (healcon == 6)
{
    global.turntimer = 999;
    if (!instance_exists(obj_writer))
    {
        global.fc = 0;
        healcon = 0;
        healtimer = 0;
        global.turntimer = 1;
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
