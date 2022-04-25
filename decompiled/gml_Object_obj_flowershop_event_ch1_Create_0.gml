tcon = 0
image_speed = 0.05
scr_depth_ch1()
if (room == room_flowershop_1f_ch1)
{
    counter = scr_marker_ch1(20, 103, spr_flowershop_counter_ch1)
    with (counter)
        scr_depth_ch1()
    flowera = scr_marker_ch1(177, 136, spr_flowershop_flowers_ch1)
    flowerb = scr_marker_ch1(177, 82, spr_flowershop_flowers_ch1)
    with (flowera)
        scr_depth_ch1()
    with (flowerb)
        scr_depth_ch1()
    con = 1
    if (global.flag[262] >= 1)
    {
        instance_create_ch1(x, (y + sprite_height), obj_npc_facing_ch1)
        visible = false
        if (global.flag[262] == 1)
            con = 50
        if (global.flag[262] >= 2)
            con = -1
    }
    if (global.flag[262] == 0)
        global.interact = 1
    image_speed = 0
}
if (room == room_flowershop_1f_ch1)
{
    if (global.entrance == 2)
    {
        global.interact = 0
        global.entrance = 0
        with (obj_mainchara_ch1)
            x = global.flag[264]
    }
}
if (room == room_flowershop_2f_ch1)
{
    visible = false
    if (global.entrance == 1)
    {
        global.entrance = 0
        global.interact = 0
        with (obj_mainchara_ch1)
            x = global.flag[264]
        if (obj_mainchara_ch1.x < 160)
            x = 255
        if (obj_mainchara_ch1.x > 160)
            x = 15
        instance_create_ch1(x, (y + sprite_height), obj_npc_facing_ch1)
        con = -1
    }
}
