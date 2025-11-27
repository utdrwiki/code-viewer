if (_init == false)
{
    if (i_ex(obj_battlecontroller) && obj_battlecontroller.rabbickvar == myself && global.flag[global.monstertype[myself] + 600] >= 1 && global.encounterno == 131)
        amirabbick = true;
    _init = true;
}
if (global.monster[myself] == 1)
{
    if (scr_isphase("enemytalk") && talked == 0)
    {
        scr_randomtarget();
        myattackchoice = choose(0, 1);
        if (blown && amirabbick)
            myattackchoice = 2;
        CroakOnX = false;
        presscount = 0;
        presstimer = 0;
        startcroaktimer = false;
        blow_wait = 0;
        myattackpriority = 1;
        if (myattackchoice == 2)
            myattackpriority = 50;
        scr_attackpriority(myattackpriority - 1);
        if (!instance_exists(obj_darkener))
            instance_create(0, 0, obj_darkener);
        global.typer = 50;
        rr = choose(0, 1, 2, 3);
        if (amirabbick == false)
        {
            if (blown && irandom(100) < 10 && blownturn > 0)
            {
                if (rr == 0 || rr == 1)
                    msgsetloc(0, "A lost&and lost&and lost girl.", "obj_ribbick_enemy_slash_Step_0_gml_44_0");
                if (rr == 2 || rr == 3)
                    msgsetloc(0, "A crying&and crying&and crying boy.", "obj_ribbick_enemy_slash_Step_0_gml_45_0");
            }
            else if (blown)
            {
                blownturn++;
                if (rr == 0)
                    msgsetloc(0, "A messy and&unfocused girl.", "obj_ribbick_enemy_slash_Step_0_gml_50_0");
                if (rr == 1)
                    msgsetloc(0, "A rowdy and&dirty girl.", "obj_ribbick_enemy_slash_Step_0_gml_51_0");
                if (rr == 2)
                    msgsetloc(0, "A poorly&trimmed boy.", "obj_ribbick_enemy_slash_Step_0_gml_52_0");
                if (rr == 3)
                    msgsetloc(0, "A quiet and&smelly boy.", "obj_ribbick_enemy_slash_Step_0_gml_53_0");
            }
            else
            {
                if (rr == 0)
                    msgsetloc(0, "Guruuuu---", "obj_ribbick_enemy_slash_Step_0_gml_57_0");
                if (rr == 1)
                    msgsetloc(0, "Woof.", "obj_ribbick_enemy_slash_Step_0_gml_58_0");
                if (rr == 2)
                    msgsetloc(0, "Sizzy snuzz,&what's the buzz?", "obj_ribbick_enemy_slash_Step_0_gml_59_0");
                if (rr == 3)
                    msgsetloc(0, "Hip, hip", "obj_ribbick_enemy_slash_Step_0_gml_60_0");
            }
        }
        else if (blown)
        {
            if (rr == 0)
                msgsetloc(0, "A sweet and&fresh girl.", "obj_ribbick_enemy_slash_Step_0_gml_67_0");
            if (rr == 1)
                msgsetloc(0, "A nice and&tidy girl.", "obj_ribbick_enemy_slash_Step_0_gml_68_0");
            if (rr == 2)
                msgsetloc(0, "A soft and&clean boy.", "obj_ribbick_enemy_slash_Step_0_gml_69_0");
            if (rr == 3)
                msgsetloc(0, "A refreshing&boy.", "obj_ribbick_enemy_slash_Step_0_gml_70_0");
        }
        else
        {
            rr = choose(0, 1, 2, 3, 4);
            if (rr == 0)
                msgsetloc(0, "Duruuuu---", "obj_ribbick_enemy_slash_Step_0_gml_75_0");
            if (rr == 1)
                msgsetloc(0, "Meow.", "obj_ribbick_enemy_slash_Step_0_gml_76_0");
            if (rr == 2)
                msgsetloc(0, "Snitter snatter,&what's the matter", "obj_ribbick_enemy_slash_Step_0_gml_77_0");
            if (rr == 3)
                msgsetloc(0, "Hop, hop", "obj_ribbick_enemy_slash_Step_0_gml_78_0");
            if (rr == 4)
                msgsetloc(0, "Bunnies are the&sequel to frogs.", "obj_ribbick_enemy_slash_Step_0_gml_79_0");
        }
        scr_enemyblcon(x - 10, y + 60, 10);
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
            scr_turntimer(200);
        }
    }
    if (scr_isphase("bullets") && attacked == 0)
    {
        rtimer += 1;
        if (rtimer == 12)
        {
            if (i_ex(obj_volumeup))
                myattackchoice = 1;
            if (myattackchoice == 0)
            {
                global.monsterattackname[myself] = "RibbickJump";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 108.5;
            }
            else if (myattackchoice == 1)
            {
                global.monsterattackname[myself] = "RibbickFly";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 109.5;
            }
            else if (myattackchoice == 2)
            {
                global.monsterattackname[myself] = "RabbickBounce";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 111.5;
            }
            scr_turntimer(140);
            attackanim = true;
            turns += 1;
            noballoon = false;
            bet = false;
            fixedbet = false;
            cheat = false;
            global.typer = 6;
            global.fc = 0;
            rr = choose(0, 1, 2, 3, 4);
            if (amirabbick == false)
            {
                if (scr_messagepriority(random(2)))
                {
                    if (rr == 0)
                        global.battlemsg[0] = stringsetloc("* Ribbick wants to be friends with a dancing trash can.", "obj_ribbick_enemy_slash_Step_0_gml_155_0");
                    if (rr == 1)
                        global.battlemsg[0] = stringsetloc("* The battlefield is filled with the smell of pungent mustard.", "obj_ribbick_enemy_slash_Step_0_gml_156_0");
                    if (rr == 2)
                        global.battlemsg[0] = stringsetloc("* Ribbick enriches the back stage floor with nutrients.", "obj_ribbick_enemy_slash_Step_0_gml_157_0");
                    if (rr == 3)
                        global.battlemsg[0] = stringsetloc("* Ribbick emits a groany must.", "obj_ribbick_enemy_slash_Step_0_gml_158_0");
                }
                if (global.monsterhp[myself] <= (global.monstermaxhp[myself] / 3) && scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Ribbick's getting dangerously clean.", "obj_ribbick_enemy_slash_Step_0_gml_160_0");
                if (global.mercymod[myself] >= global.mercymax[myself] && scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Ribbick is dirtier than ever, but that's fine.", "obj_ribbick_enemy_slash_Step_0_gml_161_0");
            }
            else
            {
                if (scr_messagepriority(random(2)))
                {
                    if (rr == 0)
                        global.battlemsg[0] = stringsetloc("* Rabbick is looking for a couch to get stuck under.", "obj_ribbick_enemy_slash_Step_0_gml_177_0");
                    if (rr == 1)
                        global.battlemsg[0] = stringsetloc("* The battlefield is filled with the smell of dusty mustard.", "obj_ribbick_enemy_slash_Step_0_gml_178_0");
                    if (rr == 2)
                        global.battlemsg[0] = stringsetloc("* Rabbick ambiently damages the soil.", "obj_ribbick_enemy_slash_Step_0_gml_179_0");
                    if (rr == 3)
                        global.battlemsg[0] = stringsetloc("* Rabbick emits a musty groan.", "obj_ribbick_enemy_slash_Step_0_gml_180_0");
                }
                if (global.monsterhp[myself] <= (global.monstermaxhp[myself] / 3) && scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Rabbick is starting to look wispy.", "obj_ribbick_enemy_slash_Step_0_gml_182_0");
                if (global.mercymod[myself] >= global.mercymax[myself] && scr_messagepriority(100 + random(2)))
                    global.battlemsg[0] = stringsetloc("* Rabbick is now nice and clean. ", "obj_ribbick_enemy_slash_Step_0_gml_183_0");
            }
            attacked = 1;
        }
    }
    if (global.mnfight == 2 && global.turntimer > 1)
    {
        if (revealed == true && justrevealedtoberabbick == false)
        {
            justrevealedtoberabbick = true;
            global.battlemsg[0] = stringsetloc("* Underneath the dust, it was really Rabbick!", "obj_ribbick_enemy_slash_Step_0_gml_172_0");
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
        if (amirabbick)
            msgsetloc(0, "* RABBICK - This dusty bunny needs a bit of spring cleaning./%", "obj_ribbick_enemy_slash_Step_0_gml_213_0");
        else
            msgsetloc(0, "* RIBBICK - This dusty frog needs a bit of an autumn dirtying./%", "obj_ribbick_enemy_slash_Step_0_gml_198_0");
        scr_battletext_default();
    }
    if (acting == 2 && actcon == 0)
        acting = 100;
    if (acting == 3 && actcon == 0)
    {
        CroakOnX = true;
        acting = 100;
    }
    if (acting == 100)
    {
        msgsetsubloc(0, "* Press ~1 repeatedly with good timing!", scr_get_input_name(6), "obj_ribbick_enemy_slash_Step_0_gml_208_0");
        scr_battletext_default();
        acting = 101;
        clocktimer = 11;
    }
    if (acting == 101)
    {
        if (blowamt > 0 && blowanimtimer <= 0)
            blowamt--;
        if (button3_p() == 1)
            presscount++;
        if (button3_p() == 1 && clocktimer >= 10 && presscount < 4)
        {
            clocktimer = 0;
            snd_stop(snd_whistlebreath);
            snd_play_x(snd_whistlebreath, 1, 1 + (blowamt / 100));
            onoff = 0;
            shakeamt = 5;
            blowamt += 18;
            blowbuffer = 2;
            blowanimtimer = 20;
            blow_wait = 1;
            if (CroakOnX == true)
            {
                with (obj_ribbick_enemy)
                {
                    blowanimtimer = 20;
                    shakeamt = 5;
                    onoff = 0;
                    repeat (6)
                        event_user(2);
                }
            }
            else
            {
                repeat (6)
                    event_user(2);
            }
        }
        presstimer++;
        if (presstimer == 30)
        {
            presstimer = 0;
            presscount = 0;
        }
        if (blow_wait == 1)
            blowtimer += 1.58;
        if (blowtimer > 100)
            blowtimer = 100;
        if (blowtimer == 100 || blowamt >= 100)
            acting = 102;
        if (blowamt >= 0)
            croakonsuccess = true;
    }
    if (acting == 102)
    {
        with (obj_writer)
            instance_destroy();
        if (blowamt > 100)
            blowamt = 100;
        blownaway = 0;
        var sparecount = 0;
        for (var i = 0; i < instance_number(obj_ribbick_enemy); i++)
        {
            enemy[i] = instance_find(obj_ribbick_enemy, i);
            if (global.mercymod[enemy[i].myself] >= 100)
                sparecount++;
        }
        if (CroakOnX == true)
        {
            with (obj_ribbick_enemy)
            {
                if (global.mercymod[myself] >= 100 && id != other.id)
                {
                    event_user(10);
                    other.blownaway = true;
                }
            }
        }
        if (global.mercymod[myself] >= 100)
        {
            sparedsprite = spr_ribbick_small;
            if (amirabbick)
                sparedsprite = spr_rabbick_enemy_spared;
            image_alpha = 0;
            scr_spareanim();
            blownaway = 1;
        }
        if (scr_monsterpop() == 0)
        {
            acting = 0;
            actcon = 1;
            extimer = 0;
        }
        else
        {
            if (CroakOnX == true)
            {
                with (obj_ribbick_enemy)
                {
                    if (sparedsprite == spr_ribbick_spare)
                    {
                        var _blowamt = round(other.blowamt * 0.64);
                        if (_blowamt > 100)
                            _blowamt = 100;
                        scr_mercyadd(myself, _blowamt);
                    }
                }
            }
            else if (sparedsprite == spr_ribbick_spare)
            {
                var _blowamt = round(other.blowamt * 0.64);
                if (_blowamt > 100)
                    _blowamt = 100;
                scr_mercyadd(myself, _blowamt);
            }
            if (croakonsuccess == true)
            {
                var rabbick_name = stringsetloc("Rabbick", "obj_ribbick_enemy_slash_Step_0_gml_291_0");
                if (CroakOnX == true)
                {
                    with (obj_ribbick_enemy)
                    {
                        if (global.mercymod[myself] >= 100)
                        {
                            if (amirabbick == true)
                            {
                                event_user(1);
                                sparedsprite = spr_rabbick_enemy_spared;
                                global.monstername[myself] = rabbick_name;
                            }
                            if (amirabbick == false)
                            {
                                sparedsprite = spr_ribbick_small;
                                hurtsprite = spr_ribbick_small_hurt;
                            }
                            blown = 1;
                        }
                    }
                }
                else if (global.mercymod[myself] >= 100)
                {
                    if (amirabbick == true)
                    {
                        event_user(1);
                        sparedsprite = spr_rabbick_enemy_spared;
                        global.monstername[myself] = rabbick_name;
                    }
                    if (amirabbick == false)
                    {
                        sparedsprite = spr_ribbick_small;
                        hurtsprite = spr_ribbick_small_hurt;
                    }
                    blown = 1;
                }
                repeat (15)
                    event_user(2);
            }
            acting = 103;
        }
        with (obj_ribbick_enemy)
        {
            blowing = 0;
            blowanimtimer = 0;
            blowtimer = 0;
        }
    }
    if (acting == 103 && !i_ex(obj_writer))
    {
        extimer++;
        if (extimer == 30)
        {
            if (blownaway)
                msgsetloc(0, "* The enemy was blown away!/%", "obj_ribbick_enemy_slash_Step_0_gml_340_0");
            else if (global.mercymod[myself] >= 100 && amirabbick == true)
                msgsetloc(0, "* What the!? It was an imposter!/%", "obj_ribbick_enemy_slash_Step_0_gml_343_0");
            else if (global.mercymod[myself] >= 100)
                msgsetloc(0, "* It revealed its dirtier self!/%", "obj_ribbick_enemy_slash_Step_0_gml_344_0");
            else if (blowamt == 0)
                msgsetloc(0, "* Nothing happened!/%", "obj_ribbick_enemy_slash_Step_0_gml_345_0");
            else
                msgsetloc(0, "* It became even dirtier!/%", "obj_ribbick_enemy_slash_Step_0_gml_346_0");
            scr_battletext_default();
            acting = 0;
            actcon = 1;
            extimer = 0;
            with (obj_ribbick_enemy)
                blowamt = 0;
        }
    }
    if (actingsus == 1 && actconsus == 1)
    {
        scr_mercyadd(myself, 50);
        if (simultotal == 1)
        {
            msgsetloc(0, "* Susie dirties the enemy further! It seemed to like it!/%", "obj_ribbick_enemy_slash_Step_0_gml_364_0");
            scr_battletext_default();
            actconsus = 20;
        }
        else
        {
            var rand = choose(0, 1, 2);
            if (rand == 0)
                msgsetloc(0, "* Susie generates filth!", "obj_ribbick_enemy_slash_Step_0_gml_371_0");
            if (rand == 1)
                msgsetloc(0, "* Susie shows gum from her shoe!!", "obj_ribbick_enemy_slash_Step_0_gml_372_0");
            if (rand == 2)
                msgsetloc(0, "* Susie says dirty words!", "obj_ribbick_enemy_slash_Step_0_gml_373_0");
            scr_simultext("susie");
            if (simulordersus == 0)
                actconsus = 20;
            else
                actconsus = 0;
        }
        actingsus = 0;
    }
    if (actingral == 1 && actconral == 1)
    {
        extimer++;
        if (extimer == 1)
            scr_mercyadd(myself, 25);
        if (extimer == 2)
        {
            if (simultotal == 1)
            {
                msgsetloc(0, "* Ralsei tried to clean the enemy! It became TIRED.../%", "obj_ribbick_enemy_slash_Step_0_gml_391_0");
                scr_battletext_default();
                actconral = 20;
            }
            else
            {
                var rand = choose(0, 1, 2);
                if (rand == 0)
                    msgsetloc(0, "* Ralsei tries tidying up!", "obj_ribbick_enemy_slash_Step_0_gml_398_0");
                if (rand == 1)
                    msgsetloc(0, "* Ralsei uses a feather duster!", "obj_ribbick_enemy_slash_Step_0_gml_399_0");
                if (rand == 2)
                    msgsetloc(0, "* Ralsei croaks sympathetically!", "obj_ribbick_enemy_slash_Step_0_gml_400_0");
                scr_simultext("ralsei");
                if (simulorderral == 0)
                    actconral = 20;
                else
                    actconral = 0;
            }
            if (global.monsterstatus[myself] != 1)
                scr_monster_make_tired(myself);
            actingral = 0;
            extimer = 0;
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
        if (blownaway == 1)
        {
            blownaway = 0;
            scr_recruit();
            scr_monsterdefeat();
            instance_destroy();
        }
        scr_nextact();
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
