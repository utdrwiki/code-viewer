if (mcon == 3)
{
    global.currentsong[0] = snd_init_ch1("basement.ogg")
    global.currentsong[1] = mus_loop_ch1(global.currentsong[0])
    mcon = 4
}
if (mcon == 2)
{
    snd_free_all_ch1()
    mcon = 3
}
if (mcon == 1)
    mcon = 2
if (con == 1)
{
    diamond = scr_dark_marker_ch1((x + 80), (y - 47), spr_diamond_knight_overworld_ch1)
    puzzwall = scr_dark_marker_ch1(1000, 0, spr_jailwall_ch1)
    __view_set((0 << 0), 0, 200)
    global.interact = 1
    image_speed = 0
    with (obj_mainchara_ch1)
        visible = false
    with (obj_mainchara_ch1)
        cutscene = true
    global.encounterno = 20
    scr_encountersetup_ch1(global.encounterno)
    s = scr_dark_marker_ch1(500, (__view_get((1 << 0), 0) - 20), spr_susied_dark_unhappy_ch1)
    with (s)
    {
        scr_depth_ch1()
        vspeed = 5
        image_speed = 0.25
    }
    con = 2
}
if (con == 2)
{
    global.interact = 1
    if (s.y >= (global.heromakey[0] - 4))
    {
        with (s)
        {
            scr_halt_ch1()
            y = global.heromakey[0]
        }
        con = 3
        alarm[4] = 30
    }
}
if (con == 4)
{
    global.fc = 1
    global.typer = 30
    global.fe = 0
    global.msc = 310
    scr_text_ch1(global.msc)
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 150
}
if (con == 150)
{
    if (global.msc == 311)
    {
        with (s)
            sprite_index = spr_susieu_dark_ch1
    }
}
if (con == 150 && (!d_ex_ch1()))
{
    with (s)
        sprite_index = spr_susiel_dark_unhappy_ch1
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_79_0")
    con = 151
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 151 && (!d_ex_ch1()))
{
    scr_pan_ch1(-5, 0, 30)
    with (s)
    {
        hspeed = -5
        image_speed = 0.25
    }
    con = 152
    alarm[4] = 30
}
if (con == 153)
{
    with (s)
        scr_halt_ch1()
    con = 154
    alarm[4] = 30
}
if (con == 155)
{
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_105_0")
    con = 160
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    rep = 0
}
if (con == 160 && (!d_ex_ch1()))
{
    with (s)
        sprite_index = spr_susier_dark_unhappy_ch1
    exc = instance_create_ch1((s.x + 20), (s.y - 20), obj_excblcon_ch1)
    con = 161
}
if (con == 162)
    con = 163
