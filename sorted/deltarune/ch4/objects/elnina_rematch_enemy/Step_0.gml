if (global.monster[myself] == 1)
{
    if (scr_isphase("enemytalk") && talked == 0 && obj_elnina_lanino_rematch_controller.talked == 1)
    {
        scr_randomtarget();
        talked = 1;
        talktimer = 0;
        rtimer = 0;
    }
    if (talked == 1 && scr_isphase("enemytalk"))
        scr_blconskip(15);
}
if (global.mnfight == 2 && global.turntimer <= 1)
{
    umbrella = 0;
    warmhat = 0;
}
if (global.myfight == 3)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    if (acting == 1 && actcon == 0)
    {
        actcon = 1;
        msgsetloc(0, "* ELNINA - She's just over the moon for Lanino./%", "obj_elnina_rematch_enemy_slash_Step_0_gml_45_0");
        scr_battletext_default();
    }
    if (acting == 2 && actcon == 0)
    {
        umbrella_count++;
        umbrella = 1;
        blocker = instance_create(x, y, obj_elnina_umbrella);
        if (global.mercymod[myself] < 90)
            blocker.sprite_index = spr_ch3_elnina_umbrella;
        if (umbrella_count == 1)
        {
            msgsetloc(0, "* You looked at the sky and took...&* An umbrella!/%", "obj_elnina_rematch_enemy_slash_Step_0_gml_59_0");
            msgnextloc("* Blocking rain shows your care for the weather report!/%", "obj_elnina_rematch_enemy_slash_Step_0_gml_60_0");
            scr_battletext_default();
            actcon = 1;
            global.actsimul[myself][1] = 1;
            scr_spellmenu_setup();
        }
        else
        {
            msgsetloc(0, "* Took an umbrella to block rain!", "obj_elnina_rematch_enemy_slash_Step_0_gml_69_0");
            scr_simultext("kris");
            if (simulorderkri == 0)
                actcon = 20;
            else
                actcon = -1;
        }
    }
    if (acting == 3 && actcon == 0)
    {
        warmhat_count++;
        warmhat = 1;
        blocker = instance_create(x, y, obj_elnina_umbrella);
        if (global.mercymod[myself] < 90)
            blocker.sprite_index = spr_ch3_elnina_warmhat;
        var _text = stringsetloc("* Susie dreamed of sunny days!", "obj_elnina_rematch_enemy_slash_Step_0_gml_83_0");
        if (warmhat_count == 1)
        {
            msgsetloc(0, "* You looked at the sky and took...&* A warm hat!/%", "obj_elnina_rematch_enemy_slash_Step_0_gml_87_0");
            msgnextloc("* Blocking snow shows your care for the weather report!/%", "obj_elnina_rematch_enemy_slash_Step_0_gml_88_0");
            scr_battletext_default();
            actcon = 1;
            global.actsimul[myself][2] = 1;
            scr_spellmenu_setup();
        }
        else
        {
            msgsetloc(0, "* Took a warm hat to block snow!", "obj_elnina_rematch_enemy_slash_Step_0_gml_97_0");
            scr_simultext("kris");
            if (simulorderkri == 0)
                actcon = 20;
            else
                actcon = -1;
        }
    }
    if (actingsus == 1 && actconsus == 1)
    {
        if (simulordersus == 0)
            actconsus = 20;
        else
            actconsus = 0;
        var _mercy = 8;
        if ((global.mercymod[myself] + 8) > 90)
            _mercy = 90 - global.mercymod[myself];
        if (_mercy < 0)
            _mercy = 0;
        scr_mercyadd(myself, _mercy);
        scr_mercyadd(obj_lanino_rematch_enemy.myself, _mercy);
        var _text = stringsetloc("* Susie dreamed of sunny days!", "obj_elnina_rematch_enemy_slash_Step_0_gml_115_0");
        if (simultotal == 1)
        {
            msgset(0, _text);
            scr_battletext_default();
            actconsus = 20;
        }
        else
        {
            msgset(0, _text);
            scr_simultext("susie");
            if (simulordersus == 0)
                actconsus = 20;
            else
                actconsus = 0;
        }
    }
    if (actingral == 1 && actconral == 1)
    {
        var _mercy = 8;
        if ((global.mercymod[myself] + 8) > 90)
            _mercy = 90 - global.mercymod[myself];
        if (_mercy < 0)
            _mercy = 0;
        scr_mercyadd(myself, _mercy);
        scr_mercyadd(obj_lanino_rematch_enemy.myself, _mercy);
        var _text2 = stringsetloc("* Ralsei hoped for starry nights!", "obj_elnina_rematch_enemy_slash_Step_0_gml_142_0");
        if (simultotal == 1)
        {
            msgset(0, _text2);
            scr_battletext_default();
            actconral = 20;
        }
        else
        {
            msgset(0, _text2);
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
    hurttimer -= 1;
    if (hurttimer < 0)
    {
        state = 0;
    }
    else
    {
        if (global.monster[myself] == 0)
        {
            global.flag[51] = 1;
            global.flag[52] = 1;
            with (obj_lanino_rematch_enemy)
                scr_monsterdefeat();
        }
        hurtshake += 1;
        if (hurtshake > 1)
        {
            if (shakex > 0)
                shakex -= 1;
            if (shakex < 0)
                shakex += 1;
            shakex = -shakex;
            hurtshake = 0;
        }
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
