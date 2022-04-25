if (room == room_cc_4f_ch1)
{
    if (global.flag[245] == 0)
    {
        bluhtotal = 0
        with (obj_bluhpainting_ch1)
        {
            if (bluh == 1)
                obj_cc_event_ch1.bluhtotal += 1
        }
        if (bluhtotal >= 3)
        {
            snd_play_ch1(snd_splat_ch1)
            chest = instance_create_ch1(480, 980, obj_treasure_room_ch1)
            global.flag[245] = 1
        }
    }
}
