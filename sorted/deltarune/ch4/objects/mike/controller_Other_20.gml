ossafe_ini_open("dr.ini");
ini_write_real(scr_ini_chapter(global.chapter, global.filechoice), "Microphone", global.microphone);
ini_write_real(scr_ini_chapter(global.chapter, global.filechoice), "right_click_mic", global.right_click_mic);
ini_write_real(scr_ini_chapter(global.chapter, global.filechoice), "Mic Sensitivity", global.mic_sensitivity);
ossafe_ini_close();
ossafe_savedata_save();
