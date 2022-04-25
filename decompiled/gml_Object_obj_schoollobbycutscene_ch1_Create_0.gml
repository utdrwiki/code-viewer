ran = 0
dex = 0
tsouth = 0
teast = 0
con = 0
type = 0
if (global.entrance == 2)
    global.facing = 0
if (global.plot < 2)
{
    global.interact = 1
    alarm[5] = 2
    with (obj_mainchara_ch1)
        visible = false
    t = scr_marker_ch1(460, 360, spr_toriel_handhold_u_ch1)
    with (t)
    {
        vspeed = -2
        image_speed = 0.2
        depth = 10000
    }
    alarm[4] = 85
    con = 1
    type = 1
}
if (global.plot == 3)
{
    type = 2
    with (obj_mainchara_ch1)
    {
        visible = false
        x = obj_markerB_ch1.x
        y = obj_markerB_ch1.y
    }
    k = scr_marker_ch1(obj_mainchara_ch1.x, obj_mainchara_ch1.y, spr_krisd_ch1)
    with (k)
        scr_depth_ch1()
    s = scr_marker_ch1(240, 192, spr_susier_plain_ch1)
    with (s)
    {
        scr_depth_ch1()
        depth -= 5
    }
    global.interact = 1
    with (obj_doorA_ch1)
        instance_destroy()
    doorsolid = instance_create_ch1(110, 200, obj_solidblock_ch1)
    con = 0.1
    alarm[4] = 50
}
if (global.plot >= 250)
{
    sunset = scr_marker_ch1(0, 0, spr_schoollobby_sunsetoverlay_ch1)
    with (sunset)
    {
        image_alpha = 0.4
        depth = 2000
    }
    if (!snd_is_playing_ch1(global.currentsong[1]))
    {
        global.currentsong[0] = snd_init_ch1("mus_birdnoise.ogg")
        global.currentsong[1] = mus_loop_ext_ch1(global.currentsong[0], 0.6, 0.7)
    }
}
if (global.plot >= 251)
    type = 4
