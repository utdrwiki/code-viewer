if (susinit == 0)
{
    with (obj_herosusie_ch1)
    {
        idlesprite = spr_susieb_idle_serious_ch1
        attacksprite = spr_susieb_attack_serious_ch1
    }
    susinit = 1
}
if (global.monster[myself] == true)
{
    global.flag[(51 + myself)] = 4
    if (global.mnfight == 1 && talked == false)
    {
        if (!instance_exists(obj_darkener_ch1))
            instance_create_ch1(0, 0, obj_darkener_ch1)
        global.typer = 50
        global.msg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_25_0")
        blcontype = 3
        if (kturn == 0)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_27_0")
        if (kturn == 1)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_28_0")
            blcontype = 8
        }
        if (kturn == 2)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_29_0")
        if (kturn == 3)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_30_0")
        if (kturn == 4)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_31_0")
        if (kturn == 5)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_32_0")
            blcontype = 8
        }
        if (kturn == 6)
        {
            blcontype = 8
            global.msg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_36_0")
            global.msg[1] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_37_0")
        }
        if (kturn == 7)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_39_0")
        if (kturn == 8)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_40_0")
            global.msg[1] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_41_0")
            blcontype = 8
        }
        if (kturn == 9)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_43_0")
        if (kturn == 10)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_44_0")
            global.msg[1] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_45_0")
        }
        if (kturn == 11)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_46_0")
        if (kturn == 12)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_47_0")
        if (kturn == 13)
            global.msg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_48_0")
        if (kturn >= 14)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_49_0")
            battlecancel = 2
        }
        kturn += 1
        if (kturn <= 11)
            attack = kturn
        else
        {
            if (kturn == 12)
                attack = 7
            if (kturn == 13)
                attack = 8
            if (kturn == 14)
                attack = 10
            if (kturn == 15)
                attack = 9
            if (kturn == 16)
                attack = 7
            if (kturn == 17)
                attack = 11
            if (kturn >= 18)
                attack = 11
            if (global.monsterdf[myself] > -25)
                global.monsterdf[myself] -= 5
        }
        target_randomly = 1
        if (attack == 2 || attack == 5 || attack == 10 || attack == 11)
            scr_targetall_ch1()
        else
            scr_randomtarget_ch1()
        scr_enemyblcon_ch1((x - 160), y, blcontype)
        talked = true
        talktimer = 0
    }
    if (talked == true && global.mnfight == 1)
    {
        rtimer = 0
        scr_blconskip_ch1(-1)
    }
    if (global.mnfight == 2 && attacked == false)
    {
        rtimer += 1
        if (rtimer == 12)
        {
            talktimer = 0
            global.turntimer = 180
            event_user(5)
            turns += 1
            attacked = true
            global.typer = 6
            global.fc = 0
            rr = choose(0, 1, 2, 3)
            if (rr == 0)
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_104_0")
            if (rr == 1)
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_105_0")
            if (rr == 2)
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_106_0")
            if (rr == 3)
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_107_0")
            if (global.monsterhp[myself] <= (global.monstermaxhp[myself] / 4))
                global.battlemsg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_110_0")
        }
        else
            global.turntimer = 120
    }
    if (global.mnfight == 2)
    {
        if (global.turntimer <= 1)
        {
            if (battlecancel == 1)
                global.mercymod[myself] = 999
            if (battlecancel == 2)
            {
                with (obj_battlecontroller_ch1)
                    noreturn = true
                con = 1
                battlecancel = 3
            }
        }
    }
}
if (con == 1)
    con = 4
