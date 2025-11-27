if (!i_ex(obj_herosusie) || !i_ex(obj_heroralsei))
{
    if (debugvar == false && scr_debug())
    {
        scr_debug_print("You need Susie and Ralsei for this battle");
        debugvar = true;
    }
    exit;
}
if (global.monsterhp[myself] <= (global.monstermaxhp[myself] * 0.8))
    global.tempflag[96] = 1;
if (scr_debug() && keyboard_check_pressed(vk_backspace))
    global.monsterhp[myself] -= 3000;
if (holdbreathcount > 0 && i_ex(obj_heart))
    obj_heart.wspeed = 5;
if (holdbreathcount > 0 && i_ex(obj_knight_roaring2) && i_ex(obj_heart))
    obj_heart.wspeed = 6;
damagereductiontimer++;
if (damagereductiontimer == 1)
{
    if (phaseturn == 1 && phase == 1)
    {
        phaseturn = 1;
        myattackchoice = 2;
        difficulty = 0;
    }
    damagereduction = 0.2;
    global.monstername[myself] = stringsetloc("Knight", "obj_knight_enemy_slash_Step_0_gml_23_0");
    if (scr_debug())
        scr_debug_print("damage reduction set to 0.8");
    blocking = 0;
    hurtsprite = spr_roaringknight_hurt;
}
if (scr_debug())
    overrideAttack = scr_attack_override(overrideAttack, 10, "The Roaring Knight", true);
