dtsprite = spr_susied_dark_ch1
rtsprite = spr_susier_dark_ch1
ltsprite = spr_susiel_dark_ch1
utsprite = spr_susieu_dark_ch1
myinteract = 0
facing = 2
dfacing = 2
image_speed = 0
talked = false
image_xscale = 2
image_yscale = 2
scr_depth_ch1()
if (global.plot >= 30)
    instance_destroy()
else
{
    s = instance_create_ch1(450, 950, obj_soliddark_ch1)
    s.image_yscale = 8
}
