if (global.monster[myself] == 1)
{
    if (scr_isphase("enemytalk") && talked == 0)
    {
        scr_randomtarget();
        myattackchoice = choose(0, 1, 2);
        myattackpriority = 1;
        if (myattackchoice == 2)
            myattackpriority = 50;
        scr_attackpriority(myattackpriority - 1);
        if (!instance_exists(obj_darkener))
            instance_create(0, 0, obj_darkener);
        global.typer = 50;
        rr = choose(0, 1, 2, 3);
        if (rr == 0)
            msgsetloc(0, "Message&A", "obj_baseenemy_slash_Step_0_gml_27_0");
        if (rr == 1)
            msgsetloc(0, "Message&B", "obj_baseenemy_slash_Step_0_gml_28_0");
        if (rr == 2)
            msgsetloc(0, "Message&C", "obj_baseenemy_slash_Step_0_gml_29_0");
        if (rr == 3)
            msgsetloc(0, "Message&D", "obj_baseenemy_slash_Step_0_gml_30_0");
        scr_enemyblcon(x - 160, y, 3);
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
                with (obj_growtangle)
                {
                    x = camerax() + 240;
                    maxxscale = 1.5;
                }
            }
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
            }
            scr_turntimer(200);
            turns += 1;
            global.typer = 6;
            global.fc = 0;
            rr = choose(0, 1, 2, 3);
            if (scr_messagepriority(random(2)))
            {
                var substring = string(myself);
                if (rr == 0)
                    global.battlemsg[0] = stringsetsubloc("* Placeholder Message A~1.", substring, "obj_baseenemy_slash_Step_0_gml_86_0");
                if (rr == 1)
                    global.battlemsg[0] = stringsetsubloc("* Placeholder Message B~1.", substring, "obj_baseenemy_slash_Step_0_gml_87_0");
                if (rr == 2)
                    global.battlemsg[0] = stringsetsubloc("* Placeholder Message C~1.", substring, "obj_baseenemy_slash_Step_0_gml_88_0");
                if (rr == 3)
                    global.battlemsg[0] = stringsetsubloc("* Placeholder Message D~1.", substring, "obj_baseenemy_slash_Step_0_gml_89_0");
            }
            if (global.monsterhp[myself] <= (global.monstermaxhp[myself] / 3))
            {
                if (scr_messagepriority(100 + random(2)))
                {
                    var substring = string(myself);
                    global.battlemsg[0] = stringsetsubloc("* Damaged message ~1.", substring, "obj_baseenemy_slash_Step_0_gml_114_0_b");
                }
            }
            attacked = 1;
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
        scr_smallface(0, "susie", 6, "left", "bottom", stringsetloc("BottomLeft", "obj_baseenemy_slash_Step_0_gml_110_0"));
        scr_smallface(1, "ralsei", 1, "right", "top", stringsetloc("RightTop", "obj_baseenemy_slash_Step_0_gml_111_0"));
        scr_smallface(2, "noelle", 0, "mid", "mid", stringsetloc("MidMid ", "obj_baseenemy_slash_Step_0_gml_112_0"));
        scr_smallface(3, "susie", 6, "right", "bottommid", stringsetloc("Right BottomMid", "obj_baseenemy_slash_Step_0_gml_113_0"));
        scr_smallface(4, "susie", 6, "rightmid", "bottommid", stringsetloc("rightmid BottomMid", "obj_baseenemy_slash_Step_0_gml_114_0"));
        scr_smallface(5, "susie", 6, "leftmid", "bottommid", stringsetloc("leftmid BottomMid", "obj_baseenemy_slash_Step_0_gml_115_0"));
        msgsetloc(0, "* ENEMY - AT 1 DF 1&* Susceptible to Brainshock.\\f0 ^1 \\f1 ^1 \\f2 ^1 \\f3 /", "obj_baseenemy_slash_Step_0_gml_117_0");
        msgsetloc(1, "\\f0 \\f1 \\f2 \\f3 \\f4 \\f5 /%", "obj_baseenemy_slash_Step_0_gml_118_0");
        scr_battletext_default();
    }
    if (acting == 2 && actcon == 0)
    {
        actcon = 1;
        if (global.automiss[myself] == 0)
        {
            msgsetloc(0, "* You warned the enemy^1.&* It guarded from Susie's attack./%", "obj_baseenemy_slash_Step_0_gml_127_0");
            global.monstercomment[myself] = "(Warned)";
            global.automiss[myself] = 1;
        }
        scr_battletext_default();
    }
    if (acting == 3 && actcon == 0)
    {
        msgsetloc(0, "* Its body was filled with a kind feeling./%", "obj_baseenemy_slash_Step_0_gml_137_0");
        scr_mercyadd(myself, 100);
        scr_battletext_default();
        actcon = 1;
    }
    if (acting == 4 && actcon == 0)
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
    if (acting == 5 && actcon == 0)
    {
        msgsetloc(0, "* Its body will result in a speech after attack./%", "obj_baseenemy_slash_Step_0_gml_156_0");
        scr_battletext_default();
        actcon = 1;
    }
    if (acting == 6 && actcon == 0)
    {
        msgsetloc(0, "* Its body became tired./%", "obj_baseenemy_slash_Step_0_gml_164_0");
        scr_monster_make_tired(myself);
        scr_battletext_default();
        actcon = 1;
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
        msgset(0, "* Susie's revive \"spell!\"");
        instance_create(obj_herokris.x, obj_herokris.y, obj_ralsei_cherub);
        scr_battletext_default();
        actcon = 1;
        actconsus = 0;
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
        msgset(0, "* Ralsei's revive skill!");
        instance_create(obj_herokris.x, obj_herokris.y, obj_ralsei_cherub);
        scr_battletext_default();
        actcon = 1;
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
