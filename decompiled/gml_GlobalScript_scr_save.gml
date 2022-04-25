scr_save = function() //gml_Script_scr_save
{
    scr_saveprocess(global.filechoice)
    filechoicebk2 = global.filechoice
    global.filechoice = 9
    scr_saveprocess(9)
    global.filechoice = filechoicebk2
    iniwrite = ossafe_ini_open("dr.ini")
    ini_write_string(scr_ini_chapter(global.chapter, global.filechoice), "Name", global.truename)
    ini_write_real(scr_ini_chapter(global.chapter, global.filechoice), "Level", global.lv)
    ini_write_real(scr_ini_chapter(global.chapter, global.filechoice), "Love", global.llv)
    ini_write_real(scr_ini_chapter(global.chapter, global.filechoice), "Time", global.time)
    ini_write_real(scr_ini_chapter(global.chapter, global.filechoice), "Date", date_current_datetime())
    ini_write_real(scr_ini_chapter(global.chapter, global.filechoice), "Room", room)
    ini_write_real(scr_ini_chapter(global.chapter, global.filechoice), "InitLang", global.flag[912])
    var uraboss = 0
    if (global.chapter == 1)
    {
        if (global.flag[241] == 6)
            uraboss = 1
        else if (global.flag[241] == 7)
            uraboss = 2
    }
    if (global.chapter == 2)
    {
        if (global.flag[571] == 1)
            uraboss = 1
        else if (global.flag[571] == 2)
            uraboss = 2
    }
    ini_write_real(scr_ini_chapter(global.chapter, global.filechoice), "UraBoss", uraboss)
    ossafe_ini_close()
    ossafe_savedata_save()
    return;
}

