con = 1
npc = instance_create_ch1(x, y, obj_npc_room_ch1)
if (global.plot >= 80 || global.flag[238] == 1)
    con = 99
else
{
    s = scr_dark_marker_ch1((x + 20), (y + 60), spr_susied_dark_ch1)
    with (s)
        scr_depth_ch1()
    l = scr_dark_marker_ch1((x + 60), (y + 80), spr_lancer_dt_ch1)
    with (l)
        scr_depth_ch1()
}
