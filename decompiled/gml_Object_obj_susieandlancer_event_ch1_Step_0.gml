if (con == 0 && global.interact == 0)
{
    xx = __view_get((0 << 0), 0)
    yy = __view_get((1 << 0), 0)
    if (obj_mainchara_ch1.x >= x)
    {
        global.interact = 1
        global.facing = 1
        with (obj_caterpillarchara_ch1)
            visible = false
        with (obj_mainchara_ch1)
            visible = false
        r = scr_dark_marker_ch1(obj_caterpillarchara_ch1.x, obj_caterpillarchara_ch1.y, spr_ralseir_ch1)
        k = scr_dark_marker_ch1(obj_mainchara_ch1.x, obj_mainchara_ch1.y, spr_krisr_dark_ch1)
        if (global.flag[250] == 0)
        {
            with (obj_marker_ch1)
            {
                hspeed = 2
                image_speed = 0.2
            }
            scr_pan_ch1(4, 0, 70)
            mus_volume_ch1(global.currentsong[1], 0, 90)
            with (obj_mainchara_ch1)
                cutscene = true
            con = 1
            alarm[4] = 90
        }
        else
        {
            with (obj_marker_ch1)
            {
                hspeed = 4
                image_speed = 0.2
            }
            scr_pan_ch1(8, 0, 35)
            mus_volume_ch1(global.currentsong[1], 0, 45)
            with (obj_mainchara_ch1)
                cutscene = true
            con = 1
            alarm[4] = 45
        }
        thrashmachine = instance_create_ch1((xx + 740), (yy + 160), obj_thrashmachine_ch1)
        with (thrashmachine)
        {
            value = 0
            animate = 0
            bad = 1
        }
    }
}
if (con == 2)
{
    with (k)
        scr_halt_ch1()
    with (r)
        scr_halt_ch1()
    global.typer = 31
    global.fc = 2
    global.fe = 3
    global.msg[0] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_56_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_57_0")
    if (global.flag[250] == 1)
    {
        global.fc = 2
        global.fe = 9
        global.msg[0] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_62_0")
    }
    if (global.flag[250] >= 2)
    {
        global.fc = 2
        global.fe = 12
        global.msg[0] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_68_0")
    }
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 3
    valuetimer = 0
}
if (con == 3 && (!d_ex_ch1()))
{
    valuetimer += 1
    if (global.flag[250] >= 1)
        valuetimer += 1
    with (thrashmachine)
    {
        if (value < 1)
            value += 0.04
        else
            value = 1
    }
    if (valuetimer >= 60)
        con = 4
}
if (con == 4 && (!d_ex_ch1()))
{
    global.typer = 31
    global.fc = 2
    global.fe = 9
    global.msg[0] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_93_0")
    if (global.flag[250] == 1)
    {
        global.fe = 12
        global.msg[0] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_97_0")
    }
    if (global.flag[250] >= 2)
    {
        global.fe = 6
        global.msg[0] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_102_0")
    }
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 17
}
if (con == 17 && (!d_ex_ch1()))
{
    global.encounterno = 31
    scr_encountersetup_ch1(global.encounterno)
    l = scr_dark_marker_ch1((global.monstermakex[1] + 200), (global.monstermakey[1] - 50), spr_lancer_lt_ch1)
    s = scr_dark_marker_ch1((global.monstermakex[0] + 200), global.monstermakey[0], spr_susiel_dark_ch1)
    with (l)
    {
        scr_depth_ch1()
        hspeed = -5
        image_speed = 0.1
    }
    with (s)
    {
        scr_depth_ch1()
        hspeed = -5
        image_speed = 0.1
    }
    con = 18
    alarm[4] = 40
}
if (con == 19)
{
    with (l)
        scr_halt_ch1()
    with (s)
        scr_halt_ch1()
    con = 20
    alarm[4] = 20
}
if (con == 21 && (!d_ex_ch1()))
{
    global.typer = 32
    global.fc = 5
    global.fe = 2
    global.msg[0] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_148_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_149_0")
    con = 21.1
    if (global.flag[250] < 1)
        instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 21.1 && (!d_ex_ch1()))
{
    with (r)
        sprite_index = spr_ralsei_shock_overworld_ch1
    snd_play_ch1(snd_badexplosion_ch1)
    snd_play_ch1(snd_lancerlaugh_ch1)
    boom = scr_dark_marker_ch1(thrashmachine.x, (thrashmachine.y + 40), spr_realisticexplosion_ch1)
    with (boom)
    {
        depth = -400
        image_speed = 0.5
        image_xscale = 3
        image_yscale = 3
    }
    with (s)
    {
        sprite_index = spr_susiel_dark_laugh_ch1
        image_speed = 0.25
    }
    with (l)
    {
        sprite_index = spr_lancer_lt_laugh_ch1
        image_speed = 0.25
    }
    con = 21.2
    boomtimer = 0
}
if (con == 21.2)
{
    boomtimer += 1
    if instance_exists(boom)
    {
        if (boom.image_index >= 5)
        {
            with (thrashmachine)
                instance_destroy()
        }
    }
    with (boom)
    {
        if (image_index >= 16)
            instance_destroy()
    }
    if (boomtimer >= 70)
        con = 21.3
}
if (con == 21.3)
{
    with (s)
    {
        scr_halt_ch1()
        sprite_index = spr_susiel_dark_ch1
    }
    with (l)
    {
        scr_halt_ch1()
        sprite_index = spr_lancer_lt_ch1
    }
    with (r)
        sprite_index = spr_ralseir_ch1
    global.fc = 1
    global.typer = 30
    global.fe = 2
    global.msg[0] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_210_0")
    scr_ralface_ch1(1, 1)
    global.msg[2] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_212_0")
    global.msg[3] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_213_0")
    scr_susface_ch1(4, 2)
    global.msg[5] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_215_0")
    scr_lanface_ch1(6, 1)
    global.msg[7] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_217_0")
    scr_susface_ch1(8, 2)
    global.msg[9] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_219_0")
    scr_ralface_ch1(10, 1)
    global.msg[11] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_221_0")
    global.msg[12] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_222_0")
    scr_susface_ch1(13, 2)
    global.msg[14] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_224_0")
    global.msg[15] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_225_0")
    global.msg[16] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_226_0")
    global.msg[17] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_227_0")
    if (global.flag[250] == 1)
    {
        global.fc = 2
        global.fe = 3
        global.typer = 31
        global.msg[0] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_233_0")
        scr_lanface_ch1(1, 3)
        global.msg[2] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_235_0")
        scr_ralface_ch1(3, 1)
        global.msg[4] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_237_0")
        global.msg[5] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_238_0")
        scr_susface_ch1(6, 0)
        global.msg[7] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_240_0")
        scr_lanface_ch1(8, 6)
        global.msg[9] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_242_0")
        global.msg[10] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_243_0")
        scr_susface_ch1(11, 2)
        global.msg[12] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_245_0")
    }
    if (global.flag[250] >= 2)
    {
        global.fc = 2
        global.fe = 6
        global.typer = 31
        global.msg[0] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_252_0")
        scr_susface_ch1(1, 7)
        global.msg[2] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_254_0")
        scr_ralface_ch1(3, "A")
        global.msg[4] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_256_0")
        scr_lanface_ch1(5, 3)
        global.msg[6] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_258_0")
    }
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 26
}
if (con == 26 && (!d_ex_ch1()))
{
    with (s)
    {
        sprite_index = spr_susieb_attack_ch1
        image_xscale = -2
        x += 80
    }
    snd_play_ch1(snd_laz_c_ch1)
    con = 27
}
if (con == 27)
{
    with (s)
        image_index += 0.2
    if (s.image_index >= 4)
    {
        con = 28
        alarm[4] = 20
    }
}
if (con == 29)
{
    lcon = 1
    ltimer = 0
    remlx = l.x
    with (s)
    {
        sprite_index = spr_susie_enemy_ch1
        image_xscale = 2
        x -= 80
    }
    global.fe = 2
    global.fc = 1
    global.typer = 30
    global.msc = 450
    scr_text_ch1(global.msc)
    if (global.flag[250] == 1)
    {
        global.fc = 2
        global.fe = 9
        global.typer = 31
        global.msg[0] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_302_0")
        scr_susface_ch1(1, 2)
        global.msg[2] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_304_0")
    }
    if (global.flag[250] >= 2)
    {
        global.fc = 1
        global.fe = 2
        global.typer = 30
        global.msg[0] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_312_0")
        scr_ralface_ch1(1, 6)
        global.msg[2] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_314_0")
        scr_lanface_ch1(3, 2)
        global.msg[4] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_316_0")
    }
    d_make_ch1()
    con = 30
    choosetimer = 0
}
if (lcon == 1)
{
    with (l)
        x += 15
    if (l.x >= (__view_get((0 << 0), 0) + 700))
    {
        with (l)
        {
            sprite_index = spr_lancerbike_ch1
            image_speed = 0.1
            y += 50
        }
        lcon = 2
    }
}
if (lcon == 2)
{
    with (l)
        x -= 15
    if (l.x <= remlx)
    {
        l.x = remlx
        lcon = 3
    }
}
if (con == 30)
{
    if instance_exists(obj_choicer_neo_ch1)
    {
        choosetimer += 1
        if (choosetimer >= 30)
        {
            if (obj_choicer_neo_ch1.choiced == false)
            {
                with (obj_choicer_neo_ch1)
                {
                    canchoose = true
                    mychoice = 1
                    event_user(0)
                }
            }
            con = 31
        }
    }
    if (!d_ex_ch1())
        con = 31
}
if (con == 31 && (!d_ex_ch1()) && lcon == 3)
{
    global.flag[250] += 1
    obj_mainchara_ch1.x = k.x
    obj_mainchara_ch1.y = k.y
    global.cinstance[0].x = r.x
    global.cinstance[0].y = r.y
    global.facing = 1
    with (global.cinstance[0])
        scr_caterpillar_interpolate_ch1()
    scr_caterpillar_facing_ch1(global.facing)
    with (s)
        visible = false
    s.depth = 100
    with (l)
        visible = false
    with (k)
        visible = false
    with (r)
        visible = false
    global.specialbattle = 0
    global.flag[9] = 1
    snd_play_ch1(snd_weaponpull_ch1)
    beaten = true
    global.specialbattle = 3
    global.batmusic[0] = snd_init_ch1("lancerfight.ogg")
    bc = instance_create_ch1(0, 0, obj_battlecontroller_ch1)
    with (bc)
        skipvictory = true
    con = 35
}
if (con == 35)
{
    if (!instance_exists(obj_battlecontroller_ch1))
    {
        snd_free_all_ch1()
        with (s)
            visible = true
        with (l)
            visible = true
        con = 45
        global.interact = 1
    }
}
if (con == 45 && (!d_ex_ch1()))
{
    global.interact = 1
    if (global.flag[249] == 0)
    {
        with (s)
            sprite_index = spr_susie_enemy_defeat_ch1
    }
    lcon = 4
    con = 46
    alarm[4] = 30
}
if (con == 46)
    global.interact = 1