if (blockanim == 1)
{
    snd_stop(snd_bell);
    snd_play(snd_bell);
    idlesprite = spr_roaringknight_block_ol;
    whiteflash = 2;
    blockanim = 2;
    blocktimer = 0;
    shakex = 5;
    state = 3;
    hurttimer = 30;
}
if (blockanim == 2)
{
    blocktimer++;
    if (blocktimer == 1)
    {
        anim = instance_create(x + 14, y + 40, obj_block_vfx);
        anim.sprite_index = spr_roaringknight_block_vfx;
        anim.image_xscale = 1.3;
        anim.image_yscale = 1.3;
        anim.vspeed = -8;
        anim.gravity_direction = 0;
        anim.gravity = 1;
        anim.image_speed = 0.5;
        anim = instance_create(x + 14, y + 40, obj_block_vfx);
        anim.sprite_index = spr_roaringknight_block_vfx;
        anim.image_xscale = 1.3;
        anim.image_yscale = 1.3;
        anim.vspeed = 8;
        anim.gravity_direction = 0;
        anim.gravity = 2;
        anim.image_speed = 0.5;
    }
    if (blocktimer == 3 || blocktimer == 6)
    {
        anim = instance_create(x + 14, y + 40, obj_block_vfx);
        anim.sprite_index = spr_roaringknight_block_vfx;
        anim.image_xscale = 1.3;
        anim.image_yscale = 1.3;
        anim.vspeed = choose(-8, 8);
        anim.gravity_direction = 0;
        anim.gravity = 2;
        anim.image_speed = 0.5;
    }
    if (blocktimer == 15)
    {
        blocktimer = 0;
        blockanim = 0;
        idlesprite = spr_roaringknight_idle;
    }
}
if (global.monster[myself] == 1)
{
    if (scr_isphase("enemytalk") && talked == 0 && end_cutscene_version == 0)
    {
        scr_randomtarget();
        if (!instance_exists(obj_darkener))
            instance_create(0, 0, obj_darkener);
        global.fc = 22;
        global.typer = 81;
        var createballoon = false;
        susietalks = 1;
        if (global.hp[2] > 0)
        {
            balloonturn++;
            if (balloonturn == 6)
            {
                msgsetloc(0, "Heheh.../%", "obj_knight_enemy_slash_Step_0_gml_146_0");
                ballooncon = 1;
                balloonend = 0;
                createballoon = true;
            }
            if (balloonturn == 7)
            {
                msgsetloc(0, "Thing is,&you actually.../%", "obj_knight_enemy_slash_Step_0_gml_147_0");
                ballooncon = 2;
                balloonend = 0;
                createballoon = true;
            }
            if (balloonturn == 8)
            {
                msgsetloc(0, "You? You're all&damn alone.../%", "obj_knight_enemy_slash_Step_0_gml_148_0");
                ballooncon = 3;
                balloonend = 0;
                createballoon = true;
            }
            if (balloonturn == 9)
            {
                msgsetloc(0, "Even... even if&you knock me down.../%", "obj_knight_enemy_slash_Step_0_gml_149_0");
                ballooncon = 4;
                balloonend = 0;
                createballoon = true;
            }
            if (balloonturn == 9 && global.hp[1] < 1 && global.hp[3] < 1)
            {
                msgsetloc(0, "Even... even if&you knock them down.../%", "obj_knight_enemy_slash_Step_0_gml_150_0");
                ballooncon = 5;
                balloonend = 0;
                createballoon = true;
            }
            if (balloonturn == 10)
            {
                msgsetloc(0, "As long as Kris has got&a hand to lift me up with.../%", "obj_knight_enemy_slash_Step_0_gml_151_0");
                ballooncon = 6;
                balloonend = 0;
                createballoon = true;
            }
            if (balloonturn == 10 && global.hp[1] < 1 && global.hp[3] < 1)
            {
                msgsetloc(0, "As long as I'm here to&lift them back up.../%", "obj_knight_enemy_slash_Step_0_gml_152_0");
                ballooncon = 6;
                balloonend = 0;
                createballoon = true;
            }
            if (balloonturn == 11)
            {
                msgsetloc(0, "So... give up./%", "obj_knight_enemy_slash_Step_0_gml_153_0");
                ballooncon = 0;
                balloonend = 1;
                createballoon = true;
            }
            if (balloonturn == 12)
            {
                msgsetloc(0, "You know you can't&win... so... give up!/%", "obj_knight_enemy_slash_Step_0_gml_154_0");
                ballooncon = 0;
                balloonend = 1;
                createballoon = true;
            }
            if (balloonturn == 13)
            {
                msgsetloc(0, "... You won't even.../%", "obj_knight_enemy_slash_Step_0_gml_155_0");
                ballooncon = 7;
                balloonend = 0;
                createballoon = true;
            }
            if (balloonturn == 14)
            {
                msgsetloc(0, "... heh... heheheh.../%", "obj_knight_enemy_slash_Step_0_gml_156_0");
                ballooncon = 8;
                balloonend = 0;
                createballoon = true;
            }
        }
        if (createballoon)
        {
            global.typer = 75;
            scr_enemyblcon(obj_herosusie.x + 92, obj_herosusie.y + 38, 14);
            scr_guardpeek(obj_herosusie);
            myblcon.depth = depth - 100;
        }
        ralseitalks = 0;
        susietalks = 0;
        if (createballoon == false)
        {
            global.mnfight = 1.5;
        }
        else if (ballooncon == 0)
        {
            talked = 0.5;
            talktimer = 0;
        }
        else
        {
            talked = 0.6;
            talktimer = 0;
        }
        rtimer = 0;
    }
    if (talked == 0.5)
    {
        talktimer++;
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            alarm[6] = 1;
        }
    }
    if (talked == 0.6)
    {
        talktimer++;
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            if (ballooncon == 1)
            {
                msgsetloc(0, "Didn't... think&we'd still be&standing, did you?/%", "obj_knight_enemy_slash_Step_0_gml_203_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 2)
            {
                msgsetloc(0, "You actually messed up,&picking a fight with US!/%", "obj_knight_enemy_slash_Step_0_gml_204_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 3)
            {
                msgsetloc(0, "Me? I got...&Kris and Ralsei&behind me./%", "obj_knight_enemy_slash_Step_0_gml_205_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 4)
            {
                msgsetloc(0, "As long as Kris,&Ralsei, are here.../%", "obj_knight_enemy_slash_Step_0_gml_206_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 5)
            {
                msgsetloc(0, "As long as&I'm here.../%", "obj_knight_enemy_slash_Step_0_gml_207_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 6)
            {
                msgsetloc(0, "Heh... you're never gonna&win, you hear me?!/%", "obj_knight_enemy_slash_Step_0_gml_208_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 7)
            {
                msgsetloc(0, "... say a thing, huh.../%", "obj_knight_enemy_slash_Step_0_gml_209_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 8)
            {
                msgsetloc(0, "Man, I'm done talking./%", "obj_knight_enemy_slash_Step_0_gml_210_0");
                ballooncon = 9;
                balloonend = 0;
            }
            else if (ballooncon == 9)
            {
                msgsetloc(0, "... people like you...&just piss me off./%", "obj_knight_enemy_slash_Step_0_gml_211_0");
                ballooncon = 0;
                balloonend = 1;
            }
            talked = 0.7;
            susietalks = 1;
            global.typer = 75;
            scr_enemyblcon(obj_herosusie.x + 92, obj_herosusie.y + 38, 14);
            scr_guardpeek(obj_herosusie);
            myblcon.depth = depth - 100;
            ralseitalks = 0;
            susietalks = 0;
            alarm[6] = 1;
        }
    }
    if (talked == 1 && scr_isphase("enemytalk") && !i_ex(obj_writer))
    {
        global.mnfight = 1.5;
        attackchosen = false;
    }
    if (global.mnfight == 1.5 && end_cutscene_version == 0)
    {
        if (!instance_exists(obj_growtangle))
        {
            event_user(0);
            setdownmessage = false;
            if (damagereduction >= 0.2 && damagereduction < 0.35)
                damagereduction += 0.01;
            if (myattackchoice == -1)
            {
            }
            else if (myattackchoice == 0)
            {
                instance_create((__view_get(e__VW.XView, 0) + 320) - 152, __view_get(e__VW.YView, 0) + 170, obj_growtangle);
            }
            else if (myattackchoice == 11)
            {
                instance_create(__view_get(e__VW.XView, 0) + 320, __view_get(e__VW.YView, 0) + 190, obj_growtangle);
            }
            else if (myattackchoice == 13)
            {
                instance_create(__view_get(e__VW.XView, 0) + 300, __view_get(e__VW.YView, 0) + 190, obj_growtangle);
            }
            else
            {
                instance_create(__view_get(e__VW.XView, 0) + 320, __view_get(e__VW.YView, 0) + 170, obj_growtangle);
            }
            if (myattackchoice == 0)
                obj_growtangle.maxxscale = 0.5;
            if (myattackchoice == 1)
            {
                obj_growtangle.maxxscale = 2.25;
                obj_growtangle.maxyscale = 1.75;
            }
            if (myattackchoice == 4)
            {
                obj_growtangle.maxxscale = 3.5;
                obj_growtangle.maxyscale = 3.5;
            }
            if (myattackchoice == 13)
                obj_growtangle.maxxscale = 3;
            if (myattackchoice == 15)
            {
            }
        }
        if (!instance_exists(obj_moveheart) && !i_ex(obj_heart) && myattackchoice != -1)
        {
            scr_moveheart();
            if (myattackchoice == 13)
            {
                with (obj_moveheart)
                {
                    distx = obj_growtangle.x - 40;
                    disty = obj_growtangle.y - 8;
                    dist = point_distance(x, y, distx, disty);
                    move_towards_point(distx, disty, dist / flytime);
                }
            }
        }
        global.mnfight = 2;
        scr_turntimer(90);
    }
    if (scr_isphase("bullets") && attacked == 0 && end_cutscene_version == 0)
    {
        rtimer += 1;
        if (rtimer == 12)
        {
            aoedamage = false;
            if (myattackchoice == 0)
            {
                global.monsterattackname[myself] = "Swordslash";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 109;
                dc.difficulty = difficulty;
                global.invc = 0.4;
            }
            else if (myattackchoice == 1)
            {
                global.monsterattackname[myself] = "Stars";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 98;
                dc.difficulty = difficulty;
                global.invc = 1;
            }
            else if (myattackchoice == 2)
            {
                global.monsterattackname[myself] = "Flurry";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 99;
                dc.difficulty = difficulty;
                global.invc = 0.4;
            }
            else if (myattackchoice == 3)
            {
                global.monsterattackname[myself] = "swordtunnel";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 102;
                global.invc = 0.4;
            }
            else if (myattackchoice == 4)
            {
                global.monsterattackname[myself] = "xattacks";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 103;
                global.invc = 0.4;
            }
            else if (myattackchoice == 5)
            {
                global.monsterattackname[myself] = "rotatingslash";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 104;
                dc.difficulty = difficulty;
                global.invc = 1;
            }
            else if (myattackchoice == 6)
            {
                global.monsterattackname[myself] = "underboxattack";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 106;
                global.invc = 0.4;
            }
            else if (myattackchoice == 7)
            {
                global.monsterattackname[myself] = "combinationattack";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 105;
                global.invc = 0.4;
            }
            else if (myattackchoice == 9)
            {
                global.monsterattackname[myself] = "roaring";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 107;
                global.invc = 1;
            }
            else if (myattackchoice == 10)
            {
                global.monsterattackname[myself] = "swords falling";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 108;
                dc.difficulty = difficulty;
                global.invc = 0.4;
            }
            else if (myattackchoice == 11)
            {
                global.monsterattackname[myself] = "tracking swords";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 151;
                dc.difficulty = 0;
                dc.damage = 206;
                global.invc = 0.4;
            }
            else if (myattackchoice == 12)
            {
                global.monsterattackname[myself] = "diagonal bullets";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 152;
                dc.difficulty = difficulty;
                global.invc = 0.4;
            }
            else if (myattackchoice == 13)
            {
                global.monsterattackname[myself] = "sword tunnel new";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 153;
                dc.difficulty = difficulty;
                dc.damage = 62;
                global.invc = 0.14;
            }
            else if (myattackchoice == 14)
            {
                global.monsterattackname[myself] = "tracking swords";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 151;
                dc.difficulty = 3;
                dc.damage = 206;
                global.invc = 0.4;
            }
            else if (myattackchoice == 15)
            {
                global.monsterattackname[myself] = "sword vortex";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 154;
                dc.difficulty = 3;
                dc.damage = 206;
                global.monsterattackname[myself] = "tracking swords";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 151;
                dc.difficulty = 0;
                dc.damage = 206;
                global.invc = 0.4;
            }
            else if (myattackchoice == 16)
            {
                global.monsterattackname[myself] = "rotatingslash";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 104;
                dc.difficulty = 0;
                global.monsterattackname[myself] = "tracking swords";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 151;
                dc.difficulty = 0;
                dc.damage = 206;
                global.invc = 0.4;
            }
            else if (myattackchoice == 17)
            {
                global.monsterattackname[myself] = "tracking swords";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 151;
                dc.difficulty = 2;
                dc.damage = 206;
                global.invc = 0.4;
            }
            if (myattackchoice == -1)
            {
                chargeupcon = 1;
            }
            else if (myattackchoice == 20)
            {
                global.monsterattackname[myself] = "knightlines";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 101;
            }
            if (myattackchoice == 7)
                scr_turntimer(270);
            else if (myattackchoice == 2)
                scr_turntimer(350);
            else if (myattackchoice == 0 && difficulty == 0)
                scr_turntimer(300);
            else if (myattackchoice == 0 && difficulty == 1)
                scr_turntimer(300);
            else if (myattackchoice == 11 && difficulty == 0)
                scr_turntimer(292);
            else if (myattackchoice == 11)
                scr_turntimer(300);
            else if (myattackchoice == 12)
                scr_turntimer(300);
            else if (myattackchoice == 13 && difficulty == 3)
                scr_turntimer(360);
            else if (myattackchoice == 13)
                scr_turntimer(330);
            else if (myattackchoice == 14)
                scr_turntimer(300);
            else if (myattackchoice == 15)
                scr_turntimer(300);
            else
                scr_turntimer(240);
            if (damagereductiontimer >= 750)
                global.monstername[myself] = stringsetloc("Knight", "obj_knight_enemy_slash_Step_0_gml_281_0");
            turns += 1;
            global.typer = 6;
            global.fc = 0;
            if (phase == 1)
            {
                if (phaseturn == 0)
                    global.battlemsg[0] = stringsetloc("* You felt lightheaded.&* You saw silver stars...", "obj_knight_enemy_slash_Step_0_gml_496_0");
                if (phaseturn == 1)
                    global.battlemsg[0] = stringsetloc("* You felt something hovering close behind your head...", "obj_knight_enemy_slash_Step_0_gml_521_0");
                if (phaseturn == 2)
                    global.battlemsg[0] = stringsetloc("* Suddenly, the north wind blew fiercely.", "obj_knight_enemy_slash_Step_0_gml_498_0");
                if (phaseturn == 3)
                    global.battlemsg[0] = stringsetloc("* Your vision narrows.", "obj_knight_enemy_slash_Step_0_gml_499_0");
                if (phaseturn == 4)
                    global.battlemsg[0] = stringsetloc("* Your chest feels tight.", "obj_knight_enemy_slash_Step_0_gml_500_0");
            }
            if (phase == 2)
            {
                if (phaseturn == 0)
                    global.battlemsg[0] = stringsetloc("* You felt lightheaded.&* You saw golden stars...", "obj_knight_enemy_slash_Step_0_gml_504_0");
                if (phaseturn == 1)
                    global.battlemsg[0] = stringsetloc("* Suddenly, the north and east winds blew fiercely.", "obj_knight_enemy_slash_Step_0_gml_505_0");
                if (phaseturn == 2)
                    global.battlemsg[0] = stringsetloc("* Your vision narrows.&* ... Your head is spinning.", "obj_knight_enemy_slash_Step_0_gml_506_0");
                if (phaseturn == 3)
                    global.battlemsg[0] = stringsetloc("* You feel surrounded.", "obj_knight_enemy_slash_Step_0_gml_531_0");
                if (phaseturn == 4)
                    global.battlemsg[0] = stringsetloc("* You felt your chest twisting.", "obj_knight_enemy_slash_Step_0_gml_508_0");
            }
            if (phase == 3)
            {
                if (phaseturn == 0)
                    global.battlemsg[0] = stringsetloc("* You felt lightheaded.&* You felt a migraine coming on...", "obj_knight_enemy_slash_Step_0_gml_514_0");
                if (phaseturn == 1)
                    global.battlemsg[0] = stringsetloc("* Suddenly, a tempest.", "obj_knight_enemy_slash_Step_0_gml_515_0");
                if (phaseturn == 2)
                    global.battlemsg[0] = stringsetloc("* Your vision narrows.&* ... The world revolves around you.", "obj_knight_enemy_slash_Step_0_gml_516_0");
                if (phaseturn == 3)
                    global.battlemsg[0] = stringsetloc("* You feel cornered.", "obj_knight_enemy_slash_Step_0_gml_541_0");
                if (phaseturn == 4)
                    global.battlemsg[0] = stringsetloc("* Your heartbeat becomes twisted.", "obj_knight_enemy_slash_Step_0_gml_518_0");
            }
            if (phase == 4 || haveusedroaring == true)
            {
                if (phase4turn == 2)
                    global.battlemsg[0] = stringsetloc("* The Knight's hands glow a strange color...", "obj_knight_enemy_slash_Step_0_gml_319_0");
                if (phase4turn > 2)
                    global.battlemsg[0] = stringsetloc("* The enemy suddenly let down its guard!", "obj_knight_enemy_slash_Step_0_gml_321_0");
                if (phase4turn == 3 && progamer == true)
                    global.battlemsg[0] = stringsetloc("* Kris coughed.&* The enemy slowly tilted its head...", "obj_knight_enemy_slash_Step_0_gml_322_0");
            }
            attacked = 1;
        }
    }
    if (global.mnfight == 2 && global.turntimer <= 1 && setdownmessage == false)
    {
        setdownmessage = true;
        if (global.monsterhp[myself] <= (global.monstermaxhp[myself] * 0.8) && haveusedroaring == false && phase != 4)
            phase = 4;
        if (phase == 4 && phase4turn < 3)
        {
            if (phase4turn == 0)
                global.battlemsg[0] = stringsetloc("* Your heartbeat becomes twisted.", "obj_knight_enemy_slash_Step_0_gml_547_0");
            if (phase4turn == 1 && global.hp[2] > 0)
                global.battlemsg[0] = stringsetloc("* Susie grew pale.", "obj_knight_enemy_slash_Step_0_gml_548_0");
            if (phase4turn == 1 && global.hp[2] < 1)
                global.battlemsg[0] = stringsetloc("* Susie struggled to give some kind of warning.", "obj_knight_enemy_slash_Step_0_gml_317_0");
        }
        else
        {
            var krisdown = "";
            var susiedown = "";
            var ralseidown = "";
            var downcount = 0;
            if (krisdownmessage == false && global.hp[1] < 1)
            {
                krisdown = stringsetloc("* Kris kneeled in silence.&", "obj_knight_enemy_slash_Step_0_gml_343_0");
                downcount++;
                krisdownmessage = true;
                global.battlemsg[0] = krisdown;
            }
            if (susiedownmessage == false && global.hp[2] < 1)
            {
                susiedown = stringsetloc("* Susie was hurt and beaten.&", "obj_knight_enemy_slash_Step_0_gml_344_0");
                downcount++;
                susiedownmessage = true;
                global.battlemsg[0] = susiedown;
            }
            if (ralseidownmessage == false && global.hp[3] < 1)
            {
                ralseidown = stringsetloc("* Ralsei became a pile of fluff.&", "obj_knight_enemy_slash_Step_0_gml_345_0");
                downcount++;
                ralseidownmessage = true;
                global.battlemsg[0] = ralseidown;
            }
            if (downcount == 2)
                global.battlemsg[0] = krisdown + susiedown + ralseidown;
        }
    }
    if (global.hp[1] < 1 && global.hp[2] < 1 && global.hp[3] < 1 && global.turntimer > 0)
    {
        global.turntimer = 0;
        with (obj_lerpvar)
            instance_destroy();
        with (obj_script_delayed)
            instance_destroy();
        with (obj_afterimage_grow)
            instance_destroy();
    }
    if (global.mnfight == 2 && global.turntimer < 1 && global.hp[1] < 1 && global.hp[2] < 1 && global.hp[3] < 1 && endcon == 0)
    {
        endcon = 1;
        with (obj_particle_generic)
            instance_destroy();
        if (scr_get_knight_total_attempts() > 0)
        {
            scr_gameover();
        }
        else
        {
            obj_battlecontroller.noreturn = 1;
            obj_battlecontroller.intro = 2;
            with (obj_tensionbar)
            {
                alarm[5] = 15;
                hspeed = -10;
                friction = -0.4;
            }
            mus_volume(global.batmusic[1], 0, 90);
            event_user(3);
            global.fighting = 0;
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
        checkcount++;
        if (checkcount == 1)
        {
            msgsetloc(0, "* Kris analyzed the enemy!/", "obj_knight_enemy_slash_Step_0_gml_393_0");
            msgnextloc("* But Kris&couldn't learn anything./%", "obj_knight_enemy_slash_Step_0_gml_394_0");
        }
        else
        {
            msgsetloc(0, "* Kris points into the distance./", "obj_knight_enemy_slash_Step_0_gml_398_0");
            msgnextloc("* Nothing happened./%", "obj_knight_enemy_slash_Step_0_gml_399_0");
        }
        scr_battletext_default();
    }
    if (acting == 2 && actcon == 0)
    {
        actcon = 1;
        holdbreathcount++;
        if (holdbreathcount <= 1)
            msgsetloc(0, "* Kris held their breath.&* Their heartbeat quickened.&* The SOUL now moves faster./%", "obj_knight_enemy_slash_Step_0_gml_497_0");
        if (holdbreathcount > 1)
            msgsetloc(0, "* Kris held their breath...&* Kris smiled.&* Nothing happened./%", "obj_knight_enemy_slash_Step_0_gml_415_0");
        scr_battletext_default();
        holdbreathcount = 1;
    }
    if (actingsus == 1 && actconsus == 1)
    {
        scr_speaker("noone");
        msgsetloc(0, "* Susie talked to the Knight!/", "obj_knight_enemy_slash_Step_0_gml_424_0");
        scr_anyface_next("susie", "J");
        msgnextloc("\\EJ* I don't know what the hell you are, but.../", "obj_knight_enemy_slash_Step_0_gml_426_0");
        msgnextloc("\\EJ* Leave Toriel alone! You hear me!?/", "obj_knight_enemy_slash_Step_0_gml_427_0");
        msgnextloc("\\EV* .../", "obj_knight_enemy_slash_Step_0_gml_428_0");
        msgnextloc("\\EW* ... Fine, you don't wanna listen?/", "obj_knight_enemy_slash_Step_0_gml_429_0");
        msgnextloc("\\EX* Then we'll just. Have to do things the hard way./", "obj_knight_enemy_slash_Step_0_gml_430_0");
        scr_anyface_next("none", 0);
        msgnextloc("* (Susie will not ACT any more.)/%", "obj_knight_enemy_slash_Step_0_gml_432_0");
        scr_battletext_default();
        sactcount = 1;
        actcon = 1;
        actconsus = 0;
        global.canactsus[myself][0] = 0;
        global.actnamesus[myself][0] = "";
        global.actsimulsus[myself][0] = 0;
        global.actactorsus[myself][0] = 0;
        global.actcostsus[myself][0] = 0;
        global.battlespell[1][0] = 0;
        global.battlespell[1][0] = -1;
        global.battleactcount[1] = 0;
        global.battlespellname[1][0] = "";
        global.battlespelldesc[1][0] = "";
        scr_spellmenu_setup();
    }
    if (actingral == 1 && actconral == 1)
    {
        ractcount++;
        if (ractcount == 1)
        {
            scr_speaker("noone");
            msgsetloc(0, "* Ralsei tried talking.../", "obj_knight_enemy_slash_Step_0_gml_461_0");
            scr_anyface_next("ralsei", "Q");
            msgnextloc("\\EQ* Please... please, don't do this.../", "obj_knight_enemy_slash_Step_0_gml_463_0");
            msgnextloc("\\Ee* If the Roaring happens, then... then.../", "obj_knight_enemy_slash_Step_0_gml_464_0");
            msgnextloc("\\EZ* Please... stop...!/", "obj_knight_enemy_slash_Step_0_gml_465_0");
            scr_anyface_next("none", 0);
            msgnextloc("* (... but nothing happened.)/%", "obj_knight_enemy_slash_Step_0_gml_467_0");
            scr_speaker("noone");
        }
        else
        {
            scr_speaker("noone");
            msgsetloc(0, "* Ralsei tried talking.../", "obj_knight_enemy_slash_Step_0_gml_473_0");
            scr_anyface_next("ralsei", "8");
            msgnextloc("\\E8* Please, stop.../", "obj_knight_enemy_slash_Step_0_gml_475_0");
            scr_anyface_next("none", 0);
            msgnextloc("* (... but nothing happened.)/%", "obj_knight_enemy_slash_Step_0_gml_477_0");
        }
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
    scr_enemy_hurt();
if (end_cutscene_version == 1)
{
    endtimer++;
    if (endtimer == 32)
    {
        scr_fadeout(15);
        with (obj_fadeout)
        {
            image_blend = c_white;
            x -= 40;
            length *= 2;
        }
    }
    if (endcon == 1 && endtimer > 45)
    {
        global.flag[50] = 0;
        global.flag[51] = 1;
        with (obj_attackpress)
            instance_destroy();
        with (obj_dmgwriter)
            instance_destroy();
        with (obj_ch3_PTB02)
            teamdefeated = false;
        endcon = 2;
        obj_battlecontroller.noreturn = 1;
        obj_battlecontroller.intro = 2;
        with (obj_tensionbar)
        {
            alarm[5] = 15;
            hspeed = -10;
            friction = -0.4;
        }
        event_user(3);
        global.fighting = 0;
        mus_volume(global.batmusic[1], 0, 90);
    }
}
if (chargeupcon == 1)
{
    chargeuptimer++;
    if (chargeuptimer == 1)
        snd_play(snd_knight_powerup_white);
    if ((chargeuptimer % 4) == 0 && chargeuptimer > 10)
    {
        fade = instance_create_depth(x, y, depth + 1, obj_afterimage_fade_to_white);
        fade.sprite_index = sprite_index;
        fade.image_index = image_index;
        fade.image_speed = 0;
        fade.image_xscale = image_xscale;
        fade.image_yscale = image_yscale;
        fade.image_alpha = 0.6;
        fade.speed = 4;
        fade.direction = random(360);
    }
    if (chargeuptimer == 60)
        global.turntimer = 1;
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
