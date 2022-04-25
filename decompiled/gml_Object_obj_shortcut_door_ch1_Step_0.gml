if (myinteract == 3)
{
}
if (myinteract == 3 && con == 0)
{
    if (instance_exists(mydialoguer) == 0)
    {
        global.interact = 0
        myinteract = 0
        with (obj_mainchara_ch1)
            onebuffer = 5
    }
}
if (con >= 5)
{
    if (con == 50)
    {
        with (weirdlight)
            instance_destroy()
        con = 51
        snd_play_ch1(snd_dooropen_ch1)
        image_index = 1
    }
    if (con == 51)
        global.interact = 1
    if (con == 51 && (!d_ex_ch1()))
    {
        global.interact = 1
        con = 52
        doortimer = 0
    }
    if (con == 52)
    {
        doortimer += 1
        if (doortimer >= 6)
        {
            snd_free_all_ch1()
            snd_play_ch1(snd_doorclose_ch1)
            dark_marker = scr_dark_marker_ch1((__view_get((0 << 0), 0) - 10), (__view_get((1 << 0), 0) - 10), spr_pixel_white_ch1)
            with (dark_marker)
            {
                image_xscale = 700
                image_yscale = 700
                depth = -100
                image_blend = c_black
            }
            con = 53
            doortimer = 0
        }
    }
    if (con == 53)
    {
        doortimer += 1
        if (doortimer >= 30)
        {
            global.facing = 0
            con = 54
            snd_play_ch1(snd_dooropen_ch1)
            global.interact = 3
            instance_create_ch1(0, 0, obj_persistentfadein_ch1)
            global.entrance = 23
            room_goto(door_destination)
        }
    }
}
