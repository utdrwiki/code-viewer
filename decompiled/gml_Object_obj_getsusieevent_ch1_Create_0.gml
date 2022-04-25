rcon = 0
block = noone
if (global.plot >= 38)
{
    doormarker = scr_dark_marker_ch1(400, 40, spr_drdoor_ch1)
    doormarker.depth = 600000
    doormarker.image_index = 1
    instance_create_ch1(380, 120, obj_soliddark_ch1)
    instance_create_ch1(500, 120, obj_soliddark_ch1)
    door = instance_create_ch1(440, 120, obj_doorA_ch1)
    door.image_xscale = 2
    door.image_yscale = 2
    instance_create_ch1(520, 260, obj_npc_sign_ch1)
    visible = false
    if (global.plot == 38)
        rcon = 1
    if (global.plot < 40)
    {
        hathy = instance_create_ch1(250, 240, obj_chaseenemy_ch1)
        hathy.radius = 30
    }
}
else
{
    doormarker = scr_dark_marker_ch1(400, 40, spr_drdoor_ch1)
    doormarker.depth = 600000
    block = instance_create_ch1(400, 120, obj_soliddark_ch1)
    block.image_xscale = 3
}
con = 1
if (global.plot >= 37)
{
    visible = false
    con = -1
}
walkcon = 0
image_speed = 0
