door = scr_marker_ch1(236, 26, spr_classdoor_ch1)
with (door)
    scr_depth_ch1()
con = 0
global.facing = 0
if (global.plot < 2)
{
    global.facing = 0
    con = 1
    with (obj_mainchara_ch1)
    {
        x = 240
        y = 30
        scr_depth_ch1()
    }
    alphys = scr_marker_ch1(50, 50, spr_alphysd_ch1)
    with (alphys)
        scr_depth_ch1()
    global.interact = 1
}
if (global.plot >= 3)
{
    doorb = instance_create_ch1(242, 48, obj_doorB_ch1)
    with (door)
        depth = 900000
    with (obj_npc_facing_ch1)
        instance_destroy()
    with (obj_tem_school_ch1)
        instance_destroy()
    sunset = scr_marker_ch1(3, 0, spr_torielclass_sunsetoverlay_ch1)
    with (sunset)
    {
        image_alpha = 0.4
        depth = 2000
    }
    instance_destroy()
}
