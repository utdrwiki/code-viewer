scr_saveprocess_ut_ch1 = function() //gml_Script_scr_saveprocess_ut_ch1
{
    global.lastsavedkills = global.kills
    global.lastsavedtime = obj_time_ch1.time
    global.lastsavedlv = global.lv
    file = ("file" + string(global.filechoice))
    myfileid = file_text_open_write(file)
    file_text_write_string(myfileid, global.charname)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, global.lv)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, global.maxhp)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, global.maxen)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, global.at)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, global.wstrength)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, global.df)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, global.adef)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, global.sp)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, global.xp)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, global.gold)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, global.kills)
    file_text_writeln(myfileid)
    for (i = 0; i < 8; i += 1)
    {
        file_text_write_real(myfileid, global.item[i])
        file_text_writeln(myfileid)
        file_text_write_real(myfileid, global.phone[i])
        file_text_writeln(myfileid)
    }
    file_text_write_real(myfileid, global.weapon)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, global.armor)
    file_text_writeln(myfileid)
    for (i = 0; i < 512; i += 1)
    {
        file_text_write_real(myfileid, global.flag[i])
        file_text_writeln(myfileid)
    }
    file_text_write_real(myfileid, global.plot)
    file_text_writeln(myfileid)
    for (i = 0; i < 3; i += 1)
    {
        file_text_write_real(myfileid, global.menuchoice[i])
        file_text_writeln(myfileid)
    }
    file_text_write_real(myfileid, global.currentsong)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, global.currentroom)
    file_text_writeln(myfileid)
    file_text_write_real(myfileid, obj_time_ch1.time)
    file_text_close(myfileid)
    return;
}