if (lcon == 4)
{
    with (l)
        x += 15
    if (l.x >= (__view_get((0 << 0), 0) + 700))
    {
        with (l)
        {
            sprite_index = spr_lancer_lt_ch1
            image_speed = 0
            y -= 50
        }
        lcon = 5
    }
}
if (lcon == 5)
{
    with (l)
        x -= 15
    if (l.x <= remlx)
    {
        l.x = remlx
        lcon = 6
    }
}
if (con == 47 && lcon == 6)
{
    global.typer = 30
    global.fe = 9
    global.fc = 1
    global.msg[0] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_454_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_455_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_456_0")
    if (global.flag[249] == 1)
    {
        global.fe = 0
        global.msg[0] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_461_0")
        global.msg[1] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_462_0")
        scr_lanface_ch1(2, 3)
        global.msg[3] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_464_0")
        scr_susface_ch1(4, 0)
        global.msg[5] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_466_0")
        global.msg[6] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_467_0")
    }
    con = 48
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 48 && (!d_ex_ch1()))
{
    with (s)
        sprite_index = spr_susiel_dark_unhappy_ch1
    s.kx = k.x
    s.ky = k.y
    with (s)
    {
        scr_move_to_point_over_time_ch1((kx + 120), (ky - 15), 60)
        image_speed = 0.2
    }
    con = 49
    alarm[4] = 60
}
if (con == 50)
{
    with (s)
        scr_halt_ch1()
    global.typer = 31
    global.fc = 2
    global.fe = 6
    global.msg[0] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_489_0")
    scr_susface_ch1(1, 4)
    global.msg[2] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_491_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 51
}
if (con == 51 && (!d_ex_ch1()))
{
    with (s)
        sprite_index = spr_susier_dark_unhappy_ch1
    with (l)
        sprite_index = spr_lancer_lt_unhappy_ch1
    con = 52
    alarm[4] = 20
}
if (con == 53)
{
    global.typer = 32
    global.fc = 5
    global.fe = 6
    global.msg[0] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_509_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_510_0")
    global.msg[2] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_511_0")
    con = 54
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
}
if (con == 54 && (!d_ex_ch1()))
{
    with (s)
    {
        hspeed = -6
        image_index = 1
    }
    con = 55
    alarm[4] = 4
}
if (con == 56)
{
    with (s)
        scr_halt_ch1()
    con = 57
    alarm[4] = 15
}
if (con == 58)
{
    global.typer = 30
    global.fc = 1
    global.fe = 6
    global.msg[0] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_535_0")
    d_make_ch1()
    con = 59
}
if (con == 59 && (!d_ex_ch1()))
{
    with (s)
    {
        sprite_index = spr_susier_dark_ch1
        image_speed = 0.2
        hspeed = 6
    }
    con = 60
    alarm[4] = 8
}
if (con == 61)
{
    with (s)
        scr_halt_ch1()
    global.fe = 2
    global.msg[0] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_551_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_552_0")
    d_make_ch1()
    con = 62
}
if (con == 62 && (!d_ex_ch1()))
{
    with (s)
        sprite_index = spr_susiel_dark_unhappy_ch1
    con = 63
    alarm[4] = 30
}
if (con == 64)
{
    with (s)
        sprite_index = spr_susier_dark_ch1
    global.fe = 2
    name = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_568_0")
    if (global.flag[214] == 1)
        name = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_569_0")
    if (global.flag[214] == 2)
        name = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_570_0")
    if (global.flag[214] == 3)
        name = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_571_0")
    global.msg[0] = scr_84_get_subst_string_ch1(scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_573_0"), name)
    scr_lanface_ch1(1, 3)
    global.msg[2] = scr_84_get_subst_string_ch1(scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_575_0"), name)
    global.msg[3] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_576_0")
    d_make_ch1()
    with (l)
        sprite_index = spr_lancer_lt_ch1
    con = 65
}
if (con == 65 && (!d_ex_ch1()))
{
    with (l)
        sprite_index = spr_lancer_rt_unhappy_ch1
    global.fe = 4
    global.msg[0] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_586_0")
    d_make_ch1()
    con = 66
}
if (con == 66 && (!d_ex_ch1()))
{
    with (l)
        sprite_index = spr_lancer_lt_ch1
    global.fe = 3
    global.msg[0] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_595_0")
    scr_susface_ch1(1, 2)
    global.msg[2] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_597_0")
    scr_ralface_ch1(3, 3)
    global.msg[4] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_599_0")
    global.msg[5] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_600_0")
    scr_lanface_ch1(6, 8)
    global.msg[7] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_602_0")
    con = 67
    d_make_ch1()
}
if (con == 67 && (!d_ex_ch1()))
{
    global.currentsong[0] = snd_init_ch1("fanfare.ogg")
    global.currentsong[1] = mus_play_ch1(global.currentsong[0])
    global.fc = 0
    global.typer = 52
    global.msg[0] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_615_0")
    d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
    d.skippable = false
    con = 70
}
if (con == 9999)
{
    snd_free_all_ch1()
    with (obj_dialoguer_ch1)
        instance_destroy()
    with (obj_writer_ch1)
        instance_destroy()
    global.typer = 30
    global.fe = 8
    global.fc = 1
    global.msg[0] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_629_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 70
}
if (con == 70 && (!d_ex_ch1()))
{
    snd_free_all_ch1()
    obj_mainchara_ch1.x = k.x
    obj_mainchara_ch1.y = k.y
    scon = 1
    lcon = 20
    with (obj_mainchara_ch1)
        visible = true
    with (k)
        visible = false
    if (global.plot < 130)
        global.plot = 130
    con = 71
    scr_pan_to_obj_ch1(obj_mainchara_ch1, 50)
    alarm[4] = 52
}
if (scon == 1)
{
    with (s)
    {
        sprite_index = spr_susiel_dark_ch1
        image_index += 0.2
        x -= 10
    }
    if (s.x <= (r.x - 50))
    {
        scr_losechar_ch1()
        scr_getchar_ch1(3)
        scr_getchar_ch1(2)
        s.visible = false
        global.cinstance[1] = instance_create_ch1(s.x, s.y, obj_caterpillarchara_ch1)
        global.cinstance[1].target = 24
        scon = 2
    }
}
if (lcon == 20)
{
    l.sprite_index = spr_lancer_lt_ch1
    l.x -= 15
    l.y += 0.5
    if (l.x <= (r.x - 120))
        lcon = 21
}
if (lcon == 21)
{
    npc = instance_create_ch1(l.x, l.y, obj_npc_room_ch1)
    npc.sprite_index = spr_lancer_rt_ch1
    lcon = 22
    global.flag[229] = 1
    with (l)
        visible = false
}
if (con == 72)
{
    savepoint = instance_create_ch1(640, 80, obj_savepoint_ch1)
    with (r)
        visible = false
    global.cinstance[0].x = r.x
    global.cinstance[0].y = r.y
    with (global.cinstance[0])
    {
        visible = true
        scr_caterpillar_interpolate_ch1()
    }
    with (global.cinstance[1])
    {
        visible = true
        scr_caterpillar_interpolate_ch1()
    }
    scr_caterpillar_facing_ch1(1)
    with (obj_mainchara_ch1)
        cutscene = false
    global.interact = 0
    global.facing = 0
    scr_tempsave_ch1()
    con = 99
}
if (global.plot < 150 && con == 99 && global.interact == 0 && obj_mainchara_ch1.x <= 80)
{
    obj_mainchara_ch1.x = 82
    global.interact = 1
    global.typer = 31
    global.fc = 2
    global.fe = 1
    global.msg[0] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_712_0")
    global.msg[1] = scr_84_get_lang_string_ch1("obj_susieandlancer_event_slash_Step_0_gml_713_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 100
}
if (con == 100 && (!d_ex_ch1()))
{
    con = 99
    global.interact = 0
}
