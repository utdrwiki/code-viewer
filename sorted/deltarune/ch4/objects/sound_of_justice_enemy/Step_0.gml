global.mercymod[myself] = 0;
with (obj_battlecontroller)
    hidestar = 1;
if (global.inv > 29)
    global.inv = 29;
if (init == 0 && phase == 1)
{
    global.tempflag[60]++;
    global.batmusic[2] = snd_init("statue_level1.ogg");
    global.batmusic[3] = mus_loop(global.batmusic[2]);
    mus_volume(global.batmusic[3], 1, 0);
    init = 1;
}
if (init == 0 && phase == 2)
{
    if (i_ex(obj_dw_churchb_nongerson))
        global.tension = obj_dw_churchb_nongerson.savetension;
    global.batmusic[2] = snd_init("statue2_level1.ogg");
    global.batmusic[3] = mus_loop(global.batmusic[2]);
    mus_volume(global.batmusic[3], 1, 0);
    init = 1;
    introcon = 1;
    if (room == room_battletest)
        attackpattern = 5;
}
if (phase == 1 && susiedown == true && !i_ex(obj_heart))
{
    phase = 2;
    global.hp[2] = 1;
    intermission1_con = 1;
    intermission1_timer = 0;
    if (i_ex(obj_dw_churchb_nongerson))
        obj_dw_churchb_nongerson.attackpattern_save = attackpattern;
}
if (introcon == 1)
{
    introtimer++;
    if (introtimer == 1)
    {
        global.charturn = 3;
        msgsetloc(0, "Kris!? Kris, hey!!!/%", "obj_sound_of_justice_enemy_slash_Step_0_gml_44_0");
        global.typer = 75;
        scr_heroblcon("susie");
    }
    if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        introcon = 2;
        introtimer = 0;
        msgsetloc(0, "Kris, there's&something wrong.../%", "obj_sound_of_justice_enemy_slash_Step_0_gml_53_0");
        global.typer = 75;
        scr_heroblcon("susie");
    }
}
if (introcon == 2)
{
    introtimer++;
    if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        introcon = 3;
        introtimer = 0;
        msgsetloc(0, "There's something wrong&with the old man.../%", "obj_sound_of_justice_enemy_slash_Step_0_gml_67_0");
        global.typer = 75;
        scr_heroblcon("susie");
    }
}
if (introcon == 3)
{
    introtimer++;
    if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        introcon = 4;
        introtimer = 0;
        msgsetloc(0, "We have to...&figure out how to&get through to him.../%", "obj_sound_of_justice_enemy_slash_Step_0_gml_81_0");
        global.typer = 75;
        scr_heroblcon("susie");
    }
}
if (introcon == 4)
{
    introtimer++;
    if ((button3_p() && introtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        introcon = 0;
        introtimer = 0;
        global.charturn = 0;
    }
}
if (global.monster[myself] == 1)
{
    if (scr_isphase("enemytalk") && talked == 0 && kris_phase2_try_attack_con == 0 && susie_phase2_try_attack_con == 0 && intermission1_con == 0 && endingcon == 0 && introcon == 0)
    {
        bulletphaseend = false;
        global.tensionselect = 0;
        scr_randomtarget();
        sprite_set_offset(spr_spearblocker, 32, 32);
        ballooncon = 0;
        balloonsubcon = 0;
        balloonend = 1;
        talkedcon = 0;
        rtimer = 0;
        rr = choose(0, 1, 2, 3);
        attackcon = 0;
        if (turns == 0)
        {
            msgsetloc(0, "Old man... what...&what are you doing?/%", "obj_sound_of_justice_enemy_slash_Step_0_gml_125_0");
            ballooncon = 1;
            balloonend = 0;
        }
        else if (turns == 1)
        {
            msgsetloc(0, "H... Hey, what's &the big idea!?/%", "obj_sound_of_justice_enemy_slash_Step_0_gml_126_0");
            ballooncon = 2;
            balloonend = 0;
        }
        else if (turns == 2)
        {
            msgsetloc(0, "I wrote your letter&for you, don't you.../%", "obj_sound_of_justice_enemy_slash_Step_0_gml_127_0");
            ballooncon = 3;
            balloonend = 0;
        }
        else if (turns == 3)
        {
            msgsetloc(0, "I...&I'm telling you... /%", "obj_sound_of_justice_enemy_slash_Step_0_gml_128_0");
            ballooncon = 4;
            balloonend = 0;
        }
        else if (turns == 4)
        {
            msgsetloc(0, "Kris... why... &Why doesn't he&recognize me?/%", "obj_sound_of_justice_enemy_slash_Step_0_gml_131_0");
            ballooncon = 5;
            balloonend = 0;
        }
        else if (turns == 5)
        {
            msgsetloc(0, "I knew I... &I screwed up./%", "obj_sound_of_justice_enemy_slash_Step_0_gml_132_0");
            ballooncon = 6;
            balloonend = 0;
        }
        else if (turns == 6)
        {
            msgsetloc(0, "Old man, listen! &I... I screwed up!&I know! But I.../%", "obj_sound_of_justice_enemy_slash_Step_0_gml_133_0");
            ballooncon = 7;
            balloonend = 0;
        }
        else if (turns == 7)
        {
            msgsetloc(0, "So we don't have&to hurt you.../%", "obj_sound_of_justice_enemy_slash_Step_0_gml_134_0");
            ballooncon = 8;
            balloonend = 0;
        }
        else if (turns == 8)
        {
            msgsetloc(0, "... If.../%", "obj_sound_of_justice_enemy_slash_Step_0_gml_135_0");
            ballooncon = 9;
            balloonend = 0;
        }
        else
        {
            msgsetloc(0, "?/%", "obj_sound_of_justice_enemy_slash_Step_0_gml_137_0");
            ballooncon = 0;
            balloonend = 1;
        }
        turns++;
        global.typer = 75;
        scr_heroblcon("susie");
        susieripple = 1;
        event_user(0);
        gothitlastturn = 0;
        if (ballooncon == 0)
        {
            talked = 1;
            talktimer = 0;
        }
        else
        {
            talked = 0.6;
            talktimer = 0;
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
                msgsetloc(0, "Why are you...&Attacking me?/%", "obj_sound_of_justice_enemy_slash_Step_0_gml_167_0");
                ballooncon = 1.1;
                balloonend = 0;
            }
            else if (ballooncon == 1.1)
            {
                msgsetloc(0, "You aren't...&Trying to teach&me something, are you?/%", "obj_sound_of_justice_enemy_slash_Step_0_gml_168_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 2)
            {
                msgsetloc(0, "It's me, Susie!&I'm your... /%", "obj_sound_of_justice_enemy_slash_Step_0_gml_170_0");
                ballooncon = 2.1;
                balloonend = 0;
            }
            else if (ballooncon == 2.1)
            {
                msgsetloc(0, "I'm your friend,&right!?/%", "obj_sound_of_justice_enemy_slash_Step_0_gml_171_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 3)
            {
                msgsetloc(0, "Don't you&recognize me...?/%", "obj_sound_of_justice_enemy_slash_Step_0_gml_173_0");
                ballooncon = 3.1;
                balloonend = 0;
            }
            else if (ballooncon == 3.1)
            {
                msgsetloc(0, "Hey, say something...&Say something already!/%", "obj_sound_of_justice_enemy_slash_Step_0_gml_174_0");
                ballooncon = 3.2;
                balloonend = 0;
            }
            else if (ballooncon == 3.2)
            {
                msgsetloc(0, "COME ON, SAY&SOMETHING, ALREADY!!!/%", "obj_sound_of_justice_enemy_slash_Step_0_gml_175_0");
                ballooncon = 3.3;
                balloonend = 0;
            }
            else if (ballooncon == 3.3)
            {
                with (obj_sound_of_justice_enemy)
                {
                    if (state != 13)
                    {
                        state = 13;
                        sprite_index = spr_gerson_teleport;
                        image_xscale = 3;
                        image_yscale = 3;
                        image_speed = 1;
                        x = obj_sound_of_justice_enemy.xstart + 56;
                        y = obj_sound_of_justice_enemy.ystart + 70;
                        snd_play_pitch(motor_swing_down, 1.4);
                    }
                }
                with (obj_heroparent)
                    state = 1;
                ballooncon = 0;
                balloonend = 1;
                talked = 0.7;
                alarm[6] = 60;
                exit;
            }
            else if (ballooncon == 4)
            {
                msgsetloc(0, "I don't want to&hurt you, so... just.../%", "obj_sound_of_justice_enemy_slash_Step_0_gml_200_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 5)
            {
                msgsetloc(0, "We have to stop&him... before&anyone gets hurt./%", "obj_sound_of_justice_enemy_slash_Step_0_gml_202_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 6)
            {
                msgsetloc(0, "I screwed up&making this&Dark World./%", "obj_sound_of_justice_enemy_slash_Step_0_gml_204_0");
                ballooncon = 6.1;
                balloonend = 0;
            }
            else if (ballooncon == 6.1)
            {
                msgsetloc(0, "Trying to...&See him again.&Even though he's&already.../%", "obj_sound_of_justice_enemy_slash_Step_0_gml_205_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 7)
            {
                msgsetloc(0, "We can bring you&to our Castle Town!/%", "obj_sound_of_justice_enemy_slash_Step_0_gml_207_0");
                ballooncon = 7.1;
                balloonend = 0;
            }
            else if (ballooncon == 7.1)
            {
                msgsetloc(0, "If we bring you&there, you'll be...&You'll be all better!/%", "obj_sound_of_justice_enemy_slash_Step_0_gml_208_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 8)
            {
                msgsetloc(0, "And you...&don't have&to hurt us!/%", "obj_sound_of_justice_enemy_slash_Step_0_gml_210_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 9)
            {
                msgsetloc(0, "If Ralsei shows up,&he can use Pacify,&right, Kris!?/%", "obj_sound_of_justice_enemy_slash_Step_0_gml_212_0");
                ballooncon = 9.1;
                balloonend = 0;
            }
            else if (ballooncon == 9.1)
            {
                msgsetloc(0, "All we have to do...&is wait for the old&man... to get tired.../%", "obj_sound_of_justice_enemy_slash_Step_0_gml_213_0");
                ballooncon = 0;
                balloonend = 1;
            }
            talked = 0.7;
            global.typer = 75;
            scr_heroblcon("susie");
            susieripple = 1;
            alarm[6] = 1;
        }
    }
    if (talked == 1 && scr_isphase("enemytalk"))
    {
        talktimer++;
        if ((button3_p() && talktimer > 15) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            global.mnfight = 1.5;
        }
    }
    if (global.mnfight == 1.5)
    {
        if (!instance_exists(obj_growtangle))
            instance_create(camerax() + (camerawidth() / 2), cameray() + (cameraheight() / 2), obj_growtangle);
        with (obj_battlecontroller)
            depth = obj_growtangle.depth + 2;
        with (obj_growtangle)
            depth = obj_gerson_darkness_overlay.depth + 2;
        if (!instance_exists(obj_moveheart) && !instance_exists(obj_heart))
            scr_moveheart();
        scr_turntimer(90);
        with (obj_gerson_darkness_overlay)
            con = 1;
        global.mnfight = 2;
        mus_volume(global.batmusic[1], 0.6, 60);
        mus_volume(global.batmusic[3], 0.6, 30);
    }
    if (scr_isphase("bullets") && attacked == 0)
    {
        rtimer += 1;
        if (rtimer == 12)
        {
            attackcon = 1;
            scr_turntimer(999);
            global.typer = 6;
            global.fc = 0;
            rr = choose(0, 0);
            if (rr == 0)
                global.battlemsg[0] = stringsetloc("* The air crackles with sound.", "obj_sound_of_justice_enemy_slash_Step_0_gml_264_0");
            attacked = 1;
        }
    }
    if (global.mnfight == 2 && global.turntimer < 1 && bulletphaseend == false)
    {
        if (phase == 1 && turns == 4)
        {
            phase = 2;
            intermission1_con = 1;
            intermission1_timer = 0;
        }
        if (turns == 9)
            endingcon = 1;
        if (turns == 1)
        {
            snd_free(global.batmusic[2]);
            global.batmusic[2] = snd_init("statue_level2.ogg");
            global.batmusic[3] = mus_loop(global.batmusic[2]);
            mus_volume(global.batmusic[3], 0.6, 0);
            mus_volume(global.batmusic[3], 1, 10);
        }
        if (turns == 2)
        {
            snd_free(global.batmusic[2]);
            global.batmusic[2] = snd_init("statue_level3.ogg");
            global.batmusic[3] = mus_loop(global.batmusic[2]);
            mus_volume(global.batmusic[3], 0.6, 0);
            mus_volume(global.batmusic[3], 1, 10);
        }
        if (turns == 3)
        {
            snd_free(global.batmusic[2]);
            global.batmusic[2] = snd_init("statue_level4.ogg");
            global.batmusic[3] = mus_loop(global.batmusic[2]);
            mus_volume(global.batmusic[3], 0.6, 0);
            mus_volume(global.batmusic[3], 1, 10);
        }
        if (turns == 5)
        {
            snd_free(global.batmusic[2]);
            global.batmusic[2] = snd_init("statue2_level2.ogg");
            global.batmusic[3] = mus_loop(global.batmusic[2]);
            mus_volume(global.batmusic[3], 0.6, 0);
            mus_volume(global.batmusic[3], 1, 10);
        }
        if (turns == 6)
        {
            snd_free(global.batmusic[2]);
            global.batmusic[2] = snd_init("statue2_level3.ogg");
            global.batmusic[3] = mus_loop(global.batmusic[2]);
            mus_volume(global.batmusic[3], 0.6, 0);
            mus_volume(global.batmusic[3], 1, 10);
        }
        if (turns == 7)
        {
            snd_free(global.batmusic[2]);
            global.batmusic[2] = snd_init("statue2_level4.ogg");
            global.batmusic[3] = mus_loop(global.batmusic[2]);
            mus_volume(global.batmusic[3], 0.6, 0);
            mus_volume(global.batmusic[3], 1, 10);
        }
        if (turns == 8)
        {
            snd_free(global.batmusic[2]);
            global.batmusic[2] = snd_init("statue2_level5.ogg");
            global.batmusic[3] = mus_loop(global.batmusic[2]);
            mus_volume(global.batmusic[3], 0.6, 0);
            mus_volume(global.batmusic[3], 1, 10);
        }
        track_pos = audio_sound_get_track_position(global.batmusic[1]);
        audio_sound_set_track_position(global.batmusic[3], track_pos);
        mus_volume(global.batmusic[1], 1, 10);
        with (obj_gerson_darkness_overlay)
            scalecon = 2;
        with (obj_growtangle)
            growcon = 3;
        with (obj_heart)
        {
            instance_create(x, y, obj_returnheart);
            instance_destroy();
        }
        bulletphaseend = true;
    }
}
if (global.myfight == 3)
{
    xx = __view_get(e__VW.XView, 0);
    yy = __view_get(e__VW.YView, 0);
    if (acting == 1 && actcon == 0)
    {
        actcon = 1;
        msgsetloc(0, "* (You talked... but nothing happened.)/%", "obj_sound_of_justice_enemy_slash_Step_0_gml_364_0");
        scr_battletext_default();
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
if (attackcon == 1 && !i_ex(obj_writer))
{
    if (attackcount < attackcountmax)
    {
        scr_spearshot(list_attackdirection[attackcount], list_attackspeed[attackcount], list_attackframes[attackcount], list_attackspecial[attackcount], list_attackspecial2[attackcount]);
        attackcon = 2;
    }
    else
    {
        attackcon = 3;
    }
    attackcount++;
}
if (attackcon == 2 && !i_ex(obj_gerson_growtangle))
{
    attacktimer++;
    if (attacktimer >= list_attackwait[attackcount - 1] && !i_ex(obj_writer))
    {
        attacktimer = 0;
        attackcon = 1;
    }
}
if (attackcon == 3 && global.turntimer > 10 && !i_ex(obj_spearshot))
{
    global.turntimer = 10;
    attackcon = 0;
}
if (scr_debug && scr_debug_keycheck(ord("V")) && scr_isphase("bullets"))
    event_user(14);
if (attackcon == 0)
    obj_battlecontroller.depth = savebattlecontrollerdepth;
if (intermission1_con == 1)
{
    if (i_ex(obj_dw_churchb_nongerson))
        obj_dw_churchb_nongerson.savetension = global.tension;
    if (i_ex(obj_dw_churchb_nongerson))
        obj_dw_churchb_nongerson.attackpattern_save = attackpattern;
    intermission1_con = 0;
    with (obj_battlecontroller)
        skipvictory = 1;
    scr_wincombat();
}
if (kris_phase2_try_attack_con == 5)
{
    intermission1_timer = 0;
    kris_phase2_try_attack_con = 0;
    turns = 4;
    phase = 2;
    global.tension = 0;
}
if (susie_phase2_try_attack_con == 1 && kris_phase2_try_attack_con == 1)
{
    susie_phase2_try_attack_con = 0;
    susie_phase2_try_attack_con = 2;
}
if (susie_phase2_try_attack_con == 1 && scr_isphase("enemytalk") && talked == 0 && endingcon == 0)
{
    susie_phase2_try_attack_timer++;
    if (susie_phase2_try_attack_timer == 1)
    {
        msgsetloc(0, "You want me to...&huh!?/%", "obj_sound_of_justice_enemy_slash_Step_0_gml_449_0");
        global.typer = 75;
        scr_heroblcon("susie");
        susieripple = 1;
    }
    if ((button3_p() && susie_phase2_try_attack_timer > 16) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        susie_phase2_try_attack_con = 2;
        susie_phase2_try_attack_timer = 0;
        msgsetloc(0, "What the hell?&I'm not doing that!/%", "obj_sound_of_justice_enemy_slash_Step_0_gml_462_0");
        global.typer = 75;
        scr_heroblcon("susie");
        susieripple = 1;
    }
}
if (susie_phase2_try_attack_con == 2)
{
    susie_phase2_try_attack_timer++;
    if ((button3_p() && susie_phase2_try_attack_timer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        susie_phase2_try_attack_con = 0;
        susie_phase2_try_attack_timer = 0;
        with (obj_battlecontroller)
            disablesusieattack = 1;
    }
}
if (kris_phase2_try_attack_con == 1)
    global.faceaction[1] = 0;
if (kris_phase2_try_attack_con == 1 && scr_isphase("enemytalk") && talked == 0 && endingcon == 0)
{
    kris_phase2_try_attack_timer++;
    if (kris_phase2_try_attack_timer == 1)
        krisattackcount++;
    if (krisattackcount == 1)
    {
        if (kris_phase2_try_attack_timer == 1)
        {
            msgsetloc(0, "K-Kris!? Kris,&what the hell are you doing?!/%", "obj_sound_of_justice_enemy_slash_Step_0_gml_494_0");
            global.typer = 75;
            scr_heroblcon("susie");
            susieripple = 1;
        }
        if ((button3_p() && kris_phase2_try_attack_timer > 16) || !i_ex(obj_writer))
        {
            with (obj_writer)
                instance_destroy();
            kris_phase2_try_attack_con = 2;
            kris_phase2_try_attack_timer = 0;
            msgsetloc(0, "Th... That's&the old man!/%", "obj_sound_of_justice_enemy_slash_Step_0_gml_507_0");
            global.typer = 75;
            scr_heroblcon("susie");
            susieripple = 1;
        }
    }
    if (krisattackcount > 1)
    {
        if (kris_phase2_try_attack_timer == 1)
        {
            msgsetloc(0, "* (You try to attack...)/", "obj_sound_of_justice_enemy_slash_Step_0_gml_518_0");
            msgnextloc("* (... But Susie stood in your way!)/%", "obj_sound_of_justice_enemy_slash_Step_0_gml_519_0");
            scr_battletext_default();
            kris_phase2_try_attack_con = 2;
            kris_phase2_try_attack_timer = 0;
        }
    }
}
if (kris_phase2_try_attack_con == 2)
{
    kris_phase2_try_attack_timer++;
    if ((button3_p() && kris_phase2_try_attack_timer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        kris_phase2_try_attack_con = 0;
        kris_phase2_try_attack_timer = 0;
    }
}
if (endingcon == 1 && introcon == 0)
{
    endingtimer++;
    global.charturn = 2;
    if (endingtimer == 1)
    {
        with (obj_heroparent)
            showdarkness = false;
        if (i_ex(obj_gerson_darkness_overlay))
            obj_gerson_darkness_overlay.scalecon = 3;
    }
    if (endingtimer == 60)
    {
        msgsetloc(0, "Screw it! Old man.../%", "obj_sound_of_justice_enemy_slash_Step_0_gml_555_0");
        global.typer = 75;
        scr_heroblcon("susie");
        with (obj_battleblcon)
            x += 12;
        scr_battle_sprite_set("susie", spr_susie_attackready, 0.5, true);
        with (obj_herosusie)
            scr_shakeobj();
        susieripple = 1;
    }
    if ((button3_p() && endingtimer >= 60 && endingtimer > 75) || (!i_ex(obj_writer) && endingtimer >= 60))
    {
        with (obj_writer)
            instance_destroy();
        endingcon = 2;
        endingtimer = 0;
        msgsetloc(0, "If it's really&you, I know.../%", "obj_sound_of_justice_enemy_slash_Step_0_gml_574_0");
        global.typer = 75;
        scr_heroblcon("susie");
        with (obj_battleblcon)
            x += 12;
        susieripple = 1;
    }
}
if (endingcon == 2)
{
    global.charturn = 2;
    endingtimer++;
    if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        endingcon = 3;
        endingtimer = 0;
        msgsetloc(0, "I know something&you've gotta recognize!/%", "obj_sound_of_justice_enemy_slash_Step_0_gml_594_0");
        global.typer = 75;
        scr_heroblcon("susie");
        with (obj_battleblcon)
            x += 12;
        susieripple = 1;
    }
}
if (endingcon == 3)
{
    endingtimer++;
    if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        endingcon = 4;
        endingtimer = 0;
        mus_volume(global.batmusic[1], 0, 90);
        mus_volume(global.batmusic[3], 0, 90);
    }
}
if (endingcon == 4)
{
    endingtimer++;
    if (endingtimer == 1)
    {
        obj_herosusie.x -= 35;
        obj_herosusie.y -= 28;
        scr_battle_sprite_set("susie", spr_susie_heal_green_palette_charge, 0.5, false);
        light1 = instance_create(camerax() + 105, cameray() + 211, obj_gerson_darkness_overlay_light);
        with (obj_gerson_darkness_overlay_light)
        {
            scr_lerpvar("image_xscale", 0, 1, 60);
            scr_lerpvar("image_yscale", 0, 1, 60);
        }
    }
    if (endingtimer == 14)
    {
        scr_battle_sprite_set("susie", spr_susie_heal_green_palette_charge_loop, 0.5, true);
        var snd = snd_loop(snd_chargeshot_charge);
        snd_volume(snd, 0, 0);
        snd_volume(snd, 0.2, 30);
    }
    if (endingtimer == 51)
    {
        msgsetloc(0, "Heheh...&see this?!/%", "obj_sound_of_justice_enemy_slash_Step_0_gml_646_0");
        global.typer = 75;
        var heroballoon = scr_enemyblcon(obj_herosusie.x + 100 + 20, obj_herosusie.y + 40 + 42, 10);
        heroballoon.side = -1;
        susieripple = 1;
        endingcon = 6;
        endingtimer = 0;
    }
}
if (endingcon == 6)
{
    endingtimer++;
    if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        endingcon = 7;
        endingtimer = 0;
        msgsetloc(0, "You didn't forget my&green sparkles, did you!?/%", "obj_sound_of_justice_enemy_slash_Step_0_gml_667_0");
        global.typer = 75;
        var heroballoon = scr_enemyblcon(obj_herosusie.x + 100 + 20, obj_herosusie.y + 40 + 42, 10);
        heroballoon.side = -1;
        susieripple = 1;
    }
}
if (endingcon == 7)
{
    endingtimer++;
    if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        endingcon = 8;
        endingtimer = 0;
    }
}
if (endingcon == 8)
{
    endingtimer++;
    if (endingtimer == 1)
        scr_battle_sprite_set("susie", spr_susie_heal_green_palette_charge_end, 0.5, false);
    if (endingtimer == 3)
    {
        light1.x += 45;
        light1.y -= 21;
    }
    if (endingtimer == 6)
    {
        inst = instance_create(obj_herosusie.x + 86, obj_herosusie.y + 60, obj_susie_heal_projectile);
        inst.gravity = 1;
        inst.gravity_direction = 0;
        inst.image_xscale = 3;
        inst.image_yscale = 3;
        inst.image_speed = 1;
        snd_stop(snd_chargeshot_charge);
        snd_play_x(snd_heartshot_dr_b, 0.4, 0.4);
        scr_battle_sprite_set("susie", spr_susie_heal_green_palette_charge_heal_loop, 0.5, true);
    }
    if (endingtimer == 7)
    {
    }
    if (endingtimer == 28)
    {
    }
    if (endingtimer == 31)
    {
        with (obj_susie_heal_projectile)
        {
            anim = instance_create(x + 30 + 12, y + 9, obj_animation);
            anim.sprite_index = spr_sound_of_justice_heal;
            anim.image_xscale = 2;
            anim.image_yscale = 2;
            light2 = instance_create(x + 30 + 12, y + 9, obj_gerson_darkness_overlay_light);
            light2.image_xscale = 5;
            light2.image_yscale = 5;
            with (light2)
            {
                scr_lerpvar("image_xscale", 0, 5, 1);
                scr_lerpvar("image_yscale", 0, 5, 1);
                scr_lerpvar("image_alpha", 0, 1, 4);
            }
        }
        lightupcon = 1;
        snd_play(snd_power);
    }
    if (endingtimer == 32)
    {
        with (obj_susie_heal_projectile)
            instance_destroy();
    }
    if (endingtimer == 59)
    {
        obj_herosusie.x = obj_herosusie.xstart;
        obj_herosusie.y = obj_herosusie.ystart;
        scr_battle_sprite_set("susie", spr_susie_hurt_green, 0.5, true);
        obj_herosusie.x += 25;
        with (obj_herosusie)
            scr_shakeobj();
        snd_play(snd_sussurprise);
    }
    if (endingtimer == 102)
    {
        with (obj_gerson_darkness_overlay_light)
        {
            scr_lerpvar("image_xscale", image_xscale, 0, 15);
            scr_lerpvar("image_yscale", image_yscale, 0, 15);
            scr_lerpvar("image_alpha", 1, 0, 15);
        }
    }
    if (endingtimer == 135)
    {
        with (obj_writer)
            instance_destroy();
        endingcon = 9;
        endingtimer = 0;
        msgsetloc(0, "Wh...&What the hell.../%", "obj_sound_of_justice_enemy_slash_Step_0_gml_791_0");
        global.typer = 75;
        scr_heroblcon("susie");
        susieripple = 1;
    }
}
if (endingcon == 9)
{
    endingtimer++;
    if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        endingcon = 10;
        endingtimer = 0;
        msgsetloc(0, "What happened&to his.../%", "obj_sound_of_justice_enemy_slash_Step_0_gml_808_0");
        global.typer = 75;
        scr_heroblcon("susie");
        susieripple = 1;
    }
}
if (endingcon == 10)
{
    endingtimer++;
    if ((button3_p() && endingtimer > 15) || !i_ex(obj_writer))
    {
        with (obj_writer)
            instance_destroy();
        endingcon = 11;
        endingtimer = 179;
    }
}
if (endingcon == 11)
{
    endingtimer++;
    if (endingtimer == 2)
    {
        inst = instance_create(x - 5, y + 4, obj_gerson_green_switch);
        inst.type = 1;
        ralseimarker.sprite_index = spr_ralsei_walk_left_unhappy;
        ralseimarker.image_speed = 1/3;
        ralseimarker.image_xscale = -2;
        ralseimarker.image_yscale = 2;
        ralseimarker.x = camerax() + camerawidth() + 50;
        ralseimarker.y = cameray() + 210;
        ralseimarker.hspeed -= 12;
    }
    if (endingtimer == 6)
    {
        ralseimarker.sprite_index = spr_ralsei_attack;
        ralseimarker.image_speed = 0.5;
        ralseimarker.hspeed = 0;
    }
    if (endingtimer == 8)
    {
        snd_play(snd_damage);
        scr_shakeobj();
        attack = instance_create(global.monsterx[global.chartarget[myself]] + random(6), global.monstery[global.chartarget[myself]] + random(6), obj_basicattack);
    }
    if (endingtimer == 14)
        ralseimarker.sprite_index = spr_ralsei_idle;
    if (endingtimer == 22)
    {
        with (obj_gerson_green_switch)
            instance_destroy();
        state = 14;
        state14con = 3;
    }
    if (endingtimer == 180)
    {
        endingcon = 0;
        with (obj_battlecontroller)
            skipvictory = 1;
        scr_wincombat();
    }
}
if (redflashcon > 0 || growtangleredcon > 0)
{
    with (obj_spearshot)
        instance_destroy();
}
if (redflashcon == 1)
{
    redflashtimer++;
    if (redflashtimer == 1)
        snd_play(snd_gerlaugh_distort);
    if (redflashtimer == 1)
    {
        inst = instance_create(x, y, obj_gerson_gradient_telegraph);
        inst.image_alpha = 1;
        inst.image_blend = c_red;
        inst.side = "left";
        inst = instance_create(x, y, obj_gerson_gradient_telegraph);
        inst.image_alpha = 1;
        inst.image_blend = c_red;
        inst.side = "right";
        growtangleredtimer = 0;
        growtangleredcon = 1;
    }
    if (redflashtimer == 11)
    {
        inst = instance_create(x, y, obj_gerson_gradient_telegraph);
        inst.image_alpha = 1;
        inst.image_blend = c_red;
        inst.side = "down";
        inst = instance_create(x, y, obj_gerson_gradient_telegraph);
        inst.image_alpha = 1;
        inst.image_blend = c_red;
        inst.side = "up";
    }
    if (redflashtimer == 21)
    {
        inst = instance_create(x, y, obj_gerson_gradient_telegraph);
        inst.image_alpha = 1;
        inst.image_blend = c_red;
        inst.side = "left";
        inst = instance_create(x, y, obj_gerson_gradient_telegraph);
        inst.image_alpha = 1;
        inst.image_blend = c_red;
        inst.side = "right";
        redflashcon = 0;
        redflashtimer = 0;
    }
}
if (growtangleredcon == 1)
{
    growtangleredtimer++;
    if (growtangleredtimer == 3)
    {
    }
    if (growtangleredtimer == 6)
    {
        growtangleredcon = 2;
        _inst = instance_create(obj_growtangle.x + 0, obj_growtangle.y - 70, obj_gerson_swing_down_new);
        _inst.image_angle = 0;
        _inst.direction = 270;
        _inst.gravity_direction = 270;
    }
}
if (growtangleredcon == 2)
{
    if (global.turntimer < 2)
        growtangleredcon = 3;
}
if (growtangleredcon == 3)
{
    growtangleredtimer--;
    if (growtangleredtimer == 0)
    {
        growtangleredtimer = 0;
        growtangleredcon = 0;
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
