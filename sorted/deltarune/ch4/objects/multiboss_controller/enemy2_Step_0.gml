if (global.monster[myself] == 1)
{
    if (scr_isphase("enemytalk") && talked == 0 && obj_multiboss_controller.talked == 1)
    {
        global.typer = 50;
        if (obj_multiboss_controller.myattackchoice == 0)
            msgsetloc(0, "HOMING&DIAMONDS!", "obj_baseenemy_slash_Step_0_gml_27_0");
        if (obj_multiboss_controller.myattackchoice == 1)
            msgsetloc(0, "RISING&DIAMONDS!", "obj_baseenemy_slash_Step_0_gml_28_0");
        if (obj_multiboss_controller.myattackchoice == 2)
            msgsetloc(0, "SWORD&THROW!", "obj_baseenemy_slash_Step_0_gml_29_0");
        scr_enemyblcon(x - 160, y, 3);
        talked = 1;
        talktimer = 0;
        rtimer = 0;
    }
    if (talked == 1 && scr_isphase("enemytalk"))
        scr_blconskip(15);
}
if (global.myfight == 3)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    if (acting == 1 && actcon == 0)
    {
        actcon = 1;
        obj_multiboss_controller.taunt = 1;
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
        if (obj_multiboss_controller.krisflattercount == 0)
        {
            scr_speaker("no_name");
            msgset(0, "* You flattered (multiple lines)!/");
            msgnext("* And the first time you flatter/");
            msgnext("* The text is way longer/%");
            scr_battletext_default();
            with (obj_multiboss_controller_enemy1)
                global.actsimul[myself][2] = 1;
            with (obj_multiboss_controller_enemy2)
                global.actsimul[myself][2] = 1;
            with (obj_multiboss_controller_enemy3)
                global.actsimul[myself][2] = 1;
            actcon = 1;
        }
        else
        {
            if (simultotal == 1)
            {
                msgset(0, "* You made a memorable and charming flatter!/%");
                scr_battletext_default();
            }
            else
            {
                msgset(0, "* You flatter!/%");
                scr_simultext("kris");
            }
            if (simulorderkri == 0)
                actcon = 20;
            else
                actcon = -1;
        }
        obj_multiboss_controller.krisflattercount++;
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
        if (obj_multiboss_controller.susieflattercount == 0)
        {
            scr_speaker("no_name");
            msgset(0, "* Susie flatter (multiple lines)!/");
            msgnext("* And the first time susie flatters/");
            msgnext("* The text is way longer/%");
            scr_battletext_default();
            with (obj_multiboss_controller_enemy1)
                global.actsimulsus[myself][2] = 1;
            with (obj_multiboss_controller_enemy2)
                global.actsimulsus[myself][2] = 1;
            with (obj_multiboss_controller_enemy3)
                global.actsimulsus[myself][2] = 1;
            actcon = 1;
            actconsus = 0;
        }
        else
        {
            if (simultotal == 1)
            {
                msgset(0, "* Susie made an offensive flatter!/%");
                scr_battletext_default();
            }
            else
            {
                msgset(0, "* Susie flatter!/%");
                scr_simultext("susie");
            }
            if (simulordersus == 0)
                actconsus = 20;
            else
                actconsus = 0;
        }
        obj_multiboss_controller.susieflattercount++;
    }
    if (obj_multiboss_controller.susienotactingalone == 0)
    {
        if (global.actingsingle[0] == 1 || global.actingsingle[2] == 1)
            obj_multiboss_controller.susienotactingalone = 1;
    }
    if (actingsus == 4 && actconsus == 1)
    {
        if (simultotal == 1 && obj_multiboss_controller.susienotactingalone == 0)
        {
            msgset(0, "* Susie acted alone!/%");
            scr_battletext_default();
            actingsus = 10;
        }
        else if (simultotal != 1)
        {
            msgset(0, "* Susie couldn't act alone!");
            scr_simultext("susie");
            if (simulordersus == 0)
                actconsus = 20;
            else
                actconsus = 0;
        }
        else
        {
            msgset(0, "* Susie couldn't act alone!/%");
            scr_battletext_default();
            actcon = 1;
            actconsus = 0;
        }
    }
    if (actingsus == 10 && actconsus == 1 && !i_ex(obj_writer))
    {
        scr_battle_sprite_set("susie", spr_susie_chomp, 0.25, 1);
        scr_mercyadd(myself, 35);
        msgset(0, "* Susie was able to execute arbitrary code alone!/%");
        scr_battletext_default();
        actingsus = 11;
    }
    if (actingsus == 11 && actconsus == 1 && !i_ex(obj_writer))
    {
        global.typer = 50;
        msgset(0, "What the!?/%");
        scr_enemyblcon(obj_herosusie.x + 105, obj_herosusie.y, 7);
        actingsus = 12;
        talktimer = 0;
    }
    if (actingsus == 12)
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
        if (obj_multiboss_controller.ralseiflattercount == 0)
        {
            scr_speaker("no_name");
            msgset(0, "* Ralsei flatter (multiple lines)!/");
            msgnext("* And the first time Ralsei flatters/");
            msgnext("* The text is way longer/%");
            scr_battletext_default();
            with (obj_multiboss_controller_enemy1)
                global.actsimulral[myself][2] = 1;
            with (obj_multiboss_controller_enemy2)
                global.actsimulral[myself][2] = 1;
            with (obj_multiboss_controller_enemy3)
                global.actsimulral[myself][2] = 1;
            actcon = 1;
            actconral = 0;
        }
        else
        {
            if (simultotal == 1)
            {
                msgset(0, "* Ralsei made a slightly cringeworthy flatter!/%");
                scr_battletext_default();
            }
            else
            {
                msgset(0, "* Ralsei flatter!/%");
                scr_simultext("ralsei");
            }
            if (simulorderral == 0)
                actconral = 20;
            else
                actconral = 0;
        }
        obj_multiboss_controller.ralseiflattercount++;
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
