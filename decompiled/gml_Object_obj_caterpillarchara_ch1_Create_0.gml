scr_depth_ch1()
image_speed = 0
darkmode = global.darkzone
if (darkmode == true)
{
    image_xscale = 2
    image_yscale = 2
}
walk = false
fun = false
runmove = false
dir = 0
walkbuffer = 0
walktimer = 0
blushtimer = 0
target = 12
usprite = spr_susieu_dark_ch1
dsprite = spr_susied_dark_ch1
rsprite = spr_susier_dark_ch1
lsprite = spr_susiel_dark_ch1
if (global.plot >= 240)
{
    usprite = spr_susieu_dark_ch1
    dsprite = spr_susied_dark_eyes_ch1
    rsprite = spr_susier_dark_eyes_ch1
    lsprite = spr_susiel_dark_eyes_ch1
}
usprite_blush = spr_ralseiu_ch1
dsprite_blush = spr_ralseid_ch1
rsprite_blush = spr_ralseir_blush_ch1
lsprite_blush = spr_ralseil_blush_ch1
parent = obj_mainchara_ch1
pd = parent.dsprite
pr = parent.rsprite
pl = parent.lsprite
pu = parent.usprite
for (i = 0; i < 25; i += 1)
{
    remx[i] = obj_mainchara_ch1.x
    remy[i] = obj_mainchara_ch1.y
    facing[i] = global.facing
}
depth = (obj_mainchara_ch1.depth + 5)
mywidth = sprite_width
myheight = sprite_height
