scr_84_load_ini_ch1 = function() //gml_Script_scr_84_load_ini_ch1
{
    for (i = 0; i < 3; i += 1)
        FILE[i] = 0
    for (i = 0; i < 3; i += 1)
    {
        FILE[i] = 0
        NAME[i] = scr_84_get_lang_string_ch1("DEVICE_MENU_slash_Create_0_gml_97_0")
        TIME[i] = 0
        PLACE[i] = "------------"
        LEVEL[i] = 0
        TIME_STRING[i] = "--:--"
        INITLANG[i] = 0
    }
    if ossafe_file_exists_ch1("filech1_0")
    {
        FILE[0] = 1
        NAME[0] = scr_84_get_lang_string_ch1("DEVICE_MENU_slash_Create_0_gml_107_0")
    }
    if ossafe_file_exists_ch1("filech1_1")
    {
        FILE[1] = 1
        NAME[1] = scr_84_get_lang_string_ch1("DEVICE_MENU_slash_Create_0_gml_112_0")
    }
    if ossafe_file_exists_ch1("filech1_2")
    {
        FILE[2] = 1
        NAME[2] = scr_84_get_lang_string_ch1("DEVICE_MENU_slash_Create_0_gml_117_0")
    }
    if ossafe_file_exists_ch1("dr.ini")
    {
        ossafe_ini_open_ch1("dr.ini")
        for (i = 0; i < 3; i += 1)
        {
            if (FILE[i] == 1)
            {
                var room_index = ini_read_real(("G" + string(i)), "Room", 0)
                var room_offset = room_index
                if (room_index < ROOM_INITIALIZE_ch1)
                    room_offset = (ROOM_INITIALIZE_ch1 + room_index)
                PLACE[i] = scr_roomname_ch1(room_offset)
                TIME[i] = ini_read_real(("G" + string(i)), "Time", 0)
                NAME[i] = ini_read_string(("G" + string(i)), "Name", "------")
                LEVEL[i] = 1
                INITLANG[i] = ini_read_real(("G" + string(i)), "InitLang", 0)
                TIME_SECONDS_TOTAL[i] = floor((TIME[i] / 30))
                TIME_MINUTES[i] = floor((TIME_SECONDS_TOTAL[i] / 60))
                TIME_SECONDS[i] = (TIME_SECONDS_TOTAL[i] - (TIME_MINUTES[i] * 60))
                TIME_SECONDS_STRING[i] = string(TIME_SECONDS[i])
                if (TIME_SECONDS[i] == 0)
                    TIME_SECONDS_STRING[i] = "00"
                if (TIME_SECONDS[i] < 10 && TIME_SECONDS[i] >= 1)
                    TIME_SECONDS_STRING[i] = ("0" + string(TIME_SECONDS[i]))
                TIME_STRING[i] = ((string(TIME_MINUTES[i]) + ":") + TIME_SECONDS_STRING[i])
            }
        }
        ossafe_ini_close_ch1()
        ossafe_savedata_save_ch1()
    }
    return;
}

