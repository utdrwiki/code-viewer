myinteract = 0
image_speed = 0
skip = false
flippable = 1
flip = 0
flipcon = 0
flipped = 0
flipfactor = 0.8
isswitch = 0
switchflipped = 0
extflag = 0
decorative = 0
dontshine = 1
alphaer = 0
imagespeed = 0
spriteindex1 = sprite_index
spriteindex2 = sprite_index
image_speed = 0
image_xscale = 2
image_yscale = 2
scr_depth()
depth += 1000
active = true
flag = 0
laughtimer = 0
timer = 0
flashamt = 0
con = 0
init = false
type = 0
type = 1
movetype = 0
trackpos = 0
shine = -4
shine_init = 0
if (room == room_dw_mansion_fire_paintings)
{
    if (x == 820 && y == 960)
    {
        extflag = "treasureswitch"
        isswitch = 1
        dontshine = global.flag[398]
    }
    if (x == 200 && y == 560)
    {
        extflag = "fireswitch"
        spriteindex1 = spr_queenFirePainting
        spriteindex2 = spr_queenart_mona_middlepoint
        sprite_index = spriteindex1
        isswitch = 1
        dontshine = global.flag[399]
        if (global.flag[399] == 1)
            sprite_index = spriteindex2
    }
}
