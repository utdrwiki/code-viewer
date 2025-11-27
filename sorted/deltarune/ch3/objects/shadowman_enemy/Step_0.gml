if (init == 0)
{
    init = 1;
    if (i_ex(obj_tenna_board4_enemy))
    {
        global.actactor[0][0] = 4;
        global.actactor[0][1] = 4;
        scr_spellmenu_setup();
    }
}
if (global.monster[myself] == 0 && krisdancing)
{
    scr_battle_sprite_reset("kris");
    krisdancing = false;
}
if (global.monster[myself] == 0 && susiedancing)
{
    scr_battle_sprite_reset("susie");
    susiedancing = false;
}
if (global.monster[myself] == 0 && ralseidancing)
{
    scr_battle_sprite_reset("ralsei");
    ralseidancing = false;
}
if (global.monster[myself] == 1)
{
    var rouxlswait = false;
    if (i_ex(obj_rouxls_ch3_enemy) && obj_rouxls_ch3_enemy.dancecon > 0)
        rouxlswait = true;
    if (scr_isphase("enemytalk") && talked == 0 && rouxlswait == false)
    {
        scr_randomtarget();
        myattackchoice = choose(1, 2);
        turn++;
        if (instance_number(obj_monsterparent) == 1 || i_ex(obj_tenna_board4_enemy))
            myattackchoice = 2;
        if (turn > 4 && irandom(200) < 2)
            myattackchoice = 3;
        myattackpriority = 1;
        if (myattackchoice == 2)
            myattackpriority = 50;
        scr_attackpriority(myattackpriority - 1);
        if (!instance_exists(obj_darkener))
            instance_create(0, 0, obj_darkener);
        talked = 1;
        talktimer = 0;
        rtimer = 0;
    }
    if (talked == 1 && scr_isphase("enemytalk") && !i_ex(obj_rouxls_ch3_enemy))
    {
        if (!i_ex(obj_battleblcon) && talktimer == 1)
        {
            global.mnfight = 1.5;
            talktimer = talkmax;
        }
        scr_blconskip(15);
    }
    if (global.mnfight == 1.5)
    {
        if (scr_attackpriority(myattackpriority))
        {
            if (!instance_exists(obj_growtangle))
                instance_create(__view_get(e__VW.XView, 0) + 320, __view_get(e__VW.YView, 0) + 170, obj_growtangle);
            var sax_count = 0;
            for (var i = 0; i < instance_number(obj_shadowman_enemy); i++)
            {
                enemy[i] = instance_find(obj_shadowman_enemy, i);
                if (enemy[i].myattackchoice == 1)
                    sax_count++;
            }
            if (sax_count > 1 && !i_ex(obj_rouxls_ch3_enemy))
            {
                obj_growtangle.maxxscale = 1;
                obj_growtangle.maxyscale = 2;
                obj_growtangle.x += 20;
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
            if (skipattack == true)
                myattackchoice = -1;
            if (i_ex(obj_zapper_enemy))
                myattackchoice = 1;
            if (i_ex(obj_shutta_enemy))
                myattackchoice = 2;
            if (myattackchoice == 0)
            {
                global.monsterattackname[myself] = "trumpet";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 60;
            }
            else if (myattackchoice == 1)
            {
                global.monsterattackname[myself] = "saxophone";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 61;
            }
            else if (myattackchoice == 2)
            {
                target = 0;
                global.monsterattackname[myself] = "tommy gun";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 62;
            }
            else if (myattackchoice == 3)
            {
                global.monsterattackname[myself] = "censored bullet pattern";
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller);
                dc.type = 999;
                instance_create(x, y, obj_shadowman_caption);
            }
            scr_turntimer(200);
            if (myattackchoice == 3)
                global.turntimer = 70;
            turns += 1;
            if (!i_ex(obj_rouxls_ch3_enemy) && !i_ex(obj_tenna_board4_enemy))
            {
                global.typer = 6;
                global.fc = 0;
                rr = choose(0, 1, 2, 3);
                if (scr_messagepriority(random(2)))
                {
                    if (rr == 0)
                        global.battlemsg[0] = stringsetloc("* Shadowguy plays the blues, blues, blues.", "obj_shadowman_enemy_slash_Step_0_gml_151_0");
                    if (rr == 1)
                        global.battlemsg[0] = stringsetloc("* Shadowguy snaps their fingers rhythmically.", "obj_shadowman_enemy_slash_Step_0_gml_152_0");
                    if (rr == 2)
                        global.battlemsg[0] = stringsetloc("* Shadowguy rolls up their socks... secretly.", "obj_shadowman_enemy_slash_Step_0_gml_153_0");
                    if (rr == 3)
                        global.battlemsg[0] = stringsetloc("* Shadowguy's got the moves and the groove", "obj_shadowman_enemy_slash_Step_0_gml_154_0");
                }
                if (global.monsterhp[myself] <= (global.monstermaxhp[myself] / 3))
                {
                    if (scr_messagepriority(100 + random(2)))
                        global.battlemsg[0] = stringsetloc("* Shadowguy's blues look bluer and bluer.", "obj_shadowman_enemy_slash_Step_0_gml_160_0");
                }
                if (global.monsterstatus[myself] == 1)
                {
                    if (scr_messagepriority(100 + random(2)))
                        global.battlemsg[0] = stringsetloc("* Shadowguy is on the midnight train to Dreamsville.", "obj_shadowman_enemy_slash_Step_0_gml_166_0");
                }
                if (global.mercymod[myself] >= 100)
                {
                    if (scr_messagepriority(100 + random(2)))
                        global.battlemsg[0] = stringsetloc("* Shadowguy look seriously jazzed.", "obj_shadowman_enemy_slash_Step_0_gml_172_0");
                }
                if (irandom(100) < 4)
                    global.battlemsg[0] = stringsetloc("* Smells like old saxophone reeds.", "obj_shadowman_enemy_slash_Step_0_gml_175_0");
            }
            attacked = 1;
        }
    }
    if (gainmercyovertime == 0)
    {
        with (obj_regularbullet)
            target = 0;
    }
    if ((global.mnfight == 2 && (savekrishp > global.hp[1] || savesusiehp > global.hp[2] || saveralseihp > global.hp[3]) && gainmercyovertime == 0) || (global.mnfight == 2 && global.turntimer <= 1 && gainmercyovertime == 0))
    {
        gainmercyovertime = 1;
        gainmercytimer = 0;
        scr_battle_sprite_reset("kris");
        krisdancing = false;
        timberb = 15;
    }
    if (timberb > 0)
    {
        timberb--;
        with (__mercydmgwriter)
        {
            killtimer = 0;
            killactive = 0;
            kill = 0;
        }
    }
    if (global.mnfight == 2 && global.turntimer <= 1 && !i_ex(obj_rouxls_ch3_enemy))
    {
        myattackchoice = 0;
        with (obj_shadowman_caption)
            instance_destroy();
        scr_battle_sprite_reset("kris");
        krisdancing = false;
        scr_battle_sprite_reset("susie");
        susiedancing = false;
        scr_battle_sprite_reset("ralsei");
        ralseidancing = false;
    }
    if (global.mnfight > 0 && !i_ex(obj_rouxls_ch3_enemy))
    {
        if (idlesprite == spr_shadowman_sax_b)
            idlesprite = spr_shadowman_idle_b;
        with (obj_herosusie)
        {
            if (sprite_index == spr_susie_dance)
            {
                susiedancing = false;
                scr_battle_sprite_reset("susie");
                obj_herosusie.x = obj_herosusie.xstart;
                obj_herosusie.y = obj_herosusie.ystart;
            }
        }
        with (obj_heroralsei)
        {
            if (sprite_index == spr_ralsei_dance)
            {
                ralseidancing = false;
                scr_battle_sprite_reset("ralsei");
            }
        }
    }
    if (gainmercyovertime == 0 && savekrishp <= global.hp[1] && savesusiehp <= global.hp[2] && saveralseihp <= global.hp[3])
    {
        if (global.mnfight == 2 && global.turntimer > 1 && i_ex(obj_dmgwriter_boogie))
        {
            gainmercytimer++;
            if ((obj_dmgwriter_boogie.damage == 5 && gainmercytimer >= 30) || (obj_dmgwriter_boogie.damage > 5 && gainmercytimer >= 1))
            {
                if (obj_dmgwriter_boogie.damage < 100)
                {
                    obj_dmgwriter_boogie.damage += 1;
                    obj_dmgwriter_boogie.init = 0;
                    global.mercymod[myself] += 1;
                }
                gainmercytimer = 0;
            }
        }
        with (obj_dmgwriter_boogie)
        {
            killtimer = 0;
            killactive = 0;
            kill = 0;
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
        global.writerimg[0] = spr_sharp_note_symbol;
        global.writerimg[1] = spr_flat_note_symbol;
        if (!i_ex(obj_tenna_board4_enemy))
            msgsetloc(0, "* SHADOWGUY - AT \\I0 DF \\I1&* Battling's just a side gig. Playing on stage is the dream!/%", "obj_shadowman_enemy_slash_Step_0_gml_263_0");
        else
            msgsetloc(0, "* SHADOWGUY - AT \\I0 DF \\I1&* The \"Sharpshoot\" act can shoot many things!/%", "obj_shadowman_enemy_slash_Step_0_gml_264_0");
        scr_battletext_default();
    }
    if (acting == 2 && actcon == 0)
    {
        con = 1;
        global.mercymod[myself] += 5;
        if (global.mercymod[myself] < 0)
            global.mercymod[myself] = 0;
        if (global.mercymod[myself] >= 100)
            global.mercymod[myself] = 100;
        snd_play_x(snd_mercyadd, 0.8, 1.4);
        __mercydmgwriter = instance_create_depth(global.monsterx[myself], global.monstery[myself] + 40, depth - 99999, obj_dmgwriter_boogie);
        __mercydmgwriter.damage = 5;
        __mercydmgwriter.type = 5;
        global.hittarget[myself]++;
        scr_battle_sprite_set("kris", spr_kris_dance, 0.25, true);
        scr_battle_sprite_actflash("kris");
        idlesprite = spr_shadowman_sax_b;
        msgsetloc(0, "* Kris boogies past bullets!&* SHADOWGUY gains mercy until you get hit!/%", "obj_shadowman_enemy_slash_Step_0_gml_289_0");
        scr_battletext_default();
        gainmercyovertime = 0;
        savekrishp = global.hp[1];
        savesusiehp = global.hp[2];
        saveralseihp = global.hp[3];
        krisdancing = true;
    }
    if (acting == 3 && actcon == 0)
    {
        actype = 1;
        if (forceacttype == 1)
            actype = forceacttype;
        if (i_ex(obj_tenna_board4_enemy) || i_ex(obj_shutta_enemy) || global.encounterno == 132)
            actype = 0;
        if (actype == 0)
            msgsetloc(0, "* Everyone gets ready to knock the enemies' hats off!/%", "obj_shadowman_enemy_slash_Step_0_gml_303_0");
        if (actype == 1)
            msgsetloc(0, "* Everyone gets ready to knock the enemies' socks off!/%", "obj_shadowman_enemy_slash_Step_0_gml_304_0");
        scr_battletext_default();
        obj_herokris.x -= 8;
        obj_herokris.y -= 12;
        obj_herosusie.x -= 8;
        obj_herosusie.y -= 6;
        obj_heroralsei.x -= 4;
        scr_act_charsprite("ralsei", spr_ralsei_zoosuit, 0, 0);
        scr_act_charsprite("susie", spr_susie_zoosuit, 0, 0);
        scr_act_charsprite("kris", spr_kris_zoosuit, 0, 0);
        snd_play(snd_boost);
        with (obj_tenna_board4_gacha)
            sharpshoot = true;
        acting = 3.1;
    }
    if (acting == 3.1 && actcon == 0 && !i_ex(obj_writer))
    {
        msgsetsubloc(0, "* Press directions to aim and ~1 to shoot!", scr_get_input_name(6), "obj_shadowman_enemy_slash_Step_0_gml_325_0");
        if (scr_is_switch_os())
        {
            if (global.lang == "ja")
                msgsetsub(0, "＊ 方向ボタンで　狙いを定めて\n　 ~1で発射！", scr_get_input_name(6));
        }
        scr_battletext_default();
        with (obj_writer)
            pos = 100;
        acting = 30;
        sharpshootlength = 0;
        instance_create(x, y, obj_shadowman_sharpshoot_cursor);
        with (obj_monsterparent)
        {
            darken = 1;
            scr_rememberxy();
            if (object_index == obj_shadowman_enemy && image_alpha != 0)
            {
                target = instance_create(x, y + 50, obj_shadowman_sharpshoot_target);
                target.parentid = id;
                if (global.mercymod[myself] >= 100)
                    target.spare = true;
                if (other.actype == 0)
                {
                    target.type = 0;
                    target.sprite_index = spr_shadowman_idle_hat;
                }
                else
                {
                    target.type = 1;
                    target.sprite_index = spr_shadowman_idle_socks;
                }
            }
            else if (object_index == obj_tenna_board4_enemy && image_alpha != 0)
            {
                target = instance_create(x, y + 50, obj_shadowman_sharpshoot_target);
                target.parentid = id;
                target.type = 3;
                if (global.mercymod[myself] >= 100)
                    target.spare = true;
            }
            else if (object_index == obj_zapper_enemy && image_alpha != 0)
            {
                target = instance_create(x + 40, y + 60, obj_shadowman_sharpshoot_target);
                target.parentid = id;
                target.type = 6;
                target.sprite_index = spr_zapper_sharpshoot;
                if (global.mercymod[myself] >= 100)
                    target.spare = true;
            }
            else if (object_index == obj_pippins_enemy && image_alpha != 0)
            {
                target = instance_create(x + 40, y + 60, obj_shadowman_sharpshoot_target);
                target.parentid = id;
                target.type = 7;
                target.sprite_index = spr_pippins_sharpshoot;
                if (global.mercymod[myself] >= 100)
                    target.spare = true;
            }
            else if (object_index == obj_shutta_enemy && image_alpha != 0)
            {
                target = instance_create(x + 40, y + 60, obj_shadowman_sharpshoot_target);
                target.parentid = id;
                target.type = 8;
                target.sprite_index = spr_shutta_sharpshoot;
                if (global.mercymod[myself] >= 100)
                    target.spare = true;
            }
            else if (image_alpha != 0)
            {
                target = instance_create(x + 40, y + 60, obj_shadowman_sharpshoot_target);
                target.parentid = id;
                target.type = 2;
                if (global.mercymod[myself] >= 100)
                    target.spare = true;
            }
        }
    }
    if (acting == 30)
    {
        sharpshoottimer++;
        if (sharpshoottimer >= 14)
        {
            obj_herokris.state = 8;
            obj_herokris.image_speed = 0;
            obj_herokris.image_index = 7;
        }
        with (obj_monsterparent)
        {
            y = ystart + (sin(other.sharpshoottimer / 15) * 50);
            if (object_index == obj_shadowman_enemy)
            {
                hspeed = sin(fsiner / 12) * 2;
                vspeed = cos(fsiner / 12) * 2;
            }
        }
        if (sharpshootlength > 0)
            sharpshootlength++;
        if (i_ex(obj_shadowman_sharpshoot_heart) && sharpshootlength == 0)
            sharpshootlength = 1;
        var _endact = true;
        for (var i = 0; i < instance_number(obj_monsterparent); i++)
        {
            enemy[i] = instance_find(obj_monsterparent, i);
            if (enemy[i].image_alpha != 0)
                _endact = false;
        }
        if (!i_ex(obj_shadowman_sharpshoot_cursor) || sharpshootlength >= 180 || _endact)
        {
            with (obj_monsterparent)
            {
                hspeed = 0;
                vspeed = 0;
                if (object_index == obj_shadowman_enemy && board4sharpshootscene == true)
                    scr_move_to_point_over_time(___myrememberx - 50, ___myremembery + 0, 10);
                else
                    scr_move_to_point_over_time(___myrememberx, ___myremembery, 10);
                darken = 0;
                if (sharpshootmercy > 0 && id.object_index != obj_tenna_board4_enemy && other.board4sharpshootscene == false)
                {
                    scr_mercyadd(myself, sharpshootmercy);
                    sharpshootmercy = 0;
                }
            }
            with (obj_writer)
                instance_destroy();
            acting = 31;
            alarm[4] = 50;
            with (obj_shadowman_sharpshoot_cursor)
                stopshooting = true;
            with (obj_shadowman_sharpshoot_target)
                fadein = false;
            with (obj_shadowman_sharpshoot_target)
                stopshooting = true;
            for (var i = 0; i < 10; i++)
            {
                with (_charactsprite[i])
                    instance_destroy();
            }
            with (obj_heroparent)
            {
                image_alpha = 1;
                acttimer = 0;
                state = 0;
                global.faceaction[myself] = 0;
            }
            obj_herokris.x += 8;
            obj_herokris.y += 12;
            obj_herosusie.x += 8;
            obj_herosusie.y += 6;
            obj_heroralsei.x += 4;
            with (obj_tenna_board4_gacha)
                sharpshoot = false;
        }
    }
    if (con == 0 && acting == 31 && alarm[4] == 40)
    {
        with (obj_shadowman_enemy)
        {
            if (idlesprite == spr_shadowman_idle_bunny && image_alpha != 0)
            {
                snd_play(snd_slidewhistle);
                hat = instance_create(x, cameray(), obj_shadowman_enemy_hat);
                hat.parentid = id;
            }
        }
        if (!i_ex(obj_shadowman_enemy_hat))
            alarm[4] = 1;
    }
    if (con == 1 && !i_ex(obj_shadowman_enemy_hat))
    {
        if (!i_ex(obj_shadowman_enemy_hat))
        {
            con = 0;
            actcon = 1;
            sharpshoottimer = 0;
            with (obj_shadowman_sharpshoot_target)
                instance_destroy();
            if (board4sharpshootscene == true)
            {
                actcon = 0;
                acting = 32;
            }
        }
    }
    if (acting == 32)
    {
        obj_tenna_board4_enemy.tenna_actor.sprite_index = spr_tenna_hooray;
        obj_tenna_board4_enemy.tenna_actor.image_index = 2;
        talktimer = 0;
        acting = 33;
    }
    if (acting == 33)
    {
        idlesprite = spr_shadowman_serious_r;
        sparedsprite = spr_shadowman_serious_r;
        state = 4;
        talktimer++;
        if (talktimer == 1)
        {
            with (obj_actor_tenna)
                shakeamt = 5;
        }
        if (talktimer == 5)
        {
            with (obj_actor_tenna)
                shakeamt = 0;
            snd_play(snd_damage);
            with (obj_writer)
                instance_destroy();
            global.typer = 81;
            msgsetloc(0, "H-Hey!!!", "obj_shadowman_enemy_slash_Step_0_gml_473_0");
            scr_enemyblcon(obj_tenna_board4_enemy.tenna_actor.x - 56, obj_tenna_board4_enemy.tenna_actor.y - 40, 10);
            myblcon.depth = depth - 10;
        }
        if (talktimer == 30)
        {
            talktimer = 0;
            acting = 34;
        }
    }
    if (acting == 34)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            obj_tenna_board4_enemy.tenna_actor.sprite_index = spr_tenna_evil;
            with (obj_writer)
                instance_destroy();
            global.typer = 81;
            msgsetloc(0, "How could you let&them use that act!?", "obj_shadowman_enemy_slash_Step_0_gml_490_0");
            with (scr_enemyblcon(obj_tenna_board4_enemy.tenna_actor.x - 56, obj_tenna_board4_enemy.tenna_actor.y - 40, 10))
            {
            }
            myblcon.depth = depth - 10;
            talktimer = 0;
            acting = 35;
        }
    }
    if (acting == 35)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            global.typer = 81;
            msgsetloc(0, "You're!!! Fired!!!", "obj_shadowman_enemy_slash_Step_0_gml_504_0");
            with (scr_enemyblcon(obj_tenna_board4_enemy.tenna_actor.x - 56, obj_tenna_board4_enemy.tenna_actor.y - 40, 10))
            {
            }
            myblcon.depth = depth - 10;
            obj_tenna_board4_enemy.tenna_actor.sprite_index = spr_tenna_point_up_b;
            talktimer = 0;
            acting = 36;
        }
    }
    if (acting == 36)
    {
        talktimer++;
        if (talktimer == 1)
        {
            snd_play(snd_wing);
            scr_shakeobj();
            idlesprite = spr_shadowman_sad;
            sparedsprite = spr_shadowman_sad;
        }
        if (talktimer == 31)
        {
            with (obj_shadowman_enemy)
                hspeed = 12;
            talktimer = 0;
            acting = 37;
        }
    }
    if (acting == 37)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            obj_tenna_board4_enemy.tenna_actor.mad = false;
            with (obj_writer)
                instance_destroy();
            global.typer = 81;
            msgsetloc(0, "Alright, no more&of THAT guy!", "obj_shadowman_enemy_slash_Step_0_gml_538_0");
            with (scr_enemyblcon(obj_tenna_board4_enemy.tenna_actor.x - 56, obj_tenna_board4_enemy.tenna_actor.y - 40, 10))
            {
            }
            myblcon.depth = depth - 10;
            with (obj_tenna_board4_enemy)
                tietimer = 1;
            talktimer = 0;
            acting = 38;
        }
        with (obj_tenna_board4_enemy)
            battleresult = 1;
    }
    if (acting == 38)
    {
        talktimer++;
        if (((button3_p() || button1_p()) && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            with (obj_battlecontroller)
                skipvictory = 1;
            talktimer = 0;
            scr_wincombat();
            with (obj_tenna_board4_enemy)
            {
                tietimer = 0;
                tenna_actor.sprite_index = spr_tenna_pose_podium;
            }
        }
    }
    if (actingsus == 1 && actconsus == 1)
    {
        susiedancing = true;
        scr_mercyadd(myself, 30);
        if (simulordersus == 0)
            actconsus = 20;
        else
            actconsus = 0;
        scr_battle_sprite_set("susie", spr_susie_dance, 0.25, true);
        scr_battle_sprite_actflash("susie");
        idlesprite = spr_shadowman_sax_b;
        msgsetloc(0, "* Susie danced!/%", "obj_shadowman_enemy_slash_Step_0_gml_575_0");
        if (global.monsterstatus[myself] != 1)
            scr_monster_make_tired(myself);
        scr_simultext("susie");
    }
    if (actingral == 1 && actconral == 1)
    {
        ralseidancing = true;
        scr_mercyadd(myself, 30);
        if (simulorderral == 0)
            actconral = 20;
        else
            actconral = 0;
        scr_battle_sprite_set("ralsei", spr_ralsei_dance, 0.25, true);
        scr_battle_sprite_actflash("ralsei");
        idlesprite = spr_shadowman_sax_b;
        msgsetloc(0, "* Ralsei danced!/%", "obj_shadowman_enemy_slash_Step_0_gml_593_0");
        if (global.monsterstatus[myself] != 1)
            scr_monster_make_tired(myself);
        scr_simultext("ralsei");
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
