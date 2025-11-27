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
        rr = choose(0, 1, 2, 3);
        if (rr == 0)
            msgsetloc(0, "Bubell, &bubell,&toil and&trubell.", "obj_bell_enemy_slash_Step_0_gml_27_0");
        if (rr == 1)
            msgsetloc(0, "Trembell&with&trebell.", "obj_bell_enemy_slash_Step_0_gml_28_0");
        if (rr == 2)
            msgsetloc(0, "Wobbell,&rumbell,&tinkle and&tumbell!", "obj_bell_enemy_slash_Step_0_gml_29_0");
        if (rr == 3)
            msgsetloc(0, "Lament-a-bell,&Miser-a-bell,&Un-stop-a-bell!", "obj_bell_enemy_slash_Step_0_gml_30_0");
        if (global.mercymod[myself] >= 100)
            msgsetloc(0, "I am humbelled.", "obj_bell_enemy_slash_Step_0_gml_31_0");
        scr_enemyblcon(x - 6, y + 50, 10);
        talked = 1;
        talktimer = 0;
        rtimer = 0;
        talksoundcon = 1;
    }
    if (talksoundcon == 1)
    {
        talksoundtimer++;
        if ((talksoundtimer % 8) == 0)
        {
            snd_stop(snd_musicbox);
            snd_play(snd_musicbox, 0.35, 0.7 + random(0.6));
        }
        if (talksoundtimer == 24)
        {
            talksoundtimer = 7;
            talksoundcon = 0;
        }
    }
    if (talked == 1 && scr_isphase("enemytalk"))
        scr_blconskip(15);
    if (global.mnfight == 1.5)
    {
        snd_stop(snd_musicbox);
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
                global.monsterattackname[myself] = "Pendulumattack";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 300;
            }
            else if (myattackchoice == 1)
            {
                state = 10;
            }
            scr_turntimer(220);
            turns += 1;
            global.typer = 6;
            global.fc = 0;
            rr = choose(0, 1, 2, 3);
            if (scr_messagepriority(random(2)))
            {
                if (rr == 0)
                    global.battlemsg[0] = stringsetloc("* Wicabel rings a haunting hex.", "obj_bell_enemy_slash_Step_0_gml_114_0");
                if (rr == 1)
                    global.battlemsg[0] = stringsetloc("* Wicabel creates a cursing clamor.", "obj_bell_enemy_slash_Step_0_gml_115_0");
                if (rr == 2)
                    global.battlemsg[0] = stringsetloc("* Wicabel spins like a musicbox ballerina.", "obj_bell_enemy_slash_Step_0_gml_116_0");
                if (rr == 3)
                    global.battlemsg[0] = stringsetloc("* Wicabel emits classical music.", "obj_bell_enemy_slash_Step_0_gml_117_0");
                if (irandom(100) < 3)
                    global.battlemsg[0] = stringsetloc("* Smells like damp wood and rust.", "obj_bell_enemy_slash_Step_0_gml_118_0");
            }
            if (global.monsterhp[myself] <= (global.monstermaxhp[myself] / 3))
            {
                if (scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Wicabel harkens hexes hoarsely.", "obj_bell_enemy_slash_Step_0_gml_123_0");
            }
            if (global.mercymod[myself] >= 100)
            {
                if (scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Wicabel plays peacefully.", "obj_bell_enemy_slash_Step_0_gml_128_0");
            }
            if (global.monsterstatus[myself] == 1)
            {
                if (scr_messagepriority(102 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Wicabel chimes a sleeping spell.", "obj_bell_enemy_slash_Step_0_gml_133_0");
            }
            attacked = 1;
        }
    }
}
if (global.myfight == 3)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    var _tuning_string = stringsetloc("* Press button with the right timing!", "obj_bell_enemy_slash_Step_0_gml_165_0");
    if (acting == 1 && actcon == 0)
    {
        actcon = 1;
        msgsetloc(0, "* WICABEL - A metal mage. When out of tune, she's unpredictabell./%", "obj_bell_enemy_slash_Step_0_gml_155_0");
        scr_battletext_default();
    }
    if (acting == 2 && actcon == 0)
    {
        acting = 20.4;
        msgset(0, _tuning_string);
        scr_battletext_default();
    }
    if (acting == 20.4 && actcon == 0 && i_ex(obj_writer) && obj_writer.reachedend == 1)
    {
        instance_create(camerax() + 304, cameray() + 80, obj_bell_enemy_tuning_fork);
        box = instance_create(camerax() + 320, cameray() + 220, obj_bell_enemy_tuning_box);
        box.parentid = id;
        acting = 21;
    }
    if (acting == 3 && actcon == 0)
    {
        acting = 20.5;
        msgset(0, _tuning_string);
        scr_battletext_default();
    }
    if (acting == 20.5 && actcon == 0 && i_ex(obj_writer) && obj_writer.reachedend == 1)
    {
        instance_create(camerax() + 304, cameray() + 80, obj_bell_enemy_tuning_fork);
        box = instance_create(camerax() + 320, cameray() + 220, obj_bell_enemy_tuning_box);
        box.parentid = id;
        box.loudringing = 1;
        acting = 21;
    }
    if (acting == 21 && !i_ex(obj_bell_enemy_tuning_box))
    {
        var txt = stringsetloc("&* All musical ACTs became stronger!/%", "obj_bell_enemy_slash_Step_0_gml_170_0");
        if (tuningactsuccess == 1)
            msgsetsubloc(0, "* Perfectly in tune!~1", txt, "obj_bell_enemy_slash_Step_0_gml_172_0");
        else if (tuningactsuccess == 2)
            msgsetsubloc(0, "* Somewhat in tune!~1", txt, "obj_bell_enemy_slash_Step_0_gml_199_0");
        else
            msgsetsubloc(0, "* A bit off-tune!~1", txt, "obj_bell_enemy_slash_Step_0_gml_173_0");
        scr_battletext_default();
        actcon = 1;
        acting = 0;
    }
    if (actingsus == 1 && actconsus == 1)
    {
        msgsetloc(0, "* Susie hammers a bell!/%", "obj_bell_enemy_slash_Step_0_gml_192_0");
        scr_mercyadd(myself, 40);
        scr_simultext("susie");
        if (simulordersus == 0)
            actconsus = 20;
        else
            actconsus = 0;
    }
    if (actingral == 1 && actconral == 1)
    {
        msgsetloc(0, "* Ralsei tapped a bell!/%", "obj_bell_enemy_slash_Step_0_gml_201_0");
        scr_mercyadd(myself, 20);
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