if (con == 161)
{
    rep += 1
    snd_play_ch1(snd_txtlan_ch1)
    con = 162
}
if (con == 163)
{
    if (rep <= 20)
        con = 161
    else
    {
        con = 164
        with (exc)
            instance_destroy()
    }
}
if (con == 164)
{
    global.fe = 9
    global.fc = 1
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_147_0")
    con = 165
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 165 && (!d_ex_ch1()))
{
    scr_pan_ch1(10, 0, 50)
    with (s)
    {
        sprite_index = spr_susier_dark_unhappy_ch1
        image_speed = 0.25
        hspeed = 10
    }
    con = 166
    alarm[4] = 50
}
if (con == 167)
{
    with (s)
        scr_halt_ch1()
    con = 168
    alarm[4] = 30
}
if (con == 169)
{
    with (s)
        sprite_index = spr_susieu_dark_ch1
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_175_0")
    con = 170
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 170 && (!d_ex_ch1()))
{
    with (s)
        sprite_index = spr_susiel_dark_unhappy_ch1
    con = 171
    alarm[4] = 15
}
if (con == 172)
{
    global.fe = 0
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_190_0")
    con = 174
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 174 && (!d_ex_ch1()))
{
    global.typer = 32
    global.fc = 0
    with (s)
        sprite_index = spr_susier_dark_unhappy_ch1
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_200_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 175
}
if (con == 175 && (!d_ex_ch1()))
{
    global.fc = 1
    global.typer = 30
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_209_0")
    con = 176
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 176 && (!d_ex_ch1()))
{
    con = 177
    alarm[4] = 30
}
if (con == 178)
{
    with (s)
        sprite_index = spr_susieu_dark_ch1
    con = 179
    alarm[4] = 30
}
if (con == 180)
{
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_232_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 181
}
if (con == 181 && (!d_ex_ch1()))
{
    con = 182
    alarm[4] = 20
}
if (con == 183)
{
    snd_play_ch1(snd_noise_ch1)
    with (puzz1)
        event_user(2)
    con = 184
    alarm[4] = 60
}
if (con == 185)
{
    snd_play_ch1(snd_noise_ch1)
    with (puzz1)
        event_user(3)
    con = 186
    alarm[4] = 40
}
if (con == 187)
{
    snd_play_ch1(snd_noise_ch1)
    with (puzz1)
        event_user(2)
    con = 188
    alarm[4] = 5
}
if (con == 189)
{
    snd_free_all_ch1()
    instance_create_ch1(0, 0, obj_shake_ch1)
    snd_play_ch1(snd_locker_ch1)
    with (puzzwall)
        instance_destroy()
    with (s)
        sprite_index = spr_susier_dark_ch1
    con = 5
}
if (con == 5 && (!d_ex_ch1()))
{
    with (s)
        sprite_index = spr_susier_dark_ch1
    exc = instance_create_ch1((s.x + 20), (s.y - 20), obj_excblcon_ch1)
    con = 6
    alarm[4] = 30
}
if (con == 7)
{
    with (exc)
        instance_destroy()
    with (s)
    {
        hspeed = 6
        image_speed = 0.25
    }
    y = global.monstermakey[0]
    sprite_index = spr_lancer_rt_unhappy_ch1
    con = 8
}
if (con == 8)
{
    scr_encountersetup_ch1(global.encounterno)
    __view_set((0 << 0), 0, (__view_get((0 << 0), 0) + 10))
    if (x <= (global.monstermakex[0] + 5))
    {
        x = global.monstermakex[0]
        con = 11
        with (s)
            scr_halt_ch1()
    }
}
if (con == 11)
{
    with (s)
        sprite_index = spr_susier_dark_unhappy_ch1
    scr_encountersetup_ch1(global.encounterno)
    global.fc = 5
    global.fe = 6
    global.typer = 32
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_330_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_331_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_332_0")
    scr_susface_ch1(3, 0)
    global.msg[4] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_334_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 12
}
if (con == 12 && (!d_ex_ch1()))
{
    with (diamond)
        hspeed = 8
    sprite_index = spr_lancer_battle_hurt_ch1
    exc = instance_create_ch1((x + 20), (y - 20), obj_excblcon_ch1)
    con = 13
    alarm[4] = 30
}
if (con == 14)
{
    with (exc)
        instance_destroy()
    global.typer = 32
    global.fe = 12
    global.fc = 5
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_354_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_355_0")
    con = 15
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 15 && (!d_ex_ch1()))
{
    sprite_index = spr_lancer_battle_ch1
    with (s)
    {
        sprite_index = spr_susier_dark_unhappy_ch1
        hspeed = 4
        image_speed = 0.25
    }
    con = 16
    alarm[4] = 10
}
if (con == 17)
{
    with (s)
        scr_halt_ch1()
    con = 18
    alarm[4] = 20
}
if (con == 19)
{
    global.typer = 30
    global.fc = 1
    global.fe = 0
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_385_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_386_0")
    scr_lanface_ch1(2, "C")
    global.msg[3] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_388_0")
    global.msg[4] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_389_0")
    con = 20
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 20 && (!d_ex_ch1()))
{
    sprite_index = spr_lancer_rt_unhappy_ch1
    con = 21
    alarm[4] = 20
}
if (con == 22)
{
    global.fe = 6
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_407_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_408_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_409_0")
    global.msg[3] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_410_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 23
}
if (con == 23 && (!d_ex_ch1()))
{
    with (s)
    {
        hspeed = 4
        image_speed = 0.25
    }
    con = 24
    alarm[4] = 10
}
if (con == 25)
{
    with (s)
        scr_halt_ch1()
    con = 26
    alarm[4] = 40
}
if (con == 27)
{
    sprite_index = spr_lancer_battle_ch1
    global.typer = 30
    global.fc = 1
    global.fe = 9
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_440_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_441_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_442_0")
    global.msg[3] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_443_0")
    scr_lanface_ch1(4, "C")
    global.msg[5] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_445_0")
    con = 28
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 28 && (!d_ex_ch1()))
{
    with (s)
        sprite_index = spr_susiel_dark_unhappy_ch1
    con = 29
    alarm[4] = 70
}
if (con == 30)
{
    global.fc = 1
    global.fe = 12
    global.typer = 30
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_462_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_463_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_464_0")
    global.msg[3] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_465_0")
    global.msg[4] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_466_0")
    global.msg[5] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_467_0")
    global.msg[6] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_468_0")
    con = 31
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 31 && (!d_ex_ch1()))
{
    with (s)
    {
        hspeed = -2
        image_speed = 0.2
        sprite_index = spr_susiel_dark_unhappy_ch1
    }
    con = 30.5
    alarm[4] = 30
}
if (con == 31.5)
{
    with (s)
        scr_halt_ch1()
    con = 32
    alarm[4] = 50
}
if (con == 33)
{
    global.fe = 0
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_500_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_501_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 33.1
}
if (con == 33.1 && (!d_ex_ch1()))
{
    sprite_index = spr_lancer_battle_hurt_ch1
    with (s)
        sprite_index = spr_susier_dark_unhappy_ch1
    exc = instance_create_ch1((x + 50), (y - 30), obj_excblcon_ch1)
    con = 32.2
    alarm[4] = 30
    global.currentsong[0] = snd_init_ch1("tense.ogg")
    global.currentsong[1] = mus_loop_ch1(global.currentsong[0])
}
if (con == 33.2)
{
    sprite_index = spr_lancer_battle_ch1
    with (exc)
        instance_destroy()
    global.fc = 5
    global.fe = 12
    global.typer = 32
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_526_0")
    scr_susface_ch1(1, 2)
    global.msg[2] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_528_0")
    scr_lanface_ch1(3, "C")
    global.msg[4] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_530_0")
    scr_susface_ch1(5, 3)
    global.msg[6] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_532_0")
    con = 33.3
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 33.3 && (!d_ex_ch1()))
{
    with (s)
        sprite_index = spr_susier_dark_unhappy_ch1
    with (s)
    {
        image_speed = 0.1
        hspeed = 2
    }
    con = 32.4
    alarm[4] = 120
}
if (con == 33.4)
{
    with (s)
        scr_halt_ch1()
    con = 32.5
    alarm[4] = 30
}
if (con == 33.5)
{
    global.fe = 0
    global.fc = 1
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_560_0")
    scr_lanface_ch1(1, 5)
    global.msg[2] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_562_0")
    con = 34
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 34 && (!d_ex_ch1()))
{
    with (s)
        image_index = 1
    sprite_index = spr_lancer_battle_hurt_ch1
    snd_play_ch1(snd_impact_ch1)
    instance_create_ch1(0, 0, obj_shake_ch1)
    con = 35
    alarm[4] = 15
}
if (con == 36)
{
    with (s)
        scr_halt_ch1()
    con = 37
    alarm[4] = 20
}
if (con == 38)
{
    sprite_index = spr_lancer_battle_ch1
    image_index = 1
    global.fe = 3
    global.fc = 1
    global.typer = 30
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_595_0")
    scr_lanface_ch1(1, 5)
    global.msg[2] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_597_0")
    global.msg[3] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_598_0")
    con = 39
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 39 && (!d_ex_ch1()))
{
    with (s)
    {
        sprite_index = spr_susier_dark_laugh_ch1
        image_speed = 0.25
    }
    snd_play_ch1(snd_suslaugh_ch1)
    con = 40
    alarm[4] = 60
}
if (con == 41)
{
    with (s)
    {
        scr_halt_ch1()
        sprite_index = spr_susier_dark_ch1
    }
    global.fe = 2
    global.fc = 1
    global.typer = 30
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_627_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_628_0")
    con = 42
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 42 && (!d_ex_ch1()))
{
    with (s)
    {
        sprite_index = spr_susiel_dark_ch1
        hspeed = -3
        image_speed = 0.2
    }
    con = 43
}
if (con == 43)
{
    if (s.x <= (global.heromakex[0] + 2))
    {
        with (s)
            scr_halt_ch1()
        con = 44
        alarm[4] = 30
    }
}
if (con == 45)
{
    global.fe = 1
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_659_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 46
}
if (con == 46 && (!d_ex_ch1()))
{
    snd_free_all_ch1()
    with (s)
    {
        image_index = 0
        image_speed = 0.5
        sprite_index = spr_susieb_attack_ch1
    }
    snd_play_ch1(snd_laz_c_ch1)
    con = 47
    alarm[4] = 10
}
if (con == 48)
{
    with (s)
        image_speed = 0
    con = 48.1
    alarm[4] = 30
}
if (con == 49.1)
{
    global.currentsong[0] = snd_init_ch1("vs_susie.ogg")
    global.fe = 4
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_691_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 50
}
if (con == 50 && (!d_ex_ch1()))
{
    global.currentsong[1] = mus_loop_ext_ch1(global.currentsong[0], 0.9, 1)
    with (s)
        instance_destroy()
    global.encounterno = 20
    global.specialbattle = 0
    global.flag[9] = 0
    global.interact = 1
    con = 51
    scr_encountersetup_ch1(global.encounterno)
    x = global.monstermakex[0]
    y = global.monstermakey[0]
    instance_create_ch1(0, 0, obj_battlecontroller_ch1)
    visible = false
    hk = instance_create_ch1((__view_get((0 << 0), 0) + 640), (__view_get((1 << 0), 0) - 20), obj_herokris_ch1)
    with (hk)
        visible = false
    with (obj_mainchara_ch1)
        visible = false
}
if (con == 53)
{
    s = scr_dark_marker_ch1(obj_herosusie_ch1.x, obj_herosusie_ch1.y, spr_susieb_attack_serious_ch1)
    with (s)
    {
        scr_depth_ch1()
        image_index = 5
    }
    visible = true
    sprite_index = spr_lancer_battle_hurt_ch1
    global.fighting = false
    with (obj_battlecontroller_ch1)
        instance_destroy()
    with (obj_herosusie_ch1)
        instance_destroy()
    with (obj_herokris_ch1)
        instance_destroy()
    with (obj_tensionbar_ch1)
        instance_destroy()
    with (obj_lancerboss2_ch1)
        instance_destroy()
    with (obj_bulletparent_ch1)
        instance_destroy()
    with (black)
        instance_destroy()
    dm = instance_create_ch1((x + 30), (y + 40), obj_dmgwriter_ch1)
    dm.type = 1
    dm.damage = 0
    con = 54
    alarm[4] = 120
}
if (con == 55)
{
    sprite_index = spr_lancer_battle_ch1
    image_index = 0
    global.typer = 32
    global.fc = 5
    global.fe = 12
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_762_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_763_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 56
}
if (con == 56 && (!d_ex_ch1()))
{
    with (s)
        sprite_index = spr_susieb_defeat_ch1
    snd_play_ch1(snd_noise_ch1)
    con = 57
    alarm[4] = 45
}
if (con == 58)
{
    global.fe = 12
    global.fc = 1
    global.typer = 30
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_781_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_782_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_783_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 59
}
if (con == 59 && (!d_ex_ch1()))
{
    image_index = 1
    global.fc = 5
    global.typer = 32
    global.fe = 5
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_794_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_795_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_796_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 60
}
if (con == 60 && (!d_ex_ch1()))
{
    with (s)
        sprite_index = spr_susier_dark_unhappy_ch1
    snd_play_ch1(snd_noise_ch1)
    con = 61
    alarm[4] = 30
}
if (con == 62)
{
    global.typer = 30
    global.fc = 1
    global.fe = 12
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_814_0")
    scr_lanface_ch1(1, 5)
    global.msg[2] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_816_0")
    global.msg[3] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_817_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 63
}
if (con == 63 && (!d_ex_ch1()))
{
    with (s)
    {
        sprite_index = spr_susiel_dark_unhappy_ch1
        image_speed = 0.2
        hspeed = -2
    }
    con = 64
    alarm[4] = 10
}
if (con == 65)
{
    with (s)
        scr_halt_ch1()
    con = 66
    alarm[4] = 30
}
if (con == 67)
{
    global.typer = 30
    global.fc = 1
    global.fe = 12
    image_index = 0
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_849_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_850_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 68
}
if (con == 68 && (!d_ex_ch1()))
{
    with (s)
    {
        hspeed = 6
        sprite_index = spr_susier_dark_ch1
        image_speed = 0.25
    }
    con = 69
    alarm[4] = 20
}
if (con == 70)
{
    with (s)
        scr_halt_ch1()
    con = 71
    alarm[4] = 20
}
if (con == 72)
{
    global.fe = 0
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_878_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_879_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_880_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 73
}
if (con == 73 && (!d_ex_ch1()))
{
    with (s)
        sprite_index = spr_susier_dark_unhappy_ch1
    image_index = 1
    global.fc = 5
    global.typer = 32
    global.fe = 6
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_892_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_893_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 74
}
if (con == 74 && (!d_ex_ch1()))
{
    image_index = 0
    with (s)
    {
        sprite_index = spr_susier_dark_ch1
        hspeed = 12
        image_speed = 0.334
    }
    con = 75
    alarm[4] = 10
}
if (con == 76)
{
    with (s)
        scr_halt_ch1()
    con = 77
    alarm[4] = 20
}
if (con == 78)
{
    global.fc = 1
    global.typer = 30
    global.fe = 13
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_925_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_926_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_927_0")
    scr_lanface_ch1(3, 6)
    global.msg[4] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_929_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 79
}
if (con == 79 && (!d_ex_ch1()))
{
    con = 80
    alarm[4] = 30
}
if (con == 81)
{
    sprite_index = spr_lancer_lt_ch1
    global.fe = 3
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_944_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_945_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_946_0")
    global.msg[3] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_947_0")
    scr_susface_ch1(4, "D")
    global.msg[5] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_949_0")
    scr_lanface_ch1(6, 3)
    global.msg[7] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_951_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 82
}
if (con == 82 && (!d_ex_ch1()))
{
    sprite_index = spr_lancer_rt_ch1
    scr_depth_ch1()
    vspeed = 0
    hspeed = 1
    con = 85
    alarm[4] = 20
}
if (con == 86)
{
    scr_halt_ch1()
    con = 86.1
    alarm[4] = 30
}
if (con == 87.1)
{
    sprite_index = spr_lancer_rt_unhappy_ch1
    global.fe = 6
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_978_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 88
}
if (con == 88 && (!d_ex_ch1()))
{
    with (s)
        sprite_index = spr_susier_dark_unhappy_ch1
    con = 89
    alarm[4] = 20
}
if (con == 90)
{
    global.fc = 1
    global.typer = 30
    global.fe = 0
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_995_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 91
}
if (con == 91 && (!d_ex_ch1()))
{
    sprite_index = spr_lancer_lt_unhappy_ch1
    con = 92
    alarm[4] = 50
}
if (con == 93)
{
    global.fc = 5
    global.typer = 32
    global.fe = 6
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_1012_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_1013_0")
    scr_susface_ch1(2, 5)
    global.msg[3] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_1015_0")
    global.msg[4] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_1016_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 94
}
if (con == 94 && (!d_ex_ch1()))
{
    with (s)
        sprite_index = spr_susier_dark_ch1
    global.fc = 5
    global.typer = 32
    global.fe = 3
    sprite_index = spr_lancer_rt_ch1
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_1028_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 95
}
if (con == 95 && (!d_ex_ch1()))
{
    hspeed = 10
    con = 96
    alarm[4] = 60
}
if (con == 97)
{
    with (s)
        sprite_index = spr_susied_dark_unhappy_ch1
    global.fe = 12
    global.fc = 1
    global.typer = 30
    global.msg[0] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_1046_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_lancerbattle2_event_slash_Step_0_gml_1047_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 98
}
if (con == 98 && (!d_ex_ch1()))
{
    with (s)
    {
        sprite_index = spr_susier_dark_ch1
        hspeed = 10
        image_speed = 0.334
    }
    con = 99
    alarm[4] = 20
}
if (con == 100)
{
    instance_create_ch1(0, 0, obj_fadeout_ch1)
    con = 101
    alarm[4] = 60
}
if (con == 102)
{
    global.plot = 154
    global.entrance = 0
    global.interact = 3
    instance_create_ch1(0, 0, obj_persistentfadein_ch1)
    room_goto(room_cc_prison_cells_ch1)
}
