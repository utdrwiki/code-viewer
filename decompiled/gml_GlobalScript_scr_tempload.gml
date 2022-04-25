scr_tempload = function() //gml_Script_scr_tempload
{
    filechoicebk3 = global.filechoice
    global.filechoice = 9
    scr_load()
    global.filechoice = filechoicebk3
    return;
}

