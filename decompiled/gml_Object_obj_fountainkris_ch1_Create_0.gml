colcol = 0
image_speed = 0
image_xscale = 2
image_yscale = 2
siner = 0
made = 0
adjust = 0
con = 0
global.interact = 1
y += 260
susx = (x - 80)
susy = (y + 20)
sussprite = spr_susieu_bright_ch1
susindex = 0
songplay = 0
with (obj_mainchara_ch1)
    visible = false
fin = instance_create_ch1(0, 0, obj_fadein_ch1)
with (fin)
    fadespeed = -0.01
