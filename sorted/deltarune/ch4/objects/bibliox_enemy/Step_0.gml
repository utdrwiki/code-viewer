if (global.monster[myself] == 1)
{
    if (!i_ex(obj_dbulletcontroller))
    {
        if (image_alpha < 1)
            image_alpha += 0.1;
    }
    if (scr_isphase("enemytalk") && talked == 0)
    {
        beardcon = 1;
        scr_randomtarget();
        myattackchoice = 0;
        proofeasy = 0;
        myattackpriority = 1;
        if (myattackchoice == 2)
            myattackpriority = 50;
        scr_attackpriority(myattackpriority - 1);
        if (!instance_exists(obj_darkener))
            instance_create(0, 0, obj_darkener);
        global.typer = 50;
        rr = choose(0, 1, 2, 3, 4, 5);
        if (rr == 0)
            msgsetloc(0, "Mumble,&mumble...", "obj_bibliox_enemy_slash_Step_0_gml_33_0_b");
        if (rr == 1)
            msgsetloc(0, "To by, or&not to by?", "obj_bibliox_enemy_slash_Step_0_gml_34_0");
        if (rr == 2)
            msgsetloc(0, "Lauren Ipsome,&Lauren Ipsome.", "obj_bibliox_enemy_slash_Step_0_gml_35_0");
        if (rr == 3)
            msgsetloc(0, "It was the best&of times, it&was the blurst&of times.", "obj_bibliox_enemy_slash_Step_0_gml_36_0");
        if (rr == 4)
            msgsetloc(0, "Human soles,&monster soles,&Book soles...", "obj_bibliox_enemy_slash_Step_0_gml_37_0");
        if (rr == 5)
            msgsetloc(0, "... whose do we?&Whose do we&decimal...", "obj_bibliox_enemy_slash_Step_0_gml_38_0");
        scr_enemyblcon(x - 0, y + 50, 10);
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
            global.monsterattackname[myself] = "book attack";
            dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
            dc.type = 140;
            dc.damage = 80;
            scr_turntimer(200);
            turns += 1;
            global.typer = 6;
            global.fc = 0;
            rr = choose(0, 1, 2, 3, 4);
            if (scr_messagepriority(random(2)))
            {
                var substring = string(myself);
                if (rr == 0)
                    global.battlemsg[0] = stringsetloc("* Bibliox rearranges bookmarks in his beard.", "obj_bibliox_enemy_slash_Step_0_gml_90_0");
                if (rr == 1)
                    global.battlemsg[0] = stringsetloc("* Bibliox conjures letters in the air.", "obj_bibliox_enemy_slash_Step_0_gml_91_0");
                if (rr == 2)
                    global.battlemsg[0] = stringsetloc("* Bibliox augurs with alphabet soup.", "obj_bibliox_enemy_slash_Step_0_gml_92_0");
                if (rr == 3)
                    global.battlemsg[0] = stringsetloc("* Bibliox mumbles a hymn... but, the lyrics were mistaken.", "obj_bibliox_enemy_slash_Step_0_gml_93_0");
                if (rr == 4)
                    global.battlemsg[0] = stringsetloc("* Bibliox is mumbling and bumbling.", "obj_bibliox_enemy_slash_Step_0_gml_94_0");
                if (irandom(100) < 3)
                    global.battlemsg[0] = stringsetloc("* Smells like parchment.", "obj_bibliox_enemy_slash_Step_0_gml_95_0");
            }
            if (global.monsterhp[myself] <= (global.monstermaxhp[myself] / 3))
            {
                if (scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Bibliox looks ragged.", "obj_bibliox_enemy_slash_Step_0_gml_100_0");
            }
            if (global.mercymod[myself] >= 100)
            {
                if (scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Bibliox's beard flaps happily.", "obj_bibliox_enemy_slash_Step_0_gml_105_0");
            }
            if (global.monsterstatus[myself] == 1)
            {
                if (scr_messagepriority(102 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Bibliox can't keep its pages open.", "obj_bibliox_enemy_slash_Step_0_gml_110_0");
            }
            attacked = 1;
        }
    }
    if (global.mnfight == 2 && global.turntimer <= 1)
        beardcon = 0;
}
if (global.myfight == 3)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    if (acting == 1 && actcon == 0)
    {
        actcon = 1;
        msgsetloc(0, "* BIBLIOX - A worldly wizard that cast spells by spelling./", "obj_bibliox_enemy_slash_Step_0_gml_135_0");
        msgnextloc("* Unfortunately prone to typos./%", "obj_bibliox_enemy_slash_Step_0_gml_136_0");
        scr_battletext_default();
    }
    if ((acting == 2 && actcon == 0) || (acting == 3 && actcon == 0))
    {
        msgsetsubloc(0, "* Select the right spelling!", "obj_bibliox_enemy_slash_Step_0_gml_142_0");
        scr_battletext_default();
        with (obj_writer)
            pos = 100;
        if (acting == 3)
            proofeasy = 1;
        acting = 2.5;
    }
    if (acting == 2.5)
    {
        timerb++;
        if (timerb == 6)
        {
            timerb = 0;
            controller = instance_create(x, y, obj_proofread_controller_new);
            controller.creatorid = id;
            if (proofeasy == 1)
                controller.easyproof = 1;
            acting = 20;
        }
    }
    if (acting == 20 && !i_ex(obj_proofread_controller_new))
    {
        timerb++;
        if (((button3_p() || button1_p()) && timerb > 17) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            timerb = 0;
            actcon = 1;
        }
    }
    if (actingsus == 1 && actconsus == 1)
    {
        var s_act_text = stringsetloc("* Susie attempted to read!/", "obj_bibliox_enemy_slash_Step_0_gml_167_0");
        if (sactcount == 0 && simultotal == 1)
        {
            scr_speaker("noone");
            msgset(0, s_act_text);
            msgnextloc("* ... But there were no pictures!/", "obj_bibliox_enemy_slash_Step_0_gml_173_0");
            msgnextloc("* ... Susie fell asleep!!!/", "obj_bibliox_enemy_slash_Step_0_gml_174_0");
            scr_anyface_next("ralsei", "L");
            msgnextloc("\\EK* Susie?/%", "obj_bibliox_enemy_slash_Step_0_gml_176_0");
            scr_battletext_default();
        }
        else
        {
            msgset(0, s_act_text + "%");
            scr_simultext("susie");
        }
        scr_mercyadd(myself, 15);
        if (simulordersus == 0)
            actconsus = 20;
        else
            actconsus = 0;
        with (obj_bibliox_enemy)
            sactcount++;
    }
    if (actingral == 1 && actconral == 1)
    {
        msgsetloc(0, "* Ralsei wore reading glasses!/%", "obj_bibliox_enemy_slash_Step_0_gml_193_0");
        scr_mercyadd(myself, 30);
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
