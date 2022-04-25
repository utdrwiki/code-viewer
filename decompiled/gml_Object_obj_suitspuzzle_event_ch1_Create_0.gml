con = 1
image_xscale = 2
image_yscale = 2
talked = false
puzzle = instance_create_ch1(180, 60, obj_suitspuzz_ch1)
with (puzzle)
{
    max_suit = 3
    sol[0] = 3
    sol[1] = 4
    sol[2] = 3
}
easel = scr_dark_marker_ch1(400, 160, spr_thrashdesign_ch1)
with (easel)
    depth = 900000
for (i = 0; i < 3; i += 1)
{
    spike[i] = scr_dark_marker_ch1(520, (240 + (i * 40)), spr_spiketile_ch1)
    spike[i].depth = 800000
}
block = instance_create_ch1(520, 240, obj_soliddark_ch1)
block.image_yscale = 3
s = scr_dark_marker_ch1(372, 170, spr_susieu_dark_ch1)
if (global.plot < 71)
    global.plot = 71
if (global.plot == 71)
{
    con = 15
    with (s)
        visible = false
    visible = false
    lnpc = instance_create_ch1(x, y, obj_npc_facing_ch1)
    with (lnpc)
    {
        dtsprite = spr_lancer_dt_ch1
        rtsprite = spr_lancer_rt_ch1
        ltsprite = spr_lancer_lt_ch1
        utsprite = spr_lancer_ut_ch1
        sprite_index = dtsprite
        facing = 2
        dfacing = 2
        y += 100
    }
    snpc = instance_create_ch1(s.x, s.y, obj_npc_facing_ch1)
    with (snpc)
    {
        dtsprite = spr_susiedt_dark_ch1
        rtsprite = spr_susiert_dark_ch1
        ltsprite = spr_susielt_dark_ch1
        utsprite = spr_susieut_dark_ch1
        sprite_index = dtsprite
        facing = 2
        dfacing = 2
        y += 100
    }
}
if (global.plot >= 72)
{
    with (s)
        instance_destroy()
    with (easel)
        instance_destroy()
    with (puzzle)
    {
        suit[0] = 3
        suit[1] = 4
        suit[2] = 3
        won = 1
    }
    with (block)
        instance_destroy()
    for (i = 0; i < 3; i += 1)
        spike[i].image_index = 1
    con = 999
    instance_destroy()
}
