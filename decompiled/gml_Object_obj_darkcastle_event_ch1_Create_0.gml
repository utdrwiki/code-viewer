con = 0
rflip = 0
if (global.plot >= 20)
    instance_destroy()
else
{
    snd_free_all_ch1()
    con = 1
    with (obj_mainchara_ch1)
        visible = false
    k = scr_dark_marker_ch1(460, (obj_mainchara_ch1.y + 60), spr_krisu_dark_ch1)
    s = scr_dark_marker_ch1(520, (obj_mainchara_ch1.y + 100), spr_susieu_dark_ch1)
    with (k)
    {
        vspeed = -2
        image_speed = 0.1
    }
    with (s)
    {
        vspeed = -3
        image_speed = 0.1
    }
    global.interact = 1
    alarm[4] = 60
}
