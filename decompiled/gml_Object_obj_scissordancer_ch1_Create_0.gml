image_speed = 0
sndcon = 0
sndtimer = 0
dancetimer = (0 - (instance_number(object_index) * 2))
image_xscale = 2
image_yscale = 2
global.charinstance[0] = obj_mainchara_ch1
global.charinstance[1] = global.cinstance[0]
global.charinstance[2] = global.cinstance[1]
con = 0
vspeed = -6
specturn = 0
if (room == room_cc_4f_ch1)
{
    specturn = 1
    vspeed = 0
    hspeed = 6
}
bullet = instance_create_ch1(x, y, obj_overworldbulletparent_ch1)
bullet.sprite_index = spr_scissordancer_precise_ch1
with (bullet)
{
    active = true
    target = 3
    damage = 15
    visible = false
    image_blend = c_red
    image_alpha = 1
    image_xscale = 2
    image_yscale = 2
}
myinteract = 0
