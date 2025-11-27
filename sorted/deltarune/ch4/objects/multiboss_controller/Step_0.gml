if (scr_isphase("enemytalk") && talked == 0)
{
    scr_randomtarget();
    myattackchoice = choose(0, 1);
    if (obj_multiboss_controller.taunt == 1)
        myattackchoice = 2;
    obj_multiboss_controller.taunt = 0;
    if (!instance_exists(obj_darkener))
        instance_create(0, 0, obj_darkener);
    talked = 1;
    attacked = 0;
    rtimer = 0;
    if ((instance_exists(obj_multiboss_controller_enemy1) && global.monsterhp[obj_multiboss_controller_enemy1.myself] <= (global.monstermaxhp[obj_multiboss_controller_enemy1.myself] * 0.5)) || (instance_exists(obj_multiboss_controller_enemy2) && global.monsterhp[obj_multiboss_controller_enemy2.myself] <= (global.monstermaxhp[obj_multiboss_controller_enemy2.myself] * 0.5)) || (instance_exists(obj_multiboss_controller_enemy3) && global.monsterhp[obj_multiboss_controller_enemy3.myself] <= (global.monstermaxhp[obj_multiboss_controller_enemy3.myself] * 0.5)))
        healcon = 0.5;
    susienotactingalone = 0;
}
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
            talked = 0;
        }
        else
        {
            var attackingenemy = 0;
            if (global.monster[0] == 1)
                attackingenemy = 851;
            else if (global.monster[1] == 1)
                attackingenemy = 871;
            else if (global.monster[2] == 1)
                attackingenemy = 872;
            if (myattackchoice == 0)
            {
                with (attackingenemy)
                {
                    global.monsterattackname[myself] = "HomingDiamonds";
                    dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                    dc.type = 0;
                }
            }
            else if (myattackchoice == 1)
            {
                with (attackingenemy)
                {
                    global.monsterattackname[myself] = "RisingDiamonds";
                    dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                    dc.type = 1;
                }
            }
            else if (myattackchoice == 2)
            {
                with (obj_multiboss_controller_enemy1)
                {
                    global.monsterattackname[myself] = "SwordThrow";
                    dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                    dc.type = 3;
                }
                with (obj_multiboss_controller_enemy2)
                {
                    global.monsterattackname[myself] = "SwordThrow";
                    dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                    dc.type = 3;
                }
                with (obj_multiboss_controller_enemy3)
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
            if (rr == 0)
                global.battlemsg[0] = stringsetsub("* Team Message A1.");
            if (rr == 1)
                global.battlemsg[0] = stringsetsub("* Team Message B1.");
            if (rr == 2)
                global.battlemsg[0] = stringsetsub("* Team Message C1.");
            if (rr == 3)
                global.battlemsg[0] = stringsetsub("* Team Message D1.");
            attacked = 1;
            talked = 0;
        }
    }
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
    if (instance_exists(obj_multiboss_controller_enemy1) && global.monsterhp[obj_multiboss_controller_enemy1.myself] <= (global.monstermaxhp[obj_multiboss_controller_enemy1.myself] * 0.5))
        whohealed = 1;
    else if (instance_exists(obj_multiboss_controller_enemy2) && global.monsterhp[obj_multiboss_controller_enemy2.myself] <= (global.monstermaxhp[obj_multiboss_controller_enemy2.myself] * 0.5))
        whohealed = 2;
    else if (instance_exists(obj_multiboss_controller_enemy3) && global.monsterhp[obj_multiboss_controller_enemy3.myself] <= (global.monstermaxhp[obj_multiboss_controller_enemy3.myself] * 0.5))
        whohealed = 3;
    else if (instance_exists(obj_multiboss_controller_enemy1) && instance_exists(obj_multiboss_controller_enemy2) && global.monsterhp[obj_multiboss_controller_enemy1.myself] <= (global.monstermaxhp[obj_multiboss_controller_enemy1.myself] * 0.5) && global.monsterhp[obj_multiboss_controller_enemy2.myself] <= (global.monstermaxhp[obj_multiboss_controller_enemy2.myself] * 0.5))
        whohealed = 4;
    else if (instance_exists(obj_multiboss_controller_enemy1) && instance_exists(obj_multiboss_controller_enemy3) && global.monsterhp[obj_multiboss_controller_enemy1.myself] <= (global.monstermaxhp[obj_multiboss_controller_enemy1.myself] * 0.5) && global.monsterhp[obj_multiboss_controller_enemy3.myself] <= (global.monstermaxhp[obj_multiboss_controller_enemy3.myself] * 0.5))
        whohealed = 5;
    else if (instance_exists(obj_multiboss_controller_enemy3) && instance_exists(obj_multiboss_controller_enemy2) && global.monsterhp[obj_multiboss_controller_enemy3.myself] <= (global.monstermaxhp[obj_multiboss_controller_enemy3.myself] * 0.5) && global.monsterhp[obj_multiboss_controller_enemy2.myself] <= (global.monstermaxhp[obj_multiboss_controller_enemy2.myself] * 0.5))
        whohealed = 6;
    if (whohealed == 1)
    {
        with (obj_multiboss_controller_enemy1)
        {
            msgsetloc(0, "I'm at my acoustic limit...", "obj_musical_controller_slash_Step_0_gml_52_0");
            scr_enemyblcon(x - 10, global.monstery[myself], 10);
        }
        with (obj_multiboss_controller_enemy2)
        {
            msgsetloc(0, "Have a sip.", "obj_musical_controller_slash_Step_0_gml_57_0");
            scr_enemyblcon(x - 10, global.monstery[myself], 10);
        }
    }
    if (whohealed == 2)
    {
        with (obj_multiboss_controller_enemy2)
        {
            msgsetloc(0, "Mmm... I'm thirsty.", "obj_musical_controller_slash_Step_0_gml_66_0");
            scr_enemyblcon(x - 10, global.monstery[myself], 10);
        }
        with (obj_multiboss_controller_enemy3)
        {
            msgsetloc(0, "(Don't ya mean&you're WOUNDED!?)", "obj_musical_controller_slash_Step_0_gml_71_0");
            scr_enemyblcon(x - 10, global.monstery[myself], 10);
        }
    }
    if (whohealed == 3)
    {
        with (obj_multiboss_controller_enemy3)
        {
            msgsetloc(0, "Owww, my hat!! They&scuffed my hat!!", "obj_musical_controller_slash_Step_0_gml_80_0");
            scr_enemyblcon(x - 10, global.monstery[myself], 10);
        }
        with (obj_multiboss_controller_enemy1)
        {
            msgsetloc(0, "(Stop being dramatic&and heal!!)", "obj_musical_controller_slash_Step_0_gml_85_0");
            scr_enemyblcon(x - 10, global.monstery[myself], 10);
        }
    }
    if (whohealed == 4)
    {
        with (obj_multiboss_controller_enemy1)
        {
            msgsetloc(0, "Even if we're all beat, we...", "obj_musical_controller_slash_Step_0_gml_94_0");
            scr_enemyblcon(x - 10, global.monstery[myself], 10);
        }
        with (obj_multiboss_controller_enemy2)
        {
            msgsetloc(0, "Can all drink from one milk.)", "obj_musical_controller_slash_Step_0_gml_99_0");
            scr_enemyblcon(x - 10, global.monstery[myself], 10);
        }
    }
    if (whohealed == 5)
    {
        with (obj_multiboss_controller_enemy1)
        {
            msgsetloc(0, "Even if we're all beat, we...", "obj_musical_controller_slash_Step_0_gml_108_0");
            scr_enemyblcon(x - 10, global.monstery[myself], 10);
        }
        with (obj_multiboss_controller_enemy3)
        {
            msgsetloc(0, "Can all drink from one milk.)", "obj_musical_controller_slash_Step_0_gml_113_0");
            scr_enemyblcon(x - 10, global.monstery[myself], 10);
        }
    }
    if (whohealed == 6)
    {
        with (obj_multiboss_controller_enemy2)
        {
            msgsetloc(0, "Even if we're all beat, we...", "obj_musical_controller_slash_Step_0_gml_122_0");
            scr_enemyblcon(x - 10, global.monstery[myself], 10);
        }
        with (obj_multiboss_controller_enemy3)
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
            with (obj_multiboss_controller_enemy1)
            {
                global.monsterhp[myself] = global.monstermaxhp[myself];
                healamt = instance_create(global.monsterx[myself], global.monstery[myself], obj_dmgwriter);
                with (healamt)
                {
                    delay = 8;
                    type = 3;
                    damage = global.monstermaxhp[obj_multiboss_controller_enemy1.myself];
                    specialmessage = 3;
                }
                hanim = instance_create(x, y, obj_healanim);
                hanim.target = id;
            }
        }
        if (whohealed == 2 || whohealed == 4 || whohealed == 6)
        {
            with (obj_multiboss_controller_enemy2)
            {
                global.monsterhp[myself] = global.monstermaxhp[myself];
                healamt = instance_create(global.monsterx[myself], global.monstery[myself], obj_dmgwriter);
                with (healamt)
                {
                    delay = 8;
                    type = 3;
                    damage = global.monstermaxhp[obj_multiboss_controller_enemy2.myself];
                    specialmessage = 3;
                }
                hanim = instance_create(x, y, obj_healanim);
                hanim.target = id;
            }
        }
        if (whohealed == 3 || whohealed == 5 || whohealed == 6)
        {
            with (obj_multiboss_controller_enemy3)
            {
                global.monsterhp[myself] = global.monstermaxhp[myself];
                healamt = instance_create(global.monsterx[myself], global.monstery[myself], obj_dmgwriter);
                with (healamt)
                {
                    delay = 8;
                    type = 3;
                    damage = global.monstermaxhp[obj_multiboss_controller_enemy3.myself];
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
            msgsetloc(0, "* obj_multiboss_controller_enemy1's HP went up!/%", "obj_musical_controller_slash_Step_0_gml_260_0");
        if (whohealed == 2)
            msgsetloc(0, "* obj_multiboss_controller_enemy2's HP went up!/%", "obj_musical_controller_slash_Step_0_gml_261_0");
        if (whohealed == 3)
            msgsetloc(0, "* obj_multiboss_controller_enemy3's HP went up!/%", "obj_musical_controller_slash_Step_0_gml_262_0");
        if (whohealed == 4)
            msgsetloc(0, "* obj_multiboss_controller_enemy1's and obj_multiboss_controller_enemy2's HP went up!/%", "obj_musical_controller_slash_Step_0_gml_263_0");
        if (whohealed == 5)
            msgsetloc(0, "* obj_multiboss_controller_enemy1's and obj_multiboss_controller_enemy3's HP went up!/%", "obj_musical_controller_slash_Step_0_gml_264_0");
        if (whohealed == 6)
            msgsetloc(0, "* obj_multiboss_controller_enemy2's and obj_multiboss_controller_enemy3's HP went up!/%", "obj_musical_controller_slash_Step_0_gml_265_0");
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
