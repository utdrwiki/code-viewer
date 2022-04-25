myinteract = 0
talked = false
image_speed = 0.2
depthcancel = false
if (global.darkzone == true)
{
    image_xscale = 2
    image_yscale = 2
}
if (room == room_dark1_ch1)
{
    sprite_index = spr_shine_ch1
    if (global.time > 14400 || global.flag[10] == 1)
        instance_destroy()
}
if (room == room_town_mid_ch1)
{
    if (x >= 320)
        sprite_index = spr_npc_icemascot_fake_ch1
    else
        sprite_index = spr_npc_icemascot2_ch1
}
if (room == room_diner_ch1)
{
    sprite_index = spr_npc_greenfire_ch1
    depth = 4000
    depthcancel = true
}
if (room == room_cc_clover_ch1)
    sprite_index = spr_cc_boombox_ch1
if (room == room_cc_6f_ch1)
    sprite_index = spr_smallchecker_front_ch1
if (room == room_cc_throneroom_ch1)
{
    if (global.plot < 240)
        instance_destroy()
    sprite_index = spr_smallchecker_front_ch1
}
if (room == room_field_maze_ch1)
{
    sprite_index = spr_jigsawry_clobbered_ch1
    if (global.plot >= 150)
        instance_destroy()
}
if (room == room_forest_savepoint_relax_ch1)
{
    image_speed = 0.1
    sprite_index = spr_diamond_fan_ch1
}
if (depthcancel == false)
    scr_depth_ch1()
