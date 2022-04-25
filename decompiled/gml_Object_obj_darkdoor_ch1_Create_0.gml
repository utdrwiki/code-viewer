image_speed = 0
open = 0
siner = 0
xsin = 0
con = 0
if (global.plot < 5)
{
    con = 1
    with (obj_mainchara_ch1)
        visible = false
    k = scr_marker_ch1(290, 198, spr_krisu_ch1)
    s = scr_marker_ch1(310, 190, spr_susieu_ch1)
    global.interact = 1
    with (s)
    {
        vspeed = -1
        image_speed = 0.2
    }
    with (k)
    {
        vspeed = -1
        image_speed = 0.2
    }
    alarm[4] = 90
}
else
{
    block = instance_create_ch1(280, 100, obj_solidblock_ch1)
    block.image_xscale = 4
    sunset = scr_marker_ch1(0, 0, spr_doorarea_sunsetoverlay_ch1)
    with (sunset)
    {
        image_alpha = 0.4
        depth = 2000
    }
}
if (global.plot == 250)
{
    with (obj_mainchara_ch1)
    {
        x = obj_markerD_ch1.x
        y = obj_markerD_ch1.y
    }
    global.interact = 1
    con = 40
}
