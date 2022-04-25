if (con == 1)
{
    global.facing = 2
    s = scr_dark_marker_ch1(340, 1000, spr_susieu_dark_ch1)
    r = scr_dark_marker_ch1(260, 1008, spr_ralseiu_ch1)
    l = scr_dark_marker_ch1(280, 740, spr_lancer_ut_unhappy_ch1)
    with (obj_marker_ch1)
        scr_depth_ch1()
    con = 2
    global.interact = 1
    alarm[4] = 30
}
if (con == 2)
    global.interact = 1
if (con == 3)
{
    global.fc = 1
    global.fe = 9
    global.typer = 30
    global.msg[0] = scr_84_get_lang_string_ch1("obj_castlefront_event_slash_Step_0_gml_24_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 4
}
if (con == 4 && (!d_ex_ch1()))
{
    with (l)
    {
        sprite_index = spr_lancer_dt_unhappy_ch1
        vspeed = -3
    }
    with (obj_mainchara_ch1)
    {
        fun = true
        vspeed = -8
        image_speed = 0.25
    }
    with (s)
    {
        vspeed = -8
        image_speed = 0.25
    }
    with (r)
    {
        vspeed = -8
        image_speed = 0.25
    }
    con = 5
    alarm[4] = 48
}
if (con == 6)
{
    snd_free_all_ch1()
    snd_play_ch1(snd_locker_ch1)
    instance_create_ch1(0, 0, obj_shake_ch1)
    door = scr_dark_marker_ch1(226, 534, spr_cardcastlefrontdoor_ch1)
    door.depth = 1000000
    with (l)
        instance_destroy()
    with (s)
        scr_halt_ch1()
    with (r)
        scr_halt_ch1()
    with (obj_mainchara_ch1)
        scr_halt_ch1()
    con = 7
    alarm[4] = 40
}
if (con == 8)
{
    global.msg[0] = scr_84_get_lang_string_ch1("obj_castlefront_event_slash_Step_0_gml_58_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 15
}
if (con == 15 && (!d_ex_ch1()))
{
    with (s)
        sprite_index = spr_susier_dark_unhappy_ch1
    with (r)
        sprite_index = spr_ralseil_ch1
    global.facing = 0
    with (obj_mainchara_ch1)
        sprite_index = spr_krisd_dark_ch1
    exc = instance_create_ch1((obj_mainchara_ch1.x + 20), (obj_mainchara_ch1.y - 20), obj_excblcon_ch1)
    con = 16
    alarm[4] = 20
    for (i = 0; i < 4; i += 1)
    {
        spademanl[i] = scr_dark_marker_ch1((0 - (10 * i)), (680 + (30 * i)), spr_diamond_knight_overworld_ch1)
        with (spademanl[i])
        {
            image_xscale = -2
            hspeed = 12
            scr_depth_ch1()
        }
    }
    for (i = 0; i < 4; i += 1)
    {
        spademanr[i] = scr_dark_marker_ch1((640 + (10 * i)), (680 + (30 * i)), spr_diamond_knight_overworld_ch1)
        with (spademanr[i])
        {
            image_xscale = 2
            hspeed = -12
            scr_depth_ch1()
        }
    }
    spademand[0] = scr_dark_marker_ch1(320, 1100, spr_diamond_knight_overworld_ch1)
    with (spademand[0])
    {
        image_xscale = -2
        vspeed = -12
        scr_depth_ch1()
    }
    spademand[1] = scr_dark_marker_ch1(320, 1100, spr_diamond_knight_overworld_ch1)
    with (spademand[1])
    {
        image_xscale = 2
        vspeed = -12
        scr_depth_ch1()
    }
}
if (con == 17)
{
    with (exc)
        instance_destroy()
    with (obj_marker_ch1)
        scr_halt_ch1()
    con = 18
    alarm[4] = 20
}
if (con == 19)
{
    global.typer = 6
    global.fc = 0
    global.msg[0] = scr_84_get_lang_string_ch1("obj_castlefront_event_slash_Step_0_gml_106_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 20
    ftimer = 0
    dcount = 0
    so = 0
    maxd = 36
}
if (con == 20 && (!d_ex_ch1()))
{
    if (dcount < maxd)
    {
        if (so == 0)
        {
            snd_play_ch1(snd_noise_ch1)
            so = 1
        }
        else
            so = 0
        radius = 140
        angle = ((dcount / maxd) * 360)
        xpoint = (obj_mainchara_ch1.x + 20)
        ypoint = obj_mainchara_ch1.y
        xd = lengthdir_x(radius, angle)
        yd = lengthdir_y(radius, angle)
        db[dcount] = scr_dark_marker_ch1((xpoint + xd), (ypoint + yd), spr_diamondbullet_ch1)
        db[dcount].image_angle = angle
        with (db[dcount])
        {
            image_xscale = 1
            image_yscale = 1
            image_alpha = 0
            direction = image_angle
            speed = 2
            depth = 10000
            friction = 0.1
        }
        dcount += 1
    }
    for (i = 0; i < dcount; i += 1)
    {
        with (db[i])
            image_alpha += 0.1
    }
    if (dcount >= maxd)
    {
        ftimer += 1
        if (ftimer >= 20)
            con = 21
    }
}
if (con == 21)
{
    global.typer = 31
    global.fc = 2
    global.fe = 3
    global.msg[0] = scr_84_get_lang_string_ch1("obj_castlefront_event_slash_Step_0_gml_163_0")
    instance_create_ch1(0, 0, obj_dialoguer_ch1)
    con = 22
}
if (con == 22 && (!d_ex_ch1()))
{
    for (i = 0; i < dcount; i += 1)
    {
        with (db[i])
        {
            gravity = 1
            gravity_direction = (image_angle + 180)
        }
    }
    con = 26
}
if (con == 26)
{
    if (db[0].x <= (obj_mainchara_ch1.x + 90))
    {
        snd_free_all_ch1()
        snd_play_ch1(snd_hurt1_ch1)
        con = 27
        black = true
        alarm[4] = 120
    }
}
if (con == 28)
{
    global.entrance = 0
    global.interact = 3
    room_goto(room_cc_prison_cells_ch1)
}
