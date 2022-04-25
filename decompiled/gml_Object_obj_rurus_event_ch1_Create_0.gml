image_speed = 0
boxfinished = 0
con = 0
if (room == room_cc_rurus1_ch1 || room == room_cc_rurus2_ch1)
{
    spike[0] = scr_dark_marker_ch1(80, 240, spr_spiketile_ch1)
    spike[1] = scr_dark_marker_ch1(80, 280, spr_spiketile_ch1)
    spike[2] = scr_dark_marker_ch1(920, 200, spr_spiketile_ch1)
    spike[3] = scr_dark_marker_ch1(920, 240, spr_spiketile_ch1)
    for (i = 0; i < 4; i += 1)
    {
        spike[i].depth = 900000
        spike[i].image_index = 1
    }
    if (room == room_cc_rurus1_ch1)
    {
        floorwall = instance_create_ch1(280, 240, obj_soliddark_ch1)
        floorwall.image_xscale = 2
    }
    if (room == room_cc_rurus2_ch1)
    {
        floorwall = instance_create_ch1(260, 240, obj_soliddark_ch1)
        floorwall.image_xscale = 3
    }
    if (room == room_cc_rurus1_ch1)
    {
        if (global.flag[217] == 1)
        {
            instance_create_ch1(280, 160, obj_npc_room_ch1)
            instance_destroy()
        }
        else
        {
            flashobj = scr_dark_marker_ch1(520, 260, spr_lightfairy_ch1)
            with (flashobj)
            {
                image_speed = 0.1
                depth = 90000
            }
        }
    }
    if (room == room_cc_rurus2_ch1)
    {
        if (global.flag[218] == 1)
        {
            instance_create_ch1(280, 160, obj_npc_room_ch1)
            instance_destroy()
        }
        else
        {
            flashobj = scr_dark_marker_ch1(520, 260, spr_lightfairy_ch1)
            with (flashobj)
            {
                image_speed = 0.1
                depth = 90000
            }
        }
    }
    visible = false
}
