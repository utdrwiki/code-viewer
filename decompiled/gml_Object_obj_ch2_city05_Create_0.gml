con = -1
customcon = 0
shortened = 0
if (global.chapter != 2 || global.plot >= 85)
{
    dumpster = instance_create(560, 106, obj_npc_sign)
    dumpster.sprite_index = spr_cutscene_14_dumpster_open
    with (dumpster)
        scr_depth()
    instance_destroy()
}
else
{
    if (global.flag[417] == 0)
    {
        global.flag[417] = 1
        scr_tempsave()
    }
    if (global.tempflag[29] == 1)
        shortened = 1
    snd_volume(global.currentsong[1], 0, 50)
    dumpster = scr_dark_marker(560, 106, spr_cutscene_14_dumpster_closed)
    dumpster.depth = 900000
    with (dumpster)
        scr_depth_alt()
    dumpster_nakami = scr_dark_marker(560, 106, spr_cutscene_14_dumpster_nakami)
    dumpster_nakami.depth = (dumpster.depth - 100)
    dumpster_nakami.visible = false
    play_intro = 0
    stop_intro = 0
    stop_timer = 0
    open_dumpster = 0
}
