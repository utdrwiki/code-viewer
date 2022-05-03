scr_save_ch1 = function() //gml_Script_scr_save_ch1
{
    var is_valid = scr_saveprocess_ch1(global.filechoice)
    if is_valid
    {
        filechoicebk2 = global.filechoice
        global.filechoice = 9
        is_valid = scr_saveprocess_ch1(9)
        global.filechoice = filechoicebk2
    }
    if is_valid
    {
        ossafe_ini_open_ch1("dr.ini")
        ini_write_string(("G" + string(global.filechoice)), "Name", global.truename)
        ini_write_real(("G" + string(global.filechoice)), "Level", global.lv)
        ini_write_real(("G" + string(global.filechoice)), "Love", global.llv)
        ini_write_real(("G" + string(global.filechoice)), "Time", global.time)
        ini_write_real(("G" + string(global.filechoice)), "Room", global.currentroom)
        ini_write_real(("G" + string(global.filechoice)), "InitLang", global.flag[912])
        var uraboss = 0
        if (global.flag[241] == 6)
            uraboss = 1
        else if (global.flag[241] == 7)
            uraboss = 2
        ini_write_real(("G" + string(global.filechoice)), "UraBoss", uraboss)
        ini_write_string(("G" + string(global.filechoice)), "Version", global.version)
        ossafe_ini_close_ch1()
        ossafe_savedata_save_ch1()
    }
    return is_valid;
}

