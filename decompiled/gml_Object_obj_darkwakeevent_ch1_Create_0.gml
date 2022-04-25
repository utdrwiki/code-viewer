con = 0
if (global.plot < 11)
{
    scr_losechar_ch1()
    with (obj_caterpillarchara_ch1)
        instance_destroy()
    con = 1
    global.interact = 1
    with (obj_mainchara_ch1)
        visible = false
    k = scr_dark_marker_ch1(obj_mainchara_ch1.x, obj_mainchara_ch1.y, spr_kris_fell_ch1)
    waketimer = -50
}
else
    instance_destroy()
