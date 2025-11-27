if (global.monster[myself] == 1)
{
    if (scr_isphase("enemytalk") && talked == 0 && i_ex(obj_elnina_lanino_rematch_controller) && obj_elnina_lanino_rematch_controller.talked == 1)
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
    telescope = 0;
    sunglasses = 0;
}
if (global.myfight == 3)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    if (acting == 1 && actcon == 0)
    {
        actcon = 1;
        msgsetloc(0, "* Lanino - The sight of Elnina makes him want to be singin' in the rain./%", "obj_lanino_rematch_enemy_slash_Step_0_gml_39_0");
        scr_battletext_default();
    }
    if (acting == 2 && actcon == 0)
    {
        telescope_count++;
        telescope = 1;
        blocker = instance_create(x, y, obj_elnina_umbrella);
        if (global.mercymod[myself] < 90)
            blocker.sprite_index = spr_ch3_elnina_telescope;
        if (telescope_count == 1)
        {
            msgsetloc(0, "* You looked at the sky and took...&* A telescope!/%", "obj_lanino_rematch_enemy_slash_Step_0_gml_53_0");
            msgnextloc("* Blocking moons shows your care for the weather report!/%", "obj_lanino_rematch_enemy_slash_Step_0_gml_54_0");
            scr_battletext_default();
            actcon = 1;
        }
        else
        {
            msgsetloc(0, "* Took a telescope to block moons!/%", "obj_lanino_rematch_enemy_slash_Step_0_gml_63_0");
            scr_battletext_default();
            actcon = 1;
        }
    }
    if (acting == 3 && actcon == 0)
    {
        sunglasses_count++;
        sunglasses = 1;
        blocker = instance_create(x, y, obj_elnina_umbrella);
        if (global.mercymod[myself] < 90)
            blocker.sprite_index = spr_ch3_elnina_sunglasses;
        if (sunglasses_count == 1)
        {
            msgsetloc(0, "* You looked at the sky and took...&* Sunglasses!/%", "obj_lanino_rematch_enemy_slash_Step_0_gml_83_0");
            msgnextloc("* Blocking suns shows your care for the weather report!/%", "obj_lanino_rematch_enemy_slash_Step_0_gml_84_0");
            scr_battletext_default();
            actcon = 1;
            global.actsimul[myself][2] = 1;
            scr_spellmenu_setup();
        }
        else
        {
            msgsetloc(0, "* Took sunglasses to block suns!", "obj_lanino_rematch_enemy_slash_Step_0_gml_93_0");
            scr_simultext("kris");
            if (simulorderkri == 0)
                actcon = 20;
            else
                actcon = -1;
        }
    }
    if (actingsus == 1 && actconsus == 1)
    {
        var _text = stringsetloc("* Susie dreamed of sunny days!", "obj_lanino_rematch_enemy_slash_Step_0_gml_102_0");
        if (simultotal == 1)
        {
            msgset(0, _text + "/%");
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
        var _mercy = 8;
        if ((global.mercymod[myself] + 8) > 90)
            _mercy = 90 - global.mercymod[myself];
        if (_mercy < 0)
            _mercy = 0;
        scr_mercyadd(myself, _mercy);
        scr_mercyadd(obj_elnina_rematch_enemy.myself, _mercy);
    }
    if (actingral == 1 && actconral == 1)
    {
        var _text2 = stringsetloc("* Ralsei hoped for starry nights!", "obj_lanino_rematch_enemy_slash_Step_0_gml_128_0");
        if (simultotal == 1)
        {
            msgset(0, _text2 + "/%");
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
        var _mercy = 8;
        if ((global.mercymod[myself] + 8) > 90)
            _mercy = 90 - global.mercymod[myself];
        if (_mercy < 0)
            _mercy = 0;
        scr_mercyadd(myself, _mercy);
        scr_mercyadd(obj_elnina_rematch_enemy.myself, _mercy);
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
            with (obj_elnina_rematch_enemy)
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
