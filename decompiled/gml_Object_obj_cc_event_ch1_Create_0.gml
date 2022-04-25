if (room == room_cc_1f_ch1)
{
    if (global.flag[240] == 0)
    {
        elevatorblocker = instance_create_ch1(1040, 160, obj_soliddark_ch1)
        with (elevatorblocker)
            image_xscale = 6
    }
}
if (room == room_cc_2f_ch1)
{
    spike[0] = scr_dark_marker_ch1(800, 280, spr_spiketile_ch1)
    spike[1] = scr_dark_marker_ch1(840, 280, spr_spiketile_ch1)
    with (spike[0])
        depth = 900000
    with (spike[1])
        depth = 900000
    if (global.flag[217] == 1)
    {
        with (spike[0])
            image_index = 1
        with (spike[1])
            image_index = 1
    }
    else
    {
        darksolid = instance_create_ch1(800, 280, obj_soliddark_ch1)
        darksolid.image_xscale = 2
    }
}
if (room == room_cc_4f_ch1)
{
    spike[0] = scr_dark_marker_ch1(680, 920, spr_spiketile_ch1)
    spike[1] = scr_dark_marker_ch1(720, 920, spr_spiketile_ch1)
    with (spike[0])
        depth = 900000
    with (spike[1])
        depth = 900000
    if (global.flag[218] == 1)
    {
        with (spike[0])
            image_index = 1
        with (spike[1])
            image_index = 1
    }
    else
    {
        darksolid = instance_create_ch1(680, 920, obj_soliddark_ch1)
        darksolid.image_xscale = 2
    }
    if (global.flag[245] == 1)
    {
        with (obj_bluhpainting_ch1)
        {
            bluh = 1
            image_index = 1
        }
        chest = instance_create_ch1(480, 980, obj_treasure_room_ch1)
    }
}
if (room == room_cc_5f_ch1)
    global.flag[240] = 1
if ((!snd_is_playing_ch1(global.currentsong[1])) && room >= room_cc_1f_ch1)
{
    if (room == room_cc_clover_ch1)
        global.currentsong[0] = snd_init_ch1("april_2012.ogg")
    else
        global.currentsong[0] = snd_init_ch1("card_castle.ogg")
    global.currentsong[1] = mus_loop_ext_ch1(global.currentsong[0], 1, 1)
}
if ((!snd_is_playing_ch1(global.currentsong[1])) && room < room_cc_1f_ch1)
{
    global.currentsong[0] = snd_init_ch1("basement.ogg")
    global.currentsong[1] = mus_loop_ext_ch1(global.currentsong[0], 1, 1)
}
