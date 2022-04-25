con = 99
pcon = 0
ptimer = 0
puzzle = instance_create_ch1(500, 440, obj_suitspuzz_ch1)
with (puzzle)
{
    max_suit = 3
    drawclue = 0
    sol[0] = 9
    sol[1] = 9
    sol[2] = 9
    sol[3] = 9
}
if (global.plot < 75)
    con = 0
spiken[0] = scr_dark_marker_ch1(520, 280, spr_spiketile_ch1)
spiken[1] = scr_dark_marker_ch1(560, 280, spr_spiketile_ch1)
with (spiken[0])
    depth = 970000
with (spiken[1])
    depth = 970000
if (global.flag[234] == 0)
{
    blockn = instance_create_ch1(520, 280, obj_soliddark_ch1)
    with (blockn)
        image_xscale = 2
}
else
{
    with (spiken[0])
        image_index = 1
    with (spiken[1])
        image_index = 1
}
if (global.flag[235] == 0)
{
    blocke = instance_create_ch1(1040, 400, obj_soliddark_ch1)
    with (blocke)
        instance_destroy()
    with (blocke)
        image_yscale = 2
}