if (con == 4 && (!instance_exists(obj_writer_ch1)))
{
    con = 5
    alarm[4] = 15
    with (obj_battlecontroller_ch1)
        alarm[2] = 17
}
if (con == 6)
{
    with (obj_battlecontroller_ch1)
        noreturn = false
    global.flag[247] = 1
    scr_monsterdefeat_ch1()
    event_user(10)
    instance_destroy()
    con = 7
}
if (global.myfight == 3)
{
    xx = __view_get((0 << 0), 0)
    yy = __view_get((1 << 0), 0)
    if (acting == true && actcon == 0)
    {
        actcon = 1
        global.msg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_169_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_170_0")
        scr_battletext_default_ch1()
    }
    if (acting == 2 && actcon == 0)
    {
        if (global.tempflag[5] == 0)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_180_0")
            scr_kingface_ch1(1, 5)
            global.msg[2] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_182_0")
            global.msg[3] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_183_0")
            global.msg[4] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_184_0")
            scr_noface_ch1(5)
            global.msg[6] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_186_0")
            global.tempflag[5] = 1
            global.canact[myself][1] = true
            global.actactor[myself][1] = 1
            global.actname[myself][1] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_192_0")
            global.actdesc[myself][1] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_193_0")
            global.actcost[myself][1] = 62
        }
        else
        {
            snd_play_ch1(snd_power_ch1)
            with (obj_heroparent_ch1)
            {
                __of = scr_oflash_ch1()
                __of.flashcolor = c_orange
            }
            global.msg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_201_0")
            tempattack = 0.8
        }
        scr_battletext_default_ch1()
        actcon = 1
    }
    if (acting == 3 && actcon == 0)
    {
        if (global.tempflag[6] == 0)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_214_0")
            scr_susface_ch1(1, 1)
            global.msg[2] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_216_0")
            global.msg[3] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_217_0")
            global.msg[4] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_218_0")
            scr_kingface_ch1(5, 0)
            global.msg[6] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_220_0")
            global.msg[7] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_221_0")
            scr_susface_ch1(8, "C")
            global.msg[9] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_223_0")
            global.msg[10] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_224_0")
            scr_noface_ch1(11)
            global.msg[12] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_226_0")
            global.tempflag[6] = 1
            global.canact[myself][2] = true
            global.actactor[myself][2] = 2
            global.actname[myself][2] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_232_0")
            global.actdesc[myself][2] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_233_0")
            global.actcost[myself][2] = 150
            actcon = 1
        }
        else
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_241_0")
            actcon = 10
        }
        scr_battletext_default_ch1()
        acttimer = 0
    }
    if (acting == 4 && actcon == 0)
    {
        if (global.tempflag[7] == 0)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_254_0")
            scr_ralface_ch1(1, "B")
            global.msg[2] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_256_0")
            global.msg[3] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_257_0")
            global.msg[4] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_258_0")
            scr_kingface_ch1(5, 6)
            global.msg[6] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_260_0")
            global.msg[7] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_261_0")
            global.msg[8] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_262_0")
            scr_ralface_ch1(9, 8)
            global.msg[10] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_264_0")
            scr_noface_ch1(11)
            global.msg[12] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_266_0")
            scr_battletext_default_ch1()
            global.tempflag[7] = 1
            global.canact[myself][3] = true
            global.actactor[myself][3] = 3
            global.actname[myself][3] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_273_0")
            global.actdesc[myself][3] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_274_0")
            global.actcost[myself][3] = 125
            actcon = 1
        }
        else
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_king_boss_slash_Step_0_gml_282_0")
            scr_battletext_default_ch1()
            actcon = 20
        }
        acttimer = 0
    }
    if (actcon == 10)
    {
        acttimer += 1
        if (acttimer >= 10 || (!instance_exists(obj_writer_ch1)))
        {
            acttimer = 0
            actcon = 11
        }
    }
    if (actcon == 11)
    {
        global.faceaction[1] = 2
        global.charaction[1] = 2
        global.charspecial[1] = 5
        global.chartarget[1] = 0
        global.acting[1] = false
        snd_play_ch1(snd_boost_ch1)
        heartanim = instance_create_ch1((obj_herokris_ch1.x + 30), (obj_herokris_ch1.y + 50), obj_animation_ch1)
        with (heartanim)
        {
            depth = -20
            image_index = 0
            image_xscale = 2
            image_yscale = 2
            image_speed = 1
            sprite_index = spr_soulshining_ch1
        }
        with (obj_herokris_ch1)
            scr_oflash_ch1()
        with (obj_herosusie_ch1)
            scr_oflash_ch1()
        actcon = 12
    }
    if (actcon == 12)
    {
        acttimer += 1
        if (acttimer >= 20)
        {
            actcon = 1
            with (obj_herosusie_ch1)
                state = 0
        }
    }
    if (actcon == 20)
    {
        acttimer += 1
        if (acttimer >= 10 || (!instance_exists(obj_writer_ch1)))
        {
            acttimer = 0
            actcon = 21
        }
    }
    if (actcon == 21)
    {
        global.faceaction[2] = 2
        global.charaction[2] = 2
        global.charspecial[2] = 6
        global.chartarget[2] = 0
        global.acting[2] = false
        snd_play_ch1(snd_boost_ch1)
        heartanim = instance_create_ch1((obj_herokris_ch1.x + 30), (obj_herokris_ch1.y + 50), obj_animation_ch1)
        with (heartanim)
        {
            depth = -20
            image_index = 0
            image_xscale = 2
            image_yscale = 2
            image_speed = 1
            sprite_index = spr_soulshining_ch1
        }
        with (obj_heroralsei_ch1)
            scr_oflash_ch1()
        with (obj_herokris_ch1)
            scr_oflash_ch1()
        actcon = 22
    }
    if (actcon == 22)
    {
        acttimer += 1
        if (acttimer >= 20)
        {
            actcon = 1
            with (obj_heroralsei_ch1)
                state = 0
        }
    }
    if (actcon == 1 && (!instance_exists(obj_writer_ch1)))
    {
        actcon = 0
        scr_attackphase_ch1()
    }
}
if (global.myfight == 7)
    hspeed = 15
if (!instance_exists(obj_shake_ch1))
{
    __view_set((0 << 0), 0, remxx)
    __view_set((1 << 0), 0, remyy)
}
