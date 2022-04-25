bikeflip = false
becomeflash = false
turnt = 0
turns = 0
talktimer = 0
talkmax = 90
state = 0
flash = false
siner = 0
fsiner = 0
talked = false
attacked = false
hurt = false
hurttimer = 0
hurtshake = 0
shakex = 0
mywriter = 343249823
acting = false
actcon = 0
acttimer = 0
mercymod = 0
maxmercy = 9999
warned = false
compliment = 0
tired = false
fixed = false
attacks = false
dodgetimer = 0
candodge = false
con = 0
battlecancel = 0
nexttry = false
mytarget = 3
image_speed = 0
image_xscale = 2
image_yscale = 2
idlesprite = spr_blockguy_overworld_ch1
hurtsprite = spr_blockguy_overworld_ch1
sparedsprite = spr_blockguy_spared_ch1
rr = choose(0, 1, 2, 3)
headpart = 1
part[0] = 0
if (rr == 0)
{
    headpart = 3
    part[1] = 2
    part[2] = 3
    part[3] = 1
}
if (rr == 1)
{
    headpart = 3
    part[1] = 3
    part[2] = 2
    part[3] = 1
}
if (rr == 2)
{
    headpart = 1
    part[1] = 1
    part[2] = 3
    part[3] = 2
}
if (rr == 3)
{
    headpart = 2
    part[1] = 2
    part[2] = 1
    part[3] = 3
}
part[4] = 4
maxpart = 5
siner = 0
floatsin = 0
party[0] = 28
party[1] = 54
party[2] = 70
floating = false
swaptime = 10
bodyfade = false
bodyalpha = 1
swapx = 0
sinmomentum = 0
custom[0] = 4.5
custom[1] = 3
custom[2] = 1.5
select[0] = -1
select[1] = -1
select[2] = -1
selectpart[0] = 0
selectpart[1] = 0
selectpart[2] = 0
partyb[0] = 0
partyb[1] = 0
partyb[2] = 0
selecty = 0
selected = false
selecttotal = 0
selectx[0] = 0
movex[0] = 0
movex[1] = 0
movex[2] = 0
threebuffer = 0
finishtimer = 0
hurk = false
