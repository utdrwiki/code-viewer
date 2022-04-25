if (hcon == 1)
{
    if instance_exists(obj_mainchara_ch1)
    {
        if (obj_mainchara_ch1.x >= 220 && global.interact == 0)
        {
            global.interact = 1
            hcon = 2
            global.msc = 140
            global.fc = 2
            global.fe = 3
            global.typer = 31
            scr_text_ch1(global.msc)
            instance_create_ch1(0, 0, obj_dialoguer_ch1)
        }
    }
}
if (hcon == 2)
{
    if (d_ex_ch1() == 0)
    {
        if (global.plot < 32)
            global.plot = 32
        hcon = 3
        global.interact = 0
    }
}
if (con == 1)
{
    if instance_exists(obj_mainchara_ch1)
    {
        if (obj_mainchara_ch1.y <= 200 && global.interact == 0)
        {
            global.interact = 1
            con = 2
            mus_volume_ch1(global.currentsong[1], 0, 60)
            alarm[4] = 40
        }
    }
}
if (con == 2)
{
    with (obj_mainchara_ch1)
        image_alpha -= 0.04
}
if (con == 3)
{
    if instance_exists(global.cinstance[0])
        con = 4
    else
        con = 20
}
if (con == 4)
{
    r = scr_dark_marker_ch1(global.cinstance[0].x, global.cinstance[0].y, spr_ralseiu_ch1)
    with (global.cinstance[0])
        instance_destroy()
    with (r)
    {
        image_speed = 0.25
        scr_move_to_point_over_time_ch1(420, (obj_mainchara_ch1.y - 10), 20)
    }
    con = 5
    alarm[4] = 20
}
if (con == 6)
{
    with (r)
    {
        scr_halt_ch1()
        sprite_index = spr_ralseid_ch1
    }
    con = 7
    alarm[4] = 40
}
if (con == 8)
{
    with (r)
        visible = false
    con = 20
}
if (con == 20)
{
    image_index = 1
    snd_play_ch1(snd_impact_ch1)
    instance_create_ch1(0, 0, obj_shake_ch1)
    con = 21
    alarm[4] = 70
}
if (con == 22)
{
    snd_free_all_ch1()
    f = instance_create_ch1(0, 0, obj_fadeout_ch1)
    f.fadespeed = 0.025
    con = 23
    alarm[4] = 60
}
if (con == 24)
{
    global.plot = 33
    global.interact = 0
    global.facing = 0
    instance_create_ch1(0, 0, obj_persistentfadein_ch1)
    room_goto(room_field_start_ch1)
}
