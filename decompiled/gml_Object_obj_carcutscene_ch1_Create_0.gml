for (i = 0; i < 20; i += 1)
{
    prevalpha[i] = 0
    prevwx[i] = -200
    prevwy[i] = -200
    prevstringmax[i] = 0
    prevhspace[i] = 0
    prevlinecount[i] = 0
    prevvspace[i] = 0
}
carcon = 0
drawwave = 0
con = 0
dhaver = false
v = 0
vx = 0
vy = 0
myd = 23827382
if (global.plot > 1)
    instance_destroy()
else
{
    global.facing = 0
    with (obj_npc_sign_ch1)
        instance_destroy()
    global.currentsong[0] = snd_init_ch1("mus_introcar.ogg")
    con = 1
    alarm[4] = 30
    global.interact = 1
    k = obj_mainchara_ch1
    t = scr_marker_ch1(195, 240, spr_toriel_lt_ch1)
    with (t)
        depth = 400000
    c = scr_marker_ch1(131, 240, spr_torcar_d_ch1)
    with (c)
        depth = 500000
}
