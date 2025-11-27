if (ossafe_file_exists("dr.ini"))
{
    ini_ex = 1;
    iniread = ossafe_ini_open("dr.ini");
    global.microphone = ini_read_real(scr_ini_chapter(global.chapter, global.filechoice), "Microphone", 0);
    global.right_click_mic = ini_read_real(scr_ini_chapter(global.chapter, global.filechoice), "right_click_mic", 0);
    global.mic_sensitivity = ini_read_real(scr_ini_chapter(global.chapter, global.filechoice), "Mic Sensitivity", 0.5);
    ossafe_ini_close();
    ossafe_savedata_save();
}
