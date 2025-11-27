if (setnewtext == true)
{
    rr = choose(0, 1, 2, 3);
    exspace = 0;
    if (rr == 0)
    {
        text = stringsetloc("Halo, goodeye!        Halo, goodeye!", "obj_halo_enemy_slash_Step_0_gml_6_0");
        if (global.lang == "ja")
            exspace = 1;
    }
    if (rr == 1)
        text = stringsetloc("Halo, are you listening?            ", "obj_halo_enemy_slash_Step_0_gml_7_0");
    if (rr == 2)
        text = stringsetloc("You oppose the revolution?          ", "obj_halo_enemy_slash_Step_0_gml_8_0");
    if (rr == 3)
        text = stringsetloc("Open your eyes        Open your eyes", "obj_halo_enemy_slash_Step_0_gml_9_0");
    if (global.mercymod[myself] >= 100)
    {
        if (rr == 0 || rr == 1)
            text = stringsetloc("Viva la revolution!  Viva la revolution!", "obj_halo_enemy_slash_Step_0_gml_13_0");
        if (rr == 2 || rr == 3)
            text = stringsetloc("To spin, is to trust", "obj_halo_enemy_slash_Step_0_gml_14_0");
    }
    textlength = string_length(text);
    setnewtext = false;
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
        setnewtext = true;
        talked = 1;
        talktimer = 0;
        rtimer = 0;
    }
    if (talked == 1 && scr_isphase("enemytalk"))
        scr_blconskip(15);
    if (global.mnfight == 1.5)
    {
        arctexttimer++;
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
                global.monsterattackname[myself] = "HoopAttack";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 102;
            }
            else if (myattackchoice == 1)
            {
                global.monsterattackname[myself] = "VVVVVattack";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 103;
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
                    global.battlemsg[0] = stringsetloc("* Winglade molts and revolts.", "obj_halo_enemy_slash_Step_0_gml_114_0");
                if (rr == 1)
                    global.battlemsg[0] = stringsetloc("* Winglade watches distrustfully.", "obj_halo_enemy_slash_Step_0_gml_115_0");
                if (rr == 2)
                    global.battlemsg[0] = stringsetloc("* Winglade draws flowers with its blade.", "obj_halo_enemy_slash_Step_0_gml_116_0");
                if (rr == 3)
                    global.battlemsg[0] = stringsetloc("* Winglade rotates aggressively.", "obj_halo_enemy_slash_Step_0_gml_117_0");
                if (irandom(100) < 3)
                    global.battlemsg[0] = stringsetloc("* Smells like old down pillow.", "obj_halo_enemy_slash_Step_0_gml_118_0");
            }
            if (global.monsterhp[myself] <= (global.monstermaxhp[myself] / 3))
            {
                if (scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Winglade sheds feathers heavily.", "obj_halo_enemy_slash_Step_0_gml_123_0");
            }
            if (global.mercymod[myself] >= 100)
            {
                if (scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Winglade flutters trustfully.", "obj_halo_enemy_slash_Step_0_gml_128_0");
            }
            if (global.monsterstatus[myself] == 1)
            {
                if (scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Winglade's eye flutters shut.", "obj_halo_enemy_slash_Step_0_gml_133_0");
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
        msgsetloc(0, "* WINGLADE - A radical blade with feathers at the hilt./%", "obj_halo_enemy_slash_Step_0_gml_155_0");
        scr_battletext_default();
    }
    if (acting == 2 && actcon == 0)
    {
        actcon = 1;
        scr_battle_sprite_set("kris", spr_krisb_pirouette, 1, true);
        snd_stop(snd_pirouette);
        snd_play_x(snd_pirouette, 0.7, 1.1);
        if (global.flag[241] > 5)
        {
            msgsetloc(0, "* You spun masterfully!/%", "obj_halo_enemy_slash_Step_0_gml_168_0");
            for (var i = 0; i < instance_number(obj_monsterparent); i += 1)
            {
                enemy[i] = instance_find(obj_monsterparent, i);
                if (enemy[i].myself == myself)
                {
                    with (enemy[i])
                        scr_mercyadd(myself, 50);
                }
                else
                {
                    with (enemy[i])
                        scr_mercyadd(myself, 10);
                }
            }
        }
        else
        {
            msgsetloc(0, "* You spun hypnotically!/%", "obj_halo_enemy_slash_Step_0_gml_183_0");
            for (var i = 0; i < instance_number(obj_monsterparent); i += 1)
            {
                enemy[i] = instance_find(obj_monsterparent, i);
                if (enemy[i].myself == myself)
                {
                    with (enemy[i])
                        scr_mercyadd(myself, 50);
                }
                else
                {
                    with (enemy[i])
                        scr_mercyadd(myself, 10);
                }
            }
        }
        scr_battletext_default();
    }
    if (acting == 3 && actcon == 0)
    {
        actcon = 1;
        scr_battle_sprite_set("kris", spr_krisb_pirouette, 1, true);
        scr_battle_sprite_set("susie", spr_susie_pirouette, 1, true);
        snd_stop(snd_pirouette);
        snd_play_x(snd_pirouette, 0.7, 1.1);
        if (global.flag[241] > 5)
        {
            msgsetloc(0, "* You and Susie spun masterfully!/%", "obj_halo_enemy_slash_Step_0_gml_209_0");
            with (obj_monsterparent)
                scr_mercyadd(myself, 60);
        }
        else
        {
            msgsetloc(0, "* You and Susie spun hypnotically!/%", "obj_halo_enemy_slash_Step_0_gml_214_0");
            with (obj_monsterparent)
                scr_mercyadd(myself, 60);
        }
        scr_battletext_default();
    }
    if (acting == 4 && actcon == 0)
    {
        acting = 300;
        scr_battle_sprite_set("kris", spr_krisb_pirouette, 1, true);
        scr_battle_sprite_set("susie", spr_susie_pirouette, 1, true);
        scr_battle_sprite_set("ralsei", spr_ralsei_pirouette, 1, true);
        msgsetloc(0, "* Everyone spun masterfully!&* It's a whirlwind...!/%", "obj_halo_enemy_slash_Step_0_gml_228_0");
        snd_stop(snd_pirouette);
        snd_play_x(snd_pirouette, 0.7, 1.1);
        scr_battletext_default();
        var _whirl = instance_create_depth(obj_herokris.x, obj_herokris.y, depth - 10, obj_halo_whirl);
        _whirl.parent = id;
    }
    if (acting == 301 && actcon == 0)
    {
        with (obj_monsterparent)
            scr_spare(myself);
        actcon = 1;
    }
    if (actingsus == 1 && actconsus == 1)
    {
        snd_stop(snd_pirouette);
        snd_play_x(snd_pirouette, 0.7, 1.1);
        scr_battle_sprite_set("susie", spr_susie_pirouette, 1, true);
        msgsetloc(0, "* Susie wobbles like a top!/%", "obj_halo_enemy_slash_Step_0_gml_249_0");
        scr_simultext("susie");
        if (simulordersus == 0)
            actconsus = 20;
        else
            actconsus = 0;
        scr_mercyadd(myself, 40);
    }
    if (actingral == 1 && actconral == 1)
    {
        snd_stop(snd_pirouette);
        snd_play_x(snd_pirouette, 0.7, 1.1);
        scr_battle_sprite_set("ralsei", spr_ralsei_pirouette, 1, true);
        msgsetloc(0, "* Ralsei rotates like a gyro!/%", "obj_halo_enemy_slash_Step_0_gml_263_0");
        scr_simultext("ralsei");
        if (simulorderral == 0)
            actconral = 20;
        else
            actconral = 0;
        for (var i = 0; i < instance_number(obj_monsterparent); i += 1)
        {
            enemy[i] = instance_find(obj_monsterparent, i);
            if (enemy[i].myself == myself)
            {
                with (enemy[i])
                    scr_mercyadd(myself, 50);
            }
            else
            {
                with (enemy[i])
                    scr_mercyadd(myself, 10);
            }
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
    {
        scr_nextact();
        if (acting == 0 && actingsus == 0 && actingral == 0)
        {
            scr_battle_sprite_reset("kris");
            scr_battle_sprite_reset("susie");
            scr_battle_sprite_reset("ralsei");
        }
    }
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
